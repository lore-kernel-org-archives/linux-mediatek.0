From: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH] iommu/mediatek: Move the tlb_sync into tlb_flush
Date: Tue, 8 Oct 2019 16:09:28 +0800
Message-ID: <1570522168.19130.39.camel@mhfsdcap03>
References: <1569822142-14303-1-git-send-email-yong.wu@mediatek.com>
         <CAAFQd5C+FM3n-Ww4C+qDD1QZOGZrqEYw4EvYECfadGcDH0fmew@mail.gmail.com>
         <366b0bda-d874-9109-5c83-ff27301f3486@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <366b0bda-d874-9109-5c83-ff27301f3486@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Tomasz Figa <tfiga@chromium.org>, youlin.pei@mediatek.com, anan.sun@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com, srv_heupstream <srv_heupstream@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com, "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-10-02 at 11:35 +0100, Robin Murphy wrote:
> On 02/10/2019 06:18, Tomasz Figa wrote:
> > Hi Yong,
> > 
> > On Mon, Sep 30, 2019 at 2:42 PM Yong Wu <yong.wu@mediatek.com> wrote:
> >>
> >> The commit 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API
> >> TLB sync") help move the tlb_sync of unmap from v7s into the iommu
> >> framework. It helps add a new function "mtk_iommu_iotlb_sync", But it
> >> lacked the dom->pgtlock, then it will cause the variable
> >> "tlb_flush_active" may be changed unexpectedly, we could see this warning
> >> log randomly:
> >>
> > 
> > Thanks for the patch! Please see my comments inline.
> > 
> >> mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to
> >> full flush
> >>
> >> To fix this issue, we can add dom->pgtlock in the "mtk_iommu_iotlb_sync".
> >> And when checking this issue, we find that __arm_v7s_unmap call
> >> io_pgtable_tlb_add_flush consecutively when it is supersection/largepage,
> >> this also is potential unsafe for us. There is no tlb flush queue in the
> >> MediaTek M4U HW. The HW always expect the tlb_flush/tlb_sync one by one.
> >> If v7s don't always gurarantee the sequence, Thus, In this patch I move
> >> the tlb_sync into tlb_flush(also rename the function deleting "_nosync").
> >> and we don't care if it is leaf, rearrange the callback functions. Also,
> >> the tlb flush/sync was already finished in v7s, then iotlb_sync and
> >> iotlb_sync_all is unnecessary.
> > 
> > Performance-wise, we could do much better. Instead of synchronously
> > syncing at the end of mtk_iommu_tlb_add_flush(), we could sync at the
> > beginning, if there was any previous flush still pending. We would
> > also have to keep the .iotlb_sync() callback, to take care of waiting
> > for the last flush. That would allow better pipelining with CPU in
> > cases like this:
> > 
> > for (all pages in range) {
> >     change page table();
> >     flush();
> > }
> > 
> > "change page table()" could execute while the IOMMU is flushing the
> > previous change.
> 
> FWIW, given that the underlying invalidation mechanism is range-based, 
> this driver would be an ideal candidate for making use of the new 
> iommu_gather mechanism. As a fix for stable, though, simply ensuring 
> that add_flush syncs any pending invalidation before issuing a new one 
> sounds like a good idea (and probably a simpler patch too).

Thanks very much for the confirmation.

> 
> [...]
> >> @@ -574,8 +539,7 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
> >>          .detach_dev     = mtk_iommu_detach_device,
> >>          .map            = mtk_iommu_map,
> >>          .unmap          = mtk_iommu_unmap,
> >> -       .flush_iotlb_all = mtk_iommu_flush_iotlb_all,
> > 
> > Don't we still want .flush_iotlb_all()? I think it should be more
> > efficient in some cases than doing a big number of single flushes.
> > (That said, the previous implementation didn't do any flush at all. It
> > just waited for previously queued flushes to happen. Was that
> > expected?)
> 
> Commit 07fdef34d2be ("iommu/arm-smmu-v3: Implement flush_iotlb_all 
> hook") has an explanation of what the deal was there - similarly, it's 
> probably worth this driver implementing it properly as well now (but 
> that's really a separate patch).

Thanks the hint, At the beginning, I noticed that we don't have
DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE, thus I thought flush_iotlb_all is
unnecessary.

After grep, iommu_flush_tlb_all also is called in the x_direct_mapping,
then we still need this.

If putting it in a new patch(switch flush_iotlb_all to
mtk_iommu_tlb_flush_all), then the Fixes tag(commit id: 4d689b619445) is
needed?

> 
> Robin.
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
