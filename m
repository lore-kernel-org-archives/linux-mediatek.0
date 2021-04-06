Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117ADC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:20:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91538613BD
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 10:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91538613BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vymR2IvtxMBSxKfROj2riMJK2Vg0gFhKy8OTdUyjAAQ=; b=BcJB+4jHg08YVWJWotRlu9wTF
	eiWVkkrv0b684BvMValenGq/38Ia7HmmlECww0KqOUHp8GYc6493g31vCev6pmgDFMs/OEKmsbtDq
	RuosT3f42q3bXliEd/NSTBjb94RAQdWZ+U/1l0I5omicxJI61kYMGCDwfoE9p4VX9Tf8dGClgsngK
	ZfjgzbpW40cfwykncxySPH3TshsQbocwsFUboqm+RYGgTvABAqtafNimD8GxdYjrub/DRXjbdW/rK
	NmZYRAHph2musuyuVvPXFdG4mmhZEO1gpRbq8FAEUdDfjqgxwdo2z7F0jxjNKixtqWhgMq7SzJ1f5
	vWLBigBng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTioO-0029CE-RT; Tue, 06 Apr 2021 10:19:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTio7-00299g-Pv
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 10:19:41 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTio6-0001jX-Hh; Tue, 06 Apr 2021 12:19:38 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lTio4-0005iA-DU; Tue, 06 Apr 2021 12:19:36 +0200
Date: Tue, 6 Apr 2021 12:19:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3,PATCH 2/3] pwm: mtk_disp: convert the driver to atomic API
Message-ID: <20210406101936.uscvtvrd6opm5pgf@pengutronix.de>
References: <1617703062-4251-1-git-send-email-rex-bc.chen@mediatek.com>
 <1617703062-4251-3-git-send-email-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1617703062-4251-3-git-send-email-rex-bc.chen@mediatek.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_111939_976446_81532C72 
X-CRM114-Status: GOOD (  20.43  )
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
Content-Type: multipart/mixed; boundary="===============7711284697343678640=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7711284697343678640==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qrbjywyivatj7v7m"
Content-Disposition: inline


--qrbjywyivatj7v7m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 06, 2021 at 05:57:41PM +0800, Rex-BC Chen wrote:
> @@ -84,33 +86,47 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  	 * period =3D (PWM_CLK_RATE * period_ns) / (10^9 * (clk_div + 1)) - 1
>  	 * high_width =3D (PWM_CLK_RATE * duty_ns) / (10^9 * (clk_div + 1))
>  	 */
> +	if (!mdp->enabled) {
> +		err =3D clk_prepare_enable(mdp->clk_main);
> +		if (err < 0) {
> +			dev_err(chip->dev, "Can't enable mdp->clk_main: %d\n",
> +				err);

Please use %pe, as this yields better readable error messages.

Also it might be sensible to first use the fact that (without patch 1
=66rom this series) the clocks are always on and then rework the clk usage
in a separate patch.

> +			return err;
> +		}
> +		err =3D clk_prepare_enable(mdp->clk_mm);
> +		if (err < 0) {
> +			dev_err(chip->dev, "Can't enable mdp->clk_mm: %d\n",
> +				err);
> +			clk_disable_unprepare(mdp->clk_main);
> +			return err;
> +		}
> +	}
>  	rate =3D clk_get_rate(mdp->clk_main);
> -	clk_div =3D div_u64(rate * period_ns, NSEC_PER_SEC) >>
> +	clk_div =3D div_u64(rate * state->period, NSEC_PER_SEC) >>
>  			  PWM_PERIOD_BIT_WIDTH;

rate * state->period might overflow, it would be great if this could be
catched. (But I don't consider this a stopper for this series.)

> -	if (clk_div > PWM_CLKDIV_MAX)
> +	if (clk_div > PWM_CLKDIV_MAX) {
> +		dev_err(chip->dev, "clock rate is too high: rate =3D %d Hz\n",
> +			rate);

rate is an u64, %d isn't the right format for it. Doesn't this result in
a compiler warning?

> +		clk_disable_unprepare(mdp->clk_mm);
> +		clk_disable_unprepare(mdp->clk_main);
>  		return -EINVAL;
> -
> +	}
>  	div =3D NSEC_PER_SEC * (clk_div + 1);
> -	period =3D div64_u64(rate * period_ns, div);
> +	period =3D div64_u64(rate * state->period, div);
>  	if (period > 0)
>  		period--;
> =20
> -	high_width =3D div64_u64(rate * duty_ns, div);
> +	high_width =3D div64_u64(rate * state->duty_cycle, div);
>  	value =3D period | (high_width << PWM_HIGH_WIDTH_SHIFT);
> -
> -	err =3D clk_enable(mdp->clk_main);
> -	if (err < 0)
> -		return err;
> -
> -	err =3D clk_enable(mdp->clk_mm);
> -	if (err < 0) {
> -		clk_disable(mdp->clk_main);
> -		return err;
> -	}
> +	polarity =3D 0;
> +	if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
> +		polarity =3D PWM_POLARITY;

I'm unsure if support for polarity should be added en passant in this
patch. Maybe it would be clearer to add is separately.

>  	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
>  				 PWM_CLKDIV_MASK,
>  				 clk_div << PWM_CLKDIV_SHIFT);
> +	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
> +				 PWM_POLARITY, polarity);
>  	mtk_disp_pwm_update_bits(mdp, mdp->data->con1,
>  				 PWM_PERIOD_MASK | PWM_HIGH_WIDTH_MASK,
>  				 value);

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qrbjywyivatj7v7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmBsNbUACgkQwfwUeK3K
7Ak7fQf/XD3gpjbGn1v9+zAGRP2jQEV4pv4oZAXPh3XfOHQWHauvAoPO81WdA0le
NrkVkX3fWnhpWRWTs360jrPenNfhc95Svv8ARekaI7WKBo2o6e4wEXIPnv94hk5l
usjD5WN7JFRcF9AMSfaOZyeKHf1hJ5KNWZvUfDxfljLgarAQNVCDsmnQ+HDQXMiy
osb93UYzmq6X5sKVKkP6kKja9qkkjQVQ1ydfBZU1LL7sZSCsCNEU9BE/lCEP/Cug
uIRF7rzxgYCgDYQmB9g1N5MBwg75Ur9ZeZC2YU3h1L26im6avqmf+v8xpfcT9WVF
hqrXsXRAZZodkucekqCFb1LCLMBLXw==
=ROQI
-----END PGP SIGNATURE-----

--qrbjywyivatj7v7m--


--===============7711284697343678640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7711284697343678640==--

