Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6FDCDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iqwM5opDjnD+ixELUSySOVNyUQv89SINtLl3/UxmFE=; b=F8KiMYET28d59qcyAXDLYXkzYE
	F91V47A127M9bGtCrG5/jyz5cMQPKoAjjjKA4RVRuRQKCsCBjb4dhpCsm99eHC6xX5O8Dfi7xH2f2
	lgURcULxflRbVF1QZin6eZAP3KmsExA24Z1d9JDesLieoFvZQwPqfcftN1EC1/m/b4Uf5ea9oYcxu
	sxUZS5A39A0QEyFNJuNO8GuLbW8Aoi56Uo1wCj/RpcTHx+/87195fIcFXJheQ7gE7d+j3FP1ZZ31m
	uz430pSiPOnJRHgync5d19B5/wekUAPKBI8pnmQb6Cu6AWG8SyImBHWvTgS4RJdn0U5vuk5NWoppe
	ME/Qk29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfrE-00Bk7C-37;
	Tue, 17 Oct 2023 08:55:20 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfrA-00Bk5j-2X;
	Tue, 17 Oct 2023 08:55:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59F8C60012;
	Tue, 17 Oct 2023 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697532905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7iqwM5opDjnD+ixELUSySOVNyUQv89SINtLl3/UxmFE=;
	b=YLPmSv2BCtXDB0ajUoTbluwBFmwofXadtU+GsY+4Sr2bStC/+57qJWEqHQxugCysJoJknP
	/xES24Lgh/2iCrJ6gc7yDMdmhyFcxsPClA+nGs1zBJbYjmdnMazWn/GFZ5Ij1hd1/iYEOE
	rnGM6Lou0DwZIc0pn6ZJD1neN06P0aE0s9hFnJ2NWCTv4jEGZeXwQLDI8oLcKrCQmu51Es
	7Jaiw6FtcmzGD+tpz84+I5MJUp7c7og8dHm3VZNJP0PnF+sH4k76GF8Z+2YN+Oz/ROwvGD
	z2Tzp5Q1gVXIAkN0JI1fQPn1a/bIY4ituL/pt69IiaEMm5cR9NQcbCEJEEXjLA==
Date: Tue, 17 Oct 2023 10:54:58 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
	ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v11 41/56] media: cedrus: Stop direct calls to queue
 num_buffers field
Message-ID: <ZS5L4l2PzQgpJXua@aptenodytes>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-42-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5XMse7FBKsXwfxlj"
Content-Disposition: inline
In-Reply-To: <20231012114642.19040-42-benjamin.gaignard@collabora.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_015517_142178_2F362F93 
X-CRM114-Status: GOOD (  19.27  )
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


--5XMse7FBKsXwfxlj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Thu 12 Oct 23, 13:46, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() and queue max_num_buffers field
> to avoid using queue num_buffer field directly.

Thanks for the patch, this is indeed a nice cleanup and safer usage.
Maybe the commit message needs to reflect why this change is welcome,
not just what is being changed.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Maxime Ripard <mripard@kernel.org>
> CC: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++--
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index dfb401df138a..95e490532a87 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -653,8 +653,12 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
> =20
>  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> =20
> -	for (i =3D 0; i < vq->num_buffers; i++) {
> -		buf =3D vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
> +	for (i =3D 0; i < vb2_get_num_buffers(vq); i++) {
> +		struct vb2_buffer *vb =3D vb2_get_buffer(vq, i);
> +
> +		if (!vb)
> +			continue;

Please add a newline here to be consistent with the other block being chang=
ed.

With this change and the commit log reworked, you can consider this:
Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks!

Paul

> +		buf =3D vb2_to_cedrus_buffer(vb);
> =20
>  		if (buf->codec.h264.mv_col_buf_size > 0) {
>  			dma_free_attrs(dev->dev,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
> index fc9297232456..52e94c8f2f01 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -869,8 +869,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
> =20
>  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> =20
> -	for (i =3D 0; i < vq->num_buffers; i++) {
> -		buf =3D vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
> +	for (i =3D 0; i < vb2_get_num_buffers(vq); i++) {
> +		struct vb2_buffer *vb =3D vb2_get_buffer(vq, i);
> +
> +		if (!vb)
> +			continue;
> +
> +		buf =3D vb2_to_cedrus_buffer(vb);
> =20
>  		if (buf->codec.h265.mv_col_buf_size > 0) {
>  			dma_free_attrs(dev->dev,
> --=20
> 2.39.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--5XMse7FBKsXwfxlj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmUuS+IACgkQ3cLmz3+f
v9GV5wf/TYcN6gfAAjC5SFlkLJBI/nxR5YwIXXCHBgPuQD+SDdeQNLb/OK6/EjCw
N8zdNrQdsMqz+Hm6oO5qJqU/MLD8+HLPgnFNSA/+tK7uynPhFwNaJ29bDaONj9KA
kPiJruAS/e5SXFfEdhWnHxSz+OQWvqrOBAZj/WV/OVvm/Azl9oXg67oLddms1HV7
5Gv7y0H2u60hmsjfTptTA1MwOKjZfKDpyuSr2iENNAiJTP1H6zjnY3f7aB5JjlP5
kWrZG+P/x6WrrX62qyWdHVq366vg9bNyLrkDyxMxz/tcjShPcfyQQ7cU/15IKpGi
uLOnI40+m0H1qMX4rElL2jp59ZfMLQ==
=Xf+i
-----END PGP SIGNATURE-----

--5XMse7FBKsXwfxlj--

