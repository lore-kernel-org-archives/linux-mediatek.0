Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A59DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txqITLTtw7khoBKhwdl/1MGUTaKaH+U29hcDFhGcF7Q=; b=W1tO6/rzioyl/u
	BNvEwUK3Do7nR3EtXaOLzKt+QqHi0m9mcZ9CyeQQfz53+jxtMPrMBO+qPwbUbKWInFNP05f9c0+54
	x4V0rhdZISYbufY6QDCP3tWQYOGn/mUvnfaPYXUr6jyRxHwqJJ0XqmlpeODbwR6OLOtD+1q+h7UDA
	tboR1oPCEzqsgRJ0u1a6zZraZvd+tQsIKaLuY+DqwZq96ZH0j85gUe+XrNboYpGTagbkeaJndxvwK
	LH7Qrz50GSTBr0CwHdXwMZoEmdXjaBBOl8kM7Ce0QpcXKfImDVDhcdoLcglajMS6wRIzmzerq0/KC
	xw2cPwwFB7sIx6xRXMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i2I-0037Pt-B8; Mon, 13 Jun 2022 11:15:10 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i0O-0036PV-VH; Mon, 13 Jun 2022 11:13:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id k12-20020a17090a404c00b001eaabc1fe5dso2641401pjg.1;
        Mon, 13 Jun 2022 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fmQY6vSeK8Zc6KodLnbJm1/BoNk/JBGKEN17gVySBcE=;
        b=k+B4IXfSX+zP8uIUj7zzU5GPRDui0LJDVrFVnFwfb1Wcd0uK8cuKNQ9Vb9bRCa3gOT
         krfaM6pqot/3oykApmdkQxJ2RKzxmwc4f3Ohr+IY9mEbc4oB8KYjSEqqFWBiMoKx3quX
         jTrHc0DrMaD+R0BT09CPife77Kf56sL+/19MyJYgyLS3xA6iLGgntHGEwDcxqeu0OwDv
         9hKcWA0MzLcscIhnj4JXfMT2xB2Y4xMyywrfAsASmhF0iU+djVIXdpX++ZR3T8o5V+WU
         c2Ki4ISrswT741BeTI8vwoD0zcBjAKfyK8w3ONBZPZJ1aZkByjVARGgehvx8eNvHfyEu
         GtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmQY6vSeK8Zc6KodLnbJm1/BoNk/JBGKEN17gVySBcE=;
        b=QCwTkPiLVXoivlwsdj0AfMrCNaMJeJAGHs0DTlVNDE2qhbGLHKKf08Kyulr2kvmnOH
         4kEdMx7P0+qNYehSlMnzkYKBBRy50XKfXJivQnXiyU5/5ysmmFE/P7px8CBAJw/cntmW
         g+InjThuI802TlaxU49yvR5urFJN8+EzWMjzMxbXqaklWwE2x0WuwPZEmVlUroedFj9n
         ETYzCegFp0qwDYOIphN3Pg5z4Zdgqr6l6hlx4//o9qvfISwa9/ASjfuHpIgdnR7tRPJ0
         /erc/TTfwBMk2NIJKTDUHukFnp4JsWWPelLgntIRSEYqNUWL39WXlzBZ/fwLQ8JqW8m1
         +RPA==
X-Gm-Message-State: AOAM531haO9qw8/NvQQr/NeYcXCgJJJuGppihcOvrSQPZvvsZTcrlQYb
	Xjeshcow0dfwUf5WRs3PkO4=
X-Google-Smtp-Source: ABdhPJxO8aTvAB3mFtzrML3I5aFfT6DN4rqUVR7l4BTxvDEFKDzUYQXlzCUwmwKURsGmc4DPaPX0+A==
X-Received: by 2002:a17:902:d2ce:b0:167:7637:7025 with SMTP id n14-20020a170902d2ce00b0016776377025mr40909237plc.37.1655118791614;
        Mon, 13 Jun 2022 04:13:11 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net. [42.72.115.109])
        by smtp.gmail.com with ESMTPSA id g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 04:13:11 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	matthias.bgg@gmail.com,
	lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
