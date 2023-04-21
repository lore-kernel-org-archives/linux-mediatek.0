Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFAAC77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 18:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XglpWxPmNTyeP3VKXyw6q/5B7BF2PKLy4QeJw7uH6Bk=; b=oT18kl2Qj/IYY2g/EzwqOZm9xr
	f+WFtE4Rm5GoQ3VgmonbMV51Of1qVKioRTuSWdfQ0akLNJRFTlWTKcXsetKX6qzKJ2jpAAi8Yqrsv
	+crF58oKRZCb39eFmLd3hCCoXn5OKncd0PLjsnFgUJyDVif5GmdkG45tQb8uaNPHsyGc5Jb0Tk3V9
	t+ac2K4oTel8Dnu0rxYcjJQU8CzZnRKT49AL1XkOgNgj1JKiDH4Ksrd8f7LyV9QQ34NNeCeDn0FN9
	ivXP+fXPHfDNxvLgsanOXTluMnfWlRbl/TnJR5y/Vyx+kAH0m19TsXGdep+k20P2UwvpQLvVCw57V
	9UHQiOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvyY-00BfpV-0r;
	Fri, 21 Apr 2023 18:59:18 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvyT-00BfoP-2o;
	Fri, 21 Apr 2023 18:59:15 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppvy8-0002kb-09;
	Fri, 21 Apr 2023 20:58:52 +0200
Date: Fri, 21 Apr 2023 19:58:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH net-next 21/22] net: dsa: mt7530: get rid of useless
 error returns on phylink code path
