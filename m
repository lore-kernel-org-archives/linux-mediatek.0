Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E59C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 05:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v27wSqqrShCzztVlfwu/zWkCL4FJgwhMdx/No5LYqKU=; b=0V/1ElhuXgHKHwa8D0JTwfHZT7
	IKLGDy7lzUhW86zbGbSr0YevjY3hcU77myjzqBGn4G1FmGSteLTM0nG8KE8C2wK4ys4sx8Yavt3/D
	tOro2FEKrHEzTD+QtslXjlUcn/63GWFde8VDOr5YMtVOCje/FoyxdUtcXUyhmMNuxR1L6EiSwZO6T
	sQIeJ59p5O0KaJH7JJuquGBqnwuWamy9Ken0vF7mZE21i+11yz2jb6Zf3pp0RQslGcJaQYjEXmLat
	Vo/VQiA3kF1esPXCRJ/EWPE8va8NrvuKlJpSUsKjrAe1dtzzS/yle+24MmOAm7os3DDVtF6UBkpxJ
	+g58TZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3rJd-005fLQ-23;
	Fri, 17 Nov 2023 05:22:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3rJa-005fKC-0W;
	Fri, 17 Nov 2023 05:22:52 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso5302243a12.1;
        Thu, 16 Nov 2023 21:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700198567; x=1700803367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v27wSqqrShCzztVlfwu/zWkCL4FJgwhMdx/No5LYqKU=;
        b=jcFIN6om3bx7Mbh9xY3DbRP5PrZlL0Q/DPVlhYprliLIO6MDPnf86KsiYrqC7VWv4b
         eDpmKl3PazCS97u3cIFnbyGt0ljwfBoVUOL581F+zbmZ4XafyAKxT2AnWGbtfk32/x7T
         vloU17egMoK2Wd1KjqtEUcc5iqiKq4c+y17qd4fxgJylevF2X8gSwB2YbAZrfPpTLyMG
         sRFDhoESu24z+KUMLjYARVuYwqoEwkXFrBYS03i2TN4NivVcy92JE88YbrYl05lL0AFW
         YXFPFpTsavrcmzUR3IKdVbv/oWs9MCm1IITyuvwdbZlVOxOBw3ZjRj0ZcfG8bWWoHVZr
         KYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700198567; x=1700803367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v27wSqqrShCzztVlfwu/zWkCL4FJgwhMdx/No5LYqKU=;
        b=T/e5i7idR8uQqvT7UskeMLFIDzYN9Iuey1EN0XQbxprzfdeU9Y8NmYgBU1CLmkKptF
         9ghx7mHR8xjUJFs4OKMS2Qd8G9oMtuQUHhA1Li35KzmMqz18zDjbDpLbsrHp2Bndv8EM
         ehzXzjCIq2pIgCWwL77sgE9TZMlAP28ljEZMI5i8fmLfhI2ZZaOkvI9+GK1GrN6sOrTG
         Kny3OPUn/FHeFTBbcf/7MZfHSHPFARUjSEPjOQL4sxrVpjalGl1Nk7p3LHyOVUUyrJoH
         T6plu5o/ddjTLXLDur6iRCU6FUDLzYSLp0mAVnGpFg7exfLXNJSOdC6JR2U/oZoUpF0Z
         i6Eg==
X-Gm-Message-State: AOJu0Yx6MVd317kjvo0r8u11bOjJgF76KCe9oDihrAs9XMDYsSIWCeJg
	Yil+QJaxgJBTPXJ88+JCais=
X-Google-Smtp-Source: AGHT+IFWYXXsNUiwsA640Taj8FVTPG3BMMTjDOpghUVLL6KpPkR4Qh5oftQ0IlSbTvHeL6rafpGPEw==
X-Received: by 2002:a17:907:970f:b0:9ad:e3fd:d46c with SMTP id jg15-20020a170907970f00b009ade3fdd46cmr4388479ejc.10.1700198567153;
        Thu, 16 Nov 2023 21:22:47 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id lt16-20020a170906fa9000b009e71efcce28sm380238ejb.210.2023.11.16.21.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 21:22:46 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3] dt-bindings: thermal: convert Mediatek Thermal to the json-schema
Date: Fri, 17 Nov 2023 06:22:14 +0100
Message-Id: <20231117052214.24554-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_212250_197385_A3BC3378 
X-CRM114-Status: GOOD (  20.79  )
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

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files. Introduced changes:
1. Improved title
2. Simplified description (dropped "This describes the device tree...")
3. Dropped undocumented "reset-names" from example

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Add "maintainers"
V3: Introduce changes described in commit body
    Fix schema syntax
    Move unevaluatedProperties to the bottom
    Rename file to match compatible more closely

I'm totally sorry for sending broken schema patch yesterday. Brainfart.
There is no excuse for sth that doesn't even pass dt_binding_check.
  DTEX    Documentation/devicetree/bindings/thermal/mediatek,thermal.example.dts
  DTC_CHK Documentation/devicetree/bindings/thermal/mediatek,thermal.example.dtb

 .../bindings/thermal/mediatek,thermal.yaml    | 99 +++++++++++++++++++
 .../bindings/thermal/mediatek-thermal.txt     | 52 ----------
 2 files changed, 99 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
new file mode 100644
index 000000000000..d96a2e32bd8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek thermal controller for on-SoC temperatures
+
+maintainers:
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+description:
+  This device does not have its own ADC, instead it directly controls the AUXADC
+  via AHB bus accesses. For this reason it needs phandles to the AUXADC. Also it
+  controls a mux in the apmixedsys register space via AHB bus accesses, so a
+  phandle to the APMIXEDSYS is also needed.
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt2701-thermal
+      - mediatek,mt2712-thermal
+      - mediatek,mt7622-thermal
+      - mediatek,mt7981-thermal
+      - mediatek,mt7986-thermal
+      - mediatek,mt8173-thermal
+      - mediatek,mt8183-thermal
+      - mediatek,mt8365-thermal
+      - mediatek,mt8516-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main clock needed for register access
+      - description: The AUXADC clock
+
+  clock-names:
+    items:
+      - const: therm
+      - const: auxadc
+
+  mediatek,auxadc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the AUXADC which the thermal controller uses
+
+  mediatek,apmixedsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: A phandle to the APMIXEDSYS controller
+
+  resets:
+    description: Reset controller controlling the thermal controller
+
+  nvmem-cells:
+    items:
+      - description:
+          NVMEM cell with EEPROMA phandle to the calibration data provided by an
+          NVMEM device. If unspecified default values shall be used.
+
+  nvmem-cell-names:
+    items:
+      - const: calibration-data
+
+required:
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - mediatek,auxadc
+  - mediatek,apmixedsys
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/reset/mt8173-resets.h>
+
+    thermal@1100b000 {
+        compatible = "mediatek,mt8173-thermal";
+        reg = <0x1100b000 0x1000>;
+        interrupts = <0 70 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&pericfg CLK_PERI_THERM>, <&pericfg CLK_PERI_AUXADC>;
+        clock-names = "therm", "auxadc";
+        resets = <&pericfg MT8173_PERI_THERM_SW_RST>;
+        mediatek,auxadc = <&auxadc>;
+        mediatek,apmixedsys = <&apmixedsys>;
+        nvmem-cells = <&thermal_calibration_data>;
+        nvmem-cell-names = "calibration-data";
+        #thermal-sensor-cells = <1>;
+    };
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
2.35.3


