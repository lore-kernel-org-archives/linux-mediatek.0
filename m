Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8ACC0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 09:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MatzgOf7PbhCmZ2actbMwjSD4SoxiQ5GK8jq2Yu9SsA=; b=xLq/xBikrbel20BdS+Ipl4NtNg
	v/VR0OleNSG/Q2PzZ8EfGKlHMC8SQurg3xMzkE6b9g9jjcMbSZBgUyX1h5tamez6iU1QJrQ/KraWy
	a31hfIUXZrRRhZfHVLpFIDyyd58Ua2FL15ggy00LeSeTQALBk9zBwVuQVX6V2VprRYODWNRW0u07I
	Qi5mA9hF4LU5uTrKwOubT1wtXrUkktXgT+PFDyLKrL7YPx5QwSbbUmVDBby/BqEbcS9UU6gd5qRK/
	ki+4gtaMu3owUIVrPyb43JIf2oKuyjASYpHs3mD59jIafyzHTzAZyWsUtV1xUyiJ6Y1LEf/0s6ICi
	uBoaTVPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLm-00BqYu-0h;
	Wed, 25 Oct 2023 09:38:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLS-00BqMH-2r;
	Wed, 25 Oct 2023 09:38:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 233C36607343;
	Wed, 25 Oct 2023 10:38:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698226712;
	bh=AFlEOUVjbOzAnHyui64UF1ujgtQlWC3TJ1hlamraKoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hNT9Y9kuwhXIGmrEymlSH/2fhjhdokV6gsZXipbzAPcb4ieCXyW1cdP3PzCdF4/ib
	 XzJO8ZV0UNeI467iyy4ZfTVDW+esaQM/FHrq/yx6jdn0lxPyuiyWS0Y46KowCLQe5S
	 9m9C5R1gXlCIXAZYue+thNVJqBQZcfr5Qz2jTraSLN8iTe9ImnCikFk5EjBMBZCZ3G
	 BYquAIN4IfqtE4r4nvQqi1/gV83P2gccKIUc1P2793707iPS6pMLOO25fewgxOhopp
	 sPhpVJu1n/jf9awmWFLp4+4q22OReZ28kZnHQDec7oZGN6h5IEDDSIHi8be/Xvhn2b
	 674KlWjagUcvg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: hsinyi@chromium.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	erin.lo@mediatek.com,
	eddie.huang@mediatek.com,
	pihsun@chromium.org,
	fparent@baylibre.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/8] arm64: dts: mediatek: mt8173: Use interrupts-extended where possible
Date: Wed, 25 Oct 2023 11:38:10 +0200
Message-ID: <20231025093816.44327-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
References: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_023835_213631_AA21B983 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

Change all instances of interrupt-parent + interrupts to one line
as interrupts-extended where possible across all MT8173 DTs to both
simplify and reduce code size.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  9 +++----
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 24 +++++++------------
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  3 +--
 3 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index bdcd35cecad9..90cbbc18a483 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -13,8 +13,7 @@ &i2c3 {
 	touchscreen2: touchscreen@34 {
 		compatible = "melfas,mip4_ts";
 		reg = <0x34>;
-		interrupt-parent = <&pio>;
-		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	/*
@@ -26,8 +25,7 @@ touchscreen3: touchscreen@20 {
 		compatible = "hid-over-i2c";
 		reg = <0x20>;
 		hid-descr-addr = <0x0020>;
-		interrupt-parent = <&pio>;
-		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
@@ -39,8 +37,7 @@ &i2c4 {
 	 */
 	trackpad2: trackpad@2c {
 		compatible = "hid-over-i2c";
-		interrupt-parent = <&pio>;
-		interrupts = <117 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 111495622cac..8d614ac2c58e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -245,8 +245,7 @@ rt5650: audio-codec@1a {
 		reg = <0x1a>;
 		avdd-supply = <&mt6397_vgp1_reg>;
 		cpvdd-supply = <&mt6397_vcama_reg>;
-		interrupt-parent = <&pio>;
-		interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
+		interrupts-extended = <&pio 3 IRQ_TYPE_EDGE_BOTH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&rt5650_irq>;
 		#sound-dai-cells = <1>;
@@ -308,8 +307,7 @@ &i2c1 {
 	da9211: da9211@68 {
 		compatible = "dlg,da9211";
 		reg = <0x68>;
-		interrupt-parent = <&pio>;
-		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			da9211_vcpu_reg: BUCKA {
@@ -353,8 +351,7 @@ &i2c3 {
 	touchscreen: touchscreen@10 {
 		compatible = "elan,ekth3500";
 		reg = <0x10>;
-		interrupt-parent = <&pio>;
-		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
@@ -366,8 +363,7 @@ &i2c4 {
 
 	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
-		interrupt-parent = <&pio>;
-		interrupts = <117 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x15>;
 		vcc-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
@@ -439,8 +435,7 @@ &mmc3 {
 	btmrvl: btmrvl@2 {
 		compatible = "marvell,sd8897-bt";
 		reg = <2>;
-		interrupt-parent = <&pio>;
-		interrupts = <119 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 119 IRQ_TYPE_LEVEL_LOW>;
 		marvell,wakeup-pin = /bits/ 16 <0x0d>;
 		marvell,wakeup-gap-ms = /bits/ 16 <0x64>;
 	};
@@ -448,8 +443,7 @@ btmrvl: btmrvl@2 {
 	mwifiex: mwifiex@1 {
 		compatible = "marvell,sd8897";
 		reg = <1>;
-		interrupt-parent = <&pio>;
-		interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 38 IRQ_TYPE_LEVEL_LOW>;
 		marvell,wakeup-pin = <3>;
 	};
 };
@@ -933,8 +927,7 @@ pmic: pmic {
 		compatible = "mediatek,mt6397";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		interrupt-parent = <&pio>;
-		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
@@ -1160,8 +1153,7 @@ cros_ec: ec@0 {
 		compatible = "google,cros-ec-spi";
 		reg = <0x0>;
 		spi-max-frequency = <12000000>;
-		interrupt-parent = <&pio>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 0 IRQ_TYPE_LEVEL_LOW>;
 		google,cros-ec-spi-msg-delay = <500>;
 
 		i2c_tunnel: i2c-tunnel0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 5122963d8743..692e8173c9eb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -303,8 +303,7 @@ &pwrap {
 
 	pmic: pmic {
 		compatible = "mediatek,mt6397";
-		interrupt-parent = <&pio>;
-		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-- 
2.42.0


