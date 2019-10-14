From: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] iommu/mediatek: Use writel for TLB range
	invalidation
Date: Mon, 14 Oct 2019 22:11:14 +0100
Message-ID: <20191014211113.jq5qwe5pfonyocr3@willie-the-truck>
References: <1570627143-29441-1-git-send-email-yong.wu@mediatek.com>
	<1570627143-29441-3-git-send-email-yong.wu@mediatek.com>
	<20191011162950.yg4o77mlaicacne5@willie-the-truck>
	<1570861427.19130.65.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1570861427.19130.65.camel@mhfsdcap03>
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
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, Oct 12, 2019 at 02:23:47PM +0800, Yong Wu wrote:
> On Fri, 2019-10-11 at 17:29 +0100, Will Deacon wrote:
> > On Wed, Oct 09, 2019 at 09:19:02PM +0800, Yong Wu wrote:
> > > Use writel for the register F_MMU_INV_RANGE which is for triggering the
> > > HW work. We expect all the setting(iova_start/iova_end...) have already
> > > been finished before F_MMU_INV_RANGE.
> > > 
> > > Signed-off-by: Anan.Sun <anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > > This is a improvement rather than fixing a issue.
> > > ---
> > >  drivers/iommu/mtk_iommu.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > > index 24a13a6..607f92c 100644
> > > --- a/drivers/iommu/mtk_iommu.c
> > > +++ b/drivers/iommu/mtk_iommu.c
> > > @@ -187,8 +187,7 @@ static void mtk_iommu_tlb_add_flush(unsigned long iova, size_t size,
> > >  		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
> > >  		writel_relaxed(iova + size - 1,
> > >  			       data->base + REG_MMU_INVLD_END_A);
> > > -		writel_relaxed(F_MMU_INV_RANGE,
> > > -			       data->base + REG_MMU_INVALIDATE);
> > > +		writel(F_MMU_INV_RANGE, data->base + REG_MMU_INVALIDATE);
> > 
> > I don't understand this change.
> > 
> > Why is it an "improvement" and which accesses are you ordering with the
> > writel?
> 
> The register(F_MMU_INV_RANGE) will trigger HW to begin flush range. HW
> expect the other register iova_start/end/flush_type always is ready
> before trigger. thus I'd like use writel to guarantee the previous
> register has been finished.

Given that these are all MMIO writes to the same device, then
writel_relaxed() should give you the ordering you need. If you look at
memory_barriers.txt, it says:

  | they [readX_relaxed() and writeX_relaxed()] are still guaranteed to
  | be ordered with respect to other accesses from the same CPU thread
  | to the same peripheral when operating on __iomem pointers mapped
  | with the default I/O attributes.

> I didn't see the writel_relaxed cause some error in practice, we only
> think writel is necessary here in theory. so call it "improvement".

Ok, but I don't think it's needed in this case.

Will
