Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA420CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 23:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFPxN5h4Yz/Kh95Kwg/dHQdP+2ryagu2J01cqKKyODk=; b=vwcDfeyD3KlEEMPFzHpc11uks6
	Vxmkt1Y+2HoKKPfB1hL8cayoNmclqCXWExV6sONg1ww2c9DoA+Wb/8XB8KBBipKJd3KogGBw/TA06
	bl2Z/Kn10BeF0JeZvWL2pyPZOEVzNuY61b85Jx4l2zVe13+E33gzYfPbpoRMZ0pKDk4QQ2QU08bQW
	0F2sbiTUZ5sa7I943gRm5K92vowAtK2qvGk9AiozaMnoAMRdmTho6ntayQ3bE2Rgk5HimVpXrYs0W
	8WnPLlJYfNB/w8LTWrBpuR/MHHeIR2hdBnc3HstdhvDypkjixi44lm/30Ai8COly1K03+ql3p34fJ
	0OxugMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4iE-00239w-1C;
	Thu, 12 Oct 2023 23:03:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hy-0022wD-0s
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 23:03:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c9b7c234a7so13345085ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 16:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697151790; x=1697756590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFPxN5h4Yz/Kh95Kwg/dHQdP+2ryagu2J01cqKKyODk=;
        b=MeCEuYR5mYDzIblBisEj/MWGpI8MuaoJm4U09oIULVbKQVMCT383XcxWzhuLfxnq0q
         iqJ9H2gkzgEzHRM8VcQfBe22u+yc1A+MuXCBXSERJXKa0JVyH0aHIF27sGKu4lhnPP86
         30M6JgUZCIt+4cBABDS9wPrTOkG28w1woZDtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151790; x=1697756590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFPxN5h4Yz/Kh95Kwg/dHQdP+2ryagu2J01cqKKyODk=;
        b=TuFxwxIcZEpA+ys/kNR4M+dJgUqtGOJQa1M2sT3Y0zJ5jGtsBeh9jlf9BFekmcbgce
         qmVBjxXtvcBSSotZtEPPzGW/Teg7BkN1s1yJmrpC5Yy1+gFabYqYGh/xbOUAxqe+md2N
         tawki4YI2i+kJ48h5b2QFSI15FJ2Q9LNelwOPkGEI4oq3sl0wJqADNd+74Vrl1OvAiQt
         5NqeP0rRXMG0+zU0C8/g9owV/HV8lOenG7P/YDqX8Ml6O8BjuuzfQhAhiGlr5JHUwB7f
         Wdp/qc5Vqs25s4a1g/wseQwWxaZIhLj6eKugHrM/mDISlTdICT0ZF+5FhSRnBWi81gjV
         uQZg==
X-Gm-Message-State: AOJu0YwlJxO2WLxlv46l8ibL9i1bG92HiWeq+Ek6mLJE+YRyeEEzjJsr
	C3T7iJ5OyELotZ3f3CXVWOvQwA==
X-Google-Smtp-Source: AGHT+IEwiBTYiXyw0ylqmM0RWi8WMP5G5S+LI3ARjay2AD+Tzo7msM4hIoDmDwH8vRIRJqHScqQhSA==
X-Received: by 2002:a17:902:d481:b0:1c8:7d21:fc50 with SMTP id c1-20020a170902d48100b001c87d21fc50mr24606295plg.56.1697151789811;
        Thu, 12 Oct 2023 16:03:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7397:2561:ed13:bac8])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001c613091aeasm2494390plt.297.2023.10.12.16.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:03:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: mediatek: Add MT8186 Magneton Chromebooks
Date: Fri, 13 Oct 2023 07:02:35 +0800
Message-ID: <20231012230237.2676469-10-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231012230237.2676469-1-wenst@chromium.org>
References: <20231012230237.2676469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_160310_371146_9524709C 
X-CRM114-Status: GOOD (  16.39  )
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

Add entries for the MT8186 based Chromebooks, also collectively known
as the Lenovo IdeaPad Slim 3 Chromebook (14M868). It is also based on
the "Steelix" design. Being a laptop instead of a convertible device,
there is no touchscreen or stylus, which is similar to Rusty. However
Magneton does not have ports on the right side of the device.

Three variants are listed separately. These use different touchscreen
controllers, or lack a touchscreen altogether.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  3 ++
 .../mt8186-corsola-magneton-sku393216.dts     | 38 +++++++++++++++++++
 .../mt8186-corsola-magneton-sku393217.dts     | 38 +++++++++++++++++++
 .../mt8186-corsola-magneton-sku393218.dts     | 21 ++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 6b05f1f2e645..7e365e9516ab 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -43,6 +43,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131073.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts
new file mode 100644
index 000000000000..7406e7a29fcc
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-steelix.dtsi"
+
+/ {
+	model = "Google Magneton board";
+	compatible = "google,steelix-sku393216", "google,steelix-sku393219",
+		     "google,steelix", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
+
+/delete-node/ &gpio_keys;
+/delete-node/ &touchscreen;
+
+&i2c1 {
+	touchscreen: touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		interrupt-parent = <&pio>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp3300_s3>;
+		status = "okay";
+
+		post-power-on-delay-ms = <350>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
+&usb_c1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
new file mode 100644
index 000000000000..b1806e0b2782
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-steelix.dtsi"
+
+/ {
+	model = "Google Magneton board";
+	compatible = "google,steelix-sku393217", "google,steelix-sku393220",
+		     "google,steelix", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
+
+/delete-node/ &gpio_keys;
+/delete-node/ &touchscreen;
+
+&i2c1 {
+	touchscreen: touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		interrupt-parent = <&pio>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp3300_s3>;
+		status = "okay";
+
+		post-power-on-delay-ms = <450>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
+&usb_c1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts
new file mode 100644
index 000000000000..c70f196f115b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-steelix.dtsi"
+
+/ {
+	model = "Google Magneton board";
+	compatible = "google,steelix-sku393218", "google,steelix-sku393221",
+		     "google,steelix", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
+
+/delete-node/ &gpio_keys;
+/delete-node/ &touchscreen;
+
+&usb_c1 {
+	status = "disabled";
+};
-- 
2.42.0.655.g421f12c284-goog


