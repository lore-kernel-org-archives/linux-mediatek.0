Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A52BC021A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1DlyzfZPCWK55pzxX6TJoiWYHgMaXFWIiyI9xAGPgI=; b=P/XW9QqwvPs9ajkD6OLxdVNkSY
	SK88aVnPkLbJcINf7btLmus1FabkDsMFOrRMnvaKHiZ65+hWX5jZS4j3nf49VXpLEA6nnnbA/+kmd
	Hg7C9DVS/yFW4+9a7jTOA8UG+c1T6jZijaFUvnm1rL4Ym986u4aqbmG+K8HI87tSe1PYlDxinnvRb
	KInRpiUEGwJSuNks78poAViP0yajYuzSoZ/jgd/invxPrz2IJkXW5VHVlRGZmVi5d9A/dlRXj1E5k
	HXeYxCIuWL0tS6CLEiQeOW2xa8nmqW9IHf8Azc+ECtHxkrV6QbepHKiIFilakKb5HZjEEI7exXbcT
	RIYdwEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylH-00000004BqS-16wF;
	Mon, 17 Feb 2025 10:54:03 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyIh-000000046Sv-2K4d
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Feb 2025 10:24:32 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-545fed4642aso1437543e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Feb 2025 02:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739787869; x=1740392669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1DlyzfZPCWK55pzxX6TJoiWYHgMaXFWIiyI9xAGPgI=;
        b=WwsmZ/skPpspMjU6r13qZrIZILWXqEqpILg08c8Jq09naJ8R2EL74rT4ReIsgGgEmM
         dIFMEcI8w2KO6Pc06SLYO3vUpp2W793i9+sv47kWkpqD8vAc+9B9FgtQ+ijuUDF1shDG
         q/HsNT0lUXYDibCz+QyK3bn1sQeHwnMzQhu+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787869; x=1740392669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1DlyzfZPCWK55pzxX6TJoiWYHgMaXFWIiyI9xAGPgI=;
        b=ETo4ipYdjjOzKuGQtVW2cCbp+bVcBRjyPnwNMphbj5V2OWGQdwU1jKpzNtqb9w4YNE
         t26v6cod3fH+xX1XvduLIZUyfuyEOocq44R6ihbZCJM8yG5hLcLNvse74+wbV6NTYsjM
         rcuuEMvLEYJ0L2b6YFimRQV09y3r07CLE8TZB8WmAqLwL9HhgX+kOe0ZhMT/zOY/rYET
         itIfaT/DhZckjMlUBcn+ToBFXLo9+/yRs/X998EnclGUe/GHfPEOO97q4yFznW/U+zIv
         T3B1gG9tZB0lxc+VYgn5ugn5MwkYOLcW6yAcveBgt55asvY4NTY8eSNH7rWFwvHEo4cG
         bdxw==
X-Forwarded-Encrypted: i=1; AJvYcCXf5QeXDjCemXxOngwgr4CTC5OQDpemZ71fzfLdgAjJtC83v4LD57YRAsjmwH1AHS4qwvDza9CmhVynjeiqgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZwGb53StNXXhnBmSiD2NetvnJ4nAPXgQlZxriQYYSxeK8y2ky
	eppzer7rACosvkECxwmg0Xr/gARlp8t81KBBtIaTTJtkVE9eDvUCWQ7SRtCW647fqAFH+RQLvtd
	d8slNOq08oSh9ip9jh+yDJ5XCFFZsDATIINu1
X-Gm-Gg: ASbGncukirsQ1qCfe+vC3LnYQ4WCDFz8LqP1ArVCBjNWXKZX5jeJWAF0n5mhMN0iSec
	jESB7micS2l/y672ycdDVcEtiuxf+P9hx4zdSxbuMFa4Sb1zCmbOMQYd/Kp2UYOKrsk8rXMCBd5
	WDNNkhg+MV90irLZzj6wS/VaBO
