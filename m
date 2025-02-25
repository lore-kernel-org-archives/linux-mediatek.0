Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734AAC021B6
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=of1Aj+b2AygxrQL0A6JMIgE22awWJ2bmoSsFSdWAD6k=; b=vA5KvLasA6t5AIsE3r4YRTSP6I
	WjuFmZUosNUYenMgnUcz73znpFTkZxX6/rsO5h38vv9GRZt4bvuvc4s+COVXq3HlU8WyPIsbSWzmj
	A8j6yOw/zlmhcVZAAuG6EyFgLXdU3+A8ewowWNkDP2Udc8Me/jJFLgTLZXDkwnr8yKv0OpJTOTI/U
	MdNTIfqLj5cxkISMQBlZ/t9qOuX1X7s9P/9UET2jV5nKnU6F4WQ4P6ZVDLudeYUJmSig520xpHy1g
	YSPKpsDzj6OeL/T8ejtINRELHRv5tqeFYWB3Cu416kv/YlkWgwl+agxL3QYiCPB1LQswd8sasOh/d
	/7p3gppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsbR-0000000Gupv-1sTG;
	Tue, 25 Feb 2025 10:55:53 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms1K-0000000GnFA-45jz
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Feb 2025 10:18:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so97147166b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 02:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740478713; x=1741083513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=of1Aj+b2AygxrQL0A6JMIgE22awWJ2bmoSsFSdWAD6k=;
        b=yTngpXFaGAWUNT5c7Fx0/GBU60NBz5Q1d0Qy0I+UTAeJLmoHsa/EXYJDKTDFvsKAWA
         sTwsb6XGGoy5lk4UNltBaLtBgucFXozw+Iuerig2cr19pdXWIgmiOKpD5leIpBFzx2RV
         eII28kkqgxuxjz3GkrTuFOh9IEXqtFlf/gP7tQ8ROOADn7K974MOesnNqQguPd81zNY0
         gQuhAHszYOQZwyD/rcDhc0Cj5woXR1H44I0cBqOrGcodOm2sFCjHAPY3TWe8lpMUOr8w
         LNpIslHiJjJth7fpsMAw+3kpZfQJH0lx9ykm32zRqhi4ZqExkUoMl2Dr9tZ6j1+CPP2H
         LHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478713; x=1741083513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=of1Aj+b2AygxrQL0A6JMIgE22awWJ2bmoSsFSdWAD6k=;
        b=ICzfcEd1miR+agjp02fsbSkoGxA5o2zMvvMcLr/F34w+k05dMARMeGR6IRwpgG1wEm
         5aFilSSmogcZ2SuWo0+/fHZcsmlhLW+XCPsPkPsfYWRroWv5aW/miTFGXjwq7aujAeJS
         +lNYFx1yb357jZ/x1aV4/a+Ionwy+Tr35ojMqjYdDt2Lee8l52+dvUyMibBHWQHDFA5g
         7ZNQAbJv26mPM9NA2VPsMR9/bA3Emk2u+nR0NJWAoYPUxd8G+vzSGaRFpQsjpSuVaa2M
         HFw0UVa0wdQ8eFiUZiVsPTr35uL1JsefrQN8fc8pOsPMPPmJnhMKMqSkCqTGaC2TXmTI
         IncQ==
X-Forwarded-Encrypted: i=1; AJvYcCU917M2n8FdmhnNAWOB5QRT3etuk6Y0o9gMMhWA4pKij5l4rrphp5gNcygOhkJYxfgJAkFM35qgMKqOGyq5ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvnan+SmfhmrK/Ifsm+TlC+619N+c+3hgodjsHvst0H2Q1lgSG
	X1FEHHe+CufvVy5vQ5s+pjL8KPl4PywN4urRq961P+9Ly2YgRTfN90FBHDHMKtiP8gG/xo9koIX
	fu0E=
X-Gm-Gg: ASbGncsltw6QdwKHALN3wNiK3w4EhUAOyJCwqQzMwB1fHUsyAepDvDwt+vRtsl5mEoh
	KmFuS6gkOfnIW5Bzj50STzixqdtYFg8d34VCHEOuQ8V+f4l8Bjcb5bk8ty3UbzgFTfB5OoZl8gR
	jqnqYawGU/wQJdxeGFYBqgyEndcb0jbum04bM0WXYHk6AvZerT5tXW5muAzzRivHG1y58TfGCCY
	YFTWyb4xTHE5+IopedzamB935PVBrYDZfSzoq30RMUJw9Q8BIqw26ThYIAYLX//CqrOORZkaNMT
	iztLitudJ6NFkhoeoIz53uQuq9z/zf1IrF0lAgSgVPq7cUkTR5KPWatJI1BxdiackUd9gOXHlhM
	=
