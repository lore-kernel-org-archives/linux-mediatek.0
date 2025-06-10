Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D54C71130
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 17:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48R6rmcYMdLE2oI43bVdlx+c/dGz3JTf+F6/kFw0QQY=; b=MrOSq8BWDBU6OdJtWLL2ODqJl/
	fhr32ywjd6pJ+XbjkOmwnTMCudO5dzEDkalrfr4zVwGs0s+QvGHjcZRpa7L4HO/5ct+wZ+arybZs0
	ED8W/Ib6zUS2ZBweFUnNL+I9uzi9Sn0tXr4IoCS12DNqzVvaik7J9dfW+TVOVxb3ZL05ajaCwT4Uf
	9T+MfY90PVafxidmUGf1uHiVqoFI5fNxJLy/UJVmmogndHxXDi6hb7lRBIvgHb451Vt7HV3rrkiYB
	5kp1ZFOB3xsZ0l6+oJ93s4kBAePl/g4XYVTBNacqQukzuR76WD2DWyX4wnfGx+Ycn/fnCwE8Qp2gz
	NrXItymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2Tj-00000007a03-3f0A;
	Tue, 10 Jun 2025 17:09:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzc1-000000074vv-2X5C
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Jun 2025 14:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=48R6rmcYMdLE2oI43bVdlx+c/dGz3JTf+F6/kFw0QQY=; b=kfes+GuS4C4BeFLviVH9ljU5o0
	Tuyw1kC95WpOW5j8Y+paGqAH5mMVMID34Fe3di6TE0UTjUZZNyNb/Pfjh7Ka9GYDQsZ0DORTf4xaz
	aA/g4VaRvhuzKOwdkRrZW0u5KqEINTwwxYP7CHYyH8Qf8abriRNsQ3HmViljfDcYXgQoxJPHSdUdk
	zEZOyzaoYJNDHLciJbeosmE7eT3bPttmr7AnqBlvGdwhO0fJvFOq0lVZpsvvEA9/KRnAZNhhE8hIg
	YVYDVj4P++UaSyQXgIAEEFkyhf9bC7kdBuaUDNydjbM+EeC9BbGezNQzkaJCdlODIrXb2+eQxPPVH
	6FCQAZow==;
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzbz-00000001rDO-28Bb
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 14:06:01 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so55733331fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749564356; x=1750169156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48R6rmcYMdLE2oI43bVdlx+c/dGz3JTf+F6/kFw0QQY=;
        b=Nyuuz8/z4Y8l1OAAuvVNzW1Um8XvD6TUamkMKz87TuweND+cffD2qrgI1y0Auonz8j
         wIMV8cAMGGwI9ipfAjVr+RcCW3daepXTlJfXECjh6hS97ZhA0t40/if7VEUJQEy1tjOM
         qZpTy18N0rUWTVcs/SmrOAXUPz/eu4ZnSi54LP2NlamdVIhMNS8DULIT5o/XruIlejCS
         /akoYMImj3PfgS9WlkOunpZgzxZSkF/iXQw0Cp0S8wvWT+cGDgCOO/nGYBij+6IHFWiX
         +imLQNM4VK2I+amiDNHvELnpw8lXy9kWGLTSPLdXuMeEjtrX/VyQ3fDFUIK3ASW5zIGp
         jx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564356; x=1750169156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48R6rmcYMdLE2oI43bVdlx+c/dGz3JTf+F6/kFw0QQY=;
        b=sMIrKfxskLia/9r+t+s3RrmMpJ/o4w5zQhTz44bAAlfNeMdHU3htR7gq89yvMAbocu
         BQmR6srh8YLQwfujgRFukLsf1BepZBXsYbntMDH9ybtslcdWb/nL1h+op8BKRDEgI14L
         R1lH4FeZ14/qu8r2EvZqgTT7QYlAXWRqKEth7fI/xTVIDkhY5XOg5sdmjsF6A8p8riMd
         ItCuJ4h/QHrVSiQSYW0ip5MGmRqOcwM7wXm9E2Bs6OzLi3XdEPiMnT/V2BMUdkUXP+bg
         WzeyiiMV/nzaZF9eLbz5n7iry7PE68IVwCdIvLXxBC7fmFfOJ54gHCtZHxkclHS5N+vV
         K9NA==
