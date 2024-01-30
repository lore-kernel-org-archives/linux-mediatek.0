Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C791C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7RbrYPiLW8JVWowC0ZwCRa52nVOew6bNeSRDrTas+s=; b=BMDHGTXPYm4fhhkPCyNHqRVZr1
	CQKM9h4HJDHNjLpgEYZWNRNWVjRl23rIDPBDLynILOcjBtHJmP7mQ1FrV/67TdGDwzBdPMOhZrA3X
	NBBOvEarmsZH8McbCxxutJBKjNKSiQv/WIEUGkBcZr/9e5jwDmquBKV24e0r7lTO7+OQpMuUaxl9+
	3E30NLEApgQ3btGbbDETtLCzTVCBaWXpxkCZIJmbPyNv0TZkMk35mbeA5ChN55gJdnQ02jTvyZTcN
	5oNW5f+4dbAispoOZC/ZErt1g5LOdOQJTtWIal35pBLlTXKcHhhQOxt6N0y1G24/dgKPi9RkG8tuw
	KaxakriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqXA-0000000HGnP-3qRb;
	Tue, 30 Jan 2024 16:00:24 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqWx-0000000HGdo-28d1;
	Tue, 30 Jan 2024 16:00:13 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rUqWS-0007GW-1O;
	Tue, 30 Jan 2024 15:59:40 +0000
Date: Tue, 30 Jan 2024 15:59:28 +0000
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
	Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: simplify
 mt7530_setup_port6() and change to void
Message-ID: <Zbkc4BRORWYu79GZ@makrotopia.org>
References: <20240130-for-netnext-mt7530-improvements-2-v2-0-ba06f5dd9eb0@arinc9.com>
 <20240130-for-netnext-mt7530-improvements-2-v2-5-ba06f5dd9eb0@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130-for-netnext-mt7530-improvements-2-v2-5-ba06f5dd9eb0@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_080011_749224_2D3606AC 
X-CRM114-Status: GOOD (  34.22  )
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

On Tue, Jan 30, 2024 at 06:20:51PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> This code is from before this driver was converted to phylink API. Phylink
> deals with the unsupported interface cases before mt7530_setup_port6() is
> run. Therefore, the default case would never run. However, it must be
> defined nonetheless to handle all the remaining enumeration values, the
> phy-modes.
> 
> Switch to if statement for RGMII and return which simplifies the code and
> saves an indent.
> 
> Set P6_INTF_MODE, which is the the three least significant bits of the
> MT7530_P6ECR register, to 0 for RGMII even though it will already be 0
> after reset. This is to keep supporting dynamic reconfiguration of the port
> in the case the interface changes from TRGMII to RGMII. The core operations
> for TRGMII does not interfere with RGMII so no need to undo them.

That last sentence doesn't parse English gramar.
"operations": plural
"does": singular

Should probably be either "The core operation for TRGMII does not..."
or "The core operations for TRGMII do not..."

As you are mentioning it, I'm now curious if you consider to
dynamically reconfiguring TRGIII<->RGMII on port 6 depending on
whether there is more then 1 GBit/s possible bandwidth needed between
port 6 and the remaining ports? That could make sense for power
management, but then we should at least again switch off the TRGMII
clocks in the RGMII case before returning, see my suggestion inline
below.

> 
> Read XTAL after checking for RGMII as it's only needed for the TRGMII
> interface mode.
> 
> Change mt7530_setup_port6() to void now that there're no error cases left.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/dsa/mt7530.c | 103 ++++++++++++++++++++---------------------------
>  1 file changed, 43 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index c4d492e29fdf..36dc2bbcf3b6 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -414,70 +414,57 @@ mt753x_preferred_default_local_cpu_port(struct dsa_switch *ds)
>  }
>  
>  /* Setup port 6 interface mode and TRGMII TX circuit */
> -static int
> +static void
>  mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> -	u32 ncpo1, ssc_delta, trgint, xtal;
> -
> -	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
> +	u32 ncpo1, ssc_delta, xtal;
>  
> -	switch (interface) {
> -	case PHY_INTERFACE_MODE_RGMII:
> -		trgint = 0;
> -		break;
> -	case PHY_INTERFACE_MODE_TRGMII:
> -		trgint = 1;
> -		if (xtal == HWTRAP_XTAL_25MHZ)
> -			ssc_delta = 0x57;
> -		else
> -			ssc_delta = 0x87;
> -		if (priv->id == ID_MT7621) {
> -			/* PLL frequency: 125MHz: 1.0GBit */
> -			if (xtal == HWTRAP_XTAL_40MHZ)
> -				ncpo1 = 0x0640;
> -			if (xtal == HWTRAP_XTAL_25MHZ)
> -				ncpo1 = 0x0a00;
> -		} else { /* PLL frequency: 250MHz: 2.0Gbit */
> -			if (xtal == HWTRAP_XTAL_40MHZ)
> -				ncpo1 = 0x0c80;
> -			if (xtal == HWTRAP_XTAL_25MHZ)
> -				ncpo1 = 0x1400;
> -		}
> -		break;
> -	default:
> -		dev_err(priv->dev, "xMII interface %d not supported\n",
> -			interface);
> -		return -EINVAL;
> +	if (interface == PHY_INTERFACE_MODE_RGMII) {
> +		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
> +			   P6_INTF_MODE(0));

Maybe at least switch off TRGMIICK here because we are sure we don't need it
in the RGMII case, ie:
core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);

