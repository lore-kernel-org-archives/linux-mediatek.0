Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126F2C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onLNc+Oko6/d4dZDi8m4Ahc5zglhx4oC8hmNsm3uUAA=; b=eBLUNF8BtEjud/PElOwWjtA7rh
	ETbp9VcPjjwt0DmBIXYLSSxS+KcySuXD+LnzZ4CeMP9eEoXSRAVbnkwqqnVVfHewYUbeWnvI2QGyd
	Y+80mdWbxxpwfJWupYJodU7lBtSmeMflpL5Bfj14kPU5Dtc9dAM46O6cXD25ZKB4mvxXVnr3b/WbY
	zkX2NUDfoZm9As62EyBV4SF7oWVRIA7+VxEj5T9kOUk+A1jvWScMuaqY3LNRn0Vhmxv6yvWdn5UEF
	v2bdii0xLKHQ+lsV6SpQYo+ekrZYz5UEQ9Ac2yHzverOk/ra9zJcHSKCJUWDISMWJ66qa9RU7a03o
	XMcjDg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wT-005s64-04;
	Thu, 09 Nov 2023 10:07:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wQ-005s3D-0p
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 10:07:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6c3363a2b93so711726b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 02:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524433; x=1700129233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onLNc+Oko6/d4dZDi8m4Ahc5zglhx4oC8hmNsm3uUAA=;
        b=e+QAy50WsgXkD4oFGUbdaoynFK/FUsAUPgRUGAyudJ31+KmjXY92AjOIGRWWyWKmEq
         zI0eCHFua8ttpYMO/GRVVabCTUiVduGUrn2jxDs1LZehcTpLB0j7R/zjKy2OtlwTQunO
         c/oVxPkMJVKuxRohm7dX/QwA3VZAEg5+JbtXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524433; x=1700129233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onLNc+Oko6/d4dZDi8m4Ahc5zglhx4oC8hmNsm3uUAA=;
        b=TLLKQ+GEFiI8MOClSgj0pRWTCX6VEFEQP78mGPdDaYKsBQbE1mh5GU0g0xIHezn747
         Q6YDQdzk1OEaz8NOL3L1pL7gS3158B20Uyve8xOHK/2L9pQHueh/XxUZ0xe7OgOYBmuz
         0oBaENZNtpon0Q7Xj4DJQGT1yAzEH77LNLObz2Nw0PNjRHQcp9oNwKUMD2RIQtLLL18G
         R4NjiF/KUexrfEe7mOQr38R8RLVCC0NjhkHUhBOhsvIBSAWmcec152vPRZ6zLoXx6XyW
         sMJfM7/Il6kWXiSpqty1toiHe11ktwZAzD94F0PkdVgK1ly1MAfdE2bJUW0X6GhGo13x
         1nHQ==
X-Gm-Message-State: AOJu0Yx7hPptY2f9Lhqn4yNB+KVofMbwni6JGOjlfZitDTRr3MRoWdYH
	bHAbqpvDBAj5cv/WksGZUfM4Lg==
X-Google-Smtp-Source: AGHT+IE47jHpK3aDbKhKoDgiHCyXY2l2uWAuEaUiNlv/nfVr6trsVMV2KYbXDfC5qwkSNTHKG8ky5g==
X-Received: by 2002:a05:6a21:19a:b0:181:10ee:20d5 with SMTP id le26-20020a056a21019a00b0018110ee20d5mr6079204pzb.12.1699524433438;
        Thu, 09 Nov 2023 02:07:13 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:07:12 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	petr.tesarik.ext@huawei.com,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH v2 7/7] arm64: dts: mediatek: mt8183-kukui: Merge Krane device trees
Date: Thu,  9 Nov 2023 18:06:04 +0800
Message-ID: <20231109100606.1245545-8-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020714_300855_37A141F9 
X-CRM114-Status: GOOD (  17.80  )
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

In cases where the same Chromebook model is manufactured with different
components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
touchscreens with conflicting addresses), a different SKU ID is
allocated to each specific combination. This SKU ID is exported by the
bootloader into the device tree, and can be used to "discover" which
combination is present on the current machine.

