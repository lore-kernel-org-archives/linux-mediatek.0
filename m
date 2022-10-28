Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35B1ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7fZm7ApuXTgcuAlV5HSEAH+WmHyvrZrCXZs8igo6kk=; b=hu3ZbxJcOa2P0aYUIt1a6OZLQl
	mXrsV+Uo4+0wRZwFfWH+PiCb3L/QClJZk0YCSQV7rQiEMNg/H4H8sWNfcEwi3DrDyXrfu11i3ue/+
	j7B6/mfZaF494Kog2K5aVT/aVpWNxoC73wbvlHzf5lIXBG4JrYHORECyx2wLWiFqHMe2rvW/amaxt
	8RxRSCvxO8Nt+BsQYi4f5/i//7cMYBukrzQciDQ1GvqlHYiUfU5srDM1PmiKAZgXQNiUUwn9haF8A
	HwRTwi3sMDSa/vVEDwpd3KLeZErK6AHgGd2BHRHJ+4HyASaDoXAWspGyZk0Am5am3Uqgydm0a4VEx
	8SoMe5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRVV-000bLk-4O; Fri, 28 Oct 2022 15:42:53 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooROc-000YFJ-De; Fri, 28 Oct 2022 15:35:48 +0000
Received: by mail-ej1-x62f.google.com with SMTP id fy4so13795399ejc.5;
        Fri, 28 Oct 2022 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7fZm7ApuXTgcuAlV5HSEAH+WmHyvrZrCXZs8igo6kk=;
        b=gtZ582/rkHjfMwapj9rlMJw6dyYkxpynZ15f3IkfF7bvHLK8/81Ygiuj8sth0PlAEi
         G+lunjEZ40yngQgr1vytiDorjO8jcHCKL7X0WqCHIpiDW7UCAsl+BzhRpmT/tKNT/e31
         Wda9fGJ5NnDvr+X4UYHmG4WXOPpfSr7R7aW+cRIJWjD+isN3h067tNR4X9hCEPLwv4OD
         D3em+NuO8vCLe+wqb6DkSTxli120JA10Xm6fVn0M4b74HZ+RaBFcOdH1KnPo3iSKkpL6
         sSDmzIJccrWnxcCO4RoNa72B/Vh603hVkB5opMA18BkEe45qDpc0ddk45NibvFQMoZ+3
         arkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7fZm7ApuXTgcuAlV5HSEAH+WmHyvrZrCXZs8igo6kk=;
        b=smA5y96dretEzU1kIHxFvpsXRq4Iv7QU46ByCI3+ATKnlO2++78uzN0TRTqs88mWSJ
         9SMZtiATLoLfPnK1e0mGjoFcBjhsMwDHBp9axdejIknirHRRCBxY88k2UCk6/DEs0KIZ
         G/2rPZ9jF2/E5KhdlqBOIQwSZu/qnODMqjnmNGhUCuw4gSu3G848eRQA2cqRYOEUEHTc
         Zio94DA+awwMtiDGzHf3vyBAAUNkE4xkGrgSJsNrrNPATekEaq9iAeF89GPFpeKL0rj7
         7rhBdzFW05DmkP3nObrf9d0H3XLOPvNTSRA1ycljuUStru0IrfYRHPqj0pmDZLdT3tTm
         EeIQ==
X-Gm-Message-State: ACrzQf3OY9ltzpsticZ48ITbec9ca+iHazPnuzcjbfMuTzb/HeOQeqYF
	msXIDBr4GawyHFRH/2YtYkI=
X-Google-Smtp-Source: AMsMyM4JcT+lpYOacyBB/sxbZjLjpvA6Xdz7LKGpsNPSTcIxvrM+GhjuHbqF2ew97DA8atIJbEewtQ==
X-Received: by 2002:a17:907:7f8f:b0:791:a840:56b4 with SMTP id qk15-20020a1709077f8f00b00791a84056b4mr43123034ejc.540.1666971345136;
        Fri, 28 Oct 2022 08:35:45 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00461aebb2fe2sm2830635edb.54.2022.10.28.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:35:44 -0700 (PDT)
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
Subject: [PATCH v4 12/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin controller
Date: Fri, 28 Oct 2022 18:35:04 +0300
Message-Id: <20221028153505.23741-13-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028153505.23741-1-y.oudjana@protonmail.com>
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_083546_532587_9167DCA0 
X-CRM114-Status: GOOD (  14.62  )
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
index 88a4c4ef28e5..2c124b168bc5 100644
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
@@ -151,6 +154,42 @@ patternProperties:
 
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
+        patternProperties:
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
@@ -349,18 +388,32 @@ examples:
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
index 4fd8037263d9..ba5ac4422f00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16314,6 +16314,12 @@ F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
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


