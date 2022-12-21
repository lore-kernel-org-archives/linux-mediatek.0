Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F0BC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 03:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7fWgVkJUC6eUeK6p/tHC0VeRCr0fCiCWiRtfMKZ1Ng=; b=AbwB4B1ClU/A07Oj+5kQp887zA
	q6EO8P5VOxIh3vrFmXIJWA/XYzJBjy1eJBN+s+CxH7Ipoc2TG8Nsi7jcfizZXSLCokHu1hsxEtuLN
	lP6mAts1d1rX84+Pb2ucoL04BIrSNDK3bVuls94KOu3vXVnCg5bvT1z0umbfU4XTeVBa7IaDRjQ6l
	lXFi/XWxJyFDO0A1yvmoTtNZd1dn+5YRn72jOTPuXH06YPFaECap8/W0Q+oFlN5cL9/o+BOAulIWM
	OlWJQTm93v7rBi1tzgwDU9Pb3vGgMEB0n8LJA8fGfj+xwSH1JHSdUlPZFB39FMGpl0SGqzbxtu9gG
	zzHWtt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7plV-008edr-6o; Wed, 21 Dec 2022 03:27:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7plS-008eWb-1R; Wed, 21 Dec 2022 03:27:31 +0000
X-UUID: 505e20e2904749b79d13edfa880d949e-20221220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=H7fWgVkJUC6eUeK6p/tHC0VeRCr0fCiCWiRtfMKZ1Ng=;
	b=ZsrfX7AyjuzGPpXsocQu6HngN4KyUzSehAe77zwCGPTHhJOU+VjMvUpRqnu9MNMsjBLl8FNqMBvRxF9xySwfbIYpUnZMS+Oq5Aa2uGwNV8IDXlc3ZJQD6OPE45lWd6EwEtxhFZDSZr/3kHZYkb9b5uXNfsQKBeagtja491wRcG0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:c18e2e97-9212-41be-a70a-674279525100,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:22165952-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 505e20e2904749b79d13edfa880d949e-20221220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 876191848; Tue, 20 Dec 2022 20:27:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 21 Dec 2022 10:26:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 21 Dec 2022 10:26:14 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Biao
 Huang <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>
Subject: [RESEND PATCH v4] arm64: dts: mt8195: Add Ethernet controller
Date: Wed, 21 Dec 2022 10:25:24 +0800
Message-ID: <20221221022523.8458-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221022523.8458-1-biao.huang@mediatek.com>
References: <20221221022523.8458-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_192730_138177_9E7537E0 
X-CRM114-Status: GOOD (  10.75  )
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

Add Ethernet controller node for mt8195.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 86 +++++++++++++++++++
 2 files changed, 174 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 4fbd99eb496a..0e8496d837ef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -258,6 +258,72 @@ &mt6359_vsram_others_ldo_reg {
 };
 
 &pio {
+	eth_default_pins: eth-default-pins {
+		pins-txd {
+			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
+				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
+				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
+				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
+			drive-strength = <MTK_DRIVE_8mA>;
+		};
+		pins-cc {
+			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
+				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
+				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
+				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
+			drive-strength = <MTK_DRIVE_8mA>;
+		};
+		pins-rxd {
+			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
+				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
+				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
+				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
+		};
+		pins-mdio {
+			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
+				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
+			input-enable;
+		};
+		pins-power {
+			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
+				 <PINMUX_GPIO92__FUNC_GPIO92>;
+			output-high;
+		};
+	};
+
+	eth_sleep_pins: eth-sleep-pins {
+		pins-txd {
+			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
+				 <PINMUX_GPIO78__FUNC_GPIO78>,
+				 <PINMUX_GPIO79__FUNC_GPIO79>,
+				 <PINMUX_GPIO80__FUNC_GPIO80>;
+		};
+		pins-cc {
+			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
+				 <PINMUX_GPIO88__FUNC_GPIO88>,
+				 <PINMUX_GPIO87__FUNC_GPIO87>,
+				 <PINMUX_GPIO86__FUNC_GPIO86>;
+		};
+		pins-rxd {
+			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
+				 <PINMUX_GPIO82__FUNC_GPIO82>,
+				 <PINMUX_GPIO83__FUNC_GPIO83>,
+				 <PINMUX_GPIO84__FUNC_GPIO84>;
+		};
+		pins-mdio {
+			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
+				 <PINMUX_GPIO90__FUNC_GPIO90>;
+			input-disable;
+			bias-disable;
+		};
+		pins-power {
+			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
+				 <PINMUX_GPIO92__FUNC_GPIO92>;
+			input-disable;
+			bias-disable;
+		};
+	};
+
 	gpio_keys_pins: gpio-keys-pins {
 		pins {
 			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
@@ -434,6 +500,28 @@ &xhci0 {
 	status = "okay";
 };
 
+&eth {
+	phy-mode ="rgmii-rxid";
+	phy-handle = <&ethernet_phy0>;
+	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
+	snps,reset-delays-us = <0 10000 10000>;
+	mediatek,tx-delay-ps = <2030>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth_default_pins>;
+	pinctrl-1 = <&eth_sleep_pins>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		ethernet_phy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-id001c.c916";
+			reg = <0x1>;
+		};
+	};
+};
+
 &xhci1 {
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..02112bbf2bdf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1046,6 +1046,92 @@ spis1: spi@1101e000 {
 			status = "disabled";
 		};
 
+		eth: ethernet@11021000 {
+			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
+			reg = <0 0x11021000 0 0x4000>;
+			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "macirq";
+			clock-names = "axi",
+				      "apb",
+				      "mac_cg",
+				      "mac_main",
+				      "ptp_ref",
+				      "rmii_internal";
+			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
+				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>,
+				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
+				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
+				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
+			assigned-clocks = <&topckgen CLK_TOP_SNPS_ETH_250M>,
+					  <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
+					  <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
+			assigned-clock-parents = <&topckgen CLK_TOP_ETHPLL_D2>,
+						 <&topckgen CLK_TOP_ETHPLL_D8>,
+						 <&topckgen CLK_TOP_ETHPLL_D10>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_ETHER>;
+			mediatek,pericfg = <&infracfg_ao>;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup>;
+			snps,mtl-tx-config = <&mtl_tx_setup>;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			snps,clk-csr = <0>;
+			status = "disabled";
+
+			stmmac_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0x7>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,blen = <0 0 0 0 16 8 4>;
+			};
+
+			mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <4>;
+				snps,rx-sched-sp;
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+				queue1 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+				queue2 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+				queue3 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+				};
+			};
+
+			mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <4>;
+				snps,tx-sched-wrr;
+				queue0 {
+					snps,weight = <0x10>;
+					snps,dcb-algorithm;
+					snps,priority = <0x0>;
+				};
+				queue1 {
+					snps,weight = <0x11>;
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+				};
+				queue2 {
+					snps,weight = <0x12>;
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+				};
+				queue3 {
+					snps,weight = <0x13>;
+					snps,dcb-algorithm;
+					snps,priority = <0x3>;
+				};
+			};
+		};
+
 		xhci0: usb@11200000 {
 			compatible = "mediatek,mt8195-xhci",
 				     "mediatek,mtk-xhci";
-- 
2.25.1


