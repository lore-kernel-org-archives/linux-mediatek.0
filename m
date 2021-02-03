Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0778BC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:33:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8465B64DD9
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8465B64DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a0IafMANKjjgOWQ777rhn6L+mihvVyeUlRVFeqjYg3E=; b=fekV4x2Y17n5MplT0s1t5ZhwL
	eGogLp2uWkv13LLFATugtCaN3SRIR3tcRcP6L9obqDjgqZgjRk3xi6OQbs8wdxKCdP+BIRYvEPnIh
	YjKRw7/ULZkRw2k/7Plw6kT05qbTEKPoBTOTJwRBiO5JIVtFopD9deE+UlDN/x/D3ktTtY1k41Moo
	Sufasg5Bdj57TD5y0DucHTwv7gfuRzOT5Y7AbUQ7mD2OcungyiBexyH1hBhm3EUROXlKcb15BHu8a
	4th6w4QqmxQDniftHffpEQjt84sowjFV1+eDK7/nZTVUxouOJ3BDpCbHJoyYsIDXbHr2f/T3s7KQb
	ehg4E1WXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Biw-0001xK-6R; Wed, 03 Feb 2021 06:33:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Biq-0001uR-Fq; Wed, 03 Feb 2021 06:33:05 +0000
X-UUID: 73e52257ecab4c64882d9d9adbfc35df-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KRCVDtSrRgehzxm0fduIGauOJq45reVWKzALRHgkuIU=; 
 b=A64HEQahwh0PkhIViM5MK651LnqtidYf4PtYRLennoQHVU+2lLBd/k3jWCwfsNIuwtV7vd+ZiDBLxr3YNM7M1veq2z1xcqKuWaoh+fvMDm7V8q4gAcu3hm1exMZmQHQEWmz65y5feM7Nm4FX+so7y9L6M/iU1sQm4+n1BeqcS8A=;
X-UUID: 73e52257ecab4c64882d9d9adbfc35df-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 980421308; Tue, 02 Feb 2021 22:32:56 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 22:32:53 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 14:32:46 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Feb 2021 14:32:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>
Subject: [RFC PATCH 3/3] arm64: dts: mt8195: add USB related nodes
Date: Wed, 3 Feb 2021 14:31:59 +0800
Message-ID: <20210203063159.11021-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210203063159.11021-1-chunfeng.yun@mediatek.com>
References: <20210203063159.11021-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B788B26AA748834F35E1F108DA8F78F6660A6C51C78035BFD44E6544A033CAD72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_013304_758135_F6D1C9EE 
X-CRM114-Status: GOOD (  15.03  )
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