Merge the separate Krane dtsi/dts files into one shared for all SKUs.
A new device node is added for the alternative panel. Both it and the
original panel are marked as "fail-needs-probe-panel" to let the
hardware prober handle it.

Also move the cros_ec node so that all node references are ordered
alphabetically.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  3 +-
 .../dts/mediatek/mt8183-kukui-krane-sku0.dts  | 24 ----------
 .../mediatek/mt8183-kukui-krane-sku176.dts    | 24 ----------
 ...ukui-krane.dtsi => mt8183-kukui-krane.dts} | 47 +++++++++++++++++--
 4 files changed, 44 insertions(+), 54 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
 rename arch/arm64/boot/dts/mediatek/{mt8183-kukui-krane.dtsi => mt8183-kukui-krane.dts} (86%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 7e365e9516ab..d4d97b315b2f 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -40,8 +40,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
deleted file mode 100644
index 4ac75806fa94..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2019 Google LLC
- *
- * Device-tree for Krane sku0.
- *
- * SKU is a 8-bit value (0x00 == 0):
- *  - Bits 7..4: Panel ID: 0x0 (AUO)
- *  - Bits 3..0: SKU ID:   0x0 (default)
- */
-
-/dts-v1/;
-#include "mt8183-kukui-krane.dtsi"
-
-/ {
-	model = "MediaTek krane sku0 board";
-	chassis-type = "tablet";
-	compatible = "google,krane-sku0", "google,krane", "mediatek,mt8183";
-};
-
-&panel {
-	status = "okay";
-	compatible = "auo,kd101n80-45na";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
deleted file mode 100644
index 095279e55d50..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2019 Google LLC
- *
- * Device-tree for Krane sku176.
- *
- * SKU is a 8-bit value (0xb0 == 176):
- *  - Bits 7..4: Panel ID: 0xb (BOE)
- *  - Bits 3..0: SKU ID:   0x0 (default)
- */
-
-/dts-v1/;
-#include "mt8183-kukui-krane.dtsi"
-
-/ {
-	model = "MediaTek krane sku176 board";
-	chassis-type = "tablet";
-	compatible = "google,krane-sku176", "google,krane", "mediatek,mt8183";
-};
-
-&panel {
-        status = "okay";
-        compatible = "boe,tv101wum-nl6";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dts
similarity index 86%
rename from arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
rename to arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dts
index d5f41c6c9881..75a734c0fbcc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dts
@@ -1,12 +1,24 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright 2019 Google LLC
+ *
+ * Device tree for Krane Chromebook family.
+ *
+ * SKU ID is a 8-bit value (0x00 == 0):
+ *  - Bits 7..4: Panel ID: 0x0 (AUO)
+ *                         0xb (BOE)
+ *  - Bits 3..0: SKU ID:   0x0 (default)
  */
 
+/dts-v1/;
 #include "mt8183-kukui.dtsi"
 #include "mt8183-kukui-audio-max98357a.dtsi"
 
 / {
+	model = "Google Krane Chromebook";
+	chassis-type = "tablet";
+	compatible = "google,krane", "mediatek,mt8183";
+
 	ppvarn_lcd: ppvarn-lcd {
 		compatible = "regulator-fixed";
 		regulator-name = "ppvarn_lcd";
@@ -45,6 +57,34 @@ &bluetooth {
 	firmware-name = "nvm_00440302_i2s_eu.bin";
 };
 
+&cros_ec {
+	keyboard-controller {
+		compatible = "google,cros-ec-keyb-switches";
+	};
+};
+
+&dsi0 {
+	panel2@0 {
+		compatible = "boe,tv101wum-nl6";
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		backlight = <&backlight_lcd0>;
+		rotation = <270>;
+		status = "fail-needs-probe-panel";
+
+		port {
+			endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -343,10 +383,9 @@ rst_pin {
 	};
 };
 
-&cros_ec {
-	keyboard-controller {
-		compatible = "google,cros-ec-keyb-switches";
-	};
+&panel {
+	compatible = "auo,kd101n80-45na";
+	status = "fail-needs-probe-panel";
 };
 
 &qca_wifi {
-- 
2.42.0.869.gea05f2083d-goog


