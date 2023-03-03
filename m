Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A681C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soRQv66x7IjbcHuoWWHd5VaU4XIy6CSs2Rp3lvLAsGE=; b=wX3L4vHQOMK4io
	GoOEF3bAZRpUYMNflLk8Umlwr5swuLWUNCXgnX/avYUSWWFGPlS9Qt2UFyEAgE9yAxslSl2gwQ2j7
	c8PdsVG5R5I6I4YRqy7VXSemwXslk/yRRS1c3WTpDKgDVBgNO3PhHM6wMoBIL9CoG/0nSr8tGjraL
	6Mf/BCSLiyl+4gpwpS0VKEU/tjxCmUUlAG1rSO7/pXhuvfyFk+Et8UkZ8cOtrkjNa3d9B4oN/B6Rw
	i9G02y5CJkCYnEYQUOncXxFmzK/VZLSfoi7j7i4aHiMEZFfG6PXSnSm80l7+nA7Mcw6+5IlAZlVdZ
	lTk49uJI5cr6FGJ/CjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtWP-003xqk-Pr; Fri, 03 Mar 2023 00:43:41 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJx-003r4g-V9; Fri, 03 Mar 2023 00:30:54 +0000
Received: by mail-lj1-x22f.google.com with SMTP id z42so716623ljq.13;
        Thu, 02 Mar 2023 16:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soRQv66x7IjbcHuoWWHd5VaU4XIy6CSs2Rp3lvLAsGE=;
        b=RMpkrqatkrDIxkWivZoLCkuzUqAwVvPWVZ2PhCeIHcyWZbHraGR40JCsfeomesXEiF
         Hq5fUowS0MAjy9axsG6H0ckoLvPC9qM7o/uazGqAavJ4oGCeZw5H+Inf4HcbbfNwmS+h
         5awsC6W3pe7cGa7fWJ0gFkg8SqCVEjwlgn/S+Ss/mbCvEXP73Up7OSv+QCnBq4zvWz4j
         4ZX2jXi36442EIjISNw25EKoJzirwgIN+ZExQoS5qKxVS2R0C3eTB2+feUVCdCDD3Cwj
         CrxPVfcMUxFSOhugxIDXadN9mfydOP7c49w113ccPRYu1QJ7r97imbePQyLN3+sqz2cF
         UF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soRQv66x7IjbcHuoWWHd5VaU4XIy6CSs2Rp3lvLAsGE=;
        b=jsLZP7rfjPI8pjzA7uaMYKVF8lLcOSl3tFcHu+Qbei3IB36G6t6wcEgZ9sVj/dSK78
         2soeOLLVjE0TW79vhd8y1OgViJ7Yh9Ni9PTashcDwNByb/4xrRhSZmcqYPy+3x9jJj+C
         e11IaXe9822Ajq/CKqOd6j0oo2o9vSwVZTsMQ1cwhLSyoHvKrkZ3A1bMnTBvbXR8Vq5y
         m6j8pbB+IeDJgfuZRvQnS67+MbScxOIUhdcYcZDwUVMYNAU4xNTMDyLildGmNUYntc8a
         RH/zFtgg2uRQCbSgfvY9uSX916LI/tuiCIiiLYFbP93IT1rWbPjDPETMftTEYcoLZyCM
         os1Q==
X-Gm-Message-State: AO0yUKW24bMxv8PkCdFl3v8mVCjxEcjVc2iTdxwlMUAkU3kynIAIuaJa
	Ky2T5ks6n4V9t5RM4w9FfQU=
X-Google-Smtp-Source: AK7set/ogjCwXUG/VY8VAf6f6nBVD17h/Detv4VAXNU5PKwM/EHL9+sJCyzz0BL38WZHrVYsrp5amA==
X-Received: by 2002:a2e:9b82:0:b0:293:3424:9d21 with SMTP id z2-20020a2e9b82000000b0029334249d21mr3552008lji.45.1677803440364;
        Thu, 02 Mar 2023 16:30:40 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:40 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 19/20] dt-bindings: pinctrl: mediatek: mt7620: split binding
Date: Fri,  3 Mar 2023 03:28:48 +0300
Message-Id: <20230303002850.51858-20-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163050_134097_EB085C14 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The MT7628 and MT7688 SoCs contain different pin muxing information,
therefore, should be split. This can be done now that there are compatible
strings to distinguish them from other SoCs.

