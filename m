Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E2CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 08:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4/r48PhUKjK1pLozfcby+bAKVPiU6wfWJflRL5QgQE=; b=SbEvvoqZsL3xGM
	svrecinHZBPl+J6qFmWWwmt2flyvIWY477dmk5YEdGrXGxdQ9E49tk7XWzJ5g/2gykJgqBJKFyba8
	xXJ26fraB8WwwHm/5PsKSNnd+JQiJUWpGT2msbVr0JusjSZ03kTL8frlBFwY6yBvy4QMaXsuhTC/W
	bhSUeogPK0K8VqVnAsOdYS4QE4NPqd+xloSfs+RoHmw5Jq0WjzWx5Nax1s6tZJzzNe479xscbn0Pw
	ci3ndKj8et6fy/7pOlP2KaO7u8vkDcbUBEGo31/MYAUSyiFEDz2d/0fGqceoFJnIo/05bXsQtS293
	7MJtiTbrctnEHAYQiSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcfd-000Tk7-OP; Wed, 27 Apr 2022 08:05:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcf1-000TTU-Ey; Wed, 27 Apr 2022 08:04:34 +0000
Received: by mail-pf1-x433.google.com with SMTP id z16so954988pfh.3;
 Wed, 27 Apr 2022 01:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OOkWlT5TtgSr3f5WTjCqUYVthsAQ04wJKZJ02py4e7s=;
 b=GJdQ8dVzSoTnnqJXvNPDDfKYf1IkcuQx2fkKljfGAaWhVmlEf3wM4Pqxm4j+EvYTzQ
 U0nv2tcjNDhwLrb6rIrm5RadlxTvhZkp+FkiZGEowo9WwlFVJzErSC2POBnUGS7V1ovs
 3tOs16OpYc30wXrq943yJtggObGFkL5xUb9ss00aquYt04lhCnOfhsWuw9XWCxhs3A3R
 hR6JtkzVHEdNcBPf1bb0A8Fze5gr+D3uOBHEoQsCzqvkdC3caFC7eI+KsbryNrfKNbRN
 k8p7kI/2AWTSO9oKqg1h2jLtqDLKUArshZTkt8luaJR6cLWp+thq+QGSyzeiUGcNpdGJ
 EuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOkWlT5TtgSr3f5WTjCqUYVthsAQ04wJKZJ02py4e7s=;
 b=JbWXcjhUaF4uuPXLBvaWoZf9Co6CjNIPG51DzQrpjIvPauYcDMmp+wUJRFhEZYtoSj
 2HbVg5mt8gYLUyA4Fua8PN9DZ0++C5Z1nh1dIHOhMTUlVvNLiUB4FOzPaNNScARaMdGv
 xpen6IHXUezk0BPtr/Lkn6fMu2uCoqEOuAg8yekD80Qyp4nCktNi0WD95LB//3YtDi47
 AEkHNwEy0ZZywu4vxmTkSCsjkwbjhYOEY8WbafTS3vI2TIjKZtVC7bqZ9qLadamzd5n7
 j9skIAc8qSUdbQ6CI+x4U1vzSKshxy6A1TmsbSIjbkzgcflTXXpLHjn/iGmSFxgWT0qG
 wWzQ==
X-Gm-Message-State: AOAM531d0MryRrDQY7PHT4jlh9+KCeF9OzisJi2E+umYIq4IGH14A7Q5
 FSsRWAgdekeFFun/BIJbbffHpjVvM5enMnla
X-Google-Smtp-Source: ABdhPJzihmyoo54arIgiz4u7SYLof9thbDPOiEhHsmeweCBIJiuI9zUmUX5kiDY/tyF8hghBIfv/0w==
X-Received: by 2002:a63:6cc5:0:b0:3ab:7a48:af2b with SMTP id
 h188-20020a636cc5000000b003ab7a48af2bmr8619907pgc.302.1651046670336; 
 Wed, 27 Apr 2022 01:04:30 -0700 (PDT)
Received: from genechen-System-Product-Name.richtek.com
 ([2402:7500:469:f77c:f4fa:b753:7807:4e40])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a17090a70cb00b001cd4989ff50sm1746750pjm.23.2022.04.27.01.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 01:04:30 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, cy_huang@richtek.com
Subject: [PATCH 2/2] dt-bindings: mfd: Add bindings for the Mediatek MT6360
Date: Wed, 27 Apr 2022 16:03:30 +0800
Message-Id: <20220427080330.40136-3-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
References: <20220427080330.40136-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_010431_549062_66682342 
X-CRM114-Status: GOOD (  14.30  )
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

From: Gene Chen <gene_chen@richtek.com>

