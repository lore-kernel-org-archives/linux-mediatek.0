Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805F0C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 09:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0B3XTdCIkvOxTAmuP/2tDwYdmG/wWuSBW9oZOO9wqU8=; b=AzcYsOMf9mk613WApwanMeNLdy
	ZCyCaEnFXDRfJU/uv3EGYBcW8w44qOVYBVyCZHkfRMuhA6wSA+LlqrFeLfAPV0g87XjK+NxL+m8o7
	6uSZ2aW6nXG/KDcAMB51U2TnPz94m02HBlwLRJdXQgOj0ZeES9yut+ssB65DBX1+MKbX2A5Nr22Zn
	rw2bjWB9xpSs3BJ0jBL0HtlnTjlAH38pJIs7dGuSZpYOhYI4RJY1+n2U/3g3HONRZTPDSDlF6iaql
	BbFqo24NuKFAHul7jv2xzt+MrtbvkQybEk1IA0igQwu253Gj4eVmrcNeDbOnClhCojoxWNsq7WDUU
	k+cU/UlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY1rl-004smo-My; Tue, 13 Sep 2022 09:06:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY1rO-004sRV-U6
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 09:05:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oY1rE-0007zx-K3; Tue, 13 Sep 2022 11:05:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oY1rC-000SnT-KM; Tue, 13 Sep 2022 11:05:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oY1rA-000YSD-HX; Tue, 13 Sep 2022 11:05:24 +0200
Date: Tue, 13 Sep 2022 11:05:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, matthias.bgg@gmail.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] pwm: mtk-disp: Fix the parameters calculated  by the
 enabled flag of disp_pwm.
Message-ID: <20220913090521.6ybohvgbehua4rgv@pengutronix.de>
References: <1661745852-27323-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ss3zheu2y6khfn6n"
Content-Disposition: inline
In-Reply-To: <1661745852-27323-1-git-send-email-xinlei.lee@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_020539_273113_5682526B 
X-CRM114-Status: GOOD (  24.30  )
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


--ss3zheu2y6khfn6n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Aug 29, 2022 at 12:04:12PM +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
>=20
> In the original mtk_disp_pwm_get_state() function, the result of reading
> con0 & BIT(0) is enabled as disp_pwm.=20
> In order to conform to the register table, we should use the disp_pwm=20
> base address as the enabled judgment.

Do you want to say:

	The enable bit of the hardware is bit 0 of the DISP_PWM_EN
	register at offset 0 for all supported hardwares. Up to now the
	bit was wrongly assumed to be in the CON0 register.

?

> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
>=20

This newline is unusal.

> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
> Base on the branch of Linux-next/master.
> Split from series [1].
> [1] https://patchwork.kernel.org/project/linux-mediatek/cover/1661239875-=
19841-1-git-send-email-xinlei.lee@mediatek.com/
> ---
> ---
>  drivers/pwm/pwm-mtk-disp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index c605013..50425cd 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -197,7 +197,7 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *c=
hip,
>  	rate =3D clk_get_rate(mdp->clk_main);
>  	con0 =3D readl(mdp->base + mdp->data->con0);
>  	con1 =3D readl(mdp->base + mdp->data->con1);
> -	state->enabled =3D !!(con0 & BIT(0));
> +	state->enabled =3D !!(readl(mdp->base) & BIT(0));

I would expect this to better be:

	state->enabled =3D !!(readl(mdp->base + DISP_PWM_EN) & BIT(0));

which is the same for the compiler but a bit more descriptive for the
human reader.

>  	clk_div =3D FIELD_GET(PWM_CLKDIV_MASK, con0);
>  	period =3D FIELD_GET(PWM_PERIOD_MASK, con1);
>  	/*

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ss3zheu2y6khfn6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMgR84ACgkQwfwUeK3K
7AmsfQf/TlNRXjA19E2+0tCASjyiQWsjnKiN3D+nPd9q8hTxXDbGyQ5KOtZWuUDZ
+D4joVtIozL0FvlLaR/c745PZm3evjT1S4ZfjgMb+f1/ZSwAX3CyUR0DyRvLubMU
niChOnS0K063Q8RShrCG8qaphmlSrp82HNKfyjt5aT2dvHBKkNo90llkn4BI5h2G
p3t5fRn/OtbymDjCt7LsFtZqr5Fck5WiW7aTEkZrT5Wz6FQZ9TMbIgmC3X+wNenK
cbCPPBfFPDADycZjWaZk3HYfG7P2O1cB595u3i87XeuTIZVAZg9F483lA9z7s4MT
RecWGzcRbCOwRPgtwcI+jSK2WtP1jA==
=JSbz
-----END PGP SIGNATURE-----

--ss3zheu2y6khfn6n--

