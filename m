Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6960C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 20:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDL3bxnlhrToJ87AqhpKdM36cndBJ8Gx26Dybv1sMno=; b=pivP6NjKt9jMLyfjRk5mg22I6x
	50rgf9Zls4Pj918LPjwKwdDwSDPSYccIhOWKWM2iq5ViHaFVkuQA3ktM1GqOYzARkw/ZzxWbOALfX
	C1cwRze/+4ORYhlt8CuiJKKD8Bx6XXQ9ajubPm0kSM0umhYDo2L0wIQRDTIeJB8m7UuVxfpwuQUAs
	H8wMgwpkNluQ9tCuICpUbw+2Z+WQ0lMKqHJcPWGrXzJufwJDPEzoEHmMsQL5Wl49A78LJ5Az0uwe1
	dHPm32hxeVmok0KHX9O/SOsKXsI0yfvISX+bQmv945KJO+wCHz7t/qgyDOjfuYVTmH6SrdhJTiW3u
	np7nU7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOTV-00DYOK-9t; Sun, 27 Nov 2022 20:42:05 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOSa-00DY1z-Th
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:41:13 +0000
Received: by mail-lj1-x231.google.com with SMTP id e15so3252870ljl.7
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDL3bxnlhrToJ87AqhpKdM36cndBJ8Gx26Dybv1sMno=;
        b=tS+SpjB3/m1Y20fT1JtVV+5T7NKAGZXGuQ1uFalFM7wjGUMQdCR9doi8Xtw8YIg79s
         muOgrImr6KJL0hzoMTo1Cn3jqQP7XdfbSmuY7zzMRw+Ntj2yyxal99SNWo6BcE4pzCFi
         Ut0fO/xDd9UOa51jgkpWX+1JMHp8bjUnI9DMQOr5aa1K8EjB28dgtt4CLHIyLVofu67e
         5LzM751ss2sWd96qS4++BY9ayDxqMopgzX3V5S7tu0B0jYYF80ozOO2gygKOfUhwOAc3
         6ko+39RoKaEnsxXHT1sGzBH6zeOSkrexbvbTHzlcviwgCwhv+2VIALBNay/8WBdx2Qr/
         0LUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDL3bxnlhrToJ87AqhpKdM36cndBJ8Gx26Dybv1sMno=;
        b=SkoB55Rq6MzDxJ7OUf78Kgu24skeFwmKJtCZVsgq7Fy+taOmv6arqmtEpSvBCpieyK
         8k0dN6TzWdSrRyRyUroUynlqyq6tzDRMcsIfK6mlsWuGwQU+T4dttLwKk/xdZmikiCEt
         Vzwf42U4yq+dAnIQpj50XMgRz7d3RWVh/BiFgSlnXYsMRdTfNzcMINwz2HomRljJSwbE
         tFq6SE3MA4zVz+jEaRMOe7xLz+9+9RahRP4dn6ZAifvP2lM4lrW4XMOJ3fatfrjZIGXi
         1ef1z7aZZgY5IR+Fgr1jaxoC7H4ZAYRcQtXWTahZjbbe8VG8ZkFBBBB8vkLE7KWIy0PD
         R6lg==
X-Gm-Message-State: ANoB5pmMAi5fk/bNdu5c7XM7hCEwoxp0ilC/dIKfBNNNvh1B3HEGmJPt
	qYpOrchL+elik+AnMLVqiXrh5w==
X-Google-Smtp-Source: AA0mqf7OihlRS/gxN74EB3cI3w/EoGWSf4v88lVbhgM+8UeFTHdNFtfIy1yXQi9S4ztKYo2g1YOa7A==
X-Received: by 2002:a2e:8e23:0:b0:26c:4f23:d346 with SMTP id r3-20020a2e8e23000000b0026c4f23d346mr14263929ljk.304.1669581667031;
        Sun, 27 Nov 2022 12:41:07 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:06 -0800 (PST)
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
Subject: [PATCH v2 4/6] dt-bindings: leds: lp55xx: rework to match multi-led
Date: Sun, 27 Nov 2022 21:40:56 +0100
Message-Id: <20221127204058.57111-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_124108_962836_DE8A5DED 
X-CRM114-Status: GOOD (  11.03  )
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
index 9a38e5ee43fe..ae607911f1db 100644
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


