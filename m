Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1E6C77B7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fl3seNrtSgor5vBBmIqmZYV2/wKBqM3k1R441plCxUs=; b=FNC/R0n+KwL6cBpLrFW/u24HI7
	Dafjd5en2VlwPihiRrFjMpedZchzBnbnMOMUUR3JsqSZ/a+BbE4+6SxAPpbH7BtFfvufi31DpfzgJ
	GsU9Jx3XGoZRBVhvpxcV7hLSP4IPwrgQiSgffIo6ZfrZPsCXCJ9ORhej5JWLvUaKAomQhk//dOehK
	F1PoDLXyOzN1lRRICMvGbT1lisvRgmrmdFgf2fiov6hSSXua09iS7QawqcIjFMthSlsNlnkwtjJ+y
	0++E6awxQ0Py9/QcyPITszwLRSc1FS0qJjZ+VcSSTE8BKFBz7Vu89NmXTM46PukSvx+Pj5nysGuw8
	/Wk/jEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prIlM-001EoO-1E;
	Tue, 25 Apr 2023 13:31:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prIl5-001EXy-0K
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 13:31:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f1cfed93e2so29956855e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682429460; x=1685021460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fl3seNrtSgor5vBBmIqmZYV2/wKBqM3k1R441plCxUs=;
        b=0ZUdQxzTUyry3IPnbz7aenPzQulVTVEl1JcgoX4OqHprWkwsH3PO8glrdqAqR3Q+vb
         EH3lscDZmGEdwMu0AfwXsXPqo27g3Ww1bOtfbbmvKa3CW7nUlPrZUBY7PqFu2mEcGikZ
         2MRkPcxe/Li4fMtysZrkjIE9Q+ozBgGIrHOkM2p7xONKruuv3o0PuByTKCwTHxRq5Xsu
         43BKHh1KsNlsMTw9r2SWbFAnOf1/ppOI0b41udmE+3Fu6AShQTwlISlNMPRWrpLrsVcF
         AVLdCK5SsYupPI77+TAOvq42WbkyD0uwSyBeXpdeDIZTlvFNOKXsLHnUwh7NqtFUuW5O
         tFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682429460; x=1685021460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fl3seNrtSgor5vBBmIqmZYV2/wKBqM3k1R441plCxUs=;
        b=V0irjVEywf6YIYXk5+IJraC02B4ObtTjsm2zHLWIy7H8PoGz0C95dllcXsyMJ1uR7w
         UyyRSpQO9xedtfZtn+tQYpxhz073IJWEx2bWalQ1J/A+9NivaAgIHa858qQHmMgZwgmJ
         Vl1vqTn50No6I7lXju+mR2m76PAQQD2+rNZRCjkA9mkar/QLRNtZKcOqJ1yEFevCjRze
         PpG0wPKBHtdguwmsgefrMC65wTtWXP9HIwYv9h/sd+dJV6C6Ys0uh1triUX2ZwxnHVZR
         xjcsSPNZ/Q2Lr+Fus+eGp9Ft3utHjMsz9ZjW3h2Wymx6XB0fGRlUGMk5UstKDjedXd5z
         M1rQ==
X-Gm-Message-State: AAQBX9dQChPBdwGiFG0q/neGYlRE3a983+mwdOSQJZGf9Nnr7LQTXjPq
	b2Okmsj9kF5hVbuYdvcMjY/B/A==
X-Google-Smtp-Source: AKy350ZFKKGH+29lKfcUd8KBsd7m9wa2WVLo6n9sB6XI95k1N6xUyXM02sgOX0aoPnMEAMI9Qjb7Kg==
X-Received: by 2002:a05:600c:364c:b0:3f1:95af:172c with SMTP id y12-20020a05600c364c00b003f195af172cmr7729952wmq.41.1682429460106;
        Tue, 25 Apr 2023 06:31:00 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c198a00b003f16932fe7dsm18575434wmq.38.2023.04.25.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:30:59 -0700 (PDT)
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
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v2 4/5] arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
Date: Tue, 25 Apr 2023 15:30:51 +0200
Message-Id: <20230425133052.199767-5-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425133052.199767-1-bchihi@baylibre.com>
References: <20230425133052.199767-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_063103_181835_29B083D4 
X-CRM114-Status: GOOD (  10.60  )
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

