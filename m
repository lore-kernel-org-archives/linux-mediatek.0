Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45845C7EE2F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tx3LRL13pvIq7TmTO5C99jvXvKyqHUaQmfVnHwqD2F8=; b=gBafG66zFb2idYNcz9jtd2TFoG
	4fnylvnEC/8tclfxR9ZSnyV+j55n7vmyIIa7DpmCXtDKFLiy7L3XDWB/14/F4yrHpG8z9Xgn/BZfL
	AMbsWSwWl7BqM7b/IdITysQUtsgoXFqRi/SFlL+D6UzRLaNpvKo6t1AR86f2cmTNRvOVbo0G+oMz4
	BHz8CxJH1M6DR/u5j+WThvK5UiXIPJsXjYitabt2Hc0yBGr6QGgR9mGEhYyR+nHhviGmSJ2/IbV6e
	+nm16Qy/+Nb6s8cfmxXOU7w//5+Eex19ziZI9CHkMPwzRjW3r/2U7aSl7JI4wTRE6KeW6rIaxEa5l
	5TuqtDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ibi-003itG-14;
	Thu, 01 Jun 2023 13:44:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ibc-003irS-0v;
	Thu, 01 Jun 2023 13:44:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A0486453D;
	Thu,  1 Jun 2023 13:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AB1C433EF;
	Thu,  1 Jun 2023 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685627081;
	bh=i9d2RUZUKNfyrbtB+Rn03BoaOzOiWiw7rxwB7rAOB7A=;
	h=From:To:Cc:Subject:Date:From;
	b=SRvKheduSKeo4K8bsY6U4I95jcrRsnS8RYMiMDiip2FiqtI6s8AwnUenOT/5VHcvA
	 8oVXoZJ8LhUsHzUHTabmhxgCn0EdKx1P4o83tDpxkxh50DAQQLT0nSUoF9pPH64/XL
	 +Y3TJud+5l16vGKHFSzBMy8rO8i+qcI1gIA8xr19RPWwFmlBn8abH6GJq5/q9HN2Je
	 WIJlLNH90pHxkCSNjO/OU280CZhgruA8stn4RCVg3rQcn9bfG5Ds1fQYWn/1I4N+8H
	 Xn69l65zOHgGQkatYQL7mxsk00saqzydlnH3BlkgHBxorY44pAlLg0saEeZzadUzZx
	 0M5N8O4kHzNDg==
