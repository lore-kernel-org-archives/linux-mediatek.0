Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440F2C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUicZLyBaZmjv2lqx7fW4HMBGqk7G7eOOVk/ONJ/4PI=; b=kAOaMEupASWHxsKwuwaljKNTAx
	RWez+tfEiuZc8ey3/ynThKHyN44PbR1hKPzOAP2GuC/JCs4OcmnnRjbnq2CT3/B+HpDFJTBTJRhAr
	e/k/dK1CY184v1dx8GIZQzRmjq1T7VVeJRxNDf43xdlnZA2qBhDAs01YLSZhfGgWpo2vnxp8hCybS
	ndEA35+H/cC8+wpJd5HcAhySRc5Qz7fln1Cs8vI8WXdC1wVTDjyQiPRL+eXSoRwB/+w07Pc0GwBJm
	yN1hUZcrKYIG3JhlA5xlKVDATVTrV9Mes7K/bNHd6qtp1ix0RuttdCAS6lzQ7diH+3LQN6NPmu3zn
	NA1QXKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHJa-00C0o4-E3; Tue, 26 Jul 2022 09:57:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHJW-00C0gh-54
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 09:57:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id b26so19432368wrc.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iUicZLyBaZmjv2lqx7fW4HMBGqk7G7eOOVk/ONJ/4PI=;
        b=a9jshOAIwiw5ztp0+n80iX49X5uP9g1fIPLWAKA0Oebli99rLSK1JSwbKX/TWSIEKD
         O8RAu6x1EuYGsc6oXUYHrmfMJXvk5iAAbsgDFp3wtW13E5HsTmbU8dXiDaDJtMrBEKfo
         BtLocFdB4gelyGOYkHzTosErUmhiDP8/zjswgy3RH2fFxA6Xdh3CA/yI5iTiW9jbWJ9K
         oN+oMjKZdsMTijOKOP2BcUYtUHprOqVqAeK+KFkaDem1o5Ff7dUDZtyl1X5TpjYEAD8P
         dBkE0hdxwnSaGXsfATXn6MSzu2tBqE1Ie2s0Wxg+NyX5ban32/phra4XzX8bj2k4iDT4
         H/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iUicZLyBaZmjv2lqx7fW4HMBGqk7G7eOOVk/ONJ/4PI=;
        b=tiKfbcwZ0e+mZwBbRyqgtolexV3Lc2200/l5aE22biMCKYEIKEeiKwKtqDY2/1Y4LL
         vVFwVVITu0BI/s3oBHD+MWsWpq3fCu59kvQAwpNb7K1pT8lUaIWFzgvIgdE7XHcn10AX
         uoyB3ymvc1plcdcX4U13hNP9NKxU06tNa9wG+4pe4eOyEMLqrT2p+xRWM2+LVmIPndON
         FxL4fOcfYwTiGfvOrX4Lm8+KP0AkvD2nznrJ11v8C3RCErEMcilGe8bu3PRWVnUVFCsb
         /UF6ZDZMHITf84E/rmGFSGWdbDLLqpFHNM7h9YOCynFxbrkeFXQlZxhuAtB0Huc0kvO+
         Vyyg==
X-Gm-Message-State: AJIora9TvDGCa9gGvFkfMtAIjv4ioRDdHlgaPexlpP+5WTATNYKwt9Ex
	Wgt25t9c9QOjGmaQDxojfdhC5w==
X-Google-Smtp-Source: AGRyM1vaVzTyQ5b+nn+RlJ42faxYO14TpuNlzllTL+nY6z4bb/G0nOBbFTz5DJTxQxp7SwpuN92A3g==
X-Received: by 2002:adf:e84b:0:b0:21e:61cd:647e with SMTP id d11-20020adfe84b000000b0021e61cd647emr10370152wrn.715.1658829433726;
        Tue, 26 Jul 2022 02:57:13 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id t3-20020a1c4603000000b003a2d87aea57sm21170873wma.10.2022.07.26.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 02:57:12 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: fparent@baylibre.com
Cc: broonie@kernel.org,
	chaotian.jing@mediatek.com,
	chunfeng.yun@mediatek.com,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	jic23@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	matthias.bgg@gmail.com,
	qii.wang@mediatek.com,
	robh+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	ulf.hansson@linaro.org,
	vkoul@kernel.org,
	wim@linux-watchdog.org
Subject: Re: [PATCH 16/17] arm64: dts: mediatek: add mt8365 device-tree
Date: Tue, 26 Jul 2022 11:57:11 +0200
Message-Id: <20220726095711.708310-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220531135026.238475-17-fparent@baylibre.com>
References: <20220531135026.238475-17-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_025718_253867_D35DCE51 
X-CRM114-Status: UNSURE (   9.36  )
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

Hi Fabien,

Could you please add CPUIDLE support:

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 323c814c10cc..1df4075db58f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -59,6 +59,7 @@ cpu0: cpu@0 {
 			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER &DPIDLE>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
@@ -72,6 +73,7 @@ cpu1: cpu@1 {
 			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate", "armpll";
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER &DPIDLE>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
@@ -85,6 +87,7 @@ cpu2: cpu@2 {
 			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate", "armpll";
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER &DPIDLE>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
@@ -98,10 +101,42 @@ cpu3: cpu@3 {
 			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate", "armpll";
+			cpu-idle-states = <&MCDI_CPU &MCDI_CLUSTER &DPIDLE>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			MCDI_CPU: mcdi-cpu {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x00010001>;
+				entry-latency-us = <300>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+
+			MCDI_CLUSTER: mcdi-cluster {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <350>;
+				exit-latency-us = <250>;
+				min-residency-us = <1200>;
+			};
+
+			DPIDLE: dpidle {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010004>;
+				entry-latency-us = <300>;
+				exit-latency-us = <800>;
+				min-residency-us = <3300>;
+			};
+		};
 	};
 
 	cluster0_opp: opp-table-0 {

I have tested it on i350 evk and each idle state is used properly.

Regards,
Amjad

