Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C03FC369AB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Apr 2025 23:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgJHzIzyaD1npkS46bS+JQBBaGuaTYEokeH33dSjs4g=; b=UIEUvEOQWTQKNO+CbjmOeRTE5H
	Sp7I7kfeDAxMbzhfRE9KMapumtwP14vdpMECq9G0IwreyDsCZcshopxLbQYVrUmHCoCzd8A9ZSJlD
	vwkG9eXCi0Om7DXIodhSWkO74f0TNmOKUrVqdyOTzB595AixZQ15olZ1o5au5op2X/w9fq8yBbhaA
	ruIrkilmMD0GAnJiZ2Gt9q0VzeQE7d/uZI6MnR8XhaL2/VcHkMJnlcL/RKAVDgLI+P8KMr4A+Ngba
	z5Xye7kalEOFUWswK2NigYixvCLKzuPhyPxOb+w1QHlEY9LxAzeLg5gQ+kfzXQ9zx2N0yPKohqCoJ
	dnG6E61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5vaO-00000000Zk8-0b4n;
	Fri, 18 Apr 2025 23:57:32 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5vaL-00000000Zjb-1Ze8
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Apr 2025 23:57:31 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-47677b77725so25104521cf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Apr 2025 16:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745020647; x=1745625447; darn=lists.infradead.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rgJHzIzyaD1npkS46bS+JQBBaGuaTYEokeH33dSjs4g=;
        b=01q74uZOAFnNA5v86/uK40940qUV5fwwz/uCxkhTcFbFpw7yDl7Qe1+vp6U9ivW9ih
         agvw/WdYdAgIwvdeb3h5eu7R5982uvGoLg7oZ9qvnFxOjjn2KZjeEusJ266lrJEV/5AS
         63KS/Tfxg8W0ns4K4wGGJMUsTjqT3aOCYRbwnv51jdFGkvS4fmDSHYo4BJxrswV+SKOz
         c2ofC92KFY9qPaf8Rdg8G4NNeA6KYv95jm7tGJlWs2DejbP4SxaYuSgN9yI5mg2LUxZC
         ukfViQjvo5cZ5qw61l0wFsBQo926i/28bO4l9Db71sAhWap+shOr8fhkVn3QW0JjJrE6
         iGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745020647; x=1745625447;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgJHzIzyaD1npkS46bS+JQBBaGuaTYEokeH33dSjs4g=;
        b=OfoDTS0yQi/dOwI5MEXSq1uYBm3gaDSSLW55VOhdw3Tyy8/e9q/MQSatsfVl4yWiK5
         MmW2IxNnzeUcrN8O1zEXV6UgQ9sGjNDDSKytrXnogAiDUs78xpLno7NAoY7BrFyukk62
         SSoMOs9BJyySKlZE6jpjNT4+fGTzDf/J6el5l2mhsGhafCta4Ja/m/Aap9v9kF+qlHUk
         bdO6oKQmll5aQ96SPucJ4jK9mT2zwexcYabrqFkvrFcTQgaNLIrjzRaIoouJmJ0/AfuK
         kkqej0V4pkpGaF/MXwy2eDYoWDiksXLgvz9XBpj14pHKRfV4KsHcF4n11Q3qDJ+LXHxl
         8vLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/m6IEgiBRbKkbj9xnOLMX2rEWqoNaHfu63Su4TXKghjB/Bb7/khkMPobWLjplFejgQdsXyJpy+b5En4vFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQhGKXV2rQ7sGu6cYDKuH0goufwbkT512oi+vlrOkGjZx5I/RL
	5+Wl99QX+bra/D3bZe4DfiTAdSmRuXsJifHTkzFqwKDhIlXI7KlQYktahUoeUWk=
X-Gm-Gg: ASbGncvb64b1uWvnL2/e5MMvyxe7kymVonOadIE6D4ic9ZMACtyhWgkBGWq0yp7RlK4
	cCTkBhoyaIC4cKGz1kJ5pXW1jWiVkhxD8xQCI0UFDKRa2MX6nbbToIFJ+pC2nTQbMouyXQbQhQe
	nB8kqDsdeW7sx7ZlshIZFYQoPEEwuw3eXYyh9ruFBT65fWRjmqb7Zg/CF3B1juUAIF3Z8RRuaY1
	Ryz6DQ0wZ1PmD/LBXN5wbRk+1iIBONrxyJpNAirVeu3oGR62BGythQjIRrGHwM0D1lablvkLKgW
	pQ01PItkLYoHOoMqqEjPxVBJTneg1S9QuPSoMzRDtDip8IBHS+xzZVkyuaU1kJ6KLEK0PflQUSl
	RJ4w=
X-Google-Smtp-Source: AGHT+IGONb+S3gDuaOs0a2vWRCUKlXmXCB8sKa4OKfOwyynXyupYfg2NlJIa10pzg2JliqDRdBaz5A==
X-Received: by 2002:a05:6214:234a:b0:6e6:6505:ceb2 with SMTP id 6a1803df08f44-6f2c4698f84mr89456026d6.36.1745020647414;
        Fri, 18 Apr 2025 16:57:27 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0f11fsm15626246d6.39.2025.04.18.16.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:57:26 -0700 (PDT)
Date: Fri, 18 Apr 2025 19:57:25 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>
cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dts: arm64: mediatek: thermal adjustments for MT8186, MT8188
 and MT8195
