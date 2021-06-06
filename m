Return-Path: <SRS0=RWvT=LA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3A8C4743E
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jun 2021 21:23:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0206138C
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jun 2021 21:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0206138C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfQz0gV/hrjFIubCFaIifuqzwnMB2MefpzomPnDIr+g=; b=YbqX2RUrVmgxh7EcczxdDFli0d
	ew2ssXjtwuLRc5ffWCl3xlcilNKuFv0BmR+e8QJl88P4NdWGqCkqNVYaL2mUHiiKAEOI1KqSGsRdp
	+wylZjAqXEWYDyycvT+CBgY6zwZ+2b0iWYzAQPAKq694oJjzxfV5zlhTmsHxnifsVnKgOe8Jxk77e
	seec2Oun5lsOx37wwQ06SG2ynajYXhQSBFX9laqL9vXVWcTfH8EhMgmUtlOrjsJLjElc7zwvVa08d
	PD1Hnj6ohexzdFoY8/p0a9UDpWVXpPj7o9OQX/ogevBJeWbhKoJbg15wx4Ktg/xtxH20ZHtSqQ9On
	/IerA39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq0Eg-000q0J-1Q; Sun, 06 Jun 2021 21:23:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq0Ec-000pzH-QL
 for linux-mediatek@lists.infradead.org; Sun, 06 Jun 2021 21:23:08 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lq0Ea-0003hT-Qp; Sun, 06 Jun 2021 23:23:04 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lq0EX-000516-Vw; Sun, 06 Jun 2021 23:23:01 +0200
Date: Sun, 6 Jun 2021 23:22:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, cawa.cheng@mediatek.com,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, stonea168@163.com,
 huijuan.xie@mediatek.com
Subject: Re: [PATCH v4 3/3] pwm: mtk-disp: Switch to atomic API
Message-ID: <20210606212258.coki62b5vl7iaiyd@pengutronix.de>
References: <20210603100531.161901-1-jitao.shi@mediatek.com>
 <20210603100531.161901-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210603100531.161901-4-jitao.shi@mediatek.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_142306_908108_D6D0915B 
X-CRM114-Status: GOOD (  24.87  )
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
Content-Type: multipart/mixed; boundary="===============7209832766524828238=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7209832766524828238==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="przpmhvmw72tg2dd"
Content-Disposition: inline


--przpmhvmw72tg2dd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jun 03, 2021 at 06:05:31PM +0800, Jitao Shi wrote:
> Convert the legacy api to atomic API.
>=20
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 78 ++++++++++++++++++++++++++++----------
>  1 file changed, 59 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index b87b3c00a685..d77348d0527c 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -67,8 +67,8 @@ static void mtk_disp_pwm_update_bits(struct mtk_disp_pw=
m *mdp, u32 offset,
>  	writel(value, address);
>  }
> =20
> -static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device =
*pwm,
> -			       int duty_ns, int period_ns)
> +static int mtk_disp_pwm_config(struct pwm_chip *chip,
> +			       const struct pwm_state *state)
>  {
>  	struct mtk_disp_pwm *mdp =3D to_mtk_disp_pwm(chip);
>  	u32 clk_div, period, high_width, value;
> @@ -102,7 +102,7 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>  	 * high_width =3D (PWM_CLK_RATE * duty_ns) / (10^9 * (clk_div + 1))
>  	 */
>  	rate =3D clk_get_rate(mdp->clk_main);
> -	clk_div =3D div_u64(rate * period_ns, NSEC_PER_SEC) >>
> +	clk_div =3D div_u64(rate * state->period, NSEC_PER_SEC) >>
>  			  PWM_PERIOD_BIT_WIDTH;
>  	if (clk_div > PWM_CLKDIV_MAX) {
>  		dev_err(chip->dev, "clock rate is too high: rate =3D %d Hz\n",
> @@ -114,11 +114,11 @@ static int mtk_disp_pwm_config(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>  		return -EINVAL;
>  	}
>  	div =3D NSEC_PER_SEC * (clk_div + 1);
> -	period =3D div64_u64(rate * period_ns, div);
> +	period =3D div64_u64(rate * state->period, div);
>  	if (period > 0)
>  		period--;
> =20
> -	high_width =3D div64_u64(rate * duty_ns, div);
> +	high_width =3D div64_u64(rate * state->duty_cycle, div);
>  	value =3D period | (high_width << PWM_HIGH_WIDTH_SHIFT);
> =20
>  	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
> @@ -144,39 +144,79 @@ static int mtk_disp_pwm_config(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>  					 mdp->data->con0_sel);
>  	}
> =20
> +	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
> +				 mdp->data->enable_mask);
> +	mdp->enabled =3D true;
> +
>  	return 0;
>  }
> =20
> -static int mtk_disp_pwm_enable(struct pwm_chip *chip, struct pwm_device =
*pwm)
> +static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *=
pwm,
> +			      const struct pwm_state *state)
>  {
>  	struct mtk_disp_pwm *mdp =3D to_mtk_disp_pwm(chip);
> -	int err;
> =20
> -	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
> -				 mdp->data->enable_mask);
> -	mdp->enabled =3D true;
> +	if (!state->enabled) {
> +		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
> +					 0x0);
> =20
> -	return 0;
> +		if (mdp->enabled) {
> +			clk_disable_unprepare(mdp->clk_mm);
> +			clk_disable_unprepare(mdp->clk_main);
> +		}
> +		mdp->enabled =3D false;
> +		return 0;
> +	}
> +
> +	return mtk_disp_pwm_config(chip, state);

