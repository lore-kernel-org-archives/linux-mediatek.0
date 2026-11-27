Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD0606A329
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CjalqPgp;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EPK0sUbk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZO8Bdr5hDDShdvk0P9d6O7remcbXsTXZeyombAOOMOg=; b=CjalqPgpmKASvHmZI7CkeIY2Gm
	+2yxcvXyzpFcAf2gtdU4zOMEdTV74cnyrnAnCvi2jf+SUM993UjTLPCZ0d9Ew0arbD1wEuT28h5jt
	hznwN6SPoTs7xlDutIiOlL7+yNmmZLnWC2OVC1ux5alOyMb3MAdF0e0KpZJlfcadMJZn9CDCK2eqq
	/WF1PBPMMmE5bqim7GmnVlAs8h1Cpdfd98L6EyXP9RQHFRxgMqWTcsZPAjwuhUuRcUaw8Wg9GR4Ny
	UhQNfrXyzJwcrzj15VM/X3Ph6Bw7Y7ZSIpXAndc2muxEm49QHT2Yr9Vxit9ER4RNB/qj0vO98XdV6
	YPmMvYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX16O-0000000HUXa-3D5f;
	Fri, 27 Nov 2026 18:55:23 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX16M-0000000HUWD-3B3l
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 18:55:20 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-55d3563e50eso68193731cf.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 10:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795805717; x=1796410517; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZO8Bdr5hDDShdvk0P9d6O7remcbXsTXZeyombAOOMOg=;
        b=EPK0sUbkUt6Xdg1JDhMEJDhLfp+iKWV1SVxHDzAEpi1QP8G6aE1RKgHnMMp8/Ha7Ed
         tdxyJmoNVG7381MUUQ1UzOUfPOxYYrVsVL3isrKiA0EivwvEk8XmKSmb2ntIJnUcvt7b
         jjIZl4S4mlVNO7Jb1uFkeHWFCk4gAI7jTyQwPljpeeiVllBovsQZraqQw/KkWJXOqh2o
         UbWauIUc2e8z8VnynNxs4W/Qauyg6jutRp4zcub5fN/tpJrDo/437TQnwJZA0Xj5nQin
         8NldzO6eCn4+AyUAVh++eQ/Wd/rBdp5vLZ75A0f2zerzL8SSHPKia6n6tuUB8lAC4qr6
         uokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805717; x=1796410517;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZO8Bdr5hDDShdvk0P9d6O7remcbXsTXZeyombAOOMOg=;
        b=w574eIe2EymsBP3WE6n0rN8jm1cftbF/FArvKiMYTVCagKifpA/d4AM7eAE5K6hStw
         xeuTd5zU3E4yUak0FLVH0zg/jeDf6Tpf3qFYE8H390bt0NQkF7XFboxlvBo/oHnMB74c
         cS6KX/wMXg9EVjnQy4BnTG+leFd2Mh+8Onjz4zEUXID5BJhoeUGD/wxZAMq8gScBRwXQ
         /5ZzxyPXPaUg5hdvatQlM5gIbDgxQfo2CA9+sYhshQC/56D3Q8O6kD70N4qUiWdkSNzd
         DW2qXTjJOZInfFuO8/AIwHtZP1tiIwmPKJTcTBfriLfApp4JopGSeSAbEa8ir/rXCGHP
         eNYA==
X-Forwarded-Encrypted: i=1; AL+hErEkKMEKzicuNOgVhXaQ+Ee55Y0/kgKCv3lKhbAloBvSPPL+q6FxRcM9LfbR8DJ4CIFC4GRkp6qBzJqippN1vA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9lVHWc2PPb/rkJrkXhy++/KW7I+Sc6wqkVpYRcB/1e6YSRRVxO
	M7Hw++ZsWcRg7RoyHjIxgjvhYgH2D7O4DxNsQFy7Xrdo3YclaTguVOll5T8zZPddklk=
