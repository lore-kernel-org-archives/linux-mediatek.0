From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/7] iommu/mediatek: Delete the leaf in the tlb flush
Date: Tue, 15 Oct 2019 13:25:18 +0800
Message-ID: <1571117118.19130.81.camel@mhfsdcap03>
References: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
	<1571035101-4213-5-git-send-email-yong.wu@mediatek.com>
	<20c74c20-864e-88af-3c58-ad3bb7600bcc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20c74c20-864e-88af-3c58-ad3bb7600bcc-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, cui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, edison.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, chao.hao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-10-14 at 15:22 +0100, Robin Murphy wrote:
> On 14/10/2019 07:38, Yong Wu wrote:
> > In our tlb range flush, we don't care the "leaf". Remove it to simplify
> > the code. no functional change.
> 
> Presumably you don't care about the granule either?

Yes. I only keep "granule" to satisfy the format of "tlb_flush_walk",
then it's no need add a new helper function.

> 
> Robin.
> 
> > Signed-off-by: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   drivers/iommu/mtk_iommu.c | 16 ++++------------
> >   1 file changed, 4 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 8712afc..19f936c 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -174,8 +174,7 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
> >   }
> >   
> >   static void mtk_iommu_tlb_add_flush_nosync(unsigned long iova, size_t size,
> > -					   size_t granule, bool leaf,
> > -					   void *cookie)
> > +					   size_t granule, void *cookie)
> >   {
> >   	struct mtk_iommu_data *data = cookie;
> >   
> > @@ -219,14 +218,7 @@ static void mtk_iommu_tlb_sync(void *cookie)
> >   static void mtk_iommu_tlb_flush_walk(unsigned long iova, size_t size,
> >   				     size_t granule, void *cookie)
> >   {
> > -	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, false, cookie);
> > -	mtk_iommu_tlb_sync(cookie);
> > -}
> > -
> > -static void mtk_iommu_tlb_flush_leaf(unsigned long iova, size_t size,
> > -				     size_t granule, void *cookie)
> > -{
> > -	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, true, cookie);
> > +	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, cookie);
> >   	mtk_iommu_tlb_sync(cookie);
> >   }
> >   
> > @@ -245,7 +237,7 @@ static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
> >   static const struct iommu_flush_ops mtk_iommu_flush_ops = {
> >   	.tlb_flush_all = mtk_iommu_tlb_flush_all,
> >   	.tlb_flush_walk = mtk_iommu_tlb_flush_walk,
> > -	.tlb_flush_leaf = mtk_iommu_tlb_flush_leaf,
> > +	.tlb_flush_leaf = mtk_iommu_tlb_flush_walk,
> >   	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
> >   };
> >   
> > @@ -475,7 +467,7 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
> >   		spin_lock_irqsave(&dom->pgtlock, flags);
> >   
> >   	mtk_iommu_tlb_add_flush_nosync(gather->start, length, gather->pgsize,
> > -				       false, data);
> > +				       data);
> >   	mtk_iommu_tlb_sync(data);
> >   
> >   	if (!is_in_gather)
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
