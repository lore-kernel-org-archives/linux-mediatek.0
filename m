Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6BACA5FE4
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 19:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMFXPviZDx94hfYTmT11AyFko1MyhGDl/aQY6zDFtP8=; b=Lmg9EVXgPyYngh
	ACsIDlhA1idGhheBQKddnk8kNFsc2qRh6e8f1XClJtnKnf5wXh4W9B2eoEdFXy7ozlZYH9Y1CK1CQ
	Y3znLDzRh+vjqKg7ksUJBmVzph7HWnp+x8WjgG7E7YsfM4T+XzUEJNn4YzJLjjnFAGOk4C9re372W
	C1UgVgqQn9Dno0eyrl/D2hN9d1uhWByXx4Z72xjGFPctQyrMXM9yCwkCwaG5mZ87lOG854nI0cqk9
	if9KxWQxH2bKtDkR2P/ucl/cdgf5gNgSpVl4gFA33aNwMBYGImyiKrGLLA0Hf+HKnVCEeSms0vQVU
	s4iEPh1HK7F0HM6xnOhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5S7-0000000DwN0-1wff;
	Sat, 03 Oct 2026 19:31:23 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5Rz-0000000DwKW-2EZs;
	Sat, 03 Oct 2026 19:31:20 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791055873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KMFXPviZDx94hfYTmT11AyFko1MyhGDl/aQY6zDFtP8=;
	b=SZMhAOmZPgZUWrcbCjDAyaRdmBwiAPOptFw1NVngfHDxduQ8w2mCFhRQOOkTb+qhbcVNOc
	93C3mu4uUGc894MBoRKOTWEuF+d3wacS0sWvUu/EBLhdprCgyYrGSx4Uxe2muunZlkhWQZ
	rur9ohRmLPV2i0Yutaf6+QTROUs/gAUbKyMFnTmCBbWhkh0H7pBaA+Bh6Gbt6RwZ1EqpOa
	Y3ryXkb1p4Kc0PSynYdSPisTRdq3SOS5Nq0La7O2hDZzrJJITLFhAxHW5VhnuH8xoHjcOM
	KrzFwquYFkIxZb8vuTB6WbZt7rEimqKpqgmC3ebcr953vM2TZDgKzBDE2SFhtA==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8188: Add power allocator parameters to CPU zones
Date: Sat,  3 Oct 2026 21:31:07 +0200
Message-ID: <20261003193108.789939-3-michal@nozomi.space>
In-Reply-To: <20261003193108.789939-1-michal@nozomi.space>
References: <20261003193108.789939-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_123118_952860_F05BB841 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Under sustained load the CPU temperature on MT8188 rises from the passive
trip to the 100 C critical trip within seconds, faster than the step-wise
governor lowers the CPU frequency one step per poll, so the system hits a
thermal shutdown instead of throttling.

Describe the CPU thermal zones the way the ChromeOS kernel describes the
MT8188 SoC zone for the power allocator governor:

- a 68 C passive switch-on trip before the existing control trip,
- a sustainable power of 1500 mW,
- both CPU clusters as cooling devices in every CPU zone, weighted 2345
  for the little and 1024 for the big cluster,
- a 100 ms passive polling interval.

The step-wise governor ignores the switch-on trip, which has no cooling
devices, so zones that don't use the power allocator keep their existing
trip points. Limit the new little cluster maps of the big zones to the
four remaining little cores on MT8370.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 110 +++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8370.dtsi |  14 +++
 2 files changed, 118 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 14a320f0c70cb..07f5f4e62d7d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -471,10 +471,17 @@ sound: sound {
 	thermal_zones: thermal-zones {
 		cpu-little0-thermal {
 			polling-delay = <1000>;
-			polling-delay-passive = <150>;
+			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_little0_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little0_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -503,16 +510,31 @@ cpu_little0_cooling_map0: map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
+					trip = <&cpu_little0_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
 
 		cpu-little1-thermal {
 			polling-delay = <1000>;
-			polling-delay-passive = <150>;
+			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_little1_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little1_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -541,16 +563,31 @@ cpu_little1_cooling_map0: map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
+					trip = <&cpu_little1_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
 
 		cpu-little2-thermal {
 			polling-delay = <1000>;
-			polling-delay-passive = <150>;
+			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_little2_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little2_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -579,16 +616,31 @@ cpu_little2_cooling_map0: map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
+					trip = <&cpu_little2_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
 
 		cpu-little3-thermal {
 			polling-delay = <1000>;
-			polling-delay-passive = <150>;
+			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_little3_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little3_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -617,6 +669,14 @@ cpu_little3_cooling_map0: map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
+					trip = <&cpu_little3_alert0>;
+					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
@@ -625,8 +685,15 @@ cpu-big0-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_big0_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_big0_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -647,10 +714,22 @@ cpu_big0_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_big0_cooling_map0: map0 {
+					trip = <&cpu_big0_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
 					trip = <&cpu_big0_alert0>;
 					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
@@ -659,8 +738,15 @@ cpu-big1-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <100>;
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
+			sustainable-power = <1500>;
 
 			trips {
+				cpu_big1_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_big1_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -681,10 +767,22 @@ cpu_big1_crit: trip-crit {
 			};
 
 			cooling-maps {
-				map0 {
+				cpu_big1_cooling_map0: map0 {
+					trip = <&cpu_big1_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <2345>;
+				};
+
+				map1 {
 					trip = <&cpu_big1_alert0>;
 					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <1024>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index 7ac8b8d034945..61801f79e729e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -59,6 +59,20 @@ &cpu_little3_cooling_map0 {
 				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 };
 
+&cpu_big0_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
+&cpu_big1_cooling_map0 {
+	cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+};
+
 /*
  * Please note that overriding compatibles is a discouraged practice and is a
  * clear indication of nodes not being, well, compatible!
-- 
2.55.0


