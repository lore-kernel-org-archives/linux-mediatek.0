Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32D6C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 16:53:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F0B921D24
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 16:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ubyNDB2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWWMJnyn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F0B921D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uX2hTfysteaxzn8/7vaI2YSuzgIgjKcn8sa/K5bXrZE=; b=2ubyNDB2/LsnXhdV5vxhZmi1ms
	VGRahB+olEwn4RAceap0clbgMf+hg8JZCp++qrL63AGlYdpmlt2V6eWQWWS6+5jsa3gX56gM25p+4
	ozdgztMqd4I1V9FkOJpIzrnFKEKdM6loZMkNTY+5HIvdCskHdvoePDGk2qhyX96ITCA+1+J6vU4md
	bkFfIu43p3xFg9W9mdbR07rn0lUUdEdbo3r2/ipiKuL9m9VqT77Ow9FSskIyzmNfKilzC6gtmygs3
	tU6DUUvfd22s+gIYXM+lnt0uDSMFes6HjBdUudokcddKvsYy6Swr+DaeotdKapskfaUeW5EWLbe2E
	fsNjH8Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIxA3-0007Ru-CV; Thu, 17 Sep 2020 16:53:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIx9z-0007Q2-FW; Thu, 17 Sep 2020 16:53:29 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39C1520708;
 Thu, 17 Sep 2020 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361605;
 bh=P6t4EObPuKTAtjmptm4+AFH+z1+4hhhtxhJjS4UyDF0=;
 h=From:To:Cc:Subject:Date:From;
 b=QWWMJnynLqLOQxMCeIhdb30C/fJHQKsRzanwLdTpwbhaMyXT+tXpbqbOYpkb+Ly2M
 aBumK6+zCHsWhNp6ZfqN5QXKUzl+nO1TwJgKiLkTRKlRiFxwyqIPdifsq9tCyheivp
 WIbwLhtE7vcm3MGDi0wpAwkD5yRasj8RADVLwNo8=
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
Subject: [PATCH v2 00/13] gpio: add common dtschema
Date: Thu, 17 Sep 2020 18:52:48 +0200
Message-Id: <20200917165301.23100-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_125328_098517_704C5770 
X-CRM114-Status: GOOD (  13.55  )
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

Hi,

Changes since v1
================
1. Use common schema in bindings outside of gpio/ (new patches).
2. Minor fixes - see individual patches for changelogs.


Notes
=====
This is independent work of pca953x bindings:
https://lore.kernel.org/lkml/20200916155715.21009-1-krzk@kernel.org/T/#u

The DTS patches can be also applied independently.
The bindings patches depend on first one, adding common schema.

Best regards,
Krzysztof

Krzysztof Kozlowski (13):
  dt-bindings: gpio: add common schema for GPIO controllers
  dt-bindings: gpio: include common schema in GPIO controllers
  dt-bindings: gpio: pl061: add missing properties and include common
    schema
  dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6 and ARMv7 compatibles
  dt-bindings: gpio: fsl-imx-gpio: add gpio-line-names
  dt-bindings: gpio: gpio-vf610: fix iMX 7ULP compatible matching
  dt-bindings: media: include common schema in GPIO controllers
  dt-bindings: mfd: include common schema in GPIO controllers
  dt-bindings: pinctrl: include common schema in GPIO controllers
  ASoC: dt-bindings: zl38060: include common schema in GPIO controllers
  arm64: dts: imx8mq-librem5: correct GPIO hog property
  arm64: dts: imx8mq-librem5: align GPIO hog names with dtschema
  ARM: dts: imx: align GPIO hog names with dtschema

 .../bindings/gpio/brcm,xgs-iproc-gpio.yaml    |   3 +
 .../bindings/gpio/fsl-imx-gpio.yaml           |  17 ++-
 .../devicetree/bindings/gpio/gpio-common.yaml | 125 ++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-mxs.yaml    |   4 +
 .../bindings/gpio/gpio-pca9570.yaml           |   3 +
 .../devicetree/bindings/gpio/gpio-rda.yaml    |   3 +
 .../devicetree/bindings/gpio/gpio-vf610.yaml  |  11 +-
 .../devicetree/bindings/gpio/mrvl-gpio.yaml   |   1 +
 .../devicetree/bindings/gpio/pl061-gpio.yaml  |   6 +
 .../bindings/gpio/qcom,wcd934x-gpio.yaml      |   3 +
 .../bindings/gpio/renesas,em-gio.yaml         |   3 +
 .../bindings/gpio/renesas,rcar-gpio.yaml      |   3 +
 .../devicetree/bindings/gpio/sifive,gpio.yaml |   3 +
 .../bindings/gpio/snps,dw-apb-gpio.yaml       |   3 +
 .../gpio/socionext,uniphier-gpio.yaml         |   3 +
 .../bindings/gpio/xylon,logicvc-gpio.yaml     |   3 +
 .../bindings/media/i2c/maxim,max9286.yaml     |   3 +
 .../bindings/mfd/cirrus,madera.yaml           |   1 +
 .../devicetree/bindings/mfd/max77650.yaml     |   3 +
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |   3 +
 .../devicetree/bindings/mfd/st,stmfx.yaml     |   2 +
 .../devicetree/bindings/mfd/wlf,arizona.yaml  |   1 +
 .../pinctrl/actions,s500-pinctrl.yaml         |   3 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |   1 +
 .../bindings/pinctrl/cirrus,lochnagar.yaml    |   3 +
 .../bindings/pinctrl/ingenic,pinctrl.yaml     |   3 +
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |   3 +
 .../bindings/pinctrl/pinctrl-mt8192.yaml      |   3 +
 .../pinctrl/qcom,ipq6018-pinctrl.yaml         |   3 +
 .../pinctrl/qcom,msm8226-pinctrl.yaml         |   3 +
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml |   3 +
 .../pinctrl/renesas,rza2-pinctrl.yaml         |   3 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    |   3 +
 .../devicetree/bindings/sound/zl38060.yaml    |   3 +
 arch/arm/boot/dts/imx51-zii-rdu1.dts          |   2 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi       |   8 +-
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts   |   2 +-
 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   4 +-
 38 files changed, 245 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-common.yaml

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
