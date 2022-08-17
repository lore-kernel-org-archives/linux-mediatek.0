Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA229C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 08:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWXG1e9/DRSLvY5QEUtPtlLQfPC+KRrU45gKoV7pXAc=; b=eEq3XG/3aMpiZJ97dcdF3z9FnM
	Rwhd6s5/e8mIJ3B3wcLdisc5GtnArTeIjg8OmDoTcgOcOPwceMM+oMcNE+ogi/ZOPLlN2HRe33WnS
	G1vV/iUiI7rJdkKu6G4fJyJKMESuMCIN4kLuW8p6DcWt80iHaUJDcefhV2RoPAzdTOfi5cGuLqQb2
	XW86bWwhe1y92BcExNzYy6VbnIzCFcHKjplmesM6ixFO+DwZe7LohoSZ+MYIOJAczUOuZR6slVCeG
	yiN+lMnDy9ZTI3kT/Kz05zqEFqsc+rs6q7XM464aTOqAkSJNHtEiJbD5b7n+ZkR9hFiRuu5Wd6stq
	xdJigp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOE8I-00EcME-Fc; Wed, 17 Aug 2022 08:10:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOE6T-00EZBF-DI
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 08:08:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id r16so6078375wrm.6
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 01:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VWXG1e9/DRSLvY5QEUtPtlLQfPC+KRrU45gKoV7pXAc=;
        b=NmM9L1PaffPpCsm/C4/QFhphpWYhLPEMeeIXMsHVx+Gx6cwHyUbPB+W5EQHS5EJ82y
         X/wINA6ev0mpTwDayZwDE6yvvRlTgM1lbaWx8aHtMnHbFEKSMDWQ0ReaD4GMoRNh4naT
         3WNlCO7ZqEOehjoUs2RHdyj/jHRF/5wCPuOum7W8n+mwDwGQTsAYo/4WyPgBN1DlHohP
         JPqcaJ+/Gt3ntySPDCiXHkJiMCsSwaoblu88SOG4VmJn4Kgr/ZXn0XOoMCS3p60ogBnl
         D5LL0QVWUWn/cKMzPW/Oj+PqUtsyrgBgf/fqpBOSX783sp9tUInUxHELxusOUgt7etgL
         BoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VWXG1e9/DRSLvY5QEUtPtlLQfPC+KRrU45gKoV7pXAc=;
        b=I7gvEDm9xk0SXwIACripBCIeV9D6NS9Vgss4hnpkNIrWCpNsKzqbH0fTLz8qqJnPMH
         j9Qp+86mrASf2Nl4TdwEuzGB1pk7doMudGXa0PS/oeNT5Aagx8HLH98dL0KIelChFkcv
         3ykOq05CtrTKEDfLgmGVUVqqfQr7gtX5NB2mIfTh+uCRrGy8rSZ1dnogltr+kquEP+51
         oJ5UDL3MOVPpwKijaILmvB29emvNOB2S2TAMVWhM/Ge9Hp1ErYxJSCq4HqfsIALIN+g8
         JAx9FT5A/VrQ4Lw0mS45K+cvLXVVDHQ1zS8nMkQYyBXjaVdPRlkarB/Nl/w+83KFpiE6
         p+Pw==
X-Gm-Message-State: ACgBeo1U+tbD6yyqI75VcDe92B1ycLOh+x5Oxi4rihMBteD2AB8BN3Ix
	bV4zKQCsKTcXi/nJXH6QCFwg2Q==
X-Google-Smtp-Source: AA6agR7KY4TOelp2cDbEEwT9aNbQBHNA36aSrdAhKK+734vr4aWgVXADl++KkjH3cOTyGim9KWp26Q==
X-Received: by 2002:adf:e44b:0:b0:220:5bc5:e942 with SMTP id t11-20020adfe44b000000b002205bc5e942mr13366911wrm.179.1660723717790;
        Wed, 17 Aug 2022 01:08:37 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b003a54d610e5fsm1391992wmq.26.2022.08.17.01.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 01:08:37 -0700 (PDT)
