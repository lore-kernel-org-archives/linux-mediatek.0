Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C10C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 16:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rvg6njSlL9hPV/ZD99A/NBar0M7ScrSdM3GX938xY4E=; b=cX7x+2CBSQ/vPMydHKmrekWUge
	YYpmsOY2pvdeZSzB2lMFISAU1RTLgCYLCSkITA9/3hZqAFPcSK8fXoRMLOuxyX0OAUoQ8Ou11pn7w
	c3RAUfHyQ16NiiOytLdiNUfqtRgV1UGEC8ymvfSl6LG/Y5UpqFtvXC1nGfBzYswmUs8pqu2g0XIs5
	eNmeOcUJZe5xNHP4zZ+9ZgtbOKjRYGGEGlefG6sXkZwgvg8Szl76lCABWXPQ299kEmPvo8wMBvSaG
	3iE9qHsQBuGNGGhp4NgzgHLRRO07tn2yNxB9ftBvpSs8K7TasrL3al3kNHEzOIU0UGg4ERysIoV0H
	/LtH5XkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBeQI-007JiI-Iv; Sat, 31 Dec 2022 16:09:26 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBeQ3-007JaF-SV; Sat, 31 Dec 2022 16:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672502947; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z70TVxvL71VEerLhT2AROZLXQty+wCtXYD9q+7QqIO0qkwoOQlXOMoyZ+ngF/bOCpy0S3FHqJhsfB2Xa+eeccDq79ay6D0p2301bMHl+Z7U5f0qIKOc3YaWdCq1QsqfY4idZTIc7oL0WfOnZmlsw5+in2TRkhdvZbtf0T2GB8xg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672502947; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Rvg6njSlL9hPV/ZD99A/NBar0M7ScrSdM3GX938xY4E=; 
	b=RBT7uNn0cfslOTI0Ihna0gV6rfK4m5OAeVm9nnOz9T23BhlP43w3AamRpEJOYc2+509xSGLMjI0ikfQ+OmrrRXbzTw7Eb9Qd1nlE6cRrFJFgUKRc8FQ/lkxZfSzF8uKn0Fwg0q7nTvtN5Y8UrPefS5E3dkJ+lWNA0oxfcW2h3yY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672502947;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=Rvg6njSlL9hPV/ZD99A/NBar0M7ScrSdM3GX938xY4E=;
	b=HJWRPweBkAiPekzJi7A99E7yeTBu6UdfZ8V5hQg3D4T+fsL9hMlz7kISIqQL5jQh
	dM5t5wcdzWVk2T1rYZZbvAgxM/eJVmf40CqJCTTfJXNEQqLDXFTPdOOetxJ2Auf3WTl
	gNcmMPJzTJ8+FhE5reaMP4Okx4OF1tOfRQAzb8yw=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1672502945249792.4174880692418; Sat, 31 Dec 2022 08:09:05 -0800 (PST)
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
Subject: [PATCH v3 3/6] dt-bindings: pinctrl: mt7621: add proper function muxing binding
Date: Sat, 31 Dec 2022 19:08:46 +0300
Message-Id: <20221231160849.40544-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221231160849.40544-1-arinc.unal@arinc9.com>
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_080912_022163_FC7D226F 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
 .../pinctrl/ralink,mt7621-pinctrl.yaml        | 205 +++++++++++++++++-
 1 file changed, 198 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index 61e5c847e8c8..1b1d37b981d9 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -29,21 +29,213 @@ patternProperties:
         $ref: pinmux-node.yaml#
 
         properties:
-          groups:
-            description: The pin group to select.
-            enum: [i2c, jtag, mdio, pcie, rgmii1, rgmii2, sdhci, spi, uart1,
-                   uart2, uart3, wdt]
-
           function:
-            description: The mux function to select.
+            description:
+              A string containing the name of the function to mux to the group.
             enum: [gpio, i2c, i2s, jtag, mdio, nand1, nand2, pcie refclk,
                    pcie rst, pcm, rgmii1, rgmii2, sdhci, spdif2, spdif3, spi,
                    uart1, uart2, uart3, wdt refclk, wdt rst]
 
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
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  enum: [i2c, jtag, mdio, pcie, rgmii1, rgmii2, sdhci, spi,
+                         uart1, uart2, uart3, wdt]
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
+                  enum: [uart3]
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
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+
+          - if:
+              properties:
+                function:
+                  const: nand1
+            then:
+              properties:
+                groups:
+                  enum: [spi]
+
+          - if:
+              properties:
+                function:
+                  const: nand2
+            then:
+              properties:
+                groups:
+                  enum: [sdhci]
+
+          - if:
+              properties:
+                function:
+                  const: pcie refclk
+            then:
+              properties:
+                groups:
+                  enum: [pcie]
+
+          - if:
+              properties:
+                function:
+                  const: pcie rst
+            then:
+              properties:
+                groups:
+                  enum: [pcie]
+
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [uart2]
+
+          - if:
+              properties:
+                function:
+                  const: rgmii1
+            then:
+              properties:
+                groups:
+                  enum: [rgmii1]
+
+          - if:
+              properties:
+                function:
+                  const: rgmii2
+            then:
+              properties:
+                groups:
+                  enum: [rgmii2]
+
+          - if:
+              properties:
+                function:
+                  const: sdhci
+            then:
+              properties:
+                groups:
+                  enum: [sdhci]
+
+          - if:
+              properties:
+                function:
+                  const: spdif2
+            then:
+              properties:
+                groups:
+                  enum: [uart2]
+
+          - if:
+              properties:
+                function:
+                  const: spdif3
+            then:
+              properties:
+                groups:
+                  enum: [uart3]
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
+                  const: uart3
+            then:
+              properties:
+                groups:
+                  enum: [uart3]
+
+          - if:
+              properties:
+                function:
+                  const: wdt refclk
+            then:
+              properties:
+                groups:
+                  enum: [wdt]
+
+          - if:
+              properties:
+                function:
+                  const: wdt rst
+            then:
+              properties:
+                groups:
+                  enum: [wdt]
+
         additionalProperties: false
 
     additionalProperties: false
@@ -57,7 +249,6 @@ required:
 additionalProperties: false
 
 examples:
-  # Pinmux controller node
   - |
     pinctrl {
       compatible = "ralink,mt7621-pinctrl";
-- 
2.37.2


