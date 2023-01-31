Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01522C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22OuGl1Rl5k/omloIRKBcTeCPAl/PTnUyUtJ/lKNdiM=; b=AKgmhYi8kKnt4s5paEyhMkmiSY
	mf37aFyVnBv+2Qh6pE2ef7GvgmRtnZRxHIb31KjRBeCpwTKxMA3YDTzA77QNcRKfJPRwZzh09i1h6
	lqmUBnI9/v2FtIW69ZMMTXxUzHNHQZstntFhc8f/0oNGyTVHKomRac49xOyAolYauiBbqM/9bLXlk
	w6rkY3F8586BnfY/j7MvVKJL/mRVxYv87MH+yTWIDK+d9H7WXtf5QrR5rJ53E1pgKoWDbalqOJEI4
	pBYh330hYPIpE890NJ0np89fqhbaW/JOINFwLzbBhelVeQxz3mbR61ZhILszYNTlvC11uad/uq6Wq
	dw39Fcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrFg-008EKO-Nq; Tue, 31 Jan 2023 14:04:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrFc-008EHV-JJ
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 14:04:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id d14so14295810wrr.9
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 06:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22OuGl1Rl5k/omloIRKBcTeCPAl/PTnUyUtJ/lKNdiM=;
        b=if/PCWHwByy4LBuPHrr9Kzs1K4sedSNOpWUedCcfI3eoKRddTZm7EWjEuc5LqcmjBn
         lvCsVQvpr6idngYZ0gqKrzcWPPrv/DzbYKkUqgDpWR8cSXCYTA34CfZInXIoGI3TaV9s
         ShwAOkL30yfCyIUp/LcSq0yK7r/mSlsX/4wotibK9TgekBfqEHcQY6VHb9V6wTC9btbl
         AU4Q13gbVmsj4NIYBjxVDFWXQ+TqJu1q6Eaj2CuBgj1GNyHfIyiHqvzR0f1jLm53RzCU
         BSmvRxdOOPBnRX2N60lq8g46hvLR7qzkNZmxuZgXERjDMiIfxM7+4owadOWJWHoeBFfV
         7WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22OuGl1Rl5k/omloIRKBcTeCPAl/PTnUyUtJ/lKNdiM=;
        b=OQcNm/UVEK2ihVT1SCKb2N+TKqSiBf2ny+7yqzsr4i7kt3oluH9W+x5jRX3LZI3dg1
         WetMtjw/y7W+ZXD2KIT8q9RkuvG2NwzAp0f5s3lRS+pS1798RFfYy3HWkGwjUrhpP4SP
         WwV4qq2qCj0WXgr+8tLS9/n6uwyMZrjsm7WGvQWe0nV/x1lRRQYcS+1WaLtY3KgzICSM
         C+7eAGNnDF9mTw2pmJZpuB01xtn36wf0YYfo1X6kAWu24DZiOCfmYJvvDVylTkccdk8a
         PYhhKHcfiILhpMeMe8TrxpXQbpjlWWDhdJCcEUzmRk5wZzZSv+/vbHQNPcnJj+MKBbj3
         IDIA==
X-Gm-Message-State: AO0yUKUitr8twMQQhAUn3rYEzXufmY5x+f0/KideeJat+2c32jhps125
	uL8mzEzdVI4xXazBd8I0Yfhvvg==
X-Google-Smtp-Source: AK7set+5o21SMWNGyITnSJ6WfocSug+a1HYqAQ+171bk74m6Z8XUUaom0+C7HcRgU/XweK6pBB9Hyw==
X-Received: by 2002:a5d:658d:0:b0:2bf:ae43:108d with SMTP id q13-20020a5d658d000000b002bfae43108dmr25647204wru.28.1675173881683;
        Tue, 31 Jan 2023 06:04:41 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d6d8f000000b002bfb37497a8sm15760650wrs.31.2023.01.31.06.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 06:04:41 -0800 (PST)
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
Subject: [PATCH v3] dt-bindings: thermal: mediatek: Add LVTS thermal controllers
Date: Tue, 31 Jan 2023 15:04:39 +0100
Message-Id: <20230131140439.600164-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126161048.94089-1-bchihi@baylibre.com>
References: <20230126161048.94089-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_060444_677833_618FF011 
X-CRM114-Status: GOOD (  14.43  )
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
Changelog:
  v3:
     - Fixed subject prefix
     - Fixed licenses GPL-2.0-only OR BSD-2-Clause
       to GPL-2.0 OR MIT (to match DT)
     - Fixed matching dt-binding file names
  v2:
     - Fixed subject prefix
     - Fixed licenses GPL-2.0+ to GPL-2.0
     - Added dual licenses
---
---
 .../thermal/mediatek,lvts-thermal.yaml        | 107 ++++++++++++++++++
 .../thermal/mediatek,lvts-thermal.h           |  19 ++++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
 create mode 100644 include/dt-bindings/thermal/mediatek,lvts-thermal.h

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
new file mode 100644
index 000000000000..5fa5c7a1a417
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
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
index 000000000000..ca1ef29a8fee
--- /dev/null
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Balsam CHIHI <bchihi@baylibre.com>
+ */
+
+#ifndef __MEDIATEK_LVTS_DT_H
+#define __MEDIATEK_LVTS_DT_H
+
+#define MT8195_MCU_BIG_CPU0		0
+#define MT8195_MCU_BIG_CPU1		1
+#define MT8195_MCU_BIG_CPU2		2
+#define MT8195_MCU_BIG_CPU3		3
+#define MT8195_MCU_LITTLE_CPU0	4
+#define MT8195_MCU_LITTLE_CPU1	5
+#define MT8195_MCU_LITTLE_CPU2	6
+#define MT8195_MCU_LITTLE_CPU3	7
+
+#endif /* __MEDIATEK_LVTS_DT_H */
-- 
2.34.1