From: matthias.bgg@kernel.org
To: rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	Amit Kucheria <amitk@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Move auxdac binding to yaml
Date: Thu,  1 Jun 2023 15:44:24 +0200
Message-Id: <20230601134425.29499-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_064444_424676_50B49A76 
X-CRM114-Status: GOOD (  21.31  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Convert the older binding to yaml syntax.
The thermal IP has several sensors, to reflect that
thermal-sensors-cells is set to '1'. Apart optional regulator
for bank supply wasn't part of the old binding description,
this patch adds them.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

Changes in v2:
- drop auxadc and apmixedsys nodes
- maxItems for clocks
- drop obvious description of reset
- mention optional regulators in commit message
- mention thermal-sensors-cells change in commit message

 .../bindings/thermal/mediatek,thermal.yaml    | 152 ++++++++++++++++++
 .../bindings/thermal/mediatek-thermal.txt     |  52 ------
 2 files changed, 152 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
new file mode 100644
index 000000000000..bbc9c2935da0
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Thermal Sensor
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  The MediaTek thermal controller measures the on-SoC temperatures.
+  This device does not have its own ADC, instead it directly controls
+  the AUXADC via AHB bus accesses. For this reason this device needs
+  phandles to the AUXADC. Also it controls a mux in the apmixedsys
+  register space via AHB bus accesses, so a phandle to the APMIXEDSYS
+  is also needed.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-thermal
+          - mediatek,mt2712-thermal
+          - mediatek,mt7622-thermal
+          - mediatek,mt7986-thermal
+          - mediatek,mt8173-thermal
+          - mediatek,mt8183-thermal
+          - mediatek,mt8365-thermal
+      - items:
+          - const: mediatek,mt7981-thermal
+          - const: mediatek,mt7986-thermal
+      - items:
+          - const: mediatek,mt8516-thermal
+          - const: mediatek,mt2701-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: therm
+      - const: auxadc
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: therm
+
+  nvmem-cells:
+    items:
+      - description: Calibration eFuse data. If unspecified default values are used.
+
+  nvmem-cell-names:
+    items:
+      - const: calibration-data
+
+  mediatek,auxadc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the AUXADC which the thermal controller uses.
+
+  mediatek,apmixedsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the APMIXEDSYS controller.
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  bank0-supply:
+    description: Regulator supplying voltage to the first bank
+
+  bank1-supply:
+    description: Regulator supplying voltage to the second bank
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - mediatek,auxadc
+  - mediatek,apmixedsys
+  - "#thermal-sensor-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/reset/mt8173-resets.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      thermal: thermal@1100b000 {
+        #thermal-sensor-cells = <1>;
+        compatible = "mediatek,mt8173-thermal";
+        reg = <0 0x1100b000 0 0x1000>;
+        interrupts = <0 70 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&pericfg CLK_PERI_THERM>, <&pericfg CLK_PERI_AUXADC>;
+        clock-names = "therm", "auxadc";
+        resets = <&pericfg MT8173_PERI_THERM_SW_RST>;
+        reset-names = "therm";
+        mediatek,auxadc = <&auxadc>;
+        mediatek,apmixedsys = <&apmixedsys>;
+        nvmem-cells = <&thermal_calibration_data>;
+        nvmem-cell-names = "calibration-data";
+      };
+
+      thermal-zones {
+        cpu_thermal: cpu-thermal {
+          polling-delay-passive = <1000>;
+          polling-delay = <1000>;
+
+          thermal-sensors = <&thermal 0>;
+          sustainable-power = <1500>;
+
+          trips {
+            threshold: trip-point0 {
+              temperature = <68000>;
+              hysteresis = <2000>;
+              type = "passive";
+            };
+
+            target: trip-point1 {
+              temperature = <85000>;
+              hysteresis = <2000>;
+              type = "passive";
+            };
+
+            cpu_crit: cpu-crit0 {
+              temperature = <115000>;
+              hysteresis = <2000>;
+              type = "critical";
+            };
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
deleted file mode 100644
index ac39c7156fde..000000000000
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-* Mediatek Thermal
-
-This describes the device tree binding for the Mediatek thermal controller
-which measures the on-SoC temperatures. This device does not have its own ADC,
-instead it directly controls the AUXADC via AHB bus accesses. For this reason
-this device needs phandles to the AUXADC. Also it controls a mux in the
-apmixedsys register space via AHB bus accesses, so a phandle to the APMIXEDSYS
-is also needed.
-
-Required properties:
-- compatible:
-  - "mediatek,mt8173-thermal" : For MT8173 family of SoCs
-  - "mediatek,mt2701-thermal" : For MT2701 family of SoCs
-  - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
-  - "mediatek,mt7622-thermal" : For MT7622 SoC
-  - "mediatek,mt7981-thermal", "mediatek,mt7986-thermal" : For MT7981 SoC
-  - "mediatek,mt7986-thermal" : For MT7986 SoC
-  - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
-  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
-  - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
-- reg: Address range of the thermal controller
-- interrupts: IRQ for the thermal controller
-- clocks, clock-names: Clocks needed for the thermal controller. required
-                       clocks are:
-		       "therm":	 Main clock needed for register access
-		       "auxadc": The AUXADC clock
-- mediatek,auxadc: A phandle to the AUXADC which the thermal controller uses
-- mediatek,apmixedsys: A phandle to the APMIXEDSYS controller.
-- #thermal-sensor-cells : Should be 0. See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for a description.
-
-Optional properties:
-- resets: Reference to the reset controller controlling the thermal controller.
-- nvmem-cells: A phandle to the calibration data provided by a nvmem device. If
-               unspecified default values shall be used.
-- nvmem-cell-names: Should be "calibration-data"
-
-Example:
-
-	thermal: thermal@1100b000 {
-		#thermal-sensor-cells = <1>;
-		compatible = "mediatek,mt8173-thermal";
-		reg = <0 0x1100b000 0 0x1000>;
-		interrupts = <0 70 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&pericfg CLK_PERI_THERM>, <&pericfg CLK_PERI_AUXADC>;
-		clock-names = "therm", "auxadc";
-		resets = <&pericfg MT8173_PERI_THERM_SW_RST>;
-		reset-names = "therm";
-		mediatek,auxadc = <&auxadc>;
-		mediatek,apmixedsys = <&apmixedsys>;
-		nvmem-cells = <&thermal_calibration_data>;
-		nvmem-cell-names = "calibration-data";
-	};
-- 
2.40.1


