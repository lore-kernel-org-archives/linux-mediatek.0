Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F98C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XS8de5WGClxnlsQXckriVJ9xTtd7GStdGuk7V9f4i0=; b=B8jHkN0cAB4LoQOeMjs8ZsTEh5
	M9J7/h1EUYqM7z1wQ8eo8HLCJSTJU0aua3KxnNAVQE5hNvS7kNfWyCEeFuvtoQiP9DmXyiGSmmVRs
	Sk1I2/WuVF14JBtOLihE0D3Hnac3CNIcvFBCrM/T8wn+C9G5QgkYfs6Um093112cvSVZe5V7zvq0j
	l9T0yxW1LwP9S2DUM6/M/rVCHclXQNon+WMoLAF/Qw1vBAkQQV6ZQrWDDnmUBVYWjHZ2wyRFsD3Ul
	s+MQDXr+/mx4TAUKonDTw+pvxlGGSjDkt5obyee+qXK51EdULByXxl1pNsEIyUPWcefYGFZYFMGPX
	dNyVtwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBYID-003Anz-D5; Sat, 31 Dec 2022 09:36:41 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBYHi-003AQz-6t; Sat, 31 Dec 2022 09:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672479361; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=luiHZC0bVfVG5LwWK7gPv7bSrYlWjeRaK/ueKAWXBb74inqec+Yy+gdUjLnBKPWmyVI+tEeRvfpWt3irMAoQl14ChV7qEcjWzmFtW6Jfagynivg12WKF5oY75RVDpnsJ76YZHzEYqkM6HDmVnTuPOnd1buR89wgW9zLMIBwEsco=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672479361; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1XS8de5WGClxnlsQXckriVJ9xTtd7GStdGuk7V9f4i0=; 
	b=edEIJlWP4f/zDlAnMxP71tjwldQOVw7p325ckgc2KtOHBLoTWC1nTVSjwYVtWtt8J6uCmbypxp3VR7QJhr9DK+zmpPvJiX8ZpHqIHiANGNJ/CFM732s4Osy8AWb8VLxhtTk3ceFNg3ihW1IS0vyxEd3CuAbv4I2XDoAXl82mO7k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672479361;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=1XS8de5WGClxnlsQXckriVJ9xTtd7GStdGuk7V9f4i0=;
	b=kC7GWCek2tZeY3IsU9lv2vkfCnNMoXRSFp/PYbH1MCZ97LIEoRhc26h5KtywE5z2
	qA5Ips0nbzZRl6uJNah86jqAxK4SOODibyQstANHP1jP4iql126pdcjeBOCUeSoPmrH
	QKVT6yIGTAll2NOVZhXWogtbvmoPqWUOGxLmjDB8=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1672479359911545.80827564642; Sat, 31 Dec 2022 01:35:59 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	erkin.bozoglu@xeront.com
