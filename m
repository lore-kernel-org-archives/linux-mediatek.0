Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440DAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 09:18:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04695610E8
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 09:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04695610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wsf5a5+BXpLsNaYLa5Aq6fBb82qihusfAAVCVs2NiAY=; b=i2zFuJHeqRRty+pz/SOnQwZ9bv
	6zyT7PSHlwBam0nD17sXdrfuna/hSXQDdYGbL2fJUN0bMGCTK+sHNPLEzQmbEqrToLEd3fd31ARg6
	Mz2RwzrPoiRTIWisWNboX1n+L3Yk1KQt8kQk9JhAwUZfaig94Il6ZOCt31UimLrusMH1MK29SUodH
	amlJQS5M2lKULaj4OVKz4z1bzn3ypt7RKiEcGHDw8TFbpAu3QqGOt8F2BT6SPIWZe3JE5MRYpW+5V
	q0iU7rFxWcWhR3kN3G5g9jzgX/4By9uouvOkdcAJIXREfzlcY9itNy4T/OlB/ZAfDFRMOCU8tGMxs
	CS4CrUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNXEq-00387R-Cz; Tue, 07 Sep 2021 09:17:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNXEd-00385m-Qb
 for linux-mediatek@lists.infradead.org; Tue, 07 Sep 2021 09:17:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mNXEW-0006lE-UY; Tue, 07 Sep 2021 11:17:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mNXEV-0000Jc-Nq; Tue, 07 Sep 2021 11:17:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mNXEV-0007Nv-MV; Tue, 07 Sep 2021 11:17:35 +0200
Date: Tue, 7 Sep 2021 11:17:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: zhaoxiao <long870912@gmail.com>
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: Simplify using devm_pwmchip_add()
Message-ID: <20210907091735.wfuevpu5a6k4pmlj@pengutronix.de>
References: <20210906093030.459-1-long870912@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210906093030.459-1-long870912@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_021743_912240_AEEE94A0 
X-CRM114-Status: GOOD (  23.39  )
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
Content-Type: multipart/mixed; boundary="===============1878060713775945453=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1878060713775945453==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cicayrwrycvrz3k2"
Content-Disposition: inline


--cicayrwrycvrz3k2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 06, 2021 at 05:30:30PM +0800, zhaoxiao wrote:
> With devm_pwmchip_add() we can drop pwmchip_remove() from the device
> remove callback. The latter can then go away, too and as this is the
> only user of platform_get_drvdata(), the respective call to
> platform_set_drvdata() can go, too.
>=20
> Signed-off-by: zhaoxiao <long870912@gmail.com>
> ---
>  drivers/pwm/pwm-mediatek.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index b4a31060bcd7..0d4dd80e9f07 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -253,13 +253,11 @@ static int pwm_mediatek_probe(struct platform_devic=
e *pdev)
>  		}
>  	}
> =20
> -	platform_set_drvdata(pdev, pc);
> -
>  	pc->chip.dev =3D &pdev->dev;
>  	pc->chip.ops =3D &pwm_mediatek_ops;
>  	pc->chip.npwm =3D pc->soc->num_pwms;
> =20
> -	ret =3D pwmchip_add(&pc->chip);
> +	ret =3D devm_pwmchip_add(&pdev->dev, &pc->chip);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
>  		return ret;
> @@ -268,13 +266,6 @@ static int pwm_mediatek_probe(struct platform_device=
 *pdev)
>  	return 0;
>  }
> =20
> -static int pwm_mediatek_remove(struct platform_device *pdev)
> -{
> -	struct pwm_mediatek_chip *pc =3D platform_get_drvdata(pdev);
> -
> -	return pwmchip_remove(&pc->chip);
> -}
> -
>  static const struct pwm_mediatek_of_data mt2712_pwm_data =3D {
>  	.num_pwms =3D 8,
>  	.pwm45_fixup =3D false,
> @@ -335,7 +326,6 @@ static struct platform_driver pwm_mediatek_driver =3D=
 {
>  		.of_match_table =3D pwm_mediatek_of_match,
>  	},
>  	.probe =3D pwm_mediatek_probe,
> -	.remove =3D pwm_mediatek_remove,
>  };
>  module_platform_driver(pwm_mediatek_driver);

A patch like this is already in next, see e0150252a6437d12de3db84bb3af12bd5=
aa5cc70

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cicayrwrycvrz3k2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmE3LikACgkQwfwUeK3K
7AlE7Qf/Tlhd8lMXs//42d4oe2KisvZ+Hczlcm2gPRICv/V2NfQ2B8PHnsG/I74z
AZg8qckIiVoO+WfmYbJWT/W3vVFoZVfXsWIUwaLh8K4N5nNGId2rpAjuN+igSUQW
9PGBVKv69EAZKfjLkZj+IF5ZQWK/bmlIWk7U8btau8/C0c/VAZTRQAbTybLx5ocr
iYsnzyIKbBlujEq6pJgGIQXvD0WAeKW2uTf4LH1Ua+GUJkbfMnuDgdZ+/Q/BAy6g
q377k+Z0pLC8hC+lSn4LZA+VnuYTV0TyNIOz5Fo1WeYRhR2zvbCvVsDn4Ki8EIGR
IEUObIQ5ov52yHmVc8qbpHCY/2nmvQ==
=lWLd
-----END PGP SIGNATURE-----

--cicayrwrycvrz3k2--


--===============1878060713775945453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1878060713775945453==--

