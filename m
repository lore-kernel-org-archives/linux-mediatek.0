Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBC1C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 20:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVCjiKCCl/VeQNWt8PtvAxtZLBRlpY2z5UZuNcs/Lew=; b=VKTMw/9VPsEJhVm5jVqMJxlm3m
	xQ6lP6qYM/5xVSAJtJDO96I1MQPxQCUpATx6J8T5uIaZlbFO69bFQz7LskPNEOElstJgJh74UW2wv
	GIKtbRP2WImJGDzq2e5UgR5CRDif8in3GFrrHA499zvFMU21joXn4s9HjXgt4Ywuw7xvSEbNqv35g
	vf8NfQTdbjE4KxneVETUHodg+TRmRtz6zRgl1AK0f9kC3QRzsqvUW7e8GNDh0amK+l2ZoP1vCoWIM
	7xQ0MoIchq5xrD7qj29VAQypCYje55XUbc/OKA3MZaPVPUXP2fnx6jFD0xXy3/NsKk8dKDc15NBJ2
	sRGvYkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2IQ8-00ATdE-7f; Mon, 05 Dec 2022 20:50:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2IQ3-00ATZr-H6; Mon, 05 Dec 2022 20:50:33 +0000
Received: by mail-ej1-x62e.google.com with SMTP id t17so1468417eju.1;
        Mon, 05 Dec 2022 12:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVCjiKCCl/VeQNWt8PtvAxtZLBRlpY2z5UZuNcs/Lew=;
        b=XvJr+2rJm7JOHlq9x+fOv7NDm86bbibMxBpK63VeMD2EMqGdhu2XuWkgvVLdDR0z70
         rNjTyDDxW9o5ErSENlsUnIfCC0WhZuejJ2yih0mLoHswCM2M58xZp+WRXrhKHNzoDC98
         eywNrn9703v1hEHCC19pIxnm9UAOmv/ciCyk8aNqL1llwB1pwKlrAN3g0vWuCDVwec3u
         b2oe64W6gGqXEP/w77AW1mJZUnpIQaflKXXD7S2AxRLNn+kpk5aBgHioUah3AXqYRLz0
         Ni6YsVblS514+p5ZnwbjXWkaD6uhuoaqZS6tGC11waKPWHF6EekaoetSMeNIEbDaBvy2
         bqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVCjiKCCl/VeQNWt8PtvAxtZLBRlpY2z5UZuNcs/Lew=;
        b=7HHmtDIfYrqrXBVP5/aT1S3fhmB52cKTRSyQU9Hk9ZcLedi+FH1HfDgz7nXAA16oFd
         lyEo3kLbt+xTCC9cqn6VNsIL1wjr4LsfFILzb5wqU/0PZFuFn2aYtGWjvUKm1hVX61wv
         SZre35WC3hFYTDTTsnaGX89yRWrgPbZX4L2y4jrQneZomYpnec5p3SDFT4PtnB0RSfPQ
         kMKiz1CevOo5EDfaOp14Dpru82DYg9t3Uiv/Nxnf028PlylNJyYmXmGK1B+qgfni0FT2
         8RxFpvH74Aqe3au0e4opxh698RomyF2YvClus51i1hbvL78kDOBKx9Qg36rGa1F/1FLH
         IANQ==
X-Gm-Message-State: ANoB5pk/EyS+ZUwDs17t1OsT0e93LsRGsYvisqwvt8f2Lf2T1N5tHrsj
	rzAqSZD+kscw8+/cZFZmlxM=
X-Google-Smtp-Source: AA0mqf5OSt768BV9vzFy9k66tV39xf6Wmy4SS9KX61nTQHi4Fa5yPtn/xJX8Qo/SjgdCekjDSrIRXw==
X-Received: by 2002:a17:906:4b4a:b0:7c0:e5cb:aad8 with SMTP id j10-20020a1709064b4a00b007c0e5cbaad8mr7371981ejv.407.1670273427580;
        Mon, 05 Dec 2022 12:50:27 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id g9-20020a17090670c900b0077f324979absm6580859ejk.67.2022.12.05.12.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:50:27 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Douglas Anderson <dianders@chromium.org>, Pavel Machek <pavel@ucw.cz>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, 
	Michal Simek <michal.simek@xilinx.com>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error code
Date: Mon, 05 Dec 2022 21:50:24 +0100
Message-ID: <22881769.6Emhk5qWAg@kista>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de> <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_125031_610911_2038171E 
X-CRM114-Status: GOOD (  22.10  )
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

