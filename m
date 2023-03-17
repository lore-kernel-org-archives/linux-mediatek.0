Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF57C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 22:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yu8jx+Bn0uWS9+tZTglcUL4SPeA/bfBOXrCTgW/Wh8=; b=wtUZu7IBw+W1o/
	0ixMRHiPuhiC+/OsvofmMtT2M4W5ivWxUVHLATw5Q9DEUKfo+XilM8itPuxt7YzISk+BMjKYbe4CG
	+o/3CrU24261Ox5RHFLlbPfNnDUaSPH47dEF/kFb4zK2aLJh6eIGJhTdiap79Mj3P+aPZUzdEnsBo
	E0/uqx+ccggE43wNiqk039M27buJoYOc7uj8GXXaXMOA8bUF03BjRkcvzUzdgPSzS1VjGBRA1b9TM
	NjqrrbOySIV2jZSxk6Fq7XlwYgyjX5IGN15AgUO5rHB/FoqMW78AIot5xMCXJXSwjk9IPsZfwJOD4
	GzvTG5wYox4KZdGouRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIpJ-003b9L-3B;
	Fri, 17 Mar 2023 22:45:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIpH-003b8U-2j;
	Fri, 17 Mar 2023 22:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8yu8jx+Bn0uWS9+tZTglcUL4SPeA/bfBOXrCTgW/Wh8=; b=SCGkex0KQWoa41PkOfLU6uUpu7
	yhQKZ+EdpcDIIhTrYDy6rQTwC3sUmFSkSmIKNszkdGRBbQ85eLiwHn4Ml1ft27UiwWASYQ9RV+4gE
	zuf7KRkNpLe3ZGfNhJgOQYPne3nO0G4AWyOd+dfNZYlNHBWKk/TF39bln13VjDfwOSgzyzDR6kEDi
	e71Gb0SdoMfVOm5Xb328zyUPiFEiOQ4XCqBFSNXnAMQ5K5i+ewLnc5zl4RdELNLD3qDa+nfuxlsMT
	yREW8l4U1pKVFOJpgZMHolqBWxiZhyk7eEAP0qNjWbtyHO7MXKMd8iXIx3Bo/MrJfOdxAvR3PJkzO
	9WBPSVrw==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHfG-002vWs-1F;
	Fri, 17 Mar 2023 21:31:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id h8so25397097ede.8;
        Fri, 17 Mar 2023 14:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yu8jx+Bn0uWS9+tZTglcUL4SPeA/bfBOXrCTgW/Wh8=;
        b=NCH49KH2VkHoh831KGaAOFlseyHE3VCIXNcClKuzOAwnzCuK9IDHNy/okJHMGbuqqe
         iUJeo5btO3kz/xFM7Z2k+Xo3lJyo8PB/49N8vNLF9D37EONx3lHvA04OmQfLjeR7BbtU
         XYVrKZDf675Agr6C2qHmJPSEuoxJYSGRPlwa5v+GRUogygtO+A9Vz2KpDywXPS+ZLBny
         sBoftZdbLj0xmqgykSlfgxPXjpzoLKyLP3K0hKhMWD3ZiiErs+TaNSJudXm9ed+xKMWl
         YOZ/8kCQ7DOfhFsJ+zYyxTKo2DfsQs4zHaklXGW+l9JmfbnyUTUMvBwyAjP2+U1Vu/b6
         /P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yu8jx+Bn0uWS9+tZTglcUL4SPeA/bfBOXrCTgW/Wh8=;
        b=DMjuXj7ztvWLyjI+KQ0hf+cIUNns5IS7I1/se+ep8KRPCkgNI3Dg+bcwe8nV/LDyj/
         GL46/FUCdLN81nK5Zqc0j9W4fdrvre54b46XeSWgbi8yt+AoUPrj99jT2LO2KbvMk8ZR
         PchgCCeyIkHahcGR5BKPsSXics+QMYTPUFMiUzWu3JgzpvpHsNkmCm2dpdauwBdNT8K7
         dOvk3VwO8MmBznPfcnqx/qBrrlpbeLcDkTpAU2ZOTt/pTf3N9y+aMyz3+SXY8giF9Gq9
         gS1ApKcRT8PNwXzLRQcHBVcR+eeUw5KYOTy4afKEiyKOvmWhZJGJN10b/7AwUvVW9VF1
         tjrw==
