Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B97C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 06:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9G/I7mRpW1EjYS1FKv7X4+2cza+OStmBxCDvRHFGBo=; b=cMPRInYrNAHQru
	Kba8BzEG4R5Z7PR6hVJ9jcmglZ8EbvPWT53y8JOR1XcsV5xGqXki9UuBOlY3PwAoLU6MaA3c5kQm6
	Dr6zj36GdXNYuMJ2yndkb21zgf8TUTWv2cg/lciGOKolvNIKQhntLFc6uqITmw8lwU1pgr3b5SO6N
	cXsU06AFfhCKhBsWJc6G/A32gaqQrTJ/ohbLy9ZXnX9jAIMNS3qYRemGnrzHYFmR0VDGd/QY29JWI
	g1Y8uwJlOsJWlRU84T32oiAdBWl+Sivo+WpBuOpMiAPf8c07CyqacSppXkES+5REMPPBysUH/3TBG
	S7WW+M5TC6i8cXDOzg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpPg6-0011mP-Sp; Tue, 23 Nov 2021 06:53:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpPfs-0011kT-T4; Tue, 23 Nov 2021 06:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=NUFGi8YhDsKFVbFkZqAy1juu/DkEoa0y3FvDQYAV274=; b=QPvh2oQsGtoAswhxyLzuroxGSc
 TP4YJm0XD4HQLvC8120i+pfSDe6SnySZMCIkFS9H+ftwswuu3FFrb3xoM8n1SAQFJMaIMXNG9bFwz
 1DoMfGYDdP9juRxfZuuzLZJ+tf5d5mEVFudI2nzbZiY3zYcwXNBOc/R+fq2cnkdf/MNmGZOQX4qK5
 kOyunQ8jHLWjqct+sRhvvK7NxRH5WxSB+Jjl2tZ3YVLVNyqdTh0x9CT4A3B8APAcjG709cQXF/yb/
 Y/tFsCQd+UBqPt+luVXh7aYOxFlH9CIYgiFguj7gibdMfZIqeZD+27NGlGTv+7SvF/jZbwDnOCaEy
 28/iqwbA==;
Received: from mx1.riseup.net ([198.252.153.129])
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpPfo-00Deaz-4b; Tue, 23 Nov 2021 06:53:03 +0000
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4HyvwB34LrzDv2X;
 Mon, 22 Nov 2021 22:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1637650362; bh=2crRhYBlklLB+/OAkE79DuwqwJdO0OVKUmuw9Rbx/s0=;
 h=From:To:Cc:Subject:Date:From;
 b=a3ZcqkLIwwPx12xnNt+1HVT/uXYXrdX+fUUOhyaC/zqsYGYaWQ8rBS/tuNXSVV7NR
 Codl/V0ndNaKzOcafwvJH1/4gNTqmQjJ8YU7GLqwHJM1gYyBdRhFKtBRHa5BvyBlF0
 0f3wE383rvsKBXPyOJsizuDJHOZiqgEp9PCZsETg=
X-Riseup-User-ID: 8F6499043B028B14909275667E193D2CE092DEEBFD8526408BBAAD791A8AF191
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4Hyvw62NdVz5vcc;
 Mon, 22 Nov 2021 22:52:38 -0800 (PST)
From: Dang Huynh <danct12@riseup.net>
To: Dang Huynh <danct12@riseup.net>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] dts: treewide: Drop input-name property
Date: Tue, 23 Nov 2021 13:51:58 +0700
Message-Id: <20211123065158.1383182-1-danct12@riseup.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_065301_231861_0A89F4BE 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This property doesn't seem to exist in the documentation nor
in source code, but for some reason it is defined in a bunch
of device trees.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts          | 1 -
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts             | 1 -
 arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 1 -
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts              | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts         | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts        | 1 -
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts        | 1 -
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi                       | 1 -
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi             | 1 -
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts            | 1 -
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi     | 1 -
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi   | 1 -
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts              | 3 ---
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi    | 2 --
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi        | 1 -
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts | 1 -
 16 files changed, 19 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
index f8c97efc61fc..0cee62c7b8b0 100644
--- a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
@@ -19,7 +19,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index ea15b645b229..6d77e0f8ca4d 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 30ee913faae6..069136170198 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -450,7 +450,6 @@ bcrmf@1 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 003f0fa9c857..96e1c978b878 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -349,7 +349,6 @@ bluetooth {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
index 398a3eaf306b..79e2cfbbb1ba 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-amami.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
index b4dd85bd4faf..e66937e3f7dd 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
index 9743beebd84d..a62e5c25b23c 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
@@ -20,7 +20,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
index c7c3e7d8b3c8..1eabc69462d4 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
@@ -75,7 +75,6 @@ led-1 {
 
 	r_gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "k1";
 
 		k1 {
 			label = "k1";
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index fcddec14738d..7a717f926929 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -25,7 +25,6 @@ optee: optee@4fd00000 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_default>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 69fcb6b0398d..84558ab5fe86 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -42,7 +42,6 @@ framebuffer0: framebuffer@3404000 {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 3a3790a52a2c..cc038f9b641f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -62,7 +62,6 @@ divclk4: divclk4 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		autorepeat;
 
 		volupkey {
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 7cc564d8ca7c..dde7ed159c4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -29,7 +29,6 @@ / {
 
 	gpio_keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index 3d495ce3f46a..dc5b9b274df3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -29,7 +29,6 @@ extcon_usb: extcon-usb {
 
 	gpio-hall-sensors {
 		compatible = "gpio-keys";
-		input-name = "hall-sensors";
 		label = "Hall sensors";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_sensor1_default>;
@@ -46,7 +45,6 @@ hall-sensor1 {
 
 	gpio-kb-extra-keys {
 		compatible = "gpio-keys";
-		input-name = "extra-kb-keys";
 		label = "Keyboard extra keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_kb_pins_extra>;
@@ -102,7 +100,6 @@ alt {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "side-buttons";
 		label = "Side buttons";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 91e391282181..47488a1aecae 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -93,7 +93,6 @@ vph_pwr: vph-pwr-regulator {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		label = "Side buttons";
 		pinctrl-names = "default";
 		pinctrl-0 = <&vol_down_pin_a>, <&cam_focus_pin_a>,
@@ -126,7 +125,6 @@ camera-focus {
 
 	gpio-hall-sensor {
 		compatible = "gpio-keys";
-		input-name = "hall-sensors";
 		label = "Hall sensors";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_sensor0_default>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index e90c9ec84675..42af1fade461 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -90,7 +90,6 @@ cam_vana_rear_vreg: cam_vana_rear_vreg {
 	gpio_keys {
 		status = "okay";
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 45eab0235d66..871ccbba445b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -42,7 +42,6 @@ extcon_usb: extcon-usb {
 	gpio-keys {
 		status = "okay";
 		compatible = "gpio-keys";
-		input-name = "gpio-keys";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		autorepeat;
-- 
2.34.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