X-Forwarded-Encrypted: i=1; AJvYcCXN7Yk9ZPoj8bVnSKCEJtl5jnxxqURY5HJ9QVE2k19aTBGInUq1Ly77mVT/Rp7VyJdH/PUVidlAg06Xby2vLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw0Sc2h9IqqXhD5989UrMLs8WCBpsFl6i1GY8Q1+7EDhcukDmD
	gjcIUTWIObl2e3jQ1RUF0qumX4ngv8EM6OQC6bsRwu4+pjY2nGNJhg0QUS4UL6xV0tTVCdyDHGX
	z9tRvq/zqiqwuEDb9LZPOEATg7PjPxwIJ23D1oFBdWQ==
X-Gm-Gg: ASbGncs/4Aih+aBDljSsNFUgoyPYuJPf7lLnbptRm1F8K2qpHttz+9RDB1TmJQpIk+C
	l+UyjdRuyqfH+t2GdyUW1AHPvCuOIlAHH9J9AyuImlHbYS4Sk7f8WEZ4IbNdbGD0KIpIpZXqGGW
	wjWH1GmRvbOrVdVbOVZeT+Evn/wZaBSshuv2emR+jK1CM9INcZrBSCsA73BqsvnDx/W6tWgdVA
X-Google-Smtp-Source: AGHT+IGMo5nFepHm6Jb8myrJnf1+8r8NeSUFkOpNLmlYqlQxjgnpXV7nPyOaCRaS1k1ZDZMWIDYqubJ68xfi3XL0kUk=
X-Received: by 2002:a2e:a585:0:b0:32a:85ad:2148 with SMTP id
 38308e7fff4ca-32adfc55558mr48698001fa.8.1749564356227; Tue, 10 Jun 2025
 07:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
 <20250610-gpiochip-set-rv-net-v1-3-35668dd1c76f@linaro.org> <b2f87cff-3a81-482b-bfdd-389950b7ec8e@wanadoo.fr>
In-Reply-To: <b2f87cff-3a81-482b-bfdd-389950b7ec8e@wanadoo.fr>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:05:45 +0200
X-Gm-Features: AX0GCFvZApBk6UP-dxTG2kWDbOfc7qUQfTVpw2yDagExp_rgnAnOYdtyDfv1kN4
Message-ID: <CAMRc=MfCwz3BV15aATr_5er7wU=AmKV=Z=sHJyrjEvLwx2cMjQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] net: can: mcp251x: use new GPIO line value setter callbacks
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linus Walleij <linus.walleij@linaro.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150559_805414_B06AE336 
X-CRM114-Status: GOOD (  23.35  )
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

On Tue, Jun 10, 2025 at 3:55=E2=80=AFPM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> On 10/06/2025 at 21:37, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> This does not match the address with which you sent the patch: brgl@bgdev=
.pl
>
> > ---
> >  drivers/net/can/spi/mcp251x.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251=
x.c
> > index ec5c64006a16f703bc816983765584c5f3ac76e8..7545497d14b46c6388f3976=
c2bf7b9a99e959c1e 100644
> > --- a/drivers/net/can/spi/mcp251x.c
> > +++ b/drivers/net/can/spi/mcp251x.c
> > @@ -530,8 +530,8 @@ static int mcp251x_gpio_get_multiple(struct gpio_ch=
ip *chip,
> >       return 0;
> >  }
> >
> > -static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offs=
et,
> > -                          int value)
> > +static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offse=
t,
> > +                         int value)
> >  {
> >       struct mcp251x_priv *priv =3D gpiochip_get_data(chip);
> >       u8 mask, val;
> > @@ -545,9 +545,11 @@ static void mcp251x_gpio_set(struct gpio_chip *chi=
p, unsigned int offset,
> >
> >       priv->reg_bfpctrl &=3D ~mask;
> >       priv->reg_bfpctrl |=3D val;
> > +
> > +     return 0;
>
> mcp251x_gpio_set() calls mcp251x_write_bits() which calls mcp251x_spi_wri=
te()
> which can fail.
>
> For this change to really make sense, the return value of mcp251x_spi_wri=
te()
> should be propagated all the way around.
>

I don't know this code so I followed the example of the rest of the
codebase where the result of this function is never checked - even in
functions that do return values. I didn't know the reason for this and
so didn't want to break anything as I have no means of testing it.

Can you confirm that you really want the result to be checked here?

Bart

