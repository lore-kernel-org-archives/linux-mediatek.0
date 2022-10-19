Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264FCC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWhQyLWn3P1nzjyRx2g5cOkNZks+6vip8qXcgNq/Af8=; b=1q0tKxVf79M+YD59m8dVBTwXOU
	2zLGprtjx41HK3uCeaxnt8S1aEmWKdS2dZffnvFa/cwg4TMNekLp5FTMOeQo7fbmlAJjgTtLlLRY+
	ZLDbrr6aI6CyuXBnnHaL/5rSrZl99C9J7mUPnLOzzPDSVFJAh+LAe779F7UMuaWbdWuLrPeSkEqXq
	ftDwPvKoMM12PnvuGg/D1yHy4gytkbIAru+geJ0vedkfhK+LSHUr95/b7LVErl9ptKj9/WyeExexl
	nvhii2gGxrgI6Vu+Bdix61AB4w8OBm+CrKbxwhSa1L1i5LIg/wee8PigCFYQiXvjHS2ljQZm5i//B
	D5gEHPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9Zf-002P1Q-A3; Wed, 19 Oct 2022 13:57:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9ZS-002Ocb-Id; Wed, 19 Oct 2022 13:57:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3FA61660238F;
	Wed, 19 Oct 2022 14:57:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666187838;
	bh=GoqeN/GewrNfh6KyiazZvRA5/fFpIcsiWVnAafIR6s4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jBofWKcmTNvwpH9DAux2lWFazuczb2Pf/fXzZqE0pO2VrcgF/kgweGX93IzW0q6dR
	 LnNY/qK0yn57wnFWEI7CZwAlbCwEpOEdI46HTLg2jLfSmp3lM3REKgMRQjxrFSQCGZ
	 Bkx8lg4zoq755qaQZei/LZIebSwKBIocbdPksVCNPNa2oH/SpQceh0iuHRL3IcZlmq
	 6JOKzuI+VhGDaafraA9xicTTzMyv7UbABtRAoH/CNwyg961zSWqXvZnSk8/tZ6mWeX
	 WmWPaTaKlTw1rYytzTyQEdncQ7h84pCx/Y9UMXDhYrTbb9BlkGGXpxJnQzW1tBvqt3
	 vXepuTfwwUcgQ==
Message-ID: <cf0d4a88-16d0-bb10-8402-30d60feafa1b@collabora.com>
Date: Wed, 19 Oct 2022 15:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] arm64: dts: mt8195: Add Ethernet controller
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com
References: <20221019091515.21878-1-biao.huang@mediatek.com>
 <20221019091515.21878-2-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221019091515.21878-2-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_065722_779776_C6FB08DF 
X-CRM114-Status: GOOD (  15.09  )
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

Il 19/10/22 11:15, Biao Huang ha scritto:
> Add Ethernet controller node for mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88 ++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 86 +++++++++++++++++++
>   2 files changed, 174 insertions(+)
> 

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..7f7d9f8e72ee 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1042,6 +1042,92 @@ spis1: spi@1101e000 {
>   			status = "disabled";
>   		};
>   
> +		stmmac_axi_setup: stmmac-axi-config {

Didn't you get a warning during dtb build for these ones?
And if you did, why have you ignored it? :-)

> +			snps,wr_osr_lmt = <0x7>;
> +			snps,rd_osr_lmt = <0x7>;
> +			snps,blen = <0 0 0 0 16 8 4>;
> +		};
> +

..snip..

> +
> +		eth: ethernet@11021000 {
> +			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
> +			reg = <0 0x11021000 0 0x4000>;
> +			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "macirq";
> +			clock-names = "axi",
> +				      "apb",
> +				      "mac_cg",
> +				      "mac_main",
> +				      "ptp_ref",
> +				      "rmii_internal";
> +			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
> +				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
> +				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
> +			assigned-clocks = <&topckgen CLK_TOP_SNPS_ETH_250M>,
> +					  <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +					  <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_ETHPLL_D2>,
> +						 <&topckgen CLK_TOP_ETHPLL_D8>,
> +						 <&topckgen CLK_TOP_ETHPLL_D10>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_ETHER>;
> +			mediatek,pericfg = <&infracfg_ao>;
> +			snps,axi-config = <&stmmac_axi_setup>;
> +			snps,mtl-rx-config = <&mtl_rx_setup>;
> +			snps,mtl-tx-config = <&mtl_tx_setup>;
> +			snps,txpbl = <16>;
> +			snps,rxpbl = <16>;
> +			snps,clk-csr = <0>;
> +			status = "disabled";

Please move stmmac-axi-config, rx-queues-config, tx-queues-config here as a subnode
or in the root node, respecting address/size cells being zero.
Of course adding that here means also specifying {address,size}-cells = <0> in this
ethernet node.

Regards,
Angelo

