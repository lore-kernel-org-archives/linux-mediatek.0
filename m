From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [SPAM]Re: [PATCH] net: mediatek: use dma_zalloc_coherent instead
 of allocator/memset
Date: Fri, 20 Jul 2018 09:13:34 +0100
Message-ID: <20180720081334.GO17271@n2100.armlinux.org.uk>
References: <20180719140955.19444-1-yuehaibing@huawei.com>
 <20180719141723.GM17271@n2100.armlinux.org.uk>
 <1532019744.8953.248.camel@mtkswgap22>
 <9a4cdfc6-7487-5908-b584-f3bf6158c4d4@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9a4cdfc6-7487-5908-b584-f3bf6158c4d4-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, nelson.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jul 20, 2018 at 02:30:53PM +0800, YueHaibing wrote:
> On 2018/7/20 1:02, Sean Wang wrote:
> > On Thu, 2018-07-19 at 15:17 +0100, Russell King - ARM Linux wrote:
> >> On Thu, Jul 19, 2018 at 10:09:55PM +0800, YueHaibing wrote:
> >>> Use dma_zalloc_coherent instead of dma_alloc_coherent
> >>> followed by memset 0.
> >>>
> >>> Signed-off-by: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> >>> ---
> >>>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 ++-----
> >>>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> >>> index d8ebf0a..fbdb3e3 100644
> >>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> >>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> >>> @@ -1221,14 +1221,11 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
> >>>  	if (!ring->buf)
> >>>  		goto no_tx_mem;
> >>>  
> >>> -	ring->dma = dma_alloc_coherent(eth->dev,
> >>> -					  MTK_DMA_SIZE * sz,
> >>> -					  &ring->phys,
> >>> -					  GFP_ATOMIC | __GFP_ZERO);
> >>> +	ring->dma = dma_zalloc_coherent(eth->dev, MTK_DMA_SIZE * sz,
> >>> +					&ring->phys, GFP_ATOMIC | __GFP_ZERO);
> >>>  	if (!ring->dma)
> >>>  		goto no_tx_mem;
> >>>  
> >>> -	memset(ring->dma, 0, MTK_DMA_SIZE * sz);
> >>
> >> I have to wonder whether this code needs two forms of zeroing... in
> >> the original code, __GFP_ZERO _and_ a call to memset() just in case
> >> __GFP_ZERO failed to do its job, and in the replacement code, just
> >> in case dma_zalloc_coherent() hasn't got the idea...
> >>
> >> I think you can drop the __GFP_ZERO. ;)
> >>
> > 
> > Just now I did an experiment on 4.14.56 on armv7. I found that
> > dma_zalloc_coherent does not guarantee that the buffer we get
> > is all filled with 0.
> > 
> > 
> > I really think it's a little bit weird OR what was I missing something
> > for enabling dma_zalloc_coherent ? The result seems to tell that we
> > can't remove freely the memset with 0 at this moment until we get a
> > cause.
> > 
> 
> That means dma_zalloc_coherent doesn't work as expect on armv7?

Can someone work out which underlying allocator is being used - the
possibilities are:

- dma_alloc_from_dev_coherent
- cma
- simple
- remap
- pool

Looking at the code, I'd guess it's the pool allocator, as I don't see
anything which zeros memory there, and it doesn't honor the __GFP_ZERO
flag.  This is definitely an allocator bug.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 13.8Mbps down 630kbps up
According to speedtest.net: 13Mbps down 490kbps up
