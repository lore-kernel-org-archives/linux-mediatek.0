Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC35CA1016
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GreFsnaaeM4F+2voh3Z9EQbdTyQ1sQF/UoQy0TFeeU=; b=cAfVy3j8vFGfRVJRYVTL4YkaVO
	9cZIhwQwcnZkXkVW+0ma5r+FVvOsD9sDkz069JznhT+zCXdr/pE24LY6++/LO8jMZ34ZwB8fMJtCV
	BLpKy28nT0O8tOdXCTGpBUA7Fj6NbI0w3E0i6wDVAV9xCFkCa6y4e5XF8TJxl36igrVE0Bm0kfdmK
	rBBpgWMeMBlTo8lXi7Uz1ddDTHAcWUAAuAw/8wr3SuS1yKyXEeYSnq0MLJOTmCxorntKdew1AjdeJ
	QbrJshWfAbZecWwHJ/QPTlTums+oY+Cv3UA1I8pS8P7Tp+iVaDiTtHWDDRD3csJ4fZ699/uJgJsKe
	QZhPT2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcCA-00000001f4d-12iR;
	Thu, 11 Sep 2025 07:58:18 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcC6-00000001f14-1Pap
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Sep 2025 07:58:16 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so405173e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Sep 2025 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757577492; x=1758182292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GreFsnaaeM4F+2voh3Z9EQbdTyQ1sQF/UoQy0TFeeU=;
        b=jGO3h576VX9hjFdAxlf/zjv4UW5KFAXZRJYMguJcoEHvT4kxwpGWSFJLHzEmXYE818
         bIQYfoP54j+Jaedq0VtrQsVoMiAavL7KQzr/zdhV00KY9KNoufybTaUo6BRYaHCrOYqj
         Iib6ry7kwd5bBdev2G4DkAAQRAtZFtTj7lest4zJZhGZxSMoel0A1D6nqU9Nnbn5e5Gj
         ouucmQnWKxRuwseiZqIb+ni2UOnJnyJ+WohnRgSLTCSWNsi78RGOQStyEPjnYPSpISOi
         B+ESW7yzkA91etiIQXmrT3LysdHdWeTjUWFwf6NgZ3yl+YVqWKQOGN5H9DY3W4yIZsZr
         A7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577492; x=1758182292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GreFsnaaeM4F+2voh3Z9EQbdTyQ1sQF/UoQy0TFeeU=;
        b=VIVP++73s4q/4QjDMp+WWjhRopxPn67Uh4nBKstcYODJT9Gu7DRL8qn3AiATro8WN4
         LbJZzcrOGc3UW1T0mdvEH4PDm5c8PqjpU1doyuJfvC0AY/6G8PkqTDPCP/Fgqj0F8n/Q
         rQq7A8f2IpQoo0BcDd1k4dP1cYKsi2heh2IUFjwSEPKOkaMtCde1VfjjAo9VlIT6vgqK
         Qg76iwolAdrFuUikAm1Af9vMhwrQaiX7/SllVNwpVNPNT9u8XdvHCJTWbkXYqCOSDh1S
         /OyaNXXV7J+pkd5jsU/ykrNhQs1mfHE1naPyUJicXs5Vm34jLrBDGUPYG2Rhc7dSdaNp
         3W9A==
X-Forwarded-Encrypted: i=1; AJvYcCUmpwi/UqZXx79kcjCobSNAaXJiP2Z817hAHaobyc5S4JDnYIiVKJ2Hkcg0esOBSieMoUONVpcWmei0s3kdtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSUgmMW2355d11J+uswGh3m6clA4ZBKfOei6X3V9Ydhgf/nOSm
	/lgHP3xqFWHGsQXiudN56sftsZcFHW18XZL96cGFLxXPsLc5zUEXYknQJjObjbPzQK+hGNPIp11
	C6Umn0iNNap69280W7qllsaUnraovUmXapYtDJSZ7v7uvLW9ULenS
X-Gm-Gg: ASbGncu9PGWBxR483XD6/w25go8SwIkkI/RPISB1rXaw0GOMmb4SvzBWlf1xu8kBYnW
	69nr+R4cvBH9Cb1pNm33CNNEhaVNSGa8YLaSYtb8z7OHqE8YFsTC7ZibEkAF+YyczZxTNrITW7t
	g4npXqZGJrcIdqclerEovi8xtU5ZBLZIKb9efiDee/+AixlQFsayV2dkDxs8ilO1MXp4u6Pa/7Z
	Cf4lMIvPHJtNIiKd1riGXxJPp63WOn3esyw6EzpuoD1NJrbEA==
