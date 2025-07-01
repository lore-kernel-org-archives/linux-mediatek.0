Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F247C8303C
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtbbpiDegnJQXlrh2WUSTjQ24NyeBZPCGE0rO18WBwU=; b=yeK5rS/HAo2xD/xsL0uOCvisfa
	1PEPGtJsAHKL2GoMTash6CRcCGATOSg0WBqi8HgIMpXRmOFU6pzpyvOujvbAgtXOYD2wr+/MiHqnY
	5XEH9Qi//EUsVWnZMngfwwcUOGYRuaZNatuZFhwjuSzOJ9oDPO43r3aPdtaSUY1q8AkIe60A5Turp
	u46m67W4LQWIffPPzFNELmnFcXtq8ANAqdJ1j3MVSt6XJJmzxnTi9DcsiVEhWsAIhiVjL1vYxr8RQ
	FGsuyX2d3+xF5syrg/amU8lcx2Tl5eKq6YUL0d7qR5m8AgYqPSHNWUj+w9LEmWVF8WNyEPQIvpeqh
	mMkyxw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhTS-00000006Yv4-0PNJ;
	Tue, 01 Jul 2025 20:21:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfCx-00000006HJP-3SnI;
	Tue, 01 Jul 2025 17:55:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF98B460CA;
	Tue,  1 Jul 2025 17:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A38C4CEEB;
	Tue,  1 Jul 2025 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751392550;
	bh=wNjXDKjq0I6/9yhbTcfL1kL2qUBF2TKpXGL7HuWci6Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HriBBdwvDpiR3MqtXKwPsYZ1oyhJc4LuNhlhGwLR9DueVpFhqgxh0iifGRF8evW5b
	 JkSKN6s2pXENJuY4L7jw9EN0o02oGOqxbejPJl98m6f7SgO53gilTl2QYWbDazLHJG
	 GMk+QoES7HtD/8pJ/jE4gIULQYzcfilklDsIvNLqEXk8jjIvhTDISALb6F1T5xkyuV
	 2ceg8TIweRtzrpnnwxZfvr4CfQb7JsO9KTeLrZbTN2IdbDo0841Ct19ICweXdr48Es
	 os2K+GpqIeRuS8b0lEvHCyatYjQShJnNz4T08zfYD8j5YgIEEztxJptyVRDDkHG/JJ
	 xDnujlxhZfnhA==
Date: Tue, 1 Jul 2025 18:55:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Waqar Hameed <waqar.hameed@axis.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Julien Panis <jpanis@baylibre.com>, William Breathitt
 Gray <wbg@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matteo Martelli <matteomartelli3@gmail.com>, Heiko Stuebner
 <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZlcw==?=
 <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>,
 Mudit Sharma <muditsharma.info@gmail.com>, Gerald Loacker
 <gerald.loacker@wolfvision.net>, Song Qiang <songqiang1304521@gmail.com>,
 Crt Mori <cmo@melexis.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Karol Gugala <kgugala@antmicro.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, Haibo Chen
 <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown
 <broonie@kernel.org>, Avri Altman <avri.altman@wdc.com>, Bart Van Assche
 <bvanassche@acm.org>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Souradeep Chowdhury
 <quic_schowdhu@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, kernel@axis.com,
 linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 imx@lists.linux.dev, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
Message-ID: <20250701185519.1410e831@jic23-huawei>
In-Reply-To: <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
References: <pnd7c0s6ji2.fsf@axis.com>
	<ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_105551_909942_4365F03B 
X-CRM114-Status: GOOD (  30.83  )
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

On Tue, 1 Jul 2025 19:44:17 +0200
Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> wrote:

> Hello,
>=20
> On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
> >  drivers/pwm/pwm-meson.c                          | 3 +-- =20
>=20
> Looking at this driver I tried the following:
>=20

Hi Uqe,

I'm not sure what we actually want here.

My thought when suggesting removing instances of this
particular combination wasn't saving on code size, but rather just
general removal of pointless code that was getting cut and
paste into new drivers and wasting a tiny bit of review bandwidth.
I'd consider it bad practice to have patterns like

void *something =3D kmalloc();
if  (!something)
	return dev_err_probe(dev, -ENOMEM, ..);

and my assumption was people would take a similar view with
devm_add_action_or_reset().

It is a bit nuanced to have some cases where we think prints
are reasonable and others where they aren't so I get your
point about consistency.

The code size reduction is nice so I'd not be against it as an extra
if the reduction across a kernel builds is significant and enough
people want to keep these non printing prints.

Jonathan


> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 3809baed42f3..58a2ab74f14c 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -5062,7 +5062,7 @@ static void __dev_probe_failed(const struct device =
*dev, int err, bool fatal,
>   *
>   * Returns @err.
>   */
> -int dev_err_probe(const struct device *dev, int err, const char *fmt, ..=
.)
> +int _dev_err_probe(const struct device *dev, int err, const char *fmt, .=
..)
>  {
>  	va_list vargs;
> =20
> @@ -5075,7 +5075,7 @@ int dev_err_probe(const struct device *dev, int err=
, const char *fmt, ...)
> =20
>  	return err;
>  }
> -EXPORT_SYMBOL_GPL(dev_err_probe);
> +EXPORT_SYMBOL_GPL(_dev_err_probe);
> =20
>  /**
>   * dev_warn_probe - probe error check and log helper
> diff --git a/include/linux/dev_printk.h b/include/linux/dev_printk.h
> index eb2094e43050..23ef250727f1 100644
> --- a/include/linux/dev_printk.h
> +++ b/include/linux/dev_printk.h
> @@ -275,7 +275,13 @@ do {									\
>  	WARN_ONCE(condition, "%s %s: " format, \
>  			dev_driver_string(dev), dev_name(dev), ## arg)
> =20
> -__printf(3, 4) int dev_err_probe(const struct device *dev, int err, cons=
t char *fmt, ...);
> +__printf(3, 4) int _dev_err_probe(const struct device *dev, int err, con=
st char *fmt, ...);
> +
> +#define dev_err_probe(dev, err, ...) (								\
> +	(__builtin_constant_p(err) && err =3D=3D -ENOMEM) ? err : _dev_err_prob=
e(dev, err, __VA_ARGS__)	\
> +)
> +
> +
>  __printf(3, 4) int dev_warn_probe(const struct device *dev, int err, con=
st char *fmt, ...);
> =20
>  /* Simple helper for dev_err_probe() when ERR_PTR() is to be returned. */
> diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
> index ae696d10faff..abfa5152b5a7 100644
> --- a/include/linux/device/devres.h
> +++ b/include/linux/device/devres.h
> @@ -157,8 +157,11 @@ static inline int __devm_add_action_or_reset(struct =
device *dev, void (*action)(
>  	int ret;
> =20
>  	ret =3D __devm_add_action(dev, action, data, name);
> -	if (ret)
> +	if (ret) {
> +		if (ret !=3D -ENOMEM)
> +			__builtin_unreachable();
>  		action(data);
> +	}
> =20
>  	return ret;
>  }
>=20
> With that
>=20
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return dev_err_probe(dev, ret,
>                                      "Failed to add clk_put action\n");
>=20
> from drivers/pwm/pwm-meson.c is optimized to
>=20
>         ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>                                        meson->channels[i].clk);
>         if (ret)
>                 return ret;
>=20
> .
>=20
> I would prefer this approach, because a) there is no need to drop all
> dev_err_probe()s after devm_add_action_or_reset() and b) the
> dev_err_probe()s could stay for consistency in the error paths of a
> driver.
>=20
> Best regards
> Uwe


