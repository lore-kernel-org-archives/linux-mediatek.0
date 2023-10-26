Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C32FC25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAO4Vq2lAtqVduwbRFXBpJqHTTi1hnz8FUzyO8B5YMU=; b=XrDdOVUorknOyfgjtLIdUjJhfY
	8ydJ+QZF2MWujgi6p/rm7euxuGIuhYSrrQZ2Sa33C0C1H6N5tvlr9gCCMDy5JC+TMxvqfQUqgF3NJ
	Qxfvq0cf/TLxxROFXk0JXFFTKBEhmAeSI9FGZzmuoB5IFu3bXmIn+8D2QsfSsDx95ljwe2MNeToOc
	1j9x/Wh4gGzW4aaMqsUuOGvn3NwTEalOTT5z22g3c/VIZ1DunJ0ZfepPjFFMgwppinHbNelXvH8ul
	HhBz7oEv8z0egRkj8rks+JrhUQsC4b4xbdHCMgnNvXR8m6r9roG/t/sGe13NXDTfqAcMqXlWH4TGn
	XYkNk8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5oH-00F2PM-0l;
	Thu, 26 Oct 2023 19:14:25 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5nm-00F27f-1s
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 19:13:58 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-280011e94ddso606740a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 12:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698347631; x=1698952431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAO4Vq2lAtqVduwbRFXBpJqHTTi1hnz8FUzyO8B5YMU=;
        b=PKVzNL8m9F92HD46zvOr/jzx1FrxP/cQNNWZBVck7aunFvGaswSjJjhDuI6ssi79vC
         2TbLhgHacn90Ct5BWsvJUxbuWpzWMhy1GdDl7xhRAhh0f8s3o4rvI6bj9OaZ4Glkx+rf
         opiorcawrSm4WLws/tktC2iVXlhMgFjVao2GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698347631; x=1698952431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAO4Vq2lAtqVduwbRFXBpJqHTTi1hnz8FUzyO8B5YMU=;
        b=ipQU1L4mqnJibi7VBGXkVWZj0cJ1AcWF4jQdabteYi6Wa2mWLI6oxBifwLToden9II
         m5GzvKs057u2zbfj6n7QkKr0dezKga0lVhpLG74TOnF36mG0rmxg3icGwth6yXq8pBOm
         0dUt17ZLlo8wPaYmmmSJxNbE0ke1B6Gj2P/HXpFJbRrtvZrbapY/1zdc+h3n3CTQxP3A
         DlYBp+F/oUjv9Y93ZsN1E/aeUWpNJ9XG1bQEM1h46lhZhU9gO381MKBlHgNGi64e1enB
         GQj1DlBeJXyxgZeg30XcqHXz0b0yyctpyYi2Bziyrt6rnASGzP/jKizAQ1hJCvfrXwYr
         NANA==
X-Gm-Message-State: AOJu0YymhN+K9f/tnIP5QPcd41CY2lcH5INKeTE7RaR1Obn32J825ssL
	1ONeChqC3drkK1DGDRCeATW1og==
X-Google-Smtp-Source: AGHT+IE6uCrGdUzHI14GAQsOlabr/a7U4b+OoiEvBWYCgy4ZHcU/W16zsfazUOqGXXykfy7jnZB7rA==
X-Received: by 2002:a17:90a:db92:b0:280:e0:9071 with SMTP id h18-20020a17090adb9200b0028000e09071mr520259pjv.28.1698347631047;
        Thu, 26 Oct 2023 12:13:51 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a031600b0027476c68cc3sm2183639pje.22.2023.10.26.12.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 12:13:50 -0700 (PDT)
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
Subject: [PATCH v4 3/7] arm64: dts: mt8183: Add kukui katsu board
Date: Thu, 26 Oct 2023 12:09:12 -0700
Message-ID: <20231026191343.3345279-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231026191343.3345279-1-hsinyi@chromium.org>
References: <20231026191343.3345279-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_121354_642750_4B9A5E5F 
X-CRM114-Status: GOOD (  15.80  )
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

katsu is also known as ASUS Chromebook Detachable CZ1.

Let katsu and kakadu set its own touchscreen and panel compatible. Remove
these setting from the common dtsi for readability.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8183-kukui-kakadu-sku22.dts    | 18 +++++++++
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts | 18 +++++++++
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 14 +------
 .../dts/mediatek/mt8183-kukui-katsu-sku32.dts | 36 +++++++++++++++++
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts | 40 +++++++++++++++++++
 6 files changed, 115 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index e6e7592a3645..a13419e67e8e 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -36,6 +36,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu-sku22.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-katsu-sku32.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-katsu-sku38.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts
index fcce8ea1232e..1ecf39458d93 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts
@@ -14,6 +14,24 @@ / {
 		     "google,kakadu", "mediatek,mt8183";
 };
 
+&i2c0 {
+	touchscreen: touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&open_touch>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_EDGE_FALLING>;
+
+		post-power-on-delay-ms = <10>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
+&panel {
+	compatible = "boe,tv105wum-nw0";
+};
+
 &sound {
 	compatible = "mediatek,mt8183_mt6358_ts3a227_rt1015p";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dts
index ebfabba72507..ba74109a4909 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dts
@@ -13,3 +13,21 @@ / {
 	compatible = "google,kakadu-rev3", "google,kakadu-rev2",
 			"google,kakadu", "mediatek,mt8183";
 };
+
+&i2c0 {
+	touchscreen: touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&open_touch>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_EDGE_FALLING>;
+
+		post-power-on-delay-ms = <10>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
+&panel {
+	compatible = "boe,tv105wum-nw0";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index a23543d7a11e..b6a9830af269 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -63,18 +63,6 @@ &bluetooth {
 
 &i2c0 {
 	status = "okay";
-
-	touchscreen: touchscreen@10 {
-		compatible = "hid-over-i2c";
-		reg = <0x10>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&open_touch>;
-
-		interrupts-extended = <&pio 155 IRQ_TYPE_EDGE_FALLING>;
-
-		post-power-on-delay-ms = <10>;
-		hid-descr-addr = <0x0001>;
-	};
 };
 
 &mt6358_vcama2_reg {
@@ -383,5 +371,5 @@ &qca_wifi {
 
 &panel {
 	status = "okay";
-	compatible = "boe,tv105wum-nw0";
+	/* compatible will be set in board dts */
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
new file mode 100644
index 000000000000..05361008e8ac
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
@@ -0,0 +1,36 @@
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
+	compatible = "google,katsu-sku32", "google,katsu", "mediatek,mt8183";
+};
+
+&i2c0 {
+	touchscreen1: touchscreen@5d {
+		compatible = "goodix,gt7375p";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&open_touch>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
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
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
new file mode 100644
index 000000000000..cf008ed82878
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
@@ -0,0 +1,40 @@
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
+	compatible = "google,katsu-sku38", "google,katsu", "mediatek,mt8183";
+};
+
+&i2c0 {
+	touchscreen1: touchscreen@5d {
+		compatible = "goodix,gt7375p";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&open_touch>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
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
-- 
2.42.0.820.g83a721a137-goog


