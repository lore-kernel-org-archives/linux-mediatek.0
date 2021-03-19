Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05277C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:53:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 870FD6023C
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 870FD6023C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SAJMU9hwd3WLSQKcYuUV/AncROMxDuaSR0lKUCPNO3s=; b=a0JmimYUvBfkjk+9PjpPKGM1f
	GYNNB5p9VjYlO6djWBoK+3Vv+F6MV+6p5iDUkwqPmnZtEkHacy2EezVY1Ess0fXJTBLFhcukSbl19
	s94SN/rym4cNi5kXyf9aL3T87jten7z1vygRMlQinKvrZL5w2g0eqUNxBBiW0LI9jzW55pZVlXXxB
	xwb6aktqQ6A+NYdx306xawtfL2zB3T1mB74Rq2R6Y5f4zbi0OCGUQhg1iA8rWkRtzgH4k7+U9yOwo
	wqKAwnqQ0UIj2yMoC3cLhyNJpNPkWLbpyRf89x5+4WuDgyw1+iTcECo8QsdfAYkhKn8KvzR8z7F6f
	z6frulHUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN6Ce-006QhR-2y; Fri, 19 Mar 2021 03:53:36 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN6C0-006QZp-GJ
 for linux-mediatek@lists.infradead.org; Fri, 19 Mar 2021 03:53:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id k24so2796059pgl.6
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Mar 2021 20:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ODfnKCn+5jBLEnk00TLg54QIk6VN7rn7KMaTXQKW2WY=;
 b=RVv9L2B1ieUzY/iAVBTRvaUyc9C9NXJmyh0T1L7muEr8boUhBkA1hluUarL4/7Odsn
 8BreBFTJofh4CIxp8JC0m4TmcvBWrCuw32ZCYHNTleGMBffB07FY7yh9y9n3ijW5Nhvl
 PPCHA8CtwuWTUYAnHNN/Sy/OS3+es7AJ79HnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ODfnKCn+5jBLEnk00TLg54QIk6VN7rn7KMaTXQKW2WY=;
 b=LzK8i0cTGJPXXt96kehva/vFroIS8CuEO+slk5PO2eTOjN2xLJJsGA2pHOzUJB4i78
 4xB5VgVVe8uNueik82gEm8CK80caKMxsuvQILi2vaF75H3NEoZDu65Q1HIELm4WjGqF0
 SJyedQ9fKq1lKHbH25tSHr1sar4/1JPccjPO2YX3KL+PnTDfL9sggQgj+ycNgclqJKC4
 gYntMlyTtHBbfraIFtRCQIDkBtVUfyVezq1gm1MY4CSaWM7UvnyD0PpUOPELuuGEZRbL
 uW+0F8QWq+6ZfM2DtTW+R4ARxAPE/RM1ON4B5qJDTRN63kCEOEJJidLjLOwiDwwmo+d5
 IFjA==
X-Gm-Message-State: AOAM532H+x5OlMSdAD3MfUtb3QCAKc1Dq26b7rq8jFh26RdIaSr2QFXE
 xsqmSHGhp9QBcnAmIS36EemiKA==
X-Google-Smtp-Source: ABdhPJwNwP3usqjcjmsmmuHt0jW9lDGzcmQcuoNDuITNLba3TmdM8eMlQxzuo2uxpPbcu38aKHmA9A==
X-Received: by 2002:aa7:9298:0:b029:1ed:fd64:e6b7 with SMTP id
 j24-20020aa792980000b02901edfd64e6b7mr7234892pfa.5.1616125975073; 
 Thu, 18 Mar 2021 20:52:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e12f:5c36:14f:bbf5])
 by smtp.gmail.com with ESMTPSA id u66sm3442180pfu.186.2021.03.18.20.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 20:52:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: [PATCH v4 3/4] arm64: dts: mt8183: Add kukui-jacuzzi-damu board
Date: Fri, 19 Mar 2021 11:52:44 +0800
Message-Id: <20210319035245.2751911-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319035245.2751911-1-hsinyi@chromium.org>
References: <20210319035245.2751911-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_035257_207304_4723DF35 
X-CRM114-Status: GOOD (  15.19  )
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
v3->v4: none
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
