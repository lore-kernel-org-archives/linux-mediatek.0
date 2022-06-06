Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D371C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0gPKn2UZ9Sxd1SDaO9BlPMnro3jxOOsfvx90q/yTS5I=; b=BkzxnJzRVJb74D
	5XFQ+ilxcjiVz8PrhmpLqw/MEjl2Q08n+8oY7Qb8Gb5q6pUfoLbj0I+fThy+zHi3Bix8u/xN9f+VB
	tSubWfInsPVUQG+92uwByKTF9o8l3QDmscQ3HO7bYT7lOhJzz0MBRzVnSqvTdkJxmH1U0ENebh5+d
	M9u4C6pLakh4k1xcI66JoVpz4F2EFub61sSPb+rqW7BfQERaebXDaRXj2Ui1pKykpz+tYl427L2ZH
	UN8AOQDIvSn+J5Gkwr7+0QHEhiQps0AdIa8yWqaGF4rIpmZGz76Kytz5eUREwci3ASIWC1zu6ZM0V
	IEFak/wGyeTpeeicof+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyKBj-002rJ1-3F; Mon, 06 Jun 2022 21:23:03 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyKBY-002rEn-1k; Mon, 06 Jun 2022 21:22:53 +0000
Received: by mail-il1-f173.google.com with SMTP id v7so12864063ilo.3;
        Mon, 06 Jun 2022 14:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6pf2B4FSJK7608hLvnpAYav2nA2W599D/4iTv+srNSs=;
        b=JL55DoShBrc46vOWf5k2U3A8+au/CdiHQ48EF7DweDGOo0mKarvI1Zt0KYVGKQJiQI
         6UKfTjoVt052RsdaoiPU4teoPf9P4ASMJVYSK1+wV8M8VMnVwf1XDCuWBNRCEX2Es/72
         eAoZ8wJMAZt85vHgKCOOFEtkCUZIPK82jek45F6aRXnwoH5iwxAblv8Ff47b4KaNHerZ
         pwbPOn7MVn7JaN/dUKSR6neX5P39bVLrBoBXs3tpshns+NlHxHWWF8cyVOFTjNtGBXdJ
         1Gm7sVBMnRv2fzxYiovncqSN+gv3nZHo84pvUb/x3gl+EteHxiMYaG/4XZQHXdeOXOHc
         61CQ==
X-Gm-Message-State: AOAM531aqnVlF5tl3AmG60dJM/3CRaSKOt0DxWBqsYo8vRJBs5ZTV8Gr
	s+S+UFT+xlEWthkUqV9WZLA1mnz0wA==
X-Google-Smtp-Source: ABdhPJxbW+UpGVuSMf9cBUMN4PnJ2WZCz877Z7QkEw9XczTlKcHB6fCUnLzyGocI9r1qnK6lDx99dg==
X-Received: by 2002:a05:6e02:1a81:b0:2d3:8754:f7ef with SMTP id k1-20020a056e021a8100b002d38754f7efmr14685460ilv.184.1654550569664;
        Mon, 06 Jun 2022 14:22:49 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.251])
        by smtp.googlemail.com with ESMTPSA id o1-20020a056e02102100b002d3ca0d55d0sm6600600ilj.48.2022.06.06.14.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 14:22:49 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: ralink: Fix 'enum' lists with duplicate entries
