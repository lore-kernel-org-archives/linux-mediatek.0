Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7157FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SFZxwVqocktpKzLlLaFe/qkrzOFrvB2HrmMNFAAsn+Q=; b=MIfYbzi6QkLJ1r
	Uz5oVhOoBjW5BPVd/OgxNlh3cxs2u/hNQKzPhzO0tIUZ9u5woUijr4gPy+sUoD8CNMfo91uUSg1+3
	BnZNS3skm7EnsdUu452yTbDdVJYGNoQ6CLDIsBzbPzpBm61BMAbaXRvi9YAdqGKLIpwAM8YSggQRw
	6XIa/cQLp60P2iaFssrK3/7mPjjQyuXpj0G6SUjeiTVKBWVRrDfJG0RSvK4vmeN4wVIeO6vhogb1H
	/1g3vOy5Y621M437HTMmCxh5wwDIyMa/rwWd0jK2qLi+ZTZQ9aiSSfYcN/YY8xhG/5oBtn6qml9Jy
	h0cQocB7OeW7Qs94jiFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwfh3-0083hH-4J; Mon, 13 Dec 2021 07:24:17 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwfgm-0083Ze-56
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 07:24:03 +0000
Received: by mail-pg1-x532.google.com with SMTP id a23so9183630pgm.4
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Dec 2021 23:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=biiS4C+lzKL6rUA1uy2e/g9FiWgrw/yETmDilWklXNU=;
 b=T7rVDQXjtXmre8S0xW2CXVZcG/2HRk5R14pskRLXBBjohD2FR2eLw1cXil+NRSg4hF
 zqSmiZMtwNxtiv+calopqdA/qqSj80D7h8G8LZzHZQ+PXFKXXX5tZYpcEIm8bJIVVQLB
 QNyfFYbV8PhRRTHFW6QLGksFwcaetUJ94u0Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=biiS4C+lzKL6rUA1uy2e/g9FiWgrw/yETmDilWklXNU=;
 b=bfnfzYtvpHymuDpUuoKf5+j0n1DPuhfhWMcXBkGhMqkD6ayFjGqSR6UwDxz4lL7FsT
 CdJygQa0UsJixfukA6aBGYroJO3+xHe07c+9zZ7ctL89GzF7Yct8vGDz/S/UdBeQpZKT
 Tl8ioqS3Idlt5kt+BuKTwEz8DUtA+qZOsoWV/ds9HlBt/D5glWT7Cc7TpdnoqbfeBgy5
 rQbtivbEGHoWDGnlnmnuqPEOjnacadsBtxs+V5SyiJeFbLEPNzOGKYKkGu+T4dClN7cE
 XLdrPHTJSS6cU+h3KkLQ2TUkrlu4yvywhyniBOwD+Jf+ICqP8DPui+/RU1EcYYxTJjR2
 86ug==
X-Gm-Message-State: AOAM533RfxVf4XO56giQS34zxNt3PE0UmAtC1TXNm2jgudsgKkrYQTU+
 sGWC5zfbKo48LQRkQ4gQkbz6dA==
X-Google-Smtp-Source: ABdhPJzB+Lv5TFVQBHvLgUX1xC1pkNvNMiganBL73XvNFU8yrcgNpweyaXo3YnNiyHRB6nVBhsL8hw==
X-Received: by 2002:a63:da4d:: with SMTP id l13mr8956999pgj.452.1639380238960; 
 Sun, 12 Dec 2021 23:23:58 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id e7sm11747562pfv.156.2021.12.12.23.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 23:23:58 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: mt8183: Add katsu board
Date: Mon, 13 Dec 2021 15:23:52 +0800
Message-Id: <20211213072355.4079568-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_232400_218177_3EDCD752 
X-CRM114-Status: GOOD (  13.11  )
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

Katsu is known as ASUS Chromebook Detachable CZ1.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
This patch depends on [1] to add Himax8279d MIPI-DSI LCD panel driver.

[1] https://patchwork.freedesktop.org/patch/462468/
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../dts/mediatek/mt8183-kukui-katsu-sku32.dts | 38 +++++++++++++++++
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts | 42 +++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 1613259b686576..c130518c3293d5 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -28,6 +28,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu-sku22.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-katsu-sku32.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-katsu-sku38.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
new file mode 100644
index 00000000000000..f923b8c3c49c36
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kakadu.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
+
+/ {
+	model = "MediaTek katsu board";
+	compatible = "google,katsu-sku32", "google,katsu", "mediatek,mt8183";
+};
+
+&i2c0 {
+	status = "okay";
+
+	/delete-node/touchscreen@10;
+	touchscreen1: touchscreen@5d {
+		compatible = "goodix,gt7375p";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&open_touch>;
+
+		interrupt-parent = <&pio>;
+		interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&pio 156 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&panel {
+	compatible = "starry,2081101qfh032011-53g";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_KATSU";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
new file mode 100644
index 00000000000000..1ab14096a279c6
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kakadu.dtsi"
+#include "mt8183-kukui-audio-rt1015p.dtsi"
+
+/ {
+	model = "MediaTek katsu sku38 board";
+	compatible = "google,katsu-sku38", "google,katsu", "mediatek,mt8183";
+};
+
+&i2c0 {
+	status = "okay";
+
+	/delete-node/touchscreen@10;
+	touchscreen1: touchscreen@5d {
+		compatible = "goodix,gt7375p";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&open_touch>;
+
+		interrupt-parent = <&pio>;
+		interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&pio 156 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&panel {
+	compatible = "starry,2081101qfh032011-53g";
+};
+
+&qca_wifi {
+        qcom,ath10k-calibration-variant = "GO_KATSU";
+};
+
+&sound {
+	compatible = "mediatek,mt8183_mt6358_ts3a227_rt1015p";
+};
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
