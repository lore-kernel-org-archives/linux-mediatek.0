Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC16AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SFZxwVqocktpKzLlLaFe/qkrzOFrvB2HrmMNFAAsn+Q=; b=AwocTbVaarVrXk
	9Aw4hAF25r5/SdA1LaQxrxJgJK7yJhjaZ406u053nVVb78xu93HkEegQJ77lv8vYiZYGImlclxOWq
	MxRzIA1I1/XWk+wHJtnwn0WrrMJZT2EJU6xGPmrWGXizpaCSnsDAW0bKWcSnWzDwpNQmLaDfHDUOR
	MQObhhmffMDCnlG8rMlcAZXz53Kq3xXDIznNkGLKF29S+DZPRpRRU5GRZuIl2uTbGoE4Stdyrmp4N
	CzkjyH/Pom2kwm9xRHo9YXDY1CE8M+YOdv8PQJBdu1WAClsbxMjaXoRQOi9ay/ap8uy1HMMm4zwJL
	LwA4X8q/eBQEXZw9zF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwoCK-00Ab46-BF; Mon, 13 Dec 2021 16:29:08 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwoCD-00AazA-W4
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 16:29:03 +0000
Received: by mail-pf1-x42e.google.com with SMTP id p13so15409394pfw.2
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 08:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=biiS4C+lzKL6rUA1uy2e/g9FiWgrw/yETmDilWklXNU=;
 b=ZNU/Ru1HXHA2pan1cQDKzDswLSjrFIllZ81BXCYBuYNczkeO21KelJQO+wLXueWJT0
 NwAYq4Cqdw9GeoFHo63gUB6MjRyclPXlwv3iK8k1YCpfUHhOQsGaB4lcKDWqOnCdH5Fo
 dBFPlXLOwc2Z5ZaNzzlzQbyXZnBwHEz6FlR7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=biiS4C+lzKL6rUA1uy2e/g9FiWgrw/yETmDilWklXNU=;
 b=21EefMLs+tm55ce0S4tQS5U/EsxTKa6V29ZmFAaK5fhcGUHvncVLIdMQ5v/2D5lIua
 4Faz2uPdO8qa/3s7XDotE+g9pEzzIT37heS/4/+adCQ8yL6W7kPJoG5lSrmPlDqwsbLO
 Fd3NDUUJlG/4NWz6HcECLePE11FLfyIunNisPMz0SjkRTCn0eR1EX76WzYGajmY8PbWu
 CT+J7Ovr9uG7NDWGkeQcnCes1XFw+Eo+ZD/H21AREJOeRBHWmNT89hQb7ehBTQB7jqEf
 RYwnGc2sI+PTbFOAGjImAnLQ958kp9RFRjBRR+nidOCd2GovZ4Xva2rvT2EpsG1efnON
 WhkA==
X-Gm-Message-State: AOAM532X3oi+OngvZtxVAXDCgcObDQZaCKeVGcI4j8pE3gcRtYQvd+0F
 deZn6yGN/wxl0cFpMa2SaBSQjA==
X-Google-Smtp-Source: ABdhPJzn6LYGfIvTwksk0xQNlW/W3F8r99EJcrlLsE/jQtJCtI4G4XKP/gnT/rT6mUIH5J6AL5Drzw==
X-Received: by 2002:a05:6a00:1385:b0:4ad:580d:8a8 with SMTP id
 t5-20020a056a00138500b004ad580d08a8mr33932528pfg.10.1639412940703; 
 Mon, 13 Dec 2021 08:29:00 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id mh1sm7803802pjb.6.2021.12.13.08.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 08:29:00 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: mt8183: Add katsu board
Date: Tue, 14 Dec 2021 00:28:53 +0800
Message-Id: <20211213162856.235130-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_082902_108341_A113CE55 
X-CRM114-Status: GOOD (  12.99  )
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