X-Google-Smtp-Source: AGHT+IF/O2qgzDlpSiG1lR7ObLbGjnnjV2zONrsTr1vx1NDwvqVNso6CnH5NNmLxDNPJVXo6dnHsfQ==
X-Received: by 2002:a17:907:9713:b0:ab7:5fcd:d4be with SMTP id a640c23a62f3a-abc099c6a2dmr707107666b.1.1740478713100;
        Tue, 25 Feb 2025 02:18:33 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2016014sm113954566b.112.2025.02.25.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:18:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC] arm64: dts: mediatek: mt8183: Switch to undeprecated qcom,calibration-variant
Date: Tue, 25 Feb 2025 11:18:28 +0100
Message-ID: <20250225101828.107509-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021835_008765_7E803CB3 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

The property qcom,ath10k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Dependency/RFC!

RFC, because this should be merged release after driver support is
merged:
https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts     | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts    | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts  | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi  | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts      | 2 +-
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts      | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi   | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi           | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts       | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts       | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi           | 2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi            | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
index 83bbcfe62083..f2303d9f125f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
@@ -35,5 +35,5 @@ trackpad@2c {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_COZMO";
+	qcom,calibration-variant = "GO_COZMO";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 3935d83a047e..13ec15fa284f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -31,7 +31,7 @@ &mt6358codec {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_DAMU";
+	qcom,calibration-variant = "GO_DAMU";
 };
 
 &i2c2 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index 72852b760038..b576b974cf23 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -40,6 +40,6 @@ &touchscreen {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL";
+	qcom,calibration-variant = "GO_FENNEL";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 757d0afd14fb..d64581f35d2c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -28,6 +28,6 @@ &touchscreen {
 
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL";
+	qcom,calibration-variant = "GO_FENNEL";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index 6641b087e7c5..d0c98d0aba95 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -28,6 +28,6 @@ &touchscreen {
 
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL";
+	qcom,calibration-variant = "GO_FENNEL";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
index 877256eab262..3a81786084da 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
@@ -14,5 +14,5 @@ / {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+	qcom,calibration-variant = "GO_FENNEL14";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
index b981dd31a430..959c4d3d9707 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
@@ -14,5 +14,5 @@ / {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+	qcom,calibration-variant = "GO_FENNEL14";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
index 078bc765646f..4788edaeab87 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
@@ -22,6 +22,6 @@ trackpad@2c {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_JUNIPER";
+	qcom,calibration-variant = "GO_JUNIPER";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
index ddb993521bbf..01cd59993a7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
@@ -14,7 +14,7 @@ / {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+	qcom,calibration-variant = "GO_FENNEL14";
 };
 
 &mmc1_pins_uhs {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
index 10c4f920a7d8..c939ef3965ec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
@@ -14,7 +14,7 @@ / {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+	qcom,calibration-variant = "GO_FENNEL14";
 };
 
 &mmc1_pins_uhs {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
index c942e461a177..14d03419b92c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
@@ -37,5 +37,5 @@ trackpad@2c {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_JUNIPER";
+	qcom,calibration-variant = "GO_JUNIPER";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index ff02f63bac29..c4c08c0f715e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -370,7 +370,7 @@ keyboard-controller {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_KAKADU";
+	qcom,calibration-variant = "GO_KAKADU";
 };
 
 &panel {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
index 2b5a8d1f900e..7428efec95a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
@@ -32,5 +32,5 @@ &panel {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_KATSU";
+	qcom,calibration-variant = "GO_KATSU";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
index 75fadf2c7059..a36b6ddb71f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
@@ -32,7 +32,7 @@ &panel {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_KATSU";
+	qcom,calibration-variant = "GO_KATSU";
 };
 
 &sound {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index da6e767b4cee..2b283a55f653 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -349,7 +349,7 @@ keyboard-controller {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "GO_KODAMA";
+	qcom,calibration-variant = "GO_KODAMA";
 };
 
 &i2c_tunnel {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index 8b56b8564ed7..00da50a41574 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -353,7 +353,7 @@ keyboard-controller {
 };
 
 &qca_wifi {
-	qcom,ath10k-calibration-variant = "LE_Krane";
+	qcom,calibration-variant = "LE_Krane";
 };
 
 &sound {
-- 
2.43.0


