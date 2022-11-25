Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD43C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8y3a98agTTuTX1jVNEjy44NE9w3cHQ5Lb1+gIhtRkWA=; b=bNT1boTLhWfs3Ftb8dxiz/lhYw
	fYp0kkhntiVZeRb5TvZ06bXkobEAcqN+xux9OzaTFeiH4mqRxe5YKpJDLr35qTSzl+7RLqGHlLXXS
	S8y3ACEIeNH6ZAgqwDbQhPSN3wWzpwycbra6TMLRFKAzItwHNlpZESfZ5tIiAXFdjvu0CZhjA1Y07
	R3kammSyPUAebTxla1vUZaNpo0v2pnx1rFcUDXTmlh3EaxZPiSiqQa+LkCC8vmSs/wQIlI7oJPy8e
	gUMe0GWYBIL2q0HYvmpH+34W+rxxl79+TesNGuID2XL27lcfWCG59GHe6Xwwh6U98oOFK35QhnpQc
	C103IknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZlz-00H4un-7V; Fri, 25 Nov 2022 14:33:47 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZlr-00H4oe-8o
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 14:33:42 +0000
Received: by mail-lj1-x22b.google.com with SMTP id b9so5369116ljr.5
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y3a98agTTuTX1jVNEjy44NE9w3cHQ5Lb1+gIhtRkWA=;
        b=hS5c0+dIHOjIZqq0x2fAc5Qzoj15r81Mw73Pnu8/JJIerGbiPo3MpuJeeS5VxlUsvD
         p2sjNHNL1sLRn1lHftzKw1JIn27GlIRh+ynJfUEh1A0c7O2LtdrYDA1DyY/88SvmXib0
         hkgXuKlGqC7NxEwJMC1g1A2AHkuvefwdyVbSuBpKMuJFXtTiTRQANJHype5IIv9IqQPq
         Z2hKOKX9RUOCuBpm9DcFG1QcZElpaiTQqrQaX7/8npQRD5CP4T161oNGGutsuxygtwWp
         Hq5WnZwydHGXdFq37Jb7iRjpz+0AkQuSB8dMUnf8/naXq4M0gNrTDK0rWJgJdP6pTRwk
         yfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8y3a98agTTuTX1jVNEjy44NE9w3cHQ5Lb1+gIhtRkWA=;
        b=cTgTJscfB8qQZxtRCSCwkeGR3lOT0Homa26e0vXyPVoUsVzP+cR16Cv8Bt5448PwtU
         xvgdC9ThXdJrnDRnAAUx/PFFD6m7DdBp9U0NKzbgCyKwsfyFhgilMyARNwqWxjdP5To8
         25GrchooAeNEDV9+Q5i9IFuI08W/QUuAE2DMyLOk2BjAYW29Z8NotxavMliWuoI4zTBj
         22OnSdP7a6maZlpUsTHX43pEM86dVW2ShxVulLVjeAiaMIb07dhO2ozOCQ9DZzrs+RpO
         Ltdgm/o5dG8vM8Pl37zOA4NpnWpdbFJi31PL9OF98bYRYy4S2WVoXmZJ7z05jHwQChde
         kKWg==
X-Gm-Message-State: ANoB5pkPDXFQ7FljEf8RkxH5fJQ7Kxhpw/UPPE6sHUp+tAVv0Q7Pp9ZJ
	KpR+iRvH4x/9nB834hvt0wNFoQ==
X-Google-Smtp-Source: AA0mqf5wzZeyZBpsU1bGgU8eBUDra12IZlK9ZLIMvAYF9zIMTKhgrtoY4kXxrXfa5x6MW42EPVLtKA==
X-Received: by 2002:a2e:a26a:0:b0:277:34bb:ea2 with SMTP id k10-20020a2ea26a000000b0027734bb0ea2mr7824151ljm.427.1669386816879;
        Fri, 25 Nov 2022 06:33:36 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b002798ab42fffsm312966ljn.129.2022.11.25.06.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:33:36 -0800 (PST)
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
Subject: [PATCH 3/4] dt-bindings: leds: lp55xx: rework to match multi-led
Date: Fri, 25 Nov 2022 15:33:30 +0100
Message-Id: <20221125143331.473981-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
References: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_063339_393129_03F7BFCB 
X-CRM114-Status: GOOD (  11.15  )
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

The binding allows two type of LEDs - single and multi-color.  They
differ with properties, so fix the bindings to accept both cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/leds-lp55xx.yaml | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index dfaa957eee74..0018e963f83a 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -67,9 +67,50 @@ properties:
     const: 0
 
 patternProperties:
-  "(^led@[0-9a-f]$|led)":
+  '^multi-led@[0-8]$':
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 8
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^led@[0-8]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          led-cur:
+            $ref: /schemas/types.yaml#/definitions/uint8
+            description: |
+              Current setting at each LED channel (mA x10, 0 if LED is not connected)
+            minimum: 0
+            maximum: 255
+
+          max-cur:
+            $ref: /schemas/types.yaml#/definitions/uint8
+            description: Maximun current at each LED channel.
+
+          reg:
+            maximum: 8
+
+        required:
+          - reg
+
+  "^led@[0-8]$":
     type: object
     $ref: common.yaml#
+    unevaluatedProperties: false
+
     properties:
       led-cur:
         $ref: /schemas/types.yaml#/definitions/uint8
-- 
2.34.1


