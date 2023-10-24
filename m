Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52157C25B67
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 00:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/cqlLo1xMu6vyNWnJHXRu9HX9PDmOzSMx42M7GKBk4=; b=PYYkszEWqapan1
	wj45STN8/C4BlHyxXwtf/aFZWvNW9t24ji3/pn2sNkeXtOyr09TB8EtaybgmKDUvakhf1kIzs3BAz
	OM9OYKPE9D2adtOlF0G3l9REACNdjFsdOoWS3w5stNEBLvuSkFeGZfaDMGCOeYVcTkDmypAb8up57
	gtlszHQc7q2s1CIq5UxUNBK5QPmS+VzPenun1yNKDUsiuA/YZLCDDg9jlSdlT8Zql9h+Sdy1Qu6Ml
	V1uFlkNntTm0VVMBLHxHoLQ9u5MKbBNl/QTJBOkfMW6QTQhCLmc9jce1vH2/VEKjXLcy65fPOSPTz
	hsYHyQsTGlhpbCD8XhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xQ-008Us3-2h;
	Tue, 24 Oct 2023 00:07:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xL-008UnL-19
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 00:07:36 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ca82f015e4so24398105ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 17:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698106052; x=1698710852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/cqlLo1xMu6vyNWnJHXRu9HX9PDmOzSMx42M7GKBk4=;
        b=RoM2Q+zImIEt1b5oizao58PuAtO12T8gg1lOhirLZeYhhh/YnnbF1FcCIsriWbSq+T
         UxfLyqqmCeT8uC9Vg+MYnfAn2hCSoysScRx0vHDmLt7+InYG4Bg1usieC9ftbGw+XVzz
         8b0PzHV6dgc+XhshyLlcbh5U+eHY1tIQUG6ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698106052; x=1698710852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/cqlLo1xMu6vyNWnJHXRu9HX9PDmOzSMx42M7GKBk4=;
        b=oXGYENiVj1GoRh1LMETQ7stFmwS+7/AoPdLMX7OhUweMUDzKLYrkoU7cA89n9+1xEb
         FFd5psyqXxhTeDdfh85M+jrOj+tpu/juk2J2Cmhkugrtzu+HNXkRY1BAlvgAFBSwHllA
         mci1035FDMSbWmg5HjGFmUyP5OXnPtorHU3m1KYy/QXxFFSorqhFQ9WoT7HswXg5F4U7
         paLKCydzm5HVRL0/D5zrdHETpJRIZjnf4Zu7nBLb9pEemnJIl+cngtHFGZXjgvVjnXNN
         AroHzwaV9a8+OWl6YeulHjjf93zp60nJLt5LJXyY3+CMbost6nzcg0vwzX2gZmtqs5Wy
         T6mA==
X-Gm-Message-State: AOJu0Yxgclou1Thjib4IZVosYwaTIKw/PPClqYkso6Mynf1NfXAKMJfd
	RXDMSAsjNGr4gnWIMj8n9aR9Gw==
X-Google-Smtp-Source: AGHT+IFT8y4oceUEuy0SEQ+ul3MihnsSlfHCilt0mzADZwMzgUKtHOU072RmvvZwuEF1XYCziybQyA==
X-Received: by 2002:a17:903:28cd:b0:1c3:5f05:922a with SMTP id kv13-20020a17090328cd00b001c35f05922amr7136070plb.60.1698106052413;
        Mon, 23 Oct 2023 17:07:32 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902ecca00b001c5dea67c26sm6505510plh.233.2023.10.23.17.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 17:07:32 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/6] arm64: dts: mt8183: Add kukui katsu board
Date: Mon, 23 Oct 2023 17:02:25 -0700
Message-ID: <20231024000724.57714-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024000724.57714-1-hsinyi@chromium.org>
References: <20231024000724.57714-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_170735_398319_0A79F7D8 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

kodama is also known as ASUS Chromebook Detachable CZ1.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts | 44 +++++++++++++++++++
 .../boot/dts/mediatek/mt8183-kukui-katsu.dts  | 40 +++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dts

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
new file mode 100644
index 000000000000..491d04692432
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kakadu.dtsi"
+#include "mt8183-kukui-audio-rt1015p.dtsi"
+
+/ {
+	model = "Google katsu sku38 board";
+	chassis-type = "tablet";
+	compatible = "google,katsu-sku38", "mediatek,mt8183";
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
+		vdd-supply = <&lcd_pp3300>;
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
+
+&sound {
+	compatible = "mediatek,mt8183_mt6358_ts3a227_rt1015p";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dts
new file mode 100644
index 000000000000..595b0afdb2db
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kakadu.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
+
+/ {
+	model = "Google katsu board";
+	chassis-type = "tablet";
+	compatible = "google,katsu", "mediatek,mt8183";
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
+		vdd-supply = <&lcd_pp3300>;
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
-- 
2.42.0.758.gaed0368e0e-goog


