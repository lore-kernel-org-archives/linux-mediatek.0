Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ED5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJ7z0vGf7KbEIudEAK3d6ZHCpBVA5MwJF5MhoVnyOps=; b=zHf00chRcvCDtoGPj3ElmA3aL4
	0TgHbTGh5AjBJQYl0PLDShQirPKPzonb7VwlVxAPVTipU9nF45GLfM3VgYN6Av32ttj2GSfJtmnuG
	eIFFPYOO/CDqR/IldAnMIvB2/3cvNq2MB1MnGfbVryH4aY3jewM1WVGDwGBSdJNlVN6Q7EVQWe403
	nAhTcDNez/zPQUcChTgN7sscpucgGqKBNreLVWyEf6xWA5xJdIxG+8KroJc47NElt1nEjUlsNO5oH
	vG9RUw0sgfopjja8r+bCfZYkyW1O5icm6SWnAdlWlwd+YkGUR7xHD7a2DK7xwlqujivgt66SK326t
	/rbFNzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbj4-00FU1g-9y; Mon, 14 Feb 2022 13:49:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbit-00FTzC-HQ
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 13:49:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbim-0005aS-7f; Mon, 14 Feb 2022 14:48:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbil-00GYdt-SZ; Mon, 14 Feb 2022 14:48:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbik-0038Ma-HE; Mon, 14 Feb 2022 14:48:50 +0100
Date: Mon, 14 Feb 2022 14:48:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/2] pwm: pwm-mediatek: Simplify error handling with
 dev_err_probe()
Message-ID: <20220214134850.aqmd7wjxjsjyuwz7@pengutronix.de>
References: <20220214113038.79130-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220214113038.79130-1-angelogioacchino.delregno@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_054859_589187_9F66955B 
X-CRM114-Status: GOOD (  18.19  )
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
Content-Type: multipart/mixed; boundary="===============7624107110448465662=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7624107110448465662==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6nlrjmjngwerlej6"
Content-Disposition: inline


--6nlrjmjngwerlej6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 12:30:37PM +0100, AngeloGioacchino Del Regno wrote:
> Use dev_err_probe() to simplify handling errors in pwm_mediatek_probe().
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/pwm/pwm-mediatek.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index 0d4dd80e9f07..c7d5ca09a684 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -227,18 +227,14 @@ static int pwm_mediatek_probe(struct platform_devic=
e *pdev)
>  		return -ENOMEM;
> =20
>  	pc->clk_top =3D devm_clk_get(&pdev->dev, "top");
> -	if (IS_ERR(pc->clk_top)) {
> -		dev_err(&pdev->dev, "clock: top fail: %ld\n",
> -			PTR_ERR(pc->clk_top));
> -		return PTR_ERR(pc->clk_top);
> -	}
> +	if (IS_ERR(pc->clk_top))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_top),
> +				     "clock: top failed\n");

The change looks straight forward. I wonder if we should improve the
error message on this occasion. E.g.

	"Failed to get top clock\n"

? Ditto below.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6nlrjmjngwerlej6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKXb8ACgkQwfwUeK3K
7Aliqwf/XuM5oenKJm6jXphWn2Qtm3C59pE9WKUd6icfLW3luXqPk/EmMDSVH8SP
t2zQLHAjrm5IyFhyBzG/1z3/fkU8zCW8XyzxDWnuq95Djn0tE4WS8K1sfcnkz1r4
icA07XD2y3MQ04KtcO0v+GovSJkwDGoAA1zCFi/7o5GeMIdmdeOCBvK8wlLH1dgW
tOqYCH2CRGueyxg7VjUoiJT1F1o/gI1tA7dNI4r47xfYkqWYazR2oTl0vLoBUw9M
m4QLYq8FGN5xq6JfWcXeJgUQw9Y9G/9+yraFi761ZSR9YThR3qFR4hRX/JneVBp4
J8oPUKwWfDi7zmRSLS7NUVorW1ZWWw==
=qf+h
-----END PGP SIGNATURE-----

--6nlrjmjngwerlej6--


--===============7624107110448465662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7624107110448465662==--