Date: Mon,  6 Jun 2022 16:22:39 -0500
Message-Id: <20220606212239.1360877-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_142252_141117_A52F413D 
X-CRM114-Status: UNSURE (   9.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There's no reason to list the same value twice in an 'enum'. This was fixed
treewide in commit c3b006819426 ("dt-bindings: Fix 'enum' lists with
duplicate entries"), but this one got added in the merge window.

A meta-schema change will catch future cases.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/ralink,mt7620-pinctrl.yaml        | 26 +++++++++++-------
 .../pinctrl/ralink,rt305x-pinctrl.yaml        | 27 +++++++++----------
 2 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
index 4d820df24b89..6f17f3991640 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
@@ -32,31 +32,37 @@ patternProperties:
           groups:
             description: The pin group to select.
             enum: [
+              # common
+              i2c, spi, wdt,
+
               # For MT7620 SoC
-              ephy, i2c, mdio, nd_sd, pa, pcie, rgmii1, rgmii2, spi, spi refclk,
-              uartf, uartlite, wdt, wled,
+              ephy, mdio, nd_sd, pa, pcie, rgmii1, rgmii2, spi refclk,
+              uartf, uartlite, wled,
 
               # For MT7628 and MT7688 SoCs
-              gpio, i2c, i2s, p0led_an, p0led_kn, p1led_an, p1led_kn, p2led_an,
+              gpio, i2s, p0led_an, p0led_kn, p1led_an, p1led_kn, p2led_an,
               p2led_kn, p3led_an, p3led_kn, p4led_an, p4led_kn, perst, pwm0,
-              pwm1, refclk, sdmode, spi, spi cs1, spis, uart0, uart1, uart2,
-              wdt, wled_an, wled_kn,
+              pwm1, refclk, sdmode, spi cs1, spis, uart0, uart1, uart2,
+              wled_an, wled_kn,
             ]
 
           function:
             description: The mux function to select.
             enum: [
+              # common
+              gpio, i2c, refclk, spi,
+
               # For MT7620 SoC
-              ephy, gpio, gpio i2s, gpio uartf, i2c, i2s uartf, mdio, nand, pa,
-              pcie refclk, pcie rst, pcm gpio, pcm i2s, pcm uartf, refclk,
-              rgmii1, rgmii2, sd, spi, spi refclk, uartf, uartlite, wdt refclk,
+              ephy, gpio i2s, gpio uartf, i2s uartf, mdio, nand, pa,
+              pcie refclk, pcie rst, pcm gpio, pcm i2s, pcm uartf,
+              rgmii1, rgmii2, sd, spi refclk, uartf, uartlite, wdt refclk,
               wdt rst, wled,
 
               # For MT7628 and MT7688 SoCs
-              antenna, debug, gpio, i2c, i2s, jtag, p0led_an, p0led_kn,
+              antenna, debug, i2s, jtag, p0led_an, p0led_kn,
               p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
               p4led_an, p4led_kn, pcie, pcm, perst, pwm, pwm0, pwm1, pwm_uart2,
-              refclk, rsvd, sdxc, sdxc d5 d4, sdxc d6, sdxc d7, spi, spi cs1,
+              rsvd, sdxc, sdxc d5 d4, sdxc d6, sdxc d7, spi cs1,
               spis, sw_r, uart0, uart1, uart2, utif, wdt, wled_an, wled_kn, -,
             ]
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
index 425401c54269..f602a5d6e13a 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml
@@ -33,32 +33,29 @@ patternProperties:
           groups:
             description: The pin group to select.
             enum: [
+              # common
+              i2c, jtag, led, mdio, rgmii, spi, spi_cs1, uartf, uartlite,
+
               # For RT3050, RT3052 and RT3350 SoCs
-              i2c, jtag, mdio, rgmii, sdram, spi, uartf, uartlite,
+              sdram,
 
               # For RT3352 SoC
-              i2c, jtag, led, lna, mdio, pa, rgmii, spi, spi_cs1, uartf,
-              uartlite,
-
-              # For RT5350 SoC
-              i2c, jtag, led, spi, spi_cs1, uartf, uartlite,
+              lna, pa
             ]
 
           function:
             description: The mux function to select.
             enum: [
+              # common
+              gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led, mdio,
+              pcm gpio, pcm i2s, pcm uartf, rgmii, spi, spi_cs1, uartf,
+              uartlite, wdg_cs1,
+
               # For RT3050, RT3052 and RT3350 SoCs
-              gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, mdio, pcm gpio,
-              pcm i2s, pcm uartf, rgmii, sdram, spi, uartf, uartlite,
+              sdram,
 
               # For RT3352 SoC
-              gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led, lna, mdio,
-              pa, pcm gpio, pcm i2s, pcm uartf, rgmii, spi, spi_cs1, uartf,
-              uartlite, wdg_cs1,
-
-              # For RT5350 SoC
-              gpio, gpio i2s, gpio uartf, i2c, i2s uartf, jtag, led, pcm gpio,
-              pcm i2s, pcm uartf, spi, spi_cs1, uartf, uartlite, wdg_cs1,
+              lna, pa
             ]
 
         required:
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
