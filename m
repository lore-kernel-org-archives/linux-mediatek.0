Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F18FC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPGa65klFhbGvVsaA+/Hqur3ELebHTV8ot6lSg5xIow=; b=ZqoR4ZRwjj5cPWHS5YgUZSrxEN
	AquwAnlHuM5CTht1dJ/2CH810NoysLsongnPebDLQG8N9qhGZKPJKh+AZGf19vS//rNtfmyMVQjzK
	7k6ZXwhHC5nv2FzfcvwhS2LM+mDPIYeaFUzpFrID8OCvsELaiMgaXEn6uFbdnoKbMXfQWUp4O3Ae4
	1XL+dhSvw9/Lkc9h2SvCoq389sRr3QcV7fXXXpprdEs6W4vBzvmKJet18j+hXg9/ocZdXz5RHNvQb
	T02cKeX8bLVUdAISGNeb9+JHP1mCB5+O+wKfvEE12XdDuhGZiqoWYuHtNqMDdqOuRioUTSLCo6zPS
	T7j8SBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBYIM-003Avm-JN; Sat, 31 Dec 2022 09:36:50 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBYHo-003AWR-Ic; Sat, 31 Dec 2022 09:36:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672479373; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YzJPoVKz5I2K694cUzjUT3eatOayh96GagWOtDQfRFAyQm/a5XxLE4bFA3Pr2Cz148FdK/Q+Mi26+sexkcRRktULxvqHt79oEaisybMn8y2pa5jr2TYWLJUS3nEtl9SfVoqfGECU+Uk6hlRL3CMj5Og54siSCmcICZTs8Fe3r9k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672479373; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=rPGa65klFhbGvVsaA+/Hqur3ELebHTV8ot6lSg5xIow=; 
	b=BxaeWIyyJY/rzakIeT5G0MolqIa0VKNh0WskaApZojU8csM9DX8CRj/NfkZ0MzObXE5JeeuWxea10bG4qWiDNsUFd9Z7i5kOby7rifesWxoh/AEYvkMNNe0le2BCEtg/dGWHRCfNMJWkb++cnUV0YIIziNooxtDnWGDnXd5n4bQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672479373;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=rPGa65klFhbGvVsaA+/Hqur3ELebHTV8ot6lSg5xIow=;
	b=QZgUxEvWzjtL7baXvt1MUElmLR81BP4uNwa9OZGFtISXqA1sodrpIRDxXFTcAxIa
	TRjx04IppwPRL7WmObDE8i2TkY68K8bnPbrKCY3wqDksaCudP6aEgl+1lHvh0tZGs5C
	rWfXmzeCYj0+rl36hTNsHvwoCIkakOAOnF3DpBBc=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1672479371809156.1518157034668; Sat, 31 Dec 2022 01:36:11 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH v2 6/6] dt-bindings: pinctrl: rt3883: add proper function muxing binding
Date: Sat, 31 Dec 2022 12:35:46 +0300
Message-Id: <20221231093546.8881-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221231093546.8881-1-arinc.unal@arinc9.com>
References: <20221231093546.8881-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_013616_760423_FE83E1F8 
X-CRM114-Status: GOOD (  10.70  )
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

Not every function can be muxed to a group. Add proper binding which
documents which function can be muxed to a group or set of groups.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../pinctrl/ralink,mt7620-pinctrl.yaml        |   5 +-
 .../pinctrl/ralink,mt7621-pinctrl.yaml        |   1 +
 .../pinctrl/ralink,rt2880-pinctrl.yaml        |   1 +
 .../pinctrl/ralink,rt305x-pinctrl.yaml        |   3 +-
 .../pinctrl/ralink,rt3883-pinctrl.yaml        | 205 +++++++++++++++++-
 5 files changed, 205 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index 06880c80ba80..1e63ea34146a 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -49,6 +49,7 @@ patternProperties:
           groups:
             description:
               An array of strings. Each string contains the name of a group.
+            maxItems: 1
 
         required:
           - groups
@@ -89,7 +90,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  oneOf:
+                  anyOf:
                     - description: For MT7620 SoC
                       enum: [ephy, i2c, mdio, nd_sd, pa, pcie, rgmii1, rgmii2,
                              spi, spi refclk, uartf, uartlite, wdt, wled]
@@ -389,7 +390,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  oneOf:
+                  anyOf:
                     - description: For MT7620 SoC
                       enum: [mdio]
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index 0efb03f1d88e..1b1d37b981d9 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -39,6 +39,7 @@ patternProperties:
           groups:
             description:
               An array of strings. Each string contains the name of a group.
+            maxItems: 1
 
         required:
           - groups
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index f59ddd5e6c2b..7fd0df880a76 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
@@ -37,6 +37,7 @@ patternProperties:
           groups:
             description:
               An array of strings. Each string contains the name of a group.
+            maxItems: 1
 
         required:
           - groups
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 30779a1a90b0..4d66ca752a30 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -52,6 +52,7 @@ patternProperties:
           groups:
             description:
               An array of strings. Each string contains the name of a group.
+            maxItems: 1
 
         required:
           - groups
@@ -65,7 +66,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  oneOf:
+                  anyOf:
                     - description: For RT3050, RT3052 and RT3350 SoCs
                       enum: [i2c, jtag, mdio, rgmii, sdram, spi, uartf,
                              uartlite]
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
index feb6e66dcb61..008d93181aea 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml
@@ -29,21 +29,213 @@ patternProperties:
         $ref: pinmux-node.yaml#
 
         properties:
-          groups:
-            description: The pin group to select.
-            enum: [ge1, ge2, i2c, jtag, lna a, lna g, mdio, pci, spi, uartf,
-                   uartlite]
-
           function:
-            description: The mux function to select.
+            description:
+              A string containing the name of the function to mux to the group.
             enum: [ge1, ge2, gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag,
                    lna a, lna g, mdio, pci-dev, pci-fnc, pci-host1, pci-host2,
                    pcm gpio, pcm i2s, pcm uartf, spi, uartf, uartlite]
 
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+            maxItems: 1
+
         required:
           - groups
           - function
 
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: ge1
+            then:
+              properties:
+                groups:
+                  enum: [ge1]
+
+          - if:
+              properties:
+                function:
+                  const: ge2
+            then:
+              properties:
+                groups:
+                  enum: [ge2]
+
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [ge1, ge2, i2c, jtag, lna a, lna g, mdio, pci, spi,
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
+                  const: lna a
+            then:
+              properties:
+                groups:
+                  enum: [lna a]
+
+          - if:
+              properties:
+                function:
+                  const: lna g
+            then:
+              properties:
+                groups:
+                  enum: [lna g]
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
+                  const: pci-dev
+            then:
+              properties:
+                groups:
+                  enum: [pci]
+
+          - if:
+              properties:
+                function:
+                  const: pci-fnc
+            then:
+              properties:
+                groups:
+                  enum: [pci]
+
+          - if:
+              properties:
+                function:
+                  const: pci-host1
+            then:
+              properties:
+                groups:
+                  enum: [pci]
+
+          - if:
+              properties:
+                function:
+                  const: pci-host2
+            then:
+              properties:
+                groups:
+                  enum: [pci]
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
         additionalProperties: false
 
     additionalProperties: false
@@ -57,7 +249,6 @@ required:
 additionalProperties: false
 
 examples:
-  # Pinmux controller node
   - |
     pinctrl {
       compatible = "ralink,rt3883-pinctrl";
-- 
2.37.2


