Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CD2C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:15:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8691619CA
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8691619CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lnP4P2h9Y3ICl6o+6xeRMFjBmSsWBgyTKHvfw67/+JE=; b=Eg5g27BPWZiSV8HU8ijPKTI5k
	pbbObhbQ2LOoMxy1ndXc2EIcLlLZOx6YVe4IXMrYB3DGBUv1/0Ej0fygYI70sKPMT0WsQt/w9s0R+
	Y9KuvKlG1qGcJkswIW0azBsiHDBm59V3Cl9bcp/6EkKVMtagIMwZGF58BMW2nOGjoES0e5DpEDGaj
	Idtw+h/J2lDpVBLkFX0u3w+q9a8IX9wgKLoXfeDVDrVayDgBfs6HiDg7WA4HtDcBWEO9PrGG5VYbR
	R4bzg1SW0WqheyL2ovE8rI+lDEZSdcgoK39lhHSgycP9lOUVzgw2zUxaGvG7zlBuPj+Z5dXC1NRZE
	749AYWViQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWwV-0065DG-41; Wed, 31 Mar 2021 09:15:15 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWv4-0064rL-7E
 for linux-mediatek@lists.infradead.org; Wed, 31 Mar 2021 09:13:50 +0000
Received: by mail-pg1-x535.google.com with SMTP id f10so13746454pgl.9
 for <linux-mediatek@lists.infradead.org>; Wed, 31 Mar 2021 02:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXrKKsbeKxSiATgOBsDhgjpws5MfQknzcR0V39Z0Fms=;
 b=Htn8DBY5SjRW3aAVQwGsMwZB0U/i2x6AHF8ipJP9WoRPGdrM4r0ZzMxfFoWXJ5Vx3n
 fzpoQnoVnNnot2e4Sj3SCowPntYDqWO1a0GvsZJYZa3hrPPqz90AhjpX7mz9Wpe3KQc4
 gUTfA41trCotLX3hGgKJ8jdz9n3UqnrsjAJRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXrKKsbeKxSiATgOBsDhgjpws5MfQknzcR0V39Z0Fms=;
 b=irs7FSxayTIIwuWI4K9NVKNKaOPl/rCaa+VuekINha5liAhCG25gBIjkcjO3qOSNyX
 0tQ4SFo6idQjwRidJWo5rLECqXbIa5IvcjvA1p1C8L4urPqtwD+QokvpZ328MuMWeN8L
 IuUP1XZerxYdjOx26Sf9cdmFsHjbbr//61A9PeOtb4vWS3Choh0NIXFP8EDO32DtiAZz
 GnbHxkdu36XiqaWDT6Q/5EWMsqxgTE4vGUlj21q0fHKSTUhO4kg6DhiZ357bItXtP6Wm
 q2U5YxeiS8D5AdqcOVsmZB3w+BvCqVY+gx2gbeEOXdaUdulFnQ1NytsOxgqFSW7mFJ5O
 LniQ==
X-Gm-Message-State: AOAM531JvFaQtyXs6J7GAwNg4nfISN1KEU1vS+B3/lzbx7SefqP5YA1C
 tQLo42JrNPs0JKqJsDOXGWgEnA==
X-Google-Smtp-Source: ABdhPJz/aeak3Xn6zIrCwDF5Hex0Bp8AjywwkrMPIoPWeSeN85DXFzN53i5e9lB6c/pHEOS5f4dzZA==
X-Received: by 2002:a63:4763:: with SMTP id w35mr2383384pgk.226.1617182017774; 
 Wed, 31 Mar 2021 02:13:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:85fc:9f25:6293:28f1])
 by smtp.gmail.com with ESMTPSA id s7sm1484723pjr.18.2021.03.31.02.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 02:13:37 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 4/4] arm64: dts: mt8183: Add kukui kodama board
Date: Wed, 31 Mar 2021 17:13:27 +0800
Message-Id: <20210331091327.1198529-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210331091327.1198529-1-hsinyi@chromium.org>
References: <20210331091327.1198529-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_101346_661634_3A3C5C94 
X-CRM114-Status: GOOD (  17.49  )
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

kodama is also known as Lenovo 10e Chromebook Tablet.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
There are 4 skus in kodama:
- OV5695 camera + AUO panel
- GC5035 camera + AUO panel
- OV5695 camera + BOE panel
- GC5035 camera + BOE panel

The camera node are not yet ready to sent, so there's only panel in this
patch.
---
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +
 .../mediatek/mt8183-kukui-kodama-sku16.dts    |  21 ++
 .../mediatek/mt8183-kukui-kodama-sku272.dts   |  21 ++
 .../mediatek/mt8183-kukui-kodama-sku288.dts   |  21 ++
 .../mediatek/mt8183-kukui-kodama-sku32.dts    |  21 ++
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 343 ++++++++++++++++++
 6 files changed, 431 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index fb891492ad66..291087dccaa8 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -16,6 +16,10 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dts
