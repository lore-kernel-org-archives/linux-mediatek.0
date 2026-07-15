Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47F2C44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzcA9TG2yqej8iZO6JRem4wjlVQiv9Z5qdYjer6rUOE=; b=ruO9z1rddaVow4SJcpMQ0Jy+CU
	Sjs+R57M0tAI/FyOzONLbWZwWFFwPcg4PdKp+p8co84YZr4ZIoWcadVHd/1YAAFVmOJ6MV7eoQTiX
	+Mx5AlZygtqFuTGhbmzlLhAWLzTcVuu7wrqW82WqIoIoqAORPTRhZD5oXogTpKlDM2StVb1HqGYbm
	96dBqmVapvUAGiyNGXPjLB4wRUr4u04+wuKOVRH4+1DFhaehT31FdP/aUFV/B6j/ACPPBSFnBaxcs
	C8svTwBO1+goLod/LFvkvoLSlOJTrxO2k/egVMcNpOumpsVPrl49xzD3cfc0NTPH/M2jQzvrHnTaV
	upClzQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvPN-0000000EF0J-45pJ;
	Wed, 15 Jul 2026 08:56:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvP1-0000000EEkR-1W3A
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Jul 2026 08:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fzcA9TG2yqej8iZO6JRem4wjlVQiv9Z5qdYjer6rUOE=; b=MzfAKs8+scl8Jfu4zT38I7jUzn
	GBEhrygqWUzHpd837bNBHzDrEAyei462gZoROuyuA8eroEYTZS74ZhcU0c7lKYNDtbQWZ3FeqyqBZ
	uuAI1fNV95aowVr7XLziW2XLbYguizKm6t6V8ydNnE56lNEZniqZV7oxYHMaWzmwRu3pdxFISq+RR
	+W/6uXOgVhm0lxbLj6yyTLg5pIv00WhN7AJ0OkwDxLD0cJMf0aPQct5GeqNSTnI+kF3HhMggIuqu8
	PQNm4PfyrrUgPY8+giazUrA3EuL1459VqBEeRpYIGishBn90353VHbwThr/w5bD72K5slt9/jig1N
	dWOoaqDA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjvOy-0000000D9BE-0nRR
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:38 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1732427b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105733; x=1784710533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzcA9TG2yqej8iZO6JRem4wjlVQiv9Z5qdYjer6rUOE=;
        b=OAFd9/BxX7kfeMu19mB1wKIOHlIt5VzB9Kw7Z2Xna6YCjhL4tcnUt3dPkKWngGCbuY
         aP4rQSSz1MB/JZL0G1TBDnzJFiWasYdf1IcpZXFYmks5WcTFuXPRfjj443XdHZZwPeO8
         k/ynIVT3No4qgWwp3YYEz27ES1w7AzSooU3nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105733; x=1784710533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzcA9TG2yqej8iZO6JRem4wjlVQiv9Z5qdYjer6rUOE=;
        b=TzjX1Cj6JeEq+g5l3GWc3tqMEar9LSpiVaKw3kba/UZXV7OAj99iT11qTGX8liVWxG
         yQq15tQ0jILDnJrWSFWKGxe34btBFJVks2Z5MS6d0W971kC1WOMB+CK6Lrv7MbxFKr21
         WLqdV4lu677N0pEqRMEvmlyoOfSY6yJTdUDweJU9yddXhG0Lwl/kgar/38Fygt8cNSG8
         43enSY0tvHAYTkl8z5CTW+P8ws/GISezCWpGovqSHasN39gImHsQd6LtXjIHCxR5JYi2
         o+uK7HrX1cbB42r8S5W3p/+2nwBMnRpmOhXhnX/+kXZ4ZYuz+Y1H/LElmoDbrC99oazk
         hO0g==
X-Forwarded-Encrypted: i=1; AHgh+RrUpq/Yp5aCPXMgOqk5gl7jQAuqaZ/szwHVrUBeQeyqOjVAU3fTuidxI02LIwKJie30sd/+k1KCd/kLgkV5xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI7Hle3yI6rq9SrrjExY2OOsbfUz+q3LO9aHtK2LmYcIG2kMQJ
	JrAQCZMnZjkufJ8l68E/hvq/JqyAqiwdyb8xEm6U+Kc6pLYYEXZxtQRLrOMkExdTbg==
