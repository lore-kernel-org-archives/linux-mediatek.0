Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61215C35FFF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpWMPlfIX7YhBeWJyNbMe8FzyW4Hu7Wcs9fzjKwOIrA=; b=VxMZWa8YfS/wUlXVdJQD6CuJu4
	0h6Y3Qov+expsWb248AJvazCHmLmufwjS3YZnhLain9Zz9SdeoVkc+BRRnm+5+1Bla0/CTx/AloWO
	p1CYqN6+eisRQQ1EPOj9BiQSIbFd6BglgEjMP66a5NUxzzeM/+6tP8UTqPPmQmDviVA/RGasTWfxM
	iRaf+OxHAO1Rfhbc4x612KaJrUSezSjlSB1vd19QC83vFX9MAdAQao6wSyKA0X8a3VSWf4bMGgIwi
	xTeCH6qUQ8L/CzrBKb0G1t0Ttq0XK5+9NFtm5p5+UrzgMMZMTC/0JoAjpPSH7PjoLDQmVc6mB4YmE
	JdHIcxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXYE-000000069Pr-0Jfy;
	Tue, 17 Sep 2024 12:43:26 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXWX-000000069Dq-1tkF
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Sep 2024 12:42:44 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2f74e468aa8so57422031fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Sep 2024 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726576899; x=1727181699; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpWMPlfIX7YhBeWJyNbMe8FzyW4Hu7Wcs9fzjKwOIrA=;
        b=ScyaszdQvFv6KX3VM7IxtBwGi/WI4Ke1YPh+xc8Adh7Fck7JUD2WPFYJncQDQZjJV2
         KXlrvt+6fyisMOyTp7ANIQ2Wo3QGqSVtC3LAPt3RhcdvmXev92XYxt906iqfchxvlb9y
         kAtFj9p9yPB5f0LuKS0QJbDA3e5hGRoqongfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726576899; x=1727181699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpWMPlfIX7YhBeWJyNbMe8FzyW4Hu7Wcs9fzjKwOIrA=;
        b=kT6PmcE/PscxyN+hfNQVB7+Q19YwjmSlajMka96vmCjeCRZ6x6e+uiFPAPH/VER6ng
         SikEQlJKew1A/o0dB+XbMkE5jq2jSiVFiletU91VrOFxKGdQjQS8opB6sL3C5mwOvw8y
         CB4/yxFYlz8bAp+TIZk3usbFgnQm8lTwmi8LTXJC29v02XqbtcnoSFGdschouNkCI6GE
         Ejam174haPUhsQ/n+skrLuymDvZLUejsFHx2Lgd2TJZjflkwxLupNaXwPIUGcw8bgUtE
         Zf7U2JnxjjetKtpnsCUeZstQ7OFDg2vYO8sZOkpLogY2UEKOLINrWH8nxRqbw3NitTy9
         IKXA==
X-Forwarded-Encrypted: i=1; AJvYcCXDhkyZVZ9pOrFFiLSX7frIqs3eT5BSAdTHUmai+HiV7x20wwXOJAn8eulc9GEJCTAIZxV0PUjk4xylpvBh/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc+ypJKuXcRi0pUuNWzf7ANZxCbbQIKeMhVTaJ88BH9bPSqfv6
	XMKUh0sK/+aMA8/croOV8r5JjGX+cX++T0qufGg2Tr/0oBWLNyRuIqiqW9WNohKn+atTYXcfPKx
	sYF+9KHvYkdSrdO8MisEcqY/7zlm6sxPxENZb
X-Google-Smtp-Source: AGHT+IFn3m+495dQ3DEAPrBhGOQnGwVGdz2fTnahxh2yXDyCOMPHxLysb0zN6DNlW9fowNODvzSDvoxEfUfwPvjJvLE=
X-Received: by 2002:a05:6512:3f18:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-53678f6143cmr9822670e87.0.1726576898996; Tue, 17 Sep 2024
 05:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
 <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
In-Reply-To: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 17 Sep 2024 14:41:26 +0200
Message-ID: <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_054141_547592_AE608F3F 
X-CRM114-Status: GOOD (  25.39  )
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

On Sat, Sep 14, 2024 at 1:49=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > +static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c=
_of_probe_simple_ctx *ctx)
> > +{
> > +       int ret;
> > +
> > +       if (!ctx->gpiod)
> > +               return 0;
> > +
> > +       dev_dbg(dev, "Setting GPIO\n");
> > +
> > +       ret =3D gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_=
high_to_enable ? 1 : 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       msleep(ctx->opts->post_reset_deassert_delay_ms);
>
> Like in the previous patch, you need an "if
> (ctx->opts->post_reset_deassert_delay_ms)" before the msleep().

Ack.

> > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struc=
t i2c_of_probe_simple_ctx *ctx)
> > +{
> > +       if (!ctx->gpiod)
> > +               return;
> > +
> > +       dev_dbg(dev, "Setting GPIO to input\n");
> > +
> > +       gpiod_direction_input(ctx->gpiod);
>
> This is weird. Why set it to input?

It seemed to me this would be more like the initial state, without knowing
the actual initial state.

> > @@ -347,6 +438,7 @@ int i2c_of_probe_simple_cleanup(struct device *dev,=
 void *data)
> >  {
> >         struct i2c_of_probe_simple_ctx *ctx =3D data;
> >
> > +       i2c_of_probe_simple_disable_gpio(dev, ctx);
>
> Maybe add a comment before the GPIO call that it's a noop if we found
> something and i2c_of_probe_simple_free_res_early() was already called?
> Otherwise you need to read into the function to understand why this
> doesn't crash if the early call was made. To me, that makes the
> abstraction add confusion instead of simplifying things.

Ack.

> > @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, cons=
t struct i2c_of_probe_cfg *cf
> >   * struct i2c_of_probe_simple_opts - Options for simple I2C component =
prober callbacks
> >   * @res_node_compatible: Compatible string of device node to retrieve =
resources from.
> >   * @supply_name: Name of regulator supply.
> > + * @gpio_name: Name of GPIO.
>
> Talk about the fact that gpio_name can be NULL or an empty string and
> that they mean different things.

Ack.

> >   * @post_power_on_delay_ms: Delay in ms after regulators are powered o=
n. Passed to msleep().
> > + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Pas=
sed to msleep().
> > + * @gpio_high_to_enable: %true if GPIO should be set to electrical hig=
h to enable component.
>
> Now that you've added the GPIOs and more delays, the description of
> this structure needs to list exactly what the power sequence your
> simple functions assume.

Ack.

> I would also say: given that you're providing a parameter anyway and
> you're giving the GPIO name, can you please move away from the "raw"
> values and move to "logical" values?

I disagree. When hardware engineers design for swappable components, they
likely look at the electrical compatibility of them. In this case, an
active-high "enable" pin is electrically compatible with an active-low
"reset" pin. If we use the logical value here, then we would need more
logic to know when the logical polarity has to be reversed.

Note that this doesn't work for components that are electrically
incompatible. But in that case a lot more board dependent code would be
needed anyway.


ChenYu

