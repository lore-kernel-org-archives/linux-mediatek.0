Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B38AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 07:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLlVJYSesawHpWOC4SjqS8aCO6Jae1ReIvAIs4oEvx0=; b=ZcVOlQTCfqqA10gKWLDcTsu6YM
	hGrpp7lknfGk/ub7GJKsaoi5ZWTZQ8Y2t4dlljAfjsqXLH0Ks5maIjc2GZB8/qGwCbasTMkEKD9Fs
	wN2FPOMzTQT7pCZ7rGCTWtRSgVk/hfgia6wbsMXdIJ1pkk2VejX7Rm1UUOqD9tC3mzv/0vF32TCbK
	BIWwhK7cQv4AClrcm2C5x3SxzuzIVXcQRpg5qgKPeoPrxbL54jLnks+N9dCKubhVrYcN4KGU34u5X
	/usTwe9wD8zkOVZzwqULe2Rf5iC5Jy8USkOWr2WOzFsuVC0w3K4PeYJRcDzyYBMw39gj6J5diJFJA
	cJ/ma85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol3NE-00G9DA-7b; Wed, 19 Oct 2022 07:20:20 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol3N9-00G93D-Vv
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 07:20:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ol3Ms-0003Jb-10; Wed, 19 Oct 2022 09:19:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ol3Mp-0003wC-Hu; Wed, 19 Oct 2022 09:19:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ol3Mo-00915M-S1; Wed, 19 Oct 2022 09:19:54 +0200
Date: Wed, 19 Oct 2022 09:19:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, matthias.bgg@gmail.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3] pwm: mtk-disp: Fix the parameters calculated by the
 enabled flag of disp_pwm
Message-ID: <20221019071954.qv67h3brj6vnhxpw@pengutronix.de>
References: <1664447209-19417-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jj2msqu4zaqgjq6h"
Content-Disposition: inline
In-Reply-To: <1664447209-19417-1-git-send-email-xinlei.lee@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_002016_053987_5A22854C 
X-CRM114-Status: GOOD (  15.41  )
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


--jj2msqu4zaqgjq6h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Sep 29, 2022 at 06:26:49PM +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
>=20
> In the original mtk_disp_pwm_get_state() function, the result of reading
> con0 & BIT(0) is enabled as disp_pwm.
> In order to conform to the register table, we should use the disp_pwm
> base address as the enabled judgment.

I assume the change is fine. However I don't understand the commit log.
My guess is you mean:

	mtk_disp_pwm_get_state() wrongly uses bit 0 of CON0 to judge if the
	PWM is enabled. However that is indicated by a bit (at a machine
	dependent position) in the DISP_PWM_EN register. Fix this
	accordingly.

> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
>=20
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>

Nitpick: There is no empty line between Fixes: and S-o-b.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jj2msqu4zaqgjq6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNPpRcACgkQwfwUeK3K
7Amduwf7BvhwtNcAt4vuj9gzQ+s/NYxV/0QuR4vGcO6h4hfcHNuWqbVpQGG9pqCW
VnfbrDK2FJOvBAJaQt9n0sqOIkaYpml4m5MiTlFNIgg1fsPaNn1MmQ020iGaFl00
rbHXRjP/bzv95awJ0zBSircbNOJnKJMugspqSA5b6CRPv8vMm/yvJdMfqd6RSwTY
YJltkzqvoTip8ri837u8CQGQVNkPdChwScJQidAXkZeX3p53NQIUkcmhi4MoR6hr
dFe7FGm9v0YuEayovq5fsQjw7DVq4FCuEUhb6yiInlLG9cfK5/Rnsswb3tBa2Yof
RjLCMovkK7mZnvZz3AezADVH0/Kh4Q==
=aM7U
-----END PGP SIGNATURE-----

--jj2msqu4zaqgjq6h--

