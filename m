From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] iommu/mediatek: Move the tlb_sync into tlb_flush
Date: Wed, 9 Oct 2019 16:56:50 +0900
Message-ID: <CAAFQd5C3U7pZo4SSUJ52Q7E+0FaUoORQFbQC5RhCHBhi=NFYTw@mail.gmail.com>
References: <1569822142-14303-1-git-send-email-yong.wu@mediatek.com>
	<CAAFQd5C+FM3n-Ww4C+qDD1QZOGZrqEYw4EvYECfadGcDH0fmew@mail.gmail.com>
	<1570522162.19130.38.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <1570522162.19130.38.camel@mhfsdcap03>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
	Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
	Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Oct 8, 2019 at 5:09 PM Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Hi Tomasz,
>
> Sorry for reply late.
>
> On Wed, 2019-10-02 at 14:18 +0900, Tomasz Figa wrote:
> > Hi Yong,
> >
> > On Mon, Sep 30, 2019 at 2:42 PM Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > >
> > > The commit 4d689b619445 ("iommu/io-pgtable-arm-v7s: Convert to IOMMU API
> > > TLB sync") help move the tlb_sync of unmap from v7s into the iommu
> > > framework. It helps add a new function "mtk_iommu_iotlb_sync", But it
> > > lacked the dom->pgtlock, then it will cause the variable
> > > "tlb_flush_active" may be changed unexpectedly, we could see this warning
> > > log randomly:
> > >
> >
> > Thanks for the patch! Please see my comments inline.
> >
> > > mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to
> > > full flush
> > >
> > > To fix this issue, we can add dom->pgtlock in the "mtk_iommu_iotlb_sync".
> > > And when checking this issue, we find that __arm_v7s_unmap call
> > > io_pgtable_tlb_add_flush consecutively when it is supersection/largepage,
> > > this also is potential unsafe for us. There is no tlb flush queue in the
> > > MediaTek M4U HW. The HW always expect the tlb_flush/tlb_sync one by one.
> > > If v7s don't always gurarantee the sequence, Thus, In this patch I move
> > > the tlb_sync into tlb_flush(also rename the function deleting "_nosync").
> > > and we don't care if it is leaf, rearrange the callback functions. Also,
> > > the tlb flush/sync was already finished in v7s, then iotlb_sync and
> > > iotlb_sync_all is unnecessary.
> >
> > Performance-wise, we could do much better. Instead of synchronously
> > syncing at the end of mtk_iommu_tlb_add_flush(), we could sync at the
> > beginning, if there was any previous flush still pending. We would
> > also have to keep the .iotlb_sync() callback, to take care of waiting
> > for the last flush. That would allow better pipelining with CPU in
> > cases like this:
> >
> > for (all pages in range) {
> >    change page table();
> >    flush();
> > }
> >
> > "change page table()" could execute while the IOMMU is flushing the
> > previous change.
>
> Do you mean adding a new tlb_sync before tlb_flush_no_sync, like below:
>
> mtk_iommu_tlb_add_flush_nosync {
>    + mtk_iommu_tlb_sync();
>    tlb_flush_no_sync();
>    data->tlb_flush_active = true;
> }
>
> mtk_iommu_tlb_sync {
>         if (!data->tlb_flush_active)
>                 return;
>         tlb_sync();
>         data->tlb_flush_active = false;
> }
>
> This way look improve the flow, But adjusting the flow is not the root
> cause of this issue. the problem is "data->tlb_flush_active" may be
> changed from mtk_iommu_iotlb_sync which don't have a dom->pglock.

That was not the only problem with existing code. Existing code also
assumed that add_flush and sync always go in pairs, but that's not
true.

My suggestion is to fix the locking in the driver and keep the sync
deferred as much as possible, so that performance is not degraded. I
changed my mind, though. I think we would need to make more changes to
the driver to make it implement the flushing efficiently, so let's go
with the current simple approach for now and improve incrementally.

>
> Currently the synchronisation of the tlb_flush/tlb_sync flow are
> controlled by the variable "data->tlb_flush_active".
>
> In this patch putting the tlb_flush/tlb_sync together looks make
> the flow simpler:
> a) Don't need the sensitive variable "tlb_flush_active".
> b) Remove mtk_iommu_iotlb_sync, Don't need add lock in it.
> c) Simplify the tlb_flush_walk/tlb_flush_leaf.
> is it ok?
>

Okay, let's do so as a first step to fix the issue. Then we can
optimize in follow up patches.

> >
> > >
> > > Besides, there are two minor changes:
> > > a) Use writel for the register F_MMU_INV_RANGE which is for triggering the
> > > HW work. We expect all the setting(iova_start/iova_end...) have already
> > > been finished before F_MMU_INV_RANGE.
> > > b) Reduce the tlb timeout value from 100000us to 1000us. the original value
> > > is so long that affect the multimedia performance.
> >
> > By definition, timeout is something that should not normally happen.
> > Too long timeout affecting multimedia performance would suggest that
> > the timeout was actually happening, which is the core problem, not the
> > length of the timeout. Could you provide more details on this?
>
> As description above, this issue is because there is no dom->pgtlock in
> the mtk_iommu_iotlb_sync. I have tried that the issue will disappear
> after adding lock in it.
>
> Although the issue is fixed after this patch, I still would like to
> reduce the timeout value for somehow error happen in the future. 100ms
> is unnecessary for us. It looks a minor improvement rather than fixing
> the issue. I will use a new patch for it.
>

Okay, makes sense.

Best regards,
Tomasz
