Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3488C369AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAqzgSMA8rpoKVtECfcgOMf5fHf3R893Qz6RTyD6w6c=; b=dzNBQ3Tnvpdq5Etx/5h0zRAgXz
	N/iZpH/4fbeUXDR1qOFdc/5Gn6BVG/zdVhHO58MxbN8Gjc4islF9ktCbuAjWmUe9llVgOHhRJESqV
	/3Ca9v4FQYd35sSwP8f3Gnk1tBfQtNZwhEdP18CxRzhoU1nKEhSpXldkVRGyWnFi+uoaZtx+LfSle
	T3tP6V1tu3FFvN/fjglcjxc44KwcWR9h9hPBKUiDuXKaCCBVizSUyi5RUaRiSeNJngM1ucPt/gEPX
	8lbxu/3LN17k2MlhOj63bOsORwt9Fcd10PyIrD8IoyzAFOAb5rcDzfPqMXyfgqk3qeVeI4BaBjEi6
	MN8yJmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stN3S-00000004SPG-2Xif;
	Wed, 25 Sep 2024 08:07:22 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stN0V-00000004ReU-0qr7
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 08:04:21 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-a8a9094c973so478732066b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727251456; x=1727856256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAqzgSMA8rpoKVtECfcgOMf5fHf3R893Qz6RTyD6w6c=;
        b=wQJtFAhaX5aZ8Oe+0BPz4WRnR416TFkj5/IvX/hz/DKc0imB7QnruMzdloohL06gi5
         hJKqRYY3yB9cJhwDpI9qLKTfNDwhDh0cQqEcmTzDTfQlggD3tHZT0tyzzltVPa3ZIApb
         YpHWaQhulMZ0L+7AKTPCZanrwnfSwPN6Z3kefP6jHRcV6+yRLOR9oZd1eO7+EXUWrc5l
         Da0NtVhN081lXVVIjJm/c+E9agml8l7NN8quNVCZvRDP/NDvSuJsmnx8fx9P7/9W3oDr
         gKfcmR3sNnvHPOM7uZse1Dl2MAIBc5DPiqr5Q/WuoCIiZqQuC4mIpS97khFD1XyUppJm
         H1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251456; x=1727856256;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XAqzgSMA8rpoKVtECfcgOMf5fHf3R893Qz6RTyD6w6c=;
        b=n3C5z+xetjkerl14La5XarhxW7KnyFW0KZ+YzNEjCh4BuKyR73nB552+IKONpxTweO
         wwirrq1KInNu6mP+XP/a0bbI794Ggit22S7NeZgQ9B6TbUIgGsHTuW7Y7bwMFWwZwmUJ
         f8WhEOrX1AQ3A3W7v4tCNDlRwlERUqhRDUfUAZRFU+B1bLGbjMCG+THsDPj+QqdlJBN4
         gGpl5i8j56zbYBJ9WM/TKswqrPMdhuJURPkjtHcUqDuFOUf16oT4fGwrjG1FFHcQI6KI
         k7jx4FmuvvCNS0zRnjCpS6GoVXhfFWrjK5vnrTqLOhLkeftmTarD10D2okzpXLo43PmX
         PKfw==
X-Forwarded-Encrypted: i=1; AJvYcCU+bH792ppevrwxpGoyumKveFop58DOKH/NoAQP5oTByQQf5HI8bxjkt3Gs5rWWYjBUdyqMTKbEEDbUam9Jdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa3d9ZDmbApesPCu3D49HKY1e3dGweeO+L8jzBjmJc/M6et0vQ
	pa9JA9mJWZ/CYqPkmfhpmbLMPleL3aiQJaCxvs6PbnjJkzHKXJK0/VftfITvMgcrbjX2bLCecIX
	OZ9JPlg==
