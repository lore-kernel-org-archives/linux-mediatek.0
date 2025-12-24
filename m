Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A95E776F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Dec 2025 19:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6e16gv7fkGlDB1AoJnkIFe8dWDnsL2zpf8dEOQ9gVg=; b=eM9fTIa/1/onpftbhe+j+tomIN
	VPpdw1vT4321T6eAOIgOp58fa29iwpFbR9tRaiBkbPgK5LHCCr8TivpPsJUv//dISEHlCfvpZ2bKy
	zhwrVb23pGrNq0/2quM+DxgllJcwzOgYegiHNmU722kWO1/Ea6m5xWs0xa2vOU3au9pWHDZW+8zZP
	wWYevoYfMbZr7Jxj1GE8Agvnv5IGu9iNEipDhKEZ8qknwmmrDBILen2noxbG/ZR4qln2gHbfbMyZw
	E1pMyj+QNh8sIzc3kNzjRf0Mur5JbeIKgLJmXHsyZP2GdVYd68R4Q8pS/AGG6ofUX27DgJ+RQHX8y
	YGZ0QqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUcr-0000000HMRq-1f8c;
	Wed, 24 Dec 2025 19:34:27 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYUco-0000000HMR8-2dOt
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Dec 2025 19:34:23 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8888a444300so66307996d6.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Dec 2025 11:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766604861; x=1767209661; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x6e16gv7fkGlDB1AoJnkIFe8dWDnsL2zpf8dEOQ9gVg=;
        b=rsCyiZk4ywSyhXX+9LGI7yCnax8q16On/VMg5tQUO7/1iQOQ5X4BOwkrYjlIgXwYhE
         vkBDAEL5Keoz0k78mPUAHbpajty2+R6SF8uZXKvceEFZpappMtZqGUNJ4APqWsAn9Xb6
         /k9MMycm2qkaJZQKgWvHvdYZ9fQp0ZcEZPmDzCanm/ALJVDR4LFJYoSXXPu6qTaPvnZ5
         CB//kLJG+ZsVK4FnfvG2R7ITIrjYFDsYN0Ipjoq5D5sCR4KzO9xlzffN24/ekPVbDH0q
         nrOlfHkTPJ5mmOebjEqH1VjlTRMJtQQGjAEswYjg9mJJAO7L0tdsMMtY5Nw19+z99w3M
         KalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766604861; x=1767209661;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6e16gv7fkGlDB1AoJnkIFe8dWDnsL2zpf8dEOQ9gVg=;
        b=JjRuyFw+gXXjvliEIXAIX8Md16B4Fqv1kIwB3UZb9SAOT58r8nudWjILUwUcM+oR9l
         vxJ1wreOd9QxbGUnjaAi8q1qtB7Gqn7X1EZBkQ9DN7vr6L3nhqOKDKLAMqEa7D98ghTy
         8yVLChKIaC5C99Dv9303IjaTIKyuJZb9xdoP7RTYMHopPDxzfYQ75XaqIK4JLiayboz/
         jkpEhchMPBULpnh74tNDZdPdamBQVgaSS8pdZrufYbDexiNSlnte1j7NIOuidjHlwsQp
         nYxWE6NTy/SF/p8Sbn52BQH6jZ5j6yEHXjKMaLAeAQoQUA+PCMEGISDQOhvyh7OLNdX2
         OQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWaK3TKs+tbZPlvlmn7Z/bZSsnt49aXp6FR08liQvIr6h78JR7y0SMcAHjzMEj8BANcQRmJuRK2mu2cgRGag==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpxd3sXy2x/e6jpPGOWniu7IO2yZFCqUKLj32eRVy9sUM7g/rT
	SSiOTle1umicCGZuhTgCGygKdG9tZ7xiaNLXuQ66kjqYGF2nqNka8Yuj0vQ4q8mLcHE=
X-Gm-Gg: AY/fxX74Vw1BE9W1udlpPUKHuHSRO9hmdYj+UAwsLexyarfsyx21vUamA1l4i8jZhU7
	ndBiP8rmhkATYrSNhwvmDofRceJ4OOTOCtQAWcd7FP68M/2kRqfdL5srkJYP+2PmpI7BTL4LeeV
	5V3f5z9fUYwDavk1hU3NibJr0S9OGoAW7lkwStkwSDgQe69lNHSHsR7+Uv9RGXlfNLXXgtaahpg
	1fR6ncudqGTTSmi05+OT2V8vkm9yvRvZiffB2cTei7ZY5SQbRjHPtCyp7Rj42fwmZ6Bw2wLdpec
	IaxyB3Kx4irbDvZ/43H8fj5W2gVpqs3IEpXj15b5E07t7Jc/JGTj4CGS6FnXf1P93+5mRtTPb+k
	Piv2buSM1/MxlE1ZxsyLKhElOjg2bjcPSBSSrChTJXu5QchRmvNA58g/CEMk/ccFEGK0tAJVG84
	pVWFYHdTM7NgyRbUHBExhtl5JyBpg=
