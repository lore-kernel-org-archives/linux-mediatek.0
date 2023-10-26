Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F67DC25B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkZn+U4Wu9+OkFBGF0q0OH+o+7fW9Y2LfpUD4qU656Q=; b=qA23rXsv8m9z7OsZ0ITJN28ag4
	9FHc5jR4C0brM6BjfpMmS1mcyqxIK7cLoS/WBfpimBOl+tuce4MbUzP/zteqHKqimpeo3eL7ULdlB
	79LZ50fSc2lwY6sGwBb872DTWAfRf77D/M3d2DpG8MOU+w9By/weS9Yj98hPfyEB7ec+d5Bh8T5aC
	AJ9kuMerEEXW0ZXFOQEvTRsuCoCa9RgJ8qk6+dY60sGAwZac6l38/NeELRuQll5s3zjDRqH2IHJ5a
	UkGLGXtf/JH7A6xLPxxWUEPaY4kPVSYrCO2L8cGCUCYzLD3G5eUM512OEfnlc6j93s2sPvtASeJ2b
	BlUZWOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5oc-00F2Wl-1n;
	Thu, 26 Oct 2023 19:14:46 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5nq-00F2At-0j
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 19:14:01 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-584a761b301so1073039a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 12:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698347635; x=1698952435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkZn+U4Wu9+OkFBGF0q0OH+o+7fW9Y2LfpUD4qU656Q=;
        b=LtUh0xaqDZyBuwz/TanETijilldLyFXuaJH6vp+InMyb1zzlv0xOMfUxKxFEbafbV4
         KuuK7KHuMpuYZhEoicC7ZYS18nhqPICrhB+BG7tQc/fgIT3arFDem8HrK6MFh8nA9Nb1
         8vXlawrsKWRZSHdIJDgmyhYs4jmit2dSBh0tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698347635; x=1698952435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkZn+U4Wu9+OkFBGF0q0OH+o+7fW9Y2LfpUD4qU656Q=;
        b=vQqlpLKS8MyuIIuXRK67nI2YN4748sxODsoKGlj+YeWubfeBFFHmOQ2ZDv0uCIyrAK
         KVAReKez7rdMmwogo3J3cuUK3cp4SBgY3J3sReRKAhTPn5Ezbif/Mv/Papl4CSe8v9Nu
         Mx5l+5FIQ+GrPlHD7LbfB5E+6vge5BXSE0rzRbkDXJE+mQPZfQ2eV/6GBpo0ROaRiV89
         0WSPLmJIEYjrFOVaEbHACoL27agDQJh1qKz6Wb4/PTVWrWhgWcK3V9u7WLlab2lDMT6/
         BtS1FVUwhssgi8ohpFN2fhXRoGrAUlM1D9vmYe/kovnJ3yQ+la/emJr0hEBeMlzkD+HC
         ZTUw==
X-Gm-Message-State: AOJu0YwS1n3sFAmFjtvbjQ+j8IuK5aich1jLbQgaA1r9ig6g0gBeO2GD
	gnHnYdSdFTO1pIGRUQJZGSo4SP+eNk8EB7f3C8E=
X-Google-Smtp-Source: AGHT+IGP4O9vPP2T8OqN76SUfejnT4iizwcqXE3U6WJq4ArhjjGIhWGRJua8zBBO7fkBTgQ/twu1gA==
X-Received: by 2002:a17:90b:3889:b0:27d:72bb:3d92 with SMTP id mu9-20020a17090b388900b0027d72bb3d92mr448994pjb.19.1698347635401;
        Thu, 26 Oct 2023 12:13:55 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a031600b0027476c68cc3sm2183639pje.22.2023.10.26.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 12:13:55 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 7/7] arm64: dts: mt8183: Add jacuzzi pico/pico6 board
Date: Thu, 26 Oct 2023 12:09:16 -0700
Message-ID: <20231026191343.3345279-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231026191343.3345279-1-hsinyi@chromium.org>
References: <20231026191343.3345279-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_121358_296690_DD41658D 
X-CRM114-Status: GOOD (  15.36  )
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

pico is also known as Acer Chromebook Spin 311.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8183-kukui-jacuzzi-pico.dts    |  36 ++++++
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   | 110 ++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 1b85a8c12850..ed174dde97e1 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -34,6 +34,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-makomo-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-makomo-sku1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-pico.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-pico6.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
new file mode 100644
index 000000000000..e230323b3a54
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+#include "mt8183-kukui-audio-ts3a227e-max98357a.dtsi"
+
+/ {
+	model = "Google pico board";
+	chassis-type = "convertible";
+	compatible = "google,pico-sku1", "google,pico", "mediatek,mt8183";
+};
+
+&i2c_tunnel {
+	google,remote-bus = <0>;
+};
+
+&i2c2 {
+	i2c-scl-internal-delay-ns = <25000>;
+
+	trackpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		hid-descr-addr = <0x20>;
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
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
new file mode 100644
index 000000000000..a2e74b829320
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+#include "mt8183-kukui-audio-ts3a227e-max98357a.dtsi"
+
+/ {
+	model = "Google pico6 board";
+	chassis-type = "convertible";
+	compatible = "google,pico-sku2", "google,pico", "mediatek,mt8183";
+
+	bt_wakeup: bt-wakeup {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_pins_wakeup>;
+
+		wobt {
+			label = "Wake on BT";
+			gpios = <&pio 42 GPIO_ACTIVE_HIGH>;
+			linux,code = <KEY_WAKEUP>;
+			wakeup-source;
+		};
+	};
+};
+
+&i2c_tunnel {
+	google,remote-bus = <0>;
+};
+
+&i2c2 {
+	i2c-scl-internal-delay-ns = <25000>;
+
+	trackpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		hid-descr-addr = <0x20>;
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
+&wifi_wakeup {
+	wowlan {
+		gpios = <&pio 113 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&wifi_pwrseq {
+	post-power-on-delay-ms = <50>;
+
+	/* Toggle WIFI_ENABLE to reset the chip. */
+	reset-gpios = <&pio 8 GPIO_ACTIVE_LOW>;
+};
+
+&wifi_pins_pwrseq {
+	pins-wifi-enable {
+		pinmux = <PINMUX_GPIO8__FUNC_GPIO8>;
+	};
+};
+
+&mmc1_pins_default {
+	pins-cmd-dat {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+	pins-clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
+
+&mmc1 {
+	bt_reset: bt-reset {
+		compatible = "mediatek,mt7921s-bluetooth";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_pins_reset>;
+		reset-gpios = <&pio 120 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pio {
+	bt_pins_wakeup: bt-pins-wakeup {
+		piins-bt-wakeup {
+			pinmux = <PINMUX_GPIO42__FUNC_GPIO42>;
+			input-enable;
+		};
+	};
+
+	bt_pins_reset: bt-pins-reset {
+		pins-bt-reset {
+			pinmux = <PINMUX_GPIO120__FUNC_GPIO120>;
+			output-high;
+		};
+	};
+};
+
+/delete-node/ &bluetooth;
+/delete-node/ &bt_pins;
-- 
2.42.0.820.g83a721a137-goog


