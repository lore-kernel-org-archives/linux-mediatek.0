Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FE3C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Js+9WH9QY5NhhDtejqSHtgA1Bt1Nb75FBOvFPXyY1TY=; b=KPqQXAGRpBumW9
	dXZJgugndEiqYuaTK+8xMXdeotdL+T96NXbLjvQs3lVoQ1xdsesth85HRj1UaYs9bz5sQvJXTx5uA
	5pj9ziTb8OwTApXvib7PFa83JRhsNclu5rKALNn7cKhlW9GgISQyULS/jjdHI0Q+3rdodekJ2wvev
	BCqoT3Fj18RndMlLBHSWzlvUwbRRVZWQWHfonkvwPeaa95EB1JRugjKdAFgdlZVxBW/8o2rCNaP75
	QcuE+ohYoD/iNjYnRn3CRiWiT+sxx8Ana7xphAJQ4XziJO0k4Bw7VgEOqxoKsbGNnj8twuDMcQ12q
	NZZRjPHDwtlWoY8LgYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGhi-001UX2-V7; Thu, 09 Jun 2022 11:51:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGWM-001P8k-84
	for linux-mediatek@lists.infradead.org; Thu, 09 Jun 2022 11:40:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id n10so46926946ejk.5
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jun 2022 04:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hsW59cFZjklHB2Wpxrfsfror1DmvkvVRBrL7nFD90Rw=;
        b=EskDVL4BMCVdTuVtgU02j2Lf24yqoUYVo6Jth0FY8fPZunmtSvGk++17C91VQRGZ5Y
         4uqCpYzfH56oOiJSWgEfzB7VSkMuAlL57u7mzBqmZUw8e7Gu0+B/KQeLicxKX/iclITS
         fiVhjRqkXZd4JrAjzl7jnmt1KUQlXsW0dvneIZEYiJccRHEk+OBTDYqflaglkAW2aZWo
         XyppDgoKAltxSqKMIXcw6Vq/T8KrnI5b/VeCqf1WUaFVJ3qSjWlgncYtQ5+k5Vb7RJi1
         icfcY75PLQlqc99AvGllP4Z67z1vIB8dyNcvVA5qABFL0PrB2KixwtE5TYhcMTJpw2/z
         2jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsW59cFZjklHB2Wpxrfsfror1DmvkvVRBrL7nFD90Rw=;
        b=qlT/2LjWNLl5iGUxRRwf1F1aJ+nVnMmqdGPs3oLOg1p7JjPJ6B2acNhtthG3yWaNFQ
         KAWmCDCNTzq5YnpjEOVwLRnw4N/7gccc1udpJ9TvmheKwkIUffOsBe6cipv6QByqKsIt
         OgeMA5zBH406mUJE50Ovn4eeZyhIGV9CIa0ZdfT7/gjnAuGvpyWKPeLHLKFb0GQ3kY0F
         podC66nmATP4lrx2eD7gH05BNfTaHE3O1zQaFhVGh+Gz+XV/o/tjTKMnSuX+MYVwOmLU
         Fhdt0OKNVHfsvn+KosiamdrWhxZ4Z+QPPtSOuyWJ/Ir4cVH6zDOZnmDkqZjm7qWY2Ik6
         Byxw==
X-Gm-Message-State: AOAM532tCgC1o5T1czb5ZKza0T02KOUK2EO12v1wEImQyGvAuAssaPy3
	6xixP965IVYHl+mtRAULAAFhRQ==
X-Google-Smtp-Source: ABdhPJzbI0Bm95mFsHbaVdDvO2+VQTt8NXkiInDIkjgIE93NXch5C/nf02nOC7GzU9E0lfFP0RwGSA==
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id mp32-20020a1709071b2000b006da649bd99emr35554691ejc.712.1654774810411;
        Thu, 09 Jun 2022 04:40:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q1-20020a170906360100b006ff59151e34sm10638441ejb.39.2022.06.09.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 21/48] arm64: dts: mediatek: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:54 +0200
