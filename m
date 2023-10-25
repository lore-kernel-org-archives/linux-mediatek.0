Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C565C25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 09:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyjurUHEC2YMBsK1a/vp6+iVatqSUD6a1SzMih+NuWg=; b=R4VaRvUWFh1y55mKqTZGSc9l8H
	v02y4KpgbREmxevQtTWpQuPwmh72CuraGFMSkhzVdHTmXmpOOdLzTJGTcdwz5X7BILdr87soXO3yI
	GuxatpvJpZIGLFg7lrkjQpkm6T1/yFA2ySRwQkFsKuBJT85r3GnFF96IDK9HfptBffOmL7v4cg3O7
	H29UlAozuvO5V8BZuk4m2wd7LJQG56nau2GPSquekIEC/VSBW4QTn1bropDOdtNS9TyeZzEURU+62
	llSaFrTcOUKcZMfeWHPK+5Z9mXzoIwQD9i4Bc9NEdBpLjNGbdFUN0ZMyG7JVwFZaRlF8A/3yqc7Na
	V2yRWyYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLm-00BqZD-1h;
	Wed, 25 Oct 2023 09:38:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaLS-00BqMG-22;
	Wed, 25 Oct 2023 09:38:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F02E9660733F;
	Wed, 25 Oct 2023 10:38:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698226710;
	bh=RX13zCeq0rAi6EIt1Pj3PIA5q2WQl2rhgl7T3G71//A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YBeZa6JT1VekJ34tVjmGUivmWPsQEJKNpJI+ktANAPJG78sZ6hBOiS+rINC1+48wx
	 tnxWEH749fl8lqtGmkLgO2hH1CgrW63MZc+5apqYkwxuhfqMIWtybNFD7Vbth8/lR7
	 DgBgZvWVziIQv+77K9zDsxsk/5/S1d017NETFdDoNgnRgC+RNxx7eO3xnNeY7/Ovse
	 9xD0XYdxKbIjgEtWYTQ/TlqWI+rNLRjBRqkGa1bf5x1FiOGksXqu9R5bwFBKPFc7/Y
	 nlB2nBCteJ9iUsKilWxi86pOJEzMoM4/8iwQy8YktIMlnkACJeM7cHM6RZXD6oQEOW
	 6MGiJ4tVkTtiw==
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
Subject: [PATCH 1/8] arm64: dts: mediatek: mt8183: Use interrupts-extended where possible
Date: Wed, 25 Oct 2023 11:38:09 +0200
Message-ID: <20231025093816.44327-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
References: <20231025093816.44327-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_023834_942885_90C322EB 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change all instances of interrupt-parent + interrupts to one line
as interrupts-extended where possible across all MT8183 DTs to both
simplify and reduce code size.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi | 3 +--
 .../boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi      | 3 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts  | 3 +--
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts  | 3 +--
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts  | 3 +--
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts  | 3 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi       | 3 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi       | 3 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi        | 3 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi              | 6 ++----
 10 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
index 2c69e7658dba..8b57706ac814 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
@@ -11,8 +11,7 @@ da7219: da7219@1a {
 		pinctrl-0 = <&da7219_pins>;
 		compatible = "dlg,da7219";
 		reg = <0x1a>;
-		interrupt-parent = <&pio>;
-		interrupts = <165 IRQ_TYPE_LEVEL_LOW 165 0>;
+		interrupts-extended = <&pio 165 IRQ_TYPE_LEVEL_LOW>;
 
 		dlg,micbias-lvl = <2600>;
 		dlg,mic-amp-in-sel = "diff";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
index 0799c48ade19..548e22c194a2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
@@ -11,8 +11,7 @@ ts3a227e: ts3a227e@3b {
 		pinctrl-0 = <&ts3a227e_pins>;
 		compatible = "ti,ts3a227e";
 		reg = <0x3b>;
-		interrupt-parent = <&pio>;
-		interrupts = <157 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 157 IRQ_TYPE_LEVEL_LOW>;
 		status = "okay";
 	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 552bfc726999..0b45aee2e299 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -18,8 +18,7 @@ &touchscreen {
 
 	compatible = "hid-over-i2c";
 	reg = <0x10>;
-	interrupt-parent = <&pio>;
-	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index 77b96ddf648e..b595622e7bee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -30,8 +30,7 @@ &touchscreen {
 
 	compatible = "hid-over-i2c";
 	reg = <0x10>;
-	interrupt-parent = <&pio>;
-	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 37e6e58f63b7..5a1c39318a6c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -17,8 +17,7 @@ &touchscreen {
 
 	compatible = "hid-over-i2c";
 	reg = <0x10>;
-	interrupt-parent = <&pio>;
-	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index 0e09604004d5..3ea4fdb40118 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -17,8 +17,7 @@ &touchscreen {
 
 	compatible = "hid-over-i2c";
 	reg = <0x10>;
-	interrupt-parent = <&pio>;
-	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index a11adeb29b1f..a23543d7a11e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -70,8 +70,7 @@ touchscreen: touchscreen@10 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&open_touch>;
 
-		interrupt-parent = <&pio>;
-		interrupts = <155 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&pio 155 IRQ_TYPE_EDGE_FALLING>;
 
 		post-power-on-delay-ms = <10>;
 		hid-descr-addr = <0x0001>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index 4864c39e53a4..306c95166f3f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -48,8 +48,7 @@ &i2c0 {
 	touchscreen: touchscreen@10 {
 		compatible = "hid-over-i2c";
 		reg = <0x10>;
-		interrupt-parent = <&pio>;
-		interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&touch_default>;
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index d5f41c6c9881..382e4c6d7191 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -54,8 +54,7 @@ touchscreen4: touchscreen@5d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&open_touch>;
 
-		interrupt-parent = <&pio>;
-		interrupts = <155 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&pio 155 IRQ_TYPE_EDGE_FALLING>;
 
 		post-power-on-delay-ms = <10>;
 		hid-descr-addr = <0x0001>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index bf7de35ffcbc..adadfc653f39 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -890,8 +890,7 @@ cr50@0 {
 		spi-max-frequency = <1000000>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&h1_int_od_l>;
-		interrupt-parent = <&pio>;
-		interrupts = <153 IRQ_TYPE_EDGE_RISING>;
+		interrupts-extended = <&pio 153 IRQ_TYPE_EDGE_RISING>;
 	};
 };
 
@@ -918,8 +917,7 @@ cros_ec: cros-ec@0 {
 		compatible = "google,cros-ec-spi";
 		reg = <0>;
 		spi-max-frequency = <3000000>;
-		interrupt-parent = <&pio>;
-		interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&pio 151 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&ec_ap_int_odl>;
 
-- 
2.42.0


