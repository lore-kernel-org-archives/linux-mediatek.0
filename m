Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34275FA373D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G03vcOdgjh4F0jzuXNPNgwCIh0TlY0vXWFSWrckQleQ=; b=q9lfOBnoLDVlBC
	Lqwrw5TSY3qC7KFjNKljv65nqt16WQtWNRHJOXZ6JWZRVFz810syakEsf4Xu3gTRGMcBmjcwUpfRa
	JL1m7mBLHKqzr3fQSCnTURUkuAtwv7ZEyfI/yS6cRlinII8DaQ+s/HMQ7MTn6Nc8iTAVHH2h1XlIn
	RQskIKgdyjlZFHhYPqWQ9BoHavpzGpweq4VSzgJGtuvoj0BBeWloMYGRTEbCkVvP4SAnUMwM5vvvz
	GnCRaA6cj150rEjJZrcukTKftEjimYPY1+/ab+GYAb9TFOq+stfWQv9NpiQmo1mQ0fgW4SmAtsmlJ
	sHjFFQeeBmPDNtftqQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncsI-008mW2-Fr; Wed, 26 Oct 2022 09:39:02 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncqT-008lWc-7j; Wed, 26 Oct 2022 09:37:13 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id 02023626A9;
	Wed, 26 Oct 2022 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666777022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G03vcOdgjh4F0jzuXNPNgwCIh0TlY0vXWFSWrckQleQ=;
	b=ZFxkFt3LIIDpp5um9kBpe16bJZkq49SwGU3SHa3rmyRHGtyKp0KhY2lB3tnybLUngF3ubo
	O0uD2au7BwM6sz3eSQQTMjzpMEbAzPB/zESwgwoyGlJ5/CxjFNJ57z3m6MH07fjZ03/sxv
	hfSAMBSXwoANN0inOpfLozrppVfqOag=
Received: from frank-G5.. (fttx-pool-80.245.72.174.bambit.de [80.245.72.174])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 3B874802C9;
	Wed, 26 Oct 2022 09:37:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v2 3/7] arm64: dts: mt7986: add usb related device nodes
Date: Wed, 26 Oct 2022 11:36:46 +0200
Message-Id: <20221026093650.110290-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026093650.110290-1-linux@fw-web.de>
References: <20221026093650.110290-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: cb246fed-ba9f-4d74-b1b4-bf71d0093d8e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_023709_628950_3AB8A398 
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This patch adds USB support for MT7986.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes compared to sams original version:
- reorder xhci-clocks based on yaml binding
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 28 ++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 55 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 28 ++++++++++
 3 files changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 58f7e6b169bf..de5d771e5251 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -23,6 +23,24 @@ memory@40000000 {
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
 
 &eth {
@@ -136,6 +154,12 @@ &spi1 {
 	status = "okay";
 };
 
+&ssusb {
+	vusb33-supply = <&reg_3p3v>;
+	vbus-supply = <&reg_5v>;
+	status = "okay";
+};
+
 &switch {
 	ports {
 		#address-cells = <1>;
@@ -197,6 +221,10 @@ &uart2 {
 	status = "okay";
 };
 
+&usb_phy {
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	pinctrl-names = "default", "dbdc";
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 6d881095d933..58bbecfbab98 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -246,6 +246,61 @@ uart2: serial@11004000 {
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
+				 <&infracfg CLK_INFRA_IUSB_CK>,
+				 <&infracfg CLK_INFRA_IUSB_133_CK>,
+				 <&infracfg CLK_INFRA_IUSB_66M_CK>,
+				 <&topckgen CLK_TOP_U2U3_XHCI_SEL>;
+			clock-names = "sys_ck",
+				      "ref_ck",
+				      "mcu_ck",
+				      "dma_ck",
+				      "xhci_ck";
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>,
+			       <&u2port1 PHY_TYPE_USB2>;
+			status = "disabled";
+		};
+
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
index 7673aa3fa6ae..cd1763fa7f19 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -23,6 +23,24 @@ memory@40000000 {
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
 
 &eth {
@@ -163,10 +181,20 @@ &spi1 {
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
 
+&usb_phy {
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	pinctrl-names = "default", "dbdc";
-- 
2.34.1