Message-Id: <20220609114002.380563-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_044014_351513_10626F1E 
X-CRM114-Status: GOOD (  12.61  )
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

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts      |  4 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts           |  4 ++--
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts  |  6 +++---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi           | 10 +++++-----
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi |  4 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi  |  2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi         |  2 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi       |  4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 2b9bf8dd14ec..c2311733d2de 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -40,13 +40,13 @@ cpu@1 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		factory {
+		factory-key {
 			label = "factory";
 			linux,code = <BTN_0>;
 			gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
 		};
 
-		wps {
+		wps-key {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 102 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 596c073d8b05..c28da9323a9c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -42,13 +42,13 @@ gpio-keys {
 		compatible = "gpio-keys";
 		poll-interval = <100>;
 
-		factory {
+		key-factory {
 			label = "factory";
 			linux,code = <BTN_0>;
 			gpios = <&pio 0 0>;
 		};
 
-		wps {
+		key-wps {
 			label = "wps";
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&pio 102 0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
index 44f6149c1307..28433b94f7c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
@@ -21,7 +21,7 @@ cpu_crit: cpu_crit0 {
 };
 
 &gpio_keys {
-	/delete-node/tablet_mode;
-	/delete-node/volume_down;
-	/delete-node/volume_up;
+	/delete-node/switch-tablet-mode;
+	/delete-node/switch-volume-down;
+	/delete-node/switch-volume-up;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 9c75fbb31f98..d20378758213 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -53,7 +53,7 @@ gpio_keys: gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pins>;
 
-		lid {
+		switch-lid {
 			label = "Lid";
 			gpios = <&pio 69 GPIO_ACTIVE_LOW>;
 			linux,code = <SW_LID>;
@@ -61,7 +61,7 @@ lid {
 			gpio-key,wakeup;
 		};
 
-		power {
+		switch-power {
 			label = "Power";
 			gpios = <&pio 14 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_POWER>;
@@ -69,7 +69,7 @@ power {
 			gpio-key,wakeup;
 		};
 
-		tablet_mode {
+		switch-tablet-mode {
 			label = "Tablet_mode";
 			gpios = <&pio 121 GPIO_ACTIVE_HIGH>;
 			linux,code = <SW_TABLET_MODE>;
@@ -77,13 +77,13 @@ tablet_mode {
 			gpio-key,wakeup;
 		};
 
-		volume_down {
+		switch-volume-down {
 			label = "Volume_down";
 			gpios = <&pio 123 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		volume_up {
+		switch-volume-up {
 			label = "Volume_up";
 			gpios = <&pio 124 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 2d7a193272ae..3ac83be53627 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -73,7 +73,7 @@ volume_buttons: volume-buttons {
 		pinctrl-names = "default";
 		pinctrl-0 = <&volume_button_pins>;
 
-		volume_down {
+		button-volume-down {
 			label = "Volume Down";
 			linux,code = <KEY_VOLUMEDOWN>;
 			debounce-interval = <100>;
@@ -81,7 +81,7 @@ volume_down {
 			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
 		};
 
-		volume_up {
+		button-volume-up {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <100>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index 28966a65391b..50a0dd36b5fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -45,7 +45,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pen_eject>;
 
-		pen-insert {
+		switch-pen-insert {
 			label = "Pen Insert";
 			/* Insert = low, eject = high */
 			gpios = <&pio 6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b035e06840e6..b50261e8b9ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -144,7 +144,7 @@ wifi_wakeup: wifi-wakeup {
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_pins_wakeup>;
 
-		wowlan {
+		button-wowlan {
 			label = "Wake on WiFi";
 			gpios = <&pio 113 GPIO_ACTIVE_HIGH>;
 			linux,code = <KEY_WAKEUP>;
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 7a717f926929..8ee1529683a3 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -28,7 +28,7 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_default>;
 
-		volume-up {
+		key-volume-up {
 			gpios = <&pio 42 GPIO_ACTIVE_LOW>;
 			label = "volume_up";
 			linux,code = <115>;
@@ -36,7 +36,7 @@ volume-up {
 			debounce-interval = <15>;
 		};
 
-		volume-down {
+		key-volume-down {
 			gpios = <&pio 43 GPIO_ACTIVE_LOW>;
 			label = "volume_down";
 			linux,code = <114>;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
