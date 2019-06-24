From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RFC net-next 5/5] net: dsa: mt7530: Add
 mediatek,ephy-handle to isolate external phy
Date: Mon, 24 Jun 2019 23:52:48 +0200
Message-ID: <20190624215248.GC31306@lunn.ch>
References: <20190624145251.4849-1-opensource@vdorst.com>
 <20190624145251.4849-6-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190624145251.4849-6-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

> +static int mt7530_isolate_ephy(struct dsa_switch *ds,
> +			       struct device_node *ephy_node)
> +{
> +	struct phy_device *phydev = of_phy_find_device(ephy_node);
> +	int ret;
> +
> +	if (!phydev)
> +		return 0;
> +
> +	ret = phy_modify(phydev, MII_BMCR, 0, (BMCR_ISOLATE | BMCR_PDOWN));

genphy_suspend() does what you want.

> +	if (ret)
> +		dev_err(ds->dev, "Failed to put phy %s in isolation mode!\n",
> +			ephy_node->full_name);
> +	else
> +		dev_info(ds->dev, "Phy %s in isolation mode!\n",
> +			 ephy_node->full_name);

No need to clog up the system with yet more kernel messages.

   Andrew
