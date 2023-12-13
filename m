Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B54C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+nOj5MYcM4srD76YhSDWHxSUN6Beaf32aCqIr/6IcY=; b=s7eXkR9xhEi6jRfWWFSvhsAiOx
	/phklJATLV5rdBfzdxrVTwL/JuNXxBoEQH3FSu2Z3cazHNOHoYXNbGgP93GLlRhMXjSdnVxndwAaY
	QZiBhH3vwsNr1dHfMGFsKKN84i6JvH4ki+ZKQ0C6jA1IDedSew6B1c/CT2ucyXX+oP7VIho6hZY8L
	EW2De6H5+i89FXIHKkH0ucYxDwPtfn0Koyc3MoGihBGk+brkweaZNbNHzXwhyVn/YSQsSVsd8G1OW
	LqPk3reQr8Uo+439tOgoB9hN0NnTPMARo2G1MNRIEBnt8sNyAoaeZBZH658KwDmGml5oXHmT1iEaJ
	xJ7Rb65Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLyF-00ECBA-2s;
	Wed, 13 Dec 2023 09:56:03 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLyC-00EC9p-0O;
	Wed, 13 Dec 2023 09:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1702461349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O+nOj5MYcM4srD76YhSDWHxSUN6Beaf32aCqIr/6IcY=;
	b=PYtZ1FH72J9BtqoyieIYRE3EXQzn8sFVHJ2pZLYJ5FGmyWewc81Q1u4AxE+RdcEK48yz1b
	16qAyF9wivlgKlaVJ7YH1liZymekiefMXYHXnuQ0i/55n0f/lmT90fEAeBt8rzxnwMWPum
	dN45uxJ7uLcn+Pv3j2ZbVn/c0EsQsxk=
Message-ID: <fb29c3bca8d245e3f7496539b7293aa4fc4bccd0.camel@crapouillou.net>
Subject: Re: [PATCH v5 03/13] pinctrl: ingenic: Use C99 initializers in
 PINCTRL_PIN_GROUP()
From: Paul Cercueil <paul@crapouillou.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,  Jianlong Huang
 <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng
 <aisheng.dong@nxp.com>,  Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,  Pengutronix Kernel
 Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, NXP
 Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, Lakshmi
 Sowjanya D <lakshmi.sowjanya.d@intel.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>
Date: Wed, 13 Dec 2023 10:55:46 +0100
In-Reply-To: <20231211190321.307330-4-andriy.shevchenko@linux.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
	 <20231211190321.307330-4-andriy.shevchenko@linux.intel.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
	YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_015600_330459_1AC33F68 
X-CRM114-Status: GOOD (  10.24  )
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

Le lundi 11 d=C3=A9cembre 2023 =C3=A0 20:57 +0200, Andy Shevchenko a =C3=A9=
crit=C2=A0:
> For the better flexibility use C99 initializers in
> PINCTRL_PIN_GROUP().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 21 +++++++++++++--------
> =C2=A01 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index ee718f6e2556..f5661dcdedf5 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -82,16 +82,21 @@
> =C2=A0#define PINS_PER_GPIO_CHIP			32
> =C2=A0#define JZ4730_PINS_PER_PAIRED_REG	16
> =C2=A0
> -#define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
> -	{						\
> -		name,					\
> -		id##_pins,				\
> -		ARRAY_SIZE(id##_pins),			\
> -		funcs,					\
> +#define INGENIC_PIN_GROUP_FUNCS(_name_, id,
> funcs)					\
> +	{						=09
> 			\
> +		.name =3D
> _name_,								\
> +		.pins =3D
> id##_pins,							\
> +		.num_pins =3D
> ARRAY_SIZE(id##_pins),					\
> +		.data =3D
> funcs,								\
> =C2=A0	}
> =C2=A0
> -#define INGENIC_PIN_GROUP(name, id, func)		\
> -	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
> +#define INGENIC_PIN_GROUP(_name_, id,
> func)						\
> +	{						=09
> 			\
> +		.name =3D
> _name_,								\
> +		.pins =3D
> id##_pins,							\
> +		.num_pins =3D
> ARRAY_SIZE(id##_pins),					\
> +		.data =3D (void
> *)func,							\
> +	}

This INGENIC_PIN_GROUP() macro doesn't need to be modified, does it?

Cheers,
-Paul

> =C2=A0
> =C2=A0enum jz_version {
> =C2=A0	ID_JZ4730,


