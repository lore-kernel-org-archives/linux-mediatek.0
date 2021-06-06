Return-Path: <SRS0=RWvT=LA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D71C4743D
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jun 2021 21:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1978B61408
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jun 2021 21:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1978B61408
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwRvVqUFFgg6tuAibAPPOCIqx+LqeTxzcUaBmHDpfTM=; b=qrmF4jHGWjQgpvx5PPi1MpDyGC
	cYa2OMGG4Kg//tMzqLwRiJSCIpnFA/J6i0p9S4hHNDpT/Tn1wEn7gCjsvYgtNyUXTgsyzMsTwxKBg
	iOLFTu0tm6iurEMEmMmgomyh/eFzk+ZRSSWJ7I8ScXjaYYRBlzORM0ZQtZ64iGhP68EhYQkchrko5
	j7lWgzcLHpdTCdrDzLOVHmnvQ+E4r0VraOEQRpIurwuSSpO2SWfkz5Ff0WHMHnhlBRZDet2/iXdlt
	/1e6D4BU9nloY+aHy6Bt9yYyFTKXayjBZ34uZpTVggY5DDlWHb6vUZD4Fj3lDEhNbt/SyA+6HVJXa
	R4C8cfvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq072-000pEX-RN; Sun, 06 Jun 2021 21:15:16 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq06p-000pD5-7x
 for linux-mediatek@lists.infradead.org; Sun, 06 Jun 2021 21:15:04 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lq06n-0002yI-LA; Sun, 06 Jun 2021 23:15:01 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lq06m-0004j3-NR; Sun, 06 Jun 2021 23:15:00 +0200
Date: Sun, 6 Jun 2021 23:14:57 +0200
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
Subject: Re: [PATCH v4 2/3] pwm: mtk-disp: move the commit to clock enabled
Message-ID: <20210606211457.ya5nbp6fqevuhzwa@pengutronix.de>
References: <20210603100531.161901-1-jitao.shi@mediatek.com>
 <20210603100531.161901-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210603100531.161901-3-jitao.shi@mediatek.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_141503_293609_EA072D25 
X-CRM114-Status: GOOD (  23.83  )
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
Content-Type: multipart/mixed; boundary="===============5815723690065203555=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5815723690065203555==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jvjznihrdfdbgbae"
Content-Disposition: inline


--jvjznihrdfdbgbae
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 03, 2021 at 06:05:30PM +0800, Jitao Shi wrote:
> Due to the clock sequence changing, so move the reg commit to

Which change do you refer to, here? The previous patch? If so, I assume
this means the series is not bisectable because the driver is broken
when only the first patch is applied?

> config().
>=20
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/pwm/pwm-mtk-disp.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index b5771e2c54b8..b87b3c00a685 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -135,6 +135,13 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip=
, struct pwm_device *pwm,
>  		mtk_disp_pwm_update_bits(mdp, mdp->data->commit,
>  					 mdp->data->commit_mask,
>  					 0x0);
> +	} else {

You dropped the code comment? Is it wrong? Or is it too obvious to be
mentioned?

> +		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
> +					 mdp->data->bls_debug_mask,
> +					 mdp->data->bls_debug_mask);
> +		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
> +					 mdp->data->con0_sel,
> +					 mdp->data->con0_sel);
>  	}
> =20
>  	return 0;
> @@ -208,19 +215,6 @@ static int mtk_disp_pwm_probe(struct platform_device=
 *pdev)
> =20
>  	platform_set_drvdata(pdev, mdp);
> =20
> -	/*
> -	 * For MT2701, disable double buffer before writing register
> -	 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
> -	 */
> -	if (!mdp->data->has_commit) {
> -		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
> -					 mdp->data->bls_debug_mask,
> -					 mdp->data->bls_debug_mask);
> -		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
> -					 mdp->data->con0_sel,
> -					 mdp->data->con0_sel);
> -	}
> -
>  	return 0;
>  }

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jvjznihrdfdbgbae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmC9Os0ACgkQwfwUeK3K
7AknMQf/dO4dXSwiikRqYQNqvIbdInbSpYBnrau2T9MOiN5AH/QMduQ+nantgN2k
A1gLIo3VUq0ZaNJXHD6U87VNc35H+95g9u+GJBnDej1Lp1EbLxnUHKJVT4b5XLni
/CuVEtZ6bJJeIn26hTgVDUlBpbxRQ8MUPYFtRprds+yFlGD6Nc3Ilm9WcjoOg9iK
WWHH3XVs4i87mdsCj6E0bQKN5VjZv8xOkchs5FUS05L4/gCuAZ6gDJ+LeiFb8bIB
OtL5QYI8NtHWJGdnM+uuQcbCVVv9g+KNEV4lFLJi45Ev8SNDU60zWJRcyXJ5+brO
5lzwP8YivZt8H14qmTg/ojo/FhZoOw==
=6tuB
-----END PGP SIGNATURE-----

--jvjznihrdfdbgbae--


--===============5815723690065203555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5815723690065203555==--

