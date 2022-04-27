Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D30C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 06:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MHmWBZwDz0VufUnVJ647uNBtygFeRm2hM4ZbuA1bL0=; b=Bt3mDA0BTZbOuz
	a1Dei+RY9/uxM29M4YHzEzR6SK80vbg8yOTt8ygLGObr/tPTOaYGlM30/aO1FKxSi9etl8vL1UJeB
	FznNOdbtSWu37Fee2qIB1ux4dmSwEIiDY1HbKffHnMleqEE9T9qXEcUWUQmxRylFJrf5/FcimSTAO
	W3m67u3UNQfGuIuHUPLbwwF48oihTJ0nvuZueDwyGNbB/eKSfQXRgwCZPYOQo2ddj2Slq+o7lqH7I
	+CHDyruDX90w6Wt6qwbuq327wzvUhISKv2tKLPYcN1c8xDheIhFgyLa0kzRpH3dZgRkPG1phz0LWr
	ASjjEcaOlRG5iEJucfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njaz0-00HZCn-Nf; Wed, 27 Apr 2022 06:17:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njayp-00HZAB-Ck; Wed, 27 Apr 2022 06:16:53 +0000
X-UUID: 4f76f865695c41de938c4461fc74cb8d-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:14ec598a-5c7f-4aed-8ea0-b4c3137f402b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:2337db2e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4f76f865695c41de938c4461fc74cb8d-20220426
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 600031208; Tue, 26 Apr 2022 23:16:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 23:16:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Apr 2022 14:16:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 14:16:46 +0800
Message-ID: <c9bb743907ec5d8eb8465f22db4db4d477ca161f.camel@mediatek.com>
Subject: Re: [PATCH 3/7] arm64: dts: mediatek: mt8195: add ethernet device node
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Biao Huang <biao.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Wed, 27 Apr 2022 14:16:45 +0800
In-Reply-To: <20220426134106.242353-4-fparent@baylibre.com>
References: <20220426134106.242353-1-fparent@baylibre.com>
 <20220426134106.242353-4-fparent@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_231651_511047_79D9687C 
X-CRM114-Status: GOOD (  19.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-04-26 at 15:41 +0200, Fabien Parent wrote:
> From: Biao Huang <biao.huang@mediatek.com>
> 
> This commit adds device node for mt8195 ethernet.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> This patch comes from 
> https://urldefense.com/v3/__https://lore.kernel.org/all/20211207015505.16746-7-biao.huang@mediatek.com/__;!!CTRNKA9wMg0ARbw!zMbdbHaOYVgzrhlWiTJyY40dCmVZaK1jStklyKdY5qoDUoA5uoISlYOx9E801CRuEHQ$
>  
> 
> The differences between that patch and this patch is that:
> * The EVB dts modification has been split into its own commit
> * The patch was rebased to fix merge conflict with the upstream
> mt8195.dtsi file
> * Re-ordered the node to be correctly sorted based on node address
> 
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 70
> ++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index aa05071a80b8..a58641d1cab0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -912,6 +912,76 @@ spis1: spi@1101e000 {
>  			status = "disabled";
>  		};
>  
> +		eth: ethernet@11021000 {
> +			compatible = "mediatek,mt8195-gmac",
> "snps,dwmac-5.10a";
> +			reg = <0 0x11021000 0 0x4000>;
> +			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH
> 0>;
> +			interrupt-names = "macirq";
> +			mac-address = [00 55 7b b5 7d f7];
> +			clock-names = "axi",
> +				      "apb",
> +				      "mac_main",
> +				      "ptp_ref",
> +				      "rmii_internal",
> +				      "mac_cg";
> +			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
> +				 <&pericfg_ao
> CLK_PERI_AO_ETHERNET_BUS>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
> +				 <&topckgen
> CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>,
> +				 <&pericfg_ao
> CLK_PERI_AO_ETHERNET_MAC>;
> +			assigned-clocks = <&topckgen
> CLK_TOP_SNPS_ETH_250M>,
> +					  <&topckgen
> CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +					  <&topckgen
> CLK_TOP_SNPS_ETH_50M_RMII>;
> +			assigned-clock-parents = <&topckgen
> CLK_TOP_ETHPLL_D2>,
> +						 <&topckgen
> CLK_TOP_ETHPLL_D8>,
> +						 <&topckgen
> CLK_TOP_ETHPLL_D10>;
> +			power-domains = <&spm
> MT8195_POWER_DOMAIN_ETHER>;
> +			mediatek,pericfg = <&infracfg_ao>;
> +			snps,axi-config = <&stmmac_axi_setup>;
> +			snps,mtl-rx-config = <&mtl_rx_setup>;
> +			snps,mtl-tx-config = <&mtl_tx_setup>;
> +			snps,txpbl = <16>;
> +			snps,rxpbl = <16>;
> +			clk_csr = <0>;
> +			status = "disabled";
> +
> +			stmmac_axi_setup: stmmac-axi-config {
> +				snps,wr_osr_lmt = <0x7>;
> +				snps,rd_osr_lmt = <0x7>;
> +				snps,blen = <0 0 0 0 16 8 4>;
> +			};
> +
> +			mtl_rx_setup: rx-queues-config {
> +				snps,rx-queues-to-use = <1>;
> +				snps,rx-sched-sp;
> +				queue0 {
> +					snps,dcb-algorithm;
> +					snps,map-to-dma-channel =
> <0x0>;
> +					snps,priority = <0x0>;
> +				};
> +			};
> +			mtl_tx_setup: tx-queues-config {
> +				snps,tx-queues-to-use = <3>;
> +				snps,tx-sched-wrr;
> +				queue0 {
> +					snps,weight = <0x10>;
> +					snps,dcb-algorithm;
> +					snps,priority = <0x0>;
> +				};
> +				queue1 {
> +					snps,weight = <0x11>;
> +					snps,dcb-algorithm;
> +					snps,priority = <0x1>;
> +				};
> +				queue2 {
> +					snps,weight = <0x12>;
> +					snps,dcb-algorithm;
> +					snps,priority = <0x2>;
> +				};
> +			};
> +		};
> +
>  		ssusb: usb@11201000 {
>  			compatible ="mediatek,mt8195-mtu3",
> "mediatek,mtu3";
>  			reg = <0 0x11201000 0 0x2dff>,

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>

Regards,
Macpaul Lin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
