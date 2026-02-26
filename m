Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C382FC5907
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZd4wVxGyLj+wQvrtlXscalBZuclzdirQcI9cd7xMNY=; b=4nRpgHcB/GkMnWkOJLSYFhVbqr
	7LScKIrObQGnKgZCz/L0jf90FXceEwkO/gPsdzk3zaPPZetXKDPTjRQhUBaaiOrle88zZQfyuSS1c
	FxduwLcr+d8nffT1Al07fqHQ750jzKtwEyrHnRf2f3SqzeI7AhDSEXVA7qLxE0A9VEQvvikWbrpYv
	7CCttLmt4fVn7PSYnzGorijquj99qCAR4WOzOk5TQiZLcblAmea2PffD2Jhg1rCOtyGtgnJueeMS7
	dJlRhe9kI2eOgBYW4owdFAaeDo1beeQQNuddv/4zt45v4su4O45eYToZsRBJhwCNmUdJ6JZjGaBKk
	O8nhzAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5Y-00000005bAX-0QB2;
	Thu, 26 Feb 2026 07:47:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5V-00000005b9e-3j5y
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 07:47:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2adcede372cso2151935ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772092029; x=1772696829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZd4wVxGyLj+wQvrtlXscalBZuclzdirQcI9cd7xMNY=;
        b=jvxtosEpF4k/nUbhJDCzSgo5zPPovl16dffXcUVaGGTBt/r7Ftp1ohtsKuJllfU9cl
         PUy5zVHjE/kHtV/R0sIqwSaU5nRN7zG+FsONxZmU8CNGO+yQd6UN05k1pgq9vQHmyltM
         7DXbqUbljquZG9wCX+LJIYXuvAUxRcIbhVSPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092029; x=1772696829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZd4wVxGyLj+wQvrtlXscalBZuclzdirQcI9cd7xMNY=;
        b=rUfx8YlMV3F9ImconCks3Z+Mh3nFiywt2GRkSaoJLE6mfX+qYbRshZT/p6bD7jHaiV
         PGTygsuTjbKE/d3l8bLOQy1rffDOAj7v9Pj7cWlr80Co6KokW46meAPEpFSKjx44KqRD
         t8LWI6PAZhObZ/xCajw/Z2LZvbkQYJkh1PlIU5LavRn+OzQaxWwbX9jyDl+YI4IkLEjO
         Uw9IFgU9yIUfN16F6y0evZKl3oiOwzmtalJmeuIvqkZYwOXXtESMbcoP6RKBqnOOZgg8
         ROQEQ6nBKGAVEltp9qtkgDD/QX9kEo4KUkNtdAChqCBLcFsgf/aNHRmDKxs2UzcFjITt
         WDDA==
X-Forwarded-Encrypted: i=1; AJvYcCU50YNFtZaPRz9uIhN1vzNpQuCHEk3YVBIB+c4P2iJOYPUfniVq4Z/pCx0TRDS2r4FqYzVyFQoh3ZH2Mwl6WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCxjLuWxDlZdlGeqjwOCAT+/tLc5THeN8PaDslnpiiZ+aTKgl7
	KaX0qXQnqWEyrBrwDzVQj2COhA+NyICAgYnwSfANp0tpVRX4iWOTqDOhp/Qi/joQLg==
X-Gm-Gg: ATEYQzyxir45Dp4KukknjGTwf8ufYkzim/RBV629tBkQPJ6yUciIt8X9HwZfKYp5tCr
	70IStYC6m6+AmYPUX4fPj0YFQejiy57VcdF0RG6B6ENWNCl6j9tBNC/DUj8W8pKiBQdsuSgrIG7
	uwxNQTbL9V/vb8pYT/SQM1DxzD5TD5sRY+NRtvWH6xzQ1hB+yLrMNfAQu20AdNo5pM9/oDxfJnc
	5wZFFvIJw4g0LX2SxqH5HiFdd8/pP+d7cxzDgc+8pi4EaDjf9bVgxBK8sK8YaUSrkbALzw22sPp
	WAJNppPLxg9Qu4tU1CMzHbyBInvCeA6BaT9aLy1F7nm9oPRfqyaBJSgYMELCjSgcFSuqRrN6bxN
	KK1ZWTmWQUAKzkkIyC6vjmHDP2MvkmOT3OT5vnzP0tEwYRBgsCiBoPhmu8fVcEFJ2eRCZZ7Pglb
	ige80KPV9VcYw1FPMPg0qbhxZC/IfoPXTltDVJwN3+77umI5qjnp7bmIng3rKekQ3WJdar6PIXW
	cgAOa4H
X-Received: by 2002:a17:903:11c5:b0:2a9:322e:1964 with SMTP id d9443c01a7336-2ae034bd66fmr17012505ad.31.1772092029298;
        Wed, 25 Feb 2026 23:47:09 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bf01:7f64:477a:2f97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22f3sm15238245ad.12.2026.02.25.23.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:47:07 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power supplies
Date: Thu, 26 Feb 2026 15:45:22 +0800
Message-ID: <20260226074524.3808081-7-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260226074524.3808081-1-wenst@chromium.org>
References: <20260226074524.3808081-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234709_928467_1917FDA1 
X-CRM114-Status: GOOD (  13.78  )
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

The MT8195 Cherry design features an M.2 E-key slot wired up with PCIe
and USB for a WiFi+BT adapter. Previously the power was just enabled
all the time with a default pinctrl setting that set the GPIO pin high.

With the PCIe slot description DT binding in place, the power supplies
can at least be added and tied to the PCIe and USB hosts. Once the
M.2 E-key binding is merged, this description can be further converted
to an M.2 E-key.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 47 ++++++++++++++-----
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 6e99122c65ac..f1ff64a84267 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -83,6 +83,17 @@ pp3300_s3: regulator-pp3300-s3 {
 		vin-supply = <&pp3300_z2>;
 	};
 
+	pp3300_wlan: regulator-pp3300-wlan {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp3300_wlan_en_pin>;
+		regulator-name = "pp3300_wlan";
+		/* load switch */
+		enable-active-high;
+		gpio = <&pio 58 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_z2>;
+	};
+
 	/* system wide 3.3V power rail */
 	pp3300_z2: regulator-pp3300-z2 {
 		compatible = "regulator-fixed";
@@ -760,10 +771,25 @@ &ovl0_in {
 };
 
 &pcie1 {
-	status = "okay";
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_pins_default>;
+	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <1>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		wifi@0 {
+			reg = <0 0 0 0 0>;
+			wakeup-source;
+		};
+	};
 };
 
 &pio {
@@ -1179,12 +1205,6 @@ pins-vreg-en {
 	};
 
 	pio_default: pio-default-pins {
-		pins-wifi-enable {
-			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
-			output-high;
-			drive-strength = <14>;
-		};
-
 		pins-low-power-pd {
 			pinmux = <PINMUX_GPIO25__FUNC_GPIO25>,
 				 <PINMUX_GPIO26__FUNC_GPIO26>,
@@ -1222,6 +1242,12 @@ pins-low-power-pupd {
 		};
 	};
 
+	pp3300_wlan_en_pin: pp3300-wlan-en-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
+		};
+	};
+
 	rt1019p_pins_default: rt1019p-default-pins {
 		pins-amp-sdb {
 			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>;
@@ -1570,11 +1596,10 @@ &xhci2 {
 };
 
 &xhci3 {
-	status = "okay";
-
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&usb_vbus>;
+	vbus-supply = <&pp3300_wlan>;
+	status = "okay";
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.53.0.414.gf7e9f6c205-goog


