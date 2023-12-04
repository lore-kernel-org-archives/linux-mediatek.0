Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C51C10F05
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXDmR35PSwt5zimt75w5RuDKP6s87NauCjPbXnXkPPY=; b=ZbQL1/2aNJr9G9ky4i9I4FYwYy
	mSu9VYqwPtGRI7cPNZ3O8wKjFh7er2yts9bpWcoSysCory0ljEshUsChsu1sCS7nx6ObUQcE3Lspr
	NesXa1stMgari93m6YR7zeKNasyNt4xcV1tG7P78rWkXsQcfAP/jXSbafF3RsgICbG5ImMaBJcTcy
	ZfZdrb8gmXEW9g18sWL2WhhhWDRzvAfDBMnEAtU439eRhX4krP771mSccVe8TnBKOLS9r4g0WX5h8
	ZLuB5tKpDzcHM9xYYsHmhrHuUqJ0prw3QUeAA9frMsvI8UUCHa1M0hfoaGCsXvbHRcGl61tigC2yi
	dPIbve5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XY-003IhC-2A;
	Mon, 04 Dec 2023 08:42:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XE-003IOp-1m
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:51 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d04d286bc0so13336055ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679356; x=1702284156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXDmR35PSwt5zimt75w5RuDKP6s87NauCjPbXnXkPPY=;
        b=V6YqagSUjTuM0BAMXjWEiN84rKmuqoAesyF8mIL9zDud6DSNm8HIrNGoCr9N5hp8mX
         +pO7yBTAy4f7PL4Ya+rxjUIqch2AW436gxP+kaNKXSeU7SR1IjO14Lz+qCpYWYUaWJ1K
         J5IPqpBMa2zY0w0QZC+DoNy0YVHkMy01SSRWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679356; x=1702284156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXDmR35PSwt5zimt75w5RuDKP6s87NauCjPbXnXkPPY=;
        b=LRmzqe7bDp8Cna0oFw3uSRtv3zt2/XsS1c/Qa4IQDesWmwfRAiJrj9qvCTUUivY/+n
         /+NLWjMnz4zReDYdn7m4xX29XfA/3aqjVoGQ5e2XaEa8xKpg6BNxcAK9lGV5f8RKcous
         uuu7ir4YsbLAR0N49bwHv81LrGNLhYI0F2FRxi4xSVFWEPvB1EGdo9/ABJ4KBIECxzLC
         NL/fe0HZnoZIYd9qiZSVzm2HuRzFzVrWDP1oVYodFgaH9ZLhYfbHcOafk0HjiaET+RnU
         uNXPqAq5jLrhV4jdjcbwABRT5uWpgSQfyn49egGAcTJ7b81Z8MK7hqvSIeuh9/M7OMOE
         BxnQ==
X-Gm-Message-State: AOJu0YxV7D0m38krdueX9AZ28kGtgdrW7kqG+AUR6kFLdmx8EtA3n9BO
	WUTRZXg17buvOEq8YqrqUwY6zQ==
X-Google-Smtp-Source: AGHT+IGQFeUpgbN9ZYnZqlqWAKQZkCaHF3saYni6lBIywiJ3c2g6frOADBmwP2ylV276nH7EdGGaUQ==
X-Received: by 2002:a17:903:2305:b0:1d0:6ffd:cea8 with SMTP id d5-20020a170903230500b001d06ffdcea8mr1559097plh.97.1701679356080;
        Mon, 04 Dec 2023 00:42:36 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:35 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 7/9] arm64: dts: mediatek: Introduce MT8186 Steelix
Date: Mon,  4 Dec 2023 16:40:09 +0800
Message-ID: <20231204084012.2281292-8-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204084012.2281292-1-wenst@chromium.org>
References: <20231204084012.2281292-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004236_626960_DD265D7D 
X-CRM114-Status: GOOD (  18.56  )
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

The MT8186 Steelix, also known as the Lenovo 300e Yoga Chromebook Gen 4,
is a convertible device based on a common design of the same name. The
device comes in different variants. Of them, whether a world facing
camera is integrated is the only differentiating factor between the
two device trees added. The different SKU IDs describe this alone.

