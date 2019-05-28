From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [v3, PATCH] net: stmmac: add support for hash table size 128/256
 in dwmac4
Date: Tue, 28 May 2019 18:40:19 +0200
Message-ID: <20190528164019.GR18059@lunn.ch>
References: <1558926867-16472-1-git-send-email-biao.huang@mediatek.com>
 <1558926867-16472-2-git-send-email-biao.huang@mediatek.com>
 <20190527.100800.1719164073038257292.davem@davemloft.net>
 <1559008369.24897.66.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559008369.24897.66.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: biao huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, jianguo.zhang@mediatek.com, alexandre.torgue@st.com, boon.leong.ong@intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, yt.shen@mediatek.com, joabreu@synopsys.com, linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, May 28, 2019 at 09:52:49AM +0800, biao huang wrote:
> Dear David,
> 
> On Mon, 2019-05-27 at 10:08 -0700, David Miller wrote:
> > From: Biao Huang <biao.huang@mediatek.com>
> > Date: Mon, 27 May 2019 11:14:27 +0800
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > index 5e98da4..029a3db 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> > > @@ -403,41 +403,50 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
> > >  			      struct net_device *dev)
> > >  {
> > >  	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> > > -	unsigned int value = 0;
> > > +	unsigned int value;
> > > +	int numhashregs = (hw->multicast_filter_bins >> 5);
> > > +	int mcbitslog2 = hw->mcast_bits_log2;
> > > +	int i;
> > 
> > Please retain the reverse christmas tree ordering here.
> I'm a little confused about the reverse xmas tree ordering.
> 
> should I reorder them only according to the total length like this:
> 
> 	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> 	int numhashregs = (hw->multicast_filter_bins >> 5);
> 	int mcbitslog2 = hw->mcast_bits_log2;
> 	unsigned int value;
> 	int i;

Yes.
	Andrew
