Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB23C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 17:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dbczhAKVi4Hykb1wlA1ycycEO2TZRz+gbzM1C9c2b1U=; b=IMKAjMoTlii/XN
	ot6MEzpIMQ5zG2902onOZ2tYU7t7jxlA4MGCLjU3/gH9x6UIHrfBDRBY2tTs8EDchemsaS6Q89Hgv
	/6YqD0KlN3Aen/fosdAz48sUpsDHqoYZsamGMt1pQPem3RoVwsOhMH1MRZHen0foFbTN8cM5X2ara
	o9TA1lhPbj9d65fa/BEJ22vsqcj+Wzn5bbDYV6xz1diKqLgi8vRPmRryW6AT3mbce1znezutANH1S
	zEy3klzarxVwkcIxRu5+InD5R8hSrgzsM/4L/YwjnEzJY9gRzA95rLaDRiBqOnzzXU6HNwBG/lE9G
	8HXBIRoPEpgxpqm3OaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muI0e-0057G8-D0; Mon, 06 Dec 2021 17:42:40 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muI04-0056yO-Nn; Mon, 06 Dec 2021 17:42:06 +0000
Received: by mail-oi1-f174.google.com with SMTP id m6so22821717oim.2;
 Mon, 06 Dec 2021 09:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9R+vJEgrwKCKc8Zm3ZovBeKlL5zZ/+qKm2q4AQLvyzU=;
 b=yssseo4D1Pyjgq87xi/PspaDdhSuv/FQZRYJ2Y6JzX66bm2lNeUc4FSbXodD/Llkh8
 9KQse+bwt/cf9PNN3op8nDqCVCYDYgi4PieI8ZkwhkBFwwSh0BTBvh7znT+VXmxb4il5
 JMp80g4u2ejFLulzJg3b7T4rjbQZyeHgmp/Jl5rdkRhIoUiOVt42weoRfZYkyhmtSLKK
 +oyA+fDDRu7IeYHFSmsAgx+rP34jYVaIrU2hcLEvGw8jEESDKHM6oSkY+Spb2Ft9Nxge
 6GXPeHHQbQNiL1gKDYTrxeD96K2dKfN8j+aWH3ujAZ1lJldJfiMEUH6S4d0RxXehB2nB
 m5/w==
X-Gm-Message-State: AOAM533qtIu/mnPkSVyT8qm9+JL4M0yXZSGwK3FuJgn6nphTEASzAsEl
 ZMJGj0GfFQ5r/IhfxcA3wA==
X-Google-Smtp-Source: ABdhPJzAT9mXvNX4OTFUIQkz1DBSUGY1X4B+luSF7sEsnAPRca55Q4WZLKK5Jo49VEm1FcPc1Da3mg==
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr25253142oiw.64.1638812523325; 
 Mon, 06 Dec 2021 09:42:03 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id w5sm2240534otk.70.2021.12.06.09.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 09:42:02 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mmc: Add missing properties used in examples
Date: Mon,  6 Dec 2021 11:42:00 -0600
Message-Id: <20211206174201.2297265-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_094204_817397_A99FDEA8 
X-CRM114-Status: GOOD (  14.50  )
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

When 'unevaluatedProperties' support is enabled, the following warnings
are generated in the mmc bindings:

Documentation/devicetree/bindings/mmc/mtk-sd.example.dt.yaml: mmc@11230000: Unevaluated properties are not allowed ('reg', 'interrupts' were unexpected)
Documentation/devicetree/bindings/mmc/sdhci-am654.example.dt.yaml: mmc@4f80000: Unevaluated properties are not allowed ('sdhci-caps-mask' was unexpected)
Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.example.dt.yaml: mmc@5a400000: Unevaluated properties are not allowed ('dma-names', 'dmas' were unexpected)
Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@80126000: Unevaluated properties are not allowed ('dmas', 'dma-names' were unexpected)
Documentation/devicetree/bindings/mmc/arasan,sdhci.example.dt.yaml: mmc@80420000: Unevaluated properties are not allowed ('resets' was unexpected)
Documentation/devicetree/bindings/mmc/arm,pl18x.example.dt.yaml: mmc@52007000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
Documentation/devicetree/bindings/clock/imx8qxp-lpcg.example.dt.yaml: mmc@5b010000: Unevaluated properties are not allowed ('power-domains' was unexpected)

Add the missing properties as necessary. For pl18x, drop interrupt-names
as there isn't any use of it when there are 2 interrupts.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml  | 3 +++
 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml     | 9 ++++++++-
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 3 +++
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml        | 6 ++++++
 Documentation/devicetree/bindings/mmc/sdhci-am654.yaml   | 2 ++
 .../devicetree/bindings/mmc/socionext,uniphier-sd.yaml   | 6 ++++++
 6 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
index de6f076e0ece..83be9e93d221 100644
--- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml
@@ -118,6 +118,9 @@ properties:
   phy-names:
     const: phy_arasan
 
+  resets:
+    maxItems: 1
+
   arasan,soc-ctl-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 47595cb483be..fbc866d9bb2f 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -60,6 +60,14 @@ properties:
     minItems: 1
     maxItems: 2
 
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
   power-domains: true
 
   resets:
@@ -213,7 +221,6 @@ examples:
       arm,primecell-periphid = <0x10153180>;
       reg = <0x52007000 0x1000>;
       interrupts = <49>;
-      interrupt-names = "cmd_irq";
       clocks = <&rcc 0>;
       clock-names = "apb_pclk";
       resets = <&rcc 1>;
diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 19621a2f8beb..8d5cef0d3039 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -116,6 +116,9 @@ properties:
       - const: ahb
       - const: per
 
+  power-domains:
+    maxItems: 1
+
   pinctrl-names:
     oneOf:
       - minItems: 3
diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 82768a807294..faf89b0c918f 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -36,6 +36,9 @@ properties:
           - const: mediatek,mt8195-mmc
           - const: mediatek,mt8183-mmc
 
+  reg:
+    maxItems: 1
+
   clocks:
     description:
       Should contain phandle for the clock feeding the MMC controller.
@@ -62,6 +65,9 @@ properties:
       - const: axi_cg
       - const: ahb_cg
 
+  interrupts:
+    maxItems: 1
+
   pinctrl-names:
     items:
       - const: default
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
index 224303f5b913..9fbf16b3bc8d 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
@@ -48,6 +48,8 @@ properties:
       - const: clk_ahb
       - const: clk_xin
 
+  sdhci-caps-mask: true
+
   # PHY output tap delays:
   # Used to delay the data valid window and align it to the sampling clock.
   # Binding needs to be provided for each supported speed mode otherwise the
diff --git a/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml b/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
index 56f9ff12742d..a586fad0a46b 100644
--- a/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/socionext,uniphier-sd.yaml
@@ -26,6 +26,12 @@ properties:
   clocks:
     maxItems: 1
 
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx-tx
+
   reset-names:
     description: |
       There are three reset signals at maximum
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
