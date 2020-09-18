Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48139C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 14:30:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D043A206FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 14:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lsZy66P8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M78Nd8HJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D043A206FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wb8f1/sDfsEKdtefobi8O/7xDnfHpG+9v54yxP/MZmY=; b=lsZy66P8eITxTSgPR4dtUY+Vc
	TIkws513EQCtSDMVajZCc7qelKzks5N7uRtJkzZp6kyw8lKJGcjjHN35Nlk1CW5W5/7sDWT59bPMa
	1RwQzStWR7ASJsWy8mUT3snos9eeG4PxPNT+DsQV25wCK7naTv2GSCnqmFuGKhLAtfcgNx/xwZHCs
	AS8wWJd92E25zAW2u87fWdSoqlwLbbGImOAeT5vamor2j69nlpXajkr7EFSZ5bcdUd0NIf1gZjgK2
	dpdDpLPQ6JNDKFkp3oKiN4/QddBFQJFjqSPjF6GvIXmiuTb+6mG/B8cOgzY0mqhbdHQhhDBSsiTYf
	lqIWm1sLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJHP5-00036E-3B; Fri, 18 Sep 2020 14:30:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJHOy-00033c-Nm; Fri, 18 Sep 2020 14:30:20 +0000
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEF282396F;
 Fri, 18 Sep 2020 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600439415;
 bh=BzRCCHrMyRtEbFXS+WPF2C06UQOXtwZQ6+AR7KwiNeY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M78Nd8HJqpaE3j9eXFP+0zTJkt2DJ3JP2vG2rY2s+E2Ucjhb1yZtupM/PYNzuUdOV
 7j9z8YCTnNoaiuky8aGripKJaCqvG3MNujOgGJ57GaOrjyaHNHJWRRh2mRAdM4mzf/
 0+TNIX/OYTI78EOul2yVt4CZmk8rrF0HMp4lqS3s=
Received: by mail-yb1-f178.google.com with SMTP id h206so4432124ybc.11;
 Fri, 18 Sep 2020 07:30:15 -0700 (PDT)
X-Gm-Message-State: AOAM531irD11oB8MbUMTjsTcTRqlJ8v8pQk5nD9QilJpTF5VFBcn/WuW
 Z2aoHPuhXR6neNlFMahnAIEcIJaFgijvWUSIig==
X-Google-Smtp-Source: ABdhPJwB1Ma/MKweZxwzRdC4MQG3s3W4wg0oVoNXdP8sSb8gUQ626v5DX61EKMyUVGmHFAKJsNKSrOjgarNcaCyLkpU=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr21429982otp.107.1600439413814; 
 Fri, 18 Sep 2020 07:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
In-Reply-To: <20200917165301.23100-2-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 18 Sep 2020 08:30:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
Message-ID: <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_103016_938712_F5021F47 
X-CRM114-Status: GOOD (  26.30  )
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
 Linus Walleij <linus.walleij@linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Stefan Agner <stefan@agner.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Anson Huang <Anson.Huang@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Teng <andy.teng@mediatek.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jaroslav Kysela <perex@perex.cz>, Sungbo Eo <mans0n@gorani.run>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sricharan R <sricharan@codeaurora.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 - <patches@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert parts of gpio.txt bindings into common dtschema file for GPIO
> controllers.  The schema enforces proper naming of GPIO controller nodes
> and GPIO hogs.

Did you not see my previous reply about a common schema? We already
have a common GPIO and hog schema in dtschema. Please add to it
whatever is missing.

My goal is all common schema end up in dtschema, but I haven't pushed
folks to do that yet. Ones I've done are there though. One issue is
what's in dtschema should be GPL/BSD and the existing text bindings
are default GPL, so there's a relicensing exercise. In some cases, the
schema is there but I haven't copied over the descriptions.

Rob


> +    description:
> +      Indicates the start and size of the GPIOs that can't be used.
> +
> +  ngpios:
> +    description: |
> +      Optionally, a GPIO controller may have a "ngpios" property. This property
> +      indicates the number of in-use slots of available slots for GPIOs. The
> +      typical example is something like this: the hardware register is 32 bits
> +      wide, but only 18 of the bits have a physical counterpart. The driver is
> +      generally written so that all 32 bits can be used, but the IP block is
> +      reused in a lot of designs, some using all 32 bits, some using 18 and
> +      some using 12. In this case, setting "ngpios = <18>;" informs the driver
> +      that only the first 18 GPIOs, at local offset 0 .. 17, are in use.
> +
> +      If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1,
> +      an additional set of tuples is needed to specify which GPIOs are
> +      unusable, with the gpio-reserved-ranges binding.
> +
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    description:
> +      The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> +      providing automatic GPIO request and configuration as part of the
> +      gpio-controller's driver probe function.
> +      Each GPIO hog definition is represented as a child node of the GPIO controller.
> +
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name:
> +        description:
> +          The GPIO label name. If not present the node name is used.
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +
> +    oneOf:
> +      - required:
> +          - input
> +      - required:
> +          - output-high
> +      - required:
> +          - output-low
> +
> +    additionalProperties: false
> +
> +required:
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +examples:
> +  - |
> +    gpio-controller@15000000 {
> +        compatible = "foo";
> +        reg = <0x15000000 0x1000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <18>;
> +        gpio-reserved-ranges = <0 4>, <12 2>;
> +        gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
> +                          "LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
> +                          "Row A", "Row B", "Row C", "Row D", "NMI button",
> +                          "poweroff", "reset";
> +    };
> +
> +  - |
> +    gpio-controller@1400 {
> +        compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        line-b-hog {
> +            gpio-hog;
> +            gpios = <6 0>;
> +            input;
> +            line-name = "foo-bar-gpio";
> +        };
> +    };
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
