Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2203FC25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1Mx7/fdaOZTAyQvhijx+hcsNa4waknDOv8lEc+khP4=; b=tQPZiFGcDHKhiNOaqzclPeXxet
	O/Ad0rSHAhZIJvm8NxTHE+YoHY0ppIG569EQz9oEHjfWUgUwOdEStgq9pnwtzs08uVjdWPWPXWj+f
	PB5cZEVBqbVXyiruhwpLsRzgdPtQmKHMBHyf5nyOUcUBMgUpUwRV7TIc63ed/rs3t2/ga5AOvT1ba
	nulCUgh/KB7gsay7DSCw9tqVfwUtZp00C6mGYe8HIQG9U0dNsyiEuBNpH4JzQ4d2ojj1XCBGUDfgF
	swmw5JWCGyo2ipQWdfLi77QbaLM2+cSrkn0AWrx60YyFvjEOYjMOvAA5q1jFWV1nV1KPr7o0jdZ/j
	2x0zHw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJBj-003vOF-Pg; Tue, 24 Jan 2023 13:18:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJAu-003v48-QD
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 13:17:27 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q5so9184910wrv.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 05:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1Mx7/fdaOZTAyQvhijx+hcsNa4waknDOv8lEc+khP4=;
        b=EoOqRR3T6Ta4E3QxcuRnYWEzz9pMRdDke6GJsf9uSUye/17W+z/erW46IPFzuqZYuP
         eGSDTx5DtbH+WWN/oIA0PxT5tdLr0vqsPy8IY0PpUa8k805JHSSThupwcGZ+JeJHm/sL
         XIgmbvaXh7ij9K7UmTT+/rIL3F7YVVX+ihx7lokVc1Fw3tQmb9tSPpT54Y1nrq4xm/Nq
         6oqISFQkYzEqACyezZsst9jXJV1cEw8TkXY4tsyHToXvpqvT82te0GC+u1NvuFLO0Hpe
         ciydRTszvegrhGQfN39GFV1goqQkQgXes2b2mm5gy4CORr8TycrqZvqr54h4uBA90sCY
         JqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1Mx7/fdaOZTAyQvhijx+hcsNa4waknDOv8lEc+khP4=;
        b=62goXh6zezoS6wTHPbDNftoSRcdLb37FOIk3RmS/cP1FVXCydFD/YZ6Eb5kSMIB7vG
         MZZWXWiMRjyV8+/SMPtL2ea+k28hKA4TjZmD0i5O1BhWXex5mottKo3WK1icnn/Ic6P8
         RBZSaDay+u/+Hop53qIxSbs0eGVQfaZ7ifd3VFT6ZrejkFfMKbluauUKx/Cd8/pImBNz
         OH8zO02PsdvuYWocTXTmQN5rMzkAX42MyHLIBWzO0ZKUx49FVQmITxyM21VBha54RFsL
         ESy+m09sFwSPc2GCT/6KnVhyHOQY3YY6z3ThX0fb+R8qU5BVrzPCHGgbkoZO9txaCtcf
         Z3fw==
X-Gm-Message-State: AO0yUKXgVqk9b9IscdTTw5OOrBZT0kp+r2gacMuMNO7LkNNSaf71T5RZ
	xY0blWZcAgftNWJm29rdajjt0Q==
X-Google-Smtp-Source: AK7set+Mg41hXPJ0l3tt4EGAf6QzluqgF8PoERLSORY4izIzfw6NeNTevB2exR9qCTgplKpgwwPKJA==
X-Received: by 2002:adf:b351:0:b0:2bf:ae4b:4cbf with SMTP id k17-20020adfb351000000b002bfae4b4cbfmr2331594wrd.55.1674566239580;
        Tue, 24 Jan 2023 05:17:19 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id a5-20020adfeec5000000b002bfb5ebf8cfsm49427wrp.21.2023.01.24.05.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:17:19 -0800 (PST)
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
Subject: [PATCH v11 2/6] dt-bindings/thermal/mediatek: Add LVTS thermal controllers dt-binding definition
Date: Tue, 24 Jan 2023 14:17:13 +0100
Message-Id: <20230124131717.128660-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124131717.128660-1-bchihi@baylibre.com>
References: <20230124131717.128660-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_051720_897870_65CE6FD8 
X-CRM114-Status: GOOD (  13.50  )
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

Add LVTS thermal controllers dt-binding definition for mt8195.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 .../thermal/mediatek,lvts-thermal.yaml        | 107 ++++++++++++++++++
 include/dt-bindings/thermal/mediatek-lvts.h   |  19 ++++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
 create mode 100644 include/dt-bindings/thermal/mediatek-lvts.h

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
new file mode 100644
index 000000000000..12bfbdd8ff89
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoC Low Voltage Thermal Sensor (LVTS)
+
+maintainers:
+  - Balsam CHIHI <bchihi@baylibre.com>
+
+description: |
+  LVTS is a thermal management architecture composed of three subsystems,
+  a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
+  a Converter - Low Voltage Thermal Sensor converter (LVTS), and
+  a Digital controller (LVTS_CTRL).
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-lvts-ap
+      - mediatek,mt8195-lvts-mcu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+    description: LVTS reset for clearing temporary data on AP/MCU.
+
+  nvmem-cells:
+    minItems: 1
+    items:
+      - description: Calibration eFuse data 1 for LVTS
+      - description: Calibration eFuse data 2 for LVTS
+
+  nvmem-cell-names:
+    minItems: 1
+    items:
+      - const: lvts-calib-data-1
+      - const: lvts-calib-data-2
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - nvmem-cells
+  - nvmem-cell-names
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/reset/mt8195-resets.h>
+    #include <dt-bindings/thermal/mediatek-lvts.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      lvts_mcu: thermal-sensor@11278000 {
+        compatible = "mediatek,mt8195-lvts-mcu";
+        reg = <0 0x11278000 0 0x1000>;
+        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+        resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+        nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+        nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
+        #thermal-sensor-cells = <1>;
+      };
+    };
+
+    thermal_zones: thermal-zones {
+      cpu0-thermal {
+        polling-delay = <1000>;
+        polling-delay-passive = <250>;
+        thermal-sensors = <&lvts_mcu MT8195_MCU_LITTLE_CPU0>;
+
+        trips {
+          cpu0_alert: trip-alert {
+            temperature = <85000>;
+            hysteresis = <2000>;
+            type = "passive";
+          };
+
+          cpu0_crit: trip-crit {
+            temperature = <100000>;
+            hysteresis = <2000>;
+            type = "critical";
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/thermal/mediatek-lvts.h b/include/dt-bindings/thermal/mediatek-lvts.h
new file mode 100644
index 000000000000..428a95c18509
--- /dev/null
+++ b/include/dt-bindings/thermal/mediatek-lvts.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Balsam CHIHI <bchihi@baylibre.com>
+ */
+
+#ifndef __MEDIATEK_LVTS_DT_H
+#define __MEDIATEK_LVTS_DT_H
+
+#define MT8195_MCU_BIG_CPU0	0
+#define MT8195_MCU_BIG_CPU1	1
+#define MT8195_MCU_BIG_CPU2	2
+#define MT8195_MCU_BIG_CPU3	3
+#define MT8195_MCU_LITTLE_CPU0	4
+#define MT8195_MCU_LITTLE_CPU1	5
+#define MT8195_MCU_LITTLE_CPU2	6
+#define MT8195_MCU_LITTLE_CPU3	7
+
+#endif /* __MEDIATEK_LVTS_DT_H */
-- 
2.34.1


