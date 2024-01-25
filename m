Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE18C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 20:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0x2YEQ1I9Sj+W6UCckFXe8IjIrAt9Den7NlybDUPJv0=; b=AkN6auNqU5Euu9Rx6exTOePwn5
	LUOb0mS0K3rFlYBbDo6Zo9eP9kaGRY4eIajNSVzSEKHecOUEPBLyaPl2kk/gKEtm7tBzqESxVNk8a
	WWROpFqr41ztWTX3zy6n2UpF5UNAtJc/aTxNVg62ErvRyLg4/kZQ2gwGLnBapE3O/XftaHr7vVQVS
	D2UrUHroQ64BjB/yXMHhRwypUIyd+Lbq3NYcSYZGYSDZFGTGMceGOUSuUNcx9oPISx4AVUfxnWjON
	5+npZwx+rcggC4uYfJkIfV9eDkaN87s9rHQvwTUqdPAyZK2vrAPa7OSXri+vWPrmLVZlAkDURg5D0
	A37FY0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT6ku-00000001sGQ-2LGt;
	Thu, 25 Jan 2024 20:55:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT6kr-00000001sEb-2ry6
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 20:55:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6kK-0000q6-2e; Thu, 25 Jan 2024 21:54:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6kE-002MbB-Qk; Thu, 25 Jan 2024 21:54:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6kE-0088NE-2C;
	Thu, 25 Jan 2024 21:54:42 +0100
Date: Thu, 25 Jan 2024 21:54:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Douglas Anderson <dianders@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Paul Cercueil <paul@crapouillou.net>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	linux-amlogic@lists.infradead.org, Guenter Roeck <groeck@chromium.org>, 
	linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, 
	linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, 
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-staging@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>, greybus-dev@lists.linaro.org, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Benson Leung <bleung@chromium.org>, kernel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device
 of a given chip
Message-ID: <h4l5ki3mvayfmfb73jnrokmxu3p2ewutihx4rytefmpce7bcxq@nhsyy2fw6fds>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
 <c89cbecf-253d-4a2c-8782-304b7b620175@broadcom.com>
 <e3xeos2rtfydqj3hz3ql7xkon3aa3aingww7q5lpb3xa4arqrs@6jgwfrgay4le>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cxtxp6sbv6wwe5j"
Content-Disposition: inline
In-Reply-To: <e3xeos2rtfydqj3hz3ql7xkon3aa3aingww7q5lpb3xa4arqrs@6jgwfrgay4le>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_125521_735980_7D591911 
X-CRM114-Status: GOOD (  26.60  )
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


--2cxtxp6sbv6wwe5j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 09:29:37PM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Jan 25, 2024 at 11:32:47AM -0800, Florian Fainelli wrote:
> > On 1/25/24 04:08, Uwe Kleine-K=F6nig wrote:
> > > Currently a pwm_chip stores in its struct device *dev member a pointer
> > > to the parent device. Preparing a change that embeds a full struct
> > > device in struct pwm_chip, this accessor macro should be used in all
> > > drivers directly accessing chip->dev now. This way struct pwm_chip and
> > > this macro can be changed without having to touch all drivers in the
> > > same change set.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > Nit: this is not a macro but an inline function.
>=20
> Oh right, it used to be a macro, but I changed that. I made the commit
> log read:
>=20
>     pwm: Provide an inline function to get the parent device of a given c=
hip
>=20
>     Currently a pwm_chip stores in its struct device *dev member a pointer
>     to the parent device. Preparing a change that embeds a full struct
>     device in struct pwm_chip, this accessor function should be used in a=
ll
>     drivers directly accessing chip->dev now. This way struct pwm_chip and
>     this new function can be changed without having to touch all drivers =
in
>     the same change set.

While looking into further feedback, I noticed I did the same mistake in
all the patches that convert the drivers to use this function. I did

	git filter-branch --msg-filter 'sed "s/Make use of pwmchip_parent() macro/=
Make use of pwmchip_parent() accessor/; s/commit as struct pwm_chip::dev, u=
se the macro/commit as struct pwm_chip::dev, use the accessor/; s/provided =
for exactly this purpose./function provided for exactly this purpose./"' li=
nus/master..

on my branch to make the typical commit log read:

	pwm: atmel: Make use of pwmchip_parent() accessor
=09
	struct pwm_chip::dev is about to change. To not have to touch this
	driver in the same commit as struct pwm_chip::dev, use the accessor
	function provided for exactly this purpose.

I wont resend the whole series if this is the only change to it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2cxtxp6sbv6wwe5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWyypEACgkQj4D7WH0S
/k5psggAul+UfI+G8dHEaH2KDgkBUUlYZUwuEaOFluY8XF2KWBYgzrV6GTSkw5wT
Me32hGYPzkH5GThVge4EwflIY6st1Dpe7hApskZcERowT4iaqpLmRhMLJSfbNFFL
TKdck+IYqa1cFxKcnCqPr5UHCx9DR2zJulclKHey+IaAQbbiSZ7PXqTliJidSqA4
gcZdCllP/NksXCjwuu7f3ffFYfT4eD4biOf/g24aQx4AkSSB/1xPNtYnwHwe9U7Q
NfCN0EtnmSN3qHIMZQ0v8PHGjfE/VvFR+cIRqaher18JI/FRZFfNPMhT1hniO7vh
qGInsEnK5ClF+KhK7XpBNiDRRAyXtw==
=6bo9
-----END PGP SIGNATURE-----

--2cxtxp6sbv6wwe5j--