X-Gm-Gg: AZFdTZeHfWW55jSFoJep2qiX2cBhsk7f6mUoeuRgPn8VjtA3ZRzXmhmrbf6jKo/bkzV
	MBLEQMdfyJWwx+7ktEhkNL3NplnqJTHO7Ci4YmLLIE+9TzyiS17lWGgOKFrdJ8W8iL7FrmzJ2v4
	gbXPGCiEo8hOaNmWT+kF2QpELkqiPhv0uV6GmiKObh65ofS5YQV+XAOUueEMY3L6FY5l4HXlo/X
	OjIf/HPfP+FGMZ2RDLhI8Udqk7KdsNcPaQlivyO7BypH5m41wRmPQ2knbcYkzeTdu3rm/ipv95G
	XdgH6rrEBr6hzRMXMNeVihMpYKsAuZUQ0zhdM0NTWeLfalZac1OgJ6DoPQM2eVpig5Ang1ryCPA
	aDvPC54T2y13YvBkRCeVbeIeGATCGcA2Y8xvWeN7dyqwZKKOiBBQ2S2MjR00NNpLj1x9gXEluoq
	Ks9Qe+zvSzov8X8TiJZkfCxy5J/5qfwVyVJTjMQ2cg8Vy/AEWinz6Ppm4saTZkyRMuUk42d8nvt
	rmQiRJzW8wOS6X+zCoKQR4UbQZjMUfTqmsqHuQFveI0djxL6LyCuw6qMc16KiUb3eD1bnGRyO4C
	3PbBrjcRJOEOWNhXUUxSaSFvGCHvj5gfMNQukKpgBzoFUV8GYt7kNEOv
X-Received: by 2002:a05:622a:1b9f:b0:55c:8389:57f3 with SMTP id d75a77b69052e-55d76a7f1cbmr503259311cf.49.1795805717246;
        Fri, 27 Nov 2026 10:55:17 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dcdd1a2c6sm24950151cf.20.2026.11.27.10.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:55:16 -0800 (PST)
Message-ID: <b51b4c1ce171a77eb452455862d706680d211e71.camel@ndufresne.ca>
Subject: Re: [PATCH v3] media: mediatek: vcodec: Validate source buffer
 vaddr in buf_prepare
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fei Shao <fshao@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
	 <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Fri, 27 Nov 2026 13:55:14 -0500
In-Reply-To: <20261127-vcodec-null-va-v3-1-e24521086062@chromium.org>
References: <20261127-vcodec-null-va-v3-1-e24521086062@chromium.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-cH77cGYcAbVXP/0jrHXu"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_105518_907437_4599B92C 
X-CRM114-Status: GOOD (  21.71  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TRACKER_ID autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-cH77cGYcAbVXP/0jrHXu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 27 novembre 2026 =C3=A0 13:37 +0800, Fei Shao a =C3=A9crit=C2=
=A0:
> If an OUTPUT buffer has no kernel mapping, vb2_plane_vaddr() returns
> NULL. Both the stateful and stateless decoder workers only peek the
> source buffer and finish the m2m job without returning it, so the buffer
> stays at the head of the ready list and the same job is scheduled again.
> In the stateless decoder, the media request is also never completed; in
> the stateful decoder, vb2ops_vdec_stateful_buf_queue() also passes the
> source address to vdec_if_decode() without a NULL check.
>=20
> Add a vb2_plane_vaddr() NULL check for OUTPUT buffers in the shared
> vb2ops_vdec_buf_prepare() instead, then remove the late checks from both
> workers. Unmappable buffers are rejected before entering the queue, and
> userspace gets immediate feedback.
>=20
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video D=
ecoder Driver")
> Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put captu=
re buffer flow")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> Changes in v3:
> - Consolidate into a single patch.
>   Validate OUTPUT buffer in shared vb2ops_vdec_buf_prepare() and drop
>   the late checks from both workers per suggestion in v2.
> - Link to v2: https://lore.kernel.org/all/20261023075642.3671805-1-fshao@=
chromium.org/
>=20
> Changes in v2:
> - Call media_request_manual_complete() instead of
>   mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
>   that may be in use by the core workqueue on MediaTek LAT platforms.
> - Link to v1: https://lore.kernel.org/all/20261019060825.4163770-1-fshao@=
chromium.org/
> ---
>  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c   | 8 ++=
+++++-
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c    | 6 --=
----
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 6 --=
----
>  3 files changed, 7 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index d76e891f784b..a5c6b56be927 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -811,8 +811,14 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
>  =09=09=09=09=09  i, vb2_plane_size(vb, i), q_data->sizeimage[i]);
>  =09=09=09return -EINVAL;
>  =09=09}
> -=09=09if (!V4L2_TYPE_IS_OUTPUT(vb->type))
> +=09=09if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
> +=09=09=09if (!vb2_plane_vaddr(vb, i)) {
> +=09=09=09=09mtk_v4l2_vdec_err(ctx, "failed to get vaddr for plane %d", i=
);
> +=09=09=09=09return -EFAULT;

The spec only allow two errors, so I think it should be EINVAL, what do you
think?

https://www.kernel.org/doc/html//latest/userspace-api/media/v4l/vidioc-prep=
are-buf.html#return-value


> +=09=09=09}
> +=09=09} else {
>  =09=09=09vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
> +=09=09}

