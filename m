Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83211C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 06:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iTBFaujydfzjNtZ+tuEW42yh94kmq7eTQthHnu+Umc=; b=2MRc3Wv4629HDA9KH2MIqERiHG
	jEpFkf6RC1b3rRj80JripVoL8qamzcdNj4N42Xm8Ctls2n4EpubNuPuF5p5koUvgUffCaCHelSWgN
	VfQ17S2bTdk5O9TQyqDExQumJQ/4gLSxp66TSSavK6UsnYDgMWOaVpI02DYrkWooWH9465STqDDSS
	fEeYEi6dxamnXubXCrxN8Okoo8gY5m+PcyZQJIv57415ttbxn1aJRVG8rOZt3V3aHM7IOgY7EjljK
	6jg9SWGHxwwbANNyfG6nHHsnIDr7ZTHazAbrWWr3QXsPz2cGAK9DOg3hkcF0vN1l6N9+MV6nDUZgT
	KmdPVdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGDnL-008eyq-GB; Tue, 26 Jul 2022 06:11:51 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGDn4-008eqY-2w; Tue, 26 Jul 2022 06:11:41 +0000
Received: by mail-ed1-x52c.google.com with SMTP id w5so4071415edd.13;
        Mon, 25 Jul 2022 23:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5iTBFaujydfzjNtZ+tuEW42yh94kmq7eTQthHnu+Umc=;
        b=DFreK31JfLkd3fAd0uB7CR6gjxpG6yBsGmnlSdQdVK9K9Iop3MmbjSc5l5Mqska/9F
         6zDsLVWtd4iSJbART2yOrMPnU6eocnuJbVN14OsRvUxL4fHsO7Wrgfc2UhIcTUjufoph
         2DxioqWBkat/Lt1MPd86qgmI4fJ9X5pOYvgIQ3L8XLGI4V6pl/+7xrFDCD36BkcmbO3v
         msDZGsDArMOOY56AIoIP2Boyoi0IybH+bd3McBS1U0EmQcx61Apt04nGaujtweQDBRAO
         5Sbq2NspvHrUHv6ggNUA5i+nF0w1W6dwyWvXZUzuukyS0Uo/f8jv4B+Fz7jfoW/fM0P7
         F9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5iTBFaujydfzjNtZ+tuEW42yh94kmq7eTQthHnu+Umc=;
        b=F8ywcHrbqU4zP0fZmFgphxStWqrGitaUkGFmP4Ev7ezHUDoP5yd//7KhyY5EoHDJry
         oaOt8E394d1CuKyXmg4nP8H2Rbu1+knEPgbT1oCjvcUy8vFmqtXNpZPvTKcQrMMim6L2
         /KoQrW0YhKo7k2Pnn8d0YVU1khNTrAYhQQyaNALI7n1phIO4LJS1R5H27iGkEal4eRpD
         oedjwehiGfgkfQX9LriWYR3kjAKkyehNoS6qqkh6nfPYpc2aIq9T3Bjt2Y7ILvlsZvmE
         FI73vBfltl4W+6KYzCwY6KrDaZFzmuc+CZBIP3gfkhzi/buKfmm3wmqigKG2zlonTvUz
         xMzg==
X-Gm-Message-State: AJIora+vIwYwntLfFq61hRuCHI939SfIcQ+ku4cEYdK9d0A0H4hz3EYh
	hU3g4hLlziUXyoL1i3qEJ+xv6rbVeikmCmldz+s=
X-Google-Smtp-Source: AGRyM1sDJR+2SWBXIadraV+/yk5L7Vs9denzeP6s+Yyxwc5C8W1vNP4hRGI/bOS7pUxW1lVGaWNV5mppOqxOjOJF8tE=
X-Received: by 2002:a05:6402:d05:b0:435:b2a6:94eb with SMTP id
 eb5-20020a0564020d0500b00435b2a694ebmr16409469edb.87.1658815891980; Mon, 25
 Jul 2022 23:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-13-peterwu.pub@gmail.com>
 <CAHp75VfgiK87VwWu2bTJ_mR0=g0sa0LPJ+H16OGcUdARmzFRSA@mail.gmail.com> <CA+hk2fYpDRw+DRRU3m=EDOP6UEQNpJLyNBHe8Zi0qOfUObTb4Q@mail.gmail.com>
In-Reply-To: <CA+hk2fYpDRw+DRRU3m=EDOP6UEQNpJLyNBHe8Zi0qOfUObTb4Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jul 2022 08:10:55 +0200
Message-ID: <CAHp75VdxWfo0QW=SXc0v+Ue92VO1TbpTqAqHT6mAK=GA606oFg@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: szuni chen <szunichen@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
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
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_231134_174134_4E3CFE88 
X-CRM114-Status: GOOD (  22.85  )
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

On Tue, Jul 26, 2022 at 6:15 AM szuni chen <szunichen@gmail.com> wrote:

...

> > > +#define MT6370_ITORCH_MIN_UA           25000
> > > +#define MT6370_ITORCH_STEP_UA          12500
> > > +#define MT6370_ITORCH_MAX_UA           400000
> > > +#define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> > > +#define MT6370_ISTRB_MIN_UA            50000
> > > +#define MT6370_ISTRB_STEP_UA           12500
> > > +#define MT6370_ISTRB_MAX_UA            1500000
> > > +#define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
> >
> > Perhaps _uA would be better and consistent across your series
> > regarding current units.
>
> Yes, _uA will be more consistent, but in general, using upper case in
> the define macro is a convention, doesn't it?

There is general convention, but there are also:
1) common sense;
2) usage in practice (e.g. _US, etc for *seconds and _HZ for *frequency).

My common sense tells me that it is convenient to use mA,uA, etc.
Plus "in practice" it's related to use as in your series and elsewhere.

But of course it's minor to me, decide yourself.

...

> > > +       /*
> > > +        * For the flash to turn on/off, need to wait for HW ramping up/down time
> >
> > we need
> >
> > > +        * 5ms/500us to prevent the unexpected problem.
> > > +        */
> > > +       if (!prev && curr)
> > > +               usleep_range(5000, 6000);
> > > +       else if (prev && !curr)
> > > +               udelay(500);
> >
> > This still remains unanswered, why in the first place we allow
> > switching, and a busy loop in the other place?
>
> If I refine the description to
> "For the flash to turn on/off, need to wait for 5ms/500us analog settling time.
> If any flash led is already used, then the analog is settled done, we
> don't need to wait again."
> is it answer the question?

No. I'm talking from the Linux APIs perspective. There is a huge
difference between those branches. Please, conduct research, read
documentation to understand what my question is about.

-- 
With Best Regards,
Andy Shevchenko

