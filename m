Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51930C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 04:40:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A369D64F24
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 04:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A369D64F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yMNBuxQMgLQMJ0L8azyX8aRdV1NOlETpvS5JmnZqbIU=; b=VMkTqmXp56zfCr1v+jmhe0oh1
	1+siQ6D+ki07qBkWU+bjedFqBU5XbUjqUFm3qUVCBLWQzWyhkET2ijyDVhm80jSXC94AQwKcyStYZ
	yOX1qiMYEKa5fkA8e8zl0doTBwXwTS+hR7wDu6Na4j9fu0lsadDE8H4W4EDZourQeHsVcdSu9rGMI
	IYO2QoGodI0eJaRbPNYSYDukINWb5RgztzD/Vz+1pcoGxuq78cVouaUvnCrQ1fZCqrgZ58tpWRWwC
	uulUffGtj5vnR3nmmNRBCj5DARAjcmDZPeTYJAoWOAntYnvZlEsllLhdyi/Yaz6JUghGe+/FZmIi5
	pznlGBzlA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMkRy-004Q6G-Fe; Thu, 18 Mar 2021 04:39:58 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMkQ8-004Puc-Tn
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 04:38:11 +0000
Received: by mail-pg1-x530.google.com with SMTP id u19so628764pgh.10
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Mar 2021 21:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jpru6PDOG2F1huGU0uXKqZNkTcU5j4Ol/IL9yFnaQLU=;
 b=foSGfRWTUBG/vwa3DDuGFoU+UfdhLxOGf53WLLAjjUIcwNSDx1ceE2Lyq0GcBvWXJU
 vNrJxQCyPiol/6blgFE8jfxKU+2u19SuNgMKNBTFGwuz8vtNkiZ8GI6pwA4mUg77N8pm
 rf8xy+9nJ/so0E5b3r9WDFv+ZNqnytVa4Eu/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jpru6PDOG2F1huGU0uXKqZNkTcU5j4Ol/IL9yFnaQLU=;
 b=cCnfROxTLzZrNJqhJd6xNQyURZ4/tzscQqdsTillwBOhyJIyMQ1BxmPAlUCgLBIwsI
 lnyJyFJs4dKY5iQjBGWv2xNuXTxu9Tg+sEITvBC9uMSEVSmy3aSng9bPdroTt4UO5U3W
 Qbwwtjj0Nze0asl424tMGpCd5n7jcJ96bIL6Q3jCeCjUqfpB9oNPXOpbULnaBinYnL8Q
 rfcgnSJ5eKlQbYt1ldjgsBq/yPUnT0+eikomGCDyxoEGiyCVYtPDp1yX+0mxP0xsI6y4
 Lx7MADmVmKPIjzuTFKOwWTPDLln9IrlvcQnXx1OHVW1WJgKlvrXEUp9M2GgS0VBlNVfR
 cBNQ==
X-Gm-Message-State: AOAM5318W9WU3NxL8YCCwMDVTmA9exg4Top+9BKrtdXKz/nMzAha/d3h
 J1blasPmkcckb3mlvDrmHBWfCQ==
X-Google-Smtp-Source: ABdhPJz+4uOKMaI9XSOKqFi+q0HiNOJmghMMBm9Nn0fgADzrjRzK27ceZArEHeCP0Muq8kyV2p1HUA==
X-Received: by 2002:aa7:92c7:0:b029:1ee:75b2:2dab with SMTP id
 k7-20020aa792c70000b02901ee75b22dabmr2259869pfa.61.1616042282518; 
 Wed, 17 Mar 2021 21:38:02 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e12f:5c36:14f:bbf5])
 by smtp.gmail.com with ESMTPSA id ft22sm611234pjb.8.2021.03.17.21.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 21:38:02 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: [PATCH v3 2/2] arm64: dts: mt8183: Add kukui-jacuzzi-damu board
Date: Thu, 18 Mar 2021 12:37:55 +0800
Message-Id: <20210318043755.2273782-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210318043755.2273782-1-hsinyi@chromium.org>
References: <20210318043755.2273782-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_043805_393533_621F0A32 
X-CRM114-Status: GOOD (  15.13  )
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

Damu is known as ASUS Chromebook Flip CM3.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2->v3: remove unused nodes
v1->v2: fix pp3300_panel regulator property
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt8183-kukui-jacuzzi-damu.dts    |  31 ++
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 474 ++++++++++++++++++
 3 files changed, 506 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index deba27ab7657..554105d2c389 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