Add bindings for the Mediatek MT6360

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/mfd/mt6360.yaml       | 258 ++++++++++++++++++
 1 file changed, 258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mt6360.yaml b/Documentation/devicetree/bindings/mfd/mt6360.yaml
new file mode 100644
index 000000000000..2c0c5df16b00
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mt6360.yaml
@@ -0,0 +1,258 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mt6360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6360 PMIC from MediaTek Integrated IC
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  MT6360 is a PMIC device with the following sub modules.
+  It is interfaced to host controller using I2C interface.
+
+  This document describes the binding for PMIC device and its sub module.
+
+properties:
+  compatible:
+    const: mediatek,mt6360
+
+  reg:
+    description: I2C device address.
+    maxItems: 1
+
+  wakeup-source: true
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    enum:
+      - IRQB
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description:
+      The first cell is the IRQ number.
+
+  regulators:
+    $ref: ../regulator/mt6360-regulator.yaml
+
+  charger:
+    $ref: ../power/supply/mt6360_charger.yaml
+
+  tcpc:
+    $ref: ../usb/mediatek,mt6360-tcpc.yaml
+
+  led-controller:
+    $ref: ../leds/leds-mt6360.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/usb/pd.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mt6360@34 {
+        compatible = "mediatek,mt6360";
+        reg = <0x34>;
+        wakeup-source;
+        interrupts-extended = <&gpio26 0 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-names = "IRQB";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        mt6360_charger: charger {
+          compatible = "mediatek,mt6360-chg";
+          richtek,vinovp-microvolt = <14500000>;
+
+          otg_vbus_regulator: usb-otg-vbus-regulator {
+            regulator-compatible = "usb-otg-vbus";
+            regulator-name = "usb-otg-vbus";
+            regulator-min-microvolt = <4425000>;
+            regulator-max-microvolt = <5825000>;
+          };
+        };
+
+        led-controller {
+          compatible = "mediatek,mt6360-led";
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
+            led-max-microamp = <150000>;
+          };
+          led@4 {
+            reg = <4>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <1>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1024000>;
+          };
+          led@5 {
+            reg = <5>;
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            function-enumerator = <2>;
+            led-max-microamp = <200000>;
+            flash-max-microamp = <500000>;
+            flash-max-timeout-us = <1024000>;
+          };
+        };
+
+        regulators {
+          compatible = "mediatek,mt6360-regulator";
+          LDO_VIN3-supply = <&BUCK2>;
+          buck1 {
+            regulator-compatible = "BUCK1";
+            regulator-name = "mt6360,buck1";
+            regulator-min-microvolt = <300000>;
+            regulator-max-microvolt = <1300000>;
+            regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                 MT6360_OPMODE_LP
+                 MT6360_OPMODE_ULP>;
+          };
+          BUCK2: buck2 {
+            regulator-compatible = "BUCK2";
+            regulator-name = "mt6360,buck2";
+            regulator-min-microvolt = <300000>;
+            regulator-max-microvolt = <1300000>;
+            regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                 MT6360_OPMODE_LP
+                 MT6360_OPMODE_ULP>;
+          };
+          ldo6 {
+            regulator-compatible = "LDO6";
+            regulator-name = "mt6360,ldo6";
+            regulator-min-microvolt = <500000>;
+            regulator-max-microvolt = <2100000>;
+            regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                 MT6360_OPMODE_LP>;
+          };
+          ldo7 {
+            regulator-compatible = "LDO7";
+            regulator-name = "mt6360,ldo7";
+            regulator-min-microvolt = <500000>;
+            regulator-max-microvolt = <2100000>;
+            regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                 MT6360_OPMODE_LP>;
+          };
+          ldo1 {
+            regulator-compatible = "LDO1";
+            regulator-name = "mt6360,ldo1";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                 MT6360_OPMODE_LP>;
+          };
+            ldo2 {
+            regulator-compatible = "LDO2";
+            regulator-name = "mt6360,ldo2";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                 MT6360_OPMODE_LP>;
+          };
+          ldo3 {
+            regulator-compatible = "LDO3";
+            regulator-name = "mt6360,ldo3";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                 MT6360_OPMODE_LP>;
+          };
+          ldo5 {
+            regulator-compatible = "LDO5";
+            regulator-name = "mt6360,ldo5";
+            regulator-min-microvolt = <2700000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                 MT6360_OPMODE_LP>;
+          };
+        };
+
+        tcpc {
+          compatible = "mediatek,mt6360-tcpc";
+          interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
+          interrupt-names = "PD_IRQB";
+
+          connector {
+            compatible = "usb-c-connector";
+            label = "USB-C";
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
+      };
+    };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