Message-ID: <ZELc6MjOicjsPGGb@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-22-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421143648.87889-22-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_115914_061668_DD07BFB8 
X-CRM114-Status: GOOD (  29.53  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 21, 2023 at 05:36:47PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Remove error returns on the cases where they are already handled with the
> function the mac_port_get_caps member points to.
> 
> mt7531_mac_config() is also called from mt7531_cpu_port_config() outside of
> phylink but the port and interface modes are already handled there.
> 
> Change the functions and the mac_port_config function pointer to void now
> that there're no error returns anymore.
> 
> Remove mt753x_is_mac_port() that used to help the said error returns.
> 
> On mt7531_mac_config(), switch to if statements to simplify the code.
> 
> Remove internal phy cases from mt753x_phylink_mac_config() as there is no
> configuration to be done for them. There's also no need to check the
> interface mode as that's already handled with the function the
> mac_port_get_caps member points to.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
(on BPi-R3 MT7986A+MT7531AE, BPi-R64 MT7622+MT7531BE and MT7988A rfb)

> ---
>  drivers/net/dsa/mt7530.c | 81 ++++++++--------------------------------
>  drivers/net/dsa/mt7530.h |  2 +-
>  2 files changed, 17 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 8ece3d0d820c..3d19e06061cb 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2556,7 +2556,7 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
>  	}
>  }
>  
> -static int
> +static void
>  mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  		  phy_interface_t interface)
>  {
> @@ -2567,22 +2567,14 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  	} else if (port == 6) {
>  		mt7530_setup_port6(priv->ds, interface);
>  	}
> -
> -	return 0;
>  }
>  
> -static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
> -			      phy_interface_t interface,
> -			      struct phy_device *phydev)
> +static void mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
> +			       phy_interface_t interface,
> +			       struct phy_device *phydev)
>  {
>  	u32 val;
>  
> -	if (priv->p5_sgmii) {
> -		dev_err(priv->dev, "RGMII mode is not available for port %d\n",
> -			port);
> -		return -EINVAL;
> -	}
> -
>  	val = mt7530_read(priv, MT7531_CLKGEN_CTRL);
>  	val |= GP_CLK_EN;
>  	val &= ~GP_MODE_MASK;
> @@ -2610,20 +2602,14 @@ static int mt7531_rgmii_setup(struct mt7530_priv *priv, u32 port,
>  		case PHY_INTERFACE_MODE_RGMII_ID:
>  			break;
>  		default:
> -			return -EINVAL;
> +			break;
>  		}
>  	}
> -	mt7530_write(priv, MT7531_CLKGEN_CTRL, val);
>  
> -	return 0;
> -}
> -
> -static bool mt753x_is_mac_port(u32 port)
> -{
> -	return (port == 5 || port == 6);
> +	mt7530_write(priv, MT7531_CLKGEN_CTRL, val);
>  }
>  
> -static int
> +static void
>  mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  		  phy_interface_t interface)
>  {
> @@ -2631,42 +2617,21 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  	struct phy_device *phydev;
>  	struct dsa_port *dp;
>  
> -	if (!mt753x_is_mac_port(port)) {
> -		dev_err(priv->dev, "port %d is not a MAC port\n", port);
> -		return -EINVAL;
> -	}
> -
> -	switch (interface) {
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	if (phy_interface_mode_is_rgmii(interface)) {
>  		dp = dsa_to_port(ds, port);
>  		phydev = dp->slave->phydev;
> -		return mt7531_rgmii_setup(priv, port, interface, phydev);
> -	case PHY_INTERFACE_MODE_SGMII:
> -	case PHY_INTERFACE_MODE_NA:
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -	case PHY_INTERFACE_MODE_2500BASEX:
> -		/* handled in SGMII PCS driver */
> -		return 0;
> -	default:
> -		return -EINVAL;
> +		mt7531_rgmii_setup(priv, port, interface, phydev);
>  	}
> -
> -	return -EINVAL;
>  }
>  
> -static int
> +static void
>  mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  		  const struct phylink_link_state *state)
>  {
>  	struct mt7530_priv *priv = ds->priv;
>  
> -	if (!priv->info->mac_port_config)
> -		return 0;
> -
> -	return priv->info->mac_port_config(ds, port, mode, state->interface);
> +	if (priv->info->mac_port_config)
> +		priv->info->mac_port_config(ds, port, mode, state->interface);
>  }
>  
>  static struct phylink_pcs *
> @@ -2695,30 +2660,18 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  	u32 mcr_cur, mcr_new;
>  
>  	switch (port) {
> -	case 0 ... 4: /* Internal phy */
> -		if (state->interface != PHY_INTERFACE_MODE_GMII &&
> -		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
> -			goto unsupported;
> -		break;
>  	case 5: /* Port 5, can be used as a CPU port. */
>  		if (priv->p5_configured)
>  			break;
>  
> -		if (mt753x_mac_config(ds, port, mode, state) < 0)
> -			goto unsupported;
> +		mt753x_mac_config(ds, port, mode, state);
>  		break;
>  	case 6: /* Port 6, can be used as a CPU port. */
>  		if (priv->p6_configured)
>  			break;
>  
> -		if (mt753x_mac_config(ds, port, mode, state) < 0)
> -			goto unsupported;
> +		mt753x_mac_config(ds, port, mode, state);
>  		break;
> -	default:
> -unsupported:
> -		dev_err(ds->dev, "%s: unsupported %s port: %i\n",
> -			__func__, phy_modes(state->interface), port);
> -		return;
>  	}
>  
>  	mcr_cur = mt7530_read(priv, MT7530_PMCR_P(port));
> @@ -2811,7 +2764,6 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
>  	struct mt7530_priv *priv = ds->priv;
>  	phy_interface_t interface;
>  	int speed;
> -	int ret;
>  
>  	switch (port) {
>  	case 5:
> @@ -2836,9 +2788,8 @@ mt7531_cpu_port_config(struct dsa_switch *ds, int port)
>  	else
>  		speed = SPEED_1000;
>  
> -	ret = mt7531_mac_config(ds, port, MLO_AN_FIXED, interface);
> -	if (ret)
> -		return ret;
> +	mt7531_mac_config(ds, port, MLO_AN_FIXED, interface);
> +
>  	mt7530_write(priv, MT7530_PMCR_P(port),
>  		     PMCR_CPU_PORT_SETTING(priv->id));
>  	mt753x_phylink_pcs_link_up(&priv->pcs[port].pcs, MLO_AN_FIXED,
> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
> index cad9115de22b..ee2b3d2d6258 100644
> --- a/drivers/net/dsa/mt7530.h
> +++ b/drivers/net/dsa/mt7530.h
> @@ -722,7 +722,7 @@ struct mt753x_info {
>  	void (*mac_port_validate)(struct dsa_switch *ds, int port,
>  				  phy_interface_t interface,
>  				  unsigned long *supported);
> -	int (*mac_port_config)(struct dsa_switch *ds, int port,
> +	void (*mac_port_config)(struct dsa_switch *ds, int port,
>  			       unsigned int mode,
>  			       phy_interface_t interface);
>  };
> -- 
> 2.37.2
> 

