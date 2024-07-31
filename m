Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD69C3DA64
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GodjSzZjglvIcZivuCk4eEiWLuu6d/Fu0dSIBqFwyU0=; b=E1Qy3E/YJIqmt+RQLPIdxCtasD
	jzSf8i2NvxfGwBKajyOAeUeHL9S3BYi++gJ6TC8NfSj6Qgc26g4qU5kGfTSxnrmMioJJPrYPPXxaJ
	iCfaz7xF7AYlgYrVZGcoOe5RsR0onf0imEB3wsQBu4aB9KMEIM/8iJd2rIZ+hWpQfmMUxifSXZ8Bm
	be4ZpqoMoh5akJP+oi1O2jgoVNZTOrq14j7bGksIGQXG1h9G/xRq6DQM5oswVb1oGlWXnHOg4e76U
	jBnpMvdJNl59VuXT4nol//bs8fj+EWWOq0fveGVc2NoesJ0dqb0uaqjAYl3eFWl5w25AvRnQ5G3QA
	Z0xyrPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2oI-0000000HXX4-0BLu;
	Wed, 31 Jul 2024 06:27:42 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2nM-0000000HX59-1nFm
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 06:26:45 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-260e208e126so3347131fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 23:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722407203; x=1723012003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GodjSzZjglvIcZivuCk4eEiWLuu6d/Fu0dSIBqFwyU0=;
        b=e2lPnUdlVdnEHK2/wtHs4Xykqwd58B/LwypK/lT6LtkREmpXYnMykwjlbsfgZ4pl9t
         RJo/JpZo/t3gyeuyvO134bhW2QguBFO7B6Edzus0diLKVfm4uIZ07rN5rccqOFimjBUt
         cY/u5Qc16wrORMKmQ6sYKZzqyyyxfsTw1gNik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722407203; x=1723012003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GodjSzZjglvIcZivuCk4eEiWLuu6d/Fu0dSIBqFwyU0=;
        b=J+uSgbJoZWyRl/fXhQ7YHWy7M2Zwkaoifg5cFP7pVVrwB98AaaNioAXPqfBAGhHxaL
         zm+CjQK5A1MYUgCypSoJDQkAB/1d0KBxU4vYCKq+5oOwtQ8KQb4egfmzKVEgjDC+R9g7
         cG/+qOlqGDQtXpJaZ2I95ezswkHb+QUgOSEGlPzTk+jyIgJbrkfKZ36ku5QqoNqiNs5f
         QFKgX9k6lz5ywW7F/GbxSfW9FY9tC2/95ztWqMur4/ZoTAEijXQ0A3UWk3fDfNZSmquw
         1hXQ+rBbrs+Ou9cVLHfsBygcQ/SutUe8mlRZwhkQe4Lxro81HJuIiTnS/oBFTuzssU98
         tm7w==
X-Forwarded-Encrypted: i=1; AJvYcCWc+SfQthpkQlvw/ZCTHTR0/NGSuJVZaweJw2RU92gzvNYUQ9SBwOgkHf+T/oEMBLppG+FJYPsALjJjQm7YSCcXjySWYp8w4llJZWjkGCPl0KB9
X-Gm-Message-State: AOJu0YziN3fi+EpP+CYXV65nx68Z5ZJtNAM3ku1hr9N9PvcyrDKBIYM+
	MG+F1H2cXH9Rrmjw1Ki8mJpfOgiTYX2k9P03gJsFOF8hdSRBjFyC6MEvop8uYeVQ1uOlObk/ZrQ
	=
X-Google-Smtp-Source: AGHT+IE5cO6elkp+RbpkElRPUZQpfS6+qxtX7GtiU4GBwza51W+DWB1Oh82y74IN1jB769y+tJoF5g==
X-Received: by 2002:a05:6870:440d:b0:261:1177:6a62 with SMTP id 586e51a60fabf-267d4f41835mr15988146fac.49.1722407202879;
        Tue, 30 Jul 2024 23:26:42 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e1084sm9322308b3a.25.2024.07.30.23.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 23:26:42 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 31 Jul 2024 06:26:35 +0000
Subject: [PATCH v2 1/2] arm64: dts: mt8183: Add kukui-jacuzzi-cerise series
 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-jacuzzi_dt-v2-1-4995335daa30@chromium.org>
References: <20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org>
In-Reply-To: <20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_232644_484967_BDA57191 
X-CRM114-Status: GOOD (  13.94  )
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

Cerise is known as ASUS Chromebook CZ1.
Stern is known as ASUS Chromebook Flip CZ1.

They are almost identical. The only difference is that Cerise is a
clamshell device without touchscreen and Stern is a convertible device.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile              |  4 +++
 .../mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts  | 26 +++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts   | 26 +++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi  | 21 ++++++++++++++++
 .../mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts   | 29 ++++++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-stern.dts    | 29 ++++++++++++++++++++++
 6 files changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 8fd7b2bb7a15..17fbe495e4ee 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -28,6 +28,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-cerise.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-cerise-rev3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-cozmo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku1.dtb
@@ -42,6 +44,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-makomo-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-makomo-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-pico.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-pico6.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-stern.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-stern-rev3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts
new file mode 100644
index 000000000000..c511dd1cc171
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+#include "mt8183-kukui-audio-ts3a227e-rt1015p.dtsi"
+
+/ {
+	model = "Google cerise board";
+	chassis-type = "laptop";
+	compatible = "google,cerise-rev3-sku0", "google,cerise", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
+&touchscreen {
+	status = "disabled";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_CERISE";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts
new file mode 100644
index 000000000000..12b97dcaa74a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
+
+/ {
+	model = "Google cerise board";
+	chassis-type = "laptop";
+	compatible = "google,cerise-sku0", "google,cerise", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
+&touchscreen {
+	status = "disabled";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_CERISE";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
new file mode 100644
index 000000000000..087a0ef33e13
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+&cpu_thermal {
+	sustainable-power = <4500>; /* milliwatts */
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
+
+&i2c2 {
+	i2c-scl-internal-delay-ns = <13200>;
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts
new file mode 100644
index 000000000000..19e09da1d166
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+#include "mt8183-kukui-audio-ts3a227e-rt1015p.dtsi"
+
+/ {
+	model = "Google stern board";
+	chassis-type = "convertible";
+	compatible = "google,cerise-rev3-sku1", "google,cerise", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <0>; /* two-wire */
+};
+
+&touchscreen {
+	compatible = "hid-over-i2c";
+
+	post-power-on-delay-ms = <10>;
+	hid-descr-addr = <0x0001>;
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_STERN";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
new file mode 100644
index 000000000000..72de05ffea86
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
+
+/ {
+	model = "Google stern board";
+	chassis-type = "convertible";
+	compatible = "google,cerise-sku1", "google,cerise", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <0>; /* two-wire */
+};
+
+&touchscreen {
+	compatible = "hid-over-i2c";
+
+	post-power-on-delay-ms = <10>;
+	hid-descr-addr = <0x0001>;
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_STERN";
+};

-- 
2.46.0.rc1.232.g9752f9e123-goog


