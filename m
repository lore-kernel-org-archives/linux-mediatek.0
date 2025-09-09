Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD3ECA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=; b=LdoztUT6uxxPy/P+yrob7Dce7i
	W5r4avC67DpvWQLhDSUqQuTFNW8iKvf5GqtoWJUsM2NutDofXPqI3MjsyGNP7iFXY0MIl8L26PhbL
	H2vSmruIksb+jB+KykdSb08tIC+DxGIEDgTXA2abjVD5ZPJ3SjkIB13NF67ni+RH5btlVonAabAc/
	dMf9+ClJ2gYV3iAB3Z3pm+4tB5Ehqbww26fXCyTmnGQzX+Yp6o824w7iY7BGVgJvLclh3PrYkUbwn
	Rk187apx94ydX0vPiBXmk6u7PFeri5CcD0fxN8P++pdLy+4++4ikdV47DXQZ2aDl+ETJGx2TpAy0N
	apzLR9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw234-00000008zQA-0w1m;
	Tue, 09 Sep 2025 17:22:30 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw04l-0000000801W-0h8w
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 15:16:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6263d0e4b94so6641919a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757430965; x=1758035765; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=dTXkonhGBey2WoNS6BmzvpABED+KulAoytTDZ0R959mQiS+sBkb2n7PbcGSn+vnrkf
         Ybjs9WuN1DYrcn7wfReoB+r+UMm0A3LA+bQddydTrcgipWfRKzrI7e5rcG8gP5RSQTq5
         ZX9afgXumBVeZbxZjZ6MoQmfCqwBUJYUCNoGnsZhDdqUa0ve58AyH8Myjm/wS/HJcKUl
         WE2sUXs4e2kmLfvasBgTu4urFgb83oX9snbqwa7uKCYPfqRFWKurOwj6vhZyEYEi8M9V
         Vr0+EuqYWjYX8zo9RSBmFwUkxL3N8hoyjaiXe/Pc2/1JB37lKLoH7UYStxDVFQV9ImG5
         TofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430965; x=1758035765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhszSRQXIU5hyXmbHS1r8ihhw943QEplSsfQYmIy1lw=;
        b=LGUk4/k6O+NjQCz+6zhFFo1cfI+8M+QdK8DaxdMZ23vrsUL3RbaxKg9aq/kJSmB7TK
         vZm2rl5+ld/CLPXbAKetWib4v5fNLs1V5brczLsXH+XmNzXtse6UW516pPa5d+LSjH9k
         4mDp7w3RO7QtNjYB7anlTlVu06aEc00qk7SL0d3YxujUQLgdTFHutuJqS8Wus6E+uAxF
         Jhog2Vlrund2Qs/s2koHGox6IUuJ//laISG4KjP59MEb1Lh3NHMTETUDybbT4pDg4N9o
         7OCDL+33UcitocViqACS108A/yH5rW3Isc2A0B9HXvX1GxkwiRaBg3MvnDgRy04RbgK4
         AnhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIQwtSMxKBCLnjPtOzEqwCdfJgMA75u8FVjH4OzYcJTazGc2RjtJAfLuN9t1Zx1AwC7zK4Pk4cxjSxfowKiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOuLsF4qv2cE71zpCgGI5vCowZm4/rCJP7IVYJ3KarfVoFQm1w
	ObTgKnVY9Nr7pHgCyX24SgFFMt71Y8TSkDFrjbh5iRgfNZm6NnR+P0RUpNAJGObJ4XhsS/pAjxZ
	cMazj6RLG4RqyX+etsgY7ZzSwI23Bp/Y=
X-Gm-Gg: ASbGncudfwl75z7/HZoEcfRhWSm5S0K6EmKYboEULhP5zX2RH0dzzPv8U41aSU965PE
	3iujtk22JjjAfq05g1CQkYbQxaihtPTW/sQBu0wdmjUfiPDI8iIiucthPvJihiBhWnRVPMuemw/
	2GvRTnf4m4Vwl7gsQIkyVaeH9zS2ISpH3puuRNAkBu9N8KU/Fu1s8wgby37v21VFh25tNcPCwqh
	DSUlyMoWw==
X-Google-Smtp-Source: AGHT+IGeaHcV2kH627FcZIyd8vYLnu/2Up2e6b2i9sBG/bmosVjOp6dqHGnQ87UTIB1WpGArwM97TNlubL6NJn+jj/k=
X-Received: by 2002:a17:907:7e8c:b0:b04:39af:bee9 with SMTP id
 a640c23a62f3a-b04b1003707mr1194942566b.0.1757430964857; Tue, 09 Sep 2025
 08:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:15:28 +0300
X-Gm-Features: Ac12FXySsG8IXlocwCfN3VG6y5KLpIc0a90AoYqlSY-xU72GOTjlNCZIc8n9fs0
Message-ID: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_081607_202527_CAA13EC7 
X-CRM114-Status: GOOD (  21.02  )
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

On Tue, Sep 9, 2025 at 5:05=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
> On Tue, Sep 9, 2025 at 4:02=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Tue, Sep 09, 2025 at 03:56:41PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Sep 9, 2025 at 3:47=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:

...

> > > > TBH, I think those 6 all made the same mistake, i.e. thinking of th=
e compound
> > > > literal as a cast. Which is not!
> > >
> > > What do you suggest?
> >
> > Write it in less odd way :-)
> >
> > foo =3D (struct bar) { ... };
>
> I don't get your reasoning. typeof() itself is well established in the
> kernel and doesn't
>
> foo =3D (struct bar){ ... };
>
> evaluate to the same thing as
>
> foo =3D (typeof(foo)){ ... };
>
> ? Isn't it still the same compound literal?

It makes it so, but typeof() usually is used for casts and not for
compound literals. That's (usage typeof() for compound literals) what
I am against in this case.

> > > And are we not allowed to use C99 features now anyway?
> >
> > It's fine, it's not about the C standard number.


--=20
With Best Regards,
Andy Shevchenko

