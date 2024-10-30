Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2762AD7497B
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF1qEJly3xEvubxa1plhNMCfVxpYmwCDO14UJEUO81M=; b=4vxRxQ5XkGR6PZuInY5y41m5xo
	/rXi+zG3O3A6nACcv2mn3fOZLdW9xCl/YB7LWHtCzP2whoecBHf+Tkq/qdus13Ko9EhZ1+gZmSeEu
	5LgfYcZiej/eSEa39E7BGQzGYqaByF/togd1pyqTJEQVbSu0/VpE0BJ2weX4AyUcEhfyan2AMK+rI
	ZVGA6Xn4O7HxmQYr8sAvc7NrP9sBagfURflDOrEMeij6DG/0PZgnpPWZRv2t4jApx3t7Wa7AgAHDC
	DZcCqYFVh9TiHr6GJ8Hl4FNvlQsxpGImja3YGr9HwKnlvDGLwDt/fX9A26c3Y6S6RR2T5YQWIwrGs
	u+zUrpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62nm-0000000H4sG-0X2H;
	Wed, 30 Oct 2024 07:07:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62iw-0000000H47x-0P73
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 07:02:35 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so4989244b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 00:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730271753; x=1730876553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF1qEJly3xEvubxa1plhNMCfVxpYmwCDO14UJEUO81M=;
        b=JCF9QTSgE8lZn+Pwa4Z2VpnE6qCxaRIQnL3fLpiIeMrdJ7yuTeG9W6mhVyojIlr9JL
         hjrAtzwvZXeirUyMqkWBJEI1yj3I/wNQGEE6usgOdAcX2K3U4W87B8FrIf+sijEVedqE
         zPswSMvvAa37buvGPIFmB0IbSuuCt/1Gw1M6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271753; x=1730876553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF1qEJly3xEvubxa1plhNMCfVxpYmwCDO14UJEUO81M=;
        b=Ekxi7Ll6RsiVi3tHljecUB9QL6DR7JfMMGSXzPXBDr3gd9R45f1Fy5OBn0dSbaXowz
         2eIXWQaMVqFUzMGx+d/ghtBzlFwZJ072au0hR759rARuKXFTBvF6AoCplMZKHP6m64Hm
         A3W5UuVmxVNExCZddEuj0Zitnl6GNLRoGuaB48Co89uVsNGsuzvQPw3MGAdc/1LMErMc
         tw2VMjsBj9OfoBxh8rPCuTvTTjy+pCAXTiTUAjNX/kRSDKEbdZkeosw91z5cK/D99mbz
         6evOR8TzE9UVo99KHO5D3JMVaY6z7AOFCQU0cs4EfomZG7qqeU2rgxctPDqGLwXhCtjA
         i69w==
X-Forwarded-Encrypted: i=1; AJvYcCXmcVNXkJDWvhsauV7LfkiJpZs23joCve7lPDG75EfTtejpMgAY9H0gPa2DDFgBBP5ySe3jayP4hNG3ejHNTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX8pl/Zu82KfkM5Py2iuQ35y+wsqAPDYsQxWvhd7EXVZ2vlZpC
	P6iQgj1gojhB09JmWpM7uvjyY2nKKKoYyKT2I3fYIln5t6N4rP4vzCgkuKqybg==
X-Google-Smtp-Source: AGHT+IFLPfQ/A5eko0pgXITap2wpEZJrJtsvHymtQmufWyNzTU2B5jU7ujsLfLpOT0HBExHRm0TYeA==
X-Received: by 2002:a05:6a00:8cf:b0:71e:587d:f276 with SMTP id d2e1a72fcca58-72063093364mr18860624b3a.25.1730271752832;
        Wed, 30 Oct 2024 00:02:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a94sm8635848b3a.68.2024.10.30.00.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:02:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Fix DP bridge supply names
Date: Wed, 30 Oct 2024 15:02:21 +0800
Message-ID: <20241030070224.1006331-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030070224.1006331-1-wenst@chromium.org>
References: <20241030070224.1006331-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_000234_166973_38E756C7 
X-CRM114-Status: GOOD (  10.56  )
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

Some of the regulator supplies for the MIPI-DPI-to-DP bridge and their
associated nodes are incorrectly named. In particular, the 1.0V supply
was modeled as a 1.2V supply.

Fix all the incorrect names, and also fix the voltage of the 1.0V
regulator.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 7bbafe926558..f540dcac74ea 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -8,11 +8,13 @@
 #include <arm/cros-ec-keyboard.dtsi>
 
 / {
-	pp1200_mipibrdg: pp1200-mipibrdg {
+	pp1000_mipibrdg: pp1000-mipibrdg {
 		compatible = "regulator-fixed";
-		regulator-name = "pp1200_mipibrdg";
+		regulator-name = "pp1000_mipibrdg";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pp1200_mipibrdg_en>;
+		pinctrl-0 = <&pp1000_mipibrdg_en>;
 
 		enable-active-high;
 		regulator-boot-on;
@@ -24,7 +26,7 @@ pp1800_mipibrdg: pp1800-mipibrdg {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1800_mipibrdg";
 		pinctrl-names = "default";
-		pinctrl-0 = <&pp1800_lcd_en>;
+		pinctrl-0 = <&pp1800_mipibrdg_en>;
 
 		enable-active-high;
 		regulator-boot-on;
@@ -44,11 +46,11 @@ pp3300_panel: pp3300-panel {
 		gpio = <&pio 35 GPIO_ACTIVE_HIGH>;
 	};
 
-	vddio_mipibrdg: vddio-mipibrdg {
+	pp3300_mipibrdg: pp3300-mipibrdg {
 		compatible = "regulator-fixed";
-		regulator-name = "vddio_mipibrdg";
+		regulator-name = "pp3300_mipibrdg";
 		pinctrl-names = "default";
-		pinctrl-0 = <&vddio_mipibrdg_en>;
+		pinctrl-0 = <&pp3300_mipibrdg_en>;
 
 		enable-active-high;
 		regulator-boot-on;
@@ -144,9 +146,9 @@ anx_bridge: anx7625@58 {
 		pinctrl-0 = <&anx7625_pins>;
 		enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
-		vdd10-supply = <&pp1200_mipibrdg>;
+		vdd10-supply = <&pp1000_mipibrdg>;
 		vdd18-supply = <&pp1800_mipibrdg>;
-		vdd33-supply = <&vddio_mipibrdg>;
+		vdd33-supply = <&pp3300_mipibrdg>;
 
 		ports {
 			#address-cells = <1>;
@@ -389,14 +391,14 @@ &pio {
 		"",
 		"";
 
-	pp1200_mipibrdg_en: pp1200-mipibrdg-en {
+	pp1000_mipibrdg_en: pp1000-mipibrdg-en {
 		pins1 {
 			pinmux = <PINMUX_GPIO54__FUNC_GPIO54>;
 			output-low;
 		};
 	};
 
-	pp1800_lcd_en: pp1800-lcd-en {
+	pp1800_mipibrdg_en: pp1800-mipibrdg-en {
 		pins1 {
 			pinmux = <PINMUX_GPIO36__FUNC_GPIO36>;
 			output-low;
@@ -458,7 +460,7 @@ trackpad-int {
 		};
 	};
 
-	vddio_mipibrdg_en: vddio-mipibrdg-en {
+	pp3300_mipibrdg_en: pp3300-mipibrdg-en {
 		pins1 {
 			pinmux = <PINMUX_GPIO37__FUNC_GPIO37>;
 			output-low;
-- 
2.47.0.163.g1226f6d8fa-goog


