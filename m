Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8CAC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 13:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdujGorCpR4eYA2UA1cuFkywZ2De5u0jlPuiHfhxLz4=; b=J97cA1kgOhVETr3Ev0kbtz+JqT
	rxW5T5r6a+S/7fdBEhvQ87stpG4c6UXNUgl4bKTWjQwTc8jeYu6b697yykqtQAB2oY5MS2XRK6/8/
	+enNeanDpA/1NiJm7eZBWauRkjvYQ6pAQ0E04IIIiuuZlGT564/apR/9cGnpI1dsrDngqRBkm4sZ7
	8KA2ssXXQRj8Lq2odZfYR3BdXpRGH1sppcWkdyk6YqeczNqWveyIcbWHNrbtE04X5cTFLsj2oVPNm
	A8FEqGLCBFBerNl+KVkq/Hzw9DtLFypv2X5pZwZeqmtbZTybJUIcPEKHlMc1P/DSWthAdqgyxDc+u
	Z8Uyl7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9Ax-004fqz-2r;
	Mon, 04 Dec 2023 13:39:55 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9Av-004fq3-0A;
	Mon, 04 Dec 2023 13:39:54 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5d8d2b5d1b5so5390337b3.0;
        Mon, 04 Dec 2023 05:39:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701697191; x=1702301991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdujGorCpR4eYA2UA1cuFkywZ2De5u0jlPuiHfhxLz4=;
        b=Mh2ac0IAUtoUpxvbahyxQGfw294Hf8LYkTXAFSO3FZZ8A6cVdAAD+HUk7Q8ozBP8aR
         rd6DFUBqnP+3dzzCsCLsbk2Zrrhsas3l+9WAX1P0RTSaI5SMtIhU2M9sspOb4m+q5IA3
         1m/V4kAJI6s4WVikpkTR+9eXb71tRiky9osHdIexmkYES9XpRAD5gLl6hVScLaVANCy7
         TlEPh3UBARHs/YKq8HzjwwdSRPZuDwfjpwTciV70HFHsFey1vwfJO1MwO79jSjkFQM0C
         3flVZ61BFFuiQxueMbOGHSB1kihcITK9nTmjQ6eDdjCD/X7BDL+UnpzhH2v6Rog1DhSF
         l/Vg==
X-Gm-Message-State: AOJu0Yy4XtXfknmPGcAKmlNCMmYIEvnjJwMAIs9wD9BP8Utf3zFIPzTE
	aqNMvdIqgHlLg1hgHSdLhgkRlsF7ZQ4EYw==
X-Google-Smtp-Source: AGHT+IE6YvNdBQ1dml5VDEdBeJGYfRiGHI2XC67I8UjoJxVzIyKhhQYiBo9OrDc8F/rdJ94Vf0BIcw==
X-Received: by 2002:a81:9953:0:b0:5d3:de61:353f with SMTP id q80-20020a819953000000b005d3de61353fmr1324305ywg.38.1701697191646;
        Mon, 04 Dec 2023 05:39:51 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id x72-20020a81a04b000000b005a7f676f305sm2859384ywg.106.2023.12.04.05.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 05:39:49 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5d8ddcc433fso5383507b3.1;
        Mon, 04 Dec 2023 05:39:49 -0800 (PST)
X-Received: by 2002:a05:690c:997:b0:5d6:8d41:669c with SMTP id
 ce23-20020a05690c099700b005d68d41669cmr1337270ywb.6.1701697189014; Mon, 04
 Dec 2023 05:39:49 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-13-andriy.shevchenko@linux.intel.com>
 <CGME20231204114039eucas1p29c6f8a162191e58ff658d3a1c44429bf@eucas1p2.samsung.com>
 <9e4e65de-7234-4234-8091-796277a1f1c5@samsung.com> <ZW3PrSQWyZvvhN66@smile.fi.intel.com>
 <CAMuHMdU-E7jemjAS0EunWFPq1LfF9vcNE+50ah4WH9oD1TXYew@mail.gmail.com> <ZW3U5-LBqWiyxB6-@smile.fi.intel.com>
In-Reply-To: <ZW3U5-LBqWiyxB6-@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Dec 2023 14:39:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVz=dLaBt-Td0UdOOs79ju7UfX_2vUcy8Kdeo9aSP+edw@mail.gmail.com>
Message-ID: <CAMuHMdVz=dLaBt-Td0UdOOs79ju7UfX_2vUcy8Kdeo9aSP+edw@mail.gmail.com>
Subject: Re: [PATCH v4 12/23] pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
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
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_053953_094755_014B7ECC 
X-CRM114-Status: GOOD (  27.78  )
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

On Mon, Dec 4, 2023 at 2:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Dec 04, 2023 at 02:19:10PM +0100, Geert Uytterhoeven wrote:
> > On Mon, Dec 4, 2023 at 2:10=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Dec 04, 2023 at 12:40:38PM +0100, Marek Szyprowski wrote:
> > > > On 29.11.2023 17:06, Andy Shevchenko wrote:
> > > > > Make use of PINCTRL_GROUP_DESC() instead of open coding it.
> > >
> > > > PINCTRL_GROUP_DESC() macro from drivers/pinctrl/core.h contains a c=
ast
> > > > to (struct group_desc), what breaks users of the above macros.
> > >
> > > There is no cast (*).
> > > Thanks for report, I will check.
> > >
> > > But this was v4 of the series and LKP actually sent a positive feedba=
ck.
> > > Besides that I have tested this locally with modules enabled.
> > >
> > > *) It's a compound literal, _not_ a cast.
> > >    Taking above into consideration I'm wondering what compilers
> > >    are in use?
> >
> > kisskb reported the following m68k failures to me:
> >     linux-next/m68k-allmodconfig/m68k-gcc8
> >     linux-next/m68k-allmodconfig/m68k-gcc11
> >     linux-next/m68k-allmodconfig/m68k-gcc12
> >
> > However, according to [1], linux-next/m68k-allmodconfig/m68k-gcc13
> > did succeed, so I guess you are using gcc13?
>
> Yes, I compiled with these:
>
> $ gcc --version
> gcc (Debian 13.2.0-5) 13.2.0

Time to install and try an older version ;-)

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

