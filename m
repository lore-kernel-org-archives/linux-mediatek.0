Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B84C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm0cylrAcXnm7eKQqx0GuLW4XzLpyFuEodiMDdb36zQ=; b=jrCJsEUlKKmuOfYiOjR5tztQJV
	pX4HsiPjj9AuIi2hkg2a7gomXJMvA52kNMb7VKrJIXmheTw3PHaCjjYid3QEezx+MReKBdyFBHNlk
	GUzxBfduUxJ5EY0+nVyvUYEWjrDq6Wvqzger0aANJjUGUFYgZUsAFWyPP7SqZyEPJIfQzVoXVOIAI
	AGY1jKyZmaRZie3kw4NnmQ95NpRnwh+xsa2TvIGZa7FSvZhvXR1BROKXWnl4dSvmKiSPASLJof6om
	Uu2lUhLeqYd4+cgz5GbbUr7B0+BrhHeMUDjb70GlIiLsox/oYBMX1ByS3YdewSHgJOoWwvf244bwm
	eNgLOj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r17un-006inS-2o;
	Thu, 09 Nov 2023 16:29:57 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r17uj-006ilp-0Q;
	Thu, 09 Nov 2023 16:29:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ED0940007;
	Thu,  9 Nov 2023 16:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699547388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tm0cylrAcXnm7eKQqx0GuLW4XzLpyFuEodiMDdb36zQ=;
	b=bjE0gXRqPUI+3iKxTnJ/SrbxJ3XAuLErHSXzEMhr63ULaCQmtsa856MdkklxROQZiTCx/A
	lGm25zja9uZE7Tb2grdBfeSHULqztzES3qLih4oNCyqcYzwRunOY+dV1ek5nG2ftobLMSM
	NV00MPsAgqAuXWz+IlL3Vig+kmE3JmJ49GVhNK8WJqiBjmIy2y6DztgLnqifmgFqc444lf
	pcPVt/DKFNDEys+KEZ/4gIMJ0Y7wyMLuBLLytTIN3YABD00xpg3ywuk8PbWWSexmi3Vbg5
	qnQxqm1kH7hFYOV0ICVUE+G7xFGmh2jxxk4H8Vrtih0LIW/vfGwQ4icnknGW0w==
Date: Thu, 9 Nov 2023 17:29:44 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, mchehab@kernel.org,
	tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v14 35/56] media: cedrus: Stop direct calls to queue
 num_buffers field
Message-ID: <ZU0I-C32UFjnUKH3@aptenodytes>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-36-benjamin.gaignard@collabora.com>
 <083e43d9-452a-4b11-b7f1-f75992bc795e@collabora.com>
 <ZUzpSXDbO60uGr0t@aptenodytes>
 <618d5b67-ba46-4c33-ae7f-990f4b522ba8@collabora.com>
 <22f2aee0-aea7-465d-b7f3-b1add1bf7bd7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VMLU1zaFnAru3tBV"
Content-Disposition: inline
In-Reply-To: <22f2aee0-aea7-465d-b7f3-b1add1bf7bd7@collabora.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_082953_444363_4C6BC4E6 
X-CRM114-Status: GOOD (  37.74  )
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


--VMLU1zaFnAru3tBV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 09 Nov 23, 16:54, Benjamin Gaignard wrote:
>=20
> Le 09/11/2023 =C3=A0 16:48, Andrzej Pietrasiewicz a =C3=A9crit=C2=A0:
> > Hi Paul,
> >=20
> > W dniu 9.11.2023 o=C2=A015:14, Paul Kocialkowski pisze:
> > > Hi Andrzej,
> > >=20
> > > On Thu 09 Nov 23, 12:27, Andrzej Pietrasiewicz wrote:
> > > > Hi Paul,
> > > >=20
> > > > W dniu 31.10.2023 o=C2=A017:30, Benjamin Gaignard pisze:
> > > > > Use vb2_get_num_buffers() to avoid using queue num_buffers
> > > > > field directly.
> > > > > This allows us to change how the number of buffers is computed in=
 the
