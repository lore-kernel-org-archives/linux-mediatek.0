Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D2C25B70
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEfKy8RhyGOVxHTIJDdIS07Ad83fgC8FjysuvnSTTyQ=; b=PWwF9czgNA9IFMxcfA7mi9PHy3
	V0nRFnJqqLclh20Md3dVbRidNx0Lowu2MN/WgccmFSaxLRn2Y+Aqm21OgPLcdmLZicrmN4WVdbvyY
	dSypbB2Rb9kNkGUtmRoJF2hpmkVltLVF+/1i74mtQ+ENYyqQTu1yyqeskNpN2Z8Jl8MdMuXUPs8Zr
	qLI36w0UsZxoXitywHR0yeaDF4xPuvHUK6w6usS2zKvXiv9xiLB713TkIBMNm68bs+0r4voHCnjQ1
	UEXF6Mdmjrtrjlv65T4Y9Yy/twGLTL1yEVXytZJ0irvIFlkJuLL+Aq+VTb5ZGDgQCTSzrV+BmOVFM
	mhgPpGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqk-00DCrM-0c;
	Wed, 25 Oct 2023 21:55:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqd-00DCji-2q
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 21:55:34 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6b1e46ca282so205834b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 14:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698270928; x=1698875728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEfKy8RhyGOVxHTIJDdIS07Ad83fgC8FjysuvnSTTyQ=;
        b=KBuJUt0LQ1iZWKRflY1YsUoLSPX9zb3XFfV/P18lp7yo4pK7aAap+8N3utU9b7TKWu
         e7Q2lJNIog99jQo82L2l3rh5FWg2c14wrn1sa0XOyRJnSQU802CCkrnVh3eJ3DsoAJ+k
         pHvLedscfCbdb6L4hi4CWwSPxheu6BD/Ll4vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270928; x=1698875728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEfKy8RhyGOVxHTIJDdIS07Ad83fgC8FjysuvnSTTyQ=;
        b=YnbcaR09/VTpqyfxISQUO8Vu5w1reSHNV8O/cjyhbl6MerJo1BG1hxtIRMfPpGLkn2
         zHSpayV71Q/mn6YL7kf7BeCGWjEQJ3TEzDYek0SFeZS5YB1zF4C/Bdo5eL88L6+csaHl
         CG2QuNHlGr0mSPTw1G/zx9B9WHzG+cIhYEKVQQz/0Y97warLq9b7Nli4Xv+bf6eUuyQL
         XO7HkgN9j/iHhHBLpI0Rg+LES2hmtxKrhFNKbz16vPQEvNNC7hs1zTFenC3CEOSZcl45
         gKH1sq0fOfGcSQSpJxFquWg9Zf1fVQtlUu0cPlCGvpUEaBYeUSK8l5bpRNwU7qy3pBcH
         Rygw==
X-Gm-Message-State: AOJu0YxEwzVMgCVs+Ef23mkSZiorexo39JUjaHR26Ewwaf6haTc8KCzL
	yfd/m0q4izR9iCmAII8qEriYzg==
X-Google-Smtp-Source: AGHT+IGObdYqsckT2K8tu/eeMqz6oQlt3HNCIlHe6QNro0NHPg1bmfQIxcUK7yTgLmIgfT5+VxiQfQ==
X-Received: by 2002:a05:6a21:4841:b0:172:9b19:66b6 with SMTP id au1-20020a056a21484100b001729b1966b6mr6706548pzc.32.1698270927727;
        Wed, 25 Oct 2023 14:55:27 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id w14-20020a63160e000000b005b8ebef9fa0sm2994943pgl.83.2023.10.25.14.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:55:27 -0700 (PDT)
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
Subject: [PATCH v3 3/7] arm64: dts: mt8183: Add kukui katsu board
Date: Wed, 25 Oct 2023 14:48:45 -0700
Message-ID: <20231025215517.1388735-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231025215517.1388735-1-hsinyi@chromium.org>
References: <20231025215517.1388735-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_145531_929367_1F414180 
X-CRM114-Status: GOOD (  16.28  )
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
v2->v3: clean up panel and touchscreen.
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8183-kukui-kakadu-sku22.dts    | 18 +++++++++
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts | 18 +++++++++
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 15 +------
 .../dts/mediatek/mt8183-kukui-katsu-sku32.dts | 36 +++++++++++++++++
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts | 40 +++++++++++++++++++
 6 files changed, 115 insertions(+), 14 deletions(-)
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
index a11adeb29b1f..b6a9830af269 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -63,19 +63,6 @@ &bluetooth {
 
 &i2c0 {
 	status = "okay";
-
-	touchscreen: touchscreen@10 {
-		compatible = "hid-over-i2c";
-		reg = <0x10>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&open_touch>;
-
-		interrupt-parent = <&pio>;
-		interrupts = <155 IRQ_TYPE_EDGE_FALLING>;
-
-		post-power-on-delay-ms = <10>;
-		hid-descr-addr = <0x0001>;
-	};
 };
 
 &mt6358_vcama2_reg {
@@ -384,5 +371,5 @@ &qca_wifi {
 
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
2.42.0.758.gaed0368e0e-goog


