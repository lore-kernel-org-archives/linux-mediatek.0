Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0C3C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZAXOY6skhIgWMHQuHhCgThWWhEcbCZfRHE799lczRY=; b=1nYDuW1vyN5tDR
	u1snFF2pz/ceBJv/LyAixLzE6lWqSFNX3H4ixaEymyyQWnFdMq3WCv1uiiqBaU+0vfffmbkcDzm9t
	nNVa5fbESY96rgeijuK6A/IGa3TDQ5uso2pRUi/xZZIz6YQ2ArNwBqd8NOEyityb/VFP+5dgYzl0v
	eLG7nCTt0jB2GwauVJj5R+xzP3ZXam2SgL0WUS686YDX60gAp+ZTl3Sy54t4XkiJ5nZEoqEEcK7df
	+t/c0sQHL/J1d0t+8IcaPLQ0fSSVoOBcZdOxDELHa2snwNDRx3N9aj0XT6UMxGg8HkDGlWBPtd+UK
	cQel+A4oTtJHeN+2SlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu70-00DWXP-9h; Wed, 22 Feb 2023 18:45:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2W-00DTfQ-3Z; Wed, 22 Feb 2023 18:40:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id t15so8860348wrz.7;
        Wed, 22 Feb 2023 10:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZAXOY6skhIgWMHQuHhCgThWWhEcbCZfRHE799lczRY=;
        b=W5fkHDeLRkjhFl9HxsxfQlmavtyQs2oxPZLNPWk0Vpt4xjZ7kqrL9pqdTgV7Q2jZu/
         xcrSyQpqdkY6G5c/dhdlc+UXnJid6tYXoCjeayCzkOkvlGyRcmLYIdDFszSn9tnbwlEM
         AU6ft70VjLH5qFA2mr1idZ1v0V2mvVdLs4MREG/1E47EO6fpOuJKNxFbtwOG8cB+4jPV
         GluvLCjIBBS4yiM2r0TkigRUKAcdEXxbOOhNKJfSKLQEnUmCxwPo7zRbiq7WdD+GFGSG
         IndIcVsGyqADNx1S/Kq8r1/0W5b8GOCdDnCnDSTuw6eQA//LVWajR56r4TYvd/W3xdGQ
         Mjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZAXOY6skhIgWMHQuHhCgThWWhEcbCZfRHE799lczRY=;
        b=Lq7UzrafcVsT4gcabM+xKUj82dKBeoFk8Dc40eZTIIkJ56UslQ0cDXY68VvGdQrVED
         UHFFdEyFumE9Ht3t23p1qsDRRX3e5VBBoN3CVccLc+6XKty43LVev0+I5TpULNB99Jgj
         HdAn0jVhaWPtbY4ifxwr8k6uprPO500QHtCczZkpcnrEMIwV1U8m+tTPf/pWQnra71IT
         gEqGnne4YqQLSrguzTfv44lqx0HCbo/CrLgrs2nWy9o01QIPk66KncSdGdxd8R/P/uPI
         iomnbvLVaIutIV8cY27uMxJmZ7d5pi65MTMPgfK1f1RedCOxx03lmM+5ONIu3sRUuLNH
         FNYw==
X-Gm-Message-State: AO0yUKX+eATJBi8qj275yXw5Ya0SO3Rb9Ll8RsPcbBE2+LZGUD82d6pl
	eD3T/dTS8pDTm430tIHobIXm5JCK3b3uPT9g
X-Google-Smtp-Source: AK7set8yraodPeN66IMk83Fp6Duc8wdW7dUqDxPoDS0lnxcj7WrgTEibf0h3hfYo16EAc1o1BBO8gQ==
X-Received: by 2002:a5d:40cc:0:b0:2c7:d6e:7e6e with SMTP id b12-20020a5d40cc000000b002c70d6e7e6emr1716277wrq.24.1677091227379;
        Wed, 22 Feb 2023 10:40:27 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:27 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 10/16] dt-bindings: pinctrl: mediatek: mt7620: split binding
Date: Wed, 22 Feb 2023 21:39:26 +0300
Message-Id: <20230222183932.33267-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104028_367148_B5F7EA6A 
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The MT7628 and MT7688 SoCs contain different pin muxing information,
therefore, should be split. This can be done now that there are compatible
strings to distinguish them from other SoCs.

Split the schema out to mediatek,mt76x8-pinctrl.yaml.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 375 +--------------
 .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 454 ++++++++++++++++++
 2 files changed, 462 insertions(+), 367 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
index 3bf58da8a394..ea4a1194fbc4 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  MediaTek MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
+  MediaTek MT7620 pin controller for MT7620 SoC.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
@@ -35,19 +35,10 @@ patternProperties:
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
@@ -59,24 +50,6 @@ patternProperties:
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
@@ -93,17 +66,8 @@ patternProperties:
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
@@ -132,15 +96,6 @@ patternProperties:
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
@@ -150,17 +105,6 @@ patternProperties:
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
@@ -179,96 +123,6 @@ patternProperties:
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
@@ -278,15 +132,6 @@ patternProperties:
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
@@ -305,15 +150,6 @@ patternProperties:
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
@@ -341,51 +177,6 @@ patternProperties:
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
@@ -393,12 +184,7 @@ patternProperties:
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
@@ -418,15 +204,6 @@ patternProperties:
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
@@ -436,42 +213,6 @@ patternProperties:
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
@@ -481,15 +222,6 @@ patternProperties:
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
@@ -499,51 +231,6 @@ patternProperties:
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
@@ -562,25 +249,6 @@ patternProperties:
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
@@ -608,33 +276,6 @@ patternProperties:
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
         additionalProperties: false
 
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
new file mode 100644
index 000000000000..c818c8947866
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml
@@ -0,0 +1,454 @@
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
+description:
+  MediaTek MT76X8 pin controller for MT7628 and MT7688 SoCs.
+  The pin controller can only set the muxing of pin groups. Muxing individual
+  pins is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt76x8-pinctrl
+      - ralink,mt7620-pinctrl
+      - ralink,rt2880-pinmux
+
+patternProperties:
+  '-pins$':
+    type: object
+    patternProperties:
+      '^(.*-)?pinmux$':
+        type: object
+        description: node for pinctrl.
+        $ref: pinmux-node.yaml#
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
+        additionalProperties: false
+
+    additionalProperties: false
+
+allOf:
+  - $ref: "pinctrl.yaml#"
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


