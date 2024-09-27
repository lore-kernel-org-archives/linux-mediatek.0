Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D355CEBF76
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 04:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/P54adq5wqPeVhdzqGMRKbTP9qOT4nAYJ2m7pC5TLg=; b=3WWq2jT2JcF2Ulq3wOL6/mN2pp
	u3KqTuQevQFuSOu4zvWPAxcMzoIo2lZs+NOcOPt9kjVY01jFqfcb1Trea465xhK/yx6kLjUwAlfRf
	6V9qCCmLB6JmUPEXRf8ljL4IPxycaY365pgilZ0dvZbR4QIs4mkm7QIs1HZXDGkE81rSGvQUD2aJD
	v6XlXNqwOMPmd06UCQmbLeDPm4k+iIxN7e2Kkk4e2zpHuBqN4H3wBdXpiBR45T6mYDvMTFt5A+P9L
	l4sdGiOaOSO7qCrg5ZCY0WnZ8h4PTMOBFO0GncDpq7Y99zOoGXdlbdieg0CaWVlyPYceRITwgiHeb
	Tpdz3lBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su2lw-00000009zqX-3KUX;
	Fri, 27 Sep 2024 04:40:04 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su2kj-00000009zbR-2Lf4
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 04:38:51 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso1577791fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 21:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727411927; x=1728016727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/P54adq5wqPeVhdzqGMRKbTP9qOT4nAYJ2m7pC5TLg=;
        b=NuDd1fJSbC8AVjryqRJlQ2fVnqBWxlHc+WjwAPI6K43rJ0jWgvYGBJ8TSG/2kyTIfW
         M+QWvpBGimEd/zKsNQOjfmcaNH3wRnr9VkNT6LOHCuAOBK2E4KnxCj2fa2/DCla/A/Te
         +3cnJ0vQ/xQhr4+xBr1Q1KE3s4f4IFvR2aYkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727411927; x=1728016727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/P54adq5wqPeVhdzqGMRKbTP9qOT4nAYJ2m7pC5TLg=;
        b=NYaHa0RVajC2sMkFGyadU/37EIRrec2kyO4wL9hC8+yuT4I1bxaK8qJvqAXosqjF7h
         w9PmRtDt4mEXzaBZp/TENsZrl3RXV719VuA7CvmKYaAlZec6CtF/Ku2P/C3RkQETYE+V
         b0+G1u4PXZ9JJaEGVhc6opTLOXcMHbov1miVQcAuHB9b/HCSBKtR0SplZTG0a+yMJ1te
         WLLKmGhp7ew3lm0JBR2erfy5x0lQIMsKC30ECIjLlL2wzCcD1xepSX618z4NWOwXR5ZN
         3lT4D5kD5zp/Epayvjtkaz2GoKfOgOf1Jw7WrMiU4U0BaU5Xs6C+5TFGnnfckjiAfieG
         iLfg==
X-Forwarded-Encrypted: i=1; AJvYcCU4HuH0iM5rywJNl6FxfS41MA/Cvonty+ZXYQAsF5EwpX0djk7Idguq8V5jTGvxypB00zAIx5n2OVB5dXmSGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCkkRknfmAX8joODF9vv1s0R6+mMe2jD02f9qtRsl/BK1swlZw
	GbkqNZTndqxwz+Bn7S+50gO2ZdDCDSKOfUaxbunqK5JbNY4uPRC2E4vd4iotGQn85Q3v+AvILO/
	PvMzfEmpLlB9aoByhNaSLkavof35cSWpv234M
X-Google-Smtp-Source: AGHT+IEuKMKaL9pm5ASOI7F2wVDmv6urgJgoH8ydyHLtVrSS2VSiUn0vrSHcCfRK5Gdvnw9KKS+IW86HHLQ+3e6fKoQ=
X-Received: by 2002:a05:6512:3e05:b0:52c:cd77:fe03 with SMTP id
 2adb3069b0e04-5389fc3bd31mr1339969e87.14.1727411927087; Thu, 26 Sep 2024
 21:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240925093807.1026949-1-wenst@chromium.org> <20240925093807.1026949-3-wenst@chromium.org>
 <ZvPscRdWlFPmtCyR@smile.fi.intel.com> <CAGXv+5Gf9+rc+vLcr-JFhO561G8dw38ksV3drat+DyCfWEVakQ@mail.gmail.com>
 <ZvVS7ITg2t-RIh8C@smile.fi.intel.com>
In-Reply-To: <ZvVS7ITg2t-RIh8C@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 27 Sep 2024 12:38:35 +0800
Message-ID: <CAGXv+5EV4nNiAneajqr4VBkX4TO3zV76yqBM_u81ZMNjU52Bvw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] regulator: Add devres version of of_regulator_get_optional()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_213849_654439_B0422C2E 
X-CRM114-Status: GOOD (  38.36  )
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