X-Google-Smtp-Source: AGHT+IGgQPXJhEububGtvbDREjokdFRgGwQ7+DoVBOt9p2K1Y+stul+X10YQV8+eyAVrpHY8+Nm0/o9541URIeuNSZA=
X-Received: by 2002:a05:6512:3b23:b0:55f:7c3a:1176 with SMTP id
 2adb3069b0e04-56263007fcdmr5516725e87.55.1757577492077; Thu, 11 Sep 2025
 00:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-11-f3d1a4c57124@linaro.org> <01a7cc78-fdae-4a1e-bf78-961e7ec214b2@sifive.com>
In-Reply-To: <01a7cc78-fdae-4a1e-bf78-961e7ec214b2@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:58:00 +0200
X-Gm-Features: Ac12FXyXoGE4qN9kFjk5zZjGFtdcTiIkPbg-LiY7JH2VZtvP8BTrqAJA-TJekfs
Message-ID: <CAMRc=MedZ3ub=7gacx_sW0C9f9Ra5XC94xgwLTt_7iq=Y4UFEA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] gpio: sifive: use new generic GPIO chip API
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005814_424852_63452419 
X-CRM114-Status: GOOD (  28.15  )
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

On Thu, Sep 11, 2025 at 2:37=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Bartosz,
>
> On 2025-09-10 2:12 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpio-sifive.c | 73 ++++++++++++++++++++++++--------------=
--------
> >  1 file changed, 38 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> > index 98ef975c44d9a6c9238605cfd1d5820fd70a66ca..2ced87ffd3bbf219c118573=
91eb4ea808adc0527 100644
> > --- a/drivers/gpio/gpio-sifive.c
> > +++ b/drivers/gpio/gpio-sifive.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/device.h>
> >  #include <linux/errno.h>
> >  #include <linux/gpio/driver.h>
> > +#include <linux/gpio/generic.h>
> >  #include <linux/init.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/property.h>
> > @@ -32,7 +33,7 @@
> >
> >  struct sifive_gpio {
> >       void __iomem            *base;
> > -     struct gpio_chip        gc;
> > +     struct gpio_generic_chip gen_gc;
> >       struct regmap           *regs;
> >       unsigned long           irq_state;
> >       unsigned int            trigger[SIFIVE_GPIO_MAX];
> > @@ -41,10 +42,10 @@ struct sifive_gpio {
> >
> >  static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int =
offset)
> >  {
> > -     unsigned long flags;
> >       unsigned int trigger;
> >
> > -     raw_spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
> > +     guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
> > +
> >       trigger =3D (chip->irq_state & BIT(offset)) ? chip->trigger[offse=
t] : 0;
> >       regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
> >                          (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset)=
 : 0);
> > @@ -54,7 +55,6 @@ static void sifive_gpio_set_ie(struct sifive_gpio *ch=
ip, unsigned int offset)
> >                          (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) =
: 0);
> >       regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
> >                          (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) :=
 0);
> > -     raw_spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
> >  }
> >
> >  static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int t=
rigger)
> > @@ -72,13 +72,12 @@ static int sifive_gpio_irq_set_type(struct irq_data=
 *d, unsigned int trigger)
