Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2246EC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 19:04:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9756220853
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 19:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HjMhBhPz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="dyOMV3sQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9756220853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qf1HOgXuxL5wpGPRKTrkKY+LnLsVH/bYfREfHGl/sOc=; b=HjMhBhPzMiRERjEoZjRjfq7SF
	FhYSZnH7CEsgDJwICjzoMGHn5xANV8VwSrFpNZHYy69CGVHlL7qr5cjQNF80KNxDHqIsy0fCDnWzV
	2wIjyGXXdHtbPHMw6urIYF32HdNqlltGK4YzHIcd6BQaUA5PoStGkBBxlWkXvmSzW7tAqOniOb5Dn
	2Xl5P7N98rlEfyoALj5+gb+Jcgc9SCKHflT7/s4H95luZ0LTjTd3o4+P754srExh0GbUdzrsjzve7
	OPCGSTBdyR5wsFjC60CimeCJzJWfwvxn9wR/uuf3MDcrXM/Y09ncXkSt6ddd6RpTdRORTvQcHXRje
	d0ciaVghA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIzCU-0004M6-G0; Thu, 17 Sep 2020 19:04:10 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIzCR-0004Kn-EU; Thu, 17 Sep 2020 19:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1600369440; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3OBK4G1Rvv8T0Xnqj3/8Lbig0kqsWBBjd0US1g/rPo=;
 b=dyOMV3sQSIuXwuaky8QYur2ywbBqBFDkh4I8lC8CviZwJ4xXUpL4z0HKUxmZFgT1wCRV+i
 lmglasQwXio0xAlmn9AwPeNsR0gejQ1N0ipvwaxZk7O7qZVgtm6UVhMbStHccEmV266mP4
 NNt/TuV+D6L8z9EtegHwMbZvBfl1a4o=
Date: Thu, 17 Sep 2020 21:03:36 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 09/13] dt-bindings: pinctrl: include common schema in
 GPIO controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <0YGTGQ.TCQDDTXFCWNX2@crapouillou.net>
In-Reply-To: <20200917165301.23100-10-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-10-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_150407_841408_3D188D6A 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: Amelie Delaunay <amelie.delaunay@st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Anson Huang <Anson.Huang@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Andy Teng <andy.teng@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Jaroslav Kysela <perex@perex.cz>,
 Sungbo Eo <mans0n@gorani.run>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sricharan R <sricharan@codeaurora.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hoan Tran <hoan@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org,
 Niklas =?iso-8859-1?q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 - <patches@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,


Le jeu. 17 sept. 2020 =E0 18:52, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> Include the common GPIO schema in GPIO controllers to be sure all =

> common
> properties are properly validated.
> =

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> =

> ---
> =

> Changes since v1:
> 1. New patch
> ---
>  .../devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml      | 3 =

> +++
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml          | 1 +
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml          | 3 =

> +++
>  Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 3 =

> +++
>  .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml   | 3 =

> +++
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml  | 3 =

> +++
>  .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml      | 3 =

> +++
>  .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml      | 3 =

> +++
>  .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml       | 3 =

> +++
>  .../devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml      | 3 =

> +++
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 =

> +++
>  11 files changed, 31 insertions(+)
> =

> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml =

> b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> index 33391d30c00c..51bfc214bba6 100644
> --- =

> a/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> +++ =

> b/Documentation/devicetree/bindings/pinctrl/actions,s500-pinctrl.yaml
> @@ -15,6 +15,9 @@ description: |
>    GPIO function selection & GPIO attributes configuration. Please =

> refer to
>    pinctrl-bindings.txt in this directory for common binding part and =

> usage.
> =

> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: actions,s500-pinctrl
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml =

> b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> index 7556be6e2754..55662f8d1f94 100644
> --- =

> a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> +++ =

> b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.y=
aml
> @@ -143,6 +143,7 @@ allOf:
>    # boards are defining it at the moment so it would generate a lot =

> of
>    # warnings.
> =

> +  - $ref: /schemas/gpio/gpio-common.yaml#
>    - if:
>        properties:
>          compatible:
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml =

> b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> index 420d74856032..ed478b0ed4cc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
> @@ -31,6 +31,9 @@ description: |
>    This binding must be part of the Lochnagar MFD binding:
>      [4] ../mfd/cirrus,lochnagar.yaml
> =

> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      enum:
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml =

> b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> index 44c04d11ae4c..ffa64832b4f9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> @@ -59,6 +59,9 @@ properties:
>  patternProperties:
>    "^gpio@[0-9]$":
>      type: object
> +    allOf:
> +      - $ref: /schemas/gpio/gpio-common.yaml#
> +
>      properties:
>        compatible:
>          enum:
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml =

> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> index 152c151c27ad..7d0a4cb96f39 100644
> --- =

> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +++ =

> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> @@ -14,6 +14,9 @@ description: |+
>    required property:
>    - compatible: "syscon"
> =

> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: mediatek,mt6779-pinctrl
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml =

> b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> index 5556def6b99b..bc8bc0ac1926 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -12,6 +12,9 @@ maintainers:
>  description: |
>    The Mediatek's Pin controller is used to control SoC pins.
> =

> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: mediatek,mt8192-pinctrl
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml =

> b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> index c64c93206817..22a6b80b4c0e 100644
> --- =

> a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> +++ =

> b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found =

> in the
>    IPQ6018 platform.
> =

> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,ipq6018-pinctrl
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml =

> b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> index 1f0f5757f9e1..9855d859fe61 100644
> --- =

> a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> +++ =

> b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found =

> in the
>    MSM8226 platform.
> =

> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,msm8226-pinctrl
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml =

> b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> index 8508c57522fd..e5757b6ced40 100644
> --- =

> a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> +++ =

> b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
> @@ -13,6 +13,9 @@ description: |
>    This binding describes the Top Level Mode Multiplexer block found =

> in the
>    SM8250 platform.
> =

> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  properties:
>    compatible:
>      const: qcom,sm8250-pinctrl
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml =

> b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> index b7911a994f3a..4d7bf4340262 100644
> --- =

> a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> +++ =

> b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> @@ -10,6 +10,9 @@ maintainers:
>    - Chris Brandt <chris.brandt@renesas.com>
>    - Geert Uytterhoeven <geert+renesas@glider.be>
> =

> +allOf:
> +  - $ref: /schemas/gpio/gpio-common.yaml#
> +
>  description:
>    The Renesas SoCs of the RZ/A2 series feature a combined Pin and =

> GPIO
>    controller.
> diff --git =

> a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml =

> b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 72877544ca78..28b861362ba0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -56,6 +56,9 @@ properties:
>  patternProperties:
>    '^gpio@[0-9a-f]*$':
>      type: object
> +    allOf:
> +      - $ref: /schemas/gpio/gpio-common.yaml#
> +
>      properties:
>        gpio-controller: true
>        '#gpio-cells':
> --
> 2.17.1
> =




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
