Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02583C4708F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 05:26:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B70D460231
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 05:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B70D460231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WxbgrbD0isUlHAqqUy9ilFd6TfnIeZZB8md2LoX4lBI=; b=X43qs3stq9ZOJP
	owT0IHia0utWTNi/bXlT2Z+JyHzky6n8JWHJpKgT0fUhg3VIhz17Xiyl/iCnHJ9siA6Yli+WZ5UgF
	DxVx4hdR5nDtdu0QH+mHJqq0Qwspm3+Zh6zb4ZcOlyZNYoKbxguCVkCAIImU6Dkgj2j71bgFzDkVe
	n2SVIvRjQrXHxRvw+8y9L+IzCE8SVnGQuv8rQp3rbZBdxFtH3pawC+LARaxt4hrnja2btBI9cnLO/
	kdNw3hvQRkqGlD3dP4B74lN5/LhAUMTY3v13z3wv3iWfeaWXkkYPRgJV/F6L32h4w5DMXaLCoO9zO
	EON90GwtaX97uwpoZmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp2Jg-00BaVu-Rz; Fri, 04 Jun 2021 05:24:20 +0000
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp2Jd-00BaUT-LQ
 for linux-mediatek@lists.infradead.org; Fri, 04 Jun 2021 05:24:19 +0000
Received: by mail-pg1-f174.google.com with SMTP id r1so6932032pgk.8
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Jun 2021 22:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou+5Gxt442X8xkeW3uWe3IRZ83ptsxqSonXgl3FX8xQ=;
 b=i/I2bNau508ongcxT99xkVylIKRuF3sa8CpRX7GWqOCafNY3nqX/5+dASBkdhg4YNX
 jnHBexP8FK3Isb4gtHTpgPHeBHA8IuxnpakF5x+tMkQGXqV/2IzDqzmyaQe1kedGO4ET
 K5qaEeUOJ3J8gymFRq/zQqYTGjbMcrg26v7SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ou+5Gxt442X8xkeW3uWe3IRZ83ptsxqSonXgl3FX8xQ=;
 b=m/X6ptmqyXy//OW4bxtIsbuQK2MkI9y5kJCmNarb0AUV1RpFe6ylyrqeTRK0iX+w6H
 nLvxoqJSM57QrjrM7sRM2Skq3bR2LkXlLHYmRPAbAmKOBriG1SXmMRNSanywyJ5Vbd5c
 tUc44tQ3WsjHZr6GJ9Bi0CMpS9w153QMMSgEEANN7lZmHh9dHtf6P9A48fctp68SBFQm
 Z9w8SCNtlwLexhpu/koT2u1Yby/rSqYnMNZcgFPO06smI4gtTB++DrM5Xy5UO+qh4ga9
 uVz36L8qT+QE4C+m6kjeRtcpg56FHkG8BJOchGJs+gVHTZG7LaYGPrJnvwYPaZVeOyWP
 3bAw==
X-Gm-Message-State: AOAM530DI39Dl7WFkAX1weHQwyB9eYPHuiVNWlkiZKNUz4QgDn89YCwG
 5WnR9zAHBczlTvQN27ilpP+kQg==
X-Google-Smtp-Source: ABdhPJyHxxvl5l6bCBee5L8J3KZuCjCbX/zO+AY7q3xVIJW2Ma/t0+sLRjLQ21li9y//x/sE4J8yMQ==
X-Received: by 2002:a63:4b59:: with SMTP id k25mr3183604pgl.252.1622784196837; 
 Thu, 03 Jun 2021 22:23:16 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:886f:8bd0:e6e2:4e47])
 by smtp.gmail.com with ESMTPSA id c15sm754014pgt.68.2021.06.03.22.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 22:23:16 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 1/2] arm64: dts: mt8183: Add kukui-jacuzzi-cerise board
Date: Fri,  4 Jun 2021 13:23:11 +0800
Message-Id: <20210604052312.1040707-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_222417_735469_C733A468 
X-CRM114-Status: GOOD (  14.85  )
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

Cerise is known as ASUS Chromebook CZ1.
Stern is known as ASUS Chromebook Flip CZ1.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
The difference of rev3 and non rev3 are the audio driver they use, which
is not added in this series.
---
 arch/arm64/boot/dts/mediatek/Makefile         |  4 +++
 .../mt8183-kukui-jacuzzi-cerise-rev3.dts      | 24 +++++++++++++
 .../mediatek/mt8183-kukui-jacuzzi-cerise.dts  | 24 +++++++++++++
 .../mediatek/mt8183-kukui-jacuzzi-cerise.dtsi | 13 +++++++
 .../mt8183-kukui-jacuzzi-stern-rev3.dts       | 34 +++++++++++++++++++
 .../mediatek/mt8183-kukui-jacuzzi-stern.dts   | 34 +++++++++++++++++++
 6 files changed, 133 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 4f68ebed2e318..f162d7b028d97 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -14,6 +14,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-cerise.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-cerise-rev3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku6.dtb
@@ -21,6 +23,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel14.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-stern.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-stern-rev3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts
new file mode 100644
index 0000000000000..2776d93561c96
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+
+/ {
+	model = "Google cerise board";
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
index 0000000000000..418b5024d1a7c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+
+/ {
+	model = "Google cerise board";
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
index 0000000000000..ec1561ac395ba
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+&mmc1_pins_uhs {
+	pins_clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts
new file mode 100644
index 0000000000000..05303c4ed7511
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+
+/ {
+	model = "Google stern board";
+	compatible = "google,cerise-rev3-sku1", "google,cerise", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <0>; /* two-wire */
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
+	qcom,ath10k-calibration-variant = "GO_STERN";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
new file mode 100644
index 0000000000000..5be767bc873b8
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-cerise.dtsi"
+
+/ {
+	model = "Google stern board";
+	compatible = "google,cerise-sku1", "google,cerise", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <0>; /* two-wire */
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
+	qcom,ath10k-calibration-variant = "GO_STERN";
+};
-- 
2.32.0.rc1.229.g3e70b5a671-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