On Thu, Sep 26, 2024 at 8:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 26, 2024 at 04:43:52PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Sep 25, 2024 at 6:56=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Sep 25, 2024 at 05:38:05PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > +#if IS_ENABLED(CONFIG_OF)
> > >
> > > Do we really need this?
> >
> > What's the point of going through devres_* stuff if we already know
> > _of_regulator_get() is going to fail anyway?
>
> With devm_add_action*() this will be other way around and there are plent=
y of
> APIs done this way. The ifdeffery is simply ugly in the code.

It's still extra code that doesn't get compiled out.

> > Also, _of_regulator_get() does not have a stub version for !CONFIG_OF.
>
> So, what prevents us from adding it?

Because there's no need if the only internal user isn't using it.

I could also move them over to of_regulator.c.

_of_regulator_get() stays internal to that file, and devm_regulator_release=
()
gets exposed instead.

Does that sound better?

> > > > +static struct regulator *_devm_of_regulator_get(struct device *dev=
, struct device_node *node,
> > > > +                                             const char *id, int g=
et_type)
> > > > +{
> > > > +     struct regulator **ptr, *regulator;
> > > > +
> > > > +     ptr =3D devres_alloc(devm_regulator_release, sizeof(*ptr), GF=
P_KERNEL);
> > > > +     if (!ptr)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     regulator =3D _of_regulator_get(dev, node, id, get_type);
> > > > +     if (!IS_ERR(regulator)) {
> > > > +             *ptr =3D regulator;
> > > > +             devres_add(dev, ptr);
> > > > +     } else {
> > > > +             devres_free(ptr);
> > > > +     }
> > > > +
> > > > +     return regulator;
> > >
> > > Why not using devm_add_action() / devm_add_action_or_reset()
> > > (whichever suits better here)?
> >
> > Cargo cult from _devm_regulator_get() in this file. However since this =
is
> > meant to share the same release function, both functions need to use th=
e
> > same mechanism.
> >
> > I could also argue that this is not an action, but an allocation, and s=
o
> > devres_alloc() seems to make more sense.
>
> It's rather matter of the naming of the devm_add_action*() APIs, but agai=
n,
> we have plenty of APIs using it when it's allocation and not strictly spe=
aking
> an action.

OK. Still the mechanism used needs to match that of the existing API.
So devres_add() it is for now.

> > > > +}
> > >
> > > > +#endif
>
> ...
>
> > > > +static inline struct regulator *__must_check devm_of_regulator_get=
_optional(struct device *dev,
> > > > +                                                                  =
       struct device_node *node,
> > > > +                                                                  =
       const char *id)
> > >
> > > I don't know the conventions here, but I find better to have it as
> > >
> > > static inline __must_check struct regulator *
> > > devm_of_regulator_get_optional(struct device *dev, struct device_node=
 *node, const char *id)
> > >
> > > Similar to other stubs and declarations.
> >
> > I don't think there are any conventions. This file already has three ty=
pes:
> >
> > 1. Wrap the line with the function name on the second line
> > 2. Wrap the arguments; wrapped arguments aligned to the left parenthesi=
s.
> > 3. Wrap the arguments; wrapped arguments aligned with aribtrary number =
of
> >    tabs.
> >
> > I prefer the way I have put them.
>
> The way you put it despite relaxed limit is slightly harder to read.
> I don't remember many headers that do so-o indented parameters. Besides
> your way defers the burden of resplit to the future in case one more para=
meter
> needs to be added which will excess the 100 limit.
>
> Also __must_check is somehow misplaced in my opinion (talking from my
> experience and this can be simply checked by grepping other headers).

Seems correct to me. It's between the return type and the function name.
From the coding style doc:

 __init void * __must_check action(enum magic value, size_t size, u8 count,
                                   char *fmt, ...) __printf(4, 5) __malloc;

The preferred order of elements for a function prototype is:

- storage class (below, ``static __always_inline``, noting that
``__always_inline``
  is technically an attribute but is treated like ``inline``)
- storage class attributes (here, ``__init`` -- i.e. section
declarations, but also
  things like ``__cold``)
- return type (here, ``void *``)
- return type attributes (here, ``__must_check``)
- function name (here, ``action``)
- function parameters (here, ``(enum magic value, size_t size, u8
count, char *fmt, ...)``,
  noting that parameter names should always be included)
- function parameter attributes (here, ``__printf(4, 5)``)
- function behavior attributes (here, ``__malloc``)


> That said, I prefer the way I suggested or something alike.

Two people arguing over style that is not clearly specified in the coding
style doc is probably wasting time. I'll use what `clang-format` gave:

static inline struct regulator *__must_check of_regulator_get_optional(
       struct device *dev, struct device_node *node, const char *id)
static inline struct regulator *__must_check devm_of_regulator_get_optional=
(
       struct device *dev, struct device_node *node, const char *id)


ChenYu

