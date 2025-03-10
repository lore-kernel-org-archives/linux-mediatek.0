Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB82C282DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQuR/lW2fD056yaFz+cdGCbU2iac7ABcYUONw7CuAGQ=; b=W3tKb5TsCcWRzMc5lKgZvToHWk
	6JLiyuh4nN5TnShaOxx7tOWth53qjRdLWKRDtuid3qGoXfrpvV93ltqGoZWhj7zH/Rn7BzNDhjqO7
	jwq0akGtMDcwMQcwnqWUKO6iulBNP0oaos2U755hqSfrSyTzf7owHeKcRUzG8XwSIMqS0pI+PfGWw
	5jvSm6YqEkF45wl/sH+KjmHD5kAJfZW33HgaKDU61FcOOENnkEcHtqPQx/WjTqU7myvu67g8n2/5J
	otz9h+ALMqDhNKarfcHr+GIFhPFOtBBSCFBnPz17Ife1QGFzfVcQdgzF3n6a+EJQNp1tvydImuHEA
	oh27fRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treeo-000000035cg-0Fwe;
	Mon, 10 Mar 2025 15:03:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdKs-00000002ojc-1nrd;
	Mon, 10 Mar 2025 13:38:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6784153B;
	Mon, 10 Mar 2025 06:38:36 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E9E63F673;
	Mon, 10 Mar 2025 06:38:22 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:38:19 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>, Vinod Koul
 <vkoul@kernel.org>
Subject: Re: [PATCH net-next 8/9] net: stmmac: sun8i: remove
 of_get_phy_mode()
Message-ID: <20250310133819.7c2204a6@donnerap.manchester.arm.com>
In-Reply-To: <E1trbyA-005qYf-Hb@rmk-PC.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
	<E1trbyA-005qYf-Hb@rmk-PC.armlinux.org.uk>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_063826_559700_FE2BC816 
X-CRM114-Status: GOOD (  20.61  )
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

On Mon, 10 Mar 2025 12:10:54 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

Hi,

> devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
> which is stored in plat_dat->phy_interface. Therefore, we don't need to
> get it in platform code.
> 
> sun8i was using of_get_phy_mode() to set plat_dat->mac_interface, which
> defaults to plat_dat->phy_interface when the mac-mode DT property is
> not present. As nothing in arch/*/boot/dts sets the mac-mode property,
> it is highly likely that these two will be identical, and thus there
> is no need for this glue driver to set plat_dat->mac_interface.

Well, the current sun8i code wouldn't help anyway, because the driver
would set mac_interface to the value of "phy-mode", not "mac-mode", which
is strictly speaking a bug.
But in any case this is indeed redundant, so:

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 4b7b2582a120..85723a78793a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1155,11 +1155,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	struct stmmac_resources stmmac_res;
>  	struct sunxi_priv_data *gmac;
>  	struct device *dev = &pdev->dev;
> -	phy_interface_t interface;
> -	int ret;
>  	struct stmmac_priv *priv;
>  	struct net_device *ndev;
>  	struct regmap *regmap;
> +	int ret;
>  
>  	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
>  	if (ret)
> @@ -1219,10 +1218,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = of_get_phy_mode(dev->of_node, &interface);
> -	if (ret)
> -		return -EINVAL;
> -
>  	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> @@ -1230,7 +1225,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	/* platform data specifying hardware features and callbacks.
>  	 * hardware features were copied from Allwinner drivers.
>  	 */
> -	plat_dat->mac_interface = interface;
>  	plat_dat->rx_coe = STMMAC_RX_COE_TYPE2;
>  	plat_dat->tx_coe = 1;
>  	plat_dat->flags |= STMMAC_FLAG_HAS_SUN8I;


