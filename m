Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AF0CCFA1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhJK/nv+0ASiIHxO+Y11CbUntTVgMQKT69rk/ES1NxI=; b=O5HSc2xDzcb0EsfKGDoe1YlLh5
	BA+aKLdqjhZXkNC/glH94975bP0svP6d4LTpYEX+uEkffS0XBS/0RWsYl1ei1w2VImE0S0h/f6WcV
	21OpVmKErtzMTXGmp7kiEoF9r34Y57h1oWf8ZLYhERQMOUrITjDa+CirofIMVliWrxhufTT2i2JXv
	WwfivCEAmoX7ACvZK/tViuV04H1G9oQ/xAx3LKlnNFBnftDd+3ZsXmBuPIL//Sc0KwFi0KuUoCyMq
	B52O5nrqqaMvC6Ag/Q76LD4S0k21HDkBUocmSEvCIw0SEU+tz0n4h2SvGDYNGVRnDYs09LJCGncED
	pQK0FpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD4X-000000095h8-10im;
	Wed, 12 Nov 2025 15:47:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJD4I-000000095eF-3RYS;
	Wed, 12 Nov 2025 15:47:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 35151C0F56F;
	Wed, 12 Nov 2025 15:47:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC4FD6070B;
	Wed, 12 Nov 2025 15:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6690102F192F;
	Wed, 12 Nov 2025 16:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962449; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VhJK/nv+0ASiIHxO+Y11CbUntTVgMQKT69rk/ES1NxI=;
	b=VPNbNVWd/yU7bWsjlIzkW2w0EhFc/4gP4SYgqNN3fnjEQhk4Y3ArPU1hKZ9Uq4/z50CEYc
	IYtLbtP2csSaEN2yWQoWXFRrO/lnICI045SU4ETVnzYqK+g38R2Dijoo9xrCK55VYPTqJI
	sOjYXOdnanpEpY9uMu8zOENWzXrX91lnr48zJAHFEtDEqaw1tEraWOVoxNlawKwmD0xIjA
	y3DdwNG+xrrXceNfju/SKobXyCVYums5BCJDe+KyG8Z8ozXqssCvpFaf/BhMMbBL5CpxDK
	RqjOPD/uUBkVMe5SSiG4mEwV2CEHln8G34NxaHxPG8jPeYtZ7eZ4/KklYf8y1g==
Message-ID: <8ee62480-88bc-4b1c-a7d4-fd86819d0441@bootlin.com>
Date: Wed, 12 Nov 2025 16:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 02/13] net: stmmac: loongson1: use
 PHY_INTF_SEL_x directly
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Paolo Abeni <pabeni@redhat.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTk-0000000Dqt6-1gN9@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTk-0000000Dqt6-1gN9@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_074735_021116_1DC685DD 
X-CRM114-Status: GOOD (  14.15  )
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



On 11/11/2025 09:11, Russell King (Oracle) wrote:
> Use the PHY_INTF_SEL_xx values directly in ls1c_dwmac_syscon_init(),
> converting them to the PHY_INTF_SELI bitfield when calling
> regmap_update_bits().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 09e2af1d778a..5f9f66fbc191 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -38,8 +38,6 @@
>  #define GMAC_SHUT		BIT(6)
>  
>  #define PHY_INTF_SELI		GENMASK(30, 28)
> -#define PHY_INTF_MII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_GMII_MII)
> -#define PHY_INTF_RMII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_RMII)
>  
>  struct ls1x_dwmac {
>  	struct plat_stmmacenet_data *plat_dat;
> @@ -140,15 +138,14 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  	struct ls1x_dwmac *dwmac = priv;
>  	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
>  	struct regmap *regmap = dwmac->regmap;
> +	int phy_intf_sel;
>  
>  	switch (plat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> -				   PHY_INTF_MII);
> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> -				   PHY_INTF_RMII);
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		break;
>  	default:
>  		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
> @@ -156,6 +153,8 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  		return -EOPNOTSUPP;
>  	}
>  
> +	regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> +			   FIELD_PREP(PHY_INTF_SELI, phy_intf_sel));
>  	regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
>  
>  	return 0;