From: bchihi@baylibre.com
To: rafael@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	amitk@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	mka@chromium.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	fan.chen@mediatek.com,
	louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com,
	abailon@baylibre.com
Subject: [PATCH v9,2/7] dt-bindings: thermal: Add dt-binding document for LVTS thermal controllers
Date: Wed, 17 Aug 2022 10:07:52 +0200
Message-Id: <20220817080757.352021-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817080757.352021-1-bchihi@baylibre.com>
References: <20220817080757.352021-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_010841_503775_C048E694 
X-CRM114-Status: GOOD (  11.78  )
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

From: Alexandre Bailon <abailon@baylibre.com>

Add dt-binding document for mt8192 and mt8195 LVTS thermal controllers.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 .../thermal/mediatek,lvts-thermal.yaml        | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
new file mode 100644
index 000000000000..31d9e220513a
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoC LVTS thermal controller
+
+maintainers:
+  - Yu-Chia Chang <ethan.chang@mediatek.com>
+  - Ben Tseng <ben.tseng@mediatek.com>
+
+description: |
+  LVTS (Low Voltage Thermal Sensor).
+  The architecture will be first used on mt8192 and mt8195.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8192-lvts-ap
+      - mediatek,mt8192-lvts-mcu
+      - mediatek,mt8195-lvts-ap
+      - mediatek,mt8195-lvts-mcu
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+    description: LVTS instance registers.
+
+  interrupts:
+    maxItems: 1
+    description: LVTS instance interrupts.
+
+  clocks:
+    maxItems: 1
+    description: LVTS instance clock.
+
+  resets:
+    maxItems: 1
+    description: |
+      LVTS instance SW reset for HW AP/MCU domain to clean temporary data
+      on HW initialization/resume.
+
+  nvmem-cells:
+    minItems: 1
+    maxItems: 2
+    description: Calibration efuse data for LVTS
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 2
+    description: Calibration efuse cell names for LVTS
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
+          items:
+            - description: Calibration efuse data for LVTS
+
+        nvmem-cell-names:
+          items:
+            - const: lvts_calib_data1
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
+          items:
+            - description: Calibration efuse data 1 for LVTS
+            - description: Calibration efuse data 2 for LVTS
+
+        nvmem-cell-names:
+          items:
+            - const: lvts_calib_data1
+            - const: lvts_calib_data2
+
+required:
+  - compatible
+  - '#thermal-sensor-cells'
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/reset/mt8192-resets.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      lvts_ap: thermal-sensor@1100b000 {
+        compatible = "mediatek,mt8192-lvts-ap";
+        #thermal-sensor-cells = <1>;
+        reg = <0 0x1100b000 0 0x1000>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&infracfg CLK_INFRA_THERM>;
+        resets = <&infracfg MT8192_INFRA_RST0_THERM_CTRL_SWRST>;
+        nvmem-cells = <&lvts_e_data1>;
+        nvmem-cell-names = "lvts_calib_data1";
+      };
+
+      lvts_mcu: thermal-sensor@11278000 {
+        compatible = "mediatek,mt8192-lvts-mcu";
+        #thermal-sensor-cells = <1>;
+        reg = <0 0x11278000 0 0x1000>;
+        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&infracfg CLK_INFRA_THERM>;
+        resets = <&infracfg MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+        nvmem-cells = <&lvts_e_data1>;
+        nvmem-cell-names = "lvts_calib_data1";
+      };
+    };
+
+    thermal_zones: thermal-zones {
+      cpu0-thermal {
+        polling-delay = <0>;
+        polling-delay-passive = <0>;
+        thermal-sensors = <&lvts_mcu 0>;
+      };
+
+      vpu1-thermal {
+        polling-delay = <0>;
+        polling-delay-passive = <0>;
+        thermal-sensors = <&lvts_ap 0>;
+      };
+    };
-- 
2.34.1


