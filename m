Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E2C5ACB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vTrltGVBCvBoexMeOs/zFwHzylci7LZMUjyCRLBI0xs=; b=hpO6goJ/rVxV3xCKsKPDsRUOuz
	mNlHp1tGSxxOqSIKyHWRyeIhb2v05QFUcV9NuQS5eAojlNVvEFpKcXZE+AYct8ApKMsUBNihwGVp7
	oKKDvt+xzb0o3Ttp+NAktnmGmbvnVhtWmrtGmEzUYQg41pcJB+F1Xm53+/rjILizzNkgzfRnlsgI5
	oJuRMw8MGXuYtF9di0i/2EWJChgbVSkLtQG1Q0UkUzNroF15Ub0VXkq5sI+fIjrg2rz34XDzTujpD
	A0Jj0C3bTy6i5JNv9UWhotRb9ysmtZXhBCyQ2O8uDI9o12Ko7JkdxgpPF5zwFsfIGWtWyHo0kPO93
	idHfzEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3b4z-003Qxs-09;
	Thu, 16 Nov 2023 12:02:41 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3b4u-003Qwn-2f;
	Thu, 16 Nov 2023 12:02:38 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9dd3f4a0f5aso102453766b.1;
        Thu, 16 Nov 2023 04:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700136154; x=1700740954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vTrltGVBCvBoexMeOs/zFwHzylci7LZMUjyCRLBI0xs=;
        b=BbtgKGbjbuOnLyFrAOv1qww5mRVujg7E7ZU6enxM987hIp20XhCqQVLTZwYBkwUV0f
         HzLUVWxSjTBPioaCnMpi5YVXJ0a+20W3sxr3DAagmVv6sgDjI5PHzYY1jTZzUOIfuJQN
         j7S23tm7ZSuvIfO7tj2tBCwjMlQ9Wc3BtNdNy3z5kMufTayFNwZ47tMWcwtZieczZD/9
         KVRhheqxdZ2YisFbh/RN241T1Nxw6MOYpM/rzSpZl0qVWnAvS6bM0iHWo/PDdGl19hXJ
         54yQnmLNlKMUCZsuyTj8YwIP7dsexw7OodPZzwjNwAbPbLMMLRWyNgn2LhTdQ06IJkh4
         KgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136154; x=1700740954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTrltGVBCvBoexMeOs/zFwHzylci7LZMUjyCRLBI0xs=;
        b=AsN2fPH8KHXGGHnZqkiME26DR/Wj6bqEbQh1ild6LY20ugljwahx2zXVJ047Xjm3lK
         1/w4fGsr+xcD84ooyZuln+90+ozTXxdYfWB/0EzYnlV5fOIRmuvnShqykBM0HJgTRKJi
         DtCDPtimC471+gOpfCOHmmVXtwOjWewOT6Ecb1Qe43T44M5p7L3JpzRO7Wo3Dq76KIzE
         OzzqiFX+8uc0CCuPxe68mrGVI0wiphOS28Pye21F/2bBuK0Nx5PKaQs6Q8NfU7Rg9J+y
         IWVxx38RB5B6oHkap8MPE0waunjsnQcE1M7Xu1NsfriuovhBT5la2Emkr+b8eEzcMNsk
         SHLA==
X-Gm-Message-State: AOJu0YxZTq/Iqrqdacv+SNXBwJjqqaY+fxenkLossjED78UUOHpuF1MI
	13xVg7spdBF0nc7ZR64Fu/9YYQK5xio=
X-Google-Smtp-Source: AGHT+IE+l1WxERw88wPP4jgQbj0W+HTBU6BoowIoSnFHFejeJjqWxu2+n49WhcpSktk8OPVh8CX1uw==
X-Received: by 2002:a17:906:fa9b:b0:9e1:e1f5:2bb9 with SMTP id lt27-20020a170906fa9b00b009e1e1f52bb9mr11833141ejb.30.1700136154241;
        Thu, 16 Nov 2023 04:02:34 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id h5-20020a170906718500b009ddf38056f8sm8320317ejk.118.2023.11.16.04.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 04:02:33 -0800 (PST)
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
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: thermal: convert Mediatek Thermal to the json-schema
Date: Thu, 16 Nov 2023 13:02:25 +0100
Message-Id: <20231116120225.29999-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_040236_872659_4A35C314 
X-CRM114-Status: GOOD (  20.04  )
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

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/thermal/mediatek-thermal.txt     | 52 ----------
 .../bindings/thermal/mediatek-thermal.yaml    | 98 +++++++++++++++++++
 2 files changed, 98 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal.yaml

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
diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal.yaml
new file mode 100644
index 000000000000..0e036b22b82b
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Thermal
+
+description: >
+  This describes the device tree binding for the Mediatek thermal controller
+  which measures the on-SoC temperatures. This device does not have its own ADC,
+  instead it directly controls the AUXADC via AHB bus accesses. For this reason
+  this device needs phandles to the AUXADC. Also it controls a mux in the
+  apmixedsys register space via AHB bus accesses, so a phandle to the APMIXEDSYS
+  is also needed.
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
+  resets: Reference to the reset controller controlling the thermal controller.
+
+  nvmem-cells:
+    items:
+      - description: >
+          NVMEM cell with EEPROMA phandle to the calibration data provided by an
+          NVMEM device. If unspecified default values shall be used.
+
+  nvmem-cell-names:
+    items:
+      - const: calibration-data
+
+unevaluatedProperties: false
+
+required:
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - mediatek,auxadc
+  - mediatek,apmixedsys
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
+        reset-names = "therm";
+        mediatek,auxadc = <&auxadc>;
+        mediatek,apmixedsys = <&apmixedsys>;
+        nvmem-cells = <&thermal_calibration_data>;
+        nvmem-cell-names = "calibration-data";
+        #thermal-sensor-cells = <1>;
+    };
-- 
2.35.3