Subject: [PATCH v2 2/6] dt-bindings: pinctrl: mt7620: add proper function muxing binding
Date: Sat, 31 Dec 2022 12:35:42 +0300
Message-Id: <20221231093546.8881-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221231093546.8881-1-arinc.unal@arinc9.com>
References: <20221231093546.8881-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_013610_999953_5F89B1AD 
X-CRM114-Status: UNSURE (   8.97  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/ralink,mt7620-pinctrl.yaml        | 632 +++++++++++++++++-
 1 file changed, 596 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index 6f17f3991640..06880c80ba80 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -29,47 +29,608 @@ patternProperties:
         $ref: pinmux-node.yaml#
 
         properties:
-          groups:
-            description: The pin group to select.
-            enum: [
-              # common
-              i2c, spi, wdt,
-
-              # For MT7620 SoC
-              ephy, mdio, nd_sd, pa, pcie, rgmii1, rgmii2, spi refclk,
-              uartf, uartlite, wled,
-
-              # For MT7628 and MT7688 SoCs
-              gpio, i2s, p0led_an, p0led_kn, p1led_an, p1led_kn, p2led_an,
-              p2led_kn, p3led_an, p3led_kn, p4led_an, p4led_kn, perst, pwm0,
-              pwm1, refclk, sdmode, spi cs1, spis, uart0, uart1, uart2,
-              wled_an, wled_kn,
-            ]
-
           function:
-            description: The mux function to select.
-            enum: [
-              # common
-              gpio, i2c, refclk, spi,
-
-              # For MT7620 SoC
-              ephy, gpio i2s, gpio uartf, i2s uartf, mdio, nand, pa,
-              pcie refclk, pcie rst, pcm gpio, pcm i2s, pcm uartf,
-              rgmii1, rgmii2, sd, spi refclk, uartf, uartlite, wdt refclk,
-              wdt rst, wled,
-
-              # For MT7628 and MT7688 SoCs
-              antenna, debug, i2s, jtag, p0led_an, p0led_kn,
-              p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
-              p4led_an, p4led_kn, pcie, pcm, perst, pwm, pwm0, pwm1, pwm_uart2,
-              rsvd, sdxc, sdxc d5 d4, sdxc d6, sdxc d7, spi cs1,
-              spis, sw_r, uart0, uart1, uart2, utif, wdt, wled_an, wled_kn, -,
-            ]
+            description:
+              A string containing the name of the function to mux to the group.
+            anyOf:
+              - description: For MT7620 SoC
+                enum: [ephy, gpio, gpio i2s, gpio uartf, i2c, i2s uartf, mdio, nand, pa,
+                       pcie refclk, pcie rst, pcm gpio, pcm i2s, pcm uartf, refclk,
+                       rgmii1, rgmii2, sd, spi, spi refclk, uartf, uartlite, wdt refclk,
+                       wdt rst, wled]
+
+              - description: For MT7628 and MT7688 SoCs
+                enum: [antenna, debug, gpio, i2c, i2s, jtag, p0led_an, p0led_kn,
+                       p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
+                       p4led_an, p4led_kn, pcie, pcm, perst, pwm, pwm0, pwm1, pwm_uart2,
+                       refclk, rsvd, sdxc, sdxc d5 d4, sdxc d6, sdxc d7, spi, spi cs1,
+                       spis, sw_r, uart0, uart1, uart2, utif, wdt, wled_an, wled_kn, -]
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
+                  const: antenna
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+
+          - if:
+              properties:
+                function:
+                  const: debug
+            then:
+              properties:
+                groups:
+                  enum: [i2c]
+
+          - if:
+              properties:
+                function:
+                  const: ephy
+            then:
+              properties:
+                groups:
+                  enum: [ephy]
+
+          - if:
+              properties:
+                function:
+                  const: gpio
+            then:
+              properties:
+                groups:
+                  oneOf:
+                    - description: For MT7620 SoC
+                      enum: [ephy, i2c, mdio, nd_sd, pa, pcie, rgmii1, rgmii2,
+                             spi, spi refclk, uartf, uartlite, wdt, wled]
+
+                    - description: For MT7628 and MT7688 SoCs
+                      enum: [gpio, i2c, i2s, p0led_an, p0led_kn, p1led_an,
+                             p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
+                             p4led_an, p4led_kn, perst, pwm0, pwm1, refclk,
+                             sdmode, spi, spi cs1, spis, uart0, uart1, uart2,
+                             wdt, wled_an, wled_kn]
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
+                  const: i2s
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
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
+                  enum: [p0led_an, p0led_kn, p1led_an, p1led_kn, p2led_an,
+                         p2led_kn, p3led_an, p3led_kn, p4led_an, p4led_kn,
+                         sdmode]
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
+                  const: nand
+            then:
+              properties:
+                groups:
+                  enum: [nd_sd]
+
+          - if:
+              properties:
+                function:
+                  const: p0led_an
+            then:
+              properties:
+                groups:
+                  enum: [p0led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p0led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p0led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: p1led_an
+            then:
+              properties:
+                groups:
+                  enum: [p1led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p1led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p1led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: p2led_an
+            then:
+              properties:
+                groups:
+                  enum: [p2led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p2led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p2led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: p3led_an
+            then:
+              properties:
+                groups:
+                  enum: [p3led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p3led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p3led_kn]
+
+          - if:
+              properties:
+                function:
+                  const: p4led_an
+            then:
+              properties:
+                groups:
+                  enum: [p4led_an]
+
+          - if:
+              properties:
+                function:
+                  const: p4led_kn
+            then:
+              properties:
+                groups:
+                  enum: [p4led_kn]
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
+                  const: pcie
+            then:
+              properties:
+                groups:
+                  enum: [gpio]
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
+                  enum: [i2s]
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
+                  const: perst
+            then:
+              properties:
+                groups:
+                  enum: [perst]
+
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [uart1, uart2]
+
+          - if:
+              properties:
+                function:
+                  const: pwm0
+            then:
+              properties:
+                groups:
+                  enum: [pwm0]
+
+          - if:
+              properties:
+                function:
+                  const: pwm1
+            then:
+              properties:
+                groups:
+                  enum: [pwm1]
+
+          - if:
+              properties:
+                function:
+                  const: pwm_uart2
+            then:
+              properties:
+                groups:
+                  enum: [spis]
+
+          - if:
+              properties:
+                function:
+                  const: refclk
+            then:
+              properties:
+                groups:
+                  oneOf:
+                    - description: For MT7620 SoC
+                      enum: [mdio]
+
+                    - description: For MT7628 and MT7688 SoCs
+                      enum: [gpio, refclk, spi cs1]
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
+                  const: rsvd
+            then:
+              properties:
+                groups:
+                  enum: [p0led_an, p0led_kn, wled_an, wled_kn]
+
+          - if:
+              properties:
+                function:
+                  const: sd
+            then:
+              properties:
+                groups:
+                  enum: [nd_sd]
+
+          - if:
+              properties:
+                function:
+                  const: sdxc
+            then:
+              properties:
+                groups:
+                  enum: [sdmode]
+
+          - if:
+              properties:
+                function:
+                  const: sdxc d5 d4
+            then:
+              properties:
+                groups:
+                  enum: [uart2]
+
+          - if:
+              properties:
+                function:
+                  const: sdxc d6
+            then:
+              properties:
+                groups:
+                  enum: [pwm1]
+
+          - if:
+              properties:
+                function:
+                  const: sdxc d7
+            then:
+              properties:
+                groups:
+                  enum: [pwm0]
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
+                  const: spi cs1
+            then:
+              properties:
+                groups:
+                  enum: [spi cs1]
+
+          - if:
+              properties:
+                function:
+                  const: spi refclk
+            then:
+              properties:
+                groups:
+                  enum: [spi refclk]
+
+          - if:
+              properties:
+                function:
+                  const: spis
+            then:
+              properties:
+                groups:
+                  enum: [spis]
+
+          - if:
+              properties:
+                function:
+                  const: sw_r
+            then:
+              properties:
+                groups:
+                  enum: [uart1]
+
+          - if:
+              properties:
+                function:
+                  const: uart0
+            then:
+              properties:
+                groups:
+                  enum: [uart0]
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
+                  const: utif
+            then:
+              properties:
+                groups:
+                  enum: [p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an,
+                         p3led_kn, p4led_an, p4led_kn, pwm0, pwm1, sdmode, spis]
+
+          - if:
+              properties:
+                function:
+                  const: wdt
+            then:
+              properties:
+                groups:
+                  enum: [wdt]
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
+          - if:
+              properties:
+                function:
+                  const: wled
+            then:
+              properties:
+                groups:
+                  enum: [wled]
+
+          - if:
+              properties:
+                function:
+                  const: wled_an
+            then:
+              properties:
+                groups:
+                  enum: [wled_an]
+
+          - if:
+              properties:
+                function:
+                  const: wled_kn
+            then:
+              properties:
+                groups:
+                  enum: [wled_kn]
+
+          - if:
+              properties:
+                function:
+                  const: "-"
+            then:
+              properties:
+                groups:
+                  enum: [i2c, spi cs1, uart0]
+
         additionalProperties: false
 
     additionalProperties: false
@@ -83,7 +644,6 @@ required:
 additionalProperties: false
 
 examples:
-  # Pinmux controller node
   - |
     pinctrl {
       compatible = "ralink,mt7620-pinctrl";
-- 
2.37.2


