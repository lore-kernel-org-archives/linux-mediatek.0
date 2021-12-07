Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0191BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 02:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WI+Mkvb49IgO84OWlU5y2YNYdcwgTZWDOyEhblVIog=; b=wo0tpCBbqUb1G8
	7Oh6I2DFUIJnMa5/AGVy6ESP12drjyesiKi81rbO4H3a/A8/PEcK6Hl7d/GLJpBllEoQb9gYplSUz
	MZDDIVJGZOc2uIiwaFvPWkyR76V7mQ79oZSsxmzLTC68QnafpAKUY0c1hbaNjrGfk24C1GUlEqomK
	YBIalVhO/4r7sOy2+hS8S64wtWVnGKfpp7KQeojy/dqHr9g9nSJivZ4sR/7MpQ8gMsiReVyZ2ryGT
	dFkiTuwDYs1Djll6L8aDC2eJk8XcMK2AGCPv2w4YpQXqS61jdoE9JAAjxIXj8iP5+D9/mfEK0FJDE
	X8d1uA0L3X+ruU0dNTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muPnS-006hqY-Au; Tue, 07 Dec 2021 02:01:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muPhb-006eYV-CM; Tue, 07 Dec 2021 01:55:33 +0000
X-UUID: 08f78c3dd21543af8a45c49db10b2780-20211206
X-UUID: 08f78c3dd21543af8a45c49db10b2780-20211206
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 62547240; Mon, 06 Dec 2021 18:55:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Dec 2021 17:55:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 7 Dec 2021 09:55:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 7 Dec 2021 09:55:24 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Subject: [PATCH v5 6/7] arm64: dts: mt8195: add ethernet device node
Date: Tue, 7 Dec 2021 09:55:04 +0800
Message-ID: <20211207015505.16746-7-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207015505.16746-1-biao.huang@mediatek.com>
References: <20211207015505.16746-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_175531_516106_BA85052E 
X-CRM114-Status: GOOD (  10.07  )
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

This patch adds device node for mt8195 ethernet.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts | 92 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 70 ++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
index 5cce9a5d3163..d90308f80229 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
@@ -5,6 +5,8 @@
  */
 /dts-v1/;
 #include "mt8195.dtsi"
+#include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "MediaTek MT8195 evaluation board";
@@ -32,6 +34,96 @@ reserved_memory: reserved-memory {
 	};
 };
 
+&eth {
+	phy-mode ="rgmii-rxid";
+	phy-handle = <&eth_phy0>;
+	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
+	snps,reset-delays-us = <0 10000 10000>;
+	mediatek,tx-delay-ps = <2030>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth_default>;
+	pinctrl-1 = <&eth_sleep>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		eth_phy0: eth_phy0@1 {
+			compatible = "ethernet-phy-id001c.c916";
+			reg = <0x1>;
+		};
+	};
+};
+
+&pio {
+	eth_default: eth_default {
+		txd_pins {
+			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
+				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
+				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
+				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
+			drive-strength = <MTK_DRIVE_8mA>;
+		};
+		cc_pins {
+			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
+				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
+				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
+				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
+			drive-strength = <MTK_DRIVE_8mA>;
+		};
+		rxd_pins {
+			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
+				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
+				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
+				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
+		};
+		mdio_pins {
+			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
+				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
+			input-enable;
+		};
+		power_pins {
+			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
+				 <PINMUX_GPIO92__FUNC_GPIO92>;
+			output-high;
+		};
+	};
+
+	eth_sleep: eth_sleep {
+		txd_pins {
+			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
+				 <PINMUX_GPIO78__FUNC_GPIO78>,
+				 <PINMUX_GPIO79__FUNC_GPIO79>,
+				 <PINMUX_GPIO80__FUNC_GPIO80>;
+		};
+		cc_pins {
+			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
+				 <PINMUX_GPIO88__FUNC_GPIO88>,
+				 <PINMUX_GPIO87__FUNC_GPIO87>,
+				 <PINMUX_GPIO86__FUNC_GPIO86>;
+		};
+		rxd_pins {
+			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
+				 <PINMUX_GPIO82__FUNC_GPIO82>,
+				 <PINMUX_GPIO83__FUNC_GPIO83>,
+				 <PINMUX_GPIO84__FUNC_GPIO84>;
+		};
+		mdio_pins {
+			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
+				 <PINMUX_GPIO90__FUNC_GPIO90>;
+			input-disable;
+			bias-disable;
+		};
+		power_pins {
+			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
+				 <PINMUX_GPIO92__FUNC_GPIO92>;
+			input-disable;
+			bias-disable;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index a59c0e9d1fc2..f30a60dca5ef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -823,6 +823,76 @@ spis1: spi@1101e000 {
 			status = "disabled";
 		};
 
+		eth: ethernet@11021000 {
+			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
+			reg = <0 0x11021000 0 0x4000>;
+			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "macirq";
+			mac-address = [00 55 7b b5 7d f7];
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
+			clk_csr = <0>;
+			status = "disabled";
+
+			stmmac_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0x7>;
+				snps,rd_osr_lmt = <0x7>;
+				snps,blen = <0 0 0 0 16 8 4>;
+			};
+
+			mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+				snps,rx-sched-sp;
+				queue0 {
+					snps,dcb-algorithm;
+					snps,map-to-dma-channel = <0x0>;
+					snps,priority = <0x0>;
+				};
+			};
+			mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <3>;
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
+			};
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
 			reg = <0 0x11230000 0 0x10000>,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
