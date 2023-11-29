Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A44C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PopFwY+hhIZfxVE9aZTSkJkF/ON9bFHv/e84VhxRzic=; b=yZiIzqnILZM2rXSvRHd01plzPu
	HB0gK3hyQ3lN667TjVd32SDW8jiJmL5tjGM3eom8ClQJTopvlu0Mi+lxrFGFQPaEV+Be8+Fl8Hx9E
	KoBiWjTcm9AHG8+DRtsyDKHLwCaRmN33Sd+KRSTYrqY3FpegiuF/q1tK/xmq6UiueLyP4cJonoRXU
	FcqfDydS6mem1jYJkt375t/UqlWuAUZJHNw869Thtoj8Dwy2b4+hR6MjNTQLeHe+njVu7PJNC2rC2
	bM17oBckQKJQK7MSM5l65WmFs8CBRiS6meDvheNxBhZax4q4ArS2z3Ys3WJ4xLFvq4S1ekQ17abt3
	F/YvNT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8MaD-008lPV-2L;
	Wed, 29 Nov 2023 15:34:37 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ma9-008lOJ-1j;
	Wed, 29 Nov 2023 15:34:34 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5ce8eff71e1so51041067b3.0;
        Wed, 29 Nov 2023 07:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701272070; x=1701876870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PopFwY+hhIZfxVE9aZTSkJkF/ON9bFHv/e84VhxRzic=;
        b=WZ3xlasz8AJdSaGDmRHmSN8h41mQWSCveo6T94f2sCZO5DY5s4ZBzAQ4pzoDVB3X34
         N8u9Fqk/oyBwNA1YWL0DI/PgtdllJgK2S1MEtxVRhZep48CWDWvIge56fgg9Bzut6JGS
         JeaL+Zi2bVVRIq0u1e5iP+DmH/6rln/babjipPqWqdHFiLXK1K3N9mKi2K/EmqCwRyl0
         LDbA8lZNn609/CwKjD6Nr56Aawu1nprvn2bY5SU2Zyksyf9UdW3T2j65DvpDj2f6ZKEL
         tBbSK+rfv0QHP0K0xAbJFRyAEEqXG+FXk3TclNQJVbp59NsaiisqOj0aBBorXm47HKKp
         Y7sQ==
X-Gm-Message-State: AOJu0YwwDI+AS2mEPpMJkFNCH+dZYMdvvllIe4aXtCKu2GCZL4QmDysC
	UxZaOI2eXw9C0iG6LQAF18SdmBzRUD+NjA==
X-Google-Smtp-Source: AGHT+IECZ+eJVb7vA9fFc1GpFkQoM4v+DT3Aron27YVfyUyLLnKRTIf/akysYGdQHhX6AgS6vOkv6w==
X-Received: by 2002:a81:8546:0:b0:5a7:aece:7e59 with SMTP id v67-20020a818546000000b005a7aece7e59mr17704103ywf.50.1701272070367;
        Wed, 29 Nov 2023 07:34:30 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id w204-20020a817bd5000000b0059f7ca6beb4sm4591245ywc.55.2023.11.29.07.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 07:34:30 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ce8eff71e1so51040947b3.0;
        Wed, 29 Nov 2023 07:34:30 -0800 (PST)
X-Received: by 2002:a05:690c:fcb:b0:5cf:b2cc:cf5d with SMTP id
 dg11-20020a05690c0fcb00b005cfb2cccf5dmr12967096ywb.5.1701272070101; Wed, 29
 Nov 2023 07:34:30 -0800 (PST)
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
 <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
 <ZWc_o4Dcsb0v5TGB@smile.fi.intel.com> <ZWdJUBNMYj9qvCf2@smile.fi.intel.com>
In-Reply-To: <ZWdJUBNMYj9qvCf2@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 16:34:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfMq=nuJhDSq6QFr-hev8af1UpHRAD4g5heVTgQ+7qWA@mail.gmail.com>
Message-ID: <CAMuHMdVfMq=nuJhDSq6QFr-hev8af1UpHRAD4g5heVTgQ+7qWA@mail.gmail.com>
Subject: Re: [PATCH v3 06/22] pinctrl: core: Make pins const in struct group_desc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_073433_571087_E0438652 
X-CRM114-Status: GOOD (  27.36  )
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

Hi Andy,

On Wed, Nov 29, 2023 at 3:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Nov 29, 2023 at 03:41:55PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 29, 2023 at 12:21:45PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, Nov 28, 2023 at 9:04=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > It's unclear why it's not a const from day 1. Make the pins member
> > > > const in struct group_desc. Update necessary APIs.
>
> ...
>
> > > >  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const c=
har *name,
> > > > -                             int *gpins, int ngpins, void *data);
> > > > +                             const int *pins, int num_pins, void *=
data);
> > > >
> > > >  int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
> > > >                                  unsigned int group_selector);
> > >
> > > Probably this is also the right moment to change all of these to arra=
ys
> > > of unsigned ints?  Else you will have mixed int/unsigned int after
> > > "[PATCH v3 13/22] pinctrl: core: Embed struct pingroup into struct
> > > group_desc", and purely unsigned int after "[PATCH v3 22/22] pinctrl:
> > > core: Remove unused members from struct group_desc".
> >
> > Hmm... Can it be done later?
> >
> > I can, of course try to change the parameter here to be unsigned, but i=
t most
> > likely fail the build for those drivers means need more patches, more d=
elay to
> > this series.
> >
> > Linus?
>
> On the first glance updating API here does not fail the build.

That's what I had expected, as drivers already pass int or unsigned int
arrays anyway.

> Lemme incorporate this into v4.

Thanks!

> Meanwhile the drivers I left untouched, it might be separate changes
> to convert from int to const unsigned int.

Sounds fine to me.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

