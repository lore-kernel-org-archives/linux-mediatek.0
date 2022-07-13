Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE432CCA482
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xyK6QWRYvAYrb/+63rjLZQAcRtIxgLcrB33g+2KqSs=; b=RlR9r2k37plUNs9GNYzI0uKsUx
	zNvq9khaEuY6umjtHcVYfBX707TmBU02KhSJVAyFcTRveIMcps+R6oZ78Ln7prm8Wwz3GrI/fUg08
	Lo0zNMmCnAxMw77scEBLsa4aa2TBARUpI0yvs2484A/Na27qsQiBCd4tgwdHPiaQbkVCf+UttiPeV
	xM2tg4uj4ZSTKcxONAJjSp7TPS0WBsu2wHe7hSQlcQEM6yqysPaqlm4MK7Rou6CNveabe91gxXuBT
	bDsfvInc5DJJBwCLVlH9vCmKzNM5V5TB3ApJ2o5Fn/+fvUZTu705SfCOjgGqJ6n+sh+UtkDA2HpYc
	c+mkvxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBYiV-002Hmh-G3; Wed, 13 Jul 2022 09:31:35 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBYiH-002HeX-Rx; Wed, 13 Jul 2022 09:31:23 +0000
Received: by mail-qk1-x733.google.com with SMTP id o21so112117qkm.10;
        Wed, 13 Jul 2022 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0xyK6QWRYvAYrb/+63rjLZQAcRtIxgLcrB33g+2KqSs=;
        b=FPtWrLSybq5/JRcq7btvHeJWMCsXvX/CM2akEZ98w5Xhrqo5RiIk+io9a9kvidBbko
         rD98ifKAkq2HQKbAZQtZUBYWAYRF/ZB2JgjqaJYu/u8t/7x4N2ZYB8gZATQtovzJzSvA
         o3dWO87hqrObabvw3it/HpfFSXxC98KBVo3PpXVLGH+CgExY7y0lQcZbQDXsaV9OOb8j
         MrkI6gK5FcldXAP+tuHXT0nqQ5anw3evL0O6kJDWNtiNB5BjDOBuchzIh9JLzIf2DXQF
         JujWd1jAyefR6kqA5vMjO8gTQ/Lm8neut7PL7nIKcg/SZxCqpx8WHofnonnog7Y1lvkR
         qZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0xyK6QWRYvAYrb/+63rjLZQAcRtIxgLcrB33g+2KqSs=;
        b=CTPJl+cbTVYM5VmeeXYsfnPqp3xB1llGC6zeue0QrtChivvwkEFIpwSIcS5Cb1VJUa
         rojfhduu8k7i9LolRkwImbPOXuqe/R+36fPjFikiyZHT7/z7F60DCpIn/rmQqOBR9zbc
         7cmtSJUaMImncINNQEYsxoIyTSHz0B8kV30TelvBEnzM0tJjZGEf36hqcQG+TZQLjF86
         eU1EI42PRdcNJPh8yIp1vsvkQhtMOD3lOFdWMc8qWjt5fF5dDjZuzcxOYTsnoRqv8zBs
         U59v1ELsmC5TfGHtyJWO2IAOV/zTXfdJU7T7yjNi0uI2COAnwqX0joP6FGkmfwZFeD6J
         LRCw==
X-Gm-Message-State: AJIora+9oyBjsABQ6A6cb5B810YQhjusBlbjbzhu4p/1h7rkeF6uWMat
	nSqEY9+GP30uZxDvWLWKvtxgtlmOznFB7BYCTbo=
X-Google-Smtp-Source: AGRyM1tNsl8p/tCqsOZvpybXx5aQhHuu6sUOAU1YdLQtCXJYEQpEi36ZexKVhnKPkG6l8H1xdXwMDaKMQpxPJUuM4pM=
X-Received: by 2002:a05:620a:450c:b0:6b2:59b8:985 with SMTP id
 t12-20020a05620a450c00b006b259b80985mr1639127qkp.328.1657704680484; Wed, 13
 Jul 2022 02:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-8-peterwu.pub@gmail.com>
 <Ys2TTsv1oU8n1fUE@google.com> <CABtFH5LMHrfOdLZZxpjwsHmyHZsHUmevpQJYDFqZtvfpC6AVxg@mail.gmail.com>
 <Ys58hr3AK/p/4/ng@google.com>
In-Reply-To: <Ys58hr3AK/p/4/ng@google.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 13 Jul 2022 17:31:08 +0800
Message-ID: <CABtFH5KoHGFC1KfbRYJndrkTHoABEf8xs5jAZVjQwJ_G=6TsgA@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
To: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	ChiYuan Huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_023121_942001_2B37C403 
X-CRM114-Status: GOOD (  37.81  )
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