X-Google-Smtp-Source: AGHT+IEO1EOLJdunVALcFZ0S9FLycG3KG7igE5+tglDI+gxl+nW8v3mBzsPgqp8PmdsFdQasb7Lbo4nn8a4Q
X-Received: from malysz.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:a1e])
 (user=jakiela job=sendgmr) by 2002:a17:906:1c90:b0:a86:6a0b:3f88 with SMTP id
 a640c23a62f3a-a93a05ba9b4mr81966b.8.1727251456241; Wed, 25 Sep 2024 01:04:16
 -0700 (PDT)
Date: Wed, 25 Sep 2024 08:03:53 +0000
In-Reply-To: <20240925080353.2362879-1-jakiela@google.com>
Mime-Version: 1.0
References: <20240925080353.2362879-1-jakiela@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925080353.2362879-2-jakiela@google.com>
Subject: [PATCH 2/2] arm64: dts: mediate: Introduce MT8186 Chinchou/Chinchou360
 Chromebooks
From: "=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenst@chromium.org, rafal@milecki.pl, hsinyi@chromium.org, 
	nfraprado@collabora.com, macpaul.lin@mediatek.com, sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_010419_268955_85EA3256 
X-CRM114-Status: GOOD (  12.89  )
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

The MT8186 Chinchou/Chinchou360, also known as the Asus Chromebook
CZ12/CZ11 Flip, is a clamshell or convertible device with touchscreen,
stylus and extra buttons.

Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  34 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  28 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 445 ++++++++++++++++++
 5 files changed, 528 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sk=