And that then is another line of code already present just below which
means you could keep variable trgint as it was and return after
switching off TRGMIICK below anyway...

> +		return;
>  	}
>  
> -	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
> -		   P6_INTF_MODE(trgint));
> +	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK, P6_INTF_MODE(1));
>  
> -	if (trgint) {
> -		/* Disable the MT7530 TRGMII clocks */
> -		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
> +	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
>  
> -		/* Setup the MT7530 TRGMII Tx Clock */
> -		core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
> -		core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
> -		core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
> -		core_write(priv, CORE_PLL_GROUP11, RG_LCDDS_SSC_DELTA1(ssc_delta));
> -		core_write(priv, CORE_PLL_GROUP4,
> -			   RG_SYSPLL_DDSFBK_EN | RG_SYSPLL_BIAS_EN |
> -			   RG_SYSPLL_BIAS_LPF_EN);
> -		core_write(priv, CORE_PLL_GROUP2,
> -			   RG_SYSPLL_EN_NORMAL | RG_SYSPLL_VODEN |
> -			   RG_SYSPLL_POSDIV(1));
> -		core_write(priv, CORE_PLL_GROUP7,
> -			   RG_LCDDS_PCW_NCPO_CHG | RG_LCCDS_C(3) |
> -			   RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
> +	if (xtal == HWTRAP_XTAL_25MHZ)
> +		ssc_delta = 0x57;
> +	else
> +		ssc_delta = 0x87;
>  
> -		/* Enable the MT7530 TRGMII clocks */
> -		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
> +	if (priv->id == ID_MT7621) {
> +		/* PLL frequency: 125MHz: 1.0GBit */
> +		if (xtal == HWTRAP_XTAL_40MHZ)
> +			ncpo1 = 0x0640;
> +		if (xtal == HWTRAP_XTAL_25MHZ)
> +			ncpo1 = 0x0a00;
> +	} else { /* PLL frequency: 250MHz: 2.0Gbit */
> +		if (xtal == HWTRAP_XTAL_40MHZ)
> +			ncpo1 = 0x0c80;
> +		if (xtal == HWTRAP_XTAL_25MHZ)
> +			ncpo1 = 0x1400;
>  	}
>  
> -	return 0;
> +	/* Disable the MT7530 TRGMII clocks */
> +	core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);

... by moving this line up and letting it happen unconditionally for
both RGMII and TRGMII (in case that works and doesn't break the RGMII
case, but I assume it doesn't)

> +
> +	/* Setup the MT7530 TRGMII Tx Clock */
> +	core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));
> +	core_write(priv, CORE_PLL_GROUP6, RG_LCDDS_PCW_NCPO0(0));
> +	core_write(priv, CORE_PLL_GROUP10, RG_LCDDS_SSC_DELTA(ssc_delta));
> +	core_write(priv, CORE_PLL_GROUP11, RG_LCDDS_SSC_DELTA1(ssc_delta));
> +	core_write(priv, CORE_PLL_GROUP4, RG_SYSPLL_DDSFBK_EN |
> +		   RG_SYSPLL_BIAS_EN | RG_SYSPLL_BIAS_LPF_EN);
> +	core_write(priv, CORE_PLL_GROUP2, RG_SYSPLL_EN_NORMAL |
> +		   RG_SYSPLL_VODEN | RG_SYSPLL_POSDIV(1));
> +	core_write(priv, CORE_PLL_GROUP7, RG_LCDDS_PCW_NCPO_CHG |
> +		   RG_LCCDS_C(3) | RG_LCDDS_PWDB | RG_LCDDS_ISO_EN);
> +
> +	/* Enable the MT7530 TRGMII clocks */
> +	core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
>  }
>  
>  static void
> @@ -2609,15 +2596,11 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>  		  phy_interface_t interface)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> -	int ret;
>  
> -	if (port == 5) {
> +	if (port == 5)
>  		mt7530_setup_port5(priv->ds, interface);
> -	} else if (port == 6) {
> -		ret = mt7530_setup_port6(priv->ds, interface);
> -		if (ret)
> -			return ret;
> -	}
> +	else if (port == 6)
> +		mt7530_setup_port6(priv->ds, interface);
>  
>  	return 0;
>  }
> 
> -- 
> 2.40.1
> 
> 

