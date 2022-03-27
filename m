Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dbhwoUH2FikjIK1fuy1gOKa3mnJDbvsNoTdDdKD00E=; b=YVwnaFeiPdGFL7
	7GuO5QWOzl7pEO7CC5Kk0I+v1gbWQi10Yv3ItvkEUf/VzKzMz0XM+MWblFfIdyeSEi8OujW2CCCuJ
	MxG2HfsAReGoN554mE0D98wnjtyT7UKe6RYjD7kPY/tMo989Pn1WpzEAGPzGHdgds+OXEbkW6D2Lt
	tz5yOyDUT0//OTqaHFceDLaY5obM1zRlyedrzUbgC0aAWPKCoU1XMd32MXmmGgQZqThhUgOCdGqhK
	SCkYHjTEHexRVKmJXzeKujQbi+9VQMYp8B/xGXyfU/GoyRCq3dxsc1GV2V6oa76mMsV+jDu27oGSv
	wMEp2kBux4RkvJy6SewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYWF2-005kym-Ij; Sun, 27 Mar 2022 16:59:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYWEt-005kun-2z
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 16:59:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so7208460wme.0
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FAWIncwTqvdWr+vTVrpGUz4HSBxrtF7PI86nkB/iGHw=;
 b=OkaVhGoHBp1vXejxSnBedJjHVqbTw437NtL71p5aH6eUGAavCrepnkyFmRvqLNG728
 5j8kUlALSZLd5gWa1x1/Gjle1uOXgZSpj5Ak6j4opXPdN4ic/fUw3fJ9aVSkVMJiA2vx
 6xjTIkSdlfuPPYSvLVAX2sVC+VjIM9K9O8YHFWgXnoaYhIjq80OfmOet7inqr6/39WBB
 NAHw5pHZnkwnn+5Vm66DW708AAhhDoSc+xtPC3rZU0vuMedffKT/Pfhu7xJCb1nsD4TY
 fhq5/YoT3SVGe8BiyI8A3oMFGlMyRPG2AzcoDjESW4Cr+ZveNTJxQ+t2TKwvlxqpr7mM
 5pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FAWIncwTqvdWr+vTVrpGUz4HSBxrtF7PI86nkB/iGHw=;
 b=YQkihIciAOAPFihfNToPUoBrP1OC/QxTt1ihExvFCh0gGkhbUeb17G5ECobi3JJM8J
 lQF5Yo/b6+eed4FzbAV7zWL2gD6W3emWvlJ8KEp90t9Jks2PSsjACLJQhPBqnmE74XYx
 7GaSUEaHgmd4UKscTWqlgSULrWF4FAuCP2dD7vkpgPsf+7jYngcPc5TzTvhbqUwEJcam
 JWVW7UVuAG3Nou6VvKnxYIXvhsTEFhSlz+gC1gitMZhGuqizb1KL2xmqoX8EuCllu1Fy
 b9nBDMCkLXrk7a1+PnZI6hQkqmwSk0XaPaeEhRG9eWou6yE4KtnhKqmk1oxVvItWEnIG
 oVFA==
X-Gm-Message-State: AOAM533kGOLC9rBNCCDluD/WqcE7LNb9Ynf8mHa8h6kmnQJ9ru71MUaw
 9PPajqboCSg+f/cL6tRCvBb8A9lQsSQwsQ==
X-Google-Smtp-Source: ABdhPJy1BHq9yjVUI7wiI6HBdrofqgl3Bj4vo6iDMB1oY9MOG+iLCqpzSwkdNGa8YtAd3RNz5vUO7A==
X-Received: by 2002:a05:600c:1989:b0:38c:b8b3:8fa8 with SMTP id
 t9-20020a05600c198900b0038cb8b38fa8mr29897009wmq.18.1648400377857; 
 Sun, 27 Mar 2022 09:59:37 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm9979423wmz.43.2022.03.27.09.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 09:59:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: mediatek: Add device-tree for MT8195 Demo
 board
