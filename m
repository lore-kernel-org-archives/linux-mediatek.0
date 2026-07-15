Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC511C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=; b=b68yqGTP+0i/61HhuQzYy/i/z/
	V/mv+gAYdoTzaSj+xF8byJyUv8iFvwl6XsdN/rvC75DzJVF7xa3dvqsn4200R1ntVcJuQBQnIhcBG
	4A3AFwqg6FadUd7DwWZtYeDXHoStqg6w74lO8Jf0ATXRU/DuWQAtsqIIgYy5PuWD6Nc1uTAiyuqvj
	ldNqPVI+JVlLe8rIGwWBfrR6IdKTpOcBOQ+o7NRXwehmOgWzuiSwtJi8a6X4eQXw4Q21WPRwvPeW7
	wwdy7nUpChA5UcUClPKTXLCt8jyxnyDT7U6FC0eDUSo+cvrPZPxwG/wejQT9LY60nAsclwd0PNYXm
	r4U4jsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvPO-0000000EF0S-0U1L;
	Wed, 15 Jul 2026 08:56:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOr-0000000EEXR-1uXf
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8487214ad2bso2681382b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105729; x=1784710529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=;
        b=nxCXfGjhT5YIIr5R5nW21+2NW6MSnCu6M1XF5eNXS2ms9agjADs/LWO2GY834YY7Ce
         ys8to8ccq2UGqHl3pxptvHzO9Ayi1MPIP4L9Y6GRt6lN8nO2RZrkmiUtDacxvIwoaAFd
         DEDB0+/y6eMnnDiVrywH1Sv4KueSxK+rn0vcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105729; x=1784710529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=;
        b=SmwrYbHDUsj+6jDcQM8WoZ2HSm1ya2C0BV3YuMyiEAdpEtAUAVbvA/Wd0XePSbfGA4
         VySKtA/meaIISzVuWdgtaLK2EOk0CzrY8w8iXU+AkgHeroZetyrtt+XMG6MMJe+EzE1o
         qJt10dRC/rLGfAlHBGfwPma71H5ATNoKScH14vNMmqwcu6SuUBez0H9DY5sN1w4zlRXK
         kquj3d1iBlfXwf2apbXue34QRfuiOiAYqe6JrIa5dZeQGHBAT5t2WwjYisHfwdeSmGBS
         Ps3RZNcJWi9NbVw+P/vxzkZ7nsogxx8Zfk1RQoHo6Dmd1NjGf5zPIHNxpAyUFl6jZr0s
         rxaA==
X-Forwarded-Encrypted: i=1; AHgh+RqvtT8834zd0bFbYvc94az9Jkg8Gv5oDNQRQ9XigYSgsgY3sgyOzC0XYyDRPyWrYTCXax34YO50xmJM5zI3Ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXDhDUFThTk3SJkae1VRzgxUFIV3dmonhOkQ3kXXt9VG2D+2it
	McaQFfurXhpAFinAY8K5BLDLeVOQ9fZUdTwwCZqLKLwlU+4a9AMpLdZVC77X0bROig==
X-Gm-Gg: AfdE7ckkLZfKNpNKCxwyD8Z4aO+bGnsX7K7UB2HdWkFvirm7qa44cSNvZpPp0tvXBq5
	1rKAm8oREgxZ06G1StckKrOty0/h/sqU4+XBSJnXSTph2p8lwGLENNbX8Qkaag9jSwk2MsIYGmW
	o43ojv0FZvxlpBgS4P8h3TbOeZV4Z0/Xx5oA5b0/UjPkng3Nl03prQiRewRuP/roLOgMYfP+F41
	A8zsmeD2RxMslFlh2bhFFFLBncwcwJqvVO+utDS3dhub+njyFaOi8KYqIGDJ6O6XF0nCFx163ug
	b7CWIJpWZCTw57bFPe6P6tkY9SXVB/wtvnFFzub9ayMMatyCFjyMZSjVxz2iJGUZlcBTKWr4qLS
	mk6tpGHY2WcxGoOnVrz3576GWrfOvCb3XUN7k66iME9Tfs9nUU1Z4/7sbW6ZO+wAz8gbSxVx5jT
	uGH45Js7uxM4R/7OSlGQ/53ONS9UUxNMOjqGHf98rfQkbI1QHzbYUkj3DnaOnhFMzmxmgimlWi7
	fdLncde
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15382339b3a.56.1784105728841;
        Wed, 15 Jul 2026 01:55:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:28 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 15 Jul 2026 16:53:45 +0800
Message-ID: <20260715085348.3457359-16-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015529_694360_5C7720BF 
X-CRM114-Status: GOOD (  13.92  )
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
2.55.0.795.g602f6c329a-goog


