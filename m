Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284D1C636D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+o8MOEwE/dVfgMCl7bmAyjT+NEpiVZUInhrQfgLr0Hc=; b=hxis+WO8jMCQg3
	AF2ubB9sUf5b/9V7sTKFMKawN/yPuxwJP0BGzgmRfwGSbNLnoSfr6+s9dFre1j0aCRZAk7UxzyRYZ
	O8GWZEXcqflQnbM5wzB/sU6aAYjGSTuM+HaqkUBmu6GM/SrIqOcS1Uw7+FzScyxs96AJNPS/n7+jA
	s/u+K+hDDunXIe12jVb+sueWlI2VWb1qmkn+dJJ005naj69DwRRqL0NeafqkWKZEnhFAiu7qkNgmg
	Dw2Oflq4usIuoxmWkyqVjulJpAoNcz4Kd40SvKEo5fN0aMK9ab31ZSur2S43prBK/5P6JntggqL5y
	F4zaQRnvEHytSd1a39dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu5y-00DVuS-Gd; Wed, 22 Feb 2023 18:44:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUu2T-00DTj2-Ia; Wed, 22 Feb 2023 18:40:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id i11so2586209wrp.5;
        Wed, 22 Feb 2023 10:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+o8MOEwE/dVfgMCl7bmAyjT+NEpiVZUInhrQfgLr0Hc=;
        b=Yx2QEGus5g1VMWhkonYwCdyHoxp3C8oP8Q0n3M8/VPVHeQKFGxLnPfR4bUiZq1Ossb
         esiN/rcW1ZRqywDyPJdN2Pxi6Yj7sIGXsgd7dCzmLH9IWXNLdGLLqqtIa47hnCRHuwdX
         DDIfSX5akeCRMItSM+XSqNg4lauRkvOOG9cG6XU80bJL469BaReUKJ1MbOA4pKvjZQXR
         TFm3r5RI2wEp6FLz1iTW1QhZD7ao14+7umhOcDt1oISGA9H9GKUnJgrIAU3Dd3BWh6d2
         xQ6VfilK6Csvq5wZ8lgvbOL/EOIvW2jKvKFS4VJ6MvyzHxm4oR+D2ODo4Ji6ZVVg6EgC
         hi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+o8MOEwE/dVfgMCl7bmAyjT+NEpiVZUInhrQfgLr0Hc=;
        b=X/dRbPVcDt+cbjXA3jiZFKgru85GkdGQ1E/R4fmDE2iS9dTupM+SdPmSPEOPhTqC3W
         u4b7EMXeDnWAmReNN2QQrti47S/ARPy7DfcpefonRWS/n66nDMh4JyS14o0anvde9Faj
         zece4kuLxiPKbfazK1rhAQlOyyR+/BKuuT1/j7sEtWbhh5BwAIbzFDdNxRdpLtYJVCqD
         Vwvl6E/GVGH6U0dYy0NAJ1kFCaVljv5HG0NJoFNXFcKfXWRn1UZsRBkLmT2PYtbEPE09
         0aotO5foj+ayhRA4PvhqxvEXzkkMKRiKKV+Rw61YsWE5dA732tGI9/ZCqcIc5nxibEQ2
         e4QQ==
X-Gm-Message-State: AO0yUKWDDMdkxipmMqEY/64ZUnrxPAM7K09exdRyh2Hes34GuJ/lZRTM
	ytBUyB6Y8sS93KW1gSGKm2k=
X-Google-Smtp-Source: AK7set8b55tFD4C1QYxIyA5oqOb4rTVXxGtnb3DL9lq2HAxP0/eGyZXITvhlPkLgw/mSUH+jnV4anw==
X-Received: by 2002:a5d:5912:0:b0:2c5:58aa:35cb with SMTP id v18-20020a5d5912000000b002c558aa35cbmr8652823wrd.47.1677091225071;
        Wed, 22 Feb 2023 10:40:25 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4112000000b002c56179d39esm9372845wrp.44.2023.02.22.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 10:40:24 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH 09/16] dt-bindings: pinctrl: mediatek: rt305x: split binding