Please unroll this function call. Having the old name is irritating.

>  }
> =20
> -static void mtk_disp_pwm_disable(struct pwm_chip *chip, struct pwm_devic=
e *pwm)
> +static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
> +				   struct pwm_device *pwm,
> +				   struct pwm_state *state)

Adding .get_state() is great and warrants a separate patch.

>  {
>  	struct mtk_disp_pwm *mdp =3D to_mtk_disp_pwm(chip);
> +	u32 clk_div, period, high_width, con0, con1;
> +	u64 rate;
> +	int err;
> =20
> -	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
> -				 0x0);
> +	if (!mdp->enabled) {
> +		err =3D clk_prepare_enable(mdp->clk_main);
> +		if (err < 0) {
> +			dev_err(chip->dev, "Can't enable mdp->clk_main: %d\n", err);
> +			return;
> +		}
> +		err =3D clk_prepare_enable(mdp->clk_mm);
> +		if (err < 0) {
> +			dev_err(chip->dev, "Can't enable mdp->clk_mm: %d\n", err);
> +			clk_disable_unprepare(mdp->clk_main);
> +			return;
> +		}
> +	}
> +
> +	rate =3D clk_get_rate(mdp->clk_main);
> =20
> -	if (mdp->enabled) {
> +	con0 =3D readl(mdp->base + mdp->data->con0);
> +	con1 =3D readl(mdp->base + mdp->data->con1);
> +
> +	state->enabled =3D !!(con0 & BIT(0));
> +
> +	clk_div =3D (con0 & PWM_CLKDIV_MASK) >> PWM_CLKDIV_SHIFT;

clk_div =3D FIELD_GET(PWM_CLKDIV_MASK, con0);

> +	period =3D con1 & PWM_PERIOD_MASK;
> +	state->period =3D div_u64(period * (clk_div + 1) * NSEC_PER_SEC, rate);

Can this multiplication overflow? Note this is a 32bit multiplication
only. As .apply() uses round-down in the divisions (which is good)
please round up there to get idempotency between .get_state() and
=2Eapply().

> +	high_width =3D (con1 & PWM_HIGH_WIDTH_MASK) >> PWM_HIGH_WIDTH_SHIFT;
> +	state->duty_cycle =3D div_u64(high_width * (clk_div + 1) * NSEC_PER_SEC,
> +				    rate);
> +
> +	if (!mdp->enabled) {
>  		clk_disable_unprepare(mdp->clk_mm);
>  		clk_disable_unprepare(mdp->clk_main);
>  	}
> -	mdp->enabled =3D false;
>  }

If my review comments contain too little details for you to understand,
please feel free to ask. I'm willing to explain in more detail.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--przpmhvmw72tg2dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmC9PK4ACgkQwfwUeK3K
7Ak6DQgAjfNYrYLdUjYDx08rDdM4o8ULtRVpqZGT9e/ZRBdfXt8dqv57cerwo5Gq
pOg+jjXsjx/pgt8kwwP/fKTnbl/yZYUwWIP/pwO0mOGRCGfvOX3SuPj9CgmR9U6b
3tDygrSlzcekbdHuDOfFZZvieQs3c/WAlFqlAKcZiyWN3SeO6tSjOI1MwUkR6pJl
/i6j+UTZQ1RKZFERv9YlZYbpJXSFZBMHRL5+xdS3R3e1wrK/D2js+FqlpFbfagAz
RUPM+4AWFpw5ZfyrYSFX9TW2mhjIh5SuoaZCRyCAoHBJzbG+pUne1LK4VNxxUPoI
M7IltmOgdefxGum8HhCDD7dFXce3+w==
=8ycI
-----END PGP SIGNATURE-----

--przpmhvmw72tg2dd--


--===============7209832766524828238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7209832766524828238==--

