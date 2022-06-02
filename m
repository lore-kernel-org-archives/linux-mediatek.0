Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5F2C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5tW43FZ0OPHZ9pHl7rhsFmjZOZqZSR3S03RgsHMVbQ=; b=r0yjwUDsCD8hEI
	PYQ/tYjKQ4I4XYcyHA4XJV97OYsRYx7xvI6MW/e3UuqSYe2SDLXgHam76FVjGkvpCiFzbR71SnUYU
	cqMVg6U7IIE6c31SLmlpGoapeJbh4PR/Eki0GbM8fUpDs3lpATIjh2qkMKNjkk3r/E0jurxwqmc1I
	WG0JX3ShaoA58fxtwNM+YjPpncTuaRssyHJMKC6h+vR0gE9/M7lz8fvyE4uB/EbSEL5iQ6nJFqfZj
	wDE2e1+fDW8MkEIUhLOA4JLSSROtmSofTtCJd/k3x4guyY9uotLGTv7bwTC38nith+m6N3zZuSMcP
	GjYvQj7d5ZZKvHnmaTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwgyO-002Q80-97; Thu, 02 Jun 2022 09:18:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwgyC-002Q32-Ds; Thu, 02 Jun 2022 09:18:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id rq11so8770386ejc.4;
        Thu, 02 Jun 2022 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0d9LPcPl2z82dxOAeBz8oaTNCeFfF1mrJ8xfIO9HyHE=;
        b=lfLh9e2Zec+kRfUbieDqxaSJGfE2gK5tVDQL4/AlpgVcAAIBNipxqiaQ9KaF31NRoL
         p4XLfqqfzJDaVnItedh+uY7WOZo9GWfO9EDs7Kwtb9g1ep7F/2s8jmC8C+5HKoB8mmqm
         5+MnNkvj0n3QFu1KLRgu4qmE4FZpPqT/FxCabwWRio16T/tBO5n8YQs39umvhQZU1izc
         kmND1i4pFf63FZslDTQd5TX2paKc+iavMXEEIfxzCgFARk5C9xBN1i2j5XO5tazLpbL3
         wIlyYfmxX1H8YiEs73O3/gKRJfzGSjM99weIY/3wRiXAWXYqSVXb5yR9RaF0dJyLJck3
         HKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0d9LPcPl2z82dxOAeBz8oaTNCeFfF1mrJ8xfIO9HyHE=;
        b=3JQcCUFgetTdD62xGycE6AlIfMXM81FUZsLvOKp3j1EGKEvpkBAkckQ0nEngTwMBif
         25qulS6WbS1jd7FG1briQco+ADtLTsaVbXK94lgctVD8lPasBAj8pGKTWZ+yNDvHHvuQ
         EOyUw9WLvYg0dRIx75vL9x1GjaAHkiNtAuzPR4gATAezaRKER3IGq+M1/3mEeMOvP8gd
         a9PCFQY8xLDoGtEaKGs4HntyP4PQBETWf6cDJcntRx5gFdGEV4YWMHsPr+OZwHB/WWYK
         yz5O2X4lsglip4BFl/nrrZzfWI4fN/oz4QDG9dB8vYNn6l7schUeeQXRgHW71eAUr6do
         BJhg==
X-Gm-Message-State: AOAM531vH8Run8Pxqogmk93QARhtU+qAv+A5G0LC0xoZpmT+fh5DwJYP
	mo9DMiQSxR7+03zQOJjhyl/MwL5PciQ2nbbxp+A=
X-Google-Smtp-Source: ABdhPJxRg1MZXl/SkbIUuNBrRuGNQldHFdLPZxE+GhC/BiCEKh8oflGlAj5dFnKQFyQ9Ns7hxKjhAhvcKy/fq3rTsjo=
X-Received: by 2002:a17:907:6e04:b0:6f4:d6f3:c72a with SMTP id
 sd4-20020a1709076e0400b006f4d6f3c72amr3415411ejc.636.1654161497069; Thu, 02
 Jun 2022 02:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com> <20220531102809.11976-7-peterwu.pub@gmail.com>
 <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com> <20220602062643.GA13824@cyhuang-hp-elitebook-840-g3.rt>
In-Reply-To: <20220602062643.GA13824@cyhuang-hp-elitebook-840-g3.rt>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Jun 2022 11:17:40 +0200
Message-ID: <CAHp75Vd-n=oLnhRCK=pR5ybOZbC6BKXrE2jRdwDbH90E4KYFGA@mail.gmail.com>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
To: ChiYuan Huang <u0084500@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220602_021820_506492_A1A2E083 
X-CRM114-Status: GOOD (  20.26  )
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

On Thu, Jun 2, 2022 at 8:27 AM ChiYuan Huang <u0084500@gmail.com> wrote:
> On Wed, Jun 01, 2022 at 11:48:58AM +0200, Andy Shevchenko wrote:
> > On Tue, May 31, 2022 at 1:16 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

...

> > What indicator?
> It's RGB curent sink type LED driver (maximum supported current is only 24mA).

Make your commit messages a slightly more verbose.

...

> > > +#include <linux/of.h>
> >
> > Are you sure this is the correct header? Seems you need
> > mod_devicetable.h instead.
> >
> It's the correct header and be used for the struct 'of_device_id'.

Nope. Run the following command
$ git grep -n 'struct of_device_id {' -- include/linux/

...

> > > +struct mt6370_priv {
> > > +       struct mutex lock;
> >
> > Do you use regmap locking?
> >
> MFD regmap register already the access lock.
>
> This lock is just to guarantee only one user can access the RGB register
> part.
>
> Sorry, from the comment, do you want us to rename or remove this lock?

My point is, since you have two locks, explain why you need each of them.

> > > +       struct device *dev;
> >
> > > +       struct regmap *regmap;
> >
> > > +       struct regmap_field *fields[F_MAX_FIELDS];
> > > +       const struct reg_field *reg_fields;
> > > +       const struct linear_range *ranges;
> > > +       struct reg_cfg *reg_cfgs;
> > > +       unsigned int leds_count;
> > > +       unsigned int leds_active;
> > > +       bool is_mt6372;
> > > +       struct mt6370_led leds[];
> > > +};


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
