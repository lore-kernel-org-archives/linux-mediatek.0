Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBFAC7EE31
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M19llECL/YOcAQVfKbeGNOw1STW9iLMRUVpA3vGC3yE=; b=RXKv7WTEMKc+U0EMgXPatQznCe
	GiROqrfiaUCYIxQFfhBO6yyAtmimYj98Grm5LvJ0M/QFAQJ6/ZuC3IH43aeBJgmxj+SBF9eTmNedt
	b+/Lo9s3CWAcedTJ0sSO45WWgqL+mRD008jcWWq2rDJvc4ksJdNitaO6ieWz9n1mgpuFXHWZzv8kU
	VAKojkKgZCCgt/xjQoEEMJfcWivnxP/dRiZaiwF3BmsPHIEAx3nJNzyxRwXoeh2wq6c3tt25ItqLt
	/LZfUFDY3wUr+l5dH5vr89pTM0TtUnQv6RK9DufsVgj4884qgAwn862/s7kxCaoJ9J9OH6ID8TLbk
	jz3qvpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q40ts-00EKnZ-0a;
	Tue, 30 May 2023 15:04:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q40tf-00EKi3-0o;
	Tue, 30 May 2023 15:04:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21A6A63209;
	Tue, 30 May 2023 15:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB0CC4339B;
	Tue, 30 May 2023 15:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685459063;
	bh=+o5m6BKZjSps+olk91BJwnTeymdT4kDRa5cOcck98WI=;
	h=From:To:Cc:Subject:Date:From;
	b=Q6+OQIeZBNJsxfG83QUIzSLX95F8vwZd6mYhLLnW4l3e9hDZMRB+X2cVbbStmCWIZ
	 xp8e7XLOtU443E8Nz9FC0CTnJXhhZPvQjtzmxsJFU1N23JwViUe3bnuB5lYEe3M2O6
	 qaA6hj6slJ74A5Q8UKtJidtiGMibLwObi3mvXFGpKDzTznnUliXQq8O/MPgcopLUKD
	 ZflwEAayohmtfDCET6Qz6B04/Pxpit0dItWesKKRGdCzxGsEXPJh/ixIJhPwd4RvFn
	 +CsVvAioP6pddS35LEY9658KwngAJGNaz4aiG4EdnvuNk8MGWDgMyiiJU2xYg7TK8g
	 wCNJ85G2z5YPg==
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
Subject: [PATCH 1/2] dt-bindings: thermal: mediatek: Move auxdac binding to yaml
Date: Tue, 30 May 2023 17:04:12 +0200
Message-Id: <20230530150413.12918-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_080427_391387_D257AB94 
X-CRM114-Status: GOOD (  19.70  )
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

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 .../bindings/thermal/mediatek,thermal.yaml    | 168 ++++++++++++++++++
 .../bindings/thermal/mediatek-thermal.txt     |  52 ------
 2 files changed, 168 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
new file mode 100644
index 000000000000..7aa2bdc43567
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
@@ -0,0 +1,168 @@
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
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: therm
+      - const: auxadc
+
+  resets:
+    maxItems: 1
+    description: Reference to the reset controller controlling the thermal controller.
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
+    description: Regulator node supplying voltage to the first bank
+
+  bank1-supply:
+    description: Regulator node supplying voltage to the second bank
+
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
+      auxadc: auxadc@11001000 {
+        compatible = "mediatek,mt8173-auxadc";
+        reg = <0 0x11001000 0 0x1000>;
+        clocks = <&pericfg CLK_PERI_AUXADC>;
+        clock-names = "main";
+        #io-channel-cells = <1>;
+      };
+
+      apmixedsys: clock-controller@10209000 {
+        compatible = "mediatek,mt8173-apmixedsys";
+        reg = <0 0x10209000 0 0x1000>;
+        #clock-cells = <1>;
+      };
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
+            cpu_crit: cpu_crit0 {
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


