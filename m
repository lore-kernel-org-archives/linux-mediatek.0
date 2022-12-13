Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD58C10F1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMCqtNkCDMAALe0laloGdZppysjerVyp2JF3K0Vafs8=; b=Jx5OV1uMrfraczT4LrCpTrlx/F
	OYE0xa4mOIkY25U5q/TYbGtqEP5I0fWaxnRdkM9dyPM+XSk/kGL3hIkHmR9qcKznWxq5+I3KB4c3w
	Pj7eAP7dy8MVlioiha0jhfi+eDPy/q7+tjejksJeTxWrHA6nGisu8JCkg/sqTkVq620f2jh3Led28
	VbFRn5oD6iz2yvLAcE9Avp0tXe2f3syiRX0On5Wp9QBMwPjUTGKUaUrvTVBf99M413MOTGovvFI2P
	WC8VU6cjOl9B2KgOdmTxF02cGFZkYGebD/eO1O0EMDQuZaAVbCJcBfgzjyVgao88xaSZGmbPCineA
	93zKy0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p54zU-0003Yf-NK; Tue, 13 Dec 2022 13:06:36 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p54y4-00024p-SD; Tue, 13 Dec 2022 13:05:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670936705; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gq3vGNatkGEU0LcJRvYYrhMd+fJNmtUX2WK2ZKHpF2UqGUsL1c+ucqBvuet8MJjZ5sZ5aIeLb1l09hKrfLOh9BMkkpEObUzY/chIv5yLAHEqXF18Rh9jx/otvimMwqWg9sWrD3WOqbaOt/4Ll85Ni4z08r+Szo7ihAv1ZiTa3ec=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670936705; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LMCqtNkCDMAALe0laloGdZppysjerVyp2JF3K0Vafs8=; 
	b=eJwAdiYN2gVDh0zrdskCJBh3GOoOowl5oXh6d1+S4AqOs3UCwFcx6AHlHJxZO55hmVsZps4a2iZT6lmP8iZzuIdTB+3WUFGoQ8oJsPevkKXILnnb5mHFDXuAT25Kt3muDKGdoOEewkEGprdjHOT5vljKT1zOswp7CWqg+kMudCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670936705;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=LMCqtNkCDMAALe0laloGdZppysjerVyp2JF3K0Vafs8=;
	b=MX6vTGhoKIYOt/3NHqTXWqm/bUVHKvJolJZuByz8VK8iiKyn3themwhGTjF+iUMI
	eMt2MnF17Mbw0ML/n+fo8lI53Mrr7jr2gsJm7roCc2zRIVBripBH/cW/LsUtiLJkQjy
	RNR/Q07pibNQpIc8LmmmWhYfFufqbAvG60d8IHmY=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1670936703464863.0120202888908; Tue, 13 Dec 2022 05:05:03 -0800 (PST)
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
Subject: [PATCH 4/6] dt-bindings: pinctrl: rt2880: add proper function muxing binding
Date: Tue, 13 Dec 2022 16:04:28 +0300
Message-Id: <20221213130430.172876-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221213130430.172876-1-arinc.unal@arinc9.com>
References: <20221213130430.172876-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_050508_961029_F485BD0D 
X-CRM114-Status: UNSURE (   9.82  )
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


