Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E875FC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hw01WRg/k4MfoqQf/Mb/s8yJJasclgGjyZz7yh5tsH8=; b=TgKX21DCRmDYQcRoNYnzoz27Z3
	bs+ClbubEwF1FWQBSjFbA177OhXnudeukjToRpNe65bKvIdiaqD9D0yC9E2NDs8xYCebP5pfNfhYR
	duVKJkweCiCwWCpy1esbVi2gEeD9Jiz8NZD5rfIPX4Rsa5qQXH0WXjSau4+QmNlHIGuWh/1YhbeHg
	XR8o8A3FzWQEM9ib8MaoDN+sfPIWAXU6Ova+gBNEwgjVCUSks5wFrop9AWSw6z/YF801uwhIeIpjE
	EnXvTjjQ2bx5VIt5oDRr+sWkvp9t2giTHv/BA9GRZLrDo1EsPqFhXL3/JZ8el7oB/R+RSJNNTQrzz
	eYwavQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBeQN-007JkQ-4Q; Sat, 31 Dec 2022 16:09:31 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBeQ3-007Jaa-V4; Sat, 31 Dec 2022 16:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672502949; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HlJtW5YtE5QjrPIhZgWsQPaiz63tUig8wAR2H3HFNz19W0RM/cQLtHt9WWvzyp8G/YXJVDtbmIqYcFQl0aXdoSGQU/LK04o/3LYnP2484dqPqOaiWO176lTKqDqNAw+BfdhrotfZVKT3rOQaLMXT3aFeMq8iZfaT0znHvLLOFww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672502949; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Hw01WRg/k4MfoqQf/Mb/s8yJJasclgGjyZz7yh5tsH8=; 
	b=Ch8b1aQ4KGuIDfyY4CwZcHTUSwAmT9QVyGV1V9UgUg3pfDNWxCz/0j4CvOghLowPlbe3p3BOMdr5xK+vFnIe4ttQ6MjulXODFlD8qUJT76hHEZoaoPnbOzXp5fSuqfJpcwrh7bGxDpL8OqwlvOjWcN9Ca2BdgC+FJeUi+7z/Qzc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672502949;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=Hw01WRg/k4MfoqQf/Mb/s8yJJasclgGjyZz7yh5tsH8=;
	b=OdJCNif843vtyEJOZft9lvLbck0nZbyDLNBFR92lQkVEE3QunEsHfIieqDafigZP
	Beeiqvi4Ktu5+QGYlDtIw0Kq4DHiUVSVOsorS++N4ZrR1Dj2nmMOElBFOm4Uiwq/YJb
	QZyWJjO+rhlLP/JjgXVVhzbwWmOhhflMxRpowYWw=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1672502948430740.8861192646127; Sat, 31 Dec 2022 08:09:08 -0800 (PST)
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
Subject: [PATCH v3 4/6] dt-bindings: pinctrl: rt2880: add proper function muxing binding
Date: Sat, 31 Dec 2022 19:08:47 +0300
Message-Id: <20221231160849.40544-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221231160849.40544-1-arinc.unal@arinc9.com>
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_080912_170738_C2BB6BD8 
X-CRM114-Status: UNSURE (   9.71  )
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
 .../pinctrl/ralink,rt2880-pinctrl.yaml        | 86 +++++++++++++++++--
 1 file changed, 80 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index 56e5becabcfd..7fd0df880a76 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
@@ -29,18 +29,93 @@ patternProperties:
         $ref: pinmux-node.yaml#
 
         properties:
-          groups:
-            description: The pin group to select.
-            enum: [i2c, spi, uartlite, jtag, mdio, sdram, pci]
-
           function:
-            description: The mux function to select.
+            description:
+              A string containing the name of the function to mux to the group.
             enum: [gpio, i2c, spi, uartlite, jtag, mdio, sdram, pci]
 
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
+                  enum: [i2c, spi, uartlite, jtag, mdio, sdram, pci]
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
+                  const: spi
+            then:
+              properties:
+                groups:
+                  enum: [spi]
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
+                  const: sdram
+            then:
+              properties:
+                groups:
+                  enum: [sdram]
+
+          - if:
+              properties:
+                function:
+                  const: pci
+            then:
+              properties:
+                groups:
+                  enum: [pci]
+
         additionalProperties: false
 
     additionalProperties: false
@@ -54,7 +129,6 @@ required:
 additionalProperties: false
 
 examples:
-  # Pinmux controller node
   - |
     pinctrl {
       compatible = "ralink,rt2880-pinctrl";
-- 
2.37.2


