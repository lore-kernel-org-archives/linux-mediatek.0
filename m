Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD52C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 19:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZjHRlIJfTirwwzT2i8X7HQP34Mb9Rek8gHIaOk7TNeI=; b=HYIdRp+CGQu7k1Ec6zQy4VcEKs
	PYNnPuVJmqJ3mXuh6kkZg/SCDM8LwjJtQ63mBmXIqQ4FQ6buFqbfYOwdFqh92jjw5gp2/F+HZsVAO
	KAsS8TBFDnkZ+94GMs8W2ROTIYngGDXoqJntQdEm5uACigmTJzh0Z/EBFARfDzfwjQXrFhl0znVSs
	CsPUPPg9ZbvtcSe9vTiWFQmpD5M6JY/WILlZRRbqsqAzixw8wfPiY//8c2eUlpZ7dKd1p2zvaV8OM
	Iw6DQF6k8BAQv4G6vDw3TDpDckQUqBJYBM67ynmgQr1nXUcR6y5vhGYXEZbl6/gmmpTlYQaV04iI6
	LvmhZ13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWMs-00EItu-2b; Thu, 05 Jan 2023 19:57:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDMZb-009d99-JJ; Thu, 05 Jan 2023 09:30:12 +0000
X-UUID: e12845aed3c94c82b9b7a419ef8a696a-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZjHRlIJfTirwwzT2i8X7HQP34Mb9Rek8gHIaOk7TNeI=;
	b=isID7ba6a69YXl22VcxluctvnJE1Iec22+Wbn7DLHP8FpIR200pPhPOsvaAshPf1UeYRGG7/MmEGriytkmC0WGULFAowRG3VPWa81Q7aDMUhYibNU96PCTaLNXMXfvRORaIh5myKB+LaRaM8YNWpGt/aMR2/LmFiK2b7t6BKJas=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:dd15127d-2a1f-4561-8580-81a096b8743a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:779ce5f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: e12845aed3c94c82b9b7a419ef8a696a-20230105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 422797819; Thu, 05 Jan 2023 02:29:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 17:29:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 17:29:34 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Miles Chen <miles.chen@mediatek.com>, <linux-usb@vger.kernel.org>, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and IOT's USB configurations
Date: Thu, 5 Jan 2023 17:28:07 +0800
Message-ID: <20230105092809.14214-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_013007_968577_AFB0E2CE 
X-CRM114-Status: GOOD (  15.10  )
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

Introduce the split MT8195 laptop and iot USB configurations.
The hardware specifications for LAPTOP devices is different from IOT
devices. The major differences include some hardware constrains for
dual-role switch for USB controllers in different configurations,
especially for power management and other control flows as well.

Here are some hardware specifiction differences listed:
  1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device mode).
  2. IOT devices must support multiple gadget devices and host mode.
  3. Dual-role switch is not fully supported. Only USB PORT0 support
     dual-role switch.
  4. Power management is designed in primary and secondary dominator.
     For a dual-role port, the device controller is the primary controller
     for power management; while the host controller is the secondary.
     LAPTOP devices should remove device nodes for avoiding abnormal
     behavior.

This modifcation is to add USB configurations "mt8195-laptop-usb.dtsi"
for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.

To remove common USB configurations for mt8195.dtsi and switch includes
dtsi these new files for the boards will come in next patch.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../boot/dts/mediatek/mt8195-iot-usb.dtsi     | 122 ++++++++++++++++++
 .../boot/dts/mediatek/mt8195-laptop-usb.dtsi  | 102 +++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
new file mode 100644
index 000000000000..f9bd79542044
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+
+#include "mt8195.dtsi"
+
+/ {
+	soc {
+		ssusb: ssusb@11200000 {
+			compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
+			reg = <0 0x11201000 0 0x2dff>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+				 <&topckgen CLK_TOP_SSUSB_REF>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			xhci0: xhci@11200000 {
+				compatible = "mediatek,mt8195-xhci",
+					     "mediatek,mtk-xhci";
+				reg = <0 0x11200000 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
+						  <&topckgen CLK_TOP_SSUSB_XHCI>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+							 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+				clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>,
+					 <&topckgen CLK_TOP_SSUSB_REF>,
+					 <&apmixedsys CLK_APMIXED_USB1PLL>;
+				clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck";
+				status = "disabled";
+			};
+		};
+
+		xhci1: xhci1@11290000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11290000 0 0x1000>,
+			      <0 0x11293e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port1 PHY_TYPE_USB2>,
+			       <&u3port1 PHY_TYPE_USB3>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
+				 <&apmixedsys CLK_APMIXED_USB1PLL>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck", "mcu_ck";
+			status = "disabled";
+		};
+
+		ssusb1: usb1@112a1000 {
+			compatible = "mediatek,mt8183-mtu3", "mediatek,mtu3";
+			reg = <0 0x112a1000 0 0x2dff>,
+				  <0 0x112a3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port2 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_2P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 4>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			xhci2: xhci2@112a0000 {
+				compatible = "mediatek,mt8195-xhci","mediatek,mtk-xhci";
+				reg = <0 0x112a0000 0 0x1000>;
+				reg-names = "mac";
+				interrupts-extended = <&gic GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&pio 220 IRQ_TYPE_EDGE_FALLING>;
+				assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+				clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
+				clock-names = "sys_ck";
+				status = "disabled";
+			};
+		};
+
+		xhci3: xhci3@112b0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112b0000 0 0x1000>,
+			      <0 0x112b3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port3 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
+			wakeup-source;
+			usb2-lpm-disable;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi
new file mode 100644
index 000000000000..5e6999bfd83c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-laptop-usb.dtsi
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+
+#include "mt8195.dtsi"
+
+/ {
+	soc {
+		xhci0: usb@11200000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x1000>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+				 <&topckgen CLK_TOP_SSUSB_REF>,
+				 <&apmixedsys CLK_APMIXED_USB1PLL>,
+				 <&clk26m>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
+			wakeup-source;
+			status = "disabled";
+		};
+
+		xhci1: usb@11290000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11290000 0 0x1000>,
+			      <0 0x11293e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port1 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
+				 <&apmixedsys CLK_APMIXED_USB1PLL>,
+				 <&clk26m>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
+			wakeup-source;
+			status = "disabled";
+		};
+
+		xhci2: usb@112a0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112a0000 0 0x1000>,
+			      <0 0x112a3e00 0 0x0100>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
+				 <&clk26m>,
+				 <&clk26m>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
+			wakeup-source;
+			status = "disabled";
+		};
+
+		xhci3: usb@112b0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112b0000 0 0x1000>,
+			      <0 0x112b3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port3 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
+				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
+				 <&clk26m>,
+				 <&clk26m>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
+				      "xhci_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
+			wakeup-source;
+			status = "disabled";
+		};
+	};
+};
-- 
2.18.0


