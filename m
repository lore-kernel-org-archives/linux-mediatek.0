Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C51ED29C39
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB4EnfaJdnHJwvic/r+gC6YvhHwxYFGBOmlA5frAe5M=; b=ZsGh4gRCJ9XzxP99MXWhhTOKZT
	zbIdLVYjZ4VXNPj6BlIa/iBJeAApbrwsSx5nu11fVwMD3PWcfcUFrOkaaG7vV+i+u2m4/9X9WGDe5
	0+0r1afY7Yk/bI3SKeZhFgI9YFVTRM1MSQ3lP625V1pXM3y+VNlPfmOrJqLIv3PuJbFaMVKKVDvXR
	LVDGbHVfF9z//AUdIqQJ5NfM1CxszqmuG0eyODxy7r+GuNmppPatHn3Zm9lkXmP/nCfKyx/3Qqm/T
	po0yrmygBsiLrFED7/OHRDarK2caTTJ7/cMzbPRmsMgmtHnV17X9pckUyw1w7/kSQkS4HSobqK+x0
	09d1lsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrMr-00000002NBY-1TGs;
	Mon, 19 Jan 2026 15:40:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrMZ-00000002NAU-3JLj
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 15:40:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 57E57C214CB;
	Mon, 19 Jan 2026 15:33:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5551B60731;
	Mon, 19 Jan 2026 15:33:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0C8410B6B141;
	Mon, 19 Jan 2026 16:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768836827; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fB4EnfaJdnHJwvic/r+gC6YvhHwxYFGBOmlA5frAe5M=;
	b=Ifh2Ust2NQlwh/7BaY2Io6qs9TzsJ0zMHAKcvN1s+yqoA5hMxq+fZgE+74huWRQL25ly16
	EkgxZL97qepeaHxcjyZtRNrJ1nKWewL7FVISPN8PA0/jixiChOixncY6vmMFO50zwKTsSt
	Ag+vc7yI+MP47Gkw3HuNO6BhiIaQQb8c7JQ84jLNqzyGoe0vt+uBHxqtMqXH4QgjnS4ATw
	n7GNiaF1IIvdFJQe9pZm/tFVFT2wpXtBnS8gWGvLKb7usJ0MVXc9OWsuiJPZaxmFlHQFGU
	bvfmmoRy0BgN8PdEXlOAzWLwf9FFmJ+yRXptu1oFN+BpvT4FA7EFkUv6CvJ+sA==
Message-ID: <ac4707d6-8472-4465-a421-14ab9cc0836d@bootlin.com>
Date: Mon, 19 Jan 2026 16:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 2/5] net: phy: air_en8811h: deprecate
 "airoha,pnswap-rx" and "airoha,pnswap-tx"
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eric Woudstra <ericwouds@gmail.com>, Alexander Couzens <lynxis@fe80.eu>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Felix Fietkau <nbd@nbd.name>
References: <20260119091220.1493761-1-vladimir.oltean@nxp.com>
 <20260119091220.1493761-3-vladimir.oltean@nxp.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260119091220.1493761-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074021_805093_BAAD1BB6 
X-CRM114-Status: GOOD (  20.83  )
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

Hi Vladimir,

On 19/01/2026 10:12, Vladimir Oltean wrote:
> Prefer the new "rx-polarity" and "tx-polarity" properties, and use the
> vendor specific ones as fallback if the standard description doesn't
> exist.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

