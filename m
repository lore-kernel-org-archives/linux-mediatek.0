From: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2 3/4] iommu/mediatek: Use writel for TLB range
 invalidation
Date: Tue, 15 Oct 2019 09:51:36 +0800
Message-ID: <1571104296.19130.67.camel@mhfsdcap03>
References: <1570627143-29441-1-git-send-email-yong.wu@mediatek.com>
         <1570627143-29441-3-git-send-email-yong.wu@mediatek.com>
         <20191011162950.yg4o77mlaicacne5@willie-the-truck>
         <1570861427.19130.65.camel@mhfsdcap03>
         <20191014211113.jq5qwe5pfonyocr3@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014211113.jq5qwe5pfonyocr3@willie-the-truck>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>, Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, cui.zhang@mediatek.com, chao.hao@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-10-14 at 22:11 +0100, Will Deacon wrote:
> On Sat, Oct 12, 2019 at 02:23:47PM +0800, Yong Wu wrote:
> > On Fri, 2019-10-11 at 17:29 +0100, Will Deacon wrote:
> > > On Wed, Oct 09, 2019 at 09:19:02PM +0800, Yong Wu wrote:
> > > > Use writel for the register F_MMU_INV_RANGE which is for triggering the
> > > > HW work. We expect all the setting(iova_start/iova_end...) have already
> > > > been finished before F_MMU_INV_RANGE.
> > > > 
> > > > Signed-off-by: Anan.Sun <anan.sun@mediatek.com>
> > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > ---
> > > > This is a improvement rather than fixing a issue.
> > > > ---
> > > >  drivers/iommu/mtk_iommu.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > > > index 24a13a6..607f92c 100644
> > > > --- a/drivers/iommu/mtk_iommu.c
> > > > +++ b/drivers/iommu/mtk_iommu.c
> > > > @@ -187,8 +187,7 @@ static void mtk_iommu_tlb_add_flush(unsigned long iova, size_t size,
> > > >  		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
> > > >  		writel_relaxed(iova + size - 1,
> > > >  			       data->base + REG_MMU_INVLD_END_A);
> > > > -		writel_relaxed(F_MMU_INV_RANGE,
> > > > -			       data->base + REG_MMU_INVALIDATE);
> > > > +		writel(F_MMU_INV_RANGE, data->base + REG_MMU_INVALIDATE);
> > > 
> > > I don't understand this change.
> > > 
> > > Why is it an "improvement" and which accesses are you ordering with the
> > > writel?
> > 
> > The register(F_MMU_INV_RANGE) will trigger HW to begin flush range. HW
> > expect the other register iova_start/end/flush_type always is ready
> > before trigger. thus I'd like use writel to guarantee the previous
> > register has been finished.
> 
> Given that these are all MMIO writes to the same device, then
> writel_relaxed() should give you the ordering you need. If you look at
> memory_barriers.txt, it says:
> 
>   | they [readX_relaxed() and writeX_relaxed()] are still guaranteed to
>   | be ordered with respect to other accesses from the same CPU thread
>   | to the same peripheral when operating on __iomem pointers mapped
>   | with the default I/O attributes.

Thanks for this info. See it now. then I will delete this patch in next
version.

> 
> > I didn't see the writel_relaxed cause some error in practice, we only
> > think writel is necessary here in theory. so call it "improvement".
> 
> Ok, but I don't think it's needed in this case.
> 
> Will
