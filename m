Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A4CC10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jy3wE8QoVFuCdeDjxGiH3OX0Xt5eOjHqlvzeLRn8ddk=; b=Zlpz4BEXwmZ1FCjz2mK6+/ePdN
	pDQ2HUxO5c4lJtKGCfrhhTR9r64mVAe7olAh3aJ21Xpg3nubmGDT6HvrEY8pPofdMcEwlT7tr7ugn
	EItfU2LTpaKQTPvNXHnvNbiNE3JPMtcvnmZ4xMOkF8/hvlLAZ2WW1f/Z3fpdHDWtftn0RrmhphneB
	0XiSKsYgneJAo79FQKOivFaH8fgd+0cbEMalpPOV8oBtvMk1UIRiNzYnbY1enYIs/C0n7DPKUbsC7
	zFaYqz7UBRRteFfAXiPQuBD1p72IiuV8WjJKd0ITsCjh4olEM/GZGFq1EeBiz8tc4jVP6iQgWfDR4
	Bs3GiHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4Xe-003Imx-2R;
	Mon, 04 Dec 2023 08:43:02 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XJ-003ISu-1N
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d04d286bc0so13336585ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679361; x=1702284161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy3wE8QoVFuCdeDjxGiH3OX0Xt5eOjHqlvzeLRn8ddk=;
        b=XOggRDtRqnNn76qGpx3PeOT4jnGPeqjtVGWKvxcyf/F7/RvVhYuIWt2p+nt7Z0GJqu
         8aNqO6sYukQlcEWJYIOJvaCE7uWLOuR13PjrNLozxByqx5qh891M9vzzQ2LounrOWLlE
         YwN1t8VaHVIg6+1C9kftKTWnozCy21M3YBblI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679361; x=1702284161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy3wE8QoVFuCdeDjxGiH3OX0Xt5eOjHqlvzeLRn8ddk=;
        b=MpHlzieoOw5w9ZXI2LBesNu71GaL1AnKQIc9B/FYxCSJgWu0WW3lzN76bTNZCRgZkD
         VnZ38hJHxoLYC3RULE5NjkoU7V4nLJnu3YvQTldJN7Sp8DUBBkZDFH+p2fipYtczR3X3
         XYkpmqgsbGEWYV0i1GO5zKR2YXc8Yt7MPMnyO0FQlug0AoRUKMJ+NiQfssvX59GPbex7
         fWacPirx/jcRe+ygVxT7Yqpqrd1ZNq5X7nBov8mb+6DBfMyNKswr8yq4ASQsUcQDN4Xe
         X75yP2Sykpm2xY/8rD7f6rVeSiEGsT7KC2B7r1f5rJKUU3rsIG8Ai2gKNN/H2hW8f0PN
         QCZA==
X-Gm-Message-State: AOJu0YxyPg7T6Ar67QBp0y3YtKYfXFCJ5JRWp1EHpLtRq7UhkiN35nxB
	IAORmF2ozHS+bPSAWnkGSEF5Sw==
X-Google-Smtp-Source: AGHT+IEPGBPJ8kYyNF14VJdYMjPUal8vsvhVNFDhDwyTws8/JnGl7oITwY5R9dTBjQ+Tb0w+uP12tA==
X-Received: by 2002:a17:903:1104:b0:1d0:8876:7082 with SMTP id n4-20020a170903110400b001d088767082mr961866plh.72.1701679360934;
        Mon, 04 Dec 2023 00:42:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:40 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 9/9] arm64: dts: mediatek: Add MT8186 Magneton Chromebooks
Date: Mon,  4 Dec 2023 16:40:11 +0800
Message-ID: <20231204084012.2281292-10-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204084012.2281292-1-wenst@chromium.org>
References: <20231204084012.2281292-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004241_480558_9DA7FA61 
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
---
Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.
- Mark missing components as disabled instead of deleting the node
- Switched to interrupts-extended in touchscreen nodes
- Dropped reset-gpios from touchscreen nodes
- Drop status = "okay", which is the default

 arch/arm64/boot/dts/mediatek/Makefile         |  3 ++
 .../mt8186-corsola-magneton-sku393216.dts     | 39 +++++++++++++++++++
 .../mt8186-corsola-magneton-sku393217.dts     | 39 +++++++++++++++++++
 .../mt8186-corsola-magneton-sku393218.dts     | 26 +++++++++++++
 4 files changed, 107 insertions(+)
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
2.43.0.rc2.451.g8631bc7472-goog


