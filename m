Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF32AC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:28:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E156136A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E156136A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VfMyWATtKftlk+3K+aqZG8dO7NZnWB7HexecFxNXg0I=; b=ciChnYZdQUlvn+dZrG1b4XhD5
	E/uRNhG+m2vCimA+kdQD3stlObfXeaVfqA63Ji8ycDSiegcRSLJjmkHxFRO7LEFj+iGrfXjg43sOH
	pxZIEk3Tr/NMpVh1/erb6Gj/dF7L6idoiv6Rz+NJ9CoknDv4KCjNmDTsVQu8SVEV4npdpzS/i9lmU
	8RYQfwM1ZhFlhUtUZwbvYSdbz74SlLFRTvrIlxYwTLaFi2/5ezvNcbLz1hLO//N0LRJABkcNyUFbY
	Qef5u58eKSxOSmrqnLtJeTS+NWzMv/JtR+orIF5aUnye5e908pqXKdwf3Op+uT3jzGguPkfdweawy
	G/h4nIFMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTiwN-002AgK-Vn; Tue, 06 Apr 2021 10:28:12 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTiwB-002Ae2-Dq
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 10:28:01 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTiwA-0002ns-5f; Tue, 06 Apr 2021 12:27:58 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTiw8-00067j-Hr; Tue, 06 Apr 2021 12:27:56 +0200
Date: Tue, 6 Apr 2021 12:27:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3,PATCH 3/3] pwm: mtk_disp: implement .get_state()
Message-ID: <20210406102756.4kncasxe4um3q6wi@pengutronix.de>
References: <1617703062-4251-1-git-send-email-rex-bc.chen@mediatek.com>
 <1617703062-4251-4-git-send-email-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1617703062-4251-4-git-send-email-rex-bc.chen@mediatek.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_112800_090110_1CD096A1 
X-CRM114-Status: GOOD (  21.36  )
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
Content-Type: multipart/mixed; boundary="===============1029941867201912878=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1029941867201912878==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eichg6kffz2barkt"
Content-Disposition: inline


--eichg6kffz2barkt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 05:57:42PM +0800, Rex-BC Chen wrote:
> implement get_state function for pwm-mtk-disp
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Ideally you S-o-b line is the last one to show the order in which this
patch went from one person to another.

> ---
>  drivers/pwm/pwm-mtk-disp.c | 46 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>=20
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index 502228adf718..166e0a8ca703 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -179,8 +179,54 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  	return mtk_disp_pwm_enable(chip, state);
>  }
> =20
> +static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
> +				   struct pwm_device *pwm,
> +				   struct pwm_state *state)
> +{
> +	struct mtk_disp_pwm *mdp =3D to_mtk_disp_pwm(chip);
> +	u32 clk_div, period, high_width, con0, con1;
> +	u64 rate;
> +	int err;
> +
> +	err =3D clk_prepare_enable(mdp->clk_main);
> +	if (err < 0) {
> +		dev_err(chip->dev, "Can't enable mdp->clk_main: %d\n", err);
> +		return;
> +	}
> +	err =3D clk_prepare_enable(mdp->clk_mm);
> +	if (err < 0) {
> +		dev_err(chip->dev, "Can't enable mdp->clk_mm: %d\n", err);
> +		clk_disable_unprepare(mdp->clk_main);

As before: %pe please

> +		return;
> +	}
> +
> +	rate =3D clk_get_rate(mdp->clk_main);
> +
> +	con0 =3D readl(mdp->base + mdp->data->con0);
> +	con1 =3D readl(mdp->base + mdp->data->con1);
> +
> +	state->polarity =3D con0 & PWM_POLARITY ?
> +			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
> +	state->enabled =3D !!(con0 & BIT(0));
> +
> +	clk_div =3D (con0 & PWM_CLKDIV_MASK) >> PWM_CLKDIV_SHIFT;
> +	period =3D con1 & PWM_PERIOD_MASK;
> +	state->period =3D div_u64(period * (clk_div + 1) * NSEC_PER_SEC, rate);
> +	high_width =3D (con1 & PWM_HIGH_WIDTH_MASK) >> PWM_HIGH_WIDTH_SHIFT;
> +	state->duty_cycle =3D div_u64(high_width * (clk_div + 1) * NSEC_PER_SEC,
> +				    rate);

Please round up these divisions as in .apply() we're rounding down.
Otherwise .get_state isn't the inverse of .apply().

> +
> +	if (!state->enabled) {
> +		clk_disable_unprepare(mdp->clk_mm);
> +		clk_disable_unprepare(mdp->clk_main);

That's wrong, you enabled unconditionally so you should also disable
unconditionally. If you want to prevent that clocks of a running PWM are
disabled by the unused clk initcall, this must be done in .probe() to be
sure it runs exactly once and early enough.

> +	}
> +
> +	mdp->enabled =3D state->enabled;
> +}
> +

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eichg6kffz2barkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmBsN6kACgkQwfwUeK3K
7AnpNAgAkHZIGVIaSqr9lX1ELsrzBs42O38490Pfd9MJvOiE1EC68i0G1lwCWRe5
SVbLAlBPfUETiY0Pey+3xwEckasrHNF7+nO5I5rHn/iqZ4whdT1f6AqDpdFKAaY7
rwPPXRIY5qNYVUfiq123YbEnL98Bpka5XtWROr5FsIvHppdWFQvj+adAtedFr3PS
wv0pPZjhRdRK98swnnBDHxcYVMJfWKumMwKZJ7Sm4E1EsUqBwWfkZIdHMWUQCxhX
OXJjp/vpSdZ7/LlsO4ZbM/sJXIneQxzCTjboHGEiqPqsNP5/d/7U2E9Ntqjjr7Hw
uOLGTrTyyZJIwQ9U41u+AmTxJId86w==
=41WR
-----END PGP SIGNATURE-----

--eichg6kffz2barkt--


--===============1029941867201912878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1029941867201912878==--

