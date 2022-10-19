Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ECCC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 13:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEg0zeKY8D5FgVbk0yVTTdY/P3yv8VsQsAXRhN/jkxE=; b=zBloqhu5PDzOEa5d3NKMVqRBpg
	Qho6bmBsAfeSv8TcflOB/SJJiFlYFZ1Vi+/XrT5QMSMhBFC6YKMNvw5Jvl2ndyJyvpNpRV1JI38Cs
	uGLjTlGnSW7TI6bey3UAAMnLcgXuYtVFnlUdIRLoggu6kfc+3Yn90RiPBrpfYyBjrQl3o6UcIUyPn
	N9/YgGbiflW2RTRC7pTh+d9hDN24qGa4tiCZIMegczb7kaecaCgFVQ37Z97fBXg+7+vtj0BrIGSgF
	dAgs9C4B17FdEXt0MC19wQR4i0xaAXFqAgX2pex3m7nMQFN4is3JUD/X5OAna4Q7JGuKeguZuARUr
	SvDVDsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rp-00246y-Cc; Wed, 19 Oct 2022 13:12:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rc-0023wE-Bn
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 13:12:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ol8ra-0005Jo-Df; Wed, 19 Oct 2022 15:12:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ol8rV-0007lp-EF; Wed, 19 Oct 2022 15:11:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ol8rU-009585-KG; Wed, 19 Oct 2022 15:11:56 +0200
Date: Wed, 19 Oct 2022 15:11:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: xinlei.lee@mediatek.com
Cc: thierry.reding@gmail.com, matthias.bgg@gmail.com,
	jitao.shi@mediatek.com, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4] pwm: mtk-disp: Fix the parameters calculated by the
 enabled flag of disp_pwm
Message-ID: <20221019131155.52d2yr34f6zapz5d@pengutronix.de>
References: <1666172538-11652-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xhy4bguvzu5lob7d"
Content-Disposition: inline
In-Reply-To: <1666172538-11652-1-git-send-email-xinlei.lee@mediatek.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_061204_422709_2DC80AC3 
X-CRM114-Status: GOOD (  13.17  )
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


--xhy4bguvzu5lob7d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 05:42:18PM +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
>=20
> In the original mtk_disp_pwm_get_state() function wrongly uses bit 0 of
> CON0 to judge if the PWM is enabled.
> However that is indicated by a bit (at a machine dependent position) in
> the DISP_PWM_EN register. Fix this accordingly.
>=20
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>

Nice commit log text :-)

This now matches the bit that the .apply() callback sets, so looks
right.

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xhy4bguvzu5lob7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNP95YACgkQwfwUeK3K
7AnmNgf/R5fc4bTc7jwlwiPYCqu6y2+9CwYzDaBQRKTTm07Wn728qFUCf+/PMfDh
xMoThPYZRd8iLccDFydMRHavS82UrvIvMAKkh3Utf0j9luEriB3mOZCEw4PkkZ90
xoAj7F0avheWNPHDwapjS45TMfVOSwIDHaAxA9y9irVZmCt50ICb2SDAakk+nB8j
4d4MnpUv/N9uYGEKK2iLrH3pNpcdkq9EX4/6JC324ok7c17blRNG73RJzfFAJLYx
qzSXyi3BqRnCo1FUHDMbM/x79jR6gR9jMKju/+Dw1y9jEIK13//2PxmhrsatUGQv
R6OtXDe92i4kXdVbwHR2BKZl/xYWDQ==
=JPEN
-----END PGP SIGNATURE-----

--xhy4bguvzu5lob7d--

