Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31765C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpPVT8Dc4rsd7+Cy/PRWiKisx//FM/DZEFs1R+jF/Vo=; b=G9kT14qri/7YWUGqb3ryAEpanT
	k3AADtq6Ldi4us0DIr2x1NK4NEciHBhHc3lObuV3sjuDfPt+aZjHgIa4iF0alHMgYfX715zCv0IoI
	IhxqvnJyU/pvzPtGjSDhW98zmoLXKI5TOateylmo0XFNz7T0TMP+jKvSJ0gWjjY3El4D180ynHNkh
	6FzbWXGObb7YPShnbsxtovJ2e5uK3NSBJSF2R++0OhuKFJHxllwscEsgRkqy9BLmyhqnKa7+xua3W
	MglxX4cpTdknJ1B6XyqC8JJXseuZRYJL/sKKR2Ko0ax1z8aLuKF7qkEXer5uNvurw9OeCFdz7NVDu
	nXbOWJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Oe-00000008bNr-10vy;
	Tue, 21 Jul 2026 06:56:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OJ-00000008b3Z-04av
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:53 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cf52d15d88so25297365ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616946; x=1785221746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpPVT8Dc4rsd7+Cy/PRWiKisx//FM/DZEFs1R+jF/Vo=;
        b=KtAOL3dAx7IJjACb08uukp04Ak+ohhr3bYNJqTqjeB4rKZJVUTFZ00ig/jIUEfVxbd
         zdq0V3R+cIY6EnQyOs+Bf7XfbEP7oTrmwK9pCUi8pD1A5NlOUm0UE3WoBusW81obD2wO
         GGzfuPr/ZHcT44obnnMqiBxQwYYziUOxZI/d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616946; x=1785221746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpPVT8Dc4rsd7+Cy/PRWiKisx//FM/DZEFs1R+jF/Vo=;
        b=fHxIkobMbeu7Qty6e8wAaFzrmGst3nms04oNCr+5NbC8wwIkumnKDSUp58O04C+BbR
         rx19yO4EVVP+zlWrXfvSK+LJ900rdZ41Zk5u56tc1e7KQWo3UZm4o4HR3kbwtzVBxAYB
         a/dbgDwnyupwpSi5Cwa8I3ZdVtn0Mhn1AEqVL7RZold6YvvdsWlRlMyZBD1wSTSV2/po
         gG0W2vOUREIZPIqEyeJTH6XOmIdLXSmrlv9VZ1vWtM+Jlb0D6o8LF625tAvp1rhK/1Ui
         jzM8qpHdGneqVRdICIMvy4P5x0DA4tRS20UhSq9qlRb5ymqPYKOCDsnS0uhSljrIWdfP
         OU4w==
X-Forwarded-Encrypted: i=1; AHgh+RrbpQR7L7Ttb+YznI0e3oi0uy2M9oxYYjptfPEb79zmofZ/urZd14Qs6AZjQtKT4Yy37+RfjbxyzvUkJocUYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7v24Q69iMzZlEkn5vwcaW8GCf3tiNS0ctW4CAEgi9eA16nhWK
	/8QPhOj76g3KREyAUgR4GWMGz8s3l+T6DM+lyizhqjun9V27wQ30T3HQj8YaTxl4sLVEJh7u8Mv
	CF1Y=
X-Gm-Gg: AR+sD13/28WT69JyW9OJn0/L5GV1z5/4+uM6flI1yOZZQzSRsWtiegMUTj8eaWhiiUg
	uQZyLXf8R+ZB00aePkyPJ4EeQJYDEE8R0PrEbJIqn9jUB34SELOt9XBwrTiuLuOgBFZIhQV9kjl
	GvwfwbcZz1zgfarijO7Ja7orq5WZrlXpUPpwBRHznOrJ56RweKvEEMz7A6VcYoGOsW9m5h4pKL3
	pCuNsmnYWUd3QjhQan1F8sqgKrvjlZA6wSGDLiFQlz09alsVpG3u8PIOgRb18MMGjaxBZpbQTl9
	DUPYdkJv+8SN1IS0C6sFQK9Lkj22CFOuhks858J1SmD/gyJyXXN9vSRnxuQZowAE02PZni3oGLY
	NQMOYif1WydCsbMQjr/jWwscCS97TQijoNUCAIypV64Xph9qzkGo85ZKHpi9OQK87T0BOh3OqE3
	h2tHvlqJ68UB0W+AwaFl3OU7ax6YEgKV3m3hHHhUrdM/ljCvZYQnafLzCxVbjP/Gd4STHbmw==
X-Received: by 2002:a17:902:d581:b0:2ce:d34a:5963 with SMTP id d9443c01a7336-2cf3496c380mr178033695ad.24.1784616946307;
        Mon, 20 Jul 2026 23:55:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Tue, 21 Jul 2026 14:54:10 +0800
Message-ID: <20260721065413.2306137-16-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235547_095849_C88753DD 
X-CRM114-Status: GOOD (  14.42  )
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..8d4cc30d91e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -266,6 +266,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -791,14 +832,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1085,6 +1126,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1685,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.229.g6434b31f56-goog


