Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44F1CA0EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 05:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY416xR1xycZgMaHjJKQxeOxL60iUIwXBSq8Px9VqF4=; b=SLyM9w3/Ep9B1Znc9gYGZWiuna
	zlpQOy0ucysn3DdwZ7NJeX9lpEJf6Yfbo2sGx6PIX7hEL9OfadMLftqvreYFO49vUs40SHAIRtHsU
	Ch0lhU2uKv3zHpu7S4I2nuYleZk84fewBjRpDGV9uMdnTttS8MF/Y+UAvCulezScdIja+xhE5ZNbj
	l7rGe4whKKO+I/X6R076/iQqn4QnVzrdJcDduH039ybR0zpUa4PWcafZ4+hqzXJ7YJYy6QjdNH4g/
	EmtkkJ/MkEYzBj2G9QmxAMJph/PKOIBuoB7wZi3mDu2bD2wexHtPgS6BQrIoPToLDH5d2BXI8HFHn
	tID692Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoF0u-00000009Ra6-3L4j;
	Tue, 19 Aug 2025 05:36:04 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEuz-00000009Qwq-1CmU
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Aug 2025 05:29:58 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-333f8f2d6c2so40254591fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Aug 2025 22:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755581395; x=1756186195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY416xR1xycZgMaHjJKQxeOxL60iUIwXBSq8Px9VqF4=;
        b=JrndwijeO3lA0+IIX9h2GAsYxPSmbpfmGRlIjy9ColM3968+64PaHoWpAVQ9gT+aTB
         OdXVdCuHDcpkcA7IKe20rPP94CI3lmyhxiIU3CRzfmpzxKopgDlOYjkR8oVjfQSVvuHe
         X2ZJyDMG2G8T6uOuWq9WOyIU1GYPfrCdgzTlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581395; x=1756186195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AY416xR1xycZgMaHjJKQxeOxL60iUIwXBSq8Px9VqF4=;
        b=ENe9pQl1c8QhioElXFVUNJTFEXRCrez+Sqsa8G1u5idPnYczRpdBV6wF+UK+nPYsvV
         Sfa7ipLXFrES9ph2R+LXRLEVieQMgBZM+tfuY5lAsejbaKkq7X9eAGmewa0IPMAcLbGy
         bjrvjt5+aUd5nfAfAx96kc5Cr718EiSRGSDb6y9047XmVTxNcJmwYLHysJtIzRg25WVb
         KuwPj+uoPSXn09Rxvdw32kQ1B5U+Haw6WHJ/NVQhO35Magsh3vLaAp3lMEPO4ipe42Ov
         B86a3MirJet31TaU/JPztXmRQyuopsEX6EQU3hOS4RgofPa9XVSsQXiXKLg6EBaSwvaq
         GIzA==
X-Forwarded-Encrypted: i=1; AJvYcCXwyj9lN+ur4hOwyPjJ18Fizp3V3y1PbbBufkEU9luPsJyREOqOQWo9husdLFz9Eo6rn5npYX+kFtDGWZ+z1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc4XWSXAO8Nl1iGaew3PHJO1tu6HnchVqMYJEvNKejNQqNKu9J
	OLqEokpoxwBwguTRCCy+Hk1Bq/Ctxukpy98Jn7Kc3X6C+CJHdcxAbuoL8egcOAN1aARDXuLSUTD
	KArnSH4gnheaCVpFqoKkuklyGMdzEp2L+TNf0kxZq
X-Gm-Gg: ASbGncvWA9HLU4cOx02fzMf+NH4EMNnDXfHaX7B+p4xHlVy2rjkTM7yopJSTeAzBKTD
	TATwqjLiBs0XBHGZxxQkIIWOtXfsaP+q/mZ6VCwmztkxaYuRFUbVif/TSHqHkA5ccdkgZnBryVC
	YuZ+JY9nmUDzJm/jtXmNhoEiTioveuuKGv+zJXzsNYAWSKlwoCUqFjWAiaDqri013003gh8MRGC
	y+lIZK/XLeLOyQbkYYQHtJuUUrGzt5xkME=
X-Google-Smtp-Source: AGHT+IFc+cNqQJD94yOsJXvxKRjOpffc7Ia22z42Fq9ZyFSlD4taXbrHvujNSr7HuBf9iSSI7SrVxD3w4KS0qImpweY=
X-Received: by 2002:a05:6512:3f14:b0:55c:cc6a:a212 with SMTP id
 2adb3069b0e04-55e008451ebmr402983e87.39.1755581395466; Mon, 18 Aug 2025
 22:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
 <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
 <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com> <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
In-Reply-To: <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Aug 2025 13:29:44 +0800
X-Gm-Features: Ac12FXx-vk1JhaQ3rCWpmDReEnhaHNW7M5aboaWtjp9aXHyjGH_2VPoF2xHclbY
Message-ID: <CAGXv+5FXZ_byK8Ftb9LjfQMkgtLd7mTmWgz_Nsvcv8=jy53T=g@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, 
	Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_222957_319639_FF34C886 
X-CRM114-Status: GOOD (  24.23  )
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

On Tue, Aug 19, 2025 at 1:27=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> > > On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot wrote
> >
> > > >                 pins-clk {
> > > >                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>=
;
> > > >                         drive-strength =3D <MTK_DRIVE_14mA>;
> > > > -                       mediatek,pull-down-adv =3D <10>;
> > > > +                       mediatek,pull-down-adv =3D <2>;
> > >
> > >         bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> > >
> > > and so on.
> > >
> > > ChenYu
> >
> > I agree with ChenYu, the more standardized properties are the better it=
 is.
> >
> > All the custom properties makes sense for an engineer working with just
> > that one SoC (like the SoC vendor...) but for field engineers who have
> > to use different SoCs every day this is just a big mess for the mind.
> >
> > The standard properties are clear, concise and tell you exactly what
> > they are about.
> >
> > The argument should be in Ohms though, according to the standard
> > bindings, but maybe the value of MTK_PUPD_SET_R1R0_10 is
> > something like that?
>
> For reasons I can't recall clearly these are just placeholder values
> that the driver then maps to the R1 and R0 settings. But at least they
> use the standard properties.
>
> The reason was either one of the following or both:
>
>   a. not every group of pins had the same resistance values for R1 & R0
>   b. there are no known precise values; the values depend on the process
>      and batch

Also, their customers seemed more accustomed to dealing with toggling
R1 & R0 vs setting some actual value. I presume that comes with the
uncertainty of the actual hardware value, and they just try which
combination works better.

ChenYu