X-Google-Smtp-Source: AGHT+IE5c0d9pz9gNJn0vh5jGGkS4wNXyintuchpyEm5t5iJ8jOJyL4PkY5GG2wEQBxudRt+jOfljw==
X-Received: by 2002:a05:622a:6a8e:b0:4f4:c10e:fa3e with SMTP id d75a77b69052e-4f4c10efd3fmr133639501cf.3.1766604861041;
        Wed, 24 Dec 2025 11:34:21 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aedafsm132331276d6.31.2025.12.24.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 11:34:20 -0800 (PST)
Message-ID: <2974614b2440ed828f49ff7819ca7935d7bb8109.camel@ndufresne.ca>
Subject: Re: [PATCH v2 4/4] media: mediatek: jpeg: add compatible for MT8189
 SoC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Wed, 24 Dec 2025 14:34:19 -0500
In-Reply-To: <20251224031721.9942-5-jianhua.lin@mediatek.com>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
	 <20251224031721.9942-5-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-qqvl0ztmS4O0H5gavPMm"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_113422_702980_C318361C 
X-CRM114-Status: GOOD (  14.84  )
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


--=-qqvl0ztmS4O0H5gavPMm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 d=C3=A9cembre 2025 =C3=A0 11:17 +0800, Jianhua Lin a =C3=A9c=
rit=C2=A0:
> Compared to the previous generation IC, the MT8189 uses 34-bit iova
> address-space (16GB) and requires a single clock configuration.
> Therefore, add new compatible to support the JPEG encoder and decoder
> of MT8189 SoC.
>=20
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I'll have to wait for some ack on the bindings, which looks otherwise fine =
to
me. But due to holiday, that might be delayed a little bit.

cheers,
Nicolas

> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 44 +=
++++++++++++++++++
> =C2=A01 file changed, 44 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d08fe365cbb2..9ea8d8f56e9b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1866,6 +1866,10 @@ static struct clk_bulk_data mt8173_jpeg_dec_clocks=
[] =3D
> {
> =C2=A0	{ .id =3D "jpgdec" },
> =C2=A0};
> =C2=A0
> +static struct clk_bulk_data mtk_jpeg_dec_clocks[] =3D {
> +	{ .id =3D "jpgdec" },
> +};
> +
> =C2=A0static const struct mtk_jpeg_variant mt8173_jpeg_drvdata =3D {
> =C2=A0	.clks =3D mt8173_jpeg_dec_clocks,
> =C2=A0	.num_clks =3D ARRAY_SIZE(mt8173_jpeg_dec_clocks),
> @@ -1897,6 +1901,38 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvd=
ata =3D
> {
> =C2=A0	.multi_core =3D false,
> =C2=A0};
> =C2=A0
> +static const struct mtk_jpeg_variant mtk8189_jpegenc_drvdata =3D {
> +	.clks =3D mtk_jpeg_clocks,
> +	.num_clks =3D ARRAY_SIZE(mtk_jpeg_clocks),
> +	.formats =3D mtk_jpeg_enc_formats,
> +	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_enc_qops,
> +	.irq_handler =3D mtk_jpeg_enc_irq,
> +	.hw_reset =3D mtk_jpeg_enc_reset,
> +	.m2m_ops =3D &mtk_jpeg_enc_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-enc",
> +	.ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.support_34bit =3D true,
> +};
> +
> +static const struct mtk_jpeg_variant mtk8189_jpegdec_drvdata =3D {
> +	.clks =3D mtk_jpeg_dec_clocks,
> +	.num_clks =3D ARRAY_SIZE(mtk_jpeg_dec_clocks),
> +	.formats =3D mtk_jpeg_dec_formats,
> +	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_dec_qops,
> +	.irq_handler =3D mtk_jpeg_dec_irq,
> +	.hw_reset =3D mtk_jpeg_dec_reset,
> +	.m2m_ops =3D &mtk_jpeg_dec_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-dec",
> +	.ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> +	.support_34bit =3D true,
> +};
> +
> =C2=A0static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata =3D {
> =C2=A0	.formats =3D mtk_jpeg_enc_formats,
> =C2=A0	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> @@ -1936,6 +1972,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
> =C2=A0		.compatible =3D "mediatek,mtk-jpgenc",
> =C2=A0		.data =3D &mtk_jpeg_drvdata,
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgenc",
> +		.data =3D &mtk8189_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgdec",
> +		.data =3D &mtk8189_jpegdec_drvdata,
> +	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgenc",
> =C2=A0		.data =3D &mtk8195_jpegenc_drvdata,

--=-qqvl0ztmS4O0H5gavPMm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUxAOwAKCRDZQZRRKWBy
9JqBAP9i7M2YbOEYsWIhtcAH9zQcvXYutrHtuKt+PmEgNW4g5AD9ECawAwyRxWOa
fdGbfG5KGblydDkiwIRY9o3Ya2p6XQQ=
=ZDB6
-----END PGP SIGNATURE-----

--=-qqvl0ztmS4O0H5gavPMm--