> ---
> v2->v4: none
> v1->v2:
> - adapt to API change: error code and returned value have been split
> - bug fix: supported mask of polarities should be BIT(PHY_POL_NORMAL) |
>   BIT(PHY_POL_INVERT) rather than PHY_POL_NORMAL | PHY_POL_INVERT.
> 
>  drivers/net/phy/Kconfig       |  1 +
>  drivers/net/phy/air_en8811h.c | 53 +++++++++++++++++++++++++----------
>  2 files changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index a7ade7b95a2e..7b73332a13d9 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -98,6 +98,7 @@ config AS21XXX_PHY
>  
>  config AIR_EN8811H_PHY
>  	tristate "Airoha EN8811H 2.5 Gigabit PHY"
> +	select PHY_COMMON_PROPS
>  	help
>  	  Currently supports the Airoha EN8811H PHY.
>  
> diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
> index badd65f0ccee..e890bb2c0aa8 100644
> --- a/drivers/net/phy/air_en8811h.c
> +++ b/drivers/net/phy/air_en8811h.c
> @@ -14,6 +14,7 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/phy.h>
> +#include <linux/phy/phy-common-props.h>
>  #include <linux/firmware.h>
>  #include <linux/property.h>
>  #include <linux/wordpart.h>
> @@ -966,11 +967,45 @@ static int en8811h_probe(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int en8811h_config_serdes_polarity(struct phy_device *phydev)
> +{
> +	struct device *dev = &phydev->mdio.dev;
> +	unsigned int pol, default_pol;
> +	u32 pbus_value = 0;
> +	int ret;
> +
> +	default_pol = PHY_POL_NORMAL;
> +	if (device_property_read_bool(dev, "airoha,pnswap-rx"))
> +		default_pol = PHY_POL_INVERT;
> +
> +	ret = phy_get_rx_polarity(dev_fwnode(dev), phy_modes(phydev->interface),
> +				  BIT(PHY_POL_NORMAL) | BIT(PHY_POL_INVERT),
> +				  default_pol, &pol);
> +	if (ret)
> +		return ret;
> +	if (pol == PHY_POL_INVERT)
> +		pbus_value |= EN8811H_POLARITY_RX_REVERSE;
> +
> +	default_pol = PHY_POL_NORMAL;
> +	if (device_property_read_bool(dev, "airoha,pnswap-tx"))
> +		default_pol = PHY_POL_INVERT;
> +
> +	ret = phy_get_tx_polarity(dev_fwnode(dev), phy_modes(phydev->interface),
> +				  BIT(PHY_POL_NORMAL) | BIT(PHY_POL_INVERT),
> +				  default_pol, &pol);
> +	if (ret)
> +		return ret;
> +	if (pol == PHY_POL_NORMAL)
> +		pbus_value |= EN8811H_POLARITY_TX_NORMAL;
> +
> +	return air_buckpbus_reg_modify(phydev, EN8811H_POLARITY,
> +				       EN8811H_POLARITY_RX_REVERSE |
> +				       EN8811H_POLARITY_TX_NORMAL, pbus_value);
> +}
> +
>  static int en8811h_config_init(struct phy_device *phydev)
>  {
>  	struct en8811h_priv *priv = phydev->priv;
> -	struct device *dev = &phydev->mdio.dev;
> -	u32 pbus_value;
>  	int ret;
>  
>  	/* If restart happened in .probe(), no need to restart now */
> @@ -1003,19 +1038,7 @@ static int en8811h_config_init(struct phy_device *phydev)
>  	if (ret < 0)
>  		return ret;
>  
> -	/* Serdes polarity */
> -	pbus_value = 0;
> -	if (device_property_read_bool(dev, "airoha,pnswap-rx"))
> -		pbus_value |=  EN8811H_POLARITY_RX_REVERSE;
> -	else
> -		pbus_value &= ~EN8811H_POLARITY_RX_REVERSE;
> -	if (device_property_read_bool(dev, "airoha,pnswap-tx"))
> -		pbus_value &= ~EN8811H_POLARITY_TX_NORMAL;
> -	else
> -		pbus_value |=  EN8811H_POLARITY_TX_NORMAL;
> -	ret = air_buckpbus_reg_modify(phydev, EN8811H_POLARITY,
> -				      EN8811H_POLARITY_RX_REVERSE |
> -				      EN8811H_POLARITY_TX_NORMAL, pbus_value);
> +	ret = en8811h_config_serdes_polarity(phydev);
>  	if (ret < 0)
>  		return ret;
>  


