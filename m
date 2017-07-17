From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 2/4] net-next: mediatek: add platform data to
 adapt into various hardware
Date: Mon, 17 Jul 2017 15:44:01 +0200
Message-ID: <20170717134401.GC30392@lunn.ch>
References: <cover.1500285278.git.sean.wang@mediatek.com>
 <2987b7e3b40cfcd143b5da444c6722b5e92bc0b5.1500285278.git.sean.wang@mediatek.com>
 <20170717134309.GB30392@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170717134309.GB30392@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: john@phrozen.org, davem@davemloft.net, nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Jul 17, 2017 at 03:43:09PM +0200, Andrew Lunn wrote:
> >  const struct of_device_id of_mtk_match[] = {
> > -	{ .compatible = "mediatek,mt2701-eth" },
> > +	{ .compatible = "mediatek,mt2701-eth", .data = &mt2701_data},
> > +	{ .compatible = "mediatek,mt7623-eth", .data = &mt7623_data},
> >  	{},
> 
> Hi Sean
> 
> The binding document also lists "mediatek,mt7622-eth"?

Doh! The next patch adds it. Sorry for the noise.

     Andrew
