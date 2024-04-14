Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47370C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 03:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZWCZiRvfPjS0Paq4s6IcZfpqOx6SF2Vd31fC+Cfhqc=; b=aKRGoDZbFt6cFuLwIOjAqxD/K1
	kIVwn7XX6uy88PFrGIUy2l6vPSsppjeKF9ziJskw0o64E9xcr2NjmNYOC44ZMEkTQu0ge0KtKBU/5
	xXc5CiLe8/ozM6XqEZc3Ktihug2PCI/NGF/JEZgPAmAQ52sLxJS2m3G4aApNGN+WLeYSAhsYwXnSk
	xjt4X/xBkUz7HLvQT7sdb6VZdhvY9cGlpyiMTVo63z64/zc6NwSZ1uYuErYsHOrcSn8h/Xh7TfFlw
	+h8koylB4QvbRemf84FrDSRJZK6bkIWtID0dU8JMdnY/83bWIobN7B1e8ESYpx7SDyMYQPA5/OCQx
	uabic0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvqS9-00000004U0I-1lkC;
	Sun, 14 Apr 2024 03:22:49 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvqS5-00000004Tzf-3BBR;
	Sun, 14 Apr 2024 03:22:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rvqRu-0001As-32;
	Sun, 14 Apr 2024 03:22:35 +0000
Date: Sun, 14 Apr 2024 04:22:31 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc.unal@arinc9.com
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: dsa: mt7530: simplify core operations
Message-ID: <ZhtL9zAO83HJb_Jq@makrotopia.org>
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-0-b08936df2770@arinc9.com>
 <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-2-b08936df2770@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-2-b08936df2770@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_202245_925388_9E33E735 
