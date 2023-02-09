Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDBFC05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZBkTfuXmr0OaP3FFauN+zkjnqCDbogTr0nbbwpqDH4=; b=xXLCARnKplPPR/kK/oV/WFQz+J
	EGiJRJMtQG+MdV7hkbqM/7D9Us9XQo8AkkLIXp36YO/uXbLpqINx6hr3UFFn6Y7To4eraDn3X8sze
	FQC9Fgi7L5kb+gC3waUk4E6t/aOaljNaobPWcuMPEyHaggTwlF/110lDTj8JeXPM0aA9cRxyy2X/a
	Q2M2GOGki2MAP8X0BVWFRjgAazYYuSKc7wBbkg0t+efB5WxqQbA2kH7AjsDvicJ3Vv/vWiJwRTwBP
	6hNtZd/sD8yixpMc/6VZLLwkNbT3R9kxmSakXmT+jz/Qedx0Eb6CFxFBPPP3BX08bZXuWa7COXKG4
	vAYpkdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4bp-0016Ch-MY; Thu, 09 Feb 2023 10:56:57 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ4bV-00162U-Uy
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 10:56:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3576137wma.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 02:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZBkTfuXmr0OaP3FFauN+zkjnqCDbogTr0nbbwpqDH4=;
        b=LwMhn4fqY+w84rV3zfI4uVPHzcsI6lLAmaMS9lsY5EeRlE0sVbz2t+dWyvDXXz9uE0
         zmTK/sZD4wfXDWGVxK1nYWg4iIRKpUzgxzBBo7XYx7ayQh68bS8YYfv0FCUZck6o8r6X
         mcXZDdjVeAgb9wXz+YCGRTuhuDRTIgn0IQqG8sGfpuqgV2trhZiDnmw6/5uf+ydOMUsb
         Ri0Mus6AmDx4ycWr7jBRBfQcozuZ4GQ8l5F8mL1f2dXMCN6sIOqmi2B3dRBkob54s9vQ
         8YjUsJMZBXEf6/ymA0xf3V+o2cg70Vf7fsYDWX22FUQHMNGivLFya05XEeXPkENT5xCF
         GDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZBkTfuXmr0OaP3FFauN+zkjnqCDbogTr0nbbwpqDH4=;
        b=NaN6L4313nwIqeUW3wL+kx4TXl1PqSMf7/7zOMMy7T64LT6QdR0Gv/zKiPLPDEPJDK
         W+QLJ69HhWs9IxY72j+KLUkJ/JIaVJXuQSHEK9qfyz4dxB9sxt9O/HUFCXtJ08oBGfAm
         MTKuCDi+mU5E4kmnmaxA6T3blNeVjUmk+60eHOpuqVgOeoeAHVf4Qku4IFqj6V+FHRsI
         MyNSNZgXLNQiCKLIDM9l2zU//15xtnSsZIrzT1hUldWSBYpPevya7GvqIVJhdiBuIIJ2
         +jlyZiKwldnDFGazTRYaxi4IY7S+0YTgmpDUNAPoNB9VKaeaS80dr7jLJRr79Qa4s91T
         iZ8A==
X-Gm-Message-State: AO0yUKVRVE1KwBLfx2KrAQvj+CkMSER3tlCQWoTIp7bKku8fFqIXZuB6
	lT3HlirgFkoJr7UwthiZM2GreQ==
X-Google-Smtp-Source: AK7set87e+FDrOSFY4nZuqy68f0GEXqfSxMXlgB4tONIbBxnmI9XYCSxG5M6MMKUxR/9Yu+7uyKX2Q==
X-Received: by 2002:a05:600c:993:b0:3e0:6de:aab8 with SMTP id w19-20020a05600c099300b003e006deaab8mr9417222wmp.40.1675940194140;
        Thu, 09 Feb 2023 02:56:34 -0800 (PST)
Received: from t480-bl003.. (185.173.185.81.rev.sfr.net. [81.185.173.185])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003daf6e3bc2fsm9140466wms.1.2023.02.09.02.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:56:33 -0800 (PST)
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
Subject: [PATCH v14 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal controllers
Date: Thu,  9 Feb 2023 11:56:24 +0100
Message-Id: <20230209105628.50294-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209105628.50294-1-bchihi@baylibre.com>
References: <20230209105628.50294-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_025638_003447_33E21EAD 
X-CRM114-Status: GOOD (  13.45  )
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

Add LVTS thermal controllers dt-binding definition for mt8192 and mt8195.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 .../thermal/mediatek,lvts-thermal.yaml        | 142 ++++++++++++++++++
 .../thermal/mediatek,lvts-thermal.h           |  19 +++
 2 files changed, 161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
 create mode 100644 include/dt-bindings/thermal/mediatek,lvts-thermal.h

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
new file mode 100644
index 0000000000000..fe9ae4c425c08
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -0,0 +1,142 @@
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
+      - mediatek,mt8192-lvts-ap
+      - mediatek,mt8192-lvts-mcu
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
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-lvts-ap
+              - mediatek,mt8192-lvts-mcu
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
+              - mediatek,mt8195-lvts-ap
+              - mediatek,mt8195-lvts-mcu
+    then:
+      properties:
+        nvmem-cells:
+          minItems: 2
+
+        nvmem-cell-names:
+          minItems: 2
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
+    #include <dt-bindings/thermal/mediatek,lvts-thermal.h>
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
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
new file mode 100644
index 0000000000000..c09398920468b
--- /dev/null
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Balsam CHIHI <bchihi@baylibre.com>
+ */
+
+#ifndef __MEDIATEK_LVTS_DT_H
+#define __MEDIATEK_LVTS_DT_H
+
+#define MT8195_MCU_BIG_CPU0     0
+#define MT8195_MCU_BIG_CPU1     1
+#define MT8195_MCU_BIG_CPU2     2
+#define MT8195_MCU_BIG_CPU3     3
+#define MT8195_MCU_LITTLE_CPU0  4
+#define MT8195_MCU_LITTLE_CPU1  5
+#define MT8195_MCU_LITTLE_CPU2  6
+#define MT8195_MCU_LITTLE_CPU3  7
+
+#endif /* __MEDIATEK_LVTS_DT_H */
-- 
2.34.1


