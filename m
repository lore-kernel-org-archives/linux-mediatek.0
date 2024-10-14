Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A1BCF259D
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 04:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwgD744i+ZALkiommnSs81xuS9bpxKIuuRPbiBw3DbE=; b=cjEcQU3rKOAh/3XNvdpzCMqKk0
	dp/iITomKYa38NOhRZFkNyXDL4cmoqsmxJmPi+KaOJR1VtEZ+kqTRgTGFoAy5TRdTNBIhndZ0EFDr
	7a6TRfyv+l+KKkkT0wwPS/p+SBe/nhLXEHsPJtwFwKhVxyMdoUoEyPsI5RtDQUPhWnJ51Jq6n2ijq
	ygqDHr5wYnqHzMa8ybct2oGsbP8xetD8Ej1pFXWUM2SyFe0x4kAm+sOvs+S9fm6jmmXsIdFU0iARO
	knt/kpjiyAOPYC1z+5JlECB+atnPi69q4ovPf+jqzx1nw/aZPioiRuox3zG/ne8ceM773BKalm3Ra
	DjR6HVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0CMM-00000003gcH-2gp8;
	Mon, 14 Oct 2024 04:07:06 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0CLl-00000003gT6-2wx2
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 04:06:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so711069e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 21:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728878788; x=1729483588; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwgD744i+ZALkiommnSs81xuS9bpxKIuuRPbiBw3DbE=;
        b=GJF+mf6MjtHIMErsKSivqIPEY65vq0jAMznhTQNlT0a0FHRLN6h8oRHSAXOAzBqVSr
         pco1ovAmdP6dt8HlJz4DUjKhXCUuM19/Qu/9QRdz3TjffsExOHwQWrpRn85ii5AiRLcu
         RxyKLyoeoNGwV03Qinan47mbhNGOwGvcqY4sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728878788; x=1729483588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwgD744i+ZALkiommnSs81xuS9bpxKIuuRPbiBw3DbE=;
        b=xH52WXlo+33I+EvbJsN5WqyOrpq/COSaDi4akill9JfCiA6szoWaP7X2k0oJaJUQ1p
         5yGoCfwb6W0h86To93XoiKsnr9xfbf9gsctapdwtPV0JiBZUsCfUeTg2NOcavdj97wnI
         t5LOEQIYNjy6/WUGVkG8HWJHWEV971uzDCWk7M9o0kom73WdfUuDGs9HVpf1RMtrLlBs
         tMCIhKaZ/TfnEuUsRmT0kQi2JZinbX/HSSzrbaLZn/vTP0Rm9Piex8pFDFw7KRPQbT3A
         MYblNG0xafScjXaoigKLUplVJafBS4UH8Mo8tFIbZRsY0F8RWszoVx7zmdOS6RO/Ed/N
         dCxg==
X-Forwarded-Encrypted: i=1; AJvYcCWSKAt/oq9285fX25PSVslj6ypXZdaGtdB7GI0C3rYGvdRFci8OlE0JVTFGkplTGTpGOBBThNpKwtUY9lkuyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzO4nTpmqIba1Y9hRtuuyFksa0uOayEOT27qigISYiOp2y3fWri
	5rZIbX3I1rsctE8j4o0cau4n2YNCoEWvOLtLGMmaBzIuShHSJ3ltCuhlBz8lMxJ9Erao9ewmoeS
	TnBnSqXLQU0YbwcfrC9eAbqN8bpn229tek8zO
X-Google-Smtp-Source: AGHT+IE1orh0TGasMBM1uZhGLqabgowh/X3mBeLGnxxsLSwvcm3PZp6MdB0eScoG5fQBdjANEp0bV2Y/ZCL10eWobUA=
X-Received: by 2002:a05:6512:438a:b0:539:de9c:c890 with SMTP id
 2adb3069b0e04-539de9cc99emr3721935e87.42.1728878787515; Sun, 13 Oct 2024
 21:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
In-Reply-To: <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 12:06:16 +0800
Message-ID: <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_210629_803453_8A10B4E6 
X-CRM114-Status: GOOD (  27.13  )
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

On Thu, Oct 10, 2024 at 11:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
> > Add GPIO support to the simple helpers for the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > Regulator supplies were handled in the previous patch.
> >
> > The assumption is that the same class of components to be probed are
> > always connected in the same fashion with the same regulator supply
> > and GPIO. The names may vary due to binding differences, but the
> > physical layout does not change.
> >
> > This supports at most one GPIO pin. The user must specify the GPIO name=
,
> > the polarity, and the amount of time to wait after the GPIO is toggled.
> > Devices with more than one GPIO pin likely require specific power
> > sequencing beyond what generic code can easily support.
>
> ...
>
> > +static int i2c_of_probe_simple_get_gpiod(struct device *dev, struct de=
vice_node *node,
> > +                                      struct i2c_of_probe_simple_ctx *=
ctx)
> > +{
> > +     struct fwnode_handle *fwnode =3D of_fwnode_handle(node);
> > +     struct gpio_desc *gpiod;
> > +     const char *con_id;
> > +
> > +     /* NULL signals no GPIO needed */
> > +     if (!ctx->opts->gpio_name)
> > +             return 0;
> > +
> > +     /* An empty string signals an unnamed GPIO */
> > +     if (!ctx->opts->gpio_name[0])
> > +             con_id =3D NULL;
> > +     else
> > +             con_id =3D ctx->opts->gpio_name;
>
> Can it use positive conditional?
>
>         if (ctx->opts->gpio_name[0])
>                 con_id =3D ctx->opts->gpio_name;
>         else
>                 con_id =3D NULL;

You suggested writing it this way in your reply to v7. Please pick one.

> > +     gpiod =3D fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "=
i2c-of-prober");
> > +     if (IS_ERR(gpiod))
> > +             return PTR_ERR(gpiod);
> > +
> > +     ctx->gpiod =3D gpiod;
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struc=
t i2c_of_probe_simple_ctx *ctx)
> > +{
> > +     if (!ctx->gpiod)
> > +             return;
>
> Do you need this check for the future patches?

Not sure I follow. The check is needed because this function is called
in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
function a no-op.

The helpers for the release side are quite short, but the ones on the
request side wrap some conditional and error handling. I think it's
better to keep it symmetric?

> > +     /* Ignore error if GPIO is not in output direction */
> > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> > +}
>
> ...
>
> >  struct regulator;
> > +struct gpio_desc;
>
> Ordered?

Will fix.


Thanks
ChenYu

