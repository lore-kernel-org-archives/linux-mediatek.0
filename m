Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F27AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yquQESbN2SK7n9xQUvPCcC7I/9SLIXXabXjUsAasI40=; b=ISHiok5U2mbUxC
	fWFObQScamXVeL1jjGIVVsUo7RL67kY3lJx5mGwBFdvVuHMAvBDFrrG06ndN3wN1Sts4yhjaV/wHP
	5v49ecSFzifWpboGCWTa+FdDBTA/D/1ez8yo2i/q5ucOzUkE2L0oIm+dW7FQdK4PKn/gHZ2lGTJA/
	ipSoT2pJGdwTJGWBv67fyi8ci6fIA8PZtvk1oFL6vBxvAcvHEC/BU8AwjbNO2DhijMkWmQSkXvaEu
	tFOupOqIXC7GhvLkQtXKISmmoHU6rZ7cneIDFCcZSSzS+CNfx67+yLxn86PESe196Zjmiqeg+iNFa
	J4N8HVuZ8zhiaWE0vg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njhI0-001RIQ-Fl; Wed, 27 Apr 2022 13:01:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njhFJ-001QFk-3g; Wed, 27 Apr 2022 12:58:18 +0000
X-UUID: db50937f01f440f68f30530a4986c391-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3115d671-ec58-44c8-abdb-182eae7329c8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:afd6e82e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: db50937f01f440f68f30530a4986c391-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 501123294; Wed, 27 Apr 2022 05:58:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 05:48:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 27 Apr 2022 20:48:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 20:48:11 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <ryder.lee@kernel.org>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH 4/5] arm64: dts: mt7986: add usb related device nodes
Date: Wed, 27 Apr 2022 20:47:40 +0800
Message-ID: <20220427124741.18245-5-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220427124741.18245-1-sam.shih@mediatek.com>
References: <20220427124741.18245-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_055817_194140_303C409F 
X-CRM114-Status: GOOD (  10.65  )
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

This patch adds USB support for MT7986.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 28 ++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 55 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 28 ++++++++++
 3 files changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 4a555df1eff4..de6475078568 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -23,6 +23,24 @@
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x40000000>;
 	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &pcie {
@@ -93,6 +111,12 @@
 	status = "okay";
 };
 
+&ssusb {
+	vusb33-supply = <&reg_3p3v>;
+	vbus-supply = <&reg_5v>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -108,3 +132,7 @@
 	pinctrl-0 = <&uart2_pins>;
 	status = "okay";
 };
+
+&usb_phy {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 7d77b5727528..ff685900baa4 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -241,6 +241,29 @@
 			status = "disabled";
 		};
 
+		ssusb: usb@11200000 {
+			compatible = "mediatek,mt7986-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x2e00>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_IUSB_SYS_CK>,
+				 <&topckgen CLK_TOP_U2U3_XHCI_SEL>,
+				 <&infracfg CLK_INFRA_IUSB_CK>,
+				 <&infracfg CLK_INFRA_IUSB_133_CK>,
+				 <&infracfg CLK_INFRA_IUSB_66M_CK>;
+			clock-names = "sys_ck",
+				      "xhci_ck",
+				      "ref_ck",
+				      "mcu_ck",
+				      "dma_ck";
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>,
+			       <&u2port1 PHY_TYPE_USB2>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11280000 {
 			compatible = "mediatek,mt7986-pcie",
 				     "mediatek,mt8192-pcie";
@@ -292,6 +315,38 @@
 			};
 		};
 
+		usb_phy: t-phy@11e10000 {
+			compatible = "mediatek,mt7986-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			u2port0: usb-phy@11e10000 {
+				reg = <0 0x11e10000 0 0x700>;
+				clocks = <&topckgen CLK_TOP_DA_U2_REFSEL>,
+					 <&topckgen CLK_TOP_DA_U2_CK_1P_SEL>;
+				clock-names = "ref", "da_ref";
+				#phy-cells = <1>;
+			};
+
+			u3port0: usb-phy@11e10700 {
+				reg = <0 0x11e10700 0 0x900>;
+				clocks = <&topckgen CLK_TOP_USB3_PHY_SEL>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+
+			u2port1: usb-phy@11e11000 {
+				reg = <0 0x11e11000 0 0x700>;
+				clocks = <&topckgen CLK_TOP_DA_U2_REFSEL>,
+					 <&topckgen CLK_TOP_DA_U2_CK_1P_SEL>;
+				clock-names = "ref", "da_ref";
+				#phy-cells = <1>;
+			};
+		};
+
 		ethsys: syscon@15000000 {
 			 #address-cells = <1>;
 			 #size-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index f159f1ac618b..6bd477e1f484 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -23,6 +23,24 @@
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x40000000>;
 	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &pio {
@@ -62,6 +80,16 @@
 	status = "okay";
 };
 
+&ssusb {
+	vusb33-supply = <&reg_3p3v>;
+	vbus-supply = <&reg_5v>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
+
+&usb_phy {
+	status = "okay";
+};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