new file mode 100644
index 000000000000..42ba9c00866c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+/ {
+	model = "Google damu board";
+	compatible = "google,damu", "mediatek,mt8183";
+};
+
+&touchscreen {
+	status = "okay";
+
+	compatible = "hid-over-i2c";
+	reg = <0x10>;
+	interrupt-parent = <&pio>;
+	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&touchscreen_pins>;
+
+	post-power-on-delay-ms = <10>;
+	hid-descr-addr = <0x0001>;
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_DAMU";
+};
+
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
new file mode 100644
index 000000000000..4049dff8464b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -0,0 +1,474 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+#include "mt8183-kukui.dtsi"
+
+/ {
+	panel: panel {
+		compatible = "auo,b116xw03";
+		power-supply = <&pp3300_panel>;
+		ddc-i2c-bus = <&i2c4>;
+		backlight = <&backlight_lcd0>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&anx7625_out>;
+			};
+		};
+	};
+
+	pp1200_mipibrdg: pp1200-mipibrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1200_mipibrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1200_mipibrdg_en>;
+
+		enable-active-high;
+		regulator-boot-on;
+
+		gpio = <&pio 54 GPIO_ACTIVE_HIGH>;
+	};
+
+	pp1800_mipibrdg: pp1800-mipibrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_mipibrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1800_lcd_en>;
+
+		enable-active-high;
+		regulator-boot-on;
+
+		gpio = <&pio 36 GPIO_ACTIVE_HIGH>;
+	};
+
+	pp3300_panel: pp3300-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_panel";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp3300_panel_pins>;
+
+		enable-active-high;
+		regulator-boot-on;
+
+		gpio = <&pio 35 GPIO_ACTIVE_HIGH>;
+	};
+
+	vddio_mipibrdg: vddio-mipibrdg {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_mipibrdg";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vddio_mipibrdg_en>;
+
+		enable-active-high;
+		regulator-boot-on;
+
+		gpio = <&pio 37 GPIO_ACTIVE_HIGH>;
+	};
+
+	volume_buttons: volume-buttons {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&volume_button_pins>;
+
+		volume_down {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <100>;
+
+			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
+		};
+
+		volume_up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <100>;
+
+			gpios = <&pio 5 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+	/delete-node/panel@0;
+	ports {
+		port {
+			dsi_out: endpoint {
+				remote-endpoint = <&anx7625_in>;
+			};
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	touchscreen: touchscreen@10 {
+		compatible = "elan,ekth3500";
+		reg = <0x10>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&pio 156 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+	clock-frequency = <400000>;
+
+	trackpad@15 {
+		compatible = "elan,ekth3000";
+		reg = <0x15>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pins>;
+
+		interrupts-extended = <&pio 7 IRQ_TYPE_LEVEL_LOW>;
+
+		wakeup-source;
+	};
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+	status = "okay";
+	clock-frequency = <100000>;
+
+	anx_bridge: anx7625@58 {
+		compatible = "analogix,anx7625";
+		reg = <0x58>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&anx7625_pins>;
+		panel_flags = <1>;
+		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+		vdd10-supply = <&pp1200_mipibrdg>;
+		vdd18-supply = <&pp1800_mipibrdg>;
+		vdd33-supply = <&vddio_mipibrdg>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+
+			anx7625_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			anx7625_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
+&i2c_tunnel {
+	google,remote-bus = <2>;
+};
+
+&pio {
+	/* 192 lines */
+	gpio-line-names =
+		"SPI_AP_EC_CS_L",
+		"SPI_AP_EC_MOSI",
+		"SPI_AP_EC_CLK",
+		"I2S3_DO",
+		"USB_PD_INT_ODL",
+		"",
+		"",
+		"",
+		"",
+		"IT6505_HPD_L",
+		"I2S3_TDM_D3",
+		"SOC_I2C6_1V8_SCL",
+		"SOC_I2C6_1V8_SDA",
+		"DPI_D0",
+		"DPI_D1",
+		"DPI_D2",
+		"DPI_D3",
+		"DPI_D4",
+		"DPI_D5",
+		"DPI_D6",
+		"DPI_D7",
+		"DPI_D8",
+		"DPI_D9",
+		"DPI_D10",
+		"DPI_D11",
+		"DPI_HSYNC",
+		"DPI_VSYNC",
+		"DPI_DE",
+		"DPI_CK",
+		"AP_MSDC1_CLK",
+		"AP_MSDC1_DAT3",
+		"AP_MSDC1_CMD",
+		"AP_MSDC1_DAT0",
+		"AP_MSDC1_DAT2",
+		"AP_MSDC1_DAT1",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"OTG_EN",
+		"DRVBUS",
+		"DISP_PWM",
+		"DSI_TE",
+		"LCM_RST_1V8",
+		"AP_CTS_WIFI_RTS",
+		"AP_RTS_WIFI_CTS",
+		"SOC_I2C5_1V8_SCL",
+		"SOC_I2C5_1V8_SDA",
+		"SOC_I2C3_1V8_SCL",
+		"SOC_I2C3_1V8_SDA",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"SOC_I2C1_1V8_SDA",
+		"SOC_I2C0_1V8_SDA",
+		"SOC_I2C0_1V8_SCL",
+		"SOC_I2C1_1V8_SCL",
+		"AP_SPI_H1_MISO",
+		"AP_SPI_H1_CS_L",
+		"AP_SPI_H1_MOSI",
+		"AP_SPI_H1_CLK",
+		"I2S5_BCK",
+		"I2S5_LRCK",
+		"I2S5_DO",
+		"BOOTBLOCK_EN_L",
+		"MT8183_KPCOL0",
+		"SPI_AP_EC_MISO",
+		"UART_DBG_TX_AP_RX",
+		"UART_AP_TX_DBG_RX",
+		"I2S2_MCK",
+		"I2S2_BCK",
+		"CLK_5M_WCAM",
+		"CLK_2M_UCAM",
+		"I2S2_LRCK",
+		"I2S2_DI",
+		"SOC_I2C2_1V8_SCL",
+		"SOC_I2C2_1V8_SDA",
+		"SOC_I2C4_1V8_SCL",
+		"SOC_I2C4_1V8_SDA",
+		"",
+		"SCL8",
+		"SDA8",
+		"FCAM_PWDN_L",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"I2S_PMIC",
+		"I2S_PMIC",
+		"I2S_PMIC",
+		"I2S_PMIC",
+		"I2S_PMIC",
+		"I2S_PMIC",
+		"I2S_PMIC",
+		"I2S_PMIC",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		/*
+		 * AP_FLASH_WP_L is crossystem ABI. Rev1 schematics
+		 * call it BIOS_FLASH_WP_R_L.
+		 */
+		"AP_FLASH_WP_L",
+		"EC_AP_INT_ODL",
+		"IT6505_INT_ODL",
+		"H1_INT_OD_L",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"AP_SPI_FLASH_MISO",
+		"AP_SPI_FLASH_CS_L",
+		"AP_SPI_FLASH_MOSI",
+		"AP_SPI_FLASH_CLK",
+		"DA7219_IRQ",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+
+	pp1200_mipibrdg_en: pp1200-mipibrdg-en {
+		pins1 {
+			pinmux = <PINMUX_GPIO54__FUNC_GPIO54>;
+			output-low;
+		};
+	};
+
+	pp1800_lcd_en: pp1800-lcd-en {
+		pins1 {
+			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
+			output-low;
+		};
+	};
+
+	pp3300_panel_pins: pp3300-panel-pins {
+		panel_3v3_enable: panel-3v3-enable {
+			pinmux = <PINMUX_GPIO35__FUNC_GPIO35>;
+			output-low;
+		};
+	};
+
+	ppvarp_lcd_en: ppvarp-lcd-en {
+		pins1 {
+			pinmux = <PINMUX_GPIO66__FUNC_GPIO66>;
+			output-low;
+		};
+	};
+
+	ppvarn_lcd_en: ppvarn-lcd-en {
+		pins1 {
+			pinmux = <PINMUX_GPIO166__FUNC_GPIO166>;
+			output-low;
+		};
+	};
+
+	anx7625_pins: anx7625-pins {
+		pins1 {
+			pinmux = <PINMUX_GPIO45__FUNC_GPIO45>,
+				 <PINMUX_GPIO73__FUNC_GPIO73>;
+			output-low;
+		};
+		pins2 {
+			pinmux = <PINMUX_GPIO4__FUNC_GPIO4>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	touchscreen_pins: touchscreen-pins {
+		touch_int_odl {
+			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		touch_rst_l {
+			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
+			output-high;
+		};
+	};
+
+	trackpad_pins: trackpad-pins {
+		trackpad_int {
+			pinmux = <PINMUX_GPIO7__FUNC_GPIO7>;
+			input-enable;
+			bias-disable; /* pulled externally */
+		};
+	};
+
+	vddio_mipibrdg_en: vddio-mipibrdg-en {
+		pins1 {
+			pinmux = <PINMUX_GPIO37__FUNC_GPIO37>;
+			output-low;
+		};
+	};
+
+	volume_button_pins: volume-button-pins {
+		voldn-btn-odl {
+			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		volup-btn-odl {
+			pinmux = <PINMUX_GPIO5__FUNC_GPIO5>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+};
+
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