Split the schema out to mediatek,mt76x8-pinctrl.yaml.

Remove mediatek,mt76x8-pinctrl from mt7620.

Deprecate ralink,mt7620-pinctrl. The reason is, the DTs for mt76x8 which
use this string will incorrectly match the pin muxing information for
mt7620. There's a new string, mediatek,mt7620-pinctrl, which makes the
deprecation possible.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 380 +--------------
 .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 450 ++++++++++++++++++
 2 files changed, 459 insertions(+), 371 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
index 11530b29d52b..38b71c74b9a0 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
@@ -11,16 +11,13 @@ maintainers:
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description: |
-  MediaTek MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
+  MediaTek MT7620 pin controller for MT7620 SoC.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7620-pinctrl
-      - mediatek,mt76x8-pinctrl
-      - ralink,mt7620-pinctrl
+    const: mediatek,mt7620-pinctrl
 
 patternProperties:
   '-pins$':
@@ -38,19 +35,10 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            anyOf:
-              - description: For MT7620 SoC
-                enum: [ephy, gpio, gpio i2s, gpio uartf, i2c, i2s uartf, mdio, nand, pa,
-                       pcie refclk, pcie rst, pcm gpio, pcm i2s, pcm uartf, refclk,
-                       rgmii1, rgmii2, sd, spi, spi refclk, uartf, uartlite, wdt refclk,
-                       wdt rst, wled]
-
-              - description: For MT7628 and MT7688 SoCs
-                enum: [antenna, debug, gpio, i2c, i2s, jtag, p0led_an, p0led_kn,
-                       p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
-                       p4led_an, p4led_kn, pcie, pcm, perst, pwm, pwm0, pwm1, pwm_uart2,
-                       refclk, rsvd, sdxc, sdxc d5 d4, sdxc d6, sdxc d7, spi, spi cs1,
-                       spis, sw_r, uart0, uart1, uart2, utif, wdt, wled_an, wled_kn, -]
+            enum: [ephy, gpio, gpio i2s, gpio uartf, i2c, i2s uartf, mdio, nand,
+                   pa, pcie refclk, pcie rst, pcm gpio, pcm i2s, pcm uartf,
+                   refclk, rgmii1, rgmii2, sd, spi, spi refclk, uartf, uartlite,
+                   wdt refclk, wdt rst, wled]
 
           groups:
             description:
@@ -62,24 +50,6 @@ patternProperties:
           - function
 
         allOf:
-          - if:
-              properties:
-                function:
-                  const: antenna
-            then:
-              properties:
-                groups:
-                  enum: [i2s]
-
-          - if:
-              properties:
-                function:
-                  const: debug
-            then:
-              properties:
-                groups:
-                  enum: [i2c]
-
           - if:
               properties:
                 function:
@@ -96,17 +66,8 @@ patternProperties:
             then:
               properties:
                 groups:
-                  anyOf:
-                    - description: For MT7620 SoC
-                      enum: [ephy, i2c, mdio, nd_sd, pa, pcie, rgmii1, rgmii2,
-                             spi, spi refclk, uartf, uartlite, wdt, wled]
-
-                    - description: For MT7628 and MT7688 SoCs
-                      enum: [gpio, i2c, i2s, p0led_an, p0led_kn, p1led_an,
-                             p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
-                             p4led_an, p4led_kn, perst, pwm0, pwm1, refclk,
-                             sdmode, spi, spi cs1, spis, uart0, uart1, uart2,
-                             wdt, wled_an, wled_kn]
+                  enum: [ephy, i2c, mdio, nd_sd, pa, pcie, rgmii1, rgmii2, spi,
+                         spi refclk, uartf, uartlite, wdt, wled]
 
           - if:
               properties:
@@ -135,15 +96,6 @@ patternProperties:
                 groups:
                   enum: [i2c]
 
-          - if:
-              properties:
-                function:
-                  const: i2s
-            then:
-              properties:
-                groups:
-                  enum: [i2s]
-
           - if:
               properties:
                 function:
@@ -153,17 +105,6 @@ patternProperties:
                 groups:
                   enum: [uartf]
 
-          - if:
-              properties:
-                function:
-                  const: jtag
-            then:
-              properties:
-                groups:
-                  enum: [p0led_an, p0led_kn, p1led_an, p1led_kn, p2led_an,
-                         p2led_kn, p3led_an, p3led_kn, p4led_an, p4led_kn,
-                         sdmode]
-
           - if:
               properties:
                 function:
