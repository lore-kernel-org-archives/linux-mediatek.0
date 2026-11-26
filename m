Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA9606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=406gth8o;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=USBvAST/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=; b=406gth8o6oP7XaXWhVw50ZxdDH
	tzKX7p1mfYRbOJWFWwSMCeMNLs2wQovh98z8JY7G28aNNp6ZY1KjxQqwLIW/vcMlAZsOqUUZvMl/j
	/xdHvBi30A2uGn1MQSz5/PHuhqvYA1QGZMIrlsXCAGzgG1uNXkMTKO4Z5sDQwueL3RX6M8WLbwFEe
	NciN4n6cmuxKAS4tcojQQd/07AmczmwlayLY0k5uWCfPLwhhqsE4ieotB3iwhx+DiDTuZEZCSV19h
	RmFB8HycNEHd1aYhGrAHJEKD59akClMUQ1jCmrGgvamMQp4S1RWKnHjSLU7hjgGejQguBRTwka+kQ
	YqGZo5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeym-0000000EH87-1mx1;
	Thu, 26 Nov 2026 19:18:00 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeyj-0000000EH71-1AAD
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 19:17:58 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-55d3563e50eso55669901cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 11:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795720675; x=1796325475; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=;
        b=USBvAST/eXLRA3IN0evizKRSmpbXcsiHtfPFROjo0atPC4iyEUgUZqxkC8rjeTT8VW
         OwTmB9alRGJS0R8/7rucgOhRKvqZhfgYXuaD8Wz1BKpA2MdZEam3gNoJxnNb8SQA0Yln
         +PCAks8+mB3zC4D7i6cXOMZ2135NUxTyHigGzg3OUZoBCyRurElJNz9DwdqsDuABpu5t
         T9YFvRCz6tnd4FH2wcgdPXVVTTgLWxU5yV07TswmsYXSL3HjVPqOIcN6M/X2C7RkV/oN
         wMoZGBaviY9IPioGOhdkGpxS/l7oHTpONG5NMGtNHdh/PChY+uqsbLv1WaIMvY/RiEEs
         voRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720675; x=1796325475;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrMfIn90Y5AtDBViFQR1HDcogfclmJ9VfnUnL8uwi1o=;
        b=ID13c1Gq6pgJq0ZQQWrVGwDYNUxKF41LYQbngUgAfFH0OrNVRJl5BksjQnFoFeEy7b
         us5VGCU092Ejee6H0Au0Ba2lovi0wnB2W3UPQwrgw8gS7s4gO/Jy2eGUy08JN1F/7tkq
         74lSiVv7B6rX7cNo1PEXjvqbOodeaPr126pruv+ghgO7LTLAtTZyfdm5TyZ3NxDR5iA+
         0Y9On8e0P7XUZPD8wx5sqkXYcbNwT06J1Im7Fs175CCQ4bSNg2ZQmInw4uAgy379nvUC
         xcVt3GjlyinIeJXb3B/YRnpfix1a0a3MZzBfh2Iu4hSQg/MU33tQSkvx/jg6c4ABj27Q
         6KOQ==
X-Forwarded-Encrypted: i=1; AL+hErHP8JmNHhqRfE8CGOINBbXGuyqTZSwx4ygggr58b9D+iqtm/PCh97Pog3E7OJ+OyGjsL3sAay+iIYeHn+ojMw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Gp0NFm0eGVaACfY53gEcGd4Ju7FQafJbmIvDw8CA4dWw7BgJc
	PWptD53CmAFdvaKrZ1hhgQ0ttebyndC0iFPoOrzw3cCc0PqaDMmYJkKoLjKYzndTvwA=
