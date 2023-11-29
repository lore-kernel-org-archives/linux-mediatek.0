Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC50EC07CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQMIsPSnGej6JUmLAmR8223gXbEgbLhru5iUfZNaJ9Y=; b=XY36zjcYiUn6k69JC1bGIofnCj
	mUGdswg5dpzOj9QGP2k3jiCpdsYv6eZe8PejwjQsCXbtSAtQ8extGJ5aa3XCjMq3yf45huFRnDfZr
	yqKwi2ts6DNMDOBVvSLrGKono0Fbvn97mErt/bjq35l0LGUM9lLDD3Y/7fDr8Kf0qpwwvuze/ZHIs
	y3hwW9vA4ee8uFBzA1NorNy+EDDrppJjpncW3MblyTA+jZ7qcfxNthqz2M04jVYuJMWaXa6QPHqTI
	HEL0fhX1DPuftBcFiS6qOP+1ns93H9cmqHHE4QcXIAgB9XXF9IxYTzpNuZyQZiAoyfXeEd8DxNlWS
	aFZRM/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IeW-00839L-2M;
	Wed, 29 Nov 2023 11:22:48 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Idl-0082bq-1N;
	Wed, 29 Nov 2023 11:22:02 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5cca00db7f0so66773327b3.1;
        Wed, 29 Nov 2023 03:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256918; x=1701861718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQMIsPSnGej6JUmLAmR8223gXbEgbLhru5iUfZNaJ9Y=;
        b=ZXtmKflqLVIabfmgl+tSmYoMEngmiV+WBdIMk1b6L//obm2TTeC4wYpwmb+p9Fl3Fh
         ON0YXAVv6a7/Z3Eqh/vbZ+T0u/8L7h++y/OliAromOOnmJFCszpN6p21YHLjxrQ3/UnO
         n+ozMtSJ+DqP9gN1RCf1x927UP6mh3OXzqxzOA4ITpUgrg6sgZpKvv/uJOO4bnFHQ/GM
         Z8FF7xToTdG5ryQHIos3Xxe/78+X3LNCv/O4PslJUyLlvUJdvJalo8mDJKs1yEy/wXsf
         SEE8t8nrfvFGiD1zV3XI3kTerxBMolWB8b+ZntP1fYCzIIRNe8W+e1iQo7lJDlRLVzOO
         KRZw==
X-Gm-Message-State: AOJu0YweRVutL0gO3D+IaLnimohtqnVWYJ9rTiXTg26E9yPNj+tAK0NS
	AMlqfaV+b9GXF4YpmQm77stSL7jFMiRwhg==
X-Google-Smtp-Source: AGHT+IG61tRpxe8vV4Iha7UpG9AFv0gSwz7V7NOJX9h9qJJqV2dpbN2/4ZAn6eQX/38kaEoXSzm5QA==
X-Received: by 2002:a05:690c:26c5:b0:5ce:79:f6bd with SMTP id eb5-20020a05690c26c500b005ce0079f6bdmr16825620ywb.7.1701256917763;
        Wed, 29 Nov 2023 03:21:57 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id q10-20020a81430a000000b005cc8b377fe9sm4291822ywa.121.2023.11.29.03.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:21:56 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db4422fff15so5594172276.1;
        Wed, 29 Nov 2023 03:21:56 -0800 (PST)
X-Received: by 2002:a25:fc22:0:b0:d9a:618a:d727 with SMTP id
 v34-20020a25fc22000000b00d9a618ad727mr16348333ybd.41.1701256915894; Wed, 29
 Nov 2023 03:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com> <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:21:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
Message-ID: <CAMuHMdWt0qq-Umd8udb7fxpNVZ=X9O9eZGMVGFSGRO_d9UkgNw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231129_032201_486127_FC411F63 
X-CRM114-Status: GOOD (  21.85  )
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

On Tue, Nov 28, 2023 at 9:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> It's unclear why it's not a const from day 1. Make the pins member
> const in struct group_desc. Update necessary APIs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -642,7 +642,7 @@ static int pinctrl_generic_group_name_to_selector(str=
uct pinctrl_dev *pctldev,
>   * Note that the caller must take care of locking.
>   */
>  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *n=
ame,
> -                             int *pins, int num_pins, void *data)
> +                             const int *pins, int num_pins, void *data)
>  {
>         struct group_desc *group;
>         int selector, error;
> diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> index 530370443c19..01ea1ce99fe8 100644
> --- a/drivers/pinctrl/core.h
> +++ b/drivers/pinctrl/core.h
> @@ -203,7 +203,7 @@ struct pinctrl_maps {
>   */
>  struct group_desc {
>         const char *name;
> -       int *pins;
> +       const int *pins;
>         int num_pins;
>         void *data;
>  };
> @@ -222,7 +222,7 @@ struct group_desc *pinctrl_generic_get_group(struct p=
inctrl_dev *pctldev,
>                                              unsigned int group_selector)=
;
>
>  int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *n=
ame,
> -                             int *gpins, int ngpins, void *data);
> +                             const int *pins, int num_pins, void *data);
>
>  int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
>                                  unsigned int group_selector);

Probably this is also the right moment to change all of these to arrays
of unsigned ints?  Else you will have mixed int/unsigned int after
"[PATCH v3 13/22] pinctrl: core: Embed struct pingroup into struct
group_desc", and purely unsigned int after "[PATCH v3 22/22] pinctrl:
core: Remove unused members from struct group_desc".

The Renesas pinctrl drivers already pass arrays of unsigned ints.
Some other drivers still use arrays of ints, though.

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

