Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AFFC433E6
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 10:27:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D68A64E38
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 10:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D68A64E38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=egf1fTIW7K/MiChBhQO5ihW0M6GMdd0DQgqk2X4PwIg=; b=sn6BxLU703Q6TB/Tmi3D7sr9J
	Iy51U/yY7oSLqdvUR0WRC50pLs9OcWwenHWQ2QEaikURKOXMsezjtkePUT8JlQ0Rah+fJf7npoIqL
	uoWZirzBD19CRjr+GCK+N6NvpkVxAGsoLQYy1VmTemz+rbCvMvWap1HNxQfZLU2czAR4bKohu6I/a
	A9z60BOs0bZJH2wMcT9mJbgXxWiTCnWtsSzgqsrfRF/WF2DEdMX2/SmND2zsAeYtlSw/G7TL3lE/X
	KbH8WMP538YjV+BrAVYi3ye0SU20rl9sNlkHkGHxLaJwoEYf5gF2yo2yxn6M3IYRA22Eul4hoYd1i
	YTA0HQWgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7FNN-00034r-OT; Wed, 03 Feb 2021 10:27:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7FNG-00031U-NM; Wed, 03 Feb 2021 10:27:04 +0000
X-UUID: d8ff6d7ad42a489bafc41bdd0002ec66-20210203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=P6HkMNngDEu0ovs7YYGRzlSjmF2Z+miarHYHEVeGcuA=; 
 b=Brsab88AvSQBNLRK7ImQzZDzRXH7/H0dRUD49bWgdrZCXuUZBNc/Nnh8SLzlqCszb7L+Anwq0ba1sUrDP4BfJuxN8hmucW6mldATVxFrcS2UBXLlU+tS2L7OXZjDlGBJccTmL8HBtJdsDNbCJ+VoKfznLYbyiPyV9VJLA+EFj5g=;
X-UUID: d8ff6d7ad42a489bafc41bdd0002ec66-20210203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1967388259; Wed, 03 Feb 2021 02:26:53 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 02:26:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 18:26:47 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Feb 2021 18:26:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>
Subject: [RFC PATCH v2 3/3] arm64: dts: mt8195: add USB related nodes
Date: Wed, 3 Feb 2021 18:26:42 +0800
Message-ID: <20210203102642.7353-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210203102642.7353-1-chunfeng.yun@mediatek.com>
References: <20210203102642.7353-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4801882163939865DB0AE9CB9384AE084FE94C5432E8984B4432855FD9A416BB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_052703_039738_9477F927 
X-CRM114-Status: GOOD (  14.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add USB nodes, PHY nodes and some fixed regulator nodes.
We prefer to use mt8192's compatible for the first USB controller
(port0), there is no wrong with the SOF/ITP interval; but for other
controllers (port1~port3) should use mt8195's one due to the wrong
default setting of SOF/ITP interval which should be calculated from
48M, but not 24M by default.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  70 +++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 163 ++++++++++++++++++++
 2 files changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
index 7264232bb7e9..a60682752e19 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 #include "mt8195.dtsi"
 #include "mt6359.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "MediaTek MT8195 evaluation board";
@@ -49,6 +50,36 @@
 	        enable-active-high;
 	        regulator-always-on;
 	};
+
+	usb_p0_vbus: regulator@2 {
+		compatible = "regulator-fixed";
+		gpio = <&pio 129 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vbus0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	usb_p2_vbus: regulator@3 {
+		compatible = "regulator-fixed";
+		gpio = <&pio 131 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vbus2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	usb_p3_vbus: regulator@4 {
+		compatible = "regulator-fixed";
+		gpio = <&pio 5 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vbus3";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &pmic {
@@ -156,6 +187,22 @@
 	status = "okay";
 };
 
+&u3phy0 {
+	status="okay";
+};
+
+&u3phy1 {
+	status = "okay";
+};
+
+&u3phy2 {
+	status="okay";
+};
+
+&u3phy3 {
+	status="okay";
+};
+
 &pio {
 	nor_pins_default: nordefault {
 		pins0 {
@@ -311,3 +358,26 @@
 	};
 };
 
+
+&xhci0 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_p0_vbus>;
+	status = "okay";
+};
+
+&xhci1 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
+};
+
+&xhci2 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_p2_vbus>;
+	status = "okay";
+};
+
+&xhci3 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_p3_vbus>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ccb9d24b1c1e..60c75b23cf03 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8195-memory-port.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/power/mt8195-power.h>
 #include <dt-bindings/reset/ti-syscon.h>
@@ -914,6 +915,83 @@
 			status = "disabled";
 		};
 
+		xhci0: usb@11200000 {
+			compatible = "mediatek,mt8192-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x1000>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
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
+			assigned-clocks = <&topckgen CLK_TOP_USB_1P_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_1P_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P1_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			status = "disabled";
+		};
+
+		xhci2: usb@112a0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112a0000 0 0x1000>,
+			      <0 0x112a3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port2 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_2P_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_2P_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P2_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
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
+			assigned-clocks = <&topckgen CLK_TOP_USB_3P_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_3P_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			status = "disabled";
+		};
+
 		pcie0: pcie@112f0000 {
 			device_type = "pci";
 			compatible = "mediatek,mt8195-pcie";
@@ -998,6 +1076,40 @@
 			status = "disabled";
 		};
 
+		u3phy2: usb-phy2@11c40000 {
+			compatible = "mediatek,mt8195-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11c40000 0x700>;
+			status = "disabled";
+
+			u2port2: usb2-phy2@0 {
+				reg = <0 0x700>;
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P2_REF>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "disabled";
+			};
+		};
+
+		u3phy3: usb-phy3@11c50000 {
+			compatible = "mediatek,mt8195-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11c50000 0x700>;
+			status = "disabled";
+
+			u2port3: usb2-phy3@0 {
+				reg = <0 0x700>;
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P3_REF>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+		};
+
 		i2c5: i2c5@11d00000 {
 			compatible = "mediatek,mt8195-i2c",
 				"mediatek,mt8192-i2c";
@@ -1138,6 +1250,57 @@
 			#clock-cells = <1>;
 		};
 
+		u3phy1: usb-phy1@11e30000 {
+			compatible = "mediatek,mt8195-tphy",
+				     "mediatek,generic-tphy-v2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11e30000 0x1000>;
+			status = "disabled";
+
+			u2port1: usb2-phy1@0 {
+				reg = <0 0x700>;
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P1_REF>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+
+			u3port1: usb3-phy1@700 {
+				reg = <0x700 0x900>;
+				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+		};
+
+		u3phy0: usb-phy0@11e40000 {
+			compatible = "mediatek,mt8195-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11e40000 0x1000>;
+			status = "disabled";
+
+			u2port0: usb2-phy0@0 {
+				reg = <0x0 0x700>;
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_REF>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+
+			u3port0: usb3-phy0@700 {
+				reg = <0x700 0 0x900>;
+				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+		};
+
 		pciephy: phy@11e80000 {
 			compatible = "mediatek,mt8195-pcie-phy";
 			#address-cells = <2>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
