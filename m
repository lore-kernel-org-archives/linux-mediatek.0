Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A5EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 13:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu/6BNrbZp9njCa8iLIpe9m+ZmHNz+PxLqalouL2mRo=; b=yxeC3y6bkDp/JbonfMkI3gjA99
	6hO41YLK7StnRuP0lywuQgWylexw3OKKNDkfVkvwZhO+3lNhZQW9XQTH8tFwKq1k2BQlYlSV/fB1b
	7EX1o+OaHc4BGk0FNf5gBmc6Rvio2DAVLrvPuu+vOccgye8tHyLx5EqOrYgPDgW/gihHSZ7e5jLre
	r+e/bTm8aeyCOdeLl7q3YQvM+AanLgA6ts6q72VQXQvdzzDJMX1msY44IGIOjFFuh1VUs3Qefh03D
	kRlPacOP6C2RqDxJohvfVhUS7TmwoRNlb9UkdWmmTEScdXMLFw5OFexeemj3lMbMBUuF6RuxwyDgW
	+58ptJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5500-000450-5p; Tue, 13 Dec 2022 13:07:08 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p54y7-00025n-Bn; Tue, 13 Dec 2022 13:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670936709; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jZCp1JGpjSxsQkzHqY6VhYZIzGESdKIZDvWiFaqzRUuH4p/mL5xl3fnfo4YmW7sqG4NBeKh/kdwvdfanuGfOGNckKHVTPrrvbGWGBy56eWnTF/t7vCNuNbJR5uF4Ofg/JzljsSsYDv+JxKAvxUejtD4qiGlpON52ynOkCeXlbuE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670936709; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gu/6BNrbZp9njCa8iLIpe9m+ZmHNz+PxLqalouL2mRo=; 
	b=AL/DZPEGQoG28FVKwpxNQDiPecaE9gHB52iEIU3CSO9SehWiW8e8iapeR4i6SsjxYONO37q5tCR3VLHfu4B5+YUd2BqnlKFBMVjWZMFwWnmSYpuLCqcDKMEmUtyzbsLpPEzhFUAFGRpXDUbGF6lO5Bft+rqJ4CISSq+Tk2pNy74=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670936709;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=gu/6BNrbZp9njCa8iLIpe9m+ZmHNz+PxLqalouL2mRo=;
	b=U7DaW1cX0FF5vbrGnWQYU/HTsJSyrpIbEuJQfSd8meNOROvM9ohpx/m56itzyQ2v
	v2pEKk8/l3QyYAtE22zcT2PXOePbWVdhwf5LqiuqOEjaSJ5H4WZ9CMzjR/fOIhXTKy1
	4pME8xg/n8mmb10rPNTK+2sQkX7MjCwNFYB956mk=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1670936707079394.1052154066318; Tue, 13 Dec 2022 05:05:07 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: pinctrl: rt305x: add proper function muxing binding
Date: Tue, 13 Dec 2022 16:04:29 +0300
Message-Id: <20221213130430.172876-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221213130430.172876-1-arinc.unal@arinc9.com>
References: <20221213130430.172876-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_050511_484486_D0C5AA2E 
X-CRM114-Status: UNSURE (   9.94  )
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
 .../pinctrl/ralink,rt305x-pinctrl.yaml        | 235 ++++++++++++++++--
 1 file changed, 210 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index f602a5d6e13a..30779a1a90b0 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -30,38 +30,224 @@ patternProperties:
         $ref: pinmux-node.yaml#
 
         properties:
-          groups:
-            description: The pin group to select.
-            enum: [
-              # common
-              i2c, jtag, led, mdio, rgmii, spi, spi_cs1, uartf, uartlite,
-
-              # For RT3050, RT3052 and RT3350 SoCs
-              sdram,
-
-              # For RT3352 SoC
-              lna, pa
-            ]
-
           function:
-            description: The mux function to select.
-            enum: [
-              # common
-              gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led, mdio,
-              pcm gpio, pcm i2s, pcm uartf, rgmii, spi, spi_cs1, uartf,
-              uartlite, wdg_cs1,
+            description:
+              A string containing the name of the function to mux to the group.
+            anyOf:
+              - description: For RT3050, RT3052 and RT3350 SoCs
+                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, mdio,
+                       pcm gpio, pcm i2s, pcm uartf, rgmii, sdram, spi, uartf,
+                       uartlite]
 
-              # For RT3050, RT3052 and RT3350 SoCs
-              sdram,
+              - description: For RT3352 SoC
+                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led,
+                       lna, mdio, pa, pcm gpio, pcm i2s, pcm uartf, rgmii, spi,
+                       spi_cs1, uartf, uartlite, wdg_cs1]
 
-              # For RT3352 SoC
-              lna, pa
-            ]
+              - description: For RT5350 SoC
+                enum: [gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led,
+                       pcm gpio, pcm i2s, pcm uartf, spi, spi_cs1, uartf,
+                       uartlite, wdg_cs1]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
 
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
+                  oneOf:
+                    - description: For RT3050, RT3052 and RT3350 SoCs
+                      enum: [i2c, jtag, mdio, rgmii, sdram, spi, uartf,
+                             uartlite]
+
+                    - description: For RT3352 SoC
+                      enum: [i2c, jtag, led, lna, mdio, pa, rgmii, spi, spi_cs1,
+                             uartf, uartlite]
+
+                    - description: For RT5350 SoC
+                      enum: [i2c, jtag, led, spi, spi_cs1, uartf, uartlite]
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
+                  const: sdram
+            then:
+              properties:
+                groups:
+                  enum: [sdram]
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
         additionalProperties: false
 
     additionalProperties: false
@@ -75,7 +261,6 @@ required:
 additionalProperties: false
 
 examples:
-  # Pinmux controller node
   - |
     pinctrl {
       compatible = "ralink,rt305x-pinctrl";
-- 
2.37.2


