Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121E9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 01:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=; b=quku/UTULVq0wblwuF9lGXJuWU
	KAacl346SgFGxkXU4LoQOpYQD1zNP3ZEV9VstpV2LqnmD8mL9jI7UT58gVZLeUqPvFacF1E+/kCfC
	wv37+gjwAQXlL1Hw5gaZzbR0E3ay49MTqHWxslVt+KneeFFWoauFviTRjn1MDVYeYQou4J5meuad8
	uhRI0FY5Wqxbl27mRXw/nmtNykQsUQ4WTWjDqNA1al6bycZHEfZDDRYKRrW7nQo7U//EJqDJUFU4q
	+6+3pHq5LPtnvWqIauQj16qkmDsAz0jGg8kzFYUW1TrqReoLkWs9bvMTYU4X7x3I49EU8YVktjKOd
	cOUYfTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHnx-001oO3-1I; Tue, 22 Nov 2022 01:10:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHlz-001nKD-0a
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 01:08:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id f18so32419716ejz.5
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 17:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=;
        b=7PU/zr3G+t8KUIvLexsH+u2860yRH86YCPctKi6jVpZSG9hKr2LozoPqCT7fp1IExo
         joSPMv6kkdUSMTdaZCnPHw3m8evHyxRsEDYj3/qxFmNd0A9KFH0rsN2PgyBuIih0iqUA
         6we61TpVhNxM7+aQXSP5/RNgxtlvO0Qu245bz/cuQBYWKdR9VNIYV25I5bBBNq/xSrVc
         BuYoER6H0JiFUAa815Nu9UiiQsIJ117Vr8396/HXMopJKy3S0DYWWrLtx5UBYNsFkU4R
         oDdP2/YMozV/5nG3e0N8e61TqipuSN3ioLPxbu8JiQoHxqnvjgSFKwxlGIWoJO6dN5mj
         xgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=;
        b=wOP2wBCLW3EkPTdw6h/rhFGPHqr4wk5Afwo1NMt0mp7jreRxvYAlmy2j8B/oJ0RDos
         MVWiv9Zh93iKzsyFBGzYf5AYS/mEJo4lO/B4NelkbQCEH96D8YIWu0IEWGBuHavgyN8l
         g+SWb4wOOWOhPMsVR/MXw/XVRmYLK2vuz39xhhxCZI0mQtcaEJmReiNgshXgllQcv09t
         EEZDFu4eOdRXLYqVB2OSfih+h9uYnAWWo+6Dr/DjW8v9sPRSIIdkNde0cOx3jG4bbpPf
         qniywANEQNOrjnFPxsMQykAGrgQBtv2/PfgOy0FGmxhLMnL61JmkHldHnHBH4/FawFr7
         O1nQ==
X-Gm-Message-State: ANoB5pluHf9IarrCbuSwV6MEtnha3PJ4IxXRMlP3mNoUNfGVpmZQH1h9
	0iIAynM2RLYg4zidBnQ+TPhwy/i3RoR5/pXx
X-Google-Smtp-Source: AA0mqf6Rscbb2Xk+Iw5+n43aJADKV4pLrXNsz2Omd130tyO43/THJlxoYpPQi8bWlXolQfLcDJw0kg==
X-Received: by 2002:a17:906:5055:b0:78d:cdce:bc52 with SMTP id e21-20020a170906505500b0078dcdcebc52mr1581398ejk.469.1669079294070;
        Mon, 21 Nov 2022 17:08:14 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 17:08:13 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v2 7/7] ARM: dts: stm32: Remove the pins-are-numbered property
Date: Tue, 22 Nov 2022 02:07:53 +0100
Message-Id: <20221122010753.3126828-8-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170827_073026_899A18E6 
X-CRM114-Status: UNSURE (   8.75  )
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

Remove the pins-are-numbered property from STM32 DeviceTrees

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 1 -
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 1 -
 arch/arm/boot/dts/stm32h743.dtsi       | 1 -
 arch/arm/boot/dts/stm32mp131.dtsi      | 1 -
 arch/arm/boot/dts/stm32mp151.dtsi      | 2 --
 5 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 500bcc302d422..4523c63475e4c 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -51,7 +51,6 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
index 8f37aefa73150..c8e6c52fb248e 100644
--- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
@@ -15,7 +15,6 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 28e3deb20e1e1..f30796f7adf36 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -588,7 +588,6 @@ pinctrl: pinctrl@58020000 {
 			ranges = <0 0x58020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@58020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 2a9b3a5bba830..adaee0f9e1263 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -549,7 +549,6 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
-			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 5491b6c4dec20..4e437d3f2ed66 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1660,7 +1660,6 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0xa400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
-			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1789,7 +1788,6 @@ pinctrl_z: pinctrl@54004000 {
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-z-pinctrl";
 			ranges = <0 0x54004000 0x400>;
-			pins-are-numbered;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
 
-- 
2.38.1


