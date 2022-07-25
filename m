Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY0j+H2edk5UsmI6A7sNzAv0qZHfigoVGkZeFtNqZD0=; b=dkvMPMOgXv8EgXK0GSSyJanS9d
	cdIsf92mX1Y0Fa3cmpaD5GoyPVoTyqP7ZrPJerdt2PVRtGodcjzc0s183CwloMHFw37gu2YNzVlwd
	KGdOLFj2UUexlIaIBEqG9zKX2iEN1gsPIvINE/QJDrw0meG/jqKvkJyqSKKiZxvDiRrQg1+k1LKfD
	1T+GHOzA1DV5wLz0tHNuJCNtZN4WpZYQqHAxjU87uW+QpkKkeeognMD1Lqe8+nq3BTRt4dgT93ZO0
	lh6M8vzSYPGUnOMMKOWeD/MSn9l3esxxsmEhEnzb2h9dLW9dyN9N9+yRMZyqkIEEzw7ZO4ddMelEO
	nGZk07zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu3T-007KAF-6m; Mon, 25 Jul 2022 09:07:11 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu3G-007Jyr-QS; Mon, 25 Jul 2022 09:07:00 +0000
Received: by mail-qt1-x833.google.com with SMTP id u12so7795705qtk.0;
        Mon, 25 Jul 2022 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IY0j+H2edk5UsmI6A7sNzAv0qZHfigoVGkZeFtNqZD0=;
        b=OAft5TUYAXK6FHwdudrZ3/ylDTgyd7ApXgH3mCQQrEy/AppLvKLTFrPAuRaeFgFtA7
         It8xo2DsjfOuep3j9cWzIbiJND3QEGySnwIZHLW7+dtLSlt+35HbGtRezBb37b4ET1YA
         T08HOavE/cN4KrCVfDqvDb9AfqV938ASpM6+DesVsCpK+wJIO8i1UyBgvsftmWjtDjOG
         FhD3Z5NBfgipr391g2noPdoBVxJJl+Zl02FqMF/RSg8CvI8FVka2TxagkUfxCYyIA8lN
         BEkxNh5JboG7/J/TGmZM68ALnFQGOS8vaYU/EgWzrbg9AQ2GE7pMqCpLXdsGFwSSNDLe
         gkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IY0j+H2edk5UsmI6A7sNzAv0qZHfigoVGkZeFtNqZD0=;
        b=Ub3OT7UU4uG18RACqhEYV9LLc3iLxwFXmXZotZQjuo+1PciGV6LYWe/b/pg2n5k1Ji
         /5SVZCYawGGpJNQMyQI2carn2tXKhdY5Ai67XJrr4J4ddd5akgc4S+MpXMmu29zGJ7g6
         nX+I0QBRzkWjDeYJTbJqgibagjJNX6Sbd+U52JhJYcU1jk87vUTm1QLlx5XLJgTa2G7B
         y+fAH41cFDPAZeaWYZ0autSMR/TBTc9eHTXzMWTStHIwcJy7117pWZB5v9RHnG+Vvhos
         dqW5yb7t/2lZJS1F+G5yH+6rsEwQAQtnTn8gsqPj/02YsJFZlkH0MMn/AkWSgID0zrla
         aLFg==
X-Gm-Message-State: AJIora95IXYX+TALkzr/rGWwyD4HWYGHDH2YkDGpK4PLB0ndOdvrkA+V
	FtAA9XbaiQAbQJZhjujCg4brHON1JwVXOf6vrSM=
X-Google-Smtp-Source: AGRyM1tJSXMumghoATC65twYRnzaQxdiBNYaldY1M9f4DosemyPp1f+IvX7cbVFcEYtBJ2DRVha2cAhiDgReWJ+n9ic=
X-Received: by 2002:ac8:5d49:0:b0:31f:aa:e632 with SMTP id g9-20020ac85d49000000b0031f00aae632mr9318617qtx.427.1658740016501;
 Mon, 25 Jul 2022 02:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-8-peterwu.pub@gmail.com>
 <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
 <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com> <CAHp75VfKihBLjUFqe_Sj5dqTO7-wjLehAF+9_8-sbUeyJ-ZAmg@mail.gmail.com>
In-Reply-To: <CAHp75VfKihBLjUFqe_Sj5dqTO7-wjLehAF+9_8-sbUeyJ-ZAmg@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 25 Jul 2022 17:06:20 +0800
Message-ID: <CABtFH5+LvvcVscRotyRYXhXs1pPkCahbVe0NcSFxC4k_WMMsuQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
X-CRM114-CacheID: sfid-20220725_020658_899233_E4F40806 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, Jul 25, 2022 at 4:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > > +#define MT6370_REG_DEV_INFO    0x100
> > > > +#define MT6370_REG_CHG_IRQ1    0x1C0
> > > > +#define MT6370_REG_CHG_MASK1   0x1E0
> > > > +
> > > > +#define MT6370_VENID_MASK      GENMASK(7, 4)
> > > > +
> > > > +#define MT6370_NUM_IRQREGS     16
> > > > +#define MT6370_USBC_I2CADDR    0x4E
> > >
> > > > +#define MT6370_REG_ADDRLEN     2
> > > > +#define MT6370_REG_MAXADDR     0x1FF
> > >
> > > These two more logically to have near to other _REG_* definitions above.
> >

...

>
> You lost me. Namespace has a meaning, i.e. grouping items of a kind.
> In your proposal I don't see that. If REG_MAXADDR and REG_ADDRLEN are
> _not_ of the _REG_ kind as per above, why do they have this namespace
> in the first place?

oh... Sorry, I just got the wrong meaning
maybe it should be revised like this, right??
-------------------------------------------------------------------
#define MT6370_REG_DEV_INFO    0x100
#define MT6370_REG_CHG_IRQ1    0x1C0
#define MT6370_REG_CHG_MASK1   0x1E0
#define MT6370_REG_MAXADDR     0x1FF // Move it to here

#define MT6370_VENID_MASK      GENMASK(7, 4)

#define MT6370_NUM_IRQREGS     16
#define MT6370_USBC_I2CADDR    0x4E

#define MT6370_MAX_ADDRLEN     2    // Rename
-------------------------------------------------------------------

Thanks!

-- 
Best Regards,
ChiaEn Wu

