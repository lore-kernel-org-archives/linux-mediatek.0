Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CD2C2BA18
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3CqtMl8gkLPqmxGGSK7XhTY2wKYDh56L/Juo8O2EDM=; b=p6gTLfWygQHplYXWPrjq7G3nvK
	1Lg533RvUub71ggFOHSG0aYn3LVnM2FXjhB9Tn9hnX7Tyz7R7knJwrbUwvThmSpyo1kmE58d+vN5f
	v5+p8yEBqmRpWVVXRKJqyejnujOwedm/AXUJ7R+kFaqHuScAurBf/yk6BidTW3UNMGd3iURq9LH5e
	KB6ayAdw2RWE+UoKguwi0NhqC0XysXLqNzH1A242PW4RmqpP+8xrDHALBVo6nWXKKjbsqMexLJk6+
	1aYkVa91O+En3bBuD2yg15qGKiNh8A05hljoprqV9gKZkE196Mo8tQUZ+HktDlqqmg9nQ70uoqtfX
	77PEXnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEOo-00000004Ryc-15dc;
	Thu, 20 Jun 2024 09:48:10 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEOf-00000004Rsl-32Mh
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 09:48:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-705fff50de2so498774b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718876881; x=1719481681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3CqtMl8gkLPqmxGGSK7XhTY2wKYDh56L/Juo8O2EDM=;
        b=ChOvlmPPedTkvcj05cwduMNAKY4s/wBoblQHRZ9XPSP0KZvDmViDpevhthBru5RoCt
         aEifmJyvC0gPGRgoEZz45rpNhFFiYmGtXWfpp9ihX3XI1mVgT+McJfaWRlL3nGxzW4E8
         ZxTGnIR9ZS+5W9BaR9gX/g76m7Lfg0Dl4+TCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876881; x=1719481681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3CqtMl8gkLPqmxGGSK7XhTY2wKYDh56L/Juo8O2EDM=;
        b=UCSIKJ99zRDk3DabTARu74H9GohvBM+P3wmfofkLOxLSyKwGuYs943cGV/2AFRVDQo
         XE5BIuOOHHEb7XpzqLK4ODpF2sZB+62wYeP7TxUIVU4/1oInl85/pD5HYd7tmBjbmyDe
         Cw3dG3TP0sZMzEMf5+w8BwQc4q1m2HHH0RPOx8FmTQmWEpAMPJG8ALBS8E4EqcFpV+0t
         UIGtwDxdRIsiaG2f9J8i/wxgDPABdHrQ0s1HtpGNAWho+l7GuzplH4pGbA+owcN/APXg
         6aqYPt3rt68hejOCHaWnmx+RMA17DAk6LA0xBUuO7ju7VpioNboafykMz9jCU3Xy/Cnm
         ueLA==
X-Forwarded-Encrypted: i=1; AJvYcCWYo8xja+5crPDMyANhBmvV1c3z3ZFowCJq89WGejvn1XUQJBg2WpL1pdRrUpAT+sTiXkkaQkw3lWC8CcoqovfslVJxrxXkdb7l3jzOjMqiC02G
X-Gm-Message-State: AOJu0YyiHQhWKxnuUQ9zigv9Umc+lIsfRRLMXAYBxibp8BThDfblnbVj
	hUBf3L90IEQu4hlpRxogeVGNez5wJOHrifUnrzthY2h5QCYl21QD17qnF/GMJg==
X-Google-Smtp-Source: AGHT+IE/YKGh11hC25P1P7PsiOqyiQ1Sp4JfOu2bt/xS/JbX8LDN8ZBilCH/xsgMZ5XdiVA+PMWmbw==
X-Received: by 2002:a05:6a21:328d:b0:1bc:bdc9:75e8 with SMTP id adf61e73a8af0-1bcbdc97673mr6501372637.29.1718876880803;
        Thu, 20 Jun 2024 02:48:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c53a:5326:7f72:759f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-70dbae52920sm4164469a12.42.2024.06.20.02.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:48:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: mediatek: Add MT8186 Voltorb Chromebooks
Date: Thu, 20 Jun 2024 17:47:38 +0800
Message-ID: <20240620094746.2404753-4-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240620094746.2404753-1-wenst@chromium.org>
References: <20240620094746.2404753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_024801_844150_6F1EF5E3 
X-CRM114-Status: GOOD (  17.14  )
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

Add device trees for the MT8186 based Voltorb Chromebooks, also known
as the Acer Chromebook 311 (C723/C723T). The devices are clamshell
style laptops with an optional touchscreen.

The devices differ from the other existing MT8186 Chromebooks in that
it uses a higher speced / binned SoC which also requires a separate
PMIC for the big core cluster. Also, a different codec is used for
the internal speakers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 +++
 .../mt8186-corsola-voltorb-sku589825.dts      |  25 +++++
 .../dts/mediatek/mt8186-corsola-voltorb.dtsi  | 103 ++++++++++++++++++
 4 files changed, 143 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a2d128b17c45..e0cb1b35acfd 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -64,6 +64,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589824.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589825.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
new file mode 100644
index 000000000000..d16834eec87a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-voltorb.dtsi"
+
+/ {
+	model = "Google Voltorb sku589824 board";
+	compatible = "google,voltorb-sku589824", "google,voltorb",
+		     "mediatek,mt8186";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
new file mode 100644
index 000000000000..45e57f7706cc
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-voltorb.dtsi"
+
+/ {
+	model = "Google Voltorb sku589825 board";
+	compatible = "google,voltorb-sku589825", "google,voltorb",
+		     "mediatek,mt8186";
+};
+
+&i2c1 {
+	touchscreen@10 {
+		compatible = "elan,ekth6915";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
new file mode 100644
index 000000000000..52ec58128d56
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/spmi/spmi.h>
+
+#include "mt8186-corsola-steelix.dtsi"
+
+/ {
+	chassis-type = "laptop";
+
+	max98360a: max98360a {
+		compatible = "maxim,max98360a";
+		sdmode-gpios = <&pio 150 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&cpu6 {
+	proc-supply = <&mt6319_buck1>;
+};
+
+&cpu7 {
+	proc-supply = <&mt6319_buck1>;
+};
+
+&gpio_keys {
+	status = "disabled";
+};
+
+&keyboard_controller {
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+		CROS_STD_MAIN_KEYMAP
+	>;
+};
+
+&mt6366_vproc11_reg {
+	status = "disabled";
+};
+
+&cluster1_opp_14 {
+	opp-hz = /bits/ 64 <2050000000>;
+	opp-microvolt = <1118750>;
+};
+
+&cluster1_opp_15 {
+	opp-hz = /bits/ 64 <2200000000>;
+};
+
+&rt1019p{
+	status = "disabled";
+};
+
+&sound {
+	compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound";
+	status = "okay";
+
+	spk-hdmi-playback-dai-link {
+		codec {
+			sound-dai = <&it6505dptx>, <&max98360a>;
+		};
+	};
+};
+
+&spmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spmi_pins>;
+	#address-cells = <2>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@6 {
+		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+
+		regulators {
+			mt6319_buck1: vbuck1 {
+					regulator-name = "ppvar_dvdd_proc_bc_mt6319";
+					regulator-min-microvolt = <600000>;
+					regulator-max-microvolt = <1193750>;
+					regulator-enable-ramp-delay = <256>;
+					regulator-allowed-modes = <0 1 2>;
+					regulator-always-on;
+			};
+		};
+	};
+};
+
+&touchscreen {
+	status = "disabled";
+};
-- 
2.45.2.741.gdbec12cfda-goog


