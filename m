Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA502C10DCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxLSyniVGe3oXQ5MuL2XefFrl8HM24cTqFseCBF9Iy0=; b=GnlIHWBwjCwR4FS21fCwllBLh6
	0uabxoc5ZEsz7YZAQ745bauGfwoI1vSsujuGTIdAXcEN656NXpONMj+hgOllsiMpZsMc3qqlfnuMA
	PZpVXULOR1OIBAEQJDgJsruk9Oi03VRKgMKe81jXK7WwjAQtPG+ayeoophxpjZaCSPTY9jHOXHYFB
	Z3XvfnSqycFMjqCo6j7Sv3h3ukzH6/2/vlu5VxCfNDeSFvxuwqu1fGdO3jJkC/6K36dQKLcpowcse
	/c+jlUvpBCAK1TTn+X376Mn4iEyzJQTLOBBsYPuZFJJ8DIfO12NO1yC00KyxZ0fj4DKVY4HpHVYM1
	BDdNyvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAA68-004oJp-1l;
	Mon, 04 Dec 2023 14:39:00 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAA66-004oIT-06
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 14:38:59 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d3efc071e2so36163837b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 06:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701700735; x=1702305535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxLSyniVGe3oXQ5MuL2XefFrl8HM24cTqFseCBF9Iy0=;
        b=WIrxi189iuaILGB5wecSNrGBXniKikQ67fiPSHQwptCz3acf3lqopIkHHSUgrLEsXr
         mYrrPA2tbZpMK9NQnwPJG0grpBLUYkP2AAUO/y/YOSqn0HRdq51BlvFX9bYt4O2gO6Tn
         UdbhOH0oHKCsF1qKqgdC+NSZwH7ddOsOVnQFYzIBOP4BMSTG5l7GmE9TFGS3iheC0Fkj
         3XiGR2raOGbdTmgkMAmXI2Ye9kZJsub2Ia6bVnEqeLv1fpyIgGlINbp1SZ2wD87fox+b
         jBSy2lqGvtiJWOp6OX9sxlQc4TfsloTziD8o3gUeraAAXZIrtd0EZHYL4vuWWmIzl51M
         SjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700735; x=1702305535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxLSyniVGe3oXQ5MuL2XefFrl8HM24cTqFseCBF9Iy0=;
        b=TLWmByAnaPCFNfQp2IuPgzIG+0CBcE6mNAluv8xLVsOHR7UTrIN/0jk02uHy5NDZya
         U7iVRNCDaD3Ezp+I9XQdlMl0ELCKkeVgSAlLm+MaHiXyoqAkBS/tXyj9UYMgtJuoHMKV
         1j0TG2N9BgXBnGOPPukMFXGSUs12JRhf8qjzMhoSgnzjvXY+0yOBL8lnLgA12gOzoBAg
         brMPltlYDpIztUsUKz6isUKb4g9DJaFAWSBGqHDE4IOuknNoWtRz8xiAl9MbFGr0eSiz
         53BciZtm1oDO6OWhkTikjBm/V9qcMP6xzL5Yvo/5GPPpMYYJL1zOwvjI2wWVcrrIxD3L
         xNpg==
X-Gm-Message-State: AOJu0YyW766Rz+nWBPk9gP5lj2MKwPH5qjXx/ZPMnMw9eoqu1AifJ0qQ
	b2jN1UeTj40ySNDqwt3W+bvwc+iYFxOFlB0Zx+/Euw==
X-Google-Smtp-Source: AGHT+IF5j0JqaMho4i7p5964T0Yqh+pRNVtwTFoozUNJZ0KaRa5Q9kvxCuDBokw9Cjl6tT4I/mCwxZtlAamIDbGbO0w=
X-Received: by 2002:a81:57d8:0:b0:5d3:adfd:ff7d with SMTP id
 l207-20020a8157d8000000b005d3adfdff7dmr3131183ywb.12.1701700735577; Mon, 04
 Dec 2023 06:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 15:38:43 +0100
Message-ID: <CACRpkdZhpXcx2FZYKM69j3x4dP5Nu-=3sXW+BQAw3k6c5aRrWw@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
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
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_063858_196112_354B64DD 
X-CRM114-Status: GOOD (  12.07  )
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

due to compile errors on arm32 and arm64 I had to drop most of the
patches again but I kept the preparatory patches so your
patch stack don't need to be so deep.

On Wed, Nov 29, 2023 at 5:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Andy Shevchenko (23):
>   pinctrl: qcom: lpass-lpi: Replace kernel.h with what is being used
>   pinctrl: qcom: lpass-lpi: Remove unused member in struct lpi_pingroup
>   pinctrl: equilibrium: Unshadow error code of
>     of_property_count_u32_elems()
>   pinctrl: equilibrium: Use temporary variable to hold pins
>   pinctrl: imx: Use temporary variable to hold pins

I kept these.

>   pinctrl: core: Make pins const unsigned int pointer in struct
>     group_desc
>   pinctrl: equilibrium: Convert to use struct pingroup
>   pinctrl: keembay: Convert to use struct pingroup
>   pinctrl: nuvoton: Convert to use struct pingroup and
>     PINCTRL_PINGROUP()
>   pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
>   pinctrl: ingenic: Make use of PINCTRL_GROUP_DESC()
>   pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
>   pinctrl: core: Embed struct pingroup into struct group_desc
>   pinctrl: bcm: Convert to use grp member
>   pinctrl: equilibrium: Convert to use grp member
>   pinctrl: imx: Convert to use grp member
>   pinctrl: ingenic: Convert to use grp member
>   pinctrl: keembay: Convert to use grp member
>   pinctrl: mediatek: Convert to use grp member
>   pinctrl: renesas: Convert to use grp member
>   pinctrl: starfive: Convert to use grp member
>   pinctrl: core: Remove unused members from struct group_desc

I dropped these (because they all cross-depend...)

>   pinctrl: Convert unsigned to unsigned int

I kept this one.

Yours,
Linus Walleij

