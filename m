Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3091ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 00:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QULI5car8SQ6bRIG/YEmuxYrIdy+ZLNzPp1OUzSJvlE=; b=R+dMKfanEKnU+clPsFZEDU9uet
	AGQZYQSCds77UBGay9SoESpS7rBR9wH6mENfB81F0qngK3auzPwBrQnl5dOLqkyT04pGqrl1jP06x
	YthEEfZKZlcdswa1tE5yNddUjPZlsYv0Nq/+Qd+WtGaueh7HXBhqJfK6Nqm/ZYCu3hlgiRmJy6ims
	qiZzWI6KM6rHY7enkwQE7tIDzklhbbnkeb1bTopnTIqWeJh07FIAXidbjQ1qcw5SE54cxqjObHX+F
	jnQ0lCM4u2oALmNv/+BNvfdz8BSMWDA7Ydv5/xS32pzO+F2cNkuXq4uEvqWi3z3yu8Ri8guCGogwX
	yd/ZRpUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opelz-00GqzZ-TD; Tue, 01 Nov 2022 00:04:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opelp-00GqyK-01; Tue, 01 Nov 2022 00:04:46 +0000
Received: from mercury (unknown [185.209.196.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B65766015AC;
	Tue,  1 Nov 2022 00:04:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667261081;
	bh=GJXPC4Tp+MoQiGSwNLFc+YOVd5slpPRDx22xYNSXWP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GePL/uIRZThj291Kv6goIGMVdlQhEMMvxre0ClMjIjjeOoNhvDYnJU/CGUeFEUzyi
	 0gcALsqyIJ3Fz2vP1UvHamsO+z/Q/HKdWgqNnDwNP6UD17CwZtY8VrZ99aYV8U/Put
	 lf93GF94JRxR74jUxQjxJHuAV30EwJY13AfkHmsulTDyRd1rHJ0HHhKo1N1d8mP6QP
	 jkerQPv9+FL5E/DV3T1okZJZvX2GukLvIT1V8v0AvoaWRU7OJ6L7S5aKHVYMgA6JLe
	 Dr+Vz2G1GG+IYStCM9YpxrJcSJj/FG+QiwJoTeO/cWE3fNyOK1K+MOJ+ftBLh+koQE
	 2LNUTne5upY7w==
Received: by mercury (Postfix, from userid 1000)
	id 4BC8D1061C6F; Tue,  1 Nov 2022 01:04:38 +0100 (CET)
Date: Tue, 1 Nov 2022 01:04:38 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: mt6360: Use LINEAR_RANGE_IDX()
Message-ID: <20221101000438.yfqhkvdplbbylp67@mercury.elektranox.org>
References: <2c6267efae04a3f64d88baf2e34ea309af438d40.1667208242.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="begqrocyqlrn62m2"
Content-Disposition: inline
In-Reply-To: <2c6267efae04a3f64d88baf2e34ea309af438d40.1667208242.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_170445_202617_B27FED03 
X-CRM114-Status: GOOD (  20.40  )
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


--begqrocyqlrn62m2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 31, 2022 at 11:25:00AM +0200, Matti Vaittinen wrote:
> Do minor clean-up by using the newly inroduced LINEAR_RANGE_IDX()
> initialization macro.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> ---
> Sorry, this one evaded my original grep so sending an individual patch.
> Would've squashed this with bd99954 one if I spotted it right away.
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/supply/mt6360_charger.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply=
/mt6360_charger.c
> index 3abaa72e0668..92e48e3a4853 100644
> --- a/drivers/power/supply/mt6360_charger.c
> +++ b/drivers/power/supply/mt6360_charger.c
> @@ -113,16 +113,13 @@ enum {
>  	MT6360_RANGE_MAX,
>  };
> =20
> -#define MT6360_LINEAR_RANGE(idx, _min, _min_sel, _max_sel, _step) \
> -	[idx] =3D REGULATOR_LINEAR_RANGE(_min, _min_sel, _max_sel, _step)
> -
>  static const struct linear_range mt6360_chg_range[MT6360_RANGE_MAX] =3D {
> -	MT6360_LINEAR_RANGE(MT6360_RANGE_VMIVR, 3900000, 0, 0x5F, 100000),
> -	MT6360_LINEAR_RANGE(MT6360_RANGE_ICHG, 100000, 0, 0x31, 100000),
> -	MT6360_LINEAR_RANGE(MT6360_RANGE_VOREG, 3900000, 0, 0x51, 10000),
> -	MT6360_LINEAR_RANGE(MT6360_RANGE_AICR, 100000, 0, 0x3F, 50000),
> -	MT6360_LINEAR_RANGE(MT6360_RANGE_IPREC, 100000, 0, 0x0F, 50000),
> -	MT6360_LINEAR_RANGE(MT6360_RANGE_IEOC, 100000, 0, 0x0F, 50000),
> +	LINEAR_RANGE_IDX(MT6360_RANGE_VMIVR, 3900000, 0, 0x5F, 100000),
> +	LINEAR_RANGE_IDX(MT6360_RANGE_ICHG, 100000, 0, 0x31, 100000),
> +	LINEAR_RANGE_IDX(MT6360_RANGE_VOREG, 3900000, 0, 0x51, 10000),
> +	LINEAR_RANGE_IDX(MT6360_RANGE_AICR, 100000, 0, 0x3F, 50000),
> +	LINEAR_RANGE_IDX(MT6360_RANGE_IPREC, 100000, 0, 0x0F, 50000),
> +	LINEAR_RANGE_IDX(MT6360_RANGE_IEOC, 100000, 0, 0x0F, 50000),
>  };
> =20
>  struct mt6360_chg_info {
> --=20
> 2.37.3
>=20
>=20
> --=20
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>=20
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =3D]=20



--begqrocyqlrn62m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmNgYpUACgkQ2O7X88g7
+ppvhw/9HhHEJFlLPw/VXTLlqn8FyQy11CMGL3NEmgdQg9B07eFCUHyOG1rp8igg
yS4Kdfadh7UYUnUlHgsKqw8M+7vKdDlWGQobgDBpFWettX5gBzf00rXFsv7C8AXP
ZrzTbGeNkGIg305kmmo9dFwNsocW9PfDxjXYtVVDIX2YwVS6NkzOTGVSOE4P3zaz
PIEzeyaucVrJRHCQTPZ7DDdFEN+wvxPBLcCwAoZ6QjTh3LAlnzi52Yd+jzXdHEgS
QUIh96yyueneWYhDTBA2jCkHcMFwDHlqGF0icuLvSTKcm9zf/p/MNhVHoZuvPq36
pj6Q8SYj76+JSahQQ0zcyaIQWtACAoXU9BWKrIaxyEkpoTqmLusOjhHDRo4l/Wye
Jm1Zz83eCRxfFQjpGLbtuM4XyxChwcKpr1uu8ykyGqWoiHAjK2Z+WWIaPviBTpdG
vcdOZWvmLJboM2XmZPo9gpJOgyRDxrRLh1wid0CHZd2BFldmT9wn/kV+vf67Rglw
QVZOTas+Xwab6yGha6yP8ZLCIgTS8FmCuD2hqANQ+zWkgnDPHYdxiSLmfRWSLnST
SE4gM+5BPugVS28fmwKnTRyM5pm9eRqK+LAFSuD1ey+ZXPBvWbbSX2K9+Nk3ejcu
UD2qIzvfI1rTbEmGgW4t1hu+nPR4kTYrV4QZsN+4XqFMA86nz+A=
=jARa
-----END PGP SIGNATURE-----

--begqrocyqlrn62m2--

