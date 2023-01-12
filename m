Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C003C61DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QQJhQTvWiPr9ySZtlJAJmZ7yaiH8RE0d51kxRCXOJE=; b=qx9tz+qevXgWAw0e77gqy4/R7P
	cJ2sCucqJ9lcE2tA3CQ4AE3htSpwa+D8jX4ADK3pn4wGUY8ESyWVcQcZus6b0/qelZBekLfyCaZgC
	pJdjV0fN8wydbpvdjR8k94FO8mKvJLgFl8YtN3k2F4q4jxuTFNJFkbFzsRH28kyNq1YGMaciGBM2c
	uGbMY8+8Vpmg2jPVibzoBMCIgq1fHLGdDa4BYDi5JEdyTrBxyV2HCT+sYuCfT7HJP7PNyHDQzJQFl
	dwhgC+in/aiwv6WaNBzI4m1mhgHiQgkVb97zEE8kghl8JsOmFTs6V1Jl7nQB2M1Pzm1mvQDIArlbO
	UV6tzGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzWy-00FelY-Hi; Thu, 12 Jan 2023 15:30:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzWd-00Fead-UM
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 15:29:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id ja17so13463355wmb.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 07:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QQJhQTvWiPr9ySZtlJAJmZ7yaiH8RE0d51kxRCXOJE=;
        b=UxompglSyH+QvEIlm5ZP/6IP6s/tpCs6DgkoLYD0u9PacNQMNULMI+i/ZjWqE9HoDT
         sEyWwjMAAiB3lH96geHYqYModKKu43ori8b1/0uYFBAgFezIl61+KZbc1G5LiFL3ZUMl
         nztSxAnV3FqIYMEpYSoARP+5AOD4/2sQFO6cL21Yl26L/cmLX4Kz3G8F1KvZqBcTjr+B
         qeU+Xif0CjVQPbDEtewQaq0sQEHz+yOvT2g8GNRSoyT1GuTxOvI6sBPyHSWZZr4MMUL8
         JHEl9SE969bygf+zMzgNAjNAf85aD2C0mP6bO0hB3q6Qa/9Mcz7a4UX6Jf8/DTxItW9j
         fnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QQJhQTvWiPr9ySZtlJAJmZ7yaiH8RE0d51kxRCXOJE=;
        b=hACH8+zYh9Z7xliCh+0Dg+YJHa7U7EUXl0yFwnAxPQbeD7dLfUcFqUxPw4xTlecMnA
         sAaYvFr/7oBNgKgJ4Rh2XXJ1YUXG5FKw/DFPu8/fsW4gx1PvmlDLWOerMcfDnbC1tUoa
         uHATmQ2dYF/9brwkYpydgjfU3QXnh8sc9H2ZrF35McGyvG9aT3/m9MwOklQlvYPCb1iI
         qOrZBQokG9JZIYVq2vwtRXQdwvEZGsUpZG8P7KcqvO2otaa31PmvIkhoW7R5QJu2Lxdm
         96b1odp2eEjKFf2V1QatN1IbUmcQVPR3zRohtbSxozg0a89trgFIdgmGWWV5LFRkiCw0
         G6CQ==
X-Gm-Message-State: AFqh2kpar5c3+hNxECAcKBVIm/q2O1nbG5jdDOUm9Yn4rTI+QWCrzPQ4
	5R29BNwkr8/7YEFgD+1lIjD/Dw==
X-Google-Smtp-Source: AMrXdXsXDrab2+i2WxxH6TGfNt5hv1F/al/3N+fX7+lLUjnAGIEXBMulggAI+kjrlcmjW28EM3yExw==
X-Received: by 2002:a05:600c:3509:b0:3c6:e60f:3f6f with SMTP id h9-20020a05600c350900b003c6e60f3f6fmr54885253wmq.38.1673537394730;
        Thu, 12 Jan 2023 07:29:54 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id l24-20020a1ced18000000b003d99da8d30asm26395909wmh.46.2023.01.12.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 07:29:54 -0800 (PST)
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
Subject: [PATCH v10 2/6] dt-bindings/thermal/mediatek: Add dt-binding document for LVTS thermal controllers
Date: Thu, 12 Jan 2023 16:28:51 +0100
Message-Id: <20230112152855.216072-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112152855.216072-1-bchihi@baylibre.com>
References: <20230112152855.216072-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_072956_028018_3D6C45CF 
X-CRM114-Status: GOOD (  12.89  )
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

Add dt-binding document for mt8192 and mt8195 LVTS thermal controllers.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 .../thermal/mediatek,lvts-thermal.yaml        | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
new file mode 100644
index 000000000000..43b8777fc1b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -0,0 +1,140 @@
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
+      - mediatek,mt8192-lvts-mcu
+      - mediatek,mt8192-lvts-ap
+      - mediatek,mt8195-lvts-mcu
+      - mediatek,mt8195-lvts-ap
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
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-lvts-mcu
+              - mediatek,mt8192-lvts-ap
+    then:
+      properties:
+        nvmem-cells:
+          maxItems: 1
+
+        nvmem-cell-names:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-lvts-mcu
+              - mediatek,mt8195-lvts-ap
+    then:
+      properties:
+        nvmem-cells:
+          maxItems: 2
+
+        nvmem-cell-names:
+          maxItems: 2
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
+        thermal-sensors = <&lvts_mcu MT819x_MCU_LITTLE_CPU0>;
+        trips {
+          cpu0_alert: trip-alert {
+            temperature = <85000>;
+            hysteresis = <2000>;
+            type = "passive";
+          };
+          cpu0_crit: trip-crit {
+            temperature = <100000>;
+            hysteresis = <2000>;
+            type = "critical";
+          };
+        };
+      };
+    };
-- 
2.34.1


