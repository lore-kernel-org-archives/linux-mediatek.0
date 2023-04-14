Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DE9C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 05:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2GGKZzcoWT/dnJiGbukNO/0u6DrSFMntGAj0CPpajY=; b=NvItPoe7dKMSDs/0ZrWVcIIwT1
	ypYFDFOj9AKfEdt/FEf1i4WcmZZRS82NfaybgKBcLS7+Ulle7pj52UbtgjGrT1kHFyBWQ8aHq/OlH
	2IJmORIB3vIBBGV4b8yauG342KCoKeFTEgoQ+fT+9/vHipTHI9nz6zoWwewwUeySK5IxyiXokQLmW
	f+00YvwLLKVF0+06l9QKEcRlg2Vg56D/EEcqg2tA3zND+qj5IIxW6V4imSjTbDSwf/WdjP9JQvV8F
	a35fTGV6D/IfhsX2ib1yWhiMQDjK+91WS0p3KWG8ycNCmVq57h+qOWPfg22R9Nu12aHi5aAh+cuEn
	Jj8+8akg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnCAR-008O3F-05;
	Fri, 14 Apr 2023 05:40:15 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnCAL-008O1r-0b
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 05:40:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pnCAC-0006SE-0k; Fri, 14 Apr 2023 07:40:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pnCAA-00B80H-9r; Fri, 14 Apr 2023 07:39:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pnCA9-00D4DJ-Hw; Fri, 14 Apr 2023 07:39:57 +0200
Date: Fri, 14 Apr 2023 07:39:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Lorenz Brun <lorenz@brun.one>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] pwm: mediatek: support inverted polarity
Message-ID: <20230414053956.brgzufk4qjsswhqn@pengutronix.de>
References: <20230309010410.2106525-1-lorenz@brun.one>
 <ZC7LaC19YjNwTIi1@orome>
 <20230406135358.x3et6gvvxqsknfn6@pengutronix.de>
 <ZC7Xf8Wy1x9gnaAY@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhkhdogtpy7q73k5"
Content-Disposition: inline
In-Reply-To: <ZC7Xf8Wy1x9gnaAY@orome>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_224009_231914_829D96EC 
X-CRM114-Status: GOOD (  36.76  )
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


--yhkhdogtpy7q73k5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2023 at 04:30:23PM +0200, Thierry Reding wrote:
> On Thu, Apr 06, 2023 at 03:53:58PM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello Thierry,
> >=20
> > On Thu, Apr 06, 2023 at 03:38:48PM +0200, Thierry Reding wrote:
> > > On Thu, Mar 09, 2023 at 02:04:10AM +0100, Lorenz Brun wrote:
> > > > +	 * appear to have the capability to invert the output.
> > > > +	 * This means that inverted mode can not be fully supported as the
> > > > +	 * waveform will always start with the low period and end with th=
e high
> > > > +	 * period. Thus reject non-normal polarity if the shape of the wa=
veform
> > > > +	 * matters, i.e. usage_power is not set.
> > > > +	 */
> > > > +	if (state->polarity !=3D PWM_POLARITY_NORMAL && !state->usage_pow=
er)
> > > >  		return -EINVAL;
> > > > =20
> > > >  	if (!state->enabled) {
> > > > @@ -213,7 +221,11 @@ static int pwm_mediatek_apply(struct pwm_chip =
*chip, struct pwm_device *pwm,
> > > >  		return 0;
> > > >  	}
> > > > =20
> > > > -	err =3D pwm_mediatek_config(pwm->chip, pwm, state->duty_cycle, st=
ate->period);
> > > > +	duty_cycle =3D state->duty_cycle;
> > > > +	if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> > > > +		duty_cycle =3D state->period - state->duty_cycle;
> > >=20
> > > That's not really what state->usage_power was meant to address.
> >=20
> > I don't understand your concern here. I don't like .usage_power, but
> > AFAICT this is a legitimite use. With .usage_power =3D true, the lowlev=
el
> > driver is free to shift the phase_offset and even modify the period size
> > and the goal is just that the average power-output matches.
> >=20
> > Lorenz's patch does exactly this: It even keeps the period and only
> > shifts the phase (by period - duty_cycle). If you consider this not
> > legitmate, I think we have to improve the docs about .usage_power.
>=20
> I realize that I'm being nitpicky here. Setting usage_power =3D true and
> duty =3D period - duty is a lazy way of achieving what you can easily do
> by adjusting the input duty cycle.
>=20
> If you all really want this, then it should go into the core, because
> it's something that can be implemented on basically every single PWM
> controller.

You'd need something like:

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index e01147f66e15..6bb851c2e55e 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -556,6 +556,7 @@ static void pwm_apply_state_debug(struct pwm_device *pw=
m,
 int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state)
 {
 	struct pwm_chip *chip;
+	bool retry_inverted =3D true;
 	int err;
=20
 	/*
@@ -580,10 +581,19 @@ int pwm_apply_state(struct pwm_device *pwm, const str=
uct pwm_state *state)
 	    state->usage_power =3D=3D pwm->state.usage_power)
 		return 0;
=20
+retry:
 	err =3D chip->ops->apply(chip, pwm, state);
 	trace_pwm_apply(pwm, state, err);
-	if (err)
+	if (err) {
+		if (err =3D=3D -EINVAL && state->usage_power && retry_inverted) {
+			state->duty_cycle =3D state->period - state->duty_cycle;
+			state->polarity =3D 1 - state->polarity;
+			retry_inverted =3D false;
+			goto retry;
+		}
+
 		return err;
+	}
=20
 	pwm->state =3D *state;
=20
(Just to show the idea. It doesn't work like that, because *state is const.)

I don't like that .apply() is called twice and without having thought
much about it, I'd prefer explicit support in the lowlevel drivers over
this approach.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yhkhdogtpy7q73k5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ45ysACgkQj4D7WH0S
/k5KvwgAu/DxWjR+8IVUMgiC/Mt03EWw9prFOkM7WuY9uVichi8FtqTAcz9ZvFoi
DUWrejfZtFimOpBC/f8it5jUvMNvfJWyDHAkhFoCadF9a7KJcuD6/LytbLZ9lBhf
kKwuje4NMiMqcx/IBwK40og+b9HX0EKv3cj538DBS1rJfGNeb0Zi7U0oGWtcKLWh
2cKuSR+zwpTSbz/EIsLxkQ1HxDoLcvRnWDcdyuRwSJ83fajsyOGwp9HYQxG4ufZd
X5TelDTm2426/4bGkNT3+NBmmAXh9ch2twTfUYr2cEVyf2+yfPWRvzqwEfST8L7M
Q+sAwmCE76u4VOXYfuhz4I45STGmSQ==
=GjxX
-----END PGP SIGNATURE-----

--yhkhdogtpy7q73k5--

