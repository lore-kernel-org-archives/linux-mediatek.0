Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDC9D58E60
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ly6u8R7bmz5Bdr6kesmUkfvdxyNrxQnN2igtDps6Mw=; b=TOu7IN4uBbQYjm2UKKE+b2xvx+
	Yz6KDlLMjSkbzGW9bvjPVtTvQn3cC/FBqUuWw2pLoYUEdqEEqTa1124zdp7kKKpxL6036U8vQPxCz
	tomQlmKdwiZl4v4vg6C35OwVtbp6hJfJWNWk2oYsOfMFE/zwd7VcFB5HoU43m/ui+8Hkjc5AIo+0N
	sv6nDbRFLRhUID4KKyHhnguwwmZRGBYkEgWuBDtonDmfMB4HdsWRUtbjC9l1jSdJDTFf0QUVizTV2
	DVTEKd+MZCQ0NF/1hZqp0DTd+I2SZP5pjg6ShWsFKpkwQh39vvJoM1i5vLqLDCr7mf1IQncXjEuOF
	ffuluCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsY-0000000CIn2-1DEg;
	Mon, 02 Mar 2026 05:31:38 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsV-0000000CIlU-2NZ9
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 05:31:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2aae146b604so31708965ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 21:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772429494; x=1773034294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ly6u8R7bmz5Bdr6kesmUkfvdxyNrxQnN2igtDps6Mw=;
        b=HwjjvuJKctHASX7vOMuUFTIG5d2AV1IYzJe2uW8QHEHDzrjvGvyY1WFmSjR0G0Lqmp
         SzC9jjB6BbpIQ3U+oZhiAfk9o/pCYalyAt5tNVvN0a3C62FDtjp8iGwmvllFsvqNdTrb
         2WYnMP9QO0roOGwQNPgXYerV3ubMiad70IW1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429494; x=1773034294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ly6u8R7bmz5Bdr6kesmUkfvdxyNrxQnN2igtDps6Mw=;
        b=q5WfsZTdkOj9/TIbjkkePqOND32MBgxknNjRlNfnhDovgN3skHm4ywY948XR0WxMdd
         r/zrFgacqMuP861H5w8UCrEZ4F0aFGmf0g7wugGUhPJ5tnX9bLvOcql6NnoTOxjvxZog
         OkkD3zXg0ljXext+a0xqvUT422hTJICPajy2I9YWN1O/3FN9H0cSGvUgUjwvo98GK/6Y
         22u/sy9x5jIza7f77jJ6WFVPAh7F2a+JW8H+iznzNANP2VHbl3yHT+0FCzHGfOXRxCRf
         L7bd5VNiC1YRd1KnQly5F+vX3e8Ux4VpKGxl3ahL4F+5F1l/p1lpx9ikGUf09+DtbFSI
         mSVg==
X-Forwarded-Encrypted: i=1; AJvYcCXu+L1F8NYUUj6uYmOpq7EFqc8qZ2czD0VH7T+yvtyWS3jTy9d70/KhklKSqOZ4yIBc5hMIyE1ZUz7PSuQcrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxOq3dPpmOeW52A8P/XNjvctA/pPtH366d/4H5AfLKH2xTDsvb
	0bRfAAO+HBqHTxhLpETKkeBVz/IOp4s/xE7P3uztTmXHLNvo/Ll3P/nC9XQdLf3+WA==
X-Gm-Gg: ATEYQzysxmiQjqtaCWCdOKnFHk3uQDoATWxgQc+Z7b4aHX62nVOlCWCuF8Gbg9GfC4s
	jahK2wk5ZgmaBwyDJ2zjATQHjse0ROk7SXTnQYTqxy5Z9YkNIQfCvGeMp9bMbNVu8KfdgzD9Gh+
	+jgsFHFuf80ZsLLWlvFbjCK9i4qm6Id4U0y+zFTy7gtpddew9ErcpF/A7RGzoRrGGi98opAjM0X
	3Q3eSMLUVMhX+5vUkndxgB+hbqhsdBWJRbo/K1LrQ2vxa7mx6lAY04D5DXIGI/aZ5T13MOnLrV2
	gY2QKlmUx5lrdvJ6OUyhsfJp9kKWcMYbF0F0RvOyEUxh9A6KJR3f+tikPH3ViIfFVzSPLJir6GS
	+XWuxG00fjHnOVf5J4tuD+lrLJit0aK75tBOYl1PA48yX4aYz9+Kvov4mA0VqkI1ImBKmyR6fFq
	8rCNkQqeYxm72SkNeiGONug4SJ7S5puipmx5mWSR6ycHzi1/ylL7QZntfeUZKp3XspPmkyZCq55
	DLWv4L0
X-Received: by 2002:a17:902:e74b:b0:2ad:ae4f:3458 with SMTP id d9443c01a7336-2ae2e4e2c8fmr110384055ad.55.1772429494577;
        Sun, 01 Mar 2026 21:31:34 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b9b7:93f7:8c3c:59d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm15196435ad.23.2026.03.01.21.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:31:34 -0800 (PST)
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
Subject: [PATCH v3 6/7] arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe and BT USB power supplies
Date: Mon,  2 Mar 2026 13:31:06 +0800
Message-ID: <20260302053109.1117091-7-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_213135_618137_C92E597D 
X-CRM114-Status: GOOD (  13.89  )
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
2.53.0.473.g4a7958ca14-goog