@@ -182,96 +123,6 @@ patternProperties:
                 groups:
                   enum: [nd_sd]
 
-          - if:
-              properties:
-                function:
-                  const: p0led_an
-            then:
-              properties:
-                groups:
-                  enum: [p0led_an]
-
-          - if:
-              properties:
-                function:
-                  const: p0led_kn
-            then:
-              properties:
-                groups:
-                  enum: [p0led_kn]
-
-          - if:
-              properties:
-                function:
-                  const: p1led_an
-            then:
-              properties:
-                groups:
-                  enum: [p1led_an]
-
-          - if:
-              properties:
-                function:
-                  const: p1led_kn
-            then:
-              properties:
-                groups:
-                  enum: [p1led_kn]
-
-          - if:
-              properties:
-                function:
-                  const: p2led_an
-            then:
-              properties:
-                groups:
-                  enum: [p2led_an]
-
-          - if:
-              properties:
-                function:
-                  const: p2led_kn
-            then:
-              properties:
-                groups:
-                  enum: [p2led_kn]
-
-          - if:
-              properties:
-                function:
-                  const: p3led_an
-            then:
-              properties:
-                groups:
-                  enum: [p3led_an]
-
-          - if:
-              properties:
-                function:
-                  const: p3led_kn
-            then:
-              properties:
-                groups:
-                  enum: [p3led_kn]
-
-          - if:
-              properties:
-                function:
-                  const: p4led_an
-            then:
-              properties:
-                groups:
-                  enum: [p4led_an]
-
-          - if:
-              properties:
-                function:
-                  const: p4led_kn
-            then:
-              properties:
-                groups:
-                  enum: [p4led_kn]
-
           - if:
               properties:
                 function:
@@ -281,15 +132,6 @@ patternProperties:
                 groups:
                   enum: [pa]
 
-          - if:
-              properties:
-                function:
-                  const: pcie
-            then:
-              properties:
-                groups:
-                  enum: [gpio]
-
           - if:
               properties:
                 function:
@@ -308,15 +150,6 @@ patternProperties:
                 groups:
                   enum: [pcie]
 
-          - if:
-              properties:
-                function:
-                  const: pcm
-            then:
-              properties:
-                groups:
-                  enum: [i2s]
-
           - if:
               properties:
                 function:
@@ -344,51 +177,6 @@ patternProperties:
                 groups:
                   enum: [uartf]
 
-          - if:
-              properties:
-                function:
-                  const: perst
-            then:
-              properties:
-                groups:
-                  enum: [perst]
-
-          - if:
-              properties:
-                function:
-                  const: pwm
-            then:
-              properties:
-                groups:
-                  enum: [uart1, uart2]
-
-          - if:
-              properties:
-                function:
-                  const: pwm0
-            then:
-              properties:
-                groups:
-                  enum: [pwm0]
-
-          - if:
-              properties:
-                function:
-                  const: pwm1
-            then:
-              properties:
-                groups:
-                  enum: [pwm1]
-
-          - if:
-              properties:
-                function:
-                  const: pwm_uart2
-            then:
-              properties:
-                groups:
-                  enum: [spis]
-
           - if:
               properties:
                 function:
@@ -396,12 +184,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  anyOf:
-                    - description: For MT7620 SoC
-                      enum: [mdio]
-
-                    - description: For MT7628 and MT7688 SoCs
-                      enum: [gpio, refclk, spi cs1]
+                  enum: [mdio]
 
           - if:
               properties:
@@ -421,15 +204,6 @@ patternProperties:
                 groups:
                   enum: [rgmii2]
 
-          - if:
-              properties:
-                function:
-                  const: rsvd
-            then:
-              properties:
-                groups:
-                  enum: [p0led_an, p0led_kn, wled_an, wled_kn]
-
           - if:
               properties:
                 function:
@@ -439,42 +213,6 @@ patternProperties:
                 groups:
                   enum: [nd_sd]
 
-          - if:
-              properties:
-                function:
-                  const: sdxc
-            then:
-              properties:
-                groups:
-                  enum: [sdmode]
-
-          - if:
-              properties:
-                function:
-                  const: sdxc d5 d4
-            then:
-              properties:
-                groups:
-                  enum: [uart2]
-
-          - if:
-              properties:
-                function:
-                  const: sdxc d6
-            then:
-              properties:
-                groups:
-                  enum: [pwm1]
-
-          - if:
-              properties:
-                function:
-                  const: sdxc d7
-            then:
-              properties:
-                groups:
-                  enum: [pwm0]
-
           - if:
               properties:
                 function:
