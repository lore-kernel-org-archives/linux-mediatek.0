Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E33C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSRyiXt5jg5xGcNVidvCWdFR0yJusjEp3UTc1PNqimw=; b=qSRWWhIBwmge16DA1CdG3zsIH8
	44gLZWte3SiS7R+APefEXwYrPRFZDKMqOl9lV++RHWA8p/aJejQVB35137d3TOUZcCCERHAonMoBB
	PU4nChMkrSVKU5lu4a7zck2tHr0hrklnu2B6YyoqJx0F12EVAb+5GxhEC/BpYFxz1aJndDyrEQENR
	PVOYnRuilNmuIVBXhCZnYLn17yartPtFdkiJ6GG6GjRXU0FtLYbPvtFXs/REYMBqG3ErgfACMH8Kl
	fhX1r/wZWuzFDSQVp1BsZu193ZF8GPTeLlNgbbgtcMBhYeo7oEywsSVp5q98oZxDCqUaqydzL46uB
	xMUwCl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4q0-00BgAt-Ff; Thu, 26 Jan 2023 16:10:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4pw-00Bg8J-PK
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 16:10:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id l8so1467509wms.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSRyiXt5jg5xGcNVidvCWdFR0yJusjEp3UTc1PNqimw=;
        b=D7esD/YspzXO+5fTgFKhqMa1nHMS4BS0Pra6HkU4CBBwGcfvZsn2dfm3E2LZHm+Jlg
         /ByBj3OMqBE6TYJmVjxF3Fcwn0pJTCundKHDfx7GJgXQW6dvSgWlmG/D6s6nQVI/iBGS
         3aM3r9jPNoKvu4vQfF4XfTa517/YaLBOHIoAWbWp7LTT+MQpHpUqkS+tXdIrz2HgaEjR
         Mow+w7HnEYZEmc5piE3dC4YEcICOSPFC49fqxQIHVZtVdjvYv7+nUsJkkS/pa7qolA0Y
         pN2yxWAyXqco7HEtyXMJJDPHSlSC7YM6br58sZiVSTojuc2JU/GHep+tdY7oxSqc1Gwo
         FDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSRyiXt5jg5xGcNVidvCWdFR0yJusjEp3UTc1PNqimw=;
        b=jaP3h1BrK3hp3ErjCpb25+v0XNv4g9dl0gVPJ7u4rcCHnGMObFg64RjzPz4lU4ID25
         /qNQFwGxB1A/SllLTMZ8n4nFAKqMLt7e+bGMgBgkUICk5RwBWOhZINlETxnOIxdA/NoH
         4ga+ExMbx0ISwElIIFZK71q/lZ1Im2GvUUF+rb+5BfqdJFKiLFjjIwaB8v7AxWUXhHKy
         Pn6jVsqVf69nV67/heeQbgEBVQeGOSTzTIyH7PDMBizIcQWgeLZe4OvXYSkUs/ev5rVn
         ROrrRJZePW8WgqnPrKrNw/03O+NfBauRShkVqENUxH/sJn0LEKfNAPykhala+fOaR83F
         aOqQ==
X-Gm-Message-State: AFqh2kr5GbUvvXxYtojqbMlJnJETAkjVDuRuCzjQozrVf8zyF0gvmj9X
	8aO1URkjZlNegLkcNSlOoTqf2Q==
X-Google-Smtp-Source: AMrXdXvLdNi6h2JhbNJzodbD1T9pYrgKkxDyUs3ZRI02aRBggdz0+dUeKSUN0ZJRa/Fv7sHMoJ80dQ==
X-Received: by 2002:a05:600c:22c6:b0:3da:fc30:bfc5 with SMTP id 6-20020a05600c22c600b003dafc30bfc5mr36978536wmg.13.1674749450471;
        Thu, 26 Jan 2023 08:10:50 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id q18-20020a05600c2e5200b003d1de805de5sm1782401wmf.16.2023.01.26.08.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:10:50 -0800 (PST)
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
Subject: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal controllers dt-binding definition
Date: Thu, 26 Jan 2023 17:10:48 +0100
Message-Id: <20230126161048.94089-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124131717.128660-3-bchihi@baylibre.com>
References: <20230124131717.128660-3-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_081052_873396_9EB85247 
X-CRM114-Status: GOOD (  15.91  )
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
  v12:
     - Fixed subject prefix
     - Fixed licences GPL-2.0+ to GPL-2.0
     - Added dual licenses
  v11:
     - Rebase on top of "thermal/linux-next" :
       base=0d568e144ead70189e7f16066dcb155b78ff9266
     - Remove unsupported SoC (mt8192) from dt-binding definition
  v10:
     - Rebase on top of "thermal/linux-next" : thermal-v6.3-rc1
  v9:
     - Rebase on top of 6.0.0-rc1
     - Update dt-bindings :
       - Add "allOf:if:then:"
       - Use mt8192 as example (instead of mt8195)
       - Fix dt-binding errors
       - Fix DTS errors
  v8:
     - Fix coding style issues
     - Rebase on top of next-20220803
     - Add multi-instance support :
       - Rewrite DT-binding and DTS :
         - Add DT-binding and DTS for LVTS_v4 (MT8192 and MT8195)
           - One LVTS node for each HW Domain (AP and MCU)
         - One SW Instance for each HW Domain
  v7:
     - Fix coding style issues
     - Rewrite dt bindings
       - was not accurate
       - Use mt8195 for example (instead of mt8192)
       - Rename mt6873 to mt8192
       - Remove clock name
---
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
index 000000000000..902d5b1e4f43
--- /dev/null
+++ b/include/dt-bindings/thermal/mediatek-lvts.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0 or MIT) */
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