Date: Sun, 27 Mar 2022 18:58:35 +0200
Message-Id: <20220327165837.3048639-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327165837.3048639-1-fparent@baylibre.com>
References: <20220327165837.3048639-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_095939_253809_275B8B12 
X-CRM114-Status: GOOD (  17.10  )
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

Add basic device-tree for the MT8195 Demo board. The
Demo board is made by MediaTek and has a MT8195 SoC,
associated with the MT6359 and MT6360 PMICs, and
the MT7921 connectivity chip.

The IOs available on that board are:
* 1 USB Type-C connector with DP aux mode support
* 1 USB Type-A connector
* 1 full size HDMI RX and 1 full size HDMI TX connector
* 1 uSD slot
* 40 pins header
* SPI interface header
* 1 M.2 slot
* 1 audio jack
* 1 micro-USB port for serial debug
* 2 connectors for DSI displays
* 3 connectors for CSI cameras
* 1 connector for a eDP panel
* 1 MMC storage

This commit adds basic support in order to be able to boot.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
This patch depends on the following patches:
[0] https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220216113131.13145-4-tinghan.shen@mediatek.com/

 arch/arm64/boot/dts/mediatek/Makefile        |   1 +
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 539 +++++++++++++++++++
 2 files changed, 540 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 5da29e7223e4..c7d4636a2cb7 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