Add thermal nodes and thermal zones for the mt8192.
The mt8192 SoC has several hotspots around the CPUs.
Specify the targeted temperature threshold to apply the mitigation
and define the associated cooling devices.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 454 +++++++++++++++++++++++
 1 file changed, 454 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 87b91c8feaf96..eb2bd94e0ae86 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -14,6 +14,8 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mt8192-power.h>
 #include <dt-bindings/reset/mt8192-resets.h>
+#include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/thermal/mediatek,lvts-thermal.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -71,6 +73,7 @@ cpu0: cpu@0 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@100 {
@@ -88,6 +91,7 @@ cpu1: cpu@100 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -105,6 +109,7 @@ cpu2: cpu@200 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -122,6 +127,7 @@ cpu3: cpu@300 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <530>;
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -139,6 +145,7 @@ cpu4: cpu@400 {
 			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -156,6 +163,7 @@ cpu5: cpu@500 {
 			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@600 {
@@ -173,6 +181,7 @@ cpu6: cpu@600 {
 			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@700 {
@@ -190,6 +199,7 @@ cpu7: cpu@700 {
 			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
+			#cooling-cells = <2>;
 		};
 
 		cpu-map {
@@ -685,6 +695,17 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts_ap: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8192-lvts-ap";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			resets = <&infracfg MT8192_INFRA_RST0_THERM_CTRL_SWRST>;
+			nvmem-cells = <&lvts_e_data1>;
+			nvmem-cell-names = "lvts-calib-data-1";
+			#thermal-sensor-cells = <1>;
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1011,6 +1032,17 @@ nor_flash: spi@11234000 {
 			status = "disabled";
 		};
 
+		lvts_mcu: thermal-sensor@11278000 {
+			compatible = "mediatek,mt8192-lvts-mcu";
+			reg = <0 0x11278000 0 0x1000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_THERM>;
+			resets = <&infracfg MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+			nvmem-cells = <&lvts_e_data1>;
+			nvmem-cell-names = "lvts-calib-data-1";
+			#thermal-sensor-cells = <1>;
+		};
+
 		efuse: efuse@11c10000 {
 			compatible = "mediatek,mt8192-efuse", "mediatek,efuse";
 			reg = <0 0x11c10000 0 0x1000>;
@@ -1715,4 +1747,426 @@ larb2: larb@1f002000 {
 			power-domains = <&spm MT8192_POWER_DOMAIN_MDP>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU0>;
+
+			trips {
+				cpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
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
+		};
+
+		cpu1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU1>;
+
+			trips {
+				cpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
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
+		};
+
+		cpu2-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU2>;
+
+			trips {
+				cpu2_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu2_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
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
+		};
+
+		cpu3-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_LITTLE_CPU3>;
+
+			trips {
+				cpu3_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu3_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
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
+		};
+
+		cpu4-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU0>;
+
+			trips {
+				cpu4_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu4_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
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
+		};
+
+		cpu5-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU1>;
+
+			trips {
+				cpu5_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu5_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
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
+		};
+
+		cpu6-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU2>;
+
+			trips {
+				cpu6_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu6_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
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
+		};
+
+		cpu7-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_mcu MT8192_MCU_BIG_CPU3>;
+
+			trips {
+				cpu7_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu7_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
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
+		};
+
+		vpu0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_VPU0>;
+
+			trips {
+				vpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				vpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		vpu1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_VPU1>;
+
+			trips {
+				vpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				vpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_GPU0>;
+
+			trips {
+				gpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_GPU1>;
+
+			trips {
+				gpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		infra-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_INFRA>;
+
+			trips {
+				infra_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				infra_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cam-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_CAM>;
+
+			trips {
+				cam_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cam_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		md0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_MD0>;
+
+			trips {
+				md0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				md0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		md1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_MD1>;
+
+			trips {
+				md1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				md1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		md2-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8192_AP_MD2>;
+
+			trips {
+				md2_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				md2_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
-- 
2.34.1


