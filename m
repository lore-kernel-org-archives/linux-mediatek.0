Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C9C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 16:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KU5u1V27q/PoVWJjOSXm9YYh5HIsBdAVbyjY91pZpMU=; b=nxBqkPNgNzewCeKYRceVUnLekm
	mADgoqIpD3xbQ2aToeoETcX3nbAsTIR7Tt9Q+xEQUdM/g5OEcHVehVOaCmEgc+PyRw5VGOP9c7MAZ
	W1XCx7/0SHH7LldMTpB5Hh2+ohrN+moNKV/WTChIFNeOrwzb321toMskTD06spx3jaBCmTogym5qa
	7SJC+r6oW+W76UdPEPlx+mOyZYnJh8vrtY9flVdaQNOpT2fjQV6Z+hdfR0O1DY+8TulizOImExS1S
	9KSarHUP9OILVPrE7qgSqdzDhxigzHKXVq58jMzxF+BWq/hzFgKzpwo4qyRUOskUJLZNWg+sf95cx
	Rl/VqRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBeRA-007K9f-NA; Sat, 31 Dec 2022 16:10:20 +0000
Received: from sender4-op-o17.zoho.com ([136.143.188.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBeQ9-007Jd7-U9; Sat, 31 Dec 2022 16:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672502955; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XxfJqz5VoAkZa1Memu+XDAgQLI83WIOrwYwgpo8UUZXjQhrX1qMhlONeXAhwltb5sOUyCFQOtckbbcr80zDWxFdZzVblwbL/RtgwSCk5eAOd7pGbg7ifkmt5Jd+CUqWiKJuI0A+DSqERQdeQJwA0VXUZ0/HAJ75joSUJquUMwB4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672502955; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=KU5u1V27q/PoVWJjOSXm9YYh5HIsBdAVbyjY91pZpMU=; 
	b=dpXMIGRRjiSLl1GDL+unNIuazUMzAzvA8KxoQ5qnmQ0ZxIFBnAYygj6gVSbS3mO7AKZWyBiuA1osiRo+k3LzC+matej369Kgr+s2QtK9oZpqCy4vg8qnGko7aAKiiVmBdmyfVs6DnJJRTOQ0T4NP5RTbtvQPL5PMw7sZnONBsho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672502955;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=KU5u1V27q/PoVWJjOSXm9YYh5HIsBdAVbyjY91pZpMU=;
	b=V7U8yWguBhnlrSMsFp03Hyw31y2ycQgpafIMTy+PforNApPwon2nc24/pqq/WQjV
	+C78g1F1ORIHeW0ecXmOlGimlOQU4BDQ4YfYHnyg6zty4s7UmB5oInFfBs0T9DGPMGu
	soX7GweSDWUnKxm2PE7pdeJopKy4XkbLmXsuvH7M=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1672502954732843.0850685564961; Sat, 31 Dec 2022 08:09:14 -0800 (PST)
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
Subject: [PATCH v3 6/6] dt-bindings: pinctrl: rt3883: add proper function muxing binding
Date: Sat, 31 Dec 2022 19:08:49 +0300
Message-Id: <20221231160849.40544-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221231160849.40544-1-arinc.unal@arinc9.com>
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_080918_123489_3A9DD304 
X-CRM114-Status: UNSURE (   9.43  )
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
 .../pinctrl/ralink,rt3883-pinctrl.yaml        | 205 +++++++++++++++++-
 1 file changed, 198 insertions(+), 7 deletions(-)

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