@@ -484,15 +222,6 @@ patternProperties:
                 groups:
                   enum: [spi]
 
-          - if:
-              properties:
-                function:
-                  const: spi cs1
-            then:
-              properties:
-                groups:
-                  enum: [spi cs1]
-
           - if:
               properties:
                 function:
@@ -502,51 +231,6 @@ patternProperties:
                 groups:
                   enum: [spi refclk]
 
-          - if:
-              properties:
-                function:
-                  const: spis
-            then:
-              properties:
-                groups:
-                  enum: [spis]
-
-          - if:
-              properties:
-                function:
-                  const: sw_r
-            then:
-              properties:
-                groups:
-                  enum: [uart1]
-
-          - if:
-              properties:
-                function:
-                  const: uart0
-            then:
-              properties:
-                groups:
-                  enum: [uart0]
-
-          - if:
-              properties:
-                function:
-                  const: uart1
-            then:
-              properties:
-                groups:
-                  enum: [uart1]
-
-          - if:
-              properties:
-                function:
-                  const: uart2
-            then:
-              properties:
-                groups:
-                  enum: [uart2]
-
           - if:
               properties:
                 function:
@@ -565,25 +249,6 @@ patternProperties:
                 groups:
                   enum: [uartlite]
 
-          - if:
-              properties:
-                function:
-                  const: utif
-            then:
-              properties:
-                groups:
-                  enum: [p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an,
-                         p3led_kn, p4led_an, p4led_kn, pwm0, pwm1, sdmode, spis]
-
-          - if:
-              properties:
-                function:
-                  const: wdt
-            then:
-              properties:
-                groups:
-                  enum: [wdt]
-
           - if:
               properties:
                 function:
@@ -611,33 +276,6 @@ patternProperties:
                 groups:
                   enum: [wled]
 
