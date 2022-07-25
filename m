Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E26C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBUjOXPSyxIp/ssA5bMpYCLKWAJ3HGf2reVDfO9yM3o=; b=BpY1psLlW16Fuw9YA5Rn+XPVVw
	kBLJUtZelp7vJrj5U+I+KNVMfTIp/bSjOR/eMDOJtJFCEtp1oKvNVRm2lU4r8cLQz8kJCc/ttiRiA
	p3zyaNbfL5gz+jxFzO+UNXjvmqVjSbJ/dHxsz8TuMX30Q/DTGULk8aa7TxzTA2zdbMomWTV6UgmBj
	V4jSDQ/ArLsVFV4EZEojPhQYnK5bzOfMgUcgYIUyEFC0OVoQXKYVWQgGFGk3jfM5Op3GDSHnzS3eW
	RqI0F4B5CDvHUYFD8qpc4BoZwXAOgg3GQ6T5epi5czz9ZMTevhzUj9m0D3+bKccgGOxYoFlPdiw+f
	Z+gZmSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFth2-0075rR-Dq; Mon, 25 Jul 2022 08:44:00 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtgl-0075fz-66; Mon, 25 Jul 2022 08:43:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id p5so1979169edi.12;
        Mon, 25 Jul 2022 01:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gBUjOXPSyxIp/ssA5bMpYCLKWAJ3HGf2reVDfO9yM3o=;
        b=ZcloaGBXNWKgwFGhN0tBCVgGN7mKJ0l57wi/gxiOCcQ3btK6lq9SuR+ZDWopqPFJwr
         QtH+fUQor4bu6z6i3Onr2HRzeQyO9JOs9GcWZvML3s9jvPJQnd/sk2l56CU4eOkmNXQj
         LqLK8afv+vA1SA6f+pxw6kwJwYDOpRk9RKfUzqG3YfKkkTmnHl6JN0Bgs4bLgrYJH4/G
         DwVst0E8Wq+wDqCv4Rf6WiAWX6k8ZbwXfY2/046oEtgbBla5lc4gNBqV8JGbD5c944lY
         EL1jChoaIjqEM9Bwbv2uv0Do0n4Vre3jmkyldcj0zTNhXTJcj/3JcVpHUBK+rQNRfl5E
         JX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gBUjOXPSyxIp/ssA5bMpYCLKWAJ3HGf2reVDfO9yM3o=;
        b=op5a2xecAgqzWZfKb3Gc+m3dmahLvx2tJuuFhNc2GcjEwfheBppJ15WX+2SiSI/93H
         fBMfpp9Qk84To+yMS8ZUcazsgJQtRKcSpqHIrYzS7hw6u7pjGky0MuzpbNtxkq16oAx6
         BvW/88VRg09HNKZkFcjtHaEZlHC8YkmtV9RhI/Wd8cz9azbMJAWVujEqWLa0ph8gAv2a
         UfFtavyd27XjonIrfXn58DSCbaPIgBe9lEPcsPJQPYod9cbo3NSmsJ/ywA9P0oqIANqu
         +txQj0OKmrdAWNDZOgQ4xubg+iF77d5zrc+elpjwXelNk6C5cfR8YOgOUkjx3NS70PoT
         HMxQ==
X-Gm-Message-State: AJIora9HwEdH/K2Z8wcGPv47a/Dl4B+pMdV9+nM+HVdRYSG8C4dNtCGc
	0pUVaTjuADU3GrA92KAWCz1WQEIH+alLPdXeU1s=
X-Google-Smtp-Source: AGRyM1soQCq75MmbI4ONQXkzNoXoyDLrEe84HYxRimv6nF0nPZqyoEzx4IbLZDEZCEsYL6EGcqoDhOkMKbKf9dD+JE4=
X-Received: by 2002:a05:6402:254b:b0:43b:d6c3:dd96 with SMTP id
 l11-20020a056402254b00b0043bd6c3dd96mr11626028edb.406.1658738620885; Mon, 25
 Jul 2022 01:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-8-peterwu.pub@gmail.com>
 <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com> <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
In-Reply-To: <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:43:04 +0200
Message-ID: <CAHp75VfKihBLjUFqe_Sj5dqTO7-wjLehAF+9_8-sbUeyJ-ZAmg@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_014343_261159_56E5AFD9 
X-CRM114-Status: GOOD (  14.34  )
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

On Mon, Jul 25, 2022 at 10:30 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 4:00 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> > > +#define MT6370_REG_DEV_INFO    0x100
> > > +#define MT6370_REG_CHG_IRQ1    0x1C0
> > > +#define MT6370_REG_CHG_MASK1   0x1E0
> > > +
> > > +#define MT6370_VENID_MASK      GENMASK(7, 4)
> > > +
> > > +#define MT6370_NUM_IRQREGS     16
> > > +#define MT6370_USBC_I2CADDR    0x4E
> >
> > > +#define MT6370_REG_ADDRLEN     2
> > > +#define MT6370_REG_MAXADDR     0x1FF
> >
> > These two more logically to have near to other _REG_* definitions above.
>
> Hi Andy,
> Thanks for your review.
> Do you mean that we should move '#define MT6370_USBC_I2CADDR' and
> '#define MT6370_REG_MAXADDR' after the line '#define
> MT6370_REG_CHG_MASK1'?
> -------------------------------------------------------------------
> #define MT6370_REG_DEV_INFO    0x100
> #define MT6370_REG_CHG_IRQ1    0x1C0
> #define MT6370_REG_CHG_MASK1   0x1E0
> #define MT6370_USBC_I2CADDR    0x4E
> #define MT6370_REG_MAXADDR     0x1FF
>
> #define MT6370_VENID_MASK      GENMASK(7, 4)
>
> #define MT6370_NUM_IRQREGS     16
> #define MT6370_REG_ADDRLEN     2
> -------------------------------------------------------------------
> Like this?

You lost me. Namespace has a meaning, i.e. grouping items of a kind.
In your proposal I don't see that. If REG_MAXADDR and REG_ADDRLEN are
_not_ of the _REG_ kind as per above, why do they have this namespace
in the first place?

-- 
With Best Regards,
Andy Shevchenko