Date: Mon, 13 Jun 2022 19:11:37 +0800
Message-Id: <20220613111146.25221-7-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_041313_078996_ED295CDE 
X-CRM114-Status: GOOD (  14.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
 .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
 2 files changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
new file mode 100644
index 000000000000..6c2639e81e50
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
@@ -0,0 +1,279 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 SubPMIC
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  MT6370 is a highly-integrated smart power management IC, which includes a
+  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-C &
+  Power Delivery (PD) controller, dual flash LED current sources, a RGB LED
+  driver, a backlight WLED driver, a display bias driver and a general LDO for
+  portable devices.
+
+properties:
+  compatible:
+    const: mediatek,mt6370
+
+  reg:
+    maxItems: 1
+
+  wakeup-source: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  adc:
+    type: object
+    description: |
+      Provides 9 channels for system monitoring, including vbusdiv5, vbusdiv2,
+      vbat, vsys, chg_vddp, ts_bat, ibus, ibat, and temp_jc.
+
+    properties:
+      compatible:
+        const: mediatek,mt6370-adc
+
+      "#io-channel-cells":
+        const: 1
+
+    required:
+      - compatible
+      - '#io-channel-cells'
+
+  backlight:
+    type: object
+    $ref: /schemas/leds/backlight/mediatek,mt6370-backlight.yaml#
+
+  charger:
+    type: object
+    $ref: /schemas/power/supply/mediatek,mt6370-charger.yaml#
+
+  tcpc:
+    type: object
+    $ref: /schemas/usb/mediatek,mt6370-tcpc.yaml#
+
+  indicator:
+    type: object
+    $ref: /schemas/leds/mediatek,mt6370-indicator.yaml#
+
+  flashlight:
+    type: object
+    $ref: /schemas/leds/mediatek,mt6370-flashlight.yaml#
+
+  regulators:
+    type: object
+    description: |
+      List all supported regulators, which support the control for DisplayBias
+      voltages and one general purpose LDO which commonly used to drive the
+      vibrator.
+
+    patternProperties:
+      "^(dsvbst|vibldo)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      "^(dsvpos|dsvneg)$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+        properties:
+          enable-gpio:
+            maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - regulators
+  - adc
+  - backlight
+  - indicator
+  - tcpc
+  - charger
+  - flashlight
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>
+    #include <dt-bindings/usb/pd.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+        pmic@34 {
+        compatible = "mediatek,mt6370";
+        reg = <0x34>;
+        wakeup-source;
+        interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        mt6370_adc: adc {
+          compatible = "mediatek,mt6370-adc";
+          #io-channel-cells = <1>;
+        };
+
+        backlight {
+          compatible = "mediatek,mt6370-backlight";
+          mediatek,bled-channel-use = /bits/ 8 <15>;
+        };
+
+        charger {
+          compatible = "mediatek,mt6370-charger";
+          interrupts = <48>, <68>, <6>;
+          interrupt-names = "attach_i", "uvp_d_evt", "mivr";
+          io-channels = <&mt6370_adc MT6370_CHAN_IBUS>;
+
+          mt6370_otg_vbus: usb-otg-vbus-regulator {
+            regulator-name = "mt6370-usb-otg-vbus";
+            regulator-min-microvolt = <4350000>;
+            regulator-max-microvolt = <5800000>;
+            regulator-min-microamp = <500000>;
+            regulator-max-microamp = <3000000>;
+          };
+        };
+
+        indicator {
+          compatible = "mediatek,mt6370-indicator";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          multi-led@0 {
+            reg = <0>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_RGB>;
+            led-max-microamp = <24000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            led@0 {
+              reg = <0>;
+              color = <LED_COLOR_ID_RED>;
+            };
+            led@1 {
+              reg = <1>;
+              color = <LED_COLOR_ID_GREEN>;
+            };
+            led@2 {
+              reg = <2>;
+              color = <LED_COLOR_ID_BLUE>;
+            };
+          };
+          led@3 {
+            reg = <3>;
+            function = LED_FUNCTION_INDICATOR;
+            color = <LED_COLOR_ID_WHITE>;
+            led-max-microamp = <6000>;
+          };
+        };
+
+        flashlight {
+          compatible = "mediatek,mt6370-flashlight";
+          #address-cells = <1>;
+          #size-cells = <0>;
+          led@0 {
+            reg = <0>;
+            led-sources = <0>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <1>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1248000>;
+          };
+          led@1 {
+            reg = <1>;
+            led-sources = <1>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <2>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1248000>;
+          };
+        };
+
+        tcpc {
+          compatible = "mediatek,mt6370-tcpc";
+          interrupts-extended = <&gpio26 4 IRQ_TYPE_LEVEL_LOW>;
+
+          connector {
+            compatible = "usb-c-connector";
+            label = "USB-C";
+            vbus-supply = <&mt6370_otg_vbus>;
+            data-role = "dual";
+            power-role = "dual";
+            try-power-role = "sink";
+            source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+            sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+            op-sink-microwatt = <10000000>;
+
+            ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                reg = <0>;
+                endpoint {
+                  remote-endpoint = <&usb_hs>;
+                };
+              };
+              port@1 {
+                reg = <1>;
+                endpoint {
+                  remote-endpoint = <&usb_ss>;
+                };
+              };
+              port@2 {
+                reg = <2>;
+                endpoint {
+                  remote-endpoint = <&dp_aux>;
+                };
+              };
+            };
+          };
+        };
+
+        regulators {
+          dsvbst {
+            regulator-name = "mt6370-dsv-vbst";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6200000>;
+          };
+          dsvpos {
+            regulator-name = "mt6370-dsv-vpos";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6000000>;
+            regulator-boot-on;
+          };
+          dsvneg {
+            regulator-name = "mt6370-dsv-vneg";
+            regulator-min-microvolt = <4000000>;
+            regulator-max-microvolt = <6000000>;
+            regulator-boot-on;
+          };
+          vibldo {
+            regulator-name = "mt6370-vib-ldo";
+            regulator-min-microvolt = <1600000>;
+            regulator-max-microvolt = <4000000>;
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h b/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
new file mode 100644
index 000000000000..6ee725547763
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_MEDIATEK_MT6370_ADC_H__
+#define __DT_BINDINGS_MEDIATEK_MT6370_ADC_H__
+
+/* ADC Channel Index */
+#define MT6370_CHAN_VBUSDIV5	0
+#define MT6370_CHAN_VBUSDIV2	1
+#define MT6370_CHAN_VSYS	2
+#define MT6370_CHAN_VBAT	3
+#define MT6370_CHAN_TS_BAT	4
+#define MT6370_CHAN_IBUS	5
+#define MT6370_CHAN_IBAT	6
+#define MT6370_CHAN_CHG_VDDP	7
+#define MT6370_CHAN_TEMP_JC	8
+#define MT6370_CHAN_MAX		9
+
+#endif
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
