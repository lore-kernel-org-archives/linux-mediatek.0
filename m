Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF25C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 16:54:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C635620708
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 16:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+oHF6JE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM6mlUDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C635620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oObFX/A8cGZhWsKYKtIE8QO9bbQlfuiQgURfDMk4Ug=; b=m+oHF6JEEp7DrHQJP5KN6eyIug
	vXXMSXkmq7/yFjD96ekRGTEpab6fZAd8fsD68CJ837yKb/9HnHvAzXPR947dr3Gk+cuN8LPVt15HI
	JLX9Lw8OAKFP/xjnM3iRYwJiAhgWAVhEsb8BgAhtoi5Cg85BgoKf88ukeEKMTWd8/UynI0WJHO066
	jJcgfcEAXtE7RCMmpYyB/90AI9oMz9ijZPcqanXZILu9Gb94CIic4JLS9SlhQBgaM+iRA5+0gE2nq
	lmwrtktelE4gmmkpzwIe9myEShMEcfbB0w4ZqZiipHnNZ/PvzK9MGKJtHcFQabipBK/d5bVkYpoYa
	qhZiRVQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIxAb-0007h7-4l; Thu, 17 Sep 2020 16:54:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIxAV-0007e6-Vy; Thu, 17 Sep 2020 16:54:01 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E0AE2078D;
 Thu, 17 Sep 2020 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361639;
 bh=GtFv1bQ2EU3MwleV0JE6I8vR62sturzYAF1oB7cn/SA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YM6mlUDG5hyxYr2PjQI9LyR9rTPvZdnNnIn9xvWCqJYk3nDtgx1zXa2CAXZWc9yob
 /G/0a0BLDvjNoWd2WFFzBWb3eT/SflJkTQOhMvxAAeOFo6x5eFDXyOkI4psvphsJUd
 mLsI8+P+uKyKX+cvfUUutZdxrHH+134Z22gFqYwI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Anson Huang <Anson.Huang@nxp.com>, Sungbo Eo <mans0n@gorani.run>,
 Stefan Agner <stefan@agner.ch>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 - <patches@opensource.cirrus.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Andy Teng <andy.teng@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sricharan R <sricharan@codeaurora.org>,
 Chris Brandt <chris.brandt@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 02/13] dt-bindings: gpio: include common schema in GPIO
 controllers
Date: Thu, 17 Sep 2020 18:52:50 +0200
Message-Id: <20200917165301.23100-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917165301.23100-1-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_125400_210528_33AE5496 
X-CRM114-Status: GOOD (  15.74  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Include the common GPIO schema in GPIO controllers to be sure all common
properties are properly validated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix gpio-mxs.yaml
2. Add snps,dw-apb-gpio.yaml
---
 .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml         | 3 +++
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml      | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-mxs.yaml          | 4 ++++
 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml      | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-rda.yaml          | 3 +++
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml        | 3 +++
 Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml         | 1 +
 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml | 3 +++
 Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml    | 3 +++
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 3 +++
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml       | 3 +++
 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml  | 3 +++
 .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml     | 3 +++
 .../devicetree/bindings/gpio/xylon,logicvc-gpio.yaml          | 3 +++
 14 files changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
index c213cb9ddb9f..1ac69b9c03f9 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
@@ -13,6 +13,9 @@ description: |
   This controller is the Chip Common A GPIO present on a number of Broadcom
   switch ASICs with integrated SoCs.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: brcm,iproc-gpio-cca
diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index de0b9b5f6a70..737756e081fb 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -9,6 +9,9 @@ title: Freescale i.MX/MXC GPIO controller
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index dfa1133f8c5e..bd0c4f329625 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -34,6 +34,10 @@ properties:
 patternProperties:
   "gpio@[0-9]+$":
     type: object
+
+    allOf:
+      - $ref: gpio-common.yaml#
+
     properties:
       compatible:
         enum:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
index 338c5312a106..69b12041c893 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -9,6 +9,9 @@ title: PCA9570 I2C GPO expander
 maintainers:
   - Sungbo Eo <mans0n@gorani.run>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
index 6ece555f074f..d70c99f463c2 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
@@ -9,6 +9,9 @@ title: RDA Micro GPIO controller
 maintainers:
   - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: rda,8810pl-gpio
diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 6ac5a78ad3da..82f3e4b407d1 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -17,6 +17,9 @@ description: |
   Note: Each GPIO port should have an alias correctly numbered in "aliases"
   node.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
index 4db3b8a3332c..e2b7d2d133a8 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
@@ -12,6 +12,7 @@ maintainers:
   - Rob Herring <robh+dt@kernel.org>
 
 allOf:
+  - $ref: gpio-common.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
index 32a566ec3558..2eee374e8396 100644
--- a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
@@ -13,6 +13,9 @@ description: |
   Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
   gpio controller to control 5 gpios on the chip.
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
index 8bdef812c87c..845689807678 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
@@ -9,6 +9,9 @@ title: Renesas EMMA Mobile General Purpose I/O Interface
 maintainers:
   - Magnus Damm <magnus.damm@gmail.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     const: renesas,em-gio
diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index 5026662e4508..c116000d579f 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -9,6 +9,9 @@ title: Renesas R-Car General-Purpose Input/Output Ports (GPIO)
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index a0efd8dc2538..f2d93b40fc7e 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Yash Shah <yash.shah@sifive.com>
   - Paul Walmsley <paul.walmsley@sifive.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   compatible:
     items:
diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
index b391cc1b4590..459aafe5fd47 100644
--- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -49,6 +49,9 @@ properties:
 patternProperties:
   "^gpio-(port|controller)@[0-9a-f]+$":
     type: object
+    allOf:
+      - $ref: gpio-common.yaml#
+
     properties:
       compatible:
         const: snps,dw-apb-gpio-port
diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
index c58ff9a94f45..94a911e9c313 100644
--- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -9,6 +9,9 @@ title: UniPhier GPIO controller
 maintainers:
   - Masahiro Yamada <yamada.masahiro@socionext.com>
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   $nodename:
     pattern: "^gpio@[0-9a-f]+$"
diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
index a36aec27069c..0e4581241b3f 100644
--- a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
@@ -23,6 +23,9 @@ description: |
   - EN_VEE (power control) mapped to index 7
   - V_EN (power control) mapped to index 8
 
+allOf:
+  - $ref: gpio-common.yaml#
+
 properties:
   $nodename:
     pattern: "^gpio@[0-9a-f]+$"
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