The other device difference is the touchpad component used. This is
simply handled by having both possible components described in the
device tree, and letting the implementation figure out which one is
actually available. The system bootloader / firmware does not
differentiate this in that they share the same SKU IDs.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Removed trackpad_pins reference (moved to i2c2 in corsola dtsi)
- Fixed copyright year
- Renamed touchpad to trackpad

 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mt8186-corsola-steelix-sku131072.dts      |  18 ++
 .../mt8186-corsola-steelix-sku131073.dts      |  18 ++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  | 195 ++++++++++++++++++
 4 files changed, 233 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 442af61b1305..7bd9471b89f9 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -43,6 +43,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131073.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dts
new file mode 100644
index 000000000000..eae17bca8585
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-steelix.dtsi"
+
+/ {
+	model = "Google Steelix board";
+	compatible = "google,steelix-sku131072", "google,steelix",
+		     "mediatek,mt8186";
+	chassis-type = "convertible";
+};
+
+&mt6366codec {
+	mediatek,dmic-mode = <0>; /* two-wire */
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dts
new file mode 100644
index 000000000000..a55375b95d0d
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-steelix.dtsi"
+
+/ {
+	model = "Google Steelix board";
+	compatible = "google,steelix-sku131073", "google,steelix",
+		     "mediatek,mt8186";
+	chassis-type = "convertible";
+};
+
+&mt6366codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
new file mode 100644
index 000000000000..47262bc499ad
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/{
+	pp1000_edpbrdg: regulator-pp1000-edpbrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1000_edpbrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp1000_edpbrdg>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 29 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_z2>;
+	};
+
+	pp1800_edpbrdg_dx: regulator-pp1800-edpbrdg-dx {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_edpbrdg_dx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp1800_edpbrdg>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 30 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&mt6366_vio18_reg>;
+	};
+
+	pp3300_edp_dx: regulator-pp3300-edp-dx {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_edp_dx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp3300_edpbrdg>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio = <&pio 31 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_z2>;
+	};
+};
+
+&dsi_out {
+	remote-endpoint = <&anx7625_in>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	anx_bridge: anx7625@58 {
+		compatible = "analogix,anx7625";
+		reg = <0x58>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&anx7625_pins>;
+		enable-gpios = <&pio 96 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
+		vdd10-supply = <&pp1000_edpbrdg>;
+		vdd18-supply = <&pp1800_edpbrdg_dx>;
+		vdd33-supply = <&pp3300_edp_dx>;
+		analogix,lane0-swing = /bits/ 8 <0x70 0x30>;
+		analogix,lane1-swing = /bits/ 8 <0x70 0x30>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				anx7625_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				anx7625_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+
+		aux-bus {
+			panel: panel {
+				compatible = "edp-panel";
+				power-supply = <&pp3300_disp_x>;
+				backlight = <&backlight_lcd0>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&anx7625_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	touchscreen: touchscreen@5d {
+		compatible = "goodix,gt7375p";
+		reg = <0x5d>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp3300_s3>;
+		goodix,no-reset-during-suspend;
+	};
+};
+
+&i2c2 {
+	i2c-scl-internal-delay-ns = <22000>;
+
+	/* second source component */
+	trackpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		vdd-supply = <&pp3300_s3>;
+		wakeup-source;
+	};
+};
+
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
+	>;
+
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x01, 0x04, KEY_MICMUTE)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+		CROS_STD_MAIN_KEYMAP
+	>;
+};
+
+&pio {
+	anx7625_pins: anx7625-pins {
+		pins1 {
+			pinmux = <PINMUX_GPIO96__FUNC_GPIO96>,
+				 <PINMUX_GPIO98__FUNC_GPIO98>;
+			output-low;
+		};
+
+		pins2 {
+			pinmux = <PINMUX_GPIO9__FUNC_GPIO9>;
+			input-enable;
+			bias-disable;
+		};
+	};
+
+	en_pp1000_edpbrdg: pp1000-edpbrdg-en-pins {
+		pins {
+			pinmux = <PINMUX_GPIO29__FUNC_GPIO29>;
+			output-low;
+		};
+	};
+
+	en_pp1800_edpbrdg: pp1800-edpbrdg-en-pins {
+		pins {
+			pinmux = <PINMUX_GPIO30__FUNC_GPIO30>;
+			output-low;
+		};
+	};
+
+	en_pp3300_edpbrdg: pp3300-edpbrdg-en-pins {
+		pins {
+			pinmux = <PINMUX_GPIO31__FUNC_GPIO31>;
+			output-low;
+		};
+	};
+};
-- 
2.43.0.rc2.451.g8631bc7472-goog


