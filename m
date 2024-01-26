Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DA5C47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cu18IbHxxXKtnHnv1Cjrlq/8T8VeE5Y4i7fvBtBG5WM=; b=HpCvscB1RksDjquU2qoRwYkc/Y
	VoLXiktEkiZ/uZf1nWCIZjqyRcu4S5O5o6Tiyj0xVng0vOfAIAknVV2CVPILMfNjdbBLmVKs3ryuz
	5GGjk92Ddn6Yu1TCoIC5sY4QiLHbZaW3exRhalxaiIQGaBYIYjM1nLRuMRVc9A6hXSGPhWjpK3nx8
	5FKDwX3GbPLFK1hwtOMLc8Z7V6NUKoE4S5U/8PYooE70EgjdGO5OSghWQXRF5Bi6+KvugGFEz1J00
	r+q9H+TZsDKSyCOPDXSoC0wWm5Dr0BTNicTRJf4swOhjVBrZaAN6rzB+Z2IJMys5mRUGJNPV3yb4g
	m2hg0exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHkZ-00000003TL5-25d5;
	Fri, 26 Jan 2024 08:39:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjR-00000003SoY-17cE
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 08:38:39 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ddd1fc67d2so62501b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 00:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706258316; x=1706863116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cu18IbHxxXKtnHnv1Cjrlq/8T8VeE5Y4i7fvBtBG5WM=;
        b=gMaE3fDvDTnhLy5gaeW81IE9wx9vR3pmJFiZ1Nsc8U62D+jPetdgFNhHSrLwNN/P5Z
         JsCT/Lk4DP9yswnSbSGfvC63UHJAKnRcHfLRTwGqXM0BZkw4qdH9wWin5OIP00f6vzey
         OWEOrvVY1ptevr7fZYFrGtpZ9g/m1JJgH20s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258316; x=1706863116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cu18IbHxxXKtnHnv1Cjrlq/8T8VeE5Y4i7fvBtBG5WM=;
        b=CnUgpfId9ze412uEnpZa84fgbntIwGLr8D8ZFIjIbdSTnLW5WRMIVYdo54LUSLBwpP
         hgSn3+FfJqyLEO6HXoUe/aBeFHpDkyf961iUnWPjfjqlEg/eiJplVhImH6P3cd2sRiZv
         t431lKxpOfcUJxTy9bnc1C7hT6uWHc7sBA4A84dGj9HFot92kZ7lau0hmt3bd+wz3Dtl
         EyUD0LQOgCf2iVswOsZlzU9YPLwMtCfeTcCYyhA0M+2ACz1AJKEsnkQkNSSDffVLPtPJ
         LBd+gLqoVJtZG4BI29QVPBSzVqkyHxrL9+bfxfeKnfjx7MIeHjnHIYDtF9gZ52odjW/R
         dh/w==
X-Gm-Message-State: AOJu0Yw319ltHRx07HnMpU7ZFD2Of3A6uoWzMGdI5VyPdn3VReBsX/N3
	GS2rViH+c320Ed8fbJsDrHNhsEFtyORw6oblFOYfwWNiG7fj3U3eGcuh3w0cxw==
X-Google-Smtp-Source: AGHT+IHrJdgf7K5kb7KjqgIdj8SsIOraefdm8h6pf1HU8AyGQCgzAZBADpnEzvhmhI1vr0s+vJlvWQ==
X-Received: by 2002:a05:6a20:6d11:b0:19a:9989:8de1 with SMTP id fv17-20020a056a206d1100b0019a99898de1mr697021pzb.42.1706258316117;
        Fri, 26 Jan 2024 00:38:36 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902a9c200b001d6ff1795aesm589529plr.8.2024.01.26.00.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:38:35 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 9/9] arm64: dts: mediatek: Add MT8186 Magneton Chromebooks
Date: Fri, 26 Jan 2024 16:37:58 +0800
Message-ID: <20240126083802.2728610-10-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126083802.2728610-1-wenst@chromium.org>
References: <20240126083802.2728610-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_003837_450274_BF4C4820 
X-CRM114-Status: GOOD (  16.85  )
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
there is no stylus, which is similar to Rusty. However Magneton does
not have ports on the right side of the device.

Three variants are listed separately. These use different touchscreen
controllers, or lack a touchscreen altogether.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v4:
none

Changes since v3:
- Collected reviewed-by from Angelo

Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.
- Mark missing components as disabled instead of deleting the node
- Switched to interrupts-extended in touchscreen nodes
- Dropped reset-gpios from touchscreen nodes
- Drop status = "okay", which is the default
---
 arch/arm64/boot/dts/mediatek/Makefile         |  3 ++
 .../mt8186-corsola-magneton-sku393216.dts     | 39 +++++++++++++++++++
 .../mt8186-corsola-magneton-sku393217.dts     | 39 +++++++++++++++++++
 .../mt8186-corsola-magneton-sku393218.dts     | 26 +++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 48327471de12..9896a388e30e 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -51,6 +51,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
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
index 000000000000..c9673381ad3b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dts
@@ -0,0 +1,39 @@
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
+	compatible = "google,steelix-sku393219", "google,steelix-sku393216",
+		     "google,steelix", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
+
+&gpio_keys {
+	status = "disabled";
+};
+
+&i2c1 {
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		vdd-supply = <&pp3300_s3>;
+		post-power-on-delay-ms = <350>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
+&touchscreen {
+	status = "disabled";
+};
+
+&usb_c1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
new file mode 100644
index 000000000000..28e3bbe56421
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dts
@@ -0,0 +1,39 @@
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
+	compatible = "google,steelix-sku393220", "google,steelix-sku393217",
+		     "google,steelix", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
+
+&gpio_keys {
+	status = "disabled";
+};
+
+&i2c1 {
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		vdd-supply = <&pp3300_s3>;
+		post-power-on-delay-ms = <450>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
+&touchscreen {
+	status = "disabled";
+};
+
+&usb_c1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts
new file mode 100644
index 000000000000..332894218f07
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dts
@@ -0,0 +1,26 @@
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
+	compatible = "google,steelix-sku393221", "google,steelix-sku393218",
+		     "google,steelix", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
+
+&gpio_keys {
+	status = "disabled";
+};
+
+&touchscreen {
+	status = "disabled";
+};
+
+&usb_c1 {
+	status = "disabled";
+};
-- 
2.43.0.429.g432eaa2c6b-goog


