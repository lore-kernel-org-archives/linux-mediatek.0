Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781B2C43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=; b=HXAbp1PR+AfaBFWQPhrc3GzahR
	whkr9n/yfc33CWguFz/zGn2kFXBkSW4LoEv5NRlysGabRnSEUpUZRwoduEVH8UIcoHkbU3/UDHj96
	geELhWN5fWm0ksiqCAFCVT46fOe+sb/jNA+ZmOSNuHDTtpPnbYflonYZlq4ayeqUuwaEuodSQENgO
	jzN728NHx4drlG/XNRyzPt801fuTVN9z4s5vkqDdN80ZWLsgLHriL2m2fjXU3lMZsdh8OqueAyZzz
	LH15yaQGHLvSFojeLHxt5AiHYGqtgiPJS6iaVyWQukyL7kYwXJnuE3dDOR3ULk2OHu1raKZzNxFic
	CBrQOr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZmm-00H5GV-SG; Fri, 25 Nov 2022 14:34:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZls-00H4pt-Hr
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 14:33:43 +0000
Received: by mail-lf1-x136.google.com with SMTP id d6so7159361lfs.10
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 06:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=;
        b=rllN0hiG7XyWbfv7uWGTtFpLbOaOJqhaGBmD9aWBUiNax9tlNEBHXmjSbF9c26/Eba
         +AFHp1UsDS6K6fM2IxVT5aQbKNBiX24WnJMp8ZxYmneEWkvUQ+KOvsSVGCJ4r15DFlaC
         tcWi+TeKmEQzAWT7jIl9mYq+iiHuqC9Hn6/IVGtajINKDRtxLtDdDPL/LdD1MR1GhF5N
         kReqW6p5hY4vk67nh6Sq6Hjeo6nxonhZagdUsgTCW1MRyy05vSSDivLznbS3Tz2Hr0xV
         mHDcs/O02Urjc6LfcyKdla8sW71IbKljr6DuPHBzArdZwZhDWgs2lUcIf5vIt608afAt
         ramQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=;
        b=TzkDwZUOQ0MQjr/a2UP6nv7t4IFZNvvq/AW0TZfR0R5BA+DhtXlGBV/MMRUt4VJc5W
         B64COVwAnbtBUonTU/X8XCJAKtX9zx8oNMQgHSQqXwIIzK6kSH4zXCKQ331PsIXa5gye
         a7R0dUK5EsIQFBTODRqxazAITBI3NJOW915oJiD3GXD4UsoGbQ6WJ19t5HDEb/rDQiuY
         c+CEDdMypJFvoYzIvsyPMYbGXNLfFoP0MolpqgcgBbVV0/NKahd0kaMKtflfzckmrIet
         yHTKhv/tdbEhdC9LHfP7Bkza06xwOBCkFfo1YNITH2/EhrqEKxxR/RcPQ0UumnSZ953R
         x5Gg==
X-Gm-Message-State: ANoB5pkmbyAJY2moloPbpEto2qpzdrB2MzjE3lQPkb6uZo7rtbFnVLq6
	DRhp0PSSUyqJbn5FMN173vDtLw==
X-Google-Smtp-Source: AA0mqf53Qzco4DL39SHCdD1c0ZhnijrR6l5AkaJ+u6t/4ig9X8iPkpH3T2GNwfHRP6Sj0LxMTCX2lA==
X-Received: by 2002:a05:6512:3b0d:b0:4b4:7cb4:f932 with SMTP id f13-20020a0565123b0d00b004b47cb4f932mr8326296lfv.243.1669386818084;
        Fri, 25 Nov 2022 06:33:38 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b002798ab42fffsm312966ljn.129.2022.11.25.06.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 06:33:37 -0800 (PST)
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
Subject: [PATCH 4/4] dt-bindings: leds: mt6360: rework to match multi-led
Date: Fri, 25 Nov 2022 15:33:31 +0100
Message-Id: <20221125143331.473981-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
References: <20221125143331.473981-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_063340_629990_AB53A1F6 
X-CRM114-Status: GOOD (  10.82  )
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
 .../devicetree/bindings/leds/leds-mt6360.yaml | 43 +++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
index 69e579226d9b..d84e28e616d7 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -26,11 +26,10 @@ properties:
     const: 0
 
 patternProperties:
-  "^(multi-)?led@[0-5]$":
+  "^multi-led@[0-5]$":
     type: object
-    $ref: common.yaml#
-    description:
-      Properties for a single LED.
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
 
     properties:
       reg:
@@ -43,6 +42,42 @@ patternProperties:
           - 4 # LED output FLASH1
           - 5 # LED output FLASH2
 
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-5]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3, 4, 5]
+
 required:
   - compatible
   - "#address-cells"
-- 
2.34.1


