Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3639C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 03:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=; b=cdmdID7PFUegeaT1imfbnYFgsA
	UZBOHJRxFxNj3/ERajVljwvAwEfCMJwpa+kvz4AJ0mT9nRoeCSfU11oyHWsqkAoQXUqpc9ikCJUer
	TA2NQAGs5kWjSP1W3Si2WMtTE8z5/k29TPyLMnh4Bd9PB/EXuRFnKmJwlul/QXQFvehM6ymXPvzif
	FRkW4oynAk+piK02YyatwIL4i/qeF+DnpZPu9JQv+N1dwbL8WJu70Mc9nWv65w7JB7KGNHYvAfpbC
	i5Z/7z0zHkSFZEWtQ/nVkYPCb4rivZwcNydRUNAHrRqgs/aFWpHHF8PH/XmiKe1eUIuUW2NOHyl7v
	u38WKWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owx2q-008coZ-Nz; Mon, 21 Nov 2022 03:00:28 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww1m-008JPV-3T
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:55:22 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z20so12802790edc.13
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=;
        b=UrZTAU9DJ91/ITNl8HBksYIBkH6PPckbtPpV792SFacfk+4D8+k2NXH2+EUpJNmgLi
         uDsKe6l9kRIqsecIWROxsPAn+MfQLVtFsp7YUd+k+o8hRng3lFTFNlzQO3TDzVFPr6aK
         4JnEprNBokf9bp0dZfv1CnX9xkkoIHKgUHO6PlR67nKmOhK9h5pi3Rz4eZtPMQOASyBz
         Puo2UHqRbwkcXmHQBQ2OvWiZrv62489icvqDBSDMdem+E5/2blNL0Ru9jBPIbIiaiaj2
         1KzAh7krletOJP/ZBL+mgysaqbQ25eUdXSU8boWzASinkoju6TZuDIEl93CNeMeN1CQV
         ylpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVZ6+cmK/ek0Z/OEVG5B02bFoCV8UTRj8V3VuqIql3A=;
        b=ZfbNDrvu8hSyVmmc/6aAYfbPml7klkpNKp+3WgF0t4IyPnKlqjgcPVH4fpT76jtLuw
         m61W1RySsPK/2nnywu2NfGjJsbf9O00TggnijKZnB63FbjcbEef945IWyXSubQmTVB4U
         oI+UiZDtFmTxKkF+VmIcdWeiT0g3YK2vcFtXNWMGy29+tyEngkjBMkkBComqk3Pbw4KX
         +gNnPjBsPvw4yaRfp5Tm88xuSCnxvNh0kAHNpfE+oViRvz0rGaqqGbg63eOUb88KyCdk
         WtjpHeV5+nbkljc/Zeiv5UFItVo59B9qPLY/8DBDX9CT0k2+LozugtfxzTWl0+v2Q1PL
         bBKw==
X-Gm-Message-State: ANoB5plPvty4c/hCu7aINBFJft5S3hhfddjFYF4lBMlr5E//uRmF8wzJ
	cMnyFjfMQ++RzHBRMQaoaIT+lcYVNqhp048d
X-Google-Smtp-Source: AA0mqf6N+HSBBDHGUKvlzZE7JOxzEzxy5+r1AOj/V71TY0IIoaheXBi34rQqarLYme7K/40AR6Argw==
X-Received: by 2002:a05:6402:2925:b0:461:d2ab:3e05 with SMTP id ee37-20020a056402292500b00461d2ab3e05mr13768801edb.286.1668995712524;
        Sun, 20 Nov 2022 17:55:12 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 17:55:12 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	khilman@baylibre.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	matthias.bgg@gmail.com
Subject: [PATCH 7/9] ARM: dts: stm32: Remove the pins-are-numbered property
Date: Mon, 21 Nov 2022 02:54:49 +0100
Message-Id: <20221121015451.2471196-8-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175518_416015_6BC3473D 
X-CRM114-Status: UNSURE (   8.47  )
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