Date: Wed, 22 Feb 2023 21:39:25 +0300
Message-Id: <20230222183932.33267-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222183932.33267-1-arinc.unal@arinc9.com>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_104025_705023_C0648467 
X-CRM114-Status: GOOD (  16.41  )
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

The RT3352 and RT5350 SoCs each contain different pin muxing information,
therefore, should be split. This can be done now that there are compatible
strings to distinguish them from other SoCs.

Split the schema out to mediatek,rt3352-pinctrl.yaml and
mediatek,rt5350-pinctrl.yaml.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../pinctrl/mediatek,rt305x-pinctrl.yaml      |  78 +-----
 .../pinctrl/mediatek,rt3352-pinctrl.yaml      | 247 ++++++++++++++++++
 .../pinctrl/mediatek,rt5350-pinctrl.yaml      | 210 +++++++++++++++
 3 files changed, 462 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,rt5350-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
index 61fcf3ab1091..1e6c7e7f2fe2 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,rt305x-pinctrl.yaml
@@ -11,8 +11,7 @@ maintainers:
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  MediaTek RT305X pin controller for RT3050, RT3052, RT3350, RT3352 and RT5350
-  SoCs.
+  MediaTek RT305X pin controller for RT3050, RT3052, and RT3350 SoCs.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
@@ -36,21 +35,9 @@ patternProperties:
           function:
             description:
               A string containing the name of the function to mux to the group.
-            anyOf:
-              - description: For RT3050, RT3052 and RT3350 SoCs
-                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, mdio,
-                       pcm gpio, pcm i2s, pcm uartf, rgmii, sdram, spi, uartf,
-                       uartlite]
-
-              - description: For RT3352 SoC
-                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led,
-                       lna, mdio, pa, pcm gpio, pcm i2s, pcm uartf, rgmii, spi,
-                       spi_cs1, uartf, uartlite, wdg_cs1]
-
-              - description: For RT5350 SoC
-                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led,
-                       pcm gpio, pcm i2s, pcm uartf, spi, spi_cs1, uartf,
-                       uartlite, wdg_cs1]
+            enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, mdio,
+                   pcm gpio, pcm i2s, pcm uartf, rgmii, sdram, spi, uartf,
+                   uartlite]
 
           groups:
             description:
@@ -69,17 +56,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  anyOf:
-                    - description: For RT3050, RT3052 and RT3350 SoCs
-                      enum: [i2c, jtag, mdio, rgmii, sdram, spi, uartf,
-                             uartlite]
-
-                    - description: For RT3352 SoC
-                      enum: [i2c, jtag, led, lna, mdio, pa, rgmii, spi, spi_cs1,
-                             uartf, uartlite]
-
-                    - description: For RT5350 SoC
-                      enum: [i2c, jtag, led, spi, spi_cs1, uartf, uartlite]
+                  enum: [i2c, jtag, mdio, rgmii, sdram, spi, uartf, uartlite]
 
           - if:
               properties:
@@ -126,24 +103,6 @@ patternProperties:
                 groups:
                   enum: [jtag]
 
-          - if:
-              properties:
-                function:
-                  const: led
-            then:
-              properties:
-                groups:
-                  enum: [led]
-
-          - if:
-              properties:
-                function:
-                  const: lna
-            then:
-              properties:
-                groups:
-                  enum: [lna]
-
           - if:
               properties:
                 function:
@@ -153,15 +112,6 @@ patternProperties:
                 groups:
                   enum: [mdio]
 
-          - if:
-              properties:
-                function:
-                  const: pa
-            then:
-              properties:
-                groups:
-                  enum: [pa]
-
           - if:
               properties:
                 function:
@@ -216,15 +166,6 @@ patternProperties:
                 groups:
                   enum: [spi]
 
-          - if:
-              properties:
-                function:
-                  const: spi_cs1
-            then:
-              properties:
-                groups:
-                  enum: [spi_cs1]
-
           - if:
               properties:
                 function:
@@ -243,15 +184,6 @@ patternProperties:
                 groups:
                   enum: [uartlite]
 
