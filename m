Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6AEC61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 11:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6GnRM6NidZUi3jRK7RqXEpkhU/vKlU/QT05ifHMFJk=; b=DmJZ/ISJ9DDkyp2d39u4qU0q9g
	bTNVdQht89xWdXACaL5Iq/OZA0V4IZlWurBkPopyqrMCFfUaP6Duqip9P0q9LyxI+Aq2MYcq/2m/U
	HBx3mMif2F5CDFdEebY6iq25GvNa/dSUAcLfW3gTTyZvXavTTmM4AewBM4GBJpN6sWLl7JR+NbGsA
	zTTrjyL5amsyAZKeJNDKkqhJUqUWbhvgeP2aq/UabSKQw0MI+LzKqNDZ7ZCGdqgTV91P+o5F9jpFc
	9KsY0op/oUVN+VqIalMFfEZK9GgP8koUFcLntKxQK4q+6D985X71MDinDQaUFGpD3Ht5pydpvCmWs
	ssPrYhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6U5Q-006wzH-14;
	Fri, 24 Nov 2023 11:11:04 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6U5N-006wxb-0G;
	Fri, 24 Nov 2023 11:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1700824250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L6GnRM6NidZUi3jRK7RqXEpkhU/vKlU/QT05ifHMFJk=;
	b=LBrchC0qhmWyX0lJ6ONu1O4uhPxAqVOOC6X9B227EFK9Ztd2h8AwOKaiNll6vofsqLpbJX
	RKvhK/2zU21J2TYqpAtyku5yL3gDWwivNfPNwDMZ4GaNpu6v8qUX56B/GixPh2f4IfqRtI
	J+B1QI7g2t51b4ero5nx4JOTTKgNC/8=
Message-ID: <4b5cf6f837037bcc4cefb3b36a2773a2707ef292.camel@crapouillou.net>
Subject: Re: [PATCH v2 16/21] pinctrl: ingenic: Convert to use grp member
From: Paul Cercueil <paul@crapouillou.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.neuschaefer@gmx.net>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng
 <aisheng.dong@nxp.com>,  Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,  Pengutronix Kernel
 Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, NXP
 Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, Lakshmi
 Sowjanya D <lakshmi.sowjanya.d@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Hal
 Feng <hal.feng@starfivetech.com>
Date: Fri, 24 Nov 2023 12:10:47 +0100
In-Reply-To: <20231123193355.3400852-17-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
	 <20231123193355.3400852-17-andriy.shevchenko@linux.intel.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
	YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_031101_289853_07F988A0 
X-CRM114-Status: GOOD (  14.68  )
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

Le jeudi 23 novembre 2023 =C3=A0 21:31 +0200, Andy Shevchenko a =C3=A9crit=
=C2=A0:
> Convert drivers to use grp member embedded in struct group_desc.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 18 +++++++++---------
> =C2=A01 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 393873de910a..6806fede5df4 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3756,17 +3756,17 @@ static int ingenic_pinmux_set_mux(struct
> pinctrl_dev *pctldev,
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	dev_dbg(pctldev->dev, "enable function %s group %s\n",
> -		func->name, grp->name);
> +		func->name, grp->grp.name);
> =C2=A0
> =C2=A0	mode =3D (uintptr_t)grp->data;
> =C2=A0	if (mode <=3D 3) {
> -		for (i =3D 0; i < grp->num_pins; i++)
> -			ingenic_pinmux_set_pin_fn(jzpc, grp-
> >pins[i], mode);
> +		for (i =3D 0; i < grp->grp.npins; i++)
> +			ingenic_pinmux_set_pin_fn(jzpc, grp-
> >grp.pins[i], mode);
> =C2=A0	} else {
> =C2=A0		pin_modes =3D grp->data;
> =C2=A0
> -		for (i =3D 0; i < grp->num_pins; i++)
> -			ingenic_pinmux_set_pin_fn(jzpc, grp-
> >pins[i], pin_modes[i]);
> +		for (i =3D 0; i < grp->grp.npins; i++)
> +			ingenic_pinmux_set_pin_fn(jzpc, grp-
> >grp.pins[i], pin_modes[i]);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -4293,12 +4293,12 @@ static int __init
> ingenic_pinctrl_probe(struct platform_device *pdev)
> =C2=A0
> =C2=A0	for (i =3D 0; i < chip_info->num_groups; i++) {
> =C2=A0		const struct group_desc *group =3D &chip_info-
> >groups[i];
> +		const struct pingroup *grp =3D &group->grp;
> =C2=A0
> -		err =3D pinctrl_generic_add_group(jzpc->pctl, group-
> >name,
> -				group->pins, group->num_pins, group-
> >data);
> +		err =3D pinctrl_generic_add_group(jzpc->pctl, grp-
> >name, grp->pins, grp->npins,
> +						group->data);
> =C2=A0		if (err < 0) {
> -			dev_err(dev, "Failed to register group
> %s\n",
> -					group->name);
> +			dev_err(dev, "Failed to register group
> %s\n", grp->name);
> =C2=A0			return err;
> =C2=A0		}
> =C2=A0	}