new file mode 100644
index 000000000000..f486cdf7e22b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -0,0 +1,539 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 BayLibre, SAS.
+ * Author: Fabien Parent <fparent@baylibre.com>
+ */
+/dts-v1/;
+
+#include "mt8195.dtsi"
+#include "mt6359.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+
+/ {
+	model = "MediaTek MT8195 demo board";
+	compatible = "mediatek,mt8195-demo", "mediatek,mt8195";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 12 MiB reserved for OP-TEE (BL32)
+		 * +-----------------------+ 0x43e0_0000
+		 * |      SHMEM 2MiB       |
+		 * +-----------------------+ 0x43c0_0000
+		 * |        | TA_RAM  8MiB |
+		 * + TZDRAM +--------------+ 0x4340_0000
+		 * |        | TEE_RAM 2MiB |
+		 * +-----------------------+ 0x4320_0000
+		 */
+		optee_reserved: optee@43200000 {
+			no-map;
+			reg = <0 0x43200000 0 0x00c00000>;
+		};
+
+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
+		bl31_secmon_reserved: secmon@54600000 {
+			no-map;
+			reg = <0 0x54600000 0x0 0x30000>;
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		input-name = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys>;
+
+		volume-up {
+			gpios = <&pio 106 GPIO_ACTIVE_LOW>;
+			label = "volume_up";
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
+
+&mmc0 {
+	status = "okay";
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	cap-mmc-hw-reset;
+	no-sdio;
+	no-sd;
+	hs400-ds-delay = <0x14c11>;
+	vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
+	vqmmc-supply = <&mt6359_vufs_ldo_reg>;
+	non-removable;
+};
+
+&pmic {
+	interrupt-parent = <&pio>;
+	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c6 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c6_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mt6360: mt6360@34 {
+		compatible = "mediatek,mt6360";
+		reg = <0x34>;
+		interrupt-controller;
+		interrupt-parent = <&pio>;
+		interrupts = <101 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "IRQB";
+
+		charger {
+			compatible = "mediatek,mt6360-chg";
+			richtek,vinovp-microvolt = <14500000>;
+
+			otg_vbus_regulator: usb-otg-vbus-regulator {
+				regulator-compatible = "usb-otg-vbus";
+				regulator-name = "usb-otg-vbus";
+				regulator-min-microvolt = <4425000>;
+				regulator-max-microvolt = <5825000>;
+			};
+		};
+
+		regulator {
+			compatible = "mediatek,mt6360-regulator";
+			LDO_VIN3-supply = <&mt6360_buck2>;
+
+			mt6360_buck1: buck1 {
+				regulator-compatible = "BUCK1";
+				regulator-name = "mt6360,buck1";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP
+							   MT6360_OPMODE_ULP>;
+				regulator-always-on;
+			};
+
+			mt6360_buck2: buck2 {
+				regulator-compatible = "BUCK2";
+				regulator-name = "mt6360,buck2";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP
+							   MT6360_OPMODE_ULP>;
+				regulator-always-on;
+			};
+
+			mt6360_ldo1: ldo1 {
+				regulator-compatible = "LDO1";
+				regulator-name = "mt6360,ldo1";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+			};
+
+			mt6360_ldo2: ldo2 {
+				regulator-compatible = "LDO2";
+				regulator-name = "mt6360,ldo2";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+			};
+
+			mt6360_ldo3: ldo3 {
+				regulator-compatible = "LDO3";
+				regulator-name = "mt6360,ldo3";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+			};
+
+			mt6360_ldo5: ldo5 {
+				regulator-compatible = "LDO5";
+				regulator-name = "mt6360,ldo5";
+				regulator-min-microvolt = <2700000>;
+				regulator-max-microvolt = <3600000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+			};
+
+			mt6360_ldo6: ldo6 {
+				regulator-compatible = "LDO6";
+				regulator-name = "mt6360,ldo6";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+			};
+
+			mt6360_ldo7: ldo7 {
+				regulator-compatible = "LDO7";
+				regulator-name = "mt6360,ldo7";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+							   MT6360_OPMODE_LP>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&spi2 {
+	pinctrl-0 = <&spi2_pins>;
+	pinctrl-names = "default";
+	mediatek,pad-select = <0>;
+	status = "okay";
+};
+
+&mt6359_vgpu11_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vsram_others_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vpu_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vcore_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vproc1_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vproc2_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vsram_md_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vbbck_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vrf12_ldo_reg {
+	regulator-always-on;
+};
+
+&mmc1 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-1 = <&mmc1_pins_uhs>;
+	cd-gpios = <&pio 129 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	max-frequency = <200000000>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&mt6360_ldo5>;
+	vqmmc-supply = <&mt6360_ldo3>;
+	status = "okay";
+};
+
+&xhci0 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&otg_vbus_regulator>;
+	status = "okay";
+};
+
+&xhci1 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
+};
+
+&xhci2 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
+};
+
+&xhci3 {
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
+};
+
+&u3phy0 {
+	status = "okay";
+};
+
+&u3phy1 {
+	status = "okay";
+};
+
+&u3phy2 {
+	status = "okay";
+};
+
+&u3phy3 {
+	status = "okay";
+};
+
+&pio {
+	mmc0_pins_default: mmc0default {
+		pins_cmd_dat {
+			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
+				 <PINMUX_GPIO125__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO124__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO123__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO119__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO118__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO117__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO116__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO121__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins_clk {
+			pinmux = <PINMUX_GPIO122__FUNC_MSDC0_CLK>;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins_rst {
+			pinmux = <PINMUX_GPIO120__FUNC_MSDC0_RSTB>;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+	};
+
+	mmc0_pins_uhs: mmc0uhs{
+		pins_cmd_dat {
+			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
+				 <PINMUX_GPIO125__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO124__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO123__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO119__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO118__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO117__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO116__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO121__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins_clk {
+			pinmux = <PINMUX_GPIO122__FUNC_MSDC0_CLK>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins_ds {
+			pinmux = <PINMUX_GPIO127__FUNC_MSDC0_DSL>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins_rst {
+			pinmux = <PINMUX_GPIO120__FUNC_MSDC0_RSTB>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+	};
+
+	mmc1_pins_default: mmc1-pins-default {
+		pins_cmd_dat {
+			pinmux = <PINMUX_GPIO110__FUNC_MSDC1_CMD>,
+				 <PINMUX_GPIO112__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO113__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO114__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO115__FUNC_MSDC1_DAT3>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins_clk {
+			pinmux = <PINMUX_GPIO111__FUNC_MSDC1_CLK>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+
+		pins_insert {
+			pinmux = <PINMUX_GPIO129__FUNC_GPIO129>;
+			bias-pull-up;
+		};
+	};
+
+	mmc1_pins_uhs: mmc1-pins-uhs {
+		pins_cmd_dat {
+			pinmux = <PINMUX_GPIO110__FUNC_MSDC1_CMD>,
+				 <PINMUX_GPIO112__FUNC_MSDC1_DAT0>,
+				 <PINMUX_GPIO113__FUNC_MSDC1_DAT1>,
+				 <PINMUX_GPIO114__FUNC_MSDC1_DAT2>,
+				 <PINMUX_GPIO115__FUNC_MSDC1_DAT3>;
+			input-enable;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+
+		pins_clk {
+			pinmux = <PINMUX_GPIO111__FUNC_MSDC1_CLK>;
+			drive-strength = <MTK_DRIVE_8mA>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
+		};
+	};
+
+	i2c0_pins: i2c0-pins {
+		pins {
+			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
+				 <PINMUX_GPIO9__FUNC_SCL0>;
+			bias-pull-up;
+			mediatek,rsel = <MTK_PULL_SET_RSEL_111>;
+			mediatek,drive-strength-adv = <7>;
+		};
+	};
+
+	i2c1_pins: i2c1-pins {
+		pins {
+			pinmux = <PINMUX_GPIO10__FUNC_SDA1>,
+				 <PINMUX_GPIO11__FUNC_SCL1>;
+			bias-pull-up;
+			mediatek,rsel = <MTK_PULL_SET_RSEL_111>;
+			mediatek,drive-strength-adv = <7>;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		pins {
+			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
+				 <PINMUX_GPIO13__FUNC_SCL2>;
+			bias-pull-up;
+			mediatek,rsel = <MTK_PULL_SET_RSEL_111>;
+			mediatek,drive-strength-adv = <7>;
+		};
+	};
+
+	i2c6_pins: i2c6-pin {
+		pins {
+			pinmux = <PINMUX_GPIO25__FUNC_SDA6>,
+				 <PINMUX_GPIO26__FUNC_SCL6>;
+			bias-pull-up;
+			mediatek,rsel = <MTK_PULL_SET_RSEL_111>;
+		};
+	};
+
+	spi2_pins: spi-pins {
+		pins {
+			pinmux = <PINMUX_GPIO140__FUNC_SPIM2_CSB>,
+				 <PINMUX_GPIO141__FUNC_SPIM2_CLK>,
+				 <PINMUX_GPIO142__FUNC_SPIM2_MO>,
+				 <PINMUX_GPIO143__FUNC_SPIM2_MI>;
+			bias-disable;
+		};
+	};
+
+	pcie0_pins_default: pcie0default {
+		pins {
+			pinmux = <PINMUX_GPIO19__FUNC_WAKEN>,
+				 <PINMUX_GPIO20__FUNC_PERSTN>,
+				 <PINMUX_GPIO21__FUNC_CLKREQN>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_pins_default: pcie1default {
+		pins {
+			pinmux = <PINMUX_GPIO22__FUNC_PERSTN_1>,
+				 <PINMUX_GPIO23__FUNC_CLKREQN_1>,
+				 <PINMUX_GPIO24__FUNC_WAKEN_1>;
+			bias-pull-up;
+		};
+
+		mt7921 {
+			pinmux = <PINMUX_GPIO65__FUNC_GPIO65>,
+				 <PINMUX_GPIO67__FUNC_GPIO67>;
+			output-high;
+		};
+	};
+
+	gpio_keys: gpio-keys {
+		pins {
+			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
+			input-enable;
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		pins {
+			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
+				 <PINMUX_GPIO99__FUNC_URXD0>;
+		};
+	};
+
+	uart1_pins: uart1-pins {
+		pins {
+			pinmux = <PINMUX_GPIO102__FUNC_UTXD1>,
+				 <PINMUX_GPIO103__FUNC_URXD1>;
+		};
+	};
+};
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