Message-ID: <prp38558-r53s-756p-o6n8-795o7q87sssr@onlyvoer.pbz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_165729_426757_42F6D67E 
X-CRM114-Status: UNSURE (   8.08  )
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

Adjust temperature threshold values. Provide the "switch on" thermal 
trip point to be used by the power allocator governor.

All numbers were provided by Mediatek.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index b91f88ffae..bfea811491 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -2229,22 +2229,23 @@ cpu-little0-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <150>;
 			thermal-sensors = <&lvts MT8186_LITTLE_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_little0_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_little0_pa_switch_on: trip_pa_switch_on {
+					temperature = <58000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_little0_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_little0_alert0: trip-alert {
+					temperature = <82000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_little0_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -2267,22 +2268,23 @@ cpu-little1-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <150>;
 			thermal-sensors = <&lvts MT8186_LITTLE_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_little1_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_little1_pa_switch_on: trip_pa_switch_on {
+					temperature = <58000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_little1_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_little1_alert0: trip-alert {
+					temperature = <82000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_little1_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -2305,22 +2307,23 @@ cpu-little2-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <150>;
 			thermal-sensors = <&lvts MT8186_LITTLE_CPU2>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_little2_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_little2_pa_switch_on: trip_pa_switch_on {
+					temperature = <58000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_little2_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_little2_alert0: trip-alert {
+					temperature = <82000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_little2_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -2454,22 +2457,23 @@ cpu-big0-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts MT8186_BIG_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_big0_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_big0_pa_switch_on: trip_pa_switch_on {
+					temperature = <58000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_big0_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_big0_alert0: trip-alert {
+					temperature = <82000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_big0_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -2488,22 +2492,23 @@ cpu-big1-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts MT8186_BIG_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_big1_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_big1_pa_switch_on: trip_pa_switch_on {
+					temperature = <58000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_big1_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_big1_alert0: trip-alert {
+					temperature = <82000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_big1_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <103000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 69a8423d38..c2ac47c77c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -472,22 +472,23 @@ cpu-little0-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <150>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_little0_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_little0_pa_switch_on: trip-pa-switch_on {
+					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_little0_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_little0_alert0: trip-alert {
+					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_little0_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -510,22 +511,23 @@ cpu-little1-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <150>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_little1_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_little1_pa_switch_on: trip-pa-switch_on {
+					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_little1_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_little1_alert0: trip-alert {
+					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_little1_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -548,22 +550,23 @@ cpu-little2-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <150>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_little2_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_little2_pa_switch_on: trip-pa-switch_on {
+					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_little2_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_little2_alert0: trip-alert {
+					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_little2_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -586,22 +589,23 @@ cpu-little3-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <150>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_little3_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_little3_pa_switch_on: trip-pa-switch_on {
+					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_little3_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_little3_alert0: trip-alert {
+					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_little3_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -624,22 +628,23 @@ cpu-big0-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_big0_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_big0_pa_switch_on: trip-pa-switch_on {
+					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_big0_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_big0_alert0: trip-alert {
+					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_big0_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
@@ -658,22 +663,23 @@ cpu-big1-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
-				cpu_big1_alert0: trip-alert0 {
-					temperature = <85000>;
+				cpu_big1_pa_switch_on: trip-pa-switch_on {
+					temperature = <68000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cpu_big1_alert1: trip-alert1 {
-					temperature = <95000>;
+				cpu_big1_alert0: trip-alert {
+					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu_big1_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 4f2dc0a755..06631760c2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3729,16 +3729,23 @@ cpu0-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu0_pa_switch_on: trip_pa_switch_on {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+				};
+
 				cpu0_alert: trip-alert {
-					temperature = <85000>;
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				cpu0_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3759,16 +3766,23 @@ cpu1-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu1_pa_switch_on: trip_pa_switch_on {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+				};
+
 				cpu1_alert: trip-alert {
-					temperature = <85000>;
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				cpu1_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3789,16 +3803,23 @@ cpu2-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU2>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu2_pa_switch_on: trip_pa_switch_on {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+				};
+
 				cpu2_alert: trip-alert {
-					temperature = <85000>;
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				cpu2_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3819,16 +3840,23 @@ cpu3-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU3>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu3_pa_switch_on: trip_pa_switch_on {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+				};
+
 				cpu3_alert: trip-alert {
-					temperature = <85000>;
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				cpu3_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3849,16 +3877,23 @@ cpu4-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu4_pa_switch_on: trip_pa_switch_on {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+				};
+
 				cpu4_alert: trip-alert {
-					temperature = <85000>;
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				cpu4_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3879,16 +3914,23 @@ cpu5-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu5_pa_switch_on: trip_pa_switch_on {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+				};
+
 				cpu5_alert: trip-alert {
-					temperature = <85000>;
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				cpu5_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3909,16 +3951,23 @@ cpu6-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU2>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu6_pa_switch_on: trip_pa_switch_on {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+				};
+
 				cpu6_alert: trip-alert {
-					temperature = <85000>;
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				cpu6_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
@@ -3939,16 +3988,23 @@ cpu7-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU3>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu7_pa_switch_on: trip_pa_switch_on {
+						temperature = <68000>;
+						hysteresis = <2000>;
+						type = "passive";
+				};
+
 				cpu7_alert: trip-alert {
-					temperature = <85000>;
+					temperature = <90000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
 				cpu7_crit: trip-crit {
-					temperature = <100000>;
+					temperature = <115000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};