X-Google-Smtp-Source: AGHT+IE3i0Mznvv4AsHVZT8Dj/f1n9k/WLI0IP0WQ84pkRHFqFusZH4zNFJ+0GmwxW5RsHUWiqkpQfCi3IN0/dhZ7xI=
X-Received: by 2002:a05:6512:1155:b0:545:296e:ac1d with SMTP id
 2adb3069b0e04-5452fe95f54mr2682853e87.51.1739787868862; Mon, 17 Feb 2025
 02:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20250115063555.32492-1-ot_cathy.xu@mediatek.com>
 <20250115063555.32492-2-ot_cathy.xu@mediatek.com> <nmyxygrya6cpalmirsunvkx32uox3kjxd4l5ggdhjtj7edyizz@yodolm5ktboo>
 <f7ba63c8afcef1d1925d51e35e4b81f0d0e773ff.camel@mediatek.com>
 <d04bc250-2104-4e02-9bf8-5785f4444c8d@kernel.org> <d11076d3eb2f92018fd3e26cae665a47f71ca838.camel@mediatek.com>
 <b212d05d-de3b-41b2-bc48-c6b79ae54a8b@kernel.org> <bec17d1e215a11daa1fdede78c8070c8e1763c72.camel@mediatek.com>
 <e7d49bda-8aaa-4897-8117-ab889fb27be0@collabora.com> <8ca2e369be804697ef71491dfd366cf6afcca9bd.camel@mediatek.com>
 <CAGXv+5EYMM=hn8nKig3iHqD3KhxHVQyteweL-OiSoCV8mD2iew@mail.gmail.com> <81368f21fabb9d6a6ee29bba0542e921b3636016.camel@mediatek.com>
In-Reply-To: <81368f21fabb9d6a6ee29bba0542e921b3636016.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Feb 2025 18:24:17 +0800
X-Gm-Features: AWEUYZm4KUwGawqhHvCsHclABlWLLfJKFpFZMVEY_E4rBjH-DyVCVrr2frjLpEs
Message-ID: <CAGXv+5FSj-FY87Zo7EFec87fLHszO7776dZiinYP-iZm+Hry9w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: mediatek: add support for mt8196
To: =?UTF-8?B?Q2F0aHkgWHUgKOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?TGVpIFh1ZSAo6Jab56OKKQ==?= <Lei.Xue@mediatek.com>, 
	"krzk@kernel.org" <krzk@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?V2VuYmluIE1laSAo5qKF5paH5b2sKQ==?= <Wenbin.Mei@mediatek.com>, 
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	=?UTF-8?B?R3VvZG9uZyBMaXUgKOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "sean.wang@kernel.org" <sean.wang@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_022431_625920_BC5ADD3D 
X-CRM114-Status: GOOD (  57.75  )
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

On Mon, Feb 17, 2025 at 5:45=E2=80=AFPM Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=
=B7) <ot_cathy.xu@mediatek.com> wrote:
>
> On Tue, 2025-01-21 at 18:03 +0800, Chen-Yu Tsai wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On Tue, Jan 21, 2025 at 5:58=E2=80=AFPM Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=
=A9=B7) <
> > ot_cathy.xu@mediatek.com> wrote:
> > >
> > > On Mon, 2025-01-20 at 13:42 +0100, AngeloGioacchino Del Regno
> > > wrote:
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >
> > > >
> > > > Il 20/01/25 10:17, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=B7) ha scritt=
o:
> > > > > On Thu, 2025-01-16 at 11:20 +0100, Krzysztof Kozlowski wrote:
> > > > > > External email : Please do not click links or open
> > > > > > attachments
> > > > > > until
> > > > > > you have verified the sender or the content.
> > > > > >
> > > > > >
> > > > > > On 16/01/2025 09:18, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=B7) wro=
te:
> > > > > > > On Thu, 2025-01-16 at 08:28 +0100, Krzysztof Kozlowski
> > > > > > > wrote:
> > > > > > > > External email : Please do not click links or open
> > > > > > > > attachments
> > > > > > > > until
> > > > > > > > you have verified the sender or the content.
> > > > > > > >
> > > > > > > >
> > > > > > > > On 16/01/2025 03:20, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=A9=B7)=
 wrote:
> > > > > > > > > > > +          bias-pull-down:
> > > > > > > > > > > +            oneOf:
> > > > > > > > > > > +              - type: boolean
> > > > > > > > > > > +              - enum: [100, 101, 102, 103]
> > > > > > > > > > > +                description: mt8196 pull down
> > > > > > > > > > > PUPD/R0/R1
> > > > > > > > > > > type
> > > > > > > > > > > define value.
> > > > > > > > > > > +              - enum: [200, 201, 202, 203, 204,
> > > > > > > > > > > 205,
> > > > > > > > > > > 206,
> > > > > > > > > > > 207]
> > > > > > > > > > > +                description: mt8196 pull down RSEL
> > > > > > > > > > > type
> > > > > > > > > > > define
> > > > > > > > > > > value.
> > > > > > > > > >
> > > > > > > > > > Not much improved.
> > > > > > > > >
> > > > > > > > >    I have removed the content related to 'resistance
> > > > > > > > > value', we
> > > > > > > > > use
> > > > > > > > > 'RSEL' instead of 'resistance value'.
> > > >
> > > > This is wrong.
> > >
> > >   Sorry, I think I may not have expressed myself clearly. What I
> > > meant
> > > is that the attribute 'mediatek,rsel-resistance-in-si-unit' is not
> > > supported. In the dts, can write the resistance value, for example:
> > > bias-pull-up=3D<1000>, but can't use 'mediatek,rsel-resistance-in-si-
> > > unit
> > > =3D <xxx>'.
> >
> > `mediatek,rsel-resistance-in-si-unit` is supported in
> > drivers/pinctrl/mediatek/pinctrl-paris.c
> >
> > Angelo is requesting that you continue that support and make it
> > exclusive, i.e. not support the RSEL macro magic numbers, and
> > _only_ support ohm values, in the device tree.
> >
> > ChenYu
>
>   Thank you for your response. Can I understand that in next version, I
> should remove the RSEL macro magic numbers and add `mediatek,rsel-
> resistance-in-si-unit`?