u0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sk=
u1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sk=
u16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dt=
si

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/me=
diatek/Makefile
index 8fd7b2bb7a15..0db7770e8907 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -55,6 +55,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-kodama-sku3=
2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8183-pumpkin.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-chinchou-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-chinchou-sku1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-chinchou-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8186-corsola-magneton-sku393218.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts =
b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
new file mode 100644
index 000000000000..29dd92318da1
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-chinchou.dtsi"
+
+/ {
+	model =3D "Google chinchou sku0 board";
+	compatible =3D "google,chinchou-sku0", "google,chinchou-sku2",
+			"google,chinchou-sku4", "google,chinchou-sku5",
+			"google,chinchou", "mediatek,mt8186";
+};
+
+&gpio_keys {
+	status =3D "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts =
b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
new file mode 100644
index 000000000000..8ba31f81d9ad
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-chinchou.dtsi"
+
+/ {
+	model =3D "Google chinchou sku1/sku17 board";
+	compatible =3D "google,chinchou-sku1", "google,chinchou-sku17",
+			"google,chinchou-sku3", "google,chinchou-sku6",
+			"google,chinchou-sku7", "google,chinchou-sku20",
+			"google,chinchou-sku22", "google,chinchou-sku23",
+			"mediatek,mt8186";
+};
+
+&i2c1 {
+	i2c-scl-internal-delay-ns =3D <10000>;
+
+	touchscreen: touchscreen@41 {
+		compatible =3D "ilitek,ili2901";
+		reg =3D <0x41>;
+		interrupts-extended =3D <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&touchscreen_pins>;
+		reset-gpios =3D <&pio 60 GPIO_ACTIVE_LOW>;
+		vccio-supply =3D <&pp1800_tchscr_report_disable>;
+	};
+};
+
+&gpio_keys {
+	status =3D "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts=
 b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
new file mode 100644
index 000000000000..d3378d7ad096
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-chinchou.dtsi"
+
+/ {
+	model =3D "Google chinchou sku16/sku2147483647 board";
+	compatible =3D "google,chinchou-sku16", "google,chinchou-sku18",
+			"google,chinchou-sku19", "google,chinchou-sku21",
+			"google,chinchou-sku2147483647", "mediatek,mt8186";
+};
+
+&i2c1 {
+	i2c-scl-internal-delay-ns =3D <10000>;
+
+	touchscreen: touchscreen@41 {
+		compatible =3D "ilitek,ili2901";
+		reg =3D <0x41>;
+		interrupts-extended =3D <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&touchscreen_pins>;
+		reset-gpios =3D <&pio 60 GPIO_ACTIVE_LOW>;
+		vccio-supply =3D <&pp1800_tchscr_report_disable>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi b/ar=
ch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
new file mode 100644
index 000000000000..c77cc43f8442
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola.dtsi"
+
+/ {
+	tboard_thermistor1: thermal-sensor1 {
+		compatible =3D "generic-adc-thermal";
+		#thermal-sensor-cells =3D <0>;
+		io-channels =3D <&auxadc 0>;
+		io-channel-names =3D "sensor-channel";
+		temperature-lookup-table =3D <    (-5000) 1491
+						0 1413
+						5000 1324
+						10000 1225
+						15000 1120
+						20000 1012
+						25000 900
+						30000 797
+						35000 698
+						40000 607
+						45000 525
+						50000 451
+						55000 386
+						60000 330
+						65000 282
+						70000 241
+						75000 206
+						80000 176
+						85000 151
+						90000 129
+						95000 111
+						100000 96
+						105000 83
+						110000 72
+						115000 62
+						120000 54
+						125000 47>;
+	};
+
+	tboard_thermistor2: thermal-sensor2 {
+		compatible =3D "generic-adc-thermal";
+		#thermal-sensor-cells =3D <0>;
+		io-channels =3D <&auxadc 1>;
+		io-channel-names =3D "sensor-channel";
+		temperature-lookup-table =3D <    (-5000) 1491
+						0 1413
+						5000 1324
+						10000 1225
+						15000 1120
+						20000 1012
+						25000 900
+						30000 797
+						35000 698
+						40000 607
+						45000 525
+						50000 451
+						55000 386
+						60000 330
+						65000 282
+						70000 241
+						75000 206
+						80000 176
+						85000 151
+						90000 129
+						95000 111
+						100000 96
+						105000 83
+						110000 72
+						115000 62
+						120000 54
+						125000 47>;
+	};
+
+	pp1800_tchscr_report_disable: regulator-pp1800-tchscr-report-disable {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "pp1800_tchscr_report_disable";
+		pinctrl-names =3D "default";
+		enable-active-low;
+		regulator-boot-on;
+		pinctrl-0 =3D <&touch_pin_report>;
+		gpio =3D <&pio 37 GPIO_ACTIVE_LOW>;
+	};
+
+	pp1000_edpbrdg: regulator-pp1000-edpbrdg {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "pp1000_edpbrdg";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&en_pp1000_edpbrdg>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio =3D <&pio 29 GPIO_ACTIVE_HIGH>;
+		vin-supply =3D <&pp3300_z2>;
+	};
+
+	pp1800_edpbrdg_dx: regulator-pp1800-edpbrdg-dx {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "pp1800_edpbrdg_dx";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&en_pp1800_edpbrdg>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio =3D <&pio 30 GPIO_ACTIVE_HIGH>;
+		vin-supply =3D <&mt6366_vio18_reg>;
+	};
+
+	pp3300_edp_dx: regulator-pp3300-edp-dx {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "pp3300_edp_dx";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&en_pp3300_edpbrdg>;
+		enable-active-high;
+		regulator-boot-on;
+		gpio =3D <&pio 31 GPIO_ACTIVE_HIGH>;
+		vin-supply =3D <&pp3300_z2>;
+	};
+};
+
+&rt5682s {
+	status =3D "disabled";
+};
+
+&rt1019p {
+	status =3D "disabled";
+};
+
+&dsi_out {
+	remote-endpoint =3D <&anx7625_in>;
+};
+
+&i2c0 {
+	clock-frequency =3D <400000>;
+
+	anx_bridge: anx7625@58 {
+		compatible =3D "analogix,anx7625";
+		reg =3D <0x58>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&anx7625_pins>;
+		panel_flags =3D <1>;
+		enable-gpios =3D <&pio 96 GPIO_ACTIVE_HIGH>;
+		reset-gpios =3D <&pio 98 GPIO_ACTIVE_HIGH>;
+		vdd10-supply =3D <&pp1000_edpbrdg>;
+		vdd18-supply =3D <&pp1800_edpbrdg_dx>;
+		vdd33-supply =3D <&pp3300_edp_dx>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		analogix,lane0-swing =3D /bits/ 8 <0x70 0x30>;
+		analogix,lane1-swing =3D /bits/ 8 <0x70 0x30>;
+
+		port@0 {
+			reg =3D <0>;
+
+			anx7625_in: endpoint {
+				remote-endpoint =3D <&dsi_out>;
+				data-lanes =3D <0 1 2 3>;
+			};
+		};
+
+		port@1 {
+			reg =3D <1>;
+
+			anx7625_out: endpoint {
+				remote-endpoint =3D <&panel_in>;
+			};
+		};
+
+		aux-bus {
+			panel: panel {
+				compatible =3D "edp-panel";
+				power-supply =3D <&pp3300_disp_x>;
+				backlight =3D <&backlight_lcd0>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint =3D <&anx7625_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&i2c2 {
+	trackpad@15 {
+		compatible =3D "hid-over-i2c";
+		post-power-on-delay-ms =3D <10>;
+		hid-descr-addr =3D <0x0001>;
+		vdd-supply =3D <&pp3300_s3>;
+	};
+};
+
+&i2c5 {
+	clock-frequency =3D <400000>;
+
+	rt5650: rt5650@1a {
+		compatible =3D "realtek,rt5650";
+		reg =3D <0x1a>;
+		avdd-supply =3D <&mt6366_vio18_reg>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&rt1019p_pins_default>;
+		cbj-sleeve-gpio =3D <&pio 150 GPIO_ACTIVE_HIGH>;
+		interrupt-parent =3D <&pio>;
+		interrupts =3D <17 IRQ_TYPE_EDGE_BOTH>;
+		#sound-dai-cells =3D <0>;
+		realtek,dmic1-data-pin =3D <2>;
+		realtek,jd-mode =3D <2>;
+	};
+};
+
+&mmc1_pins_default {
+	pins-clk {
+		drive-strength =3D <MTK_DRIVE_8mA>;
+	};
+
+	pins-cmd-dat {
+		drive-strength =3D <MTK_DRIVE_8mA>;
+	};
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength =3D <MTK_DRIVE_8mA>;
+	};
+
+	pins-cmd-dat {
+		drive-strength =3D <MTK_DRIVE_8mA>;
+	};
+};
+
+&sound {
+	status =3D "okay";
+
+	compatible =3D "mediatek,mt8186-mt6366-rt5650-sound";
+	mediatek,adsp =3D <&adsp>;
+
+	audio-routing =3D
+		"Headphone", "HPOL",
+		"Headphone", "HPOR",
+		"HDMI1", "TX";
+
+	hs-playback-dai-link {
+		codec {
+			sound-dai =3D <&rt5650>;
+		};
+	};
+
+	hs-capture-dai-link {
+		codec {
+			sound-dai =3D <&rt5650>;
+		};
+	};
+
+	spk-share-dai-link {
+	};
+
+	spk-hdmi-playback-dai-link {
+		codec {
+			sound-dai =3D <&it6505dptx>;
+		};
+	};
+};
+
+&wifi_enable_pin {
+	pins-wifi-enable {
+		pinmux =3D <PINMUX_GPIO51__FUNC_GPIO51>;
+	};
+};
+
+&wifi_pwrseq {
+	reset-gpios =3D <&pio 51 GPIO_ACTIVE_LOW>;
+};
+
+&keyboard_controller {
+	keypad,num-columns =3D <15>;
+
+	function-row-physmap =3D <
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
+	linux,keymap =3D <
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
+&thermal_zones {
+	cpu-ntc {
+		polling-delay =3D <1000>; /* milliseconds */
+		polling-delay-passive =3D <0>; /* milliseconds */
+		thermal-sensors =3D <&tboard_thermistor1>;
+	};
+
+	pmic-ntc {
+		polling-delay =3D <1000>; /* milliseconds */
+		polling-delay-passive =3D <50>; /* milliseconds */
+		thermal-sensors =3D <&tboard_thermistor2>;
+		sustainable-power =3D <1500>;
+
+		trips {
+			pmic_temp_alert0: trip-point@0 {
+				temperature =3D <50000>;
+				hysteresis =3D <2000>;
+				type =3D "passive";
+			};
+
+			pmic_temp_alert1: target@1 {
+				temperature =3D <60000>;
+				hysteresis =3D <2000>;
+				type =3D "passive";
+			};
+
+			pmic_ntc_crit: pmic-ntc-crit@0 {
+				temperature =3D <80000>;
+				hysteresis =3D <2000>;
+				type =3D "critical";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip =3D <&pmic_temp_alert1>;
+				cooling-device =3D <&cpu0
+					THERMAL_NO_LIMIT
+					THERMAL_NO_LIMIT>,
+						<&cpu1
+					THERMAL_NO_LIMIT
+					THERMAL_NO_LIMIT>,
+						<&cpu2
+					THERMAL_NO_LIMIT
+					THERMAL_NO_LIMIT>,
+						<&cpu3
+					THERMAL_NO_LIMIT
+					THERMAL_NO_LIMIT>,
+						<&cpu4
+					THERMAL_NO_LIMIT
+					THERMAL_NO_LIMIT>,
+						<&cpu5
+					THERMAL_NO_LIMIT
+					THERMAL_NO_LIMIT>;
+				contribution =3D <4096>;
+			};
+
+			map1 {
+				trip =3D <&pmic_temp_alert1>;
+				cooling-device =3D <&cpu6
+					THERMAL_NO_LIMIT
+					THERMAL_NO_LIMIT>,
+						<&cpu7
+					THERMAL_NO_LIMIT
+					THERMAL_NO_LIMIT>;
+				contribution =3D <1024>;
+			};
+		};
+	};
+};
+
+&pio {
+	touch_pin_report: pin-report {
+		pinmux =3D <PINMUX_GPIO37__FUNC_GPIO37>;
+		output-low;
+	};
+
+	anx7625_pins: anx7625-pins {
+		pins1 {
+			pinmux =3D <PINMUX_GPIO96__FUNC_GPIO96>,
+			<PINMUX_GPIO98__FUNC_GPIO98>;
+			output-low;
+		};
+
+		pins2 {
+			pinmux =3D <PINMUX_GPIO9__FUNC_GPIO9>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	en_pp1000_edpbrdg: pp1000-edpbrdg-en-pins {
+		pins-vreg-en {
+			pinmux =3D <PINMUX_GPIO29__FUNC_GPIO29>;
+			output-low;
+		};
+	};
+
+	en_pp1800_edpbrdg: pp1800-edpbrdg-en-pins {
+		pins-vreg-en {
+			pinmux =3D <PINMUX_GPIO30__FUNC_GPIO30>;
+			output-low;
+		};
+	};
+
+	en_pp3300_edpbrdg: pp3300-edpbrdg-en-pins {
+		pins-vreg-en {
+			pinmux =3D <PINMUX_GPIO31__FUNC_GPIO31>;
+			output-low;
+		};
+	};
+};
+
+&i2c_tunnel {
+	/delete-node/ sbs-battery@b;
+
+	battery: sbs-battery@f {
+		compatible =3D "sbs,sbs-battery";
+		reg =3D <0xf>;
+		sbs,i2c-retry-count =3D <2>;
+		sbs,poll-retry-count =3D <1>;
+	};
+};
+
+&pen_insert {
+	wakeup-event-action =3D <EV_ACT_ANY>;
+};
--=20
2.46.0.792.g87dc391469-goog


