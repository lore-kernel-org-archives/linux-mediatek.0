From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/6] net: stmmac: add mdio clause 45 access from mac
 device for dwmac4
Date: Sun, 28 Apr 2019 18:37:05 +0200
Message-ID: <20190428163705.GH23059@lunn.ch>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
 <1556433009-25759-6-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1556433009-25759-6-git-send-email-biao.huang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: jianguo.zhang@mediatek.com, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, yt.shen@mediatek.com, Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, Apr 28, 2019 at 02:30:08PM +0800, Biao Huang wrote:
> +static int stmmac_c45_read(struct mii_bus *bus, int phyaddr,
> +			   int devad, int prtad)
> +{
> +	struct net_device *ndev = bus->priv;
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	unsigned int mii_address = priv->hw->mii.addr;
> +	unsigned int mii_data = priv->hw->mii.data;
> +	u32 v, value;
> +	int data;
> +
> +	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
> +			       100, 10000))
> +		return -EBUSY;

Hi Biao

readl_poll_timeout() returns an error code. It is better to return
that, than make up some other error code. Yes, i know the C22 read
returns EBUSY, but we don't need to copy that behaviour into C45.

> +
> +	value = 0;
> +	value |= (prtad << priv->hw->mii.cl45_reg_shift)
> +			& priv->hw->mii.cl45_reg_mask;
> +	writel(value, priv->ioaddr + mii_data);
> +
> +	/* delay 2ms to avoid error value of get_phy_c45_devs_in_pkg */
> +	mdelay(2);

Please could you explain this a bit more?

       Andrew