-          - if:
-              properties:
-                function:
-                  const: wdg_cs1
-            then:
-              properties:
-                groups:
-                  enum: [spi_cs1]
-
         additionalProperties: false
 
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml
new file mode 100644
index 000000000000..7a74c1602afc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,rt3352-pinctrl.yaml
@@ -0,0 +1,247 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,rt3352-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek RT3352 Pin Controller
+
+maintainers:
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description:
+  MediaTek RT3352 pin controller for RT3352 SoC.
+  The pin controller can only set the muxing of pin groups. Muxing individual
+  pins is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,rt3352-pinctrl
+      - ralink,rt305x-pinctrl
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
+            enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led, lna,
+                   mdio, pa, pcm gpio, pcm i2s, pcm uartf, rgmii, spi, spi_cs1,
+                   uartf, uartlite, wdg_cs1]
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
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [i2c, jtag, led, lna, mdio, pa, rgmii, spi, spi_cs1,
+                         uartf, uartlite]
+
+          - if:
+              properties:
+                function:
+                  const: gpio i2s
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: gpio uartf
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
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
+                  const: i2s uartf
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag]
+
+          - if:
+              properties:
+                function:
+                  const: led
+            then:
+              properties:
+                groups:
+                  enum: [led]
+
+          - if:
+              properties:
+                function:
+                  const: lna
+            then:
+              properties:
+                groups:
+                  enum: [lna]
+
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+
+          - if:
+              properties:
+                function:
+                  const: pa
+            then:
+              properties:
+                groups:
+                  enum: [pa]
+
+          - if:
+              properties:
+                function:
+                  const: pcm gpio
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: pcm i2s
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: pcm uartf
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: rgmii
+            then:
+              properties:
+                groups:
+                  enum: [rgmii]
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
+                  const: spi_cs1
+            then:
+              properties:
+                groups:
+                  enum: [spi_cs1]
+
+          - if:
+              properties:
+                function:
+                  const: uartf
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: uartlite
+            then:
+              properties:
+                groups:
+                  enum: [uartlite]
+
+          - if:
+              properties:
+                function:
+                  const: wdg_cs1
+            then:
+              properties:
+                groups:
+                  enum: [spi_cs1]
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
+      compatible = "mediatek,rt3352-pinctrl";
+
+      i2c_pins: i2c0-pins {
+        pinmux {
+          groups = "i2c";
+          function = "i2c";
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,rt5350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,rt5350-pinctrl.yaml
new file mode 100644
index 000000000000..5184cea62640
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,rt5350-pinctrl.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,rt5350-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek RT5350 Pin Controller
+
+maintainers:
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description:
+  MediaTek RT5350 pin controller for RT5350 SoC.
+  The pin controller can only set the muxing of pin groups. Muxing individual
+  pins is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,rt5350-pinctrl
+      - ralink,rt305x-pinctrl
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
+            enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led,
+                   pcm gpio, pcm i2s, pcm uartf, spi, spi_cs1, uartf, uartlite,
+                   wdg_cs1]
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
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [i2c, jtag, led, spi, spi_cs1, uartf, uartlite]
+
+          - if:
+              properties:
+                function:
+                  const: gpio i2s
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: gpio uartf
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
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
+                  const: i2s uartf
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag]
+
+          - if:
+              properties:
+                function:
+                  const: led
+            then:
+              properties:
+                groups:
+                  enum: [led]
+
+          - if:
+              properties:
+                function:
+                  const: pcm gpio
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: pcm i2s
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: pcm uartf
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
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
+                  const: spi_cs1
+            then:
+              properties:
+                groups:
+                  enum: [spi_cs1]
+
+          - if:
+              properties:
+                function:
+                  const: uartf
+            then:
+              properties:
+                groups:
+                  enum: [uartf]
+
+          - if:
+              properties:
+                function:
+                  const: uartlite
+            then:
+              properties:
+                groups:
+                  enum: [uartlite]
+
+          - if:
+              properties:
+                function:
+                  const: wdg_cs1
+            then:
+              properties:
+                groups:
+                  enum: [spi_cs1]
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
+      compatible = "mediatek,rt5350-pinctrl";
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


