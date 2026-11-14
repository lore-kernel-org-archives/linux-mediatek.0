Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F8D606A88E
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kwyFmk6c;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfVU3oiL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MKGSFzhqcqIRvndmIYREC4xj4lwtCE7g0b2WesSSlo0=; b=kwyFmk6c6sTYSq/0h8OcoOrm9d
	3gAX02gJqT8+dk7kMUxFZfu+C/c9zq1E6csx+LcSzKB3m3pIG8smYCitcPRNqJj5yh/4GozY8gvqQ
	dNeYwytLY619WkGF8h7IM5gm9oi/SMyYPeYEr0Q+2Kq0ELSW3heBjQMekfx1IR2oAHrqserKUATP/
	ch8JJZ7vdk0R9TUqW9aMmYa+XAzAV3YX2B37J8B8rK9uxZrzNL1ulULboxiqJh9XqrE1iclUKchx1
	ULT4+ZcskQihTr/th2QXcgJLbNwYK4a6jhgwB0TC34w96uSsN0Z8H6kRArTJb1JZqIUr86JuuQoQp
	iII9E4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF7I-0000000GIq7-27g2;
	Sat, 14 Nov 2026 14:52:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF73-0000000GIjo-3cs4;
	Sat, 14 Nov 2026 14:52:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EFDE627FC;
	Sat, 14 Nov 2026 14:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13431F000CA;
	Sat, 14 Nov 2026 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667937;
	bh=MKGSFzhqcqIRvndmIYREC4xj4lwtCE7g0b2WesSSlo0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HfVU3oiLY1dTmstvNjuo6NuR0qVDoBtw5TGch9e21l/FiVnm5XWHHeVUCTylzNmSj
	 dyXTjk0YYAV3C8/+WhmaCdCWYsY4XlXaZE1dGjG48FEzURlvZyP4P4i5BPXm5SgZr8
	 c844AUQ+4i2UokgoTnXfq32n9Wj/p/UGLS9pjhiWJdW2lNwQnlzgxAUDIZKCF4CeWh
	 jFU070hSZ+fcsL/d2qQsDpeE4dfJgIXW2niSMWyx7EErv8LC0zrkwWX5Vjh8d7n9nr
	 c3IViGiLvZ+xWejpLZ6zpS+qa2b+vc+lxg/XD9k8W6v//x+B+7SZD4l8FmHVOm3j3e
	 tV/Cgx39hdTPA==
Subject: Re: [PATCH net-next v5 09/10] net: stmmac: mediatek: add support for
 TX clock output enable feature
From: netdev-bot+sashiko@kernel.org
To: louisalexis.eyraud@collabora.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, edumazet@kernel.org, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sat, 14 Nov 2026 14:52:15 +0000
Message-ID: <179466793541.2199510.14225975364666918696@kernel.org>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-9-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-9-7d99d6292962@collabora.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] mt8195_set_interface()
  (drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c) now sets…

--

net: stmmac: mediatek: add support for TX clock output enable feature

This commit adds a definition for the MT8189 TX clock output enable bit in
the pericfg Ethernet control 0 register. It also adds a mac_txclk_out_en
flag to the variant data and sets the bit in mt8195_set_interface() when
the flag is true.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 3f024d455cbd5..1a0ab95dfbf0e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -307,6 +311,9 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
>  	/* MT8195 only support external PHY */
>  	intf_val |= MT8195_EXT_PHY_MODE;
>  
> +	if (plat->variant->mac_txclk_out_en)
> +		intf_val |= MT8189_CTRL0_TXC_OUT_OP_EN;
> +

[Severity: Medium]
Should this bit depend on the interface mode? As written,
MT8189_CTRL0_TXC_OUT_OP_EN is set no matter what phy_intf_sel,
plat->rmii_clk_from_mac or plat->rmii_rxc are.

Later in the series, "net: stmmac: mediatek: add support for MT8189 SoC"
sets .mac_txclk_out_en = true for mt8189_gmac_variant. That means the TX
clock output gets enabled in every mode.

The MT8189 binding forbids the MAC from sourcing the RMII reference clock:

  mediatek,rmii-clk-from-mac: false

It still allows mediatek,rmii-rxc, and it does not limit phy-mode. So with
phy-mode = "rmii" and no mediatek,rmii-rxc, the external reference clock
comes in on the TXC pin, as mt8195_set_delay() describes:

    /* the rmii reference clock from outside is connected
     * to TXC pin, the reference clock will be adjusted
     * by TXC delay macro circuit.
     */

mt8195_set_delay() also accepts PHY_INTERFACE_MODE_MII. In MII mode the
PHY drives TX_CLK.

In either of those setups, would the MAC's TXC output driver be turned on
while the PHY or an oscillator is already driving that pin?

If the hardware ignores bit 20 when TXC is used as an input, could the
commit message say so? If it doesn't, would it be safer to set the bit only
for the modes where the MAC drives TXC, such as RGMII?

>  	regmap_write(plat->peri_regmap,
>  		     reg_offset + MT8195_PERI_ETH_CTRL0,
>  		     intf_val);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962%40collabora.com

