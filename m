Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C01C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NWg4L4e7gMtf1qz2fIgp9UPi7DAAzsBAd4S1EFIjMA=; b=hMcMQwcS8dGW8w2vd9Z6Ly8iWR
	uDbCbH2cFj6rUeSTMW747rNGQ5gonFHQsF7i0zG1N09lJTvTTPLCxobk7L5rkwXu8cbLwBgLRxmED
	5Ux08BVtJiNHFGnTiBjAG2j/DrxDoq51qC7OPYRtXaBnAwHnI1+hbLv6kBpUIEqgQ8FuTmcgVETx+
	WKzKb83WReuvA41O/meFN03ekvKB4I7dUe/5TFlc62S42n64YOus/qqxVXF0VVGHgYO3q++SAUWZo
	N1+Bj2MP5RomkkHy8LVwOsyoPay6GRnkquuTBsSBhgs2ypCGl9ICOc66FYJZ5lStg8WiugocpyiFg
	+kBWMZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p54ym-0002rz-NB; Tue, 13 Dec 2022 13:05:52 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p54xz-000237-6L; Tue, 13 Dec 2022 13:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670936701; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UN28AEnvakxlu8HdN3GamGKdatjoPskFemz4qp7FXIoUWsMnz5Ejz02QuLt65Fy+2mNdD2650ZJ7ALMkwatu1usyfAWCjBLlvFsdzobIT/xl0S7bn/bwxybM9IIXrxuRjqW3w+GT6Ftm6nWUl74VRsowYcBloDy8X9I+t2FTWpQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670936701; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=4NWg4L4e7gMtf1qz2fIgp9UPi7DAAzsBAd4S1EFIjMA=; 
	b=f2FyywFOuR132lONRkp8mPMbj1gBq+bybkO8h4KwbZxMIlcnEJKiMf7WMxInVIyBkqaG1nO01I+rGntnY2RFHY3vWOxrNHsU7dW+nDR66NK/hJ7afnp74Kl2/DoPTz9zNXy1WP8W4xfreVr0wozEOJGrjuU9ukN5tvDd60oCwuQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670936701;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=4NWg4L4e7gMtf1qz2fIgp9UPi7DAAzsBAd4S1EFIjMA=;
	b=fQPr+zzET7V9sX9DED8LDNm4VGcd2CH5a+l8hPPLGH+UNmbyyNWkzp1Nc1a+Wo5o
	YpBKxoyl3ncSK8SoaY9pc0xvQ7638mKwPWPSRFSoqlEy8qB+P/eIB3L4YzAa25w+oEd
	CHYynM5tI5ycqoFgy8Az5EMnzkklG3WMubUSGWEc=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1670936699911841.8828768624544; Tue, 13 Dec 2022 05:04:59 -0800 (PST)
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
Subject: [PATCH 3/6] dt-bindings: pinctrl: mt7621: add proper function muxing binding
Date: Tue, 13 Dec 2022 16:04:27 +0300
Message-Id: <20221213130430.172876-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221213130430.172876-1-arinc.unal@arinc9.com>
References: <20221213130430.172876-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_050503_308792_9C7312C5 
X-CRM114-Status: UNSURE (   9.40  )
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
 .../pinctrl/ralink,mt7621-pinctrl.yaml        | 204 +++++++++++++++++-
 1 file changed, 197 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
index 61e5c847e8c8..0efb03f1d88e 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -29,21 +29,212 @@ patternProperties:
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
@@ -57,7 +248,6 @@ required:
 additionalProperties: false
 
 examples:
-  # Pinmux controller node
   - |
     pinctrl {
       compatible = "ralink,mt7621-pinctrl";
-- 
2.37.2