X-Gm-Gg: AfdE7cmCew7I7GejhHx6gTdgWoD/ne9Oppka1pOkyl7MfFUGHV5GjF4kOyVMwQ2oazj
	8Y704q/SUikUV+RfDMZyEy/zekMyf37vzremBvyXYs5ahTEt82e3Rw9WGM3aBXa4l8PWM5FTi56
	1YgX4uBaqhM+zoKojDP83FkUsY3cWxCgYkvduMMB+srrKL0RGTSS4KTJmYrpoZJlL4ftswoMlN/
	cEJtHq0zZdnFDWBGFCCb92ANMb2PMeP/DrgCk/8U9xmDX0zfYOM2SlP6OPrVd0ia/Nb0rsUMiBA
	afcGze3PooGbMjCI3wxvPJMIGMyM2Z8cbV6CuzbSfdnRIhV80YzCu0qPYBjF/4by/jIYzgzu1Sn
	AmftZ3UZQXAnkUppG7wA0h0ZAMZIxvXBBSkNz7v1XYKlhmhzKQkXUPyZXZd6rYjr/Q7dbhjezUX
	TVo5rgtvU9x3NNcmdot5PNLttZ2Fhu/03dsdhjttVuCSidupYvRSyH7mbiaODExLASADscXw==
X-Received: by 2002:a05:6a00:368d:b0:848:56ff:6ced with SMTP id d2e1a72fcca58-84a6723d613mr1884956b3a.8.1784105733495;
        Wed, 15 Jul 2026 01:55:33 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:33 -0700 (PDT)
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
Subject: [PATCH v5 16/16] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Wed, 15 Jul 2026 16:53:46 +0800
Message-ID: <20260715085348.3457359-17-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_095536_554975_8038FE92 
X-CRM114-Status: GOOD (  16.22  )
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

The MT8188 Geralt design features a chip-on-board WiFi/BT solution. This
is a M.2 E-key WiFi/BT board layout directly inserted into the mainboard
design. The connections to the rest of the board are almost the same as
if it were a separate M.2 card. The only addition is the PMU_EN pin on
the chip; on M.2 cards this would be tied to the primary power source.

Model the chip-on-board WiFi/BT solution as a M.2 E-key slot with PCIe,
USB and auxiliary signals. The PMU_EN pin, which enables the internal
power controls and regulators, is modeled as a regulator fed by the
pp3300_wlan regulator. Since power sequencing is now correctly modeled
using the M.2 E-key slot, drop the "regulator-always-on" property one
pp3300_wlan regulator. Also drop the comment in xhci2 saying "MT7921's
power is controlled by PCIe".

Also drop the voltage range on the pp3300_wlan regulator. This
"regulator" is just a load switch and does not provide any regulation.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index dee946309121..73b5c0fdeae6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -88,13 +88,11 @@ pp3300_z1: regulator-pp3300-z1 {
 	pp3300_wlan: regulator-pp3300-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_wlan";
-		regulator-always-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&wlan_en>;
 		pinctrl-names = "default";
+		/* load switch */
 		vin-supply = <&pp3300_z1>;
 	};
 
@@ -161,6 +159,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
 		vin-supply = <&pp5000_z1>;
 	};
 
+	/* PMU_EN pin controls internal regulators and power sequence */
+	wlan_pmu: regulator-wlan-pmu {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-pmu";
+		enable-active-high;
+		gpio = <&pio 145 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&wlan_pmu_en>;
+		pinctrl-names = "default";
+		vin-supply = <&pp3300_wlan>;
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -195,6 +204,39 @@ adsp_dma_mem: memory@61000000 {
 			no-map;
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie1v8-supply = <&mt6359_vcn18_ldo_reg>;
+		vpcie3v3-supply = <&wlan_pmu>;
+		w-disable1-gpios = <&pio 13 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 14 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &adsp {
@@ -659,6 +701,22 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
 	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
+		};
+	};
 };
 
 &pciephy {
@@ -1002,6 +1060,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO13__FUNC_B_GPIO13>,
+				 <PINMUX_GPIO14__FUNC_B_GPIO14>;
+		};
+	};
+
 	mipi_disp_avdd_en: mipi-disp-avdd-en-pins {
 		pins-en-ppvar-mipi-disp {
 			pinmux = <PINMUX_GPIO3__FUNC_B_GPIO3>;
@@ -1174,6 +1239,13 @@ pins-bus {
 		};
 	};
 
+	wlan_pmu_en: wlan-pmu-en-pins {
+		pins-wlan-pmu-en {
+			pinmux = <PINMUX_GPIO145__FUNC_B_GPIO145>;
+			output-low;
+		};
+	};
+
 	wlan_en: wlan-en-pins {
 		pins-en-pp3300-wlan {
 			pinmux = <PINMUX_GPIO12__FUNC_B_GPIO12>;
@@ -1417,10 +1489,22 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci2 {
-	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
 	usb2-lpm-disable;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb2_ep: endpoint {
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.795.g602f6c329a-goog


