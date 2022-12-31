Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3F1C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMCqtNkCDMAALe0laloGdZppysjerVyp2JF3K0Vafs8=; b=GMY4AIbDa6EfOfmG+mkJcJ892I
	YSi/8CuMY/2PH/1uFhRafE7Jeyu4bHqDOeGhvnIqnD1DuaviIShNRyz3pFgQXY7ZTVxdI02/9AJMk
	At/Dyumwxv61MJ7Z6GiVIF8fEvxTYuFpz1rPuFkQQc4ZUDHMI98TX7iHcNBSaKnnaZCNBld/ZnpAy
	Nvmuo41aqnjRKsbtLLvTtZvQKRqX21oCKJwDufkLbLBt3sIbrPEhg8P+YeHblk8I6lj3kIWnHwRB3
	HflSsYLKJ2AwrEYFRnbfugM5g9wFaySoMiba6up5PZHxKtbdFvotD6Wlx01+lZCKnNybhDApGmxkA
	nKRdhCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBYHy-003Ad2-Mu; Sat, 31 Dec 2022 09:36:27 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBYHi-003ARU-8G; Sat, 31 Dec 2022 09:36:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672479367; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MYfqU9fPteG3qcdmAjyn7hJ/3I88UQWlFP3qzvSwxziXh+UjRnBszKJkoG0U6sQyHXyg7ny2FevTtS9YaQQj/aTsuCYVj98jgZRb0LYAzS0YycPmTubrNJsjIu0uXuIgCgKzIjMQM/VYcaXtycdRMTnN7+D7djhcRadpWBkuuw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672479367; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LMCqtNkCDMAALe0laloGdZppysjerVyp2JF3K0Vafs8=; 
	b=IqTeHQiPFEZAMjiJYq4h9Rzm6eCikZE4gT6xUWCVFn1owjTh5EIr9FzEloZJWvGHUKVMqswJDD9MCAdb8G+Fvl8ldAbFdvhYq+ry7ntrOMMqXwKEVurPPcc0szimm0hYJekL45rJsiHXzef2psrvZTLGkrRYEeNge5V0KjEVgkM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672479367;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=LMCqtNkCDMAALe0laloGdZppysjerVyp2JF3K0Vafs8=;
	b=cvVMMHIfZnBv4lTAq+r7TOylO9RqLjwzjk0u+gFiZjUS0NB3X414h/Hw0erjmT3v
	nQ77kasTgDfBV/19jTK9SbiXBS+i+2kqRVsyihPYWVRDtvkfh9tI9SQX1lYDlEj6hmm
	zDyyazPHRgBilXrBk5r3cje+YlYDiMpv30Bxcshw=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1672479365864777.7549060482384; Sat, 31 Dec 2022 01:36:05 -0800 (PST)
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
Subject: [PATCH v2 4/6] dt-bindings: pinctrl: rt2880: add proper function muxing binding
Date: Sat, 31 Dec 2022 12:35:44 +0300
Message-Id: <20221231093546.8881-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221231093546.8881-1-arinc.unal@arinc9.com>
References: <20221231093546.8881-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_013610_983207_CEDFD351 
X-CRM114-Status: UNSURE (   9.72  )
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
 .../pinctrl/ralink,rt2880-pinctrl.yaml        | 85 +++++++++++++++++--
 1 file changed, 79 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
index 56e5becabcfd..f59ddd5e6c2b 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml
@@ -29,18 +29,92 @@ patternProperties:
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
@@ -54,7 +128,6 @@ required:
 additionalProperties: false
 
 examples:
-  # Pinmux controller node
   - |
     pinctrl {
       compatible = "ralink,rt2880-pinctrl";
-- 
2.37.2


