Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6FDC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 12:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H60c6BQz+0PUGxMp0vbXoiihGTO7ZBPYPm+08N4mLfI=; b=312bci5ljUc9zq5wNmO7dhaW4I
	ZyXWUl+PSLZQ5I6xALIizvyxsKEX8WyTvgiWYMKZBER2N67sdeK1LWN/khTVHodNnWIKtR0FQ9nm9
	Dc4FAmvR+D2Pbj/fc+g+hTZPCB1OX5qXVeWw91fT56Qhk/AwU5XLbHR6P9+S4XLkKisGixC1BVKXo
	BASElBBKRCO1Tk2TrRtK3NDiV3gGJvxJUQYiuILntj5pzNDO+eTUSt6lBPUEQ/h1xkpvcHgG9yK7+
	5aO6a8Bx+MR5vvvLT5CsiA6qA8IvD7gz1u9LtBZXDzuNcGKzqVdhG2Z6Q2KhU70Rv5KR2q5u4HMkS
	PFUxI/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBbA2-003O5v-R5; Wed, 13 Jul 2022 12:08:10 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBb9n-003O0r-4l; Wed, 13 Jul 2022 12:08:00 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 6so18899226ybc.8;
        Wed, 13 Jul 2022 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H60c6BQz+0PUGxMp0vbXoiihGTO7ZBPYPm+08N4mLfI=;
        b=cFwaO0bDU4Rlt7N9UDqzRHYc/L/LXwPsecY5KlQfSKmfeHbUGfJju92GNvM+QXRy/A
         MfFCd9EiEFbUqGG0Dk3UDyeTjK2mKB+J26YUCLsjwjV1AqSW8ALXoZ+QUWDjp8FbHEeY
         dwnLTjlohJXN4MlqdlflbgJKO0LHlSOv3alwCbci2ARAUzjG69r4BZ9OGDCDuqQtQA7F
         3fzpmlRGWBNYqAxA0gsKxiBlo4ApaOY7UboYG9JKS2cowDCyOJujzJrS984DN9KyXzOA
         PlokWUEqgVaq6a1qwFa+85+pBBg3DMQ+qHXOl22B3dO6jAPN+bwQ7BsHm3cmgJ/HPnXL
         vfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H60c6BQz+0PUGxMp0vbXoiihGTO7ZBPYPm+08N4mLfI=;
        b=IblpUAEL77p1veftdjVryX6fsEkRnyYMBgl+Nnim/hBZCDYh5qG2UYIhZxJQFpRa0Q
         Q2a+Ixvv1Jyn6fRNdOSif8wGMkS98cc69DxzxmCED382QphLzM5MIvEHNAz+CZMxZcmc
         SBwca3vmcT/PrEm+pgnKmTjl5LAi21Rrmoq9mxVd73uhizRYlFYbzPE4E0N1Yf75lLyB
         0gMDzcjTOSjlhZ7EJ2OJothiBn7fUp3b2hy4HjTzBUw6lwl/+bvmroFa6m6NIbiyVrs9
         WoLyXocLNE2QcyxPggIFyt5XajFOBfd8Mc4VzT+jY0pJRGr9cHPAwS9AuMMrniX7vKkh
         Iycw==
X-Gm-Message-State: AJIora/0OPGBfBGFUKNizpZu7pfanuo2r/eY8HNqVauyTyJhbzYDKt2+
	6g4WCgVLgBmgv33s8Mb3qDaSkTFnvgNZhKzyzYs=
X-Google-Smtp-Source: AGRyM1sbQCBjmYhKYL+xb2AwlOmpuB0R1EP+WnPrRn0L3M4TSuIwm0awKcRUCK7kwFw6PIL77qpLuzj23J+O5rqZCJA=
X-Received: by 2002:a25:858e:0:b0:66e:4898:63e2 with SMTP id
 x14-20020a25858e000000b0066e489863e2mr3559399ybk.296.1657714072552; Wed, 13
 Jul 2022 05:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com> <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
In-Reply-To: <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Jul 2022 14:07:15 +0200
Message-ID: <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_050755_222490_5294AFA9 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, Jul 13, 2022 at 12:53 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:14=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

Please, remove unneeded context when replying!

...

> > > +               brightness_val[0] =3D (brightness - 1) & MT6370_BL_DI=
M2_MASK;
> > > +               brightness_val[1] =3D (brightness - 1)
> > > +                                   >> fls(MT6370_BL_DIM2_MASK);
> >
> > Bad indentation. One line?
>
> Well... if indent to one line, it will be over 80 characters(or called co=
lumns?)
> From my understanding, it is not allowed, right??

It's allowed to some extent.Use your common sense.
Here it's obviously broken indentation.

...

> > > +               prop_val =3D (ilog2(roundup_pow_of_two(prop_val)) + 1=
) >> 1;
> >
> > Isn't something closer to get_order() or fls()?
>
> I will revise it to "(get_order(prop_va * PAGE_SIZE) + 1) / 2" and
> this change is meet your expectations??

Nope. Try again. What about fls()?

...

> > > +       props->max_brightness =3D min_t(u32, brightness,
> > > +                                     MT6370_BL_MAX_BRIGHTNESS);
> >
> > One line?
>
>  Ditto, it will be over 80 characters...

As per above.

--=20
With Best Regards,
Andy Shevchenko