new file mode 100644
index 000000000000..e3dd75bdaea4
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ *
+ * SKU: 0x10 => 16
+ *  - bit 8: Camera: 0 (OV5695)
+ *  - bits 7..4: Panel ID: 0x1 (AUO)
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kodama.dtsi"
+
+/ {
+	model = "MediaTek kodama sku16 board";
+	compatible = "google,kodama-sku16", "google,kodama", "mediatek,mt8183";
+};
+
+&panel {
+	status = "okay";
+	compatible = "auo,b101uan08.3";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dts
new file mode 100644
index 000000000000..d81935ae07bc
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2020 Google LLC
+ *
+ * SKU: 0x110 => 272
+ *  - bit 8: Camera: 1 (GC5035)
+ *  - bits 7..4: Panel ID: 0x1 (AUO)
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kodama.dtsi"
+
+/ {
+	model = "MediaTek kodama sku272 board";
+	compatible = "google,kodama-sku272", "google,kodama", "mediatek,mt8183";
+};
+
+&panel {
+	status = "okay";
+	compatible = "auo,b101uan08.3";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dts
new file mode 100644
index 000000000000..f4082fbe0517
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2020 Google LLC
+ *
+ * SKU: 0x120 => 288
+ *  - bit 8: Camera: 1 (GC5035)
+ *  - bits 7..4: Panel ID: 0x2 (BOE)
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kodama.dtsi"
+
+/ {
+	model = "MediaTek kodama sku288 board";
+	compatible = "google,kodama-sku288", "google,kodama", "mediatek,mt8183";
+};
+
+&panel {
+	status = "okay";
+	compatible = "boe,tv101wum-n53";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
new file mode 100644
index 000000000000..7739358008ee
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ *
+ * SKU: 0x20 => 32
+ *  - bit 8: Camera: 0 (OV5695)
+ *  - bits 7..4: Panel ID: 0x2 (BOE)
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kodama.dtsi"
+
+/ {
+	model = "MediaTek kodama sku32 board";
+	compatible = "google,kodama-sku32", "google,kodama", "mediatek,mt8183";
+};
+
+&panel {
+	status = "okay";
+	compatible = "boe,tv101wum-n53";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
new file mode 100644
index 000000000000..2f5234a16ead
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui.dtsi"
+
+/ {
+	ppvarn_lcd: ppvarn-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "ppvarn_lcd";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ppvarn_lcd_en>;
+
+		enable-active-high;
+
+		gpio = <&pio 66 GPIO_ACTIVE_HIGH>;
+	};
+
+	ppvarp_lcd: ppvarp-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "ppvarp_lcd";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ppvarp_lcd_en>;
+
+		enable-active-high;
+
+		gpio = <&pio 166 GPIO_ACTIVE_HIGH>;
+	};
+
+	pp1800_lcd: pp1800-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_lcd";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pp1800_lcd_en>;
+
+		enable-active-high;
+
+		gpio = <&pio 36 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	touchscreen: touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		interrupt-parent = <&pio>;
+		interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_default>;
+
+		post-power-on-delay-ms = <10>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
+&i2c2 {
+        pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+	clock-frequency = <400000>;
+
+	eeprom@58 {
+		compatible = "atmel,24c64";
+		reg = <0x58>;
+		pagesize = <32>;
+	};
+};
+
+&i2c4 {
+        pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+	status = "okay";
+	clock-frequency = <400000>;
+
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+		pagesize = <32>;
+	};
+};
+
+&mt6358_vcama2_reg {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
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
+	pp1800_lcd_en: pp1800-lcd-en {
+		pins1 {
+			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
+			output-low;
+		};
+	};
+
+	touch_default: touchdefault {
+		pin_irq {
+			pinmux = <PINMUX_GPIO155__FUNC_GPIO155>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		touch_pin_reset: pin_reset {
+			pinmux = <PINMUX_GPIO156__FUNC_GPIO156>;
+
+			/*
+			 * The touchscreen driver doesn't currently support driving
+			 * this reset line.  By specifying output-high here
+			 * we're relying on the fact that this pin has a default
+			 * pulldown at boot (which makes sure the controller was in
+			 * reset if it was powered) and then we set it high here
+			 * to take it out of reset.  Better would be if the touchscreen
+			 * driver could control this and we could remove
+			 * "output-high" here.
+			 */
+			output-high;
+		};
+	};
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_KODAMA";
+};
+
+&i2c_tunnel {
+        google,remote-bus = <2>;
+};
-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