> > > > > future.
> > > > >=20
> > > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > >=20
> > > > Given you've alaredy A-b, would you be ok with adding this sentence:
> > > >=20
> > > > "While at it, check the return value of vb2_get_buffer()."
> > > >=20
> > > > to the commit message body?
> > >=20
> > > Not only do I agree, but because this is done in a function
> > > returning void,
> > > you could even:
> > >=20
> > > if (WARN_ON(!vb))
> > > =C2=A0=C2=A0=C2=A0=C2=A0continue;
> > >=20
> > > so that it doesn't go completely unnoticed.
> > >=20
> > > What do you think?
> > >=20
> >=20
> > I'd ask Benjamin.
> >=20
> > But my take on the direction of changes is that ultimately
> > there will be "holes" in the array of allocated buffers (hence the
> > bitmap to track which slots are used and which are not). In other words,
> > getting a NULL sometimes will be an expected situation, and a WARN() wi=
ll
> > not be appropriate for an expected situation.
> >=20
> > @Benjamin?
>=20
> That should never happens unless you add delete buffers capability to the=
 driver
> and in this case it is normal to have holes.
> Other drivers do not use WARN_ON() so I will not do it for this one.

Yeah I also don't expect that buffers can just disappear on us before
introducing the delete buffers capability.

But okay it's fine with me to not use WARN_ON.

Cheers,

Paul

> Regards,
> Benjamin
>=20
> >=20
> > Regards,
> >=20
> > Andrzej
> >=20
> > > Cheers,
> > >=20
> > > Paul
> > >=20
> > > > @Benjamin:
> > > >=20
> > > > With this change, you can add my
> > > >=20
> > > > Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > > >=20
> > > > > CC: Maxime Ripard <mripard@kernel.org>
> > > > > ---
> > > > > =C2=A0=C2=A0 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 9=
 +++++++--
> > > > > =C2=A0=C2=A0 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 9=
 +++++++--
> > > > > =C2=A0=C2=A0 2 files changed, 14 insertions(+), 4 deletions(-)
> > > > >=20
> > > > > diff --git
> > > > > a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > index dfb401df138a..3e2843ef6cce 100644
> > > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > @@ -653,8 +653,13 @@ static void cedrus_h264_stop(struct
> > > > > cedrus_ctx *ctx)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vq =3D v4l2_m2m_get_vq(ctx->=
fh.m2m_ctx,
> > > > > V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > > > > -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < vq->num_buffers; i++) {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D vb2_to_cedrus=
_buffer(vb2_get_buffer(vq, i));
> > > > > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < vb2_get_num_buffers(vq); i+=
+) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_buffer *vb=
 =3D vb2_get_buffer(vq, i);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!vb)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D vb2_to_cedrus=
_buffer(vb);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
buf->codec.h264.mv_col_buf_size > 0) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dma_free_attrs(dev->dev,
> > > > > diff --git
> > > > > a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > > > b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > > > index fc9297232456..52e94c8f2f01 100644
> > > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> > > > > @@ -869,8 +869,13 @@ static void cedrus_h265_stop(struct
> > > > > cedrus_ctx *ctx)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vq =3D v4l2_m2m_get_vq(ctx->=
fh.m2m_ctx,
> > > > > V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > > > > -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < vq->num_buffers; i++) {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D vb2_to_cedrus=
_buffer(vb2_get_buffer(vq, i));
> > > > > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < vb2_get_num_buffers(vq); i+=
+) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_buffer *vb=
 =3D vb2_get_buffer(vq, i);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!vb)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D vb2_to_cedrus=
_buffer(vb);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
buf->codec.h265.mv_col_buf_size > 0) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dma_free_attrs(dev->dev,
> > > >=20
> > >=20
> > >=20
> > > _______________________________________________
> > > Kernel mailing list -- kernel@mailman.collabora.com
> > > To unsubscribe send an email to kernel-leave@mailman.collabora.com
> >=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--VMLU1zaFnAru3tBV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVNCPgACgkQ3cLmz3+f
v9G2FAf+JwNjULMzQx6CKeSkePWWPspnd6zwQv1uSrppPM2oi2YoXgd7uMsJyImP
OOfrkPpY4m0jOp7e2t4oKOvKrDcc9tXTv7UbzPQ3S/RvCQ3pJ9MIRNAFOrM/x4kL
uG2rhiHl/wdw+czGOSb4tip1HXjn04nfyZb6U9YCXNNbvRyJQ4ocwcfyCTvmELja
+bJMussPvxY8c9GhxzodzFow8BoauqdutKO89bJs1DH9iKWTTe7IClz2Ypp5yY5m
c1C4SQomlS8sa92uwYG1S/v5174Ufs3hqwr5I0CPMm3rlaGyO+ykwKu3TnnR7Fif
05epwjlNlSg1Mg+HmVYihbArAlJ0UQ==
=dkuV
-----END PGP SIGNATURE-----

--VMLU1zaFnAru3tBV--

