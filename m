Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FCDD3C938
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 03:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js96B82vpvasO7dH54aWNj4yi7wPO0A7/Og4/faXgF0=; b=RtLBcjBnTX1NqNn22zwSDVk3fP
	YXgW0xv8o0HB1SVlZlwNrajEo8Gq0oSj8X07YxWlZyVQHLcP9jXMQUT3UdYz+ybvtDxuWA/DK3Iiz
	ETWX67KhOv2aZQQl1gqsrh8Q61h059CD9IaI1hh63SVzT9YTaNcXF6ahMGbzpgrN1UTPGeAVmdFIO
	BcfEGrVGek+ZWz3r9MqajcJWmYtSFlflSi7SPiy8Li1D99nTafdI1WHHhcwAVrhePyXv1uoDr5T1o
	GMN+dK6jGnLNjK9237nev8ph+kNT9amOZCfFh0PzEUmQhQjMBSc8EFxEIMhXsKysIAHpTmg3JP0yn
	oXq7ZJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ikk-00000005vlO-1XKL;
	Mon, 21 Oct 2024 03:06:42 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ig8-00000005ur3-2E4O
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 03:01:58 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e56750bb13so389261a91.2
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729479716; x=1730084516; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Js96B82vpvasO7dH54aWNj4yi7wPO0A7/Og4/faXgF0=;
        b=cc/b5LKF8AGQ3ebPThrlBh7+b9LpJOnpkXhoHbCUAQAAmLKth0lrnM+8YTl8FuxGWz
         9ycaY6RI3g+gJa9A8xbobc966L0XtOBoQgf1dtkK391dXdVotPdUcmrdKvLHvwp3EaOI
         IxnyymaCEvd9D7fVJcZrKkhExPPZthn8vr8oL1wavw9OS7oh6fP1zw7bUrYZSRNDUqCx
         cEx9K6vqOLOztVcGzOxs5MwDZe6FD48s0N0b2NON/6CwT+QFExCY59XLk/tjd1B5v6JG
         zLhb/vn7z57BmjOJOxVW7B+0FFnPdane1II8AoZ2nGhk6EV1SY9XFnpR+QBHo9pFMe5x
         g2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729479716; x=1730084516;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Js96B82vpvasO7dH54aWNj4yi7wPO0A7/Og4/faXgF0=;
        b=R/G8Phas0GIKEtQH7mvSmxqHjGAzto8wecTZd3aGnoCss71hISaPOEANlLDrnU+FgA
         ySi67woY7PDdZRSqg+qpEnRXeg5pWi5Zfpl6gw6P/dE9z68xhlm3DOr8ry7qwvuK/AsC
         PSGCpql7fi8JxbBzDaKH/ioISmWiq9AHTSUqyo3yIjWVxdQiv2Y++ofZkSm28YS6fvJi
         ZFmTZvSpZLum00OMbP5f1knoGK3V/U3tBB+BY2nrl9/nUkK9x7gzSCNJmINQi3MzOj8a
         UNtvRQN9pFLJObra8qnyOCoLn/gBpxFE9dDzf1Mt3u7mPojkEaGNL07+l1iH6lRzHorw
         S8yA==
X-Forwarded-Encrypted: i=1; AJvYcCVckGRXP3u+amkJ2vUDkWgbXnWkWT/B53fZAt8uOkiqZj3mZyBoAQaxMdiIVyNT2tkc/dtAjizCiy3WFg+VJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvjMWm1yUR9+V22+jRAgw5mu8EIrRgmFgwKGEqoscwbqwCMGKZ
	pzVoZZWT90gMt18faFQHOeSZ/+R9FXVxF6EPwcd78L8inlT98ZIbzDOmcVrQ5IU=
X-Google-Smtp-Source: AGHT+IEropSwSiXjGPEPP3gdGjV/9w69XLqrlsjwkQlFENyURw427Xf8jTZcFWEvnHm4E7Z1UulvkA==
X-Received: by 2002:a05:6a00:1797:b0:718:e49f:137a with SMTP id d2e1a72fcca58-71ea33341eemr6056480b3a.6.1729479715644;
        Sun, 20 Oct 2024 20:01:55 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1313fb5sm1815601b3a.7.2024.10.20.20.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 20:01:55 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.or,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/4] arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
Date: Mon, 21 Oct 2024 10:59:36 +0800
Message-Id: <20241021025938.676-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_200156_591199_465FE4BD 
X-CRM114-Status: GOOD (  13.45  )
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

