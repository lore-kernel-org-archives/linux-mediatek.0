Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC47C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DVFujHXapu+i0fOkXdAKfBY3LACf1n9FdJL68+qiIzE=; b=s1JRAjhEzLKxJw
	AiR8sWherNCpq1UHlBqDJJQX4c1plOm2nH9HMIy70SHB0eXUrd7l5lv5nb1NU7DtptZtX1wQoy3wB
	izqVaEs2DOUj6+HCpSeokUy2S3TPBP/tw/06ICmhgJZ8kYCJBycxTU852QfCXwkVFoTxd6jFLp8lj
	dUSD6baIOMFGLwoS9QmItyMCNIfjcbhbYKTHWKDlfZb2kzvg9DRV/YcP/BJTKxUSdCWOAQi381RCi
	Dbl0ZpfBStg/R6HiGuWSZL7zIRPaMNlgJjMbA0+bFlfT28/eGw7RWOUdDI6pSL8Bgmkr/BCbEw9Wm
	Ds2LOc1u6MviV6iQrKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlm2I-003z3S-Ss; Tue, 03 May 2022 06:29:26 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlm26-003yyh-FH; Tue, 03 May 2022 06:29:16 +0000
Received: by mail-pf1-x433.google.com with SMTP id p8so13989273pfh.8;
 Mon, 02 May 2022 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ommot/0z42sf3SBGFHfrVoBq7JJGjmk6km0fRERgWs=;
 b=BBZqsvfXLQMcxnvVKu19OiXFrM/hVM4VZ+TB4sAzS++ZfbcsGgC3gaIgYi3V/CxVyI
 hTagtqcDHop40+tn6XHh1FfNWGj1H2zX197W8q7SH3W2UjSFujx/4tRPHDTBTJonNB59
 1acUkA2RmNGSJP1O2DsYwghR/BvCSDcHfrbhet3gqQjaohsHzguix3TUsxF8g5UuVNDN
 42cX0PSkBmTTHScDbzKPD4gcE3amRx4DyJ4OrQdKRsblQHnC4eplMz5oadgNU2TWSllT
 Pp8ervTrj4BAOPhqAW0uVhaHRyGYWeIwN+OPWaAZNksm0dutDNUEiCZKv8LtEObohI0k
 fxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ommot/0z42sf3SBGFHfrVoBq7JJGjmk6km0fRERgWs=;
 b=UHcUOSkfcpQWj0wu7+wQ+Z8bC91noVIaQeay8JPuzBBk3/0gSPWloHMVAdHFjzGq1N
 XJ2SkQXvRn/KNOm7a8yEnLUKbP73y3TMTX4m05vw/XlOg51kK/WIRi0sjE5YP4ErJ7ro
 j4c+FqSqscV6JuFF+pA1AiZeuEH2PPexmFtwKwdP6kYHB20q28qK3OQOOp7OEM0tzDhr
 EbSZfc1+IvzBT62yRcd1ZIZs6bfzdOsL829CjUpYn+9wc7FPJRlBG0rEyprxXnp1b/YL
 tVUNpAokY18TEujFByh4uhiPBGU8sZrU8hg65A9CcMtoOFoEzxVXqGxS8JXJKjvdzCRH
 wVTg==
X-Gm-Message-State: AOAM531F+rISpJ1cqBXB6Ar/yIy2ec8Gp1U7L/WgP7P8mi/K7Oy0hU1J
 02+ijPy4gnk8AMyi9CVjYBkYvmiWzFKJ3Q==
X-Google-Smtp-Source: ABdhPJwVmWB/+4ZbUnTbaekuYC8MZ5UU5EvCLiYkYU2agpKq050H3bedHlbNmKr5ciuIuhR85HqFzw==
X-Received: by 2002:a63:87c1:0:b0:3ab:1a17:35b7 with SMTP id
 i184-20020a6387c1000000b003ab1a1735b7mr12716214pge.313.1651559350797; 
 Mon, 02 May 2022 23:29:10 -0700 (PDT)
Received: from genechen-System-Product-Name.richtek.com
 ([2402:7500:469:f77c:e84b:f663:23:a6cf])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a63fc0e000000b003c260491adesm1313800pgi.82.2022.05.02.23.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 23:29:10 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, cy_huang@richtek.com
Subject: [PATCH] dt-bindings: mfd: Add bindings child nodes for the Mediatek
 MT6360
Date: Tue,  3 May 2022 14:28:43 +0800
Message-Id: <20220503062843.12516-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_232914_599625_117F97BA 
X-CRM114-Status: GOOD (  10.30  )
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

Add bindings child nodes for the Mediatek MT6360

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Link: https://lore.kernel.org/all/YmqTzlrVL5KaVPuz@robh.at.kernel.org/
---
 .../bindings/mfd/mediatek,mt6360.yaml         | 212 +++++++++++++++++-
 1 file changed, 201 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
index 4d8769f3748c..b3eecf661bc1 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
@@ -37,6 +37,18 @@ properties:
     description:
       The first cell is the IRQ number.
 
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
 required:
   - compatible
   - reg
@@ -51,17 +63,195 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/usb/pd.h>
     i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        pmic@34 {
-            compatible = "mediatek,mt6360";
-            reg = <0x34>;
-            wakeup-source;
-            interrupts-extended = <&gpio26 0 IRQ_TYPE_LEVEL_LOW>;
-            interrupt-names = "IRQB";
-            interrupt-controller;
-            #interrupt-cells = <1>;
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
         };
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
     };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
