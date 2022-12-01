Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67293C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGtvBY5nBr5Ddyial7NAbAiuwGVMPW3OVR1PKnkZiQg=; b=3k3HD725f0EElSXE5amH/IvMTh
	ysPxziWj2HXNEfEQfBf7hDSLlyDxUkfy16kNRWJcxTaRUt3+kj+DWjHtD4TtmLdasrKRKYgyHt+ij
	NWB3WXAS+H0UUZm0sbrKtF/+b9+4562eMqt2qSVaNXJDNH3MkKp18IZLUE/yns4WmINMaugVGWK6A
	bP5DeQMok00gPgqzkCp3ZedwrrAJpx8x/gxmGEsl95ptR+BoU9Oh2V7DuTgwZQ5LTBpIi4Aa7YBGB
	89aE0Qicd08qifRNwORm3GX1lugG1J67xAA7JHyigz3kJL8KpYrTkiJ6UPzAsVtSDsWh56wHSn8vW
	K6uvzCSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gim-006gAc-Kr; Thu, 01 Dec 2022 10:23:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gih-006g6F-2d; Thu, 01 Dec 2022 10:23:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 175C1D6E;
	Thu,  1 Dec 2022 02:23:09 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4DF93F67D;
	Thu,  1 Dec 2022 02:22:55 -0800 (PST)
Date: Thu, 1 Dec 2022 10:22:52 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Douglas Anderson
 <dianders@chromium.org>, Pavel Machek <pavel@ucw.cz>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel
 Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson
 <sean.anderson@seco.com>, Michal Simek <michal.simek@xilinx.com>, Bjorn
 Andersson <andersson@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, Satya Priya
 <quic_c_skakit@quicinc.com>, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an
 error code
Message-ID: <20221201102252.52ace284@donnerap.cambridge.arm.com>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
	<20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_022307_257666_4BD03F7D 
X-CRM114-Status: GOOD (  25.50  )
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

On Wed, 30 Nov 2022 16:21:38 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

Hi,

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
>  getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct pwm_s=
tate *state)
>  {
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
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
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

[ ... ]
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index c8445b0a3339..37d75e252d4e 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -108,9 +108,9 @@ static inline void sun4i_pwm_writel(struct sun4i_pwm_=
chip *chip,
>  	writel(val, chip->base + offset);
>  }
> =20
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
> =20
>  	if ((PWM_REG_PRESCAL(val, pwm->hwpwm) =3D=3D PWM_PRESCAL_MASK) &&
> @@ -142,7 +142,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
>  		prescaler =3D prescaler_table[PWM_REG_PRESCAL(val, pwm->hwpwm)];
> =20
>  	if (prescaler =3D=3D 0)
> -		return;
> +		return 0;
> =20
>  	if (val & BIT_CH(PWM_ACT_STATE, pwm->hwpwm))
>  		state->polarity =3D PWM_POLARITY_NORMAL;
> @@ -162,6 +162,8 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip,
> =20
>  	tmp =3D (u64)prescaler * NSEC_PER_SEC * PWM_REG_PRD(val);
>  	state->period =3D DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
> +
> +	return 0;
>  }
> =20
>  static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,

For sunxi:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Just one comment: I don't see a sunxi specific patch later in the series,
though it seems we have at least one error error exit (see prescaler =3D=3D=
 0
above). Plus potentially another exit if clk_get_rate() (at the very
beginning) fails.
Shall I send a patch for that?

Cheers,
Andre.