X-Gm-Message-State: AO0yUKWYWUTT8S5U/fHg52PsaBZepf8DM0p3BBRyqLZY1OoKx6TloULU
	+MNiZcEArNBw5XxJjgJEYCE=
X-Google-Smtp-Source: AK7set+XWrvn/B2c82lPXMjGRfcClzfOs4Wo1ND1mkunRJMAvsfAC6nfbVm8A1au4PCBEBGAenKWhg==
X-Received: by 2002:a17:906:118e:b0:930:6db6:39c0 with SMTP id n14-20020a170906118e00b009306db639c0mr901706eja.61.1679088664479;
        Fri, 17 Mar 2023 14:31:04 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:31:04 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 19/21] dt-bindings: pinctrl: ralink: rt305x: split binding
Date: Sat, 18 Mar 2023 00:30:09 +0300
Message-Id: <20230317213011.13656-20-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_213106_887120_00A44428 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

The RT3352 and RT5350 SoCs each contain different pin muxing information,
therefore, should be split. This can be done now that there are compatible
strings to distinguish them from other SoCs.

Split the schema out to ralink,rt3352-pinctrl.yaml and
ralink,rt5350-pinctrl.yaml.

Remove ralink,rt3352-pinctrl and ralink,rt5350-pinctrl from rt305x.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/ralink,rt305x-pinctrl.yaml        |  83 +-----
 .../pinctrl/ralink,rt3352-pinctrl.yaml        | 243 ++++++++++++++++++
 .../pinctrl/ralink,rt5350-pinctrl.yaml        | 206 +++++++++++++++
 3 files changed, 455 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 55c6f9826e76..95a904273009 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -11,17 +11,13 @@ maintainers:
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description: |
-  Ralink RT305X pin controller for RT3050, RT3052, RT3350, RT3352 and RT5350
-  SoCs.
+  Ralink RT305X pin controller for RT3050, RT3052, and RT3350 SoCs.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
 properties:
   compatible:
-    enum:
-      - ralink,rt305x-pinctrl
-      - ralink,rt3352-pinctrl
-      - ralink,rt5350-pinctrl
+    const: ralink,rt305x-pinctrl
 
 patternProperties:
   '-pins$':
@@ -39,21 +35,9 @@ patternProperties:
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
@@ -72,17 +56,7 @@ patternProperties:
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
@@ -129,24 +103,6 @@ patternProperties:
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
@@ -156,15 +112,6 @@ patternProperties:
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
@@ -219,15 +166,6 @@ patternProperties:
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
@@ -246,15 +184,6 @@ patternProperties:
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
 allOf:
   - $ref: pinctrl.yaml#
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml
new file mode 100644
index 000000000000..c9bc6cfd834c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml
@@ -0,0 +1,243 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ralink,rt3352-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink RT3352 Pin Controller
+
+maintainers:
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description: |
+  Ralink RT3352 pin controller for RT3352 SoC.
+  The pin controller can only set the muxing of pin groups. Muxing individual
+  pins is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    const: ralink,rt3352-pinctrl
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
+      compatible = "ralink,rt3352-pinctrl";
+
+      i2c_pins: i2c0-pins {
+        pinmux {
+          groups = "i2c";
+          function = "i2c";
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml
new file mode 100644
index 000000000000..f248202ce866
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml
@@ -0,0 +1,206 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ralink,rt5350-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink RT5350 Pin Controller
+
+maintainers:
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description: |
+  Ralink RT5350 pin controller for RT5350 SoC.
+  The pin controller can only set the muxing of pin groups. Muxing individual
+  pins is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    const: ralink,rt5350-pinctrl
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
+      compatible = "ralink,rt5350-pinctrl";
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


