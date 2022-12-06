Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6358C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1fZ+Nm1ZVezN1RXPdT9/whBqlUpozCto6FF44KKkJ4U=; b=Ol2U717JQKoZG2z/VtEn6YsWuI
	YdCXlTkMEuMn0j04sZoPtwMO7xZt7zOPZ5/hLvvtWw1qZJZbnOZo/OS8lQssMd+0yLaoILENx0P4V
	v4LCRnnUjggg7xq2Mear08ZGHwEO78ovXQSTQtfx+GhmbdAb1nDCPXvrPZCKwlX/oa4mn/53CNrsn
	hlJ2f+VTmMUAa4rkZULw9VhuJtyyQt9T5zWEAGnAVUR5f7t+zBoU3VxGn7EWqVeKOcAbEHs+Ww6ya
	CGpuulbb5LQbKGoHhtar81ggtqMLWDZNO0+bkc9VInVpvwPhTWvtdmOlRQMsHKvB0kR08Zg6QNa0A
	PEvBp7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2fKb-002lZI-B5; Tue, 06 Dec 2022 21:18:25 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2fKP-002lPh-Hn; Tue, 06 Dec 2022 21:18:15 +0000
Received: by mail-oi1-f180.google.com with SMTP id h132so18444260oif.2;
        Tue, 06 Dec 2022 13:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fZ+Nm1ZVezN1RXPdT9/whBqlUpozCto6FF44KKkJ4U=;
        b=mXvvS2gjLImUhfqd1NLcu4zXlO/YbgDuHIgfOPdq32sd57lDArLPkE+wMF1L/AfZ9s
         BfyTtq5qoDtfN/DFWy6mLbsqGnPa8BK3Snf2Doq+qJ3RKlMjF75MVvqHNgXSYR5MM+g8
         r/gK6t0svvYvlZjkS1MVsHK6wC0IYAVhqhN30CNGuU1aIm5bdWkW0SN446bcaBwHY1Po
         DpcFtMrhje82WCwd3MdToqkKixdcLuhsUgo24EEttQGga0dhqWyRhvwwr5QUYRq2DGHw
         gGPnIWUiLZ9nYskED4aFlERRpAEYCjY5v9NR9vUlYSrqEz5fJxRD2UhUGWH/Lv/mefBK
         pZiw==
X-Gm-Message-State: ANoB5pntcSwZs4SwRS2jY+uHIdmS26RQvvKwH/6bfj0WjVrM0DpBfbcv
	YYdVkSkpn7WUnW3x7b30Lw==
X-Google-Smtp-Source: AA0mqf7atIqgmcAEyNTqMz4+XRNR7PAGa4eH0oaBHkRZ2wsg8a4J/Infh7O0CnVxXkpR9sAsST1BwA==
X-Received: by 2002:a05:6808:655:b0:35a:2e4b:4c44 with SMTP id z21-20020a056808065500b0035a2e4b4c44mr36172114oih.263.1670361488907;
        Tue, 06 Dec 2022 13:18:08 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id ay19-20020a056808301300b00354b0850fb6sm8874803oib.33.2022.12.06.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 13:18:08 -0800 (PST)
Received: (nullmailer pid 94882 invoked by uid 1000);
	Tue, 06 Dec 2022 21:18:07 -0000
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Gene Chen <gene_chen@richtek.com>, Daniel Mack <zonque@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: [PATCH] dt-bindings: Add missing 'unevaluatedProperties' to regulator nodes
Date: Tue,  6 Dec 2022 15:15:55 -0600
Message-Id: <20221206211554.92005-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_131813_620679_8619904A 
X-CRM114-Status: GOOD (  12.15  )
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

Several regulator schemas are missing 'unevaluatedProperties' constraint
which means any extra properties are allowed. Upon adding the
constraint, there's numerous warnings from using the deprecated
'regulator-compatible' property. Remove the usage as examples shouldn't
be using long since deprecated properties.

Signed-off-by: Rob Herring <robh@kernel.org>
---
I'd suggest that Mark take this if that's okay with Lee. Or I can take 
it.

 Documentation/devicetree/bindings/mfd/max77650.yaml  |  2 --
 .../devicetree/bindings/mfd/mediatek,mt6360.yaml     |  9 ---------
 .../bindings/power/supply/mt6360_charger.yaml        |  2 +-
 .../bindings/regulator/max77650-regulator.yaml       |  1 +
 .../devicetree/bindings/regulator/max8660.yaml       |  6 +-----
 .../bindings/regulator/mt6360-regulator.yaml         | 12 +++---------
 6 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/max77650.yaml b/Documentation/devicetree/bindings/mfd/max77650.yaml
