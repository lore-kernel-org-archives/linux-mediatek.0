Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461FECCF9E3
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL/ia/gSVbKi3fiecZNeUOIq6+F0qjFPHUXwwTnWHW8=; b=b+6doMkV8eH+8wNy5+fMYYFyTt
	tWE08pf+2Fkt15gd53JtGiHHvEs5P8tG5ASWQVMIaQKF4dzQ1xty32K1Txh67ttEv9nBgh3SXwWs8
	gQjUrTCz40jexPzGpB1nAHGhJj1wyuGLydAjxcKfXbPlOpto+1IdunjgWx+HTpPzemcf6ycrM2oyk
	q59FWZz6ykPqDrYAp8iR3Aaf26q3gfvRKGCDEOvyHrxVnQkwrAVGM8X7hHdduT5hDBjovK1MWniri
	cdXgflbf3kOxejtHRiILxiYH75cuURjZ6C5KmnaGfSjo4wjWWCw9uTTAE3h1g4sIac6fLFjSG/mFV
	b9Kh9JJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR7m-00000000Syv-1uOK;
	Fri, 07 Nov 2025 18:23:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR7i-00000000Sw9-1QSQ;
	Fri, 07 Nov 2025 18:23:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1FF57C0FAA4;
	Fri,  7 Nov 2025 18:23:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21613606A6;
	Fri,  7 Nov 2025 18:23:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D09611851120;
	Fri,  7 Nov 2025 19:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762539819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HL/ia/gSVbKi3fiecZNeUOIq6+F0qjFPHUXwwTnWHW8=;
	b=nM01/8L7C97trD4ZO22+Zl1ZUMI4ARanhQNmuXKobVAYp93mHornwY1U1m1Aal/ZaiJEN0
	ZmfP1/zdd4aVjq/ZDnaSEXO00WPmCUWwpq8Kloz4McmuyHD9ENJuXnWhoIcxYHqYY78HZh
	p5DHDP8lNgaZAfvCcfDM1Po9/GgH/OMrIrwqXmMZCRGUTghjpKucx1dwDfclxkTmnY9X1u
	n5qjVn//S08Br5YZPu9NqjgnOe93QQwFQYODkZWu2PAMfUYUrHD/X7pdIjrQL44tFEp7W6
	yhrXvGMp0jBec4LpLwZo8w7GRazlJuKZXNW7z/W+J1lQEY4nNUZxA4lvnp0YWA==
Message-ID: <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
Date: Fri, 7 Nov 2025 19:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 16/16] net: stmmac: visconti: use
 stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Paolo Abeni <pabeni@redhat.com>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_102346_710936_5D5F65A6 
X-CRM114-Status: GOOD (  16.01  )
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

Hi Russell,

On 07/11/2025 15:29, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 26 +++++--------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> index 7b6b048e1be0..9497b13a5753 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> @@ -42,10 +42,6 @@
>  
>  #define ETHER_CLK_SEL_RX_TX_CLK_EN (ETHER_CLK_SEL_RX_CLK_EN | ETHER_CLK_SEL_TX_CLK_EN)
>  
> -#define ETHER_CONFIG_INTF_MII	PHY_INTF_SEL_GMII_MII
> -#define ETHER_CONFIG_INTF_RGMII	PHY_INTF_SEL_RGMII
> -#define ETHER_CONFIG_INTF_RMII	PHY_INTF_SEL_RMII
> -
>  struct visconti_eth {
>  	void __iomem *reg;
>  	struct clk *phy_ref_clk;
> @@ -150,22 +146,12 @@ static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmac
>  {
>  	struct visconti_eth *dwmac = plat_dat->bsp_priv;
>  	unsigned int clk_sel_val;
> -	u32 phy_intf_sel;
> -
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
> -		break;
> -	case PHY_INTERFACE_MODE_MII:
> -		phy_intf_sel = ETHER_CONFIG_INTF_MII;
> -		break;
> -	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
> -		break;
> -	default:
> +	int phy_intf_sel;
> +
> +	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
> +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> +	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
> +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
>  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
>  		return -EOPNOTSUPP;
>  	}

Probably not too big of a deal, but don't we now incorrectly accept the
"gmii" mode ?

Maxime

