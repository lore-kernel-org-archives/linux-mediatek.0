Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC0DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAvy8c9gtUZy8nIKl3qnMpXIEQOhQbRLMkZCTIdFNcc=; b=wicwXO1QGrZ56hIRuPqpmsZ0w1
	q6uKD+3dmcg6qvXhVAf+FvG6dUJ7bGz3Q9JxYRkFFHnuM9JoTE0zye4hCuGGTOqfJZN6JZjZBA1fn
	6aC8DBuJzDpTXamKsCS06zDsIPu7mqXpE1bpNUG1BM2Pcb7B/2cFNK3lQaVy2gylqK5+Qv1QMnmiF
	1e/oiE4BPttbxMvHIs/tEbrfWG36EOgjold1ia+1ChQi07Nb44Pkeo9RTnz+O4ii3VrRtQZWKbsAg
	jGFjmS2CDMgyieVyMxyGQUpYMmHVVpJNJ1mZ+lRupABIq2oEVexopVmcGKWkQ8pix/6twYerXVqnM
	nKzgUzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzdE-003h5A-K0; Fri, 18 Nov 2022 11:34:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzbT-003g0r-3o; Fri, 18 Nov 2022 11:32:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id j15so8155219wrq.3;
        Fri, 18 Nov 2022 03:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAvy8c9gtUZy8nIKl3qnMpXIEQOhQbRLMkZCTIdFNcc=;
        b=aNhQxWuIWQUM3GCgOEFW2ZaDl4AyvbGzGmidBaLQC+ptKYUkJMc2y1N5bL5BtqJzxw
         tG8wHRSWcuOaP16tIMVDdNC3xcOongXTsakZi53NoIrWqwojxxQRR910c5rNJsGN0XxG
         poretQK9G6L9xOKuCmwTSz4hu4u23ssH6RiUglyhhwxmkJWaBs5mxW3hi0gSYEzK/2sv
         9P4C0fuDDKBKtSZSXiso47V3Lt7AImco8795s/Pv1mdBU3vvd4bioludYswbjBZ/mA/Q
         wRA/uEOvlmJzTvalcY3EX/Ijgvvl/WaPXnmDEgwaq/4wOnCPsshoad8PU3GJouj/bG4Z
         51Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAvy8c9gtUZy8nIKl3qnMpXIEQOhQbRLMkZCTIdFNcc=;
        b=WfDJri8KO0G89wKJrFvbxtkRPQ6wwUdSjfovRfAIDr3IxXhDMvz9Tht/3s4Lv5Apym
         QVct+UHzCuDMOkUp827sSvFRSkRzdZPskWXN9ozgAAs2uS8RE9Zy5kpGFunoZtxncyO8
         yDfkHTvFA6DRJMsy0DDiRyQSu2iEF271+uvkqcL4CxaE851p9vhEeTdvNqLYgpk7ZyTf
         zye0r8uvUGrCfAs2S68y44eKZsskdsBrwNy/UPR8XEhtZlLwa+yA5OAidwt3nDZHZRNv
         cVyyZ/aomA4V8lF/oH4glShp1g4qK1k3oAF0sHm/xJPGnry/tFx9jKNJ7KNbVhHQQCMT
         DEBQ==
X-Gm-Message-State: ANoB5pn2k1HWiByb29SyLMHl5e6GXsy2SGGwSpDGtyBix7+BAKwOCzRV
	+tbohpyneLHuEY1gMVSYI3A=
X-Google-Smtp-Source: AA0mqf4b9R5IXX/RtS2DBzFyEY8bsx3yi7235hc2wxNciic0J/Fvaap19LLqleaFiwRkkMUCKSOXCw==
X-Received: by 2002:a05:6000:1d94:b0:238:3d85:8e2c with SMTP id bk20-20020a0560001d9400b002383d858e2cmr4121275wrb.650.1668771131382;
        Fri, 18 Nov 2022 03:32:11 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm9894817wms.5.2022.11.18.03.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:32:11 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 6/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin controller
Date: Fri, 18 Nov 2022 14:30:27 +0300
Message-Id: <20221118113028.145348-7-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118113028.145348-1-y.oudjana@protonmail.com>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033215_187054_275EFA7F 
X-CRM114-Status: GOOD (  14.49  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add bindings for the pin controller found on MediaTek MT6735 and
MT6735M SoCs, including describing a method to manually specify
a pin and function in the pinmux property making defining bindings
for each pin/function combination unnecessary. The pin controllers
on those SoCs are generally identical, with the only difference
being the lack of MSDC2 pins (198-203) on MT6735M.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 55 ++++++++++++++++++-
 MAINTAINERS                                   |  6 ++
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index c2238a86b7fe..4fe95b0107ba 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Andy Teng <andy.teng@mediatek.com>
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Sean Wang <sean.wang@kernel.org>
+  - Yassine Oudjana <y.oudjana@protonmail.com>
 
 description:
   The MediaTek pin controller on MT6779 is used to control pin
@@ -18,6 +19,8 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6735-pinctrl
+      - mediatek,mt6735m-pinctrl
       - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
@@ -60,6 +63,42 @@ required:
 
 allOf:
   - $ref: "pinctrl.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt6735-pinctrl
+              - mediatek,mt6735m-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 8
+          maxItems: 8
+
+        reg-names:
+          items:
+            - const: gpio
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 8, 16]
+
   - if:
       properties:
         compatible:
@@ -352,18 +391,32 @@ examples:
             };
 
             /* GPIO0 set as multifunction GPIO0 */
-            gpio-pins {
+            gpio0-pins {
                 pins {
                     pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
                 };
             };
 
+            /* GPIO1 set to function 0 (GPIO) */
+            gpio1-pins {
+                pins {
+                    pinmux = <(MTK_PIN_NO(1) | 0)>;
+                };
+            };
+
             /* GPIO52 set as multifunction SDA0 */
             i2c0-pins {
                 pins {
                   pinmux = <PINMUX_GPIO52__FUNC_SDA0>;
                 };
             };
+
+            /* GPIO62 set to function 1 (primary function) */
+            i2c1-pins {
+                pins {
+                    pinmux = <(MTK_PIN_NO(62) | 1)>;
+                };
+            };
         };
 
         mmc0 {
diff --git a/MAINTAINERS b/MAINTAINERS
index 1df62c469bd9..f9223c6cd5a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16462,6 +16462,12 @@ F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
 F:	drivers/pinctrl/mediatek/
 
+PIN CONTROLLER - MEDIATEK MT6735
+M:	Yassine Oudjana <y.oudjana@protonmail.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+
 PIN CONTROLLER - MICROCHIP AT91
 M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.38.1


