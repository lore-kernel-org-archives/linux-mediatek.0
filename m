Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4FDC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uCo1AkWD2FgarCrXoedmAiqLbycN5G3SgzmeYSK7Dpg=; b=4oTlskLfFAZWnnyn/Xg0mYzTsI
	7XdKfYFS9ZLw5eVAhcB4pZstSxqJKWt7FZ46U1eXfrB+DrWhbbUGculrEf2svxjlTtnIeZpgPRCVy
	+90AJ5JDIJCwOOliRnlLR3GP8Fei3qEMA3t5X09GGFDRyy3XYQxR9vAs7ffzYE6XZbI2jSZm3qzTf
	gaj9PFHxVludHz2rXf0dbexluSN9lwZmv5LEh6XY9NCcw3Rcq8X07QQoX0++2acI5CE5+ZDPA0Yq7
	pp/foczvm9WFGx/g60V7YwV3pMDz7Bh30KaPYdSqnP9zGSQGnYz66nvAcEL5U43V1StRs7FIXZwLD
	/KOF3FSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyauc-0000XO-Tj; Fri, 25 Nov 2022 15:46:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZlq-00H4ne-C3
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 14:33:40 +0000
Received: by mail-lf1-x132.google.com with SMTP id g12so7192065lfh.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 06:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uCo1AkWD2FgarCrXoedmAiqLbycN5G3SgzmeYSK7Dpg=;
        b=a/b4t6mqId1FZXTFhl4/ax7IXwC4KMoBiYwDBaG4hEAaEj3DvhfNLxJxcO1aQ9SwJU
         aPmaVgbczdckQp+p5lKzgrpjtk3BFmpgfw3crNADB9wxbgtIn4p8jwcSTyaz1hDvD8Fn
         31UbcmABDzolszp2S1jCH+B2kNFVfz/ZI5NEvyLNTP8v40XPSt56SjWTfXBDqk+5ZyHn
         UmdTd3a380vjjtdIZ3Z92/4yXq+nWNgp58lzn0J3Vuucd0UclrtEYt8r2MQRI+KpyP+y
         Q03LywMGzMuqlSIZBCB+0KQN6/cBnrQ2FwO5LDK19hdS8SDl0dzm+xbbpS8StMeofjGR
         4Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCo1AkWD2FgarCrXoedmAiqLbycN5G3SgzmeYSK7Dpg=;
        b=YUTQZtfiN45jxq/OsNHPg7n+hO6yfMgOi/B3Zj7M/hI0T9RC1y3wqCcqwWjrPF1OTO
         WoJa/Q3BFXNMXtsrv0sCNi+EoiR7Ui7SNGI3znwiMLc6Caq8N6lqAs52Pii3pxUVfsC7
         5evLwaAfgVK19xBcEcHLN8JNlcJmua4j1pD+VIPX+gNs4OiBg3cXHDzDDKvspDuWetAo
         qkYrfr4RY2HopmokjAj9Eel37mhtW9sKY6Uk2CsFmhWea/l8GHQRBDpcSP3fEXHZLExA
         vZPepfTs5WJAIwOTCxZecpSrTVyRlujC1rHJ+1Ljk4iAyDjP1NG9oEFBzC5wWLtLhPOo
         svSw==
X-Gm-Message-State: ANoB5pmq3cwDkeeLkZlr6dPuxVNOA16wgF2cMQgi+OvDhSYn3O90pMd6
	ZgqusOAsYRve1jhxGMMyGY2d0g==
X-Google-Smtp-Source: AA0mqf6Rd9gAylZPO0BsMvX4isZrBhJUtCKjJEwTluwuo3wuSqJwydGCt/yxnzAAVFeHwEbVRikulg==
X-Received: by 2002:ac2:4189:0:b0:4b1:2447:6971 with SMTP id z9-20020ac24189000000b004b124476971mr8011706lfh.83.1669386814361;
        Fri, 25 Nov 2022 06:33:34 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b002798ab42fffsm312966ljn.129.2022.11.25.06.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:33:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrew Davis <afd@ti.com>,
	Gene Chen <gene_chen@richtek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	- NeilBrown <neilb@suse.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] dt-bindings: leds: use unevaluatedProperties for common.yaml
