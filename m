From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/6] net: stmmac: add mdio clause 45 access from mac
 device for dwmac4
Date: Mon, 29 Apr 2019 15:23:27 +0200
Message-ID: <20190429132327.GF10772@lunn.ch>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-6-git-send-email-biao.huang@mediatek.com>
 <20190428163705.GH23059@lunn.ch>
 <1556517925.24897.17.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556517925.24897.17.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: biao huang <biao.huang@mediatek.com>
Cc: Jose Abreu <joabreu@synopsys.com>, davem@davemloft.net, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

> > Hi Biao
> > 
> > readl_poll_timeout() returns an error code. It is better to return
> > that, than make up some other error code. Yes, i know the C22 read
> > returns EBUSY, but we don't need to copy that behaviour into C45.
> > 
> OK, will return error code here.
> > > +
> > > +	value = 0;
> > > +	value |= (prtad << priv->hw->mii.cl45_reg_shift)
> > > +			& priv->hw->mii.cl45_reg_mask;
> > > +	writel(value, priv->ioaddr + mii_data);
> > > +
> > > +	/* delay 2ms to avoid error value of get_phy_c45_devs_in_pkg */
> > > +	mdelay(2);
> > 
> > Please could you explain this a bit more?
> when of_mdiobus_register is invoked,
> the C22 PHY addr information will be obtained in device tree(reg = xx,
> no need through mdiobus),
> but C45 PHY addr should be got through mdiobus->read according to
> current flow.
>     of_mdiobus_register -->
>     of_mdiobus_register_phy -->
>     get_phy_device -->
>     get_phy_id -->
>     get_phy_c45_ids -->
>     get_phy_c45_devs_in_pkg
> 
> In my platform, mdio bus read will return 0xffff or 0x0000 for C45 in
> of_mdiobus_register callstack, and that's not the expected value. 
> So that the mdiobus register fails.
> 
> We took some time to find that only after adding 2ms delay here,
> the read action will be stable and return the expected value.
> 
> did you try C45 support in your platform? I can't tell whether it's a
> common or specified issue.

It sounds like you need to put a logic analyser on the bus and see if
it performs a C22 transaction, or an invalid transaction, without the
2ms pause.

This sounds like a 'silicon' bug. There should not be a need to pause
here. And the comment should talk about this silicon bug, not
get_phy_c45_devs_in_pkg(). It will fail for all accesses, not just
those for get_phy_c45_devs_in_pkg().

	Andrew
