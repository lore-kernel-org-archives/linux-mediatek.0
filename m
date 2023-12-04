Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC85C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7AO3faWlvMvzFGUJAneEsk6GWi1KDY1Vy4IkAizcS0=; b=voflDFnG/rEdNGsLlyI/mzFqVS
	wJUFn8S6H5Jxnx0UFXqiCzJ+74vzF5jRUf32eFL3P6Bq0fMbIFTo/q76wEc+r09pQynMa9zVnWxFZ
	JuI2QiRggTCn/BSLxy8aKVeKdxpDimzZT3X7qeQ59rSLzkbHMZK+gl60KPw+XF2N9AKwZ2CHzacCA
	STp+mzJ8bSSPNIm0cMdEb3s1rgjXWQ3SbT7CIoZHbeK9SLcqhf7XoiDQJulK7VwqutvGZcUfUQnop
	pyodIuKMjaBVnwjaPcpNowK61xEgybhrKbXKpGyVew6F5YUknSYh/WaEXaTIFf3R4sQrG2fO9djrD
	nJ4FDNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8rE-004W3v-1D;
	Mon, 04 Dec 2023 13:19:32 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8rA-004Vz8-0T;
	Mon, 04 Dec 2023 13:19:29 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5d8d2b5d1b5so5170717b3.0;
        Mon, 04 Dec 2023 05:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695965; x=1702300765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7AO3faWlvMvzFGUJAneEsk6GWi1KDY1Vy4IkAizcS0=;
        b=xMJ+kte5+4JX8O2l/kUFPl9yqHIwXkrcKTAZ5dhZtHO41FxiP8TAND8Y+IXB48TkeT
         YoLFZhWCgHoPZlg1/nMQKhISJU5Y2Njx8zPvlOgxIFceWnl2MmJrmy1IFLTdLN1VlzlO
         BdWR2/gBlJYoe32qNIhSmZVOLKAURxmk2iSyCrE2Y1ZBeI+qwc6GRjo9XRiYz+BdyVKb
         2j1niWwsISoK1PooHo3WmDai8q9OJnMFwbMwnucKHS9a2xkkBvU/4ZTODUwoCFd45MZu
         82TxL+Y0L5vDqBRwde2nfIFcM0rsKMltq7ObD0N8tH2YgOfCbZFDiNyQKkidpifCP5Rt
         CcFQ==
X-Gm-Message-State: AOJu0Yy+OkMKt/tgt26rHhGowDZYjJUYgC1zW4vu6n4AxovUTj4lD3fs
	0s0uqAuQwK9w5QPO/8WbNu9eSedYfmXixw==
X-Google-Smtp-Source: AGHT+IHEUikOdQ4OTmsN2sosq5ITtpviqXRnLcZw9NIIEKJbiLeEGQULk58mAozdB59XjHDuxO92Vg==
X-Received: by 2002:a81:92d0:0:b0:5d7:1940:8ded with SMTP id j199-20020a8192d0000000b005d719408dedmr1378286ywg.84.1701695963912;
        Mon, 04 Dec 2023 05:19:23 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id m13-20020a819e0d000000b005d7993a2675sm1015601ywj.31.2023.12.04.05.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 05:19:21 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5d8d2b5d1b5so5169877b3.0;
        Mon, 04 Dec 2023 05:19:21 -0800 (PST)
X-Received: by 2002:a05:690c:8:b0:5d8:2f65:cf71 with SMTP id
 bc8-20020a05690c000800b005d82f65cf71mr1206068ywb.86.1701695961634; Mon, 04
 Dec 2023 05:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-13-andriy.shevchenko@linux.intel.com>
 <CGME20231204114039eucas1p29c6f8a162191e58ff658d3a1c44429bf@eucas1p2.samsung.com>
 <9e4e65de-7234-4234-8091-796277a1f1c5@samsung.com> <ZW3PrSQWyZvvhN66@smile.fi.intel.com>
In-Reply-To: <ZW3PrSQWyZvvhN66@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Dec 2023 14:19:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-E7jemjAS0EunWFPq1LfF9vcNE+50ah4WH9oD1TXYew@mail.gmail.com>
Message-ID: <CAMuHMdU-E7jemjAS0EunWFPq1LfF9vcNE+50ah4WH9oD1TXYew@mail.gmail.com>
Subject: Re: [PATCH v4 12/23] pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
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
X-CRM114-CacheID: sfid-20231204_051928_189140_29934D90 
X-CRM114-Status: GOOD (  21.82  )
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

On Mon, Dec 4, 2023 at 2:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Dec 04, 2023 at 12:40:38PM +0100, Marek Szyprowski wrote:
> > On 29.11.2023 17:06, Andy Shevchenko wrote:
> > > Make use of PINCTRL_GROUP_DESC() instead of open coding it.
>
> > PINCTRL_GROUP_DESC() macro from drivers/pinctrl/core.h contains a cast
> > to (struct group_desc), what breaks users of the above macros.
>
> There is no cast (*).
> Thanks for report, I will check.
>
> But this was v4 of the series and LKP actually sent a positive feedback.
> Besides that I have tested this locally with modules enabled.
>
> *) It's a compound literal, _not_ a cast.
>    Taking above into consideration I'm wondering what compilers
>    are in use?

kisskb reported the following m68k failures to me:
    linux-next/m68k-allmodconfig/m68k-gcc8
    linux-next/m68k-allmodconfig/m68k-gcc11
    linux-next/m68k-allmodconfig/m68k-gcc12

However, according to [1], linux-next/m68k-allmodconfig/m68k-gcc13
did succeed, so I guess you are using gcc13?

[1] http://kisskb.ellerman.id.au/kisskb/head/629a3b49f3f957e975253c54846090=
b8d5ed2e9b/

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

