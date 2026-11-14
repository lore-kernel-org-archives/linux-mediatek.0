Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F29606A33D
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1fKmdVEc;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z1jg6YDn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HWjhff4U2bfbc71lpan6VjQI381x45+6j+0ZgY5DOCA=; b=1fKmdVEcpo+4NK
	8bbIxcaY7+9zvSVLz18hQQWzpdCM9aczAE/XLT2hQZmog7d6E1c5TfnK4pR1LvQpiRYr7FQ2hiSH0
	JVSVld5VkgTNip9pMYdiepyG6Ax9Hze9xRefxDWi4GlN6aQuuohpC6pKzDECwb0n1s1d3FcOZOpZI
	+bpTQhTJqzJRZo/O3P/Gm2AIkZs7gzBAdomhGTtoKN3ZIyVKvp59b2N7xFw3EUxy+UFZNbNLoz0IW
	kDs/Q79GNLGRfps6RJgw2Fn2imuK2HhYwYVSITfqdoS55lOhmN/Wjeg8PsdqvVQoZhLTxUX3UQVEr
	eON1M8NtCJguecTfNtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGsf-0000000GUBr-1hii;
	Sat, 14 Nov 2026 16:45:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGsb-0000000GUAT-3R6Y;
	Sat, 14 Nov 2026 16:45:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF21AC5845B;
	Sat, 14 Nov 2026 16:45:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D504601F0;
	Sat, 14 Nov 2026 16:45:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B413211BC0620;
	Sat, 14 Nov 2026 17:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794674722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HWjhff4U2bfbc71lpan6VjQI381x45+6j+0ZgY5DOCA=;
	b=Z1jg6YDnUBA7PClXCcfYhR7Uf9hJgkLnLFMB21wsFkQhpM70Rlejx/ZOAbvYYdnxaWkBPh
	Ee0mhP7Cx8pmPI0bZn+XIHUhDfVJheuDyvgueA1ppsONBX0SlcIpyHaZ5sy6RBsKJKRM1Z
	oB34W/wB8rPoJye4hQgp/cqavMxw+hs9QeQewuE/YFLq+ahRll0CoH4HMQmU+Eo8nQwGYo
	Sxdc3m/QN1nkN/RAV5uL8gbcepKXhRHL8v/ddK7jozmgn1X59ZJasNvR09lYQpPHe6b8gU
	JpwDw1q0Bie6dhMYqvaVBcwkmgZT1BabnuKtsXleYLftkzHU+wKk0CU40tEH6w==
Message-ID: <ebea9af3-5edc-403e-bcd1-de875137d68a@bootlin.com>
Date: Sat, 14 Nov 2026 17:45:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 10/10] net: stmmac: mediatek: add support for
 MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
 <20261110-dwmac-mediatek-mt8189-v5-10-7d99d6292962@collabora.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-10-7d99d6292962@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_084530_055933_E767C266 
X-CRM114-Status: GOOD (  19.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/10/26 13:08, Louis-Alexis Eyraud wrote:
> Like MT8195 SoC, MT8189 SoC uses the Ethernet control registers from
> the peripheral configuration (pericfg) but at a different offset.
> It also has different RX and TX internal delay stage dividers (290ps
> for MT8195, 180ps for MT8189), and by consequence a reduced value range
> for these delays. It finally needs additional feature such as the
> TX clock output enable one.
> 
> Thus, add compatible, clock definitions and specific platform data to
> support the MT8189 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 1a0ab95dfbf0..ce232313014d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -42,8 +42,15 @@
>  #define MT2712_RGMII_DELAY_MAX		5440 /* 32 x 170ps */
>  
>  /* Peri Configuration register for mt8189 */
> +#define MT8189_PERI_ETH_CTRL_OFFSET	0x270
> +
>  #define MT8189_CTRL0_TXC_OUT_OP_EN	BIT(20)
>  
> +#define MT8189_MII_DLY_STAGE_DIV	180  /* 180ps per stage */
> +#define MT8189_MII_DELAY_MAX		5760 /* 32 x 180ps */
> +#define MT8189_RGMII_DLY_STAGE_DIV	180  /* 180ps per stage */
> +#define MT8189_RGMII_DELAY_MAX		5760 /* 32 x 180ps */
> +
>  /* Peri Configuration register for mt8195 */
>  #define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
>  
> @@ -124,6 +131,10 @@ static const char * const mt2712_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_main", "ptp_ref"
>  };
>  
> +static const char * const mt8189_dwmac_clk_l[] = {
> +	"axi", "apb", "mac_main", "ptp_ref"
> +};
> +
>  static const char * const mt8195_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
>  };
> @@ -440,6 +451,20 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
>  	return 0;
>  }
>  
> +static const struct mediatek_dwmac_variant mt8189_gmac_variant = {
> +	.dwmac_set_phy_interface = mt8195_set_interface,
> +	.dwmac_set_delay = mt8195_set_delay,
> +	.clk_list = mt8189_dwmac_clk_l,
> +	.num_clks = ARRAY_SIZE(mt8189_dwmac_clk_l),
> +	.dma_bit_mask = 35,
> +	.mii_delay_max = MT8189_MII_DELAY_MAX,
> +	.rgmii_delay_max = MT8189_RGMII_DELAY_MAX,
> +	.mii_delay_stage_div = MT8189_MII_DLY_STAGE_DIV,
> +	.rgmii_delay_stage_div = MT8189_RGMII_DLY_STAGE_DIV,
> +	.peri_eth_ctrl_offset = MT8189_PERI_ETH_CTRL_OFFSET,
> +	.mac_txclk_out_en = true,
> +};
> +
>  static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
>  	.dwmac_set_phy_interface = mt8195_set_interface,
>  	.dwmac_set_delay = mt8195_set_delay,
> @@ -729,6 +754,8 @@ static void mediatek_dwmac_remove(struct platform_device *pdev)
>  static const struct of_device_id mediatek_dwmac_match[] = {
>  	{ .compatible = "mediatek,mt2712-gmac",
>  	  .data = &mt2712_gmac_variant },
> +	{ .compatible = "mediatek,mt8189-gmac",
> +	  .data = &mt8189_gmac_variant },
>  	{ .compatible = "mediatek,mt8195-gmac",
>  	  .data = &mt8195_gmac_variant },
>  	{ }
> 


