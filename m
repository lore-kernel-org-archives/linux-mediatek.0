From: biao huang <biao.huang@mediatek.com>
Subject: Re: [PATCH 5/6] net: stmmac: add mdio clause 45 access from mac
 device for dwmac4
Date: Mon, 29 Apr 2019 14:05:25 +0800
Message-ID: <1556517925.24897.17.camel@mhfsdcap03>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
         <1556433009-25759-6-git-send-email-biao.huang@mediatek.com>
         <20190428163705.GH23059@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190428163705.GH23059@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jose Abreu <joabreu@synopsys.com>, davem@davemloft.net, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi Andrew,

On Sun, 2019-04-28 at 18:37 +0200, Andrew Lunn wrote:
> On Sun, Apr 28, 2019 at 02:30:08PM +0800, Biao Huang wrote:
> > +static int stmmac_c45_read(struct mii_bus *bus, int phyaddr,
> > +			   int devad, int prtad)
> > +{
> > +	struct net_device *ndev = bus->priv;
> > +	struct stmmac_priv *priv = netdev_priv(ndev);
> > +	unsigned int mii_address = priv->hw->mii.addr;
> > +	unsigned int mii_data = priv->hw->mii.data;
> > +	u32 v, value;
> > +	int data;
> > +
> > +	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
> > +			       100, 10000))
> > +		return -EBUSY;
> 
> Hi Biao
> 
> readl_poll_timeout() returns an error code. It is better to return
> that, than make up some other error code. Yes, i know the C22 read
> returns EBUSY, but we don't need to copy that behaviour into C45.
> 
OK, will return error code here.
> > +
> > +	value = 0;
> > +	value |= (prtad << priv->hw->mii.cl45_reg_shift)
> > +			& priv->hw->mii.cl45_reg_mask;
> > +	writel(value, priv->ioaddr + mii_data);
> > +
> > +	/* delay 2ms to avoid error value of get_phy_c45_devs_in_pkg */
> > +	mdelay(2);
> 
> Please could you explain this a bit more?
when of_mdiobus_register is invoked,
the C22 PHY addr information will be obtained in device tree(reg = xx,
no need through mdiobus),
but C45 PHY addr should be got through mdiobus->read according to
current flow.
    of_mdiobus_register -->
    of_mdiobus_register_phy -->
    get_phy_device -->
    get_phy_id -->
    get_phy_c45_ids -->
    get_phy_c45_devs_in_pkg

In my platform, mdio bus read will return 0xffff or 0x0000 for C45 in
of_mdiobus_register callstack, and that's not the expected value. 
So that the mdiobus register fails.

We took some time to find that only after adding 2ms delay here,
the read action will be stable and return the expected value.

did you try C45 support in your platform? I can't tell whether it's a
common or specified issue.

our version is 4.21a.
> 
>        Andrew