Date: Fri, 25 Nov 2022 15:33:28 +0100
Message-Id: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_063338_474920_1A4C415F 
X-CRM114-Status: GOOD (  12.28  )
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

The common.yaml schema allows further properties, so the bindings using
it should restrict it with unevaluatedProperties:false.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/issi,is31fl319x.yaml    |  1 +
 .../devicetree/bindings/leds/leds-aw2013.yaml        |  1 +
 .../devicetree/bindings/leds/leds-gpio.yaml          |  2 +-
 .../devicetree/bindings/leds/leds-lp50xx.yaml        |  8 ++++++++
 Documentation/devicetree/bindings/leds/leds-pwm.yaml |  2 +-
 .../devicetree/bindings/leds/leds-qcom-lpg.yaml      | 12 +++++++++++-
 .../devicetree/bindings/leds/leds-rt4505.yaml        |  1 +
 .../devicetree/bindings/leds/leds-sgm3140.yaml       |  1 +
 .../devicetree/bindings/leds/ti,tca6507.yaml         |  2 +-
 9 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 940333f2d69c..2929382625b6 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -57,6 +57,7 @@ patternProperties:
   "^led@[1-9]$":
     type: object
     $ref: common.yaml#
+    unevaluatedProperties: false
 
     properties:
       reg:
diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index e24b0d15ef01..6c3ea0f06cef 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -33,6 +33,7 @@ patternProperties:
   "^led@[0-2]$":
     type: object
     $ref: common.yaml#
+    unevaluatedProperties: false
 
     properties:
       reg:
diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
index 7ad2baeda0b0..7e11703acbd6 100644
--- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
@@ -23,8 +23,8 @@ patternProperties:
   # node name to at least catch some child nodes.
   "(^led-[0-9a-f]$|led)":
     type: object
-
     $ref: common.yaml#
+    unevaluatedProperties: false
 
     properties:
       gpios:
diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 63da380748bf..402c25424525 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -77,6 +77,14 @@ patternProperties:
       "^led@[0-9a-f]+$":
         type: object
         $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maxItems: 1
+
+        required:
+          - reg
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
index fe4d5fd25913..7de6da58be3c 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -20,8 +20,8 @@ properties:
 patternProperties:
   "^led(-[0-9a-f]+)?$":
     type: object
-
     $ref: common.yaml#
+    unevaluatedProperties: false
 
     properties:
       pwms:
diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 497db289169d..1df837798249 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -72,14 +72,24 @@ properties:
       "^led@[0-9a-f]$":
         type: object
         $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maxItems: 1
+
+        required:
+          - reg
 
 patternProperties:
   "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
+    unevaluatedProperties: false
 
     properties:
-      reg: true
+      reg:
+        maxItems: 1
 
     required:
       - reg
diff --git a/Documentation/devicetree/bindings/leds/leds-rt4505.yaml b/Documentation/devicetree/bindings/leds/leds-rt4505.yaml
index 5b0c74aa6723..cb71fec173c1 100644
--- a/Documentation/devicetree/bindings/leds/leds-rt4505.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-rt4505.yaml
@@ -27,6 +27,7 @@ properties:
   led:
     type: object
     $ref: common.yaml#
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
index f68259619488..56b2b2630108 100644
--- a/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-sgm3140.yaml
@@ -34,6 +34,7 @@ properties:
   led:
     type: object
     $ref: common.yaml#
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
index 32c600387895..9ce5c0f16e17 100644
--- a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
+++ b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
@@ -38,8 +38,8 @@ properties:
 patternProperties:
   "^led@[0-6]$":
     type: object
-
     $ref: common.yaml#
+    unevaluatedProperties: false
 
     properties:
       reg:
-- 
2.34.1


