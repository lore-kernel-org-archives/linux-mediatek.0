From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [SPAM]Re: [PATCH] net: mediatek: use dma_zalloc_coherent instead
 of allocator/memset
Date: Fri, 20 Jul 2018 10:25:55 +0100
Message-ID: <20180720092555.GA28941@n2100.armlinux.org.uk>
References: <20180719140955.19444-1-yuehaibing@huawei.com>
 <20180719141723.GM17271@n2100.armlinux.org.uk>
 <1532019744.8953.248.camel@mtkswgap22>
 <9a4cdfc6-7487-5908-b584-f3bf6158c4d4@huawei.com>
 <1532069663.8953.259.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1532069663.8953.259.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: nbd@openwrt.org, nelson.chang@mediatek.com, netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jul 20, 2018 at 02:54:23PM +0800, Sean Wang wrote:
> On Fri, 2018-07-20 at 14:30 +0800, YueHaibing wrote:
> > On 2018/7/20 1:02, Sean Wang wrote:
> > > On Thu, 2018-07-19 at 15:17 +0100, Russell King - ARM Linux wrote:
> > >> On Thu, Jul 19, 2018 at 10:09:55PM +0800, YueHaibing wrote:
> > >>> Use dma_zalloc_coherent instead of dma_alloc_coherent
> > >>> followed by memset 0.
> > >>>
> > >>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > >>> ---
> > >>>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 ++-----
> > >>>  1 file changed, 2 insertions(+), 5 deletions(-)
> > >>>
> > >>> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > >>> index d8ebf0a..fbdb3e3 100644
> > >>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > >>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > >>> @@ -1221,14 +1221,11 @@ static int mtk_tx_alloc(struct mtk_eth *eth)
> > >>>  	if (!ring->buf)
> > >>>  		goto no_tx_mem;
> > >>>  
> > >>> -	ring->dma = dma_alloc_coherent(eth->dev,
> > >>> -					  MTK_DMA_SIZE * sz,
> > >>> -					  &ring->phys,
> > >>> -					  GFP_ATOMIC | __GFP_ZERO);
> > >>> +	ring->dma = dma_zalloc_coherent(eth->dev, MTK_DMA_SIZE * sz,
> > >>> +					&ring->phys, GFP_ATOMIC | __GFP_ZERO);
> > >>>  	if (!ring->dma)
> > >>>  		goto no_tx_mem;
> > >>>  
> > >>> -	memset(ring->dma, 0, MTK_DMA_SIZE * sz);
> > >>
> > >> I have to wonder whether this code needs two forms of zeroing... in
> > >> the original code, __GFP_ZERO _and_ a call to memset() just in case
> > >> __GFP_ZERO failed to do its job, and in the replacement code, just
> > >> in case dma_zalloc_coherent() hasn't got the idea...
> > >>
> > >> I think you can drop the __GFP_ZERO. ;)
> > >>
> > > 
> > > Just now I did an experiment on 4.14.56 on armv7. I found that
> > > dma_zalloc_coherent does not guarantee that the buffer we get
> > > is all filled with 0.
> > > 
> > > 
> > > I really think it's a little bit weird OR what was I missing something
> > > for enabling dma_zalloc_coherent ? The result seems to tell that we
> > > can't remove freely the memset with 0 at this moment until we get a
> > > cause.
> > > 
> > 
> > That means dma_zalloc_coherent doesn't work as expect on armv7?
> > 
> 
> I'm not sure if it's true for every armv7. or it's only happening on my
> device.
> 
> anyway, i think we can replace all occurrences in the driver for
> dma_alloc_coherent with __GFP_ZERO by dma_zalloc_coherent, and but
> keep the extra memset as is.

No, a bug in the allocator has been found that needs fixing.  The
right solution is to fix the allocator and remove what should be
unnecessary memset()s.

This should have been reported when the __GFP_ZERO flag was not
being honoured and memset() was initially found to be required -
all that dma_zalloc_coherent() does is set the __GFP_ZERO flag
before calling dma_alloc_coherent().

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 13.8Mbps down 630kbps up
According to speedtest.net: 13Mbps down 490kbps up