Dne sreda, 30. november 2022 ob 16:21:38 CET je Uwe Kleine-K=F6nig napisal(=
a):
> .get_state() might fail in some cases. To make it possible that a driver
> signals such a failure change the prototype of .get_state() to return an
> error code.
>=20
> This patch was created using coccinelle and the following semantic patch:
>=20
> @p1@
> identifier getstatefunc;
> identifier driver;
> @@
>  struct pwm_ops driver =3D {
>         ...,
>         .get_state =3D getstatefunc
>         ,...
>  };
>=20
> @p2@
> identifier p1.getstatefunc;
> identifier chip, pwm, state;
> @@
> -void
> +int
>  getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct
> pwm_state *state) {
>    ...
> -  return;
> +  return 0;
>    ...
>  }
>=20
> plus the actual change of the prototype in include/linux/pwm.h (plus some
> manual fixing of indentions and empty lines).
>=20
> So for now all drivers return success unconditionally. They are adapted
> in the following patches to make the changes easier reviewable.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  9 ++++++---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>  drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
>  drivers/pwm/pwm-atmel.c               |  6 ++++--
>  drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
>  drivers/pwm/pwm-crc.c                 | 10 ++++++----
>  drivers/pwm/pwm-cros-ec.c             |  8 +++++---
>  drivers/pwm/pwm-dwc.c                 |  6 ++++--
>  drivers/pwm/pwm-hibvt.c               |  6 ++++--
>  drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
>  drivers/pwm/pwm-imx27.c               |  8 +++++---
>  drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
>  drivers/pwm/pwm-iqs620a.c             |  6 ++++--
>  drivers/pwm/pwm-keembay.c             |  6 ++++--
>  drivers/pwm/pwm-lpss.c                |  6 ++++--
>  drivers/pwm/pwm-meson.c               |  8 +++++---
>  drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
>  drivers/pwm/pwm-pca9685.c             |  8 +++++---
>  drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
>  drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
>  drivers/pwm/pwm-sifive.c              |  6 ++++--
>  drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
>  drivers/pwm/pwm-sprd.c                |  8 +++++---
>  drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
>  drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
>  drivers/pwm/pwm-sunplus.c             |  6 ++++--
>  drivers/pwm/pwm-visconti.c            |  6 ++++--
>  drivers/pwm/pwm-xilinx.c              |  8 +++++---
>  include/linux/pwm.h                   |  4 ++--
>  29 files changed, 146 insertions(+), 89 deletions(-)
>=20
<snip>
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index c8445b0a3339..37d75e252d4e 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -108,9 +108,9 @@ static inline void sun4i_pwm_writel(struct
> sun4i_pwm_chip *chip, writel(val, chip->base + offset);
>  }
>=20
> -static void sun4i_pwm_get_state(struct pwm_chip *chip,
> -				struct pwm_device *pwm,
> -				struct pwm_state *state)
> +static int sun4i_pwm_get_state(struct pwm_chip *chip,
> +			       struct pwm_device *pwm,
> +			       struct pwm_state *state)
>  {
>  	struct sun4i_pwm_chip *sun4i_pwm =3D to_sun4i_pwm_chip(chip);
>  	u64 clk_rate, tmp;
> @@ -132,7 +132,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		state->duty_cycle =3D DIV_ROUND_UP_ULL(state->period, 2);
>  		state->polarity =3D PWM_POLARITY_NORMAL;
>  		state->enabled =3D true;
> -		return;
> +		return 0;
>  	}
>=20
>  	if ((PWM_REG_PRESCAL(val, pwm->hwpwm) =3D=3D PWM_PRESCAL_MASK) &&
> @@ -142,7 +142,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		prescaler =3D prescaler_table[PWM_REG_PRESCAL(val, pwm-
>hwpwm)];
>=20
>  	if (prescaler =3D=3D 0)
> -		return;
> +		return 0;
>=20
>  	if (val & BIT_CH(PWM_ACT_STATE, pwm->hwpwm))
>  		state->polarity =3D PWM_POLARITY_NORMAL;
> @@ -162,6 +162,8 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>=20
>  	tmp =3D (u64)prescaler * NSEC_PER_SEC * PWM_REG_PRD(val);
>  	state->period =3D DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
> +
> +	return 0;
>  }
>=20
>  static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,

=46or sun4i:

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