Hi Lee,

Lee Jones <lee.jones@linaro.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=8813=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 13 Jul 2022, ChiaEn Wu wrote:
>
> > Hi Lee,
> >
> > Thanks for your reply.
> >
> > Lee Jones <lee.jones@linaro.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E6=99=9A=E4=B8=8A11:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > On Thu, 23 Jun 2022, ChiaEn Wu wrote:
> > >
> > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > >
> > > > Add Mediatek MT6370 MFD support.
> > >
> > > No such thing as "MFD support".
> > >
> > > And you're not getting away with submitting a 370 line patch with a 5
> > > word change log either. :)
> > >
> > > Please at least tell us what the device is and what it's used for.
> >
> > I sincerely apologize.
> > We will add more descriptions of the MT6370 feature in the v5 patch.
> >
> > >
> > > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > > ---
> > > >
> > > > v3
> > > > - Refine Kconfig help text
> > > > - Refine error message of unknown vendor ID in
> > > >   mt6370_check_vendor_info()
> > > > - Refine return value handling of mt6370_regmap_read()
> > > > - Refine all probe error by using dev_err_probe()
> > > > - Refine "bank_idx" and "bank_addr" in mt6370_regmap_read() and
> > > >   mt6370_regmap_write()
> > > > - Add "#define VENID*" and drop the comments in
> > > >   mt6370_check_vendor_info()
> > > > - Drop "MFD" in MODULE_DESCRIPTION()
> > > > ---
> > > >  drivers/mfd/Kconfig  |  13 ++
> > > >  drivers/mfd/Makefile |   1 +
> > > >  drivers/mfd/mt6370.c | 358 +++++++++++++++++++++++++++++++++++++++=
++++++++++++
> > > >  3 files changed, 372 insertions(+)
> > > >  create mode 100644 drivers/mfd/mt6370.c
>
> [...]
>
> > > > +static const struct mfd_cell mt6370_devices[] =3D {
> > > > +     MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
> > > > +     MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-cha=
rger"),
> > > > +     MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-b=
acklight"),
> > > > +     MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-=
flashlight"),
> > > > +     MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-i=
ndicator"),
> > > > +     MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc")=
,
> > > > +     MFD_CELL_RES("regulator", mt6370_regulator_irqs)
> > >
> > > The first parameters here should be prepended with something, perhaps
> > > "mt6370_"?
>
> > OK, we will add the prefix in the next patch.

Sorry, I forgot to ask a question in the last mail.
I wonder if using "mt6370-xxx" (dash) is better than using "mt6370_"
(underline) ??
Thanks.

> [...]
>
> > > > +static int mt6370_probe(struct i2c_client *i2c)
> > > > +{
> > > > +     struct mt6370_info *info;
> > > > +     struct i2c_client *usbc_i2c;
> > > > +     int ret;
> > > > +
> > > > +     info =3D devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
> > > > +     if (!info)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     info->dev =3D &i2c->dev;
> > > > +
> > > > +     usbc_i2c =3D devm_i2c_new_dummy_device(&i2c->dev, i2c->adapte=
r,
> > > > +                                          MT6370_USBC_I2CADDR);
> > > > +     if (IS_ERR(usbc_i2c))
> > > > +             return dev_err_probe(&i2c->dev, PTR_ERR(usbc_i2c),
> > > > +                                  "Failed to register USBC I2C cli=
ent\n");
> > > > +
> > > > +     /* Assign I2C client for PMU and TypeC */
> > > > +     info->i2c[MT6370_PMU_I2C] =3D i2c;
> > > > +     info->i2c[MT6370_USBC_I2C] =3D usbc_i2c;
> > > > +
> > > > +     info->regmap =3D devm_regmap_init(&i2c->dev, &mt6370_regmap_b=
us, info,
> > > > +                                     &mt6370_regmap_config);
> > >
> > > Apart from in mt6370_check_vendor_info() where is this actually used?
> >
> > Well... from my understanding, we use this MFD driver to make other
> > drivers of MT6370 (e.g. charger, ADC, led...) use the same regmap
> > settings.
> > Thus, this regmap is not only used in mt6370_check_vendor_info().
>
> Well for that to happen you need to store the data somewhere for the
> child devices to fetch from.  I don't see that happening in this
> patch?  What did I miss?

hmmm... I got your point... I will let regmap be a local var in
probe() in the next patch.
Thank you so much!

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

Best regards,
ChiaEn Wu

