Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92347C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byMNSRWx9G8+5PpSy+wZyPtOXUMZUkuy2oldGJQ2Dqw=; b=cUD30bxLbnJazG
	BsiAuZRSzUnr4sEHeuj/isIN5utqnNk22ZfVUuBRqkajmfBPqrtoeIqZV5gbck9Wrl69zJrEyKvsd
	Csxj0I2QH4xkQ2/fXLBjHvxX7Rhf73wGm1s6HDG5E5jUkJgNwGwqkXiHQyFjCzC/2U+TBiv1gLpJo
	rEo4ldrFxGM3C0gLwu0FWvIFf0DCw1rAtqa/XykcbEHK51CoJgTbx5W2AY65CNKZ/cVYkl+7DJVTk
	VIJB9vfUn96LpnRVhImnPSGgqRI7gbdOGh1xvIUdra5rASJbhSXlt6WjMqIJYNkjDiM6Kr3LNy4e0
	zSMnv7/FHEX+FDH1k5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLM3-00FC9O-1K; Wed, 01 Jun 2022 10:13:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwL1L-00F3K3-1B; Wed, 01 Jun 2022 09:52:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id f21so2573023ejh.11;
        Wed, 01 Jun 2022 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y1mJGH5c1Uozsg7k4TIS92U6v6LjyV9oFoYVM0NRha8=;
        b=pDzLCrKYfqkJbuKWjOE7YKh1BjW8iuiBm1bkNBWCdyl6ZXoEh4vEn7DK+SXSpbB90U
         0mMySw+1KW+jWuSlprGFz1/ZihwNlBGfQoJ952/S65Zmwv3yE5hNf/jPQiWvymLTm2fF
         5PkFkXZAasgyv3D7SLAriP98k8PabcZr76rGv9IlXeRbm0xbiyv3vYnBL++vOmRc3YHf
         XDY8aMNfCeHWTJKIS7vTg70L9GewCHcK41H93Qqlgs6oPaArJ8adNouaJAAsPAr7X8F4
         inDdCJvjhmWW8uwlHRhS2KKJQUa9JGtgmNjDKfkuu2t5FghP5ZU/AhZiljZlz8vr07eB
         Bzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y1mJGH5c1Uozsg7k4TIS92U6v6LjyV9oFoYVM0NRha8=;
        b=o9c3UIGW9ExTM90BBLqk50TbyoSGhAwpMOJq6p/Mkdv+3nUoU5BmG7wDVnjtB+Z1pK
         ZzpgNgL8yR/MbsWjHv0GWT6U9riooRStnUCvgQXvNUkC2OdkLa6+bkj3LhjzLXI3PQla
         kRB8GIyYMnMkV6POb7uHaZtvdcfcDU46+fWHbU2yHGFK98r6EnqCtnH4rxbdTXMnChQz
         ZiHkQYV/Ezrxt8DErB+mOlkoScD2L9rgOcbyubiH830c8ZsoSv1SU3ojXsqwCCiTulm7
         VZbsVMogfjFANIGHQmcP47hOnIqF3JyW9tVD5wdybLCaR4pTbiwi+Zz805omogNef9x7
         4BwQ==
X-Gm-Message-State: AOAM531vv/aZQwuxJUp7Wltxm/+8uKDTvaoyYu1EQMhi75zIWqBJqH2s
	HStrJBWumnnPOVrpT4xqQNskAW/9Y4kmq5QCem0=
X-Google-Smtp-Source: ABdhPJyqf9ZHomloEdcRczicdqSM2R1J6YhdToJV6ojkEOXFybYoQ0iogidyjBJ4Et6n0VcyKxc+QBr3vsPZaac7yDU=
X-Received: by 2002:a17:906:2416:b0:6fe:a0be:91d5 with SMTP id
 z22-20020a170906241600b006fea0be91d5mr54057142eja.132.1654077125409; Wed, 01
 Jun 2022 02:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com> <20220531102809.11976-7-peterwu.pub@gmail.com>
 <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
In-Reply-To: <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jun 2022 11:51:30 +0200
Message-ID: <CAHp75Vf245Oo3wmx5rh_EkXZ4FL_nnehpfuaDAiEdG6BenXxhw@mail.gmail.com>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, cy_huang@richtek.com, 
	alice_chen@richtek.com, chiaen_wu@richtek.com, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_025207_152292_2F1534CE 
X-CRM114-Status: GOOD (  24.17  )
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

On Wed, Jun 1, 2022 at 11:48 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, May 31, 2022 at 1:16 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: Alice Chen <alice_chen@richtek.com>
>
> All below comments are applicable to the rest of the series as well
> (one way or another), so please fix all your patches where it's
> appropriate.

Forgot to mention, please consider using

  return dev_err_probe();

pattern in the ->probe() and related funcitons. It will save a lot of LOCs.

> > Add Mediatek MT6370 Indicator support
>
> What indicator?
> Please also keep attention on English punctuation (missed period).
>
> ...
>
> > +       help
> > +         Support 4 channels and reg/pwm/breath mode.
> > +         Isink4 can also use as a CHG_VIN power good Indicator.
>
> be used
>
> > +         Say Y here to enable support for
> > +         MT6370_RGB_LED device.
>
> ...
>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
>
> > +#include <linux/of.h>
>
> Are you sure this is the correct header? Seems you need
> mod_devicetable.h instead.
>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
>
> ...
>
> > +struct mt6370_priv {
> > +       struct mutex lock;
>
> Do you use regmap locking?
>
> > +       struct device *dev;
>
> > +       struct regmap *regmap;
>
> > +       struct regmap_field *fields[F_MAX_FIELDS];
> > +       const struct reg_field *reg_fields;
> > +       const struct linear_range *ranges;
> > +       struct reg_cfg *reg_cfgs;
> > +       unsigned int leds_count;
> > +       unsigned int leds_active;
> > +       bool is_mt6372;
> > +       struct mt6370_led leds[];
> > +};
>
> ...
>
> > +static const unsigned int common_tfreqs[] = {
> > +       10000, 5000, 2000, 1000, 500, 200, 5, 1
>
> Leave a comma at the end.
>
> > +};
> > +
> > +static const unsigned int mt6372_tfreqs[] = {
> > +       8000, 4000, 2000, 1000, 500, 250, 8, 4
>
> Ditto.
>
> > +};
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
