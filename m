Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB595C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIg/lVR/UB6jNsuQOE2z1pZZGLYqtdqMUy/N5XrA7+s=; b=AKntJq2RhU0Md4ZBBT8CM2EgFu
	ewRHcbtJRzccu3IOT7HoVfsFUzAKbRZy5PzabRKz+yw9H7seDcPnp02hghACc9RjRcxhR6aXXngfd
	065WARyRemAL7b1NGgs6HZYYMsTdEA3chs/MhakWtM9WtdKHRSgGrXExGqWcotQl4xC7PURWXWrof
	3Qnb00u4AYpboy90xokoleTreNzwaUo9hLw0RcgHYfKwe1A1Xcb+O78GO9skfw6Sy11RhONdw20+S
	1FPCwM00jZ35dXRMA0PCYicUlbrqjVeZ6DNhvmejYzzxM6fp/XafcCdTyL01teimVVnpkZ5QF6cqr
	ytct+KJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Jif-008KD7-2v;
	Wed, 29 Nov 2023 12:31:09 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IZV-007z6m-1X;
	Wed, 29 Nov 2023 11:17:39 +0000
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b88f2a37deso862327b6e.0;
        Wed, 29 Nov 2023 03:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256654; x=1701861454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIg/lVR/UB6jNsuQOE2z1pZZGLYqtdqMUy/N5XrA7+s=;
        b=tW21bm7VBKx/92fPpi3R48ifgO2HBWUKgCEcuYW9LmNBy8qwi5nTnIJz/NIYkb9QSy
         Rn5csrCXgc7VkkyT3z8ck9syrI6CRXX3lw+kTBBpAmAuWzrfBJ7XE5xG+C3+EWsrd7e3
         ejvE7NTAUVSYwoKZbKzMfW8xbRP+0KAeFCP0htEz1Ns9uvL0cpv4Dq48L+lnEjrSXPsV
         uwQWmv7lENeyRzR+bvYec4Blo2nNzvKRqxEwwXpJq+EZkbfO0wfEF/RG/XaBr00tSjbY
         JpWZBCLkT01HB/e9stay/8jEUaK0UDJWe/x2LQ2l/FJdRq9GYOQhwZacVTJCUK3Omi2o
         v1sg==
X-Gm-Message-State: AOJu0Yzkb8lmNTfh+MP26aeAScs+q725CpKSVmVCz7CU1H7e3feVqIBe
	y3UWRB1z/N3mITWl8PH9ZMaykNvZxXQo6Q==
X-Google-Smtp-Source: AGHT+IG4v1MlliekgR2rrJy2kNqI+gUP7ngEl+FERknfF0I1j+cyXyjvGMkgOBKwgXCp6/TbwQnwCA==
X-Received: by 2002:a05:6808:1790:b0:3a4:8251:5f43 with SMTP id bg16-20020a056808179000b003a482515f43mr25215460oib.40.1701256654304;
        Wed, 29 Nov 2023 03:17:34 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id i16-20020aca2b10000000b003b897b71e11sm144568oik.56.2023.11.29.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:17:34 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b8958b32a2so402738b6e.2;
        Wed, 29 Nov 2023 03:17:33 -0800 (PST)
X-Received: by 2002:a05:6902:566:b0:d7b:90c6:683c with SMTP id
 a6-20020a056902056600b00d7b90c6683cmr19865805ybt.26.1701256247010; Wed, 29
 Nov 2023 03:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com> <20231128200155.438722-21-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231128200155.438722-21-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:10:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPPHN=G8Ej0apBch4hFWic+jWBBt1SWjgz0xD_wFw=Gw@mail.gmail.com>
Message-ID: <CAMuHMdXPPHN=G8Ej0apBch4hFWic+jWBBt1SWjgz0xD_wFw=Gw@mail.gmail.com>
Subject: Re: [PATCH v3 20/22] pinctrl: renesas: Convert to use grp member
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
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
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_031737_520493_4B0AC27E 
X-CRM114-Status: GOOD (  18.49  )
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
> Convert drivers to use grp member embedded in struct group_desc.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -273,7 +273,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *=
pctldev,
>         struct function_desc *func;
>         unsigned int i, *psel_val;
>         struct group_desc *group;
> -       int *pins;
> +       const int *pins;

unsigned, as this no longer signed.

>
>         func =3D pinmux_generic_get_function(pctldev, func_selector);
>         if (!func)
> @@ -283,9 +283,9 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *=
pctldev,
>                 return -EINVAL;
>
>         psel_val =3D func->data;
> -       pins =3D group->pins;
> +       pins =3D group->grp.pins;

> --- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> @@ -165,7 +165,7 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *=
pctldev,
>         struct function_desc *func;
>         unsigned int i, *psel_val;
>         struct group_desc *group;
> -       int *pins;
> +       const int *pins;

unsigned

>
>         func =3D pinmux_generic_get_function(pctldev, func_selector);
>         if (!func)
> @@ -175,9 +175,9 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *=
pctldev,
>                 return -EINVAL;
>
>         psel_val =3D func->data;
> -       pins =3D group->pins;
> +       pins =3D group->grp.pins;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