-          - if:
-              properties:
-                function:
-                  const: wled_an
-            then:
-              properties:
-                groups:
-                  enum: [wled_an]
-
-          - if:
-              properties:
-                function:
-                  const: wled_kn
-            then:
-              properties:
-                groups:
-                  enum: [wled_kn]
-
-          - if:
-              properties:
-                function:
-                  const: "-"
-            then:
-              properties:
-                groups:
-                  enum: [i2c, spi cs1, uart0]
-
 allOf:
   - $ref: pinctrl.yaml#
 
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
new file mode 100644
index 000000000000..f435569be6a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
@@ -0,0 +1,450 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt76x8-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT76X8 Pin Controller
+
+maintainers:
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description: |
+  MediaTek MT76X8 pin controller for MT7628 and MT7688 SoCs.
+  The pin controller can only set the muxing of pin groups. Muxing individual
+  pins is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    const: mediatek,mt76x8-pinctrl
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^(.*-)?pinmux$':
+        type: object
+        description: node for pinctrl.
+        $ref: pinmux-node.yaml#
+        additionalProperties: false
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [antenna, debug, gpio, i2c, i2s, jtag, p0led_an, p0led_kn,
+                   p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
+                   p4led_an, p4led_kn, pcie, pcm, perst, pwm, pwm0, pwm1,
+                   pwm_uart2, refclk, rsvd, sdxc, sdxc d5 d4, sdxc d6, sdxc d7,
+                   spi, spi cs1, spis, sw_r, uart0, uart1, uart2, utif, wdt,
+                   wled_an, wled_kn, -]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+            maxItems: 1
+
+        required:
+          - groups
+          - function
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: antenna
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+
+          - if:
+              properties:
+                function:
+                  const: debug
+            then:
+              properties:
+                groups:
+                  enum: [i2c]
+
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [gpio, i2c, i2s, p0led_an, p0led_kn, p1led_an, p1led_kn,
+                         p2led_an, p2led_kn, p3led_an, p3led_kn, p4led_an,
+                         p4led_kn, perst, pwm0, pwm1, refclk, sdmode, spi,
+                         spi cs1, spis, uart0, uart1, uart2, wdt, wled_an,
+                         wled_kn]
+
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c]
+
+          - if:
+              properties:
+                function:
+                  const: i2s
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [p0led_an, p0led_kn, p1led_an, p1led_kn, p2led_an,
+                         p2led_kn, p3led_an, p3led_kn, p4led_an, p4led_kn,
+                         sdmode]
+
+          - if:
+              properties:
+                function:
+                  const: p0led_an
+            then:
+              properties:
+                groups:
+                  enum: [p0led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p0led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p0led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: p1led_an
+            then:
+              properties:
+                groups:
+                  enum: [p1led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p1led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p1led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: p2led_an
+            then:
+              properties:
+                groups:
+                  enum: [p2led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p2led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p2led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: p3led_an
+            then:
+              properties:
+                groups:
+                  enum: [p3led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p3led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p3led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: p4led_an
+            then:
+              properties:
+                groups:
+                  enum: [p4led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p4led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p4led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: pcie
+            then:
+              properties:
+                groups:
+                  enum: [gpio]
+
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+
+          - if:
+              properties:
+                function:
+                  const: perst
+            then:
+              properties:
+                groups:
+                  enum: [perst]
+
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [uart1, uart2]
+
+          - if:
+              properties:
+                function:
+                  const: pwm0
+            then:
+              properties:
+                groups:
+                  enum: [pwm0]
+
+          - if:
+              properties:
+                function:
+                  const: pwm1
+            then:
+              properties:
+                groups:
+                  enum: [pwm1]
+
+          - if:
+              properties:
+                function:
+                  const: pwm_uart2
+            then:
+              properties:
+                groups:
+                  enum: [spis]
+
+          - if:
+              properties:
+                function:
+                  const: refclk
+            then:
+              properties:
+                groups:
+                  enum: [gpio, refclk, spi cs1]
+
+          - if:
+              properties:
+                function:
+                  const: rsvd
+            then:
+              properties:
+                groups:
+                  enum: [p0led_an, p0led_kn, wled_an, wled_kn]
+
+          - if:
+              properties:
+                function:
+                  const: sdxc
+            then:
+              properties:
+                groups:
+                  enum: [sdmode]
+
+          - if:
+              properties:
+                function:
+                  const: sdxc d5 d4
+            then:
+              properties:
+                groups:
+                  enum: [uart2]
+
+          - if:
+              properties:
+                function:
+                  const: sdxc d6
+            then:
+              properties:
+                groups:
+                  enum: [pwm1]
+
+          - if:
+              properties:
+                function:
+                  const: sdxc d7
+            then:
+              properties:
+                groups:
+                  enum: [pwm0]
+
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  enum: [spi]
+
+          - if:
+              properties:
+                function:
+                  const: spi cs1
+            then:
+              properties:
+                groups:
+                  enum: [spi cs1]
+
+          - if:
+              properties:
+                function:
+                  const: spis
+            then:
+              properties:
+                groups:
+                  enum: [spis]
+
+          - if:
+              properties:
+                function:
+                  const: sw_r
+            then:
+              properties:
+                groups:
+                  enum: [uart1]
+
+          - if:
+              properties:
+                function:
+                  const: uart0
+            then:
+              properties:
+                groups:
+                  enum: [uart0]
+
+          - if:
+              properties:
+                function:
+                  const: uart1
+            then:
+              properties:
+                groups:
+                  enum: [uart1]
+
+          - if:
+              properties:
+                function:
+                  const: uart2
+            then:
+              properties:
+                groups:
+                  enum: [uart2]
+
+          - if:
+              properties:
+                function:
+                  const: utif
+            then:
+              properties:
+                groups:
+                  enum: [p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an,
+                         p3led_kn, p4led_an, p4led_kn, pwm0, pwm1, sdmode, spis]
+
+          - if:
+              properties:
+                function:
+                  const: wdt
+            then:
+              properties:
+                groups:
+                  enum: [wdt]
+
+          - if:
+              properties:
+                function:
+                  const: wled_an
+            then:
+              properties:
+                groups:
+                  enum: [wled_an]
+
+          - if:
+              properties:
+                function:
+                  const: wled_kn
+            then:
+              properties:
+                groups:
+                  enum: [wled_kn]
+
+          - if:
+              properties:
+                function:
+                  const: "-"
+            then:
+              properties:
+                groups:
+                  enum: [i2c, spi cs1, uart0]
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl {
+      compatible = "mediatek,mt76x8-pinctrl";
+
+      i2c_pins: i2c0-pins {
+        pinmux {
+          groups = "i2c";
+          function = "i2c";
+        };
+      };
+    };
-- 
2.37.2