X-CRM114-Status: GOOD (  24.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Apr 14, 2024 at 01:08:20AM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The core_rmw() function calls core_read_mmd_indirect() to read the
> requested register, and then calls core_write_mmd_indirect() to write the
> requested value to the register. Because Clause 22 is used to access Clause
> 45 registers, some operations on core_write_mmd_indirect() are
> unnecessarily run. Get rid of core_read_mmd_indirect() and
> core_write_mmd_indirect(), and run only the necessary operations on
> core_write() and core_rmw().
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/dsa/mt7530.c | 108 +++++++++++++++++++----------------------------
>  1 file changed, 43 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index fefa6dd151fa..2650eacf87a7 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -74,116 +74,94 @@ static const struct mt7530_mib_desc mt7530_mib[] = {
>  	MIB_DESC(1, 0xb8, "RxArlDrop"),
>  };
>  
> -/* Since phy_device has not yet been created and
> - * phy_{read,write}_mmd_indirect is not available, we provide our own
> - * core_{read,write}_mmd_indirect with core_{clear,write,set} wrappers
> - * to complete this function.
> - */
> -static int
> -core_read_mmd_indirect(struct mt7530_priv *priv, int prtad, int devad)
> +static void
> +mt7530_mutex_lock(struct mt7530_priv *priv)
> +{
> +	if (priv->bus)
> +		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> +}
> +
> +static void
> +mt7530_mutex_unlock(struct mt7530_priv *priv)
> +{
> +	if (priv->bus)
> +		mutex_unlock(&priv->bus->mdio_lock);
> +}
> +
> +static void
> +core_write(struct mt7530_priv *priv, u32 reg, u32 val)
>  {
>  	struct mii_bus *bus = priv->bus;
> -	int value, ret;
> +	int ret;
> +
> +	mt7530_mutex_lock(priv);
>  
>  	/* Write the desired MMD Devad */
>  	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> -			 MII_MMD_CTRL, devad);
> +			 MII_MMD_CTRL, MDIO_MMD_VEND2);
>  	if (ret < 0)
>  		goto err;
>  
>  	/* Write the desired MMD register address */
>  	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> -			 MII_MMD_DATA, prtad);
> +			 MII_MMD_DATA, reg);
>  	if (ret < 0)
>  		goto err;
>  
>  	/* Select the Function : DATA with no post increment */
>  	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> -			 MII_MMD_CTRL, devad | MII_MMD_CTRL_NOINCR);
> +			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
>  	if (ret < 0)
>  		goto err;
>  
> -	/* Read the content of the MMD's selected register */
> -	value = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> -			  MII_MMD_DATA);
> -
> -	return value;
> +	/* Write the data into MMD's selected register */
> +	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> +			 MII_MMD_DATA, val);
>  err:
> -	dev_err(&bus->dev,  "failed to read mmd register\n");
> +	if (ret < 0)
> +		dev_err(&bus->dev, "failed to write mmd register\n");
>  
> -	return ret;
> +	mt7530_mutex_unlock(priv);
>  }
>  
> -static int
> -core_write_mmd_indirect(struct mt7530_priv *priv, int prtad,
> -			int devad, u32 data)
> +static void
> +core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
>  {
>  	struct mii_bus *bus = priv->bus;
> +	u32 val;
>  	int ret;
>  
> +	mt7530_mutex_lock(priv);
> +
>  	/* Write the desired MMD Devad */
>  	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> -			 MII_MMD_CTRL, devad);
> +			 MII_MMD_CTRL, MDIO_MMD_VEND2);
>  	if (ret < 0)
>  		goto err;
>  
>  	/* Write the desired MMD register address */
>  	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> -			 MII_MMD_DATA, prtad);
> +			 MII_MMD_DATA, reg);
>  	if (ret < 0)
>  		goto err;
>  
>  	/* Select the Function : DATA with no post increment */
>  	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> -			 MII_MMD_CTRL, devad | MII_MMD_CTRL_NOINCR);
> +			 MII_MMD_CTRL, MDIO_MMD_VEND2 | MII_MMD_CTRL_NOINCR);
>  	if (ret < 0)
>  		goto err;
>  
> +	/* Read the content of the MMD's selected register */
> +	val = bus->read(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> +			MII_MMD_DATA);
> +	val &= ~mask;
> +	val |= set;
>  	/* Write the data into MMD's selected register */
>  	ret = bus->write(bus, MT753X_CTRL_PHY_ADDR(priv->phy_addr),
> -			 MII_MMD_DATA, data);
> +			 MII_MMD_DATA, val);
>  err:
>  	if (ret < 0)
> -		dev_err(&bus->dev,
> -			"failed to write mmd register\n");
> -	return ret;
> -}
> -
> -static void
> -mt7530_mutex_lock(struct mt7530_priv *priv)
> -{
> -	if (priv->bus)
> -		mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> -}
> -
> -static void
> -mt7530_mutex_unlock(struct mt7530_priv *priv)
> -{
> -	if (priv->bus)
> -		mutex_unlock(&priv->bus->mdio_lock);
> -}
> -
> -static void
> -core_write(struct mt7530_priv *priv, u32 reg, u32 val)
> -{
> -	mt7530_mutex_lock(priv);
> -
> -	core_write_mmd_indirect(priv, reg, MDIO_MMD_VEND2, val);
> -
> -	mt7530_mutex_unlock(priv);
> -}
> -
> -static void
> -core_rmw(struct mt7530_priv *priv, u32 reg, u32 mask, u32 set)
> -{
> -	u32 val;
> -
> -	mt7530_mutex_lock(priv);
> -
> -	val = core_read_mmd_indirect(priv, reg, MDIO_MMD_VEND2);
> -	val &= ~mask;
> -	val |= set;
> -	core_write_mmd_indirect(priv, reg, MDIO_MMD_VEND2, val);
> +		dev_err(&bus->dev, "failed to write mmd register\n");
>  
>  	mt7530_mutex_unlock(priv);
>  }
> 
> -- 
> 2.40.1
> 
> 

