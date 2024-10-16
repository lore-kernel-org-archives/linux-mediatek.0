Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D79D1AD47
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzHcAwZGrSbDYO7/5C7ghJ9e6aswoRDzC68zYkuzBlM=; b=dQhmutw0eOT6oxLfOdfWxbUViL
	fL3RCBCCj6sl2X+Anxk2ORrj/QVdfMpfgy57mT7rbeIRx/NjNCRtkS2QegnuI6RrafTPosH2coSq5
	jQVa6SMllz8X3FqVv8jiPHiyHJLHmTUSVVgi8ewnee1+usLj71LtElDm94ZVUnSe8BKL6VO8RS41A
	kz0G6I6KF8+DKjcXZT1YT6Mba7dwPpL6G6dLL5XgRz1r7O1b7nIQplD/37B0bXaKWt1unLS8rPEFe
	3po572QL/yQ8FiC3RtcnkMPkK7cfBlk5UWdV6j//ebYEuBoLoqd9SFhk47kneygmxRegdv6yrWbyJ
	pRSLj/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t11ZJ-0000000BVQo-2u4e;
	Wed, 16 Oct 2024 10:47:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11Ri-0000000BU9O-2WX9;
	Wed, 16 Oct 2024 10:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729075200;
	bh=dtUNeLW0XzuJcUmXw9cAyk4KOVcrQm3s/E+y1ypOjU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XJCJEqUp2gz+e267eyy2CmnJQAuvblWZTF9vz+9NFpDF6kSiO7hpBOQGG9vzgGukC
	 1QlnGCS7jl9ghgoUjGwkQ+2AUho0/KBaucd7TBvEAiYuvjscpxtpL3V+hdo+pucaLG
	 +16kZTGtFY6zfuUqGFo1jZv244i1ZBdBbdKKP3lHMyGWfuvuXoX036V6v+75dUxzFR
	 2m9hoVhSIf6p6PvC/4PZXSzeVHGjKkoJGCXMbPV+GhUz0IbTUQsqS25Tt6gqkabxCl
	 IwfzZWNkpRrXhdSWw2+dJe3jEmXmp3PVnQdwwwrN7JdTQkADCoZt7MfMo7XP+UVFxz
	 VLFAHoGG8N3zg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B64D917E139E;
	Wed, 16 Oct 2024 12:39:59 +0200 (CEST)
Message-ID: <36e86177-a220-494d-8b25-55ce62cf054d@collabora.com>
Date: Wed, 16 Oct 2024 12:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8188: Add ethernet node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Hsuan-Yu Lin <shane.lin@canonical.com>
References: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
 <20241015-genio700-eth-v1-1-16a1c9738cf4@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241015-genio700-eth-v1-1-16a1c9738cf4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_034002_825766_5E2DF399 
X-CRM114-Status: GOOD (  14.90  )
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

Il 15/10/24 20:15, Nícolas F. R. A. Prado ha scritto:
> Describe the ethernet present on the MT8188.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Hsuan-Yu Lin <shane.lin@canonical.com>
> [Cleaned up to pass dtbs_check, follow DTS style guidelines, removed
> hardcoded mac address and split between mt8188 and genio700 commits]
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 95 ++++++++++++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index b493207a1b688dba51bf5e0e469349263f54ca94..9e3981d6d5cfc8201d8caef256de1299aa8199e3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1647,6 +1647,101 @@ spi5: spi@11019000 {
>   			status = "disabled";
>   		};
>   
> +		eth: ethernet@11021000 {
> +			compatible = "mediatek,mt8188-gmac", "mediatek,mt8195-gmac",
> +				     "snps,dwmac-5.10a";
> +			reg = <0 0x11021000 0 0x4000>;
> +			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "macirq";
> +			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
> +				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>,
> +				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;

			clock-names = "axi", "apb", "mac_main", "ptp_ref",
				      "rmii_internal", "mac_cg";

Since we can compress clock-names, we should just do that :-)

> +			clock-names = "axi",
> +				      "apb",
> +				      "mac_main",
> +				      "ptp_ref",
> +				      "rmii_internal",
> +				      "mac_cg";
> +			assigned-clocks = <&topckgen CLK_TOP_SNPS_ETH_250M>,
> +					  <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +					  <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_ETHPLL_D2>,
> +						 <&topckgen CLK_TOP_ETHPLL_D8>,
> +						 <&topckgen CLK_TOP_ETHPLL_D10>;
> +			power-domains = <&spm MT8188_POWER_DOMAIN_ETHER>;
> +			mediatek,pericfg = <&infracfg_ao>;
> +			snps,axi-config = <&stmmac_axi_setup>;
> +			snps,mtl-rx-config = <&mtl_rx_setup>;
> +			snps,mtl-tx-config = <&mtl_tx_setup>;
> +			snps,txpbl = <16>;
> +			snps,rxpbl = <16>;
> +			snps,clk-csr = <0>;
> +			status = "disabled";

Well, the MDIO bus is part of the IP anyway, so I think we can just put it here.

			eth_mdio: mdio {
				compatible = "snps,dwmac-mdio";
				#address-cells = <1>;
				#size-cells = <0>;
			};


> +
> +			stmmac_axi_setup: stmmac-axi-config {

Please reorder:
				snps,blen = <0 0 0 0 16 8 4>;
				snps,rd_osr_lmt = <0x7>;
				snps,wr_osr_lmt = <0x7>;

Cheers,
Angelo