X-Gm-Gg: AZFdTZfNUemrQLMvxRpgov32oel4qjUcx8RinccTsp2rww/9KqHHLQzZT2qsnszmaHX
	yuQNv4oe6Az6izxio/hyW84RhHqKzAzcL+02rGC2DorZhSOzjh9tvzFGMJ523X2gNeCMgNHC6Oq
	1N29G2MFlGt+LZooid8QkovBFwItEzLSwUNk3qW7/eNb8ZPKMyyCTPbuKCj9+9WVRQvO2lQi4hg
	ZUi6TwDKwKlnQ/Ci7U3wS2qXet+Be0xNEuCQR8HsjM06vhdVVD6hMqz4dxOg8VnhgvUvqickx6q
	Od0Q8sXqjrJcweYVQH+RO2pCEG9UUvvj913+NZ/UsxMnv4iKFFyaXbXrN2hmTGWSIuXxf0zctdV
	K1WX2QClAl0KbCIldyEqRAmvbSk4lk1oDQFKs0R7wXepxPw//tHrFXzi9tLPnONInLJ5vI8Savv
	OtN2e6gzwkuWr/bfnO4yZo7XbhampRUzq6dm8oP8UiuQK03OWrLQqRcXApuoOvjR51ZKZo/MHpv
	d8pKFd67y5haJv/hDADQQbAPcKWKD4ZVovWhhZ2NM8tIdHVKYnO3U0kdIHRst/ayxyQ6krVPb74
	D1QNOqLGYNkcUM5bY+oKCSD8TmNBCH7d149hRjqEQq8uZxQ3HYkClpKoWHtINmohJyQ0ep0lS2X
	A
X-Received: by 2002:ac8:5f06:0:b0:535:1f03:32aa with SMTP id d75a77b69052e-55d76a78d2emr425610731cf.45.1795720675469;
        Thu, 26 Nov 2026 11:17:55 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dc8895beesm11592841cf.11.2026.11.26.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:17:54 -0800 (PST)
Message-ID: <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on
 NULL va in stateful decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fei Shao <fshao@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 26 Nov 2026 14:17:52 -0500
In-Reply-To: <20261023075642.3671805-2-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
	 <20261023075642.3671805-2-fshao@chromium.org>
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
	protocol="application/pgp-signature"; boundary="=-Cs4W2QVf/4yjYY3PWWkw"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_111757_420279_ED93DF92 
X-CRM114-Status: GOOD (  18.11  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-Cs4W2QVf/4yjYY3PWWkw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fei,

sorry for the delay, so many patches...

Le vendredi 23 octobre 2026 =C3=A0 15:55 +0800, Fei Shao a =C3=A9crit=C2=A0=
:
> mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
> If vb2_plane_vaddr() returns NULL because the buffer has no kernel
> mapping, the worker finishes the m2m job with the buffer still at the
> head of the ready list. v4l2_m2m_job_finish() then schedules the same
> job again, which fails the same way, so the decoder never makes
> progress.
>=20
> Remove the buffer from the ready list so that the job is not scheduled
> again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
> back. Print the error before that, as the buffer must not be touched
> once it is returned.
>=20
> Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video D=
ecoder Driver")
> Signed-off-by: Fei Shao <fshao@chromium.org>
>=20
> ---
>=20
> (no changes since v1)
>=20
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c
> index aa9bdee7a96c..a4cbb7c76998 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *work=
)
>  =09buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
>  =09buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
>  =09if (!buf.va) {
> -=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>  =09=09mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!", ctx->id,
>  =09=09=09=09  src_buf->vb2_buf.index);
> +=09=09v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +=09=09v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> +=09=09v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);

I did some research as all this felt very late and defensive. My conclusion=
 is
that you should validate this in vb2ops_vdec_buf_prepare() (mtk_vcodec_dec.=
c).
This will let you remove this defensive check. Buffers that failed to map (=
or
unmappable/protected memory?) will simply not endup in the queue. It will a=
lso
give an immediate feedback to userspace.

Nicolas

>  =09=09return;
>  =09}
>  =09mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=3D%=
zx vb=3D%p",

--=-Cs4W2QVf/4yjYY3PWWkw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiF4AAKCRDZQZRRKWBy
9BhnAP9oifXvKzRb69nGyfhqcckUcFDLX9lh723xc36dI1jn7gD+LWpi2JJDuPSx
muyGT9ledNYAcMj5WUk5fyPOM9A0uQQ=
=GEUe
-----END PGP SIGNATURE-----

--=-Cs4W2QVf/4yjYY3PWWkw--

