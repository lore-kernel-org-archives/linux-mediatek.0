Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439B9C8303F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jul 2025 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKJ4gDTM67y1qVaOT6Wlk+8FP7UXSgewdUc9ulfe2Cw=; b=VGPGlORoOeQZOmNOA0Z0RgQLnY
	anPPIjF+X8c5AfZrDRc0Rl7r6hdKbx90kZiLoiJguNbRSVcsObFq+vzxi759bTbBrYHM8syfUJyVE
	fNzfcmyX1aw6O1l6Bts62LMGpRB/ljdYhhBhQdmiVlZI9yyU5e9f2U8q4wYRVZ1HFk2/Cmefz4hzY
	O2NhLgouTEK1U74jPv1xENqEXqM3mMq8saV+8IMdt2QGjyfrMvtshrnVt2Z4bsf53x+QhVaO7669p
	pxxv6+obSEspyS/l2Izf4+T763hSiK1898tomHYOhF5FXhQn+PZXhGy4Bfn/Iw+YNF41A3H23EBsE
	e372Vr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWhTR-00000006YuH-0T6g;
	Tue, 01 Jul 2025 20:21:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWf1q-00000006GJd-24oO;
	Tue, 01 Jul 2025 17:44:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CAA545F3B;
	Tue,  1 Jul 2025 17:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33B7C4CEEB;
	Tue,  1 Jul 2025 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751391860;
	bh=T/Oh3jotCzcmLKi13L685F87dDpqLPMtMcQj6fakPvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFC8LLDaQCERloxxDdzc9fDp24D33SKAmYgZ1QFEOmzF6jiKiF2fH1EYoGLBTDyic
	 DAf4tg0M7jTvpKKWO6Bcb9xNER/kpNY8Am6LmTbfe7sVF+DtYDlF35U1Coo3CpV4M7
	 /Th3Z18z7qwHtMSYuKvYYoGDluKbU7eBxqGLTb2vcV1rZcyfADPAoDl0EaInKSZQMy
	 +523XjIJeVk/nSgi3w/m0+h4md8zNTFLXti5KrMVtUpNMoC8ixPYLXAhDIboKSx9jS
	 e17VaG1/Z+x6oAaXb9lBOGsWH7AmAbp/zzL2jDYTGZ/Kq2PWkC1Yc60bP+K5sjuSO+
	 BX5oEW8zb2ibw==
Date: Tue, 1 Jul 2025 19:44:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	Julien Panis <jpanis@baylibre.com>, William Breathitt Gray <wbg@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, Mudit Sharma <muditsharma.info@gmail.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Song Qiang <songqiang1304521@gmail.com>, 
	Crt Mori <cmo@melexis.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Karol Gugala <kgugala@antmicro.com>, 
	Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, kernel@axis.com, 
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
Message-ID: <ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7p7eeo@qpuddn6wrz3x>
References: <pnd7c0s6ji2.fsf@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="siz3npg32duy4f54"
Content-Disposition: inline
In-Reply-To: <pnd7c0s6ji2.fsf@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_104422_580916_6962B4BF 
X-CRM114-Status: GOOD (  18.23  )
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


--siz3npg32duy4f54
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Remove error prints for devm_add_action_or_reset()
MIME-Version: 1.0

Hello,

On Tue, Jul 01, 2025 at 05:03:33PM +0200, Waqar Hameed wrote:
>  drivers/pwm/pwm-meson.c                          | 3 +--

Looking at this driver I tried the following:

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3809baed42f3..58a2ab74f14c 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5062,7 +5062,7 @@ static void __dev_probe_failed(const struct device *d=
ev, int err, bool fatal,
  *
  * Returns @err.
  */
-int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
+int _dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
 {
 	va_list vargs;
=20
@@ -5075,7 +5075,7 @@ int dev_err_probe(const struct device *dev, int err, =
const char *fmt, ...)
=20
 	return err;
 }
-EXPORT_SYMBOL_GPL(dev_err_probe);
+EXPORT_SYMBOL_GPL(_dev_err_probe);
=20
 /**
  * dev_warn_probe - probe error check and log helper
diff --git a/include/linux/dev_printk.h b/include/linux/dev_printk.h
index eb2094e43050..23ef250727f1 100644
--- a/include/linux/dev_printk.h
+++ b/include/linux/dev_printk.h
@@ -275,7 +275,13 @@ do {									\
 	WARN_ONCE(condition, "%s %s: " format, \
 			dev_driver_string(dev), dev_name(dev), ## arg)
=20
-__printf(3, 4) int dev_err_probe(const struct device *dev, int err, const =
char *fmt, ...);
+__printf(3, 4) int _dev_err_probe(const struct device *dev, int err, const=
 char *fmt, ...);
+
+#define dev_err_probe(dev, err, ...) (								\
+	(__builtin_constant_p(err) && err =3D=3D -ENOMEM) ? err : _dev_err_probe(=
dev, err, __VA_ARGS__)	\
+)
+
+
 __printf(3, 4) int dev_warn_probe(const struct device *dev, int err, const=
 char *fmt, ...);
=20
 /* Simple helper for dev_err_probe() when ERR_PTR() is to be returned. */
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index ae696d10faff..abfa5152b5a7 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -157,8 +157,11 @@ static inline int __devm_add_action_or_reset(struct de=
vice *dev, void (*action)(
 	int ret;
=20
 	ret =3D __devm_add_action(dev, action, data, name);
-	if (ret)
+	if (ret) {
+		if (ret !=3D -ENOMEM)
+			__builtin_unreachable();
 		action(data);
+	}
=20
 	return ret;
 }

With that

        ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
                                       meson->channels[i].clk);
        if (ret)
                return dev_err_probe(dev, ret,
                                     "Failed to add clk_put action\n");

=66rom drivers/pwm/pwm-meson.c is optimized to

        ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
                                       meson->channels[i].clk);
        if (ret)
                return ret;

=2E

I would prefer this approach, because a) there is no need to drop all
dev_err_probe()s after devm_add_action_or_reset() and b) the
dev_err_probe()s could stay for consistency in the error paths of a
driver.

Best regards
Uwe

--siz3npg32duy4f54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhkHm4ACgkQj4D7WH0S
/k40Ugf+IGBhMZPHVoCFXh9jXSPImkCDM81Omc7cyM5CZFFdOO09K82bfGBFD7bF
X+9ZxJqCFCRmF8AtN+3Z6xmAia7Q4jKwUgvdR/iJY4jMX6uQk49IxGgv9Ux9aAu2
/jttnDFocIwCi6sjUxxf2HCdfwLPKhfhrl+xNpQ80kh4oBZ+L0X5s6u6Mcsu8V2P
2O3Q05nJZK/bpCYZNgRHMeg4k71v6nG8eYw2nJ6n7dbTOtj+HnQC3GCfajWFg7mf
al8FLQxckEkDif0f7yDlSnjUT7oF78eg1G2pf9PDBr9I15efw+TkKSmkr/MIVXJE
YFLNKMZeRFfoAyzKWfjfpuR/ZUe+3Q==
=uD6x
-----END PGP SIGNATURE-----

--siz3npg32duy4f54--

