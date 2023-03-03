Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15554C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 21:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4xly5cPivRmKG5en4dhXMV9dnxjsLHCX2hEjgGetsg=; b=YuuoSGpIE5rU5o/YIDok5QE7Bk
	LPHSri7d+I1XJPWlJIbQp7X2wbjm+NFjBRUxdVkFtJ+rl9yke9gklKHzlqzXzdgs/Ovdh6dlH85eE
	I5Un/TetcCqvY4dNqeabHDGZk7LhADG3/WnI/VTBA9cGaiPUpMgk9DGFKwWuNgDAHYzfJR7eeOLrM
	V/qHveu+aRE0qGO0pLoq3CZwtqZuT2ljb0josl1QohhfCsrxHgNlplhDaK5YMCqUx5fGE5Mo/7v6G
	7IjHJ1Jml3elfxKD0hDAtDpec4RjsHJWMCeGdLNp2/dfbByYkk1Z7gGw2/hDtPCzvyue3Wq4EVx54
	kJiCg5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYCmi-007SHf-Sb; Fri, 03 Mar 2023 21:17:48 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYCmg-007SGd-3D
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 21:17:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYCmQ-0006lb-TU; Fri, 03 Mar 2023 22:17:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYCmP-001e60-Kf; Fri, 03 Mar 2023 22:17:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYCmO-001wpF-Vd; Fri, 03 Mar 2023 22:17:28 +0100
Date: Fri, 3 Mar 2023 22:17:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lorenz Brun <lorenz@brun.one>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: support inverted polarity
Message-ID: <20230303211725.7wtxdxjqpxlrp77b@pengutronix.de>
References: <20230303205821.2285418-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n7hf6kwnvue2vkyt"
Content-Disposition: inline
In-Reply-To: <20230303205821.2285418-1-lorenz@brun.one>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_131746_200312_13268648 
X-CRM114-Status: GOOD (  23.59  )
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


--n7hf6kwnvue2vkyt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 09:58:21PM +0100, Lorenz Brun wrote:
> According to the MT7986 Reference Manual the Mediatek  PWM controller
> doesn't appear to have support for inverted polarity.
>=20
> This implements the same solution as in pwm-meson and just inverts the
> duty cycle instead, which results in the same outcome.

This idea is broken. This was recently discussed on the linux-pwm list
and I hope will be fixed soon. See
https://lore.kernel.org/linux-pwm/20230228093911.bh2sbp4tyfir2z5g@pengutron=
ix.de/T/#meda75ffbd4ef2048991ea2cd091c0c14b1bb09c2

So this patch won't be accepted, still pointing out a style problem
below.

> Signed-off-by: Lorenz Brun <lorenz@brun.one>
> ---
>  drivers/pwm/pwm-mediatek.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index 5b5eeaff35da..6f4a54c8299f 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -202,9 +202,7 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, =
struct pwm_device *pwm,
>  			      const struct pwm_state *state)
>  {
>  	int err;
> -
> -	if (state->polarity !=3D PWM_POLARITY_NORMAL)
> -		return -EINVAL;
> +	u64 duty_cycle;
> =20
>  	if (!state->enabled) {
>  		if (pwm->state.enabled)
> @@ -213,7 +211,14 @@ static int pwm_mediatek_apply(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  		return 0;
>  	}
> =20
> -	err =3D pwm_mediatek_config(pwm->chip, pwm, state->duty_cycle, state->p=
eriod);
> +	// According to the MT7986 Reference Manual the peripheral does not
> +	// appear to have the capability to invert the output. Instead just
> +	// invert the duty cycle.

Wrong commenting style, please stick to C-style comments (/* ... */)

> +	duty_cycle =3D state->duty_cycle;
> +	if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> +		duty_cycle =3D state->period - state->duty_cycle;
> +
> +	err =3D pwm_mediatek_config(pwm->chip, pwm, duty_cycle, state->period);
>  	if (err)
>  		return err;

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--n7hf6kwnvue2vkyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQCY+IACgkQwfwUeK3K
7An4QAf/VVzJ1G1vLm5fgqHWXuxXbRYDJjva5NFicH4hK041/2hnM4z6BbR6dAI1
YvBRLNTRTj6Wacfz19kTKht1KUHyJFo+0rXvm7OTVE2Kk+QonHuoWWDxkEYphlhG
IYbl7xuHl42c4cQ2qyA2+j4pItly7UrZVEwm20UGTgEf04V3pZdjhtZ41BOMk/mN
m4XRjJMwp/UURdNcj1D1a0LptvzNdqohH8t8y5RtIV8m6IRH2BdCyJsWi3iRyWNp
A748CqKSRhN1gj1ow0zPZO+nNQ4N91ZAb6AM3PLnaUoL+r69lG3355uaj/5H6bjW
ovEzhU8TABbvhEVdstiMVHpOulLcDg==
=6bfG
-----END PGP SIGNATURE-----

--n7hf6kwnvue2vkyt--