index b0a0f0d3d9d4..4181174fcf58 100644
--- a/Documentation/devicetree/bindings/mfd/max77650.yaml
+++ b/Documentation/devicetree/bindings/mfd/max77650.yaml
@@ -100,14 +100,12 @@ examples:
                 compatible = "maxim,max77650-regulator";
 
                 max77650_ldo: regulator-ldo {
-                    regulator-compatible = "ldo";
                     regulator-name = "max77650-ldo";
                     regulator-min-microvolt = <1350000>;
                     regulator-max-microvolt = <2937500>;
                 };
 
                 max77650_sbb0: regulator-sbb0 {
-                    regulator-compatible = "sbb0";
                     regulator-name = "max77650-sbb0";
                     regulator-min-microvolt = <800000>;
                     regulator-max-microvolt = <1587500>;
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
index 28eee02441ee..fb65abf30d57 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
@@ -83,7 +83,6 @@ examples:
                 richtek,vinovp-microvolt = <14500000>;
 
                 otg_vbus_regulator: usb-otg-vbus-regulator {
-                    regulator-compatible = "usb-otg-vbus";
                     regulator-name = "usb-otg-vbus";
                     regulator-min-microvolt = <4425000>;
                     regulator-max-microvolt = <5825000>;
@@ -145,7 +144,6 @@ examples:
                 compatible = "mediatek,mt6360-regulator";
                 LDO_VIN3-supply = <&BUCK2>;
                 buck1 {
-                    regulator-compatible = "BUCK1";
                     regulator-name = "mt6360,buck1";
                     regulator-min-microvolt = <300000>;
                     regulator-max-microvolt = <1300000>;
@@ -154,7 +152,6 @@ examples:
                          MT6360_OPMODE_ULP>;
                 };
                 BUCK2: buck2 {
-                    regulator-compatible = "BUCK2";
                     regulator-name = "mt6360,buck2";
                     regulator-min-microvolt = <300000>;
                     regulator-max-microvolt = <1300000>;
@@ -163,7 +160,6 @@ examples:
                          MT6360_OPMODE_ULP>;
                 };
                 ldo6 {
-                    regulator-compatible = "LDO6";
                     regulator-name = "mt6360,ldo6";
                     regulator-min-microvolt = <500000>;
                     regulator-max-microvolt = <2100000>;
@@ -171,7 +167,6 @@ examples:
                          MT6360_OPMODE_LP>;
                 };
                 ldo7 {
-                    regulator-compatible = "LDO7";
                     regulator-name = "mt6360,ldo7";
                     regulator-min-microvolt = <500000>;
                     regulator-max-microvolt = <2100000>;
@@ -179,7 +174,6 @@ examples:
                          MT6360_OPMODE_LP>;
                 };
                 ldo1 {
-                    regulator-compatible = "LDO1";
                     regulator-name = "mt6360,ldo1";
                     regulator-min-microvolt = <1200000>;
                     regulator-max-microvolt = <3600000>;
@@ -187,7 +181,6 @@ examples:
                          MT6360_OPMODE_LP>;
                 };
                 ldo2 {
-                    regulator-compatible = "LDO2";
                     regulator-name = "mt6360,ldo2";
                     regulator-min-microvolt = <1200000>;
                     regulator-max-microvolt = <3600000>;
@@ -195,7 +188,6 @@ examples:
                          MT6360_OPMODE_LP>;
                 };
                 ldo3 {
-                    regulator-compatible = "LDO3";
                     regulator-name = "mt6360,ldo3";
                     regulator-min-microvolt = <1200000>;
                     regulator-max-microvolt = <3600000>;
@@ -203,7 +195,6 @@ examples:
                          MT6360_OPMODE_LP>;
                 };
                 ldo5 {
-                    regulator-compatible = "LDO5";
                     regulator-name = "mt6360,ldo5";
                     regulator-min-microvolt = <2700000>;
                     regulator-max-microvolt = <3600000>;
diff --git a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
index b89b15a5bfa4..4c74cc78729e 100644
--- a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
+++ b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
@@ -26,6 +26,7 @@ properties:
     type: object
     description: OTG boost regulator.
     $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
 
 required:
   - compatible
@@ -39,7 +40,6 @@ examples:
       richtek,vinovp-microvolt = <14500000>;
 
       otg_vbus_regulator: usb-otg-vbus-regulator {
-        regulator-compatible = "usb-otg-vbus";
         regulator-name = "usb-otg-vbus";
         regulator-min-microvolt = <4425000>;
         regulator-max-microvolt = <5825000>;
diff --git a/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml b/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
index ce0a4021ae7f..01b9775a92d1 100644
--- a/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/max77650-regulator.yaml
@@ -26,6 +26,7 @@ properties:
 patternProperties:
   "^regulator-(ldo|sbb[0-2])$":
     $ref: "regulator.yaml#"
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/regulator/max8660.yaml b/Documentation/devicetree/bindings/regulator/max8660.yaml
index 4d550ca396eb..35792a927b03 100644
--- a/Documentation/devicetree/bindings/regulator/max8660.yaml
+++ b/Documentation/devicetree/bindings/regulator/max8660.yaml
@@ -26,6 +26,7 @@ properties:
     patternProperties:
       "^regulator-.+$":
         $ref: "regulator.yaml#"
+        unevaluatedProperties: false
 
     additionalProperties: false
 
@@ -43,31 +44,26 @@ examples:
 
         regulators {
           regulator-V3 {
-            regulator-compatible= "V3(DCDC)";
             regulator-min-microvolt = <725000>;
             regulator-max-microvolt = <1800000>;
           };
 
           regulator-V4 {
-            regulator-compatible= "V4(DCDC)";
             regulator-min-microvolt = <725000>;
             regulator-max-microvolt = <1800000>;
           };
 
           regulator-V5 {
-            regulator-compatible= "V5(LDO)";
             regulator-min-microvolt = <1700000>;
             regulator-max-microvolt = <2000000>;
           };
 
           regulator-V6 {
-            regulator-compatible= "V6(LDO)";
             regulator-min-microvolt = <1800000>;
             regulator-max-microvolt = <3300000>;
           };
 
           regulator-V7 {
-            regulator-compatible= "V7(LDO)";
             regulator-min-microvolt = <1800000>;
             regulator-max-microvolt = <3300000>;
           };
diff --git a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
index a462d99a25cc..8a0931dc2f30 100644
--- a/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml
@@ -27,9 +27,11 @@ properties:
 patternProperties:
   "^buck[12]$":
     $ref: "regulator.yaml#"
+    unevaluatedProperties: false
 
   "^ldo[123567]$":
     $ref: "regulator.yaml#"
+    unevaluatedProperties: false
 
 required:
   - compatible
@@ -44,7 +46,6 @@ examples:
       compatible = "mediatek,mt6360-regulator";
       LDO_VIN3-supply = <&BUCK2>;
       buck1 {
-        regulator-compatible = "BUCK1";
         regulator-name = "mt6360,buck1";
         regulator-min-microvolt = <300000>;
         regulator-max-microvolt = <1300000>;
@@ -53,7 +54,6 @@ examples:
              MT6360_OPMODE_ULP>;
       };
       BUCK2: buck2 {
-        regulator-compatible = "BUCK2";
         regulator-name = "mt6360,buck2";
         regulator-min-microvolt = <300000>;
         regulator-max-microvolt = <1300000>;
@@ -62,7 +62,6 @@ examples:
              MT6360_OPMODE_ULP>;
       };
       ldo6 {
-        regulator-compatible = "LDO6";
         regulator-name = "mt6360,ldo6";
         regulator-min-microvolt = <500000>;
         regulator-max-microvolt = <2100000>;
@@ -70,7 +69,6 @@ examples:
              MT6360_OPMODE_LP>;
       };
       ldo7 {
-        regulator-compatible = "LDO7";
         regulator-name = "mt6360,ldo7";
         regulator-min-microvolt = <500000>;
         regulator-max-microvolt = <2100000>;
@@ -78,15 +76,13 @@ examples:
              MT6360_OPMODE_LP>;
       };
       ldo1 {
-        regulator-compatible = "LDO1";
         regulator-name = "mt6360,ldo1";
         regulator-min-microvolt = <1200000>;
         regulator-max-microvolt = <3600000>;
         regulator-allowed-modes = <MT6360_OPMODE_NORMAL
              MT6360_OPMODE_LP>;
       };
-        ldo2 {
-        regulator-compatible = "LDO2";
+      ldo2 {
         regulator-name = "mt6360,ldo2";
         regulator-min-microvolt = <1200000>;
         regulator-max-microvolt = <3600000>;
@@ -94,7 +90,6 @@ examples:
              MT6360_OPMODE_LP>;
       };
       ldo3 {
-        regulator-compatible = "LDO3";
         regulator-name = "mt6360,ldo3";
         regulator-min-microvolt = <1200000>;
         regulator-max-microvolt = <3600000>;
@@ -102,7 +97,6 @@ examples:
              MT6360_OPMODE_LP>;
       };
       ldo5 {
-        regulator-compatible = "LDO5";
         regulator-name = "mt6360,ldo5";
         regulator-min-microvolt = <2700000>;
         regulator-max-microvolt = <3600000>;
-- 
2.35.1


