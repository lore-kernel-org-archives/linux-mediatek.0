Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B83C636D6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZb3LQ9dAmJMYKfag6aGFk3HogVUQYQhucx6GbxxSz4=; b=0IiNSvWl17Fklgm2kWekn2Qofl
	KN8786lqhPhaR5EPQUsD1rufGxhQyTnPXtT+zAu2Hv4g2HCBl5ib7J4jfvdnOzj/JwetbKO84GMbK
	uA9MlxFaWF4g40iKShft16yQ7/YtkfS/AHBMSzmnHMdw6DMz4eWHUmaf4srAKm0ifi6pQDZCnyBJS
	pR4m2LgwC51Mwkks6UiYkEbIheU/wQ1caZ6/6eIfeFX3/01pNw9Y8F5FsmVPuVxC9+TdRzG8cSt7c
	V7YGC2zwDam79Z1k76ZO8vI9KiSyUAgvn99uzuXxbVLpfj45+lmHhbkgghxfUZ760OnIupQvPd0wy
	9bwrqzUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOYg-00CNcX-IG; Tue, 07 Feb 2023 14:02:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPOYe-00CNc0-IP
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Feb 2023 14:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eZb3LQ9dAmJMYKfag6aGFk3HogVUQYQhucx6GbxxSz4=; b=lhFAfAu8l1u+zcNbQgMt2k5nZE
	VWk0kCygz7IjWwQynnNVq2jefO7YO4mZDAr5tmzLJHotrF+X3d4waS08gqp/wQR8c2eck2oISTzkm
	6Rc8n5WMl9H1l3evkQ17biq81t662Cbk3AiOidapRbTQcga1lw4PzduG7anyxQZ6Unviiv6cbWW5X
	LHwwOCHOgoR1cr6WkxAt2m3jDXzuJhz7GrO7wAicbU3/x8d/NQ5oTnUu2642cSrh1nBXxISXkXDS9
	FphqFGM3MN8Or7HSWuwIxiTjcyP5W2RTZc7npGbYZNoIEK4ElZ//hJ64mAgyILO5A5xQYn0A1RmgB
	WQQ511Cw==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pPNjG-006tS3-1y
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Feb 2023 13:09:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id z13so3520689wmp.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZb3LQ9dAmJMYKfag6aGFk3HogVUQYQhucx6GbxxSz4=;
        b=tQFt8bsrVhqUUcG6tkdD7pY6zwsgp2H0RT4PmeT8rVK1941zlyDduHHRiknSEEpkKb
         vSzfN3z6dPSkpBoXCQ+ZsSbbMhpcYRbMk/dHFSyu0N8znhToyNTjC8fKCTx8ziuU6WPS
         0w8xVuRUpNGl2JWw83MEkpCApfARqJlannVwR/5Xcz+hCiNeW9FRtOpTw6Cu8JzgXl9P
         WeXXZ2JqB5DGWdazeimg42gczJbtE5TFlsbWO/Hjuq5sfsLDIJObaIMKNELwUk8Vdy4r
         mDP4+Mlah2W/hnppuJCoEBEDmNaRWtlevak9AWC7V4Ilt+xyQKumMzxfOBjYi3s54H78
         Arrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZb3LQ9dAmJMYKfag6aGFk3HogVUQYQhucx6GbxxSz4=;
        b=kOfOBQwVbyAn8HWzcHWEO/EmT/OGue6VwNhPQdQNMJx4puQD/EsLe3JMsdfJlpCoKx
         YDPOkJz2bVLmMWd3yCwPCCZ3vXC6zEgXKW3C7Wykl0hRDQqe6xfaQV+5o5DdKOCNMxH8
         YLVjW+ba1ZUJ8CTF2m0zcl4JRa3p1EWr1yBVpXh7QCJYpSMCRg6gzxPHhkeOw9O+Sq7o
         CdDHY3zxeYGWmp+4Wdv/56w0jPGJzGHlgO8Xbz9UmsZ6TcsAq3Nozl4JjL2WicF0Wdvi
         VXKzRUAwH0xb7MltewQvVD7slyEsEcHEfoTy5Ba9OqHT8rvIPT8ILoK9mXHBusZ/Jm6L
         HOpA==
X-Gm-Message-State: AO0yUKWQMNFkpD+9m6NDiZk2uqzHkoBBht9GrnpxeLvVwpIBVGoObRqA
	44NzP8Ru1YXyqV4QouTQqizNpA==
X-Google-Smtp-Source: AK7set9734MTtdTSHqNDansYnB+iRNdNoFrOJTfEFWY85vG90qYIQndktun+4Xzrm8617v7aw/7YXA==
X-Received: by 2002:a05:600c:35cc:b0:3d3:4f99:bb32 with SMTP id r12-20020a05600c35cc00b003d34f99bb32mr3030224wmq.36.1675775413398;
        Tue, 07 Feb 2023 05:10:13 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id g24-20020a7bc4d8000000b003df30c94850sm17987385wmk.25.2023.02.07.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:10:13 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v13 6/6] arm64: dts: mediatek: mt8195: Add temperature mitigation threshold
Date: Tue,  7 Feb 2023 14:09:58 +0100
Message-Id: <20230207130958.608305-7-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207130958.608305-1-bchihi@baylibre.com>
References: <20230207130958.608305-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_130947_662675_C5990496 
X-CRM114-Status: GOOD (  10.48  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

The mt8195 SoC has several hotspots around the CPUs. Specify the
targeted temperature threshold when to apply the mitigation and define
the associated cooling devices.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 169 ++++++++++++++++++++---
 1 file changed, 153 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index c7e958f8f1b5..10c8fb0856bc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/power/mt8195-power.h>
 #include <dt-bindings/reset/mt8195-resets.h>
+#include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/thermal/mediatek,lvts-thermal.h>
 
 / {
@@ -2413,107 +2414,243 @@ dp_tx: dp-tx@1c600000 {
 
 	thermal_zones: thermal-zones {
 		cpu0-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU0>;
+
 			trips {
+				cpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu0_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu1-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU1>;
+
 			trips {
+				cpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu1_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu2-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU2>;
+
 			trips {
+				cpu2_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu2_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu3-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU3>;
+
 			trips {
+				cpu3_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu3_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu3_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu4-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU0>;
+
 			trips {
+				cpu4_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu4_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_alert>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu5-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU1>;
+
 			trips {
+				cpu5_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu5_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu5_alert>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu6-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU2>;
+
 			trips {
+				cpu6_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu6_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu6_alert>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu7-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT8195_MCU_BIG_CPU3>;
+
 			trips {
+				cpu7_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu7_crit: trip-crit {
 					temperature = <100000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu7_alert>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+								<&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };
-- 
2.34.1


