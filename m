Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ACAC4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 20:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=; b=kCjx+pyUL5muwZllgGJznMdzIO
	3rk29Gb5qyM4T1QwCOePc7B/p+a6wCuJNiBWxNChDKUmV8cStjaP3LrZckGjLlpRN5xqGtKHs+K2q
	wbcEEkw5B+alNu89YD0wwPFk/ByCc9dRC2ooyXFbclOHWDseN76lqYxr2q0bLaLLY9PlNvsLyHRac
	Vmap5sI2UgpiaZRgVMmsJtnOGnzK4UsOV7UINWEPjpleVF0CWcdHJySWS31n0ruVqfV6yaUkjkQO5
	oy7gkybxzrs7JYj4bEnLH7xNVyHss1NaXlL/mB+BXFiiNhXABwVNadSI519AuGSTeu7LCgQYVq+7q
	M2hucqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOTr-00DYYc-IP; Sun, 27 Nov 2022 20:42:27 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOSb-00DY3b-Lt
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:41:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id u27so3534343lfc.9
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=;
        b=YaaN2RQTcFm9ehc3OomVgPJID3UUmIVjbjh+CTy6n8rddMuHsrrJsVgFupJb4bX7dn
         OLgeT30j5o+6DcuTUYFXzHkp9Hnht5ZLR+alchUwHgR9ci7BwLM5uDNkCEX3a5mpuOtN
         g4/rwHTJf+gyxhEG5Y7aIztzRsuOwurKdYyxElv2li+qa1X5f0XR7xflznYRwWnYeWCN
         XrBq2JFslCK+FoN86SML1aRbr//ngmo2/Tu+zJ5BF79vwreaIQ1zb2F+VlJIH2zFex5V
         a3i1f2crNl8u+BfLIOfkcnqy/Wurrj7XUWtXIVqZZkp9q52QwNzHQCukzdikgcvIxUQR
         5xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaRc1qhxO0e/vPCyLXyooIUxaaj3mmT/bRHWf+I1C6o=;
        b=q3Xup9mxW6FtbVlcX6D6EMASRerztQrTxxyZYfHyIdm76Ua/YYF/KJ26VHCh/UX+bY
         2n7MquQHRXFcucJp+8x9T1FDdqN0LuRFmI1Bd4eaIFHaW+ktM07D/8GLsqK46m59tkxS
         r4Qwl+wKNrENazb/TArsQslb10ywE29J0z9qWtWnCqcpz26JoiP5Vi2pvED3iqpu9eJG
         jDCJh+LZW1FoNz0L39zBLJWin5kmbV8QR4lDJeq3sZdV5NQhHt1QT/P46zX82AHE5oOa
         km3vnLpfIZt7CpPSP3V5aEzp/0/CZCRT5shEgUzXUhrj1J57Yp0ogHrXw8BCZKAGaRSK
         Xjyw==
X-Gm-Message-State: ANoB5pnHItNJRxrUiYoQtpjTF23qXgjcQIohSkEfRQuV0KnvrJpu5nJ7
	eRKnls8WDI2R0ETJnKVHf+pwBQ==
X-Google-Smtp-Source: AA0mqf4kiCEQv/GcWeelmFXWf1koVqKb26tmeRxQzTIETfLrfZpwkqyCr2NjkWpbblurW2uvjucVtQ==
X-Received: by 2002:a19:5f03:0:b0:4a2:67ea:a06 with SMTP id t3-20020a195f03000000b004a267ea0a06mr15601668lfb.580.1669581668369;
        Sun, 27 Nov 2022 12:41:08 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:08 -0800 (PST)
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
Subject: [PATCH v2 5/6] dt-bindings: leds: mt6360: rework to match multi-led
Date: Sun, 27 Nov 2022 21:40:57 +0100
Message-Id: <20221127204058.57111-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_124109_776650_30DEAD25 
X-CRM114-Status: GOOD (  10.69  )
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


