Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A46C46467
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCo1AkWD2FgarCrXoedmAiqLbycN5G3SgzmeYSK7Dpg=; b=VMwoU9I00+/OCZihm/ANYUd7ox
	/OBrhW1NirhBGOoDjNAH4xAb65pimucNMPKf3E3frM73fKyLgVh25zBzXG8r/km6ohLO+i15TtQ8t
	JR3arWorQGBwdd5iDQzYRMFib0gladhfsQ6AEC9jrQylu7Yx1a6+DwsVoAXjjK2FwDUSGLjeXOOug
	Ji2FnjWvhZPY4jGU//y08jbfEy62nWJygXazHFyiWQY1AMM9XPwRqWbJYVom0q2A8vCBIc88HMMsF
	s10AOs1AFN2K05y4nODRDs7zAW/Z6xifuinhe6E7/V0zCEKDgITcxne0ZrR+3mdkIJB32gjmdBKwt
	+BlimPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozPSn-00Dnwe-0z; Sun, 27 Nov 2022 21:45:25 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOSX-00DXzX-2b
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:41:11 +0000
Received: by mail-lj1-x236.google.com with SMTP id d3so11063918ljl.1
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCo1AkWD2FgarCrXoedmAiqLbycN5G3SgzmeYSK7Dpg=;
        b=nwaxkdhZ4DN5k/R6IH8bbOjgnMj10tWrlkVFBqcaSVRKYpbEfnesnq1liiCvq49Mw6
         /hSn6dqMJltJFY/LZfYbuwDcJ6XED9WHbKw/GSs73o8GGSa74CmFyy8BiEcfS1oLlZFm
         ip9k/Wc0Ldhh+AdL5Cj4eHYMy9dOF0dGlONteMh89IjFLEZttZsFhzfT4SmzyvQdEdpD
         3/YI0lM++TZIKQsc0/9RNYwCEKQOPU4oxv7KvYX3vKIbLcr8kHRrUf2GAM8XYpyioybh
         t0RtPqtbdCl3xIRqmnPWAe1jzhKQ9Pj+NeHdP2jZqsLo3G1cK4T14+u1LOC4L8EZsDxg
         qI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCo1AkWD2FgarCrXoedmAiqLbycN5G3SgzmeYSK7Dpg=;
        b=F4e5YzNAFCj7nalY0jQVTC1p0BylCJk2ecsh8bcPaHod8wOCOv2jUoPExSGpADIZKi
         Ln7/T7eaoXQPdEgMU710Y+0PZNWz/G3nMIWUh4VQE02GmFqXtf0KIWrYm3vAgnl25psT
         Qbnwe8C3xMPxKmQzEVtpclmM4d0D/anhKe6V4adPkOXHUkjFqsB0DCqXHQYbC4bo7I/+
         uJr9+53nTxPN0If0zjEZ2Ab6sP240SLfASbok8SruduRxNSZd35Hn2VBhSwn13PUsJzY
         /mFcewq5FSPpg7emhScyFT7/zdjJJpozIVRXcVp6ZwWkEngXl5pImXJ7u46ulPLbNmok
         UzQQ==
X-Gm-Message-State: ANoB5pkfWwlCbvCz+PMTuwY0iNFATu46pOiFNRUtk1zCKbIadwM7fuie
	5y7R8wcWzLevlqGc7u9OXPSZjw==
X-Google-Smtp-Source: AA0mqf6pTDKs6NES1VpquDFIMXzG3rHRmFl7tbVum6ZhfTc6vzbNQJxSmQRtXXQVDfJoEGUtN9CHMw==
X-Received: by 2002:a05:651c:b0e:b0:277:3ca2:dac6 with SMTP id b14-20020a05651c0b0e00b002773ca2dac6mr14570830ljr.143.1669581663153;
        Sun, 27 Nov 2022 12:41:03 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:02 -0800 (PST)
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
	Neil Brown <neilb@suse.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/6] dt-bindings: leds: use unevaluatedProperties for common.yaml
Date: Sun, 27 Nov 2022 21:40:53 +0100
Message-Id: <20221127204058.57111-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_124105_154219_A840205E 
X-CRM114-Status: GOOD (  12.69  )
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