MT8186 chinchou, known as ASUS Chromebook CZ12 Flip (CZ1204F)
and CZ12(CZ1204C), is a MT8186 based laptop.
It is based on the "corsola" design.It includes chinchou and chinchou360,
including LTE, stylus, touchscreen combinations.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
 5 files changed, 406 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 8fd7b2bb7a15..0db7770e8907 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -55,6 +55,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
new file mode 100644
index 000000000000..5d012bc4ff0d
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-chinchou.dtsi"
+
+/ {
+	model = "Google chinchou CZ1104CM2A/CZ1204CM2A";
+	compatible = "google,chinchou-sku0", "google,chinchou-sku2",
+			"google,chinchou-sku4", "google,chinchou-sku5",
+			"google,chinchou", "mediatek,mt8186";
+};
+
+&gpio_keys {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
new file mode 100644
index 000000000000..c18f473f6a0f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-chinchou.dtsi"
+
+/ {
+	model = "Google chinchou CZ1104FM2A/CZ1204FM2A/CZ1104CM2A/CZ1204CM2A";
+	compatible = "google,chinchou-sku1", "google,chinchou-sku17",
+			"google,chinchou-sku3", "google,chinchou-sku6",
+			"google,chinchou-sku7", "google,chinchou-sku20",
+			"google,chinchou-sku22", "google,chinchou-sku23",
+			"google,chinchou", "mediatek,mt8186";
+};
+
+&gpio_keys {
+	status = "disabled";
+};
+
+&i2c1 {
+	i2c-scl-internal-delay-ns = <10000>;
+
+	touchscreen: touchscreen@41 {
+		compatible = "ilitek,ili2901";
+		reg = <0x41>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&pp1800_tchscr_report_disable>;
+		vcc33-supply = <&pp3300_z2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
new file mode 100644
index 000000000000..eb377de1fcde
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-chinchou.dtsi"
+
+/ {
+	model = "Google chinchou CZ1104FM2A/CZ1204FM2A";
+	compatible = "google,chinchou-sku16", "google,chinchou-sku18",
+			"google,chinchou-sku19", "google,chinchou-sku21",
+			"google,chinchou", "mediatek,mt8186";
+};
+
+&i2c1 {
+	i2c-scl-internal-delay-ns = <10000>;
+
+	touchscreen: touchscreen@41 {
+		compatible = "ilitek,ili2901";
+		reg = <0x41>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&pp1800_tchscr_report_disable>;
+		vcc33-supply = <&pp3300_z2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
new file mode 100644
index 000000000000..389f8b66e968
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola.dtsi"
+
+/ {
+	/delete-node/ speaker-codec;
+
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
+
+	pp1800_tchscr_report_disable: regulator-pp1800-tchscr-report-disable {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_tchscr_report_disable";
+		pinctrl-names = "default";
+		regulator-boot-on;
+		pinctrl-0 = <&touch_pin_report>;
+		gpio = <&pio 37 GPIO_ACTIVE_LOW>;
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
+&i2c2 {
+	/delete-node/ trackpad@15;
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		post-power-on-delay-ms = <10>;
+		hid-descr-addr = <0x0001>;
+		vdd-supply = <&pp3300_s3>;
+		wakeup-source;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+	/delete-node/ codec@1a;
+
+	rt5650: rt5650@1a {
+		compatible = "realtek,rt5650";
+		reg = <0x1a>;
+		avdd-supply = <&mt6366_vio18_reg>;
+		cpvdd-supply = <&mt6366_vio18_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rt1019p_pins_default>;
+		cbj-sleeve-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&pio>;
+		interrupts = <17 IRQ_TYPE_EDGE_BOTH>;
+		#sound-dai-cells = <0>;
+		realtek,dmic1-data-pin = <2>;
+		realtek,jd-mode = <2>;
+	};
+};
+
+&i2c_tunnel {
+	/delete-node/ sbs-battery@b;
+
+	battery: sbs-battery@f {
+		compatible = "sbs,sbs-battery";
+		reg = <0xf>;
+		sbs,i2c-retry-count = <2>;
+		sbs,poll-retry-count = <1>;
+	};
+};
+
+&keyboard_controller {
+	keypad,num-columns = <15>;
+
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)        /* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)        /* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)        /* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)        /* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)        /* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)        /* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)        /* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)        /* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)        /* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)        /* T10 */
+		MATRIX_KEY(0x00, 0x01, 0)        /* T11 */
+		MATRIX_KEY(0x01, 0x05, 0)        /* T12 */
+	>;
+
+	linux,keymap = <
+		CROS_STD_MAIN_KEYMAP
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)           /* T1 */
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)        /* T2 */
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)           /* T3 */
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)          /* T4 */
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)          /* T5 */
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN) /* T6 */
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)   /* T7 */
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)           /* T8 */
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)	   /* T9 */
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)	   /* T10 */
+		MATRIX_KEY(0x00, 0x01, KEY_MICMUTE)        /* T11 */
+		MATRIX_KEY(0x01, 0x05, KEY_CONTROLPANEL)   /* T12 */
+		MATRIX_KEY(0x03, 0x05, KEY_PREVIOUSSONG)   /* T13 */
+		MATRIX_KEY(0x00, 0x09, KEY_PLAYPAUSE)	   /* T14 */
+		MATRIX_KEY(0x00, 0x0b, KEY_NEXTSONG)	   /* T15 */
+		MATRIX_KEY(0x03, 0x00, KEY_LEFTMETA)	   /* Search*/
+		MATRIX_KEY(0x01, 0x0e, KEY_LEFTCTRL)	   /* Left Control*/
+		MATRIX_KEY(0x06, 0x0d, KEY_LEFTALT)        /* Left ALT*/
+		MATRIX_KEY(0x03, 0x0e, KEY_RIGHTCTRL)      /* Right Control*/
+		MATRIX_KEY(0x06, 0x0a, KEY_BACKSLASH)      /* BACKSLASH*/
+	>;
+};
+
+&mmc1_pins_default {
+	pins-clk {
+		drive-strength = <MTK_DRIVE_8mA>;
+	};
+
+	pins-cmd-dat {
+		drive-strength = <MTK_DRIVE_8mA>;
+	};
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength = <MTK_DRIVE_8mA>;
+	};
+
+	pins-cmd-dat {
+		drive-strength = <MTK_DRIVE_8mA>;
+	};
+};
+
+&pen_insert {
+	wakeup-event-action = <EV_ACT_ANY>;
+};
+
+&pio {
+	anx7625_pins: anx7625-pins {
+		pins-int {
+			pinmux = <PINMUX_GPIO9__FUNC_GPIO9>;
+			input-enable;
+			bias-disable;
+		};
+
+		pins-reset {
+			pinmux = <PINMUX_GPIO98__FUNC_GPIO98>;
+			output-low;
+		};
+
+		pins-power-en {
+			pinmux = <PINMUX_GPIO96__FUNC_GPIO96>;
+			output-low;
+		};
+	};
+
+	en_pp1000_edpbrdg: pp1000-edpbrdg-en-pins {
+		pins-vreg-en {
+			pinmux = <PINMUX_GPIO29__FUNC_GPIO29>;
+			output-low;
+		};
+	};
+
+	en_pp1800_edpbrdg: pp1800-edpbrdg-en-pins {
+		pins-vreg-en {
+			pinmux = <PINMUX_GPIO30__FUNC_GPIO30>;
+			output-low;
+		};
+	};
+
+	en_pp3300_edpbrdg: pp3300-edpbrdg-en-pins {
+		pins-vreg-en {
+			pinmux = <PINMUX_GPIO31__FUNC_GPIO31>;
+			output-low;
+		};
+	};
+
+	touch_pin_report: pin-report-pins {
+		pins-touch-en {
+			pinmux = <PINMUX_GPIO37__FUNC_GPIO37>;
+			output-low;
+		};
+	};
+};
+
+&sound {
+	compatible = "mediatek,mt8186-mt6366-rt5650-sound";
+	model = "mt8186_rt5650";
+	mediatek,adsp = <&adsp>;
+
+	audio-routing =
+		"Headphone", "HPOL",
+		"Headphone", "HPOR",
+		"IN1P", "Headset Mic",
+		"IN1N", "Headset Mic",
+		"Speakers", "SPOL",
+		"Speakers", "SPOR",
+		"HDMI1", "TX";
+
+	hs-playback-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	hs-capture-dai-link {
+		codec {
+			sound-dai = <&rt5650>;
+		};
+	};
+
+	spk-share-dai-link {
+	};
+
+	spk-hdmi-playback-dai-link {
+		codec {
+			sound-dai = <&it6505dptx>;
+		};
+	};
+};
+
+&touchscreen_pins {
+	/delete-node/ pins-report-sw;
+};
+
+&wifi_enable_pin {
+	pins-wifi-enable {
+		pinmux = <PINMUX_GPIO51__FUNC_GPIO51>;
+	};
+};
+
+&wifi_pwrseq {
+	reset-gpios = <&pio 51 GPIO_ACTIVE_LOW>;
+};
-- 
2.17.1


