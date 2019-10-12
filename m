From: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2 3/4] iommu/mediatek: Use writel for TLB range
 invalidation
Date: Sat, 12 Oct 2019 14:23:47 +0800
Message-ID: <1570861427.19130.65.camel@mhfsdcap03>
References: <1570627143-29441-1-git-send-email-yong.wu@mediatek.com>
 <1570627143-29441-3-git-send-email-yong.wu@mediatek.com>
 <20191011162950.yg4o77mlaicacne5@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191011162950.yg4o77mlaicacne5@willie-the-truck>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will@kernel.org>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-10-11 at 17:29 +0100, Will Deacon wrote:
> On Wed, Oct 09, 2019 at 09:19:02PM +0800, Yong Wu wrote:
> > Use writel for the register F_MMU_INV_RANGE which is for triggering the
> > HW work. We expect all the setting(iova_start/iova_end...) have already
> > been finished before F_MMU_INV_RANGE.
> > 
> > Signed-off-by: Anan.Sun <anan.sun@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> > This is a improvement rather than fixing a issue.
> > ---
> >  drivers/iommu/mtk_iommu.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 24a13a6..607f92c 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -187,8 +187,7 @@ static void mtk_iommu_tlb_add_flush(unsigned long iova, size_t size,
> >  		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
> >  		writel_relaxed(iova + size - 1,
> >  			       data->base + REG_MMU_INVLD_END_A);
> > -		writel_relaxed(F_MMU_INV_RANGE,
> > -			       data->base + REG_MMU_INVALIDATE);
> > +		writel(F_MMU_INV_RANGE, data->base + REG_MMU_INVALIDATE);
> 
> I don't understand this change.
> 
> Why is it an "improvement" and which accesses are you ordering with the
> writel?

The register(F_MMU_INV_RANGE) will trigger HW to begin flush range. HW
expect the other register iova_start/end/flush_type always is ready
before trigger. thus I'd like use writel to guarantee the previous
register has been finished.

I didn't see the writel_relaxed cause some error in practice, we only
think writel is necessary here in theory. so call it "improvement".

> 
> Will
