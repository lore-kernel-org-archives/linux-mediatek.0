Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A3DC677F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX/CQGZwby8Bq/JpQAndBnSTYre5Hfcs3oFccuKqTKw=; b=ZwL+7mbfVNHAEixHrVgFlzqY8O
	XgTBtJXpiAZF9pwxwBeUbtsuXhYSj4SZFe6vXsOt19/Udm5J5gFQiYCl7iCRWwZK7lwMJaqYulI5r
	QGDdruPSqieBRnblyAHcAus123LgXYGUTow9Yl9CnEeqbCruggoDrES+jubVZpXBZGF1bn/ZGcLS/
	2cCl2pEkEsmTSMHUrDXvzl1u+CzLpkSFfP2qBAtsDITDbl6ja48jvqedLKinyT7KjCb7E1JfNrUNY
	oVB80rUVjR5KcO4xE/gWtTNthbmnZlQR1tqPyxaL1HsKyf1fXQKuzuYmV2Dsc3IFcErllFP1RpmEJ
	sBPHEIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzXx-00FfJy-UO; Thu, 12 Jan 2023 15:31:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzWk-00FedO-2h
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 15:30:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id o15so13446987wmr.4
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 07:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zX/CQGZwby8Bq/JpQAndBnSTYre5Hfcs3oFccuKqTKw=;
        b=yNc6PMpxrO8M2h1fKar31wGacq668VpYXsRSM0w0MQyM69WYMb1SanLv5TG5w9Al4/
         y4pzIKNXR24UVbxUPoKmpQY+6wCOwlb3+6qkKiU17hzAB2+CI21Ob7TySeoFu267GlLl
         rm2p0l7mRtUrYMhh089rnQko0ilyDhkafEz8cUloWEpHwYdCDZ7W6MlB2MrZPcijwarA
         rZiOLRpUm9ZHtk8NF8BQdQg5OPxXqykjfSI7VkDLURHhD9p0MEk9CyAJKLwOHH9/a/tU
         lmoTIXgt9C5tKiSe6rODgy7bT/9C5A1fAEkIMyrsEH89zmg3r2hzpwZbF3+3nnwquJ2/
         X4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zX/CQGZwby8Bq/JpQAndBnSTYre5Hfcs3oFccuKqTKw=;
        b=AeDVoAbq4KfBP+f1RAn7AbqGYhnlP4ZfQ8Pi0s2EjID6N4EhkNYjvEbtb48EE87e81
         p0pzakJO+w45QKKl9WjxJuy6f4CcvezHVeffjvaig2+p+jobJBo6eM6TJa0Z6VjPZm7J
         CKzPG15tH55ClpSbo1ZWb+kNiycv6ij9oRkYEBbMTXR+odKqbbvyQLdkpPf+gshkg0Zl
         4bdpoZalFgEq5XJqSAh+6b1++FRZRxS6mQnEeRxkouN7SMAfKTEZC6yFzr1/I2jOkYI3
         WeYspzsHQ//lgLl3ikn+UFUshUmzMCy1nos5d+Noi8JxcQCPmPrZWlXt2LCHk6TEKeiF
         QXJA==
X-Gm-Message-State: AFqh2kp6pV3GYlVi6emin1pEGBMCm0p/ycAlNi2SnftxJfHSCzBh3QkS
	rwPr513pyhgad5Baxq18Cd+5gw==
X-Google-Smtp-Source: AMrXdXtAfb9mzBghn9Vyao04lelSKGhE8RNvs9VNj/kNNxGDnuIFsLJ3HpOeO5A8QJe7r8jyLiO0kA==
X-Received: by 2002:a05:600c:3d90:b0:3d9:f798:dcba with SMTP id bi16-20020a05600c3d9000b003d9f798dcbamr8881980wmb.38.1673537398182;
        Thu, 12 Jan 2023 07:29:58 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id l24-20020a1ced18000000b003d99da8d30asm26395909wmh.46.2023.01.12.07.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 07:29:57 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v10 6/6] arm64/dts/mt8195: Add temperature mitigation threshold
Date: Thu, 12 Jan 2023 16:28:55 +0100
Message-Id: <20230112152855.216072-7-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112152855.216072-1-bchihi@baylibre.com>
References: <20230112152855.216072-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_073002_216447_3DA245EB 
X-CRM114-Status: GOOD (  10.53  )
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

The mt8195 board has several hotspots around the CPUs. Specify the
targeted temperature threshold when to apply the mitigation and define
the associated cooling devices.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 153 ++++++++++++++++++++---
 1 file changed, 137 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 683e5057d68d..0d6642603095 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/power/mt8195-power.h>
 #include <dt-bindings/reset/mt8195-resets.h>
+#include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/thermal/mediatek-lvts.h>
 
 / {
@@ -2413,107 +2414,227 @@ dp_tx: dp-tx@1c600000 {
 
 	thermal_zones: thermal-zones {
 		cpu0-thermal {
-			polling-delay = <0>;
-			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_mcu MT819x_MCU_LITTLE_CPU0>;
 			trips {
+				cpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
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
 			thermal-sensors = <&lvts_mcu MT819x_MCU_LITTLE_CPU1>;
 			trips {
+				cpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
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
 			thermal-sensors = <&lvts_mcu MT819x_MCU_LITTLE_CPU2>;
 			trips {
+				cpu2_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
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
 			thermal-sensors = <&lvts_mcu MT819x_MCU_LITTLE_CPU3>;
 			trips {
+				cpu3_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
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
 			thermal-sensors = <&lvts_mcu MT819x_MCU_BIG_CPU0>;
 			trips {
+				cpu4_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
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
 			thermal-sensors = <&lvts_mcu MT819x_MCU_BIG_CPU1>;
 			trips {
+				cpu5_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
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
 			thermal-sensors = <&lvts_mcu MT819x_MCU_BIG_CPU2>;
 			trips {
+				cpu6_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
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
 			thermal-sensors = <&lvts_mcu MT819x_MCU_BIG_CPU3>;
 			trips {
+				cpu7_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
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


