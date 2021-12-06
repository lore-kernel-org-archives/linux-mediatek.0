Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23737C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZkvGyGMXWJmf0oqRUQab/Ug1BHBcPRTQODUA6tQylc=; b=4Y31TUOXHZxklq
	Ity9lYPjeh48lwyRtsP5efXkdRlwA/oGat2OYjryx2Dst5Ve9WUuVDKfOiMJ/bp0pDmbpfZ/B+TfL
	YiR+c61VVcvXIaqHu9l5DHMYJ7nJC8unMKK6AgsAaEvEZLUAF9rkuQKiNHlTlPPsDIJuBCQerZR7/
	tGWgM1pc5o5WkhURPaLtRRa1iqgzNBlxGpk4iSumdxaZmbdgsuosMB7PquOcILr+IbDPf231ct0m8
	/xDnGokd8jQqKFSu283yU++x3QtM2UOQH4gw87xSt3u98R0oGmY1qKsR3rBl9BdimaVw3DhicH4MS
	7sXIqz4nHZ9BGP+0UAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muDuc-003zlU-Bp; Mon, 06 Dec 2021 13:20:10 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muDuY-003ziP-CP
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 13:20:09 +0000
Received: by mail-ed1-x52c.google.com with SMTP id o20so42832376eds.10
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Dec 2021 05:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hvZZ98+ZsTYkg5d9GGJxZP1sUx5SwZWVJ8siiSeTEiQ=;
 b=2MOQRTdPkwhZdrDsZF8v1LkIe9VhVcu+CnHsKM9OdXefuBhdam0kh3pKuY/iXJ4jwh
 zU6Pi0uyyixDjjwk/OQSxSOoc3iQ4xccBh7VU5XFj2RJmmXBFIQ5+C1z5IVbt1IIXZI9
 dWJnZb7vMFYt3V5p/nBP65LNmmSKgBcIPbBTYhEdVlTDWAEZK/VS4uN6PLzPx/US5RWz
 mZbpnIm91JPS41EBzCzQXFGe1mimok+Yzh24z3yokPYDAKM6CqgeVZv0RUMAMUb6bGfj
 4BUxGDcldPfeerU2uRtK9S94iyKNhrpwRqnnngf6pKx2tQNdE8FduPUAGoYjZpp5I9Hz
 mHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hvZZ98+ZsTYkg5d9GGJxZP1sUx5SwZWVJ8siiSeTEiQ=;
 b=veGyooPih6ZjQlsZ3/MGjQJd2C+igwxrAXqlisgvzjmhMqTxXfPUaFFgfLbhk1ZYHa
 +/eIQLPxhrEIHt0aTbzSNm/0hDxD1FVUyrJiXV1p/vGZN6Y095Xh8iRo0M2qMmdZHdAx
 xDO4+wSHJcLwwXXA/eHatdxGs5b9oEbtyP5gqVYTVZA4bWx+jiW/5QGLdVinC9hjJCaw
 V4Fv9l1ZwNVrGFMs0HPe4SNWutG4k+6s5xutcTsNEP9K+dOqBjCQjckXXT7kPOYLC+Y1
 s3sbGOhDbbRVik2Q+15CJPlr1ABdafj0LfieKpFsBslp1Rh4Bd286fDG2HS/hGy6Vz6a
 p7MQ==
X-Gm-Message-State: AOAM532N6nZHzUMduExs8kLmR8rbf1TkptSQJla0JzVkgDIRpdeLlhmL
 8C4lFO/HNnIf85Dyrxya+T3m6mn5cEVlQ1HzH886LQ==
X-Google-Smtp-Source: ABdhPJxT2dlCIImgLcO5pXZfgOHvmQ1PFmCORP62C543H7xjg6esBcWHlJIUNIvBYImdxEeNXjaXGHzx8AiVjQpaFnY=
X-Received: by 2002:a17:906:7b53:: with SMTP id
 n19mr45793820ejo.538.1638796804233; 
 Mon, 06 Dec 2021 05:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZbpKqG_uS2N8TW2-HL5CqnuKDpHVCabf66MyQQof0jOw@mail.gmail.com>
 <Ya4MFMWSyj4YbdNG@smile.fi.intel.com>
In-Reply-To: <Ya4MFMWSyj4YbdNG@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Dec 2021 14:19:53 +0100
Message-ID: <CAMRc=MfHir4B3X=Hhkb1_VBQJFE17=YEexDa-+cs2LnFASPRkA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] gpio: Get rid of duplicate of_node assignment in
 the drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>, 
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, 
 Baruch Siach <baruch@tkos.co.il>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Jianqun Xu <jay.xu@rock-chips.com>, 
 Alexandru Ardelean <aardelean@deviqon.com>, Thierry Reding <treding@nvidia.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-power <linux-power@fi.rohmeurope.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 linux-pwm@vger.kernel.org, 
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-unisoc@lists.infradead.org, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 Scott Branden <sbranden@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Keerthy <j-keerthy@ti.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Lee Jones <lee.jones@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_052006_551083_894BF8A0 
X-CRM114-Status: GOOD (  30.85  )
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

On Mon, Dec 6, 2021 at 2:13 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Dec 05, 2021 at 01:06:07AM +0100, Linus Walleij wrote:
> > On Thu, Dec 2, 2021 at 10:17 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > GPIO library does copy the of_node from the parent device of
> > > the GPIO chip, there is no need to repeat this in the individual
> > > drivers. Remove these assignment all at once.
> > >
> > > For the details one may look into the of_gpio_dev_init() implementation.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > This is definitely a patch in the right direction, as Bart says
> > it can be a bit dangerous, the outliers are those drivers that
> > assign the .dev to something completely different than the
> > the dev where the of_node is copied from.
>
> I carefully checked these all and this patch series is only for the cases
> when I'm sure it's the same device, which is used as parent, and its of_node
> supplied.
>
> > The idea was definitely always to only assign it in the core
> > *unless* there is a reason to have a completely different
> > of_node for some reason.
> >
> > > +++ b/drivers/gpio/gpio-rda.c
> > > @@ -240,8 +240,6 @@ static int rda_gpio_probe(struct platform_device *pdev)
> > >         rda_gpio->chip.label = dev_name(dev);
> > >         rda_gpio->chip.ngpio = ngpios;
> > >         rda_gpio->chip.base = -1;
> > > -       rda_gpio->chip.parent = dev;
> > > -       rda_gpio->chip.of_node = np;
> >
> > Mention in the commit message that in this driver
> > you also drop the the .parent assignment because the
> > core will handle it.
>
> Okay, I will update it. Also I'll update to the last codebase (dunno if Bart
> is going to pull the IB from Lee where one of the drivers is gone: da53cc634cea
> ("gpio: bd70528 Drop BD70528 support").
>

I didn't plan to, just drop it from your patch.

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