I would myself do two if, to keep the two separate.


=09=09if (V4L2_TYPE_IS_OUTPUT(vb->type) && !vb2_plane_vaddr(vb, i)) {
=09=09=09mtk_v4l2_vdec_err(ctx, "failed to get vaddr for plane
%d", i);
=09=09=09return -EINVAL;
=09=09}

=09=09if (V4L2_TYPE_IS_CAPTURE (vb->type)
 =09=09=09vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);

Nicolas

>  =09}
> =20
>  =09return 0;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c
> index aa9bdee7a96c..fbd5791e78c1 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -347,12 +347,6 @@ static void mtk_vdec_worker(struct work_struct *work=
)
>  =09buf.va =3D vb2_plane_vaddr(&src_buf->vb2_buf, 0);
>  =09buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>  =09buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
> -=09if (!buf.va) {
> -=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> -=09=09mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!", ctx->id,
> -=09=09=09=09  src_buf->vb2_buf.index);
> -=09=09return;
> -=09}
>  =09mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=3D%=
zx vb=3D%p",
>  =09=09=09  ctx->id, buf.va, &buf.dma_addr, buf.size, src_buf);
>  =09dst_buf->vb2_buf.timestamp =3D src_buf->vb2_buf.timestamp;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index ab1894fba0d9..3d5f9e11a49b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -342,12 +342,6 @@ static void mtk_vdec_worker(struct work_struct *work=
)
>  =09bs_src->va =3D vb2_plane_vaddr(vb2_src, 0);
>  =09bs_src->dma_addr =3D vb2_dma_contig_plane_dma_addr(vb2_src, 0);
>  =09bs_src->size =3D (size_t)vb2_src->planes[0].bytesused;
> -=09if (!bs_src->va) {
> -=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> -=09=09mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d source buffer is NULL", ctx->=
id,
> -=09=09=09=09  vb2_src->index);
> -=09=09return;
> -=09}
> =20
>  =09mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=3D%=
zx vb=3D%p",
>  =09=09=09  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src=
);
>=20
> ---
> base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
> change-id: 20261127-vcodec-null-va-cd0008e9f136

--=-cH77cGYcAbVXP/0jrHXu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawnSEgAKCRDZQZRRKWBy
9GCLAQCDEAyrTgLprsz58hQYBLGjSR9A0s2brlYq+wcnCoXI3gD/TRlIZCzY6Whr
hCii3ApDRHlWxXNWTh1uomfYIOVXXg8=
=wqqh
-----END PGP SIGNATURE-----

--=-cH77cGYcAbVXP/0jrHXu--