> >  }
> >
> >  static void sifive_gpio_irq_enable(struct irq_data *d)
> > -{
> > +     {
>
> This looks like an unintentional whitespace change.
>

Ah, thanks, checkpatch did not spot it. I'll fix it when applying.

> >       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> >       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> >       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> >       int offset =3D hwirq % SIFIVE_GPIO_MAX;
> >       u32 bit =3D BIT(offset);
> > -     unsigned long flags;
> >
> >       gpiochip_enable_irq(gc, hwirq);
> >       irq_chip_enable_parent(d);
> > @@ -86,13 +85,13 @@ static void sifive_gpio_irq_enable(struct irq_data =
*d)
> >       /* Switch to input */
> >       gc->direction_input(gc, offset);
> >
> > -     raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> > -     /* Clear any sticky pending interrupts */
> > -     regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> > -     raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +     scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
> > +             /* Clear any sticky pending interrupts */
> > +             regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> > +     }
>
> This block (and the copy below) don't actually need any locking, since th=
ese are
> R/W1C bits. From the manual: "Once the interrupt is pending, it will rema=
in set
> until a 1 is written to the *_ip register at that bit." I can send this a=
s a
> follow-up improvement if you want to keep this limited to the API convers=
ion.
>

Sure, please do.

> So with the minor whitespace fix:
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
>

Thanks,
Bart

> Regards,
> Samuel
>
> >
> >       /* Enable interrupts */
> >       assign_bit(offset, &chip->irq_state, 1);
> > @@ -118,15 +117,14 @@ static void sifive_gpio_irq_eoi(struct irq_data *=
d)
> >       struct sifive_gpio *chip =3D gpiochip_get_data(gc);
> >       int offset =3D irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
> >       u32 bit =3D BIT(offset);
> > -     unsigned long flags;
> >
> > -     raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
> > -     /* Clear all pending interrupts */
> > -     regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> > -     regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> > -     raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +     scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
> > +             /* Clear all pending interrupts */
> > +             regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
> > +             regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> > +     }
> >
> >       irq_chip_eoi_parent(d);
> >  }
> > @@ -179,6 +177,7 @@ static const struct regmap_config sifive_gpio_regma=
p_config =3D {
> >
> >  static int sifive_gpio_probe(struct platform_device *pdev)
> >  {
> > +     struct gpio_generic_chip_config config;
> >       struct device *dev =3D &pdev->dev;
> >       struct irq_domain *parent;
> >       struct gpio_irq_chip *girq;
> > @@ -217,13 +216,17 @@ static int sifive_gpio_probe(struct platform_devi=
ce *pdev)
> >        */
> >       parent =3D irq_get_irq_data(chip->irq_number[0])->domain;
> >
> > -     ret =3D bgpio_init(&chip->gc, dev, 4,
> > -                      chip->base + SIFIVE_GPIO_INPUT_VAL,
> > -                      chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> > -                      NULL,
> > -                      chip->base + SIFIVE_GPIO_OUTPUT_EN,
> > -                      chip->base + SIFIVE_GPIO_INPUT_EN,
> > -                      BGPIOF_READ_OUTPUT_REG_SET);
> > +     config =3D (struct gpio_generic_chip_config) {
> > +             .dev =3D dev,
> > +             .sz =3D 4,
> > +             .dat =3D chip->base + SIFIVE_GPIO_INPUT_VAL,
> > +             .set =3D chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> > +             .dirout =3D chip->base + SIFIVE_GPIO_OUTPUT_EN,
> > +             .dirin =3D chip->base + SIFIVE_GPIO_INPUT_EN,
> > +             .flags =3D BGPIOF_READ_OUTPUT_REG_SET,
> > +     };
> > +
> > +     ret =3D gpio_generic_chip_init(&chip->gen_gc, &config);
> >       if (ret) {
> >               dev_err(dev, "unable to init generic GPIO\n");
> >               return ret;
> > @@ -236,12 +239,12 @@ static int sifive_gpio_probe(struct platform_devi=
ce *pdev)
> >       regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
> >       chip->irq_state =3D 0;
> >
> > -     chip->gc.base =3D -1;
> > -     chip->gc.ngpio =3D ngpio;
> > -     chip->gc.label =3D dev_name(dev);
> > -     chip->gc.parent =3D dev;
> > -     chip->gc.owner =3D THIS_MODULE;
> > -     girq =3D &chip->gc.irq;
> > +     chip->gen_gc.gc.base =3D -1;
> > +     chip->gen_gc.gc.ngpio =3D ngpio;
> > +     chip->gen_gc.gc.label =3D dev_name(dev);
> > +     chip->gen_gc.gc.parent =3D dev;
> > +     chip->gen_gc.gc.owner =3D THIS_MODULE;
> > +     girq =3D &chip->gen_gc.gc.irq;
> >       gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
> >       girq->fwnode =3D dev_fwnode(dev);
> >       girq->parent_domain =3D parent;
> > @@ -249,7 +252,7 @@ static int sifive_gpio_probe(struct platform_device=
 *pdev)
> >       girq->handler =3D handle_bad_irq;
> >       girq->default_type =3D IRQ_TYPE_NONE;
> >
> > -     return gpiochip_add_data(&chip->gc, chip);
> > +     return gpiochip_add_data(&chip->gen_gc.gc, chip);
> >  }
> >
> >  static const struct of_device_id sifive_gpio_match[] =3D {
> >
>