You should remove the RSEL macro magic numbers, and add an option to
|struct mtk_pin_soc| so that the argument to "bias-pull-up" are always
treated as values in SI units as if "mediatek,rsel-resistance-in-si-unit"
was set in the DT.

ChenYu

> >
> > > > > > > >
> > > > > > > > So the value in Ohms was removed? I assume above do not
> > > > > > > > have
> > > > > > > > known
> > > > > > > > value
> > > > > > > > in Ohms?
> > > > > > >
> > > > > > >    Yes, value in Ohns was removed, no code have knowm
> > > > > > > value.
> > > > > >
> > > > > > Does the hardware have known value in Ohms?
> > > >
> > > > It does.
> > > >
> > > > >
> > > > >    What do you mean by 'hardware'? When writing to the rsel
> > > > > register,
> > > > > the value written is 0-7.
> > > > >
> > > >
> > > > Hardware means "the pin controller of the mt8196 SoC" :-)
> > > >
> > > > Anyway.
> > > >
> > > > The RSEL registers' function is to select a specific resistance
> > > > value
> > > > to
> > > > pullup/down a pin, or a group of pins.
> > > >
> > > > Devicetree bindings require to specify values in known units, so
> > > > in
> > > > device tree
> > > > you *need* to specify the RSEL resistance in Ohms.
> > > >
> > > > You cannot specify RSEL register value in device-tree. That's
> > > > unacceptable.
> > > >
> > > > Regards,
> > > > Angelo
> > >
> > >  Yes, I understand what you mean. However, I was referring to
> > > writing
> > > the rsel register in the driver, not in dts.
> > >
> > > >
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > +            description: |
> > > > > > > > > > > +              For pull down type is normal, it
> > > > > > > > > > > doesn't
> > > > > > > > > > > need
> > > > > > > > > > > add
> > > > > > > > > > > RSEL & R1R0.
> > > > > > > > > > > +              For pull down type is PUPD/R0/R1
> > > > > > > > > > > type,
> > > > > > > > > > > it
> > > > > > > > > > > can
> > > > > > > > > > > add
> > > > > > > > > > > R1R0 define to
> > > > > > > > > > > +              set different resistance. It can
> > > > > > > > > > > support
> > > > > > > > > > > "MTK_PUPD_SET_R1R0_00" &
> > > > > > > > > > > +              "MTK_PUPD_SET_R1R0_01" &
> > > > > > > > > > > "MTK_PUPD_SET_R1R0_10"
> > > > > > > > > > > &
> > > > > > > > > > > +              "MTK_PUPD_SET_R1R0_11" define in
> > > > > > > > > > > mt8196.
> > > > > > > > > > > +              For pull down type is PD/RSEL, it
> > > > > > > > > > > can
> > > > > > > > > > > add
> > > > > > > > > > > RSEL
> > > > > > > > > > > define to set
> > > > > > > > > > > +              different resistance. It can support
> > > > > > > > > > > +              "MTK_PULL_SET_RSEL_000" &
> > > > > > > > > > > "MTK_PULL_SET_RSEL_001" &
> > > > > > > > > > > +              "MTK_PULL_SET_RSEL_010" &
> > > > > > > > > > > "MTK_PULL_SET_RSEL_011" &
> > > > > > > > > > > +              "MTK_PULL_SET_RSEL_100" &
> > > > > > > > > > > "MTK_PULL_SET_RSEL_101" &
> > > > > > > > > > > +              "MTK_PULL_SET_RSEL_110" &
> > > > > > > > > > > "MTK_PULL_SET_RSEL_111"
> > > > > > > > > > > define in
> > > > > > > > > > > +              mt8196.
> > > > > > > > > > > diff --git a/include/dt-bindings/pinctrl/mt8196-
> > > > > > > > > > > pinfunc.h
> > > > > > > > > > > b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> > > > > > > > > > > new file mode 100644
> > > > > > > > > > > index 000000000000..bf0c8374407c
> > > > > > > > > > > --- /dev/null
> > > > > > > > > > > +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> > > > > > > > > > > @@ -0,0 +1,1572 @@
> > > > > > > > > > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-
> > > > > > > > > > > Clause
> > > > > > > > > > > */
> > > > > > > > > > > +/*
> > > > > > > > > > > + * Copyright (C) 2025 Mediatek Inc.
> > > > > > > > > > > + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> > > > > > > > > > > + */
> > > > > > > > > > > +
> > > > > > > > > > > +#ifndef __MT8196_PINFUNC_H
> > > > > > > > > > > +#define __MT8196_PINFUNC_H
> > > > > > > > > > > +
> > > > > > > > > > > +#include <dt-bindings/pinctrl/mt65xx.h>
> > > > > > > > > > > +
> > > > > > > > > > > +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) |
> > > > > > > > > > > 0)
> > > > > > > > > > > +#define PINMUX_GPIO0__FUNC_DMIC1_CLK
> > > > > > > > > > > (MTK_PIN_NO(0) |
> > > > > > > > > > > 1)
> > > > > > > > > > > +#define PINMUX_GPIO0__FUNC_SPI3_A_MO
> > > > > > > > > > > (MTK_PIN_NO(0) |
> > > > > > > > > > > 3)
> > > > > > > > > > > +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK
> > > > > > > > > > > (MTK_PIN_NO(0)
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > 4)
> > > > > > > > > > > +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK
> > > > > > > > > > > (MTK_PIN_NO(0) |
> > > > > > > > > > > 5)
> > > > > > > > > > > +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO
> > > > > > > > > > > (MTK_PIN_NO(0)
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > 6)
> > > > > > > > > >
> > > > > > > > > > I do not see how you resolved my comment from v1. In
> > > > > > > > > > v2 I
> > > > > > > > > > reminded
> > > > > > > > > > about
> > > > > > > > > > it, so you responded that yopu will change something,
> > > > > > > > > > but
> > > > > > > > > > I
> > > > > > > > > > do
> > > > > > > > > > not
> > > > > > > > > > see
> > > > > > > > > > any changes.
> > > > > > > > > >
> > > > > > > > > > So explain: how did you resolve my comment?
> > > > > > > > > >
> > > > > > > > > > These two examples where you claim you will change
> > > > > > > > > > something,
> > > > > > > > > > but
> > > > > > > > > > send
> > > > > > > > > > the same. I skipped the rest of the patch.
> > > > > > > > >
> > > > > > > > >    Thank you for your patient response, here is my
> > > > > > > > > explanation
> > > > > > > > > for
> > > > > > > > > you
> > > > > > > > > question:
> > > > > > > > >
> > > > > > > > >    In v1, I undertand that you meant I didn't sent a
> > > > > > > > > real
> > > > > > > > > binding,
> > > > > > > > > and
> > > > > > > >
> > > > > > > >
> > > > > > > > The comment is under specific lines, so I said these
> > > > > > > > defines
> > > > > > > > are
> > > > > > > > not
> > > > > > > > a
> > > > > > > > real binding. You sent them again, but they are still not
> > > > > > > > bindings,
> > > > > > > > because they are not used in the driver. Maybe the usage
> > > > > > > > is
> > > > > > > > convoluted,
> > > > > > > > so which part of implementation are these connecting with
> > > > > > > > DTS?
> > > > > > > > IOW,
> > > > > > > > which part of driver relies on the binding?
> > > > > > >
> > > > > > >    I got you. This binding define many macros, which will
> > > > > > > be
> > > > > > > used
> > > > > > > for
> > > > > > > 'pinmux' setting in the DTS. The usage like this:
> > > > > > >
> > > > > > >    adsp_uart_pins: adsp-uart-pins {
> > > > > > >                  pins-tx-rx {
> > > > > > >                          pinmux =3D
> > > > > > > <PINMUX_GPIO35__FUNC_O_ADSP_UTXD0>,
> > > > > > >                                   <PINMUX_GPIO36__FUNC_I1_A
> > > > > > > DSP_
> > > > > > > URXD0
> > > > > > > > ;
> > > > > > >
> > > > > > >                  };
> > > > > > >          };
> > > > > >
> > > > > >
> > > > > > That's DTS, not driver, so not a binding. Drop the header
> > > > > > from
> > > > > > bindings.
> > > > >
> > > > >    Sorry, I don't quite understand the relationship between
> > > > > binding
> > > > > and
> > > > > driver. Driver will parse this macro to get gpio number and
> > > > > function.
> > > > >
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

