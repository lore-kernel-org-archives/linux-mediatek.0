Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132B5D637DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 21:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdCldys7nQSDy6vXu7JlMpmSPr3k8VWJix7kbyw58m8=; b=TZ/xSqt9qa/HwLBhmnRd5IgnI4
	zMbLLdwUS0P1QwWgeX2y4fQ/Q1/OvJAppQyvDWvUS31hdoKQPiipeLH85zYqoN++msTy1IYHF9FnU
	27jDzmcWpsrnnrCy72U9ehRdIm1lSG7agRbKxfrvIAAzHviwt32Gnpa2mxPgWXx8XnhWg+7LCese0
	BmW8JPGuUwhXnMsF/zGFcOsnulbPkIX3mbYnaFyKRAPQhVP0RsmK9xIxSK4+2bAB+v+oIeUppKLyH
	curAXqWp12qjmqtz5Leh03abCaWqwYnkBmDOpuJg0EmHm8Mkz7sndmx3BjzW9gsDatVlPALHqkf6M
	fkTvqP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcv3-00000005rYx-3eS0;
	Tue, 16 Dec 2025 21:49:21 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcux-00000005rXt-2JXI
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 21:49:20 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-88a367a1dbbso35665996d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Dec 2025 13:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921754; x=1766526554; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bdCldys7nQSDy6vXu7JlMpmSPr3k8VWJix7kbyw58m8=;
        b=pE9i4ggL9W7aJUfR6S9Zhew4CYHemH2EYoLi4FWLwcZ1T6CeEwoUBXTZwc8M97Ihvc
         OBOnKHyQRbXr7fViKzI7NOwmcqota0OhDaoKelnigTFARjL0WYxbBEBErWKQMVw/wWqa
         VZ5yTd9n9mYp5Ulp5HOCTQRguoplIzSttk2yA25ShfYHar91AC8KBsG6JJDJKMyyiH3f
         1qXydzc6p8+5Dk2H2uzTVw/zcSQltAvx46qabq5mjHY9OJeoHHcnz0rzk4OYgRJzC7SO
         M6braiUCSzIALxUziGCNtFihOJu/O/WHEQwIeLemXWGqcd9Gi9xca7IAbJWyY/KME4wE
         wvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921754; x=1766526554;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdCldys7nQSDy6vXu7JlMpmSPr3k8VWJix7kbyw58m8=;
        b=uqe2ynUHlvetPUVZaOwVEIktUP96Czbrx0nIKlr5OreX2YnfBnL1wb4tgkjCG6BAAY
         63Ks4m8DL9wp1QpJrG66JQBe+zR0ObeKG5PRDwQtoEH5JCYIauPpOyxfCQdQewBKScEf
         fxKCiqEpTwMadNN5rj3WrwFtVoI91Icn3tTzYDI02/Pl5TpU9an4sl6jNX8KWYo44Ido
         ws5jAe1bmqMAAvXHw0AOLCOWmT2YxHe9ogn/vnGRRjq81FgtJUpopbOXezmtPk6CY829
         xOpWhG7xuAQIPnvpljY/KErr+QaR1RJNvvj94WCUd5SUAYHLFRYeif5WBI7D4eUEUv6c
         m1ag==
X-Forwarded-Encrypted: i=1; AJvYcCVl6HM3+FHSCVZtwwR9U+d2/650bxFL/QsVqMWvdg1jaSsDjoo4txj0lTFbtbZ0X5iJNWQtZjS23gC74mVdvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl+F4BwfrwQ3p00TvFKVIQzq6muw05TForS/sSHQriKsDEaZmn
	l4BnRJiNqs0LFkP3ycMc8K4CSPuIRG1xXS0yO5GN8KuqmfMSzPmEyVCZEgTcHQlItzU=
X-Gm-Gg: AY/fxX5qxiYT3BAFoRirpuOSVQ9zUJeQ9wMVjYoIIKWACUsZFpa7XKzt3iwQ6RDe6Q0
	/UKsCb69qb2Hp/tX3LyEipr0MayQzULrGtIZ2bXU762tulUCIJK73l3J8ZbZOTB25k/w40xu1QW
	syAC6kkVlHpzf8t7OFrOkYqD4pBAc36gEhSqZpeVnQ+cFNx1qLVxt32/SLmd0BtJWs3etT+WOXO
	puEg/rZ3Mhz4jMl0oouxJJz9y0FusjH9SODQlBL3fDageenxWTLyFak1C5rdwnXfxa8mRKzEJG/
	3zAy95LOgQkRnhArkcgzDrrueAawbZAxfQCEdq4H0R2xJIP4bqdBVSR2Q6n8zYhO5LGbNbXP3ln
	fls6dFZomi6OQLZ6L7lRZmiof99iwKK/ccsQPLfj0SzXwxBEshahT3eQQLf4BKRztfWWg+TI/tL
	psuOUWjtzsQvGYethI
X-Google-Smtp-Source: AGHT+IH+V/Mr5+CqGLcI3EzYLOmPSV6tSlboBRvR5DbANVmIdH9NhazPVg8f1thYKYgGBLLqtCy2dA==
X-Received: by 2002:a05:622a:1b88:b0:4ec:f073:4239 with SMTP id d75a77b69052e-4f1d04787c8mr198004211cf.6.1765921754277;
        Tue, 16 Dec 2025 13:49:14 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f345c7dfbfsm21515751cf.31.2025.12.16.13.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:49:13 -0800 (PST)
Message-ID: <3dd2c364f84725a68823f13a9f2b1f0499abaed5.camel@ndufresne.ca>
Subject: Re: [PATCH v11 11/12] media: mediatek: jpeg: add jpeg compatible
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:49:12 -0500
In-Reply-To: <20251202094800.6140-12-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-12-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-YBjB4a/FKYc454GerwhG"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_134917_939424_62682756 
X-CRM114-Status: GOOD (  13.08  )
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


--=-YBjB4a/FKYc454GerwhG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> Add jpeg dec and enc compatible for mt8196
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 34 +=
++++++++++++++++++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 |=C2=A0 3 ++
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 |=C2=A0 3 ++
> =C2=A03 files changed, 40 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index da1ca494ed4b..10a588b92e76 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1932,6 +1932,19 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drv=
data
> =3D {
> =C2=A0	.jpeg_worker =3D mtk_jpegenc_worker,
> =C2=A0};
> =C2=A0
> +static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata =3D {
> +	.formats =3D mtk_jpeg_enc_formats,
> +	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_enc_qops,
> +	.m2m_ops =3D &mtk_jpeg_multicore_enc_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-enc",
> +	.ioctl_ops =3D &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.multi_core =3D true,
> +	.jpeg_worker =3D mtk_jpegenc_worker,
> +};
> +
> =C2=A0static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata =3D {
> =C2=A0	.formats =3D mtk_jpeg_dec_formats,
> =C2=A0	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> @@ -1945,6 +1958,19 @@ static const struct mtk_jpeg_variant
> mtk8195_jpegdec_drvdata =3D {
> =C2=A0	.jpeg_worker =3D mtk_jpegdec_worker,
> =C2=A0};
> =C2=A0
> +static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata =3D {
> +	.formats =3D mtk_jpeg_dec_formats,
> +	.num_formats =3D MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops =3D &mtk_jpeg_dec_qops,
> +	.m2m_ops =3D &mtk_jpeg_multicore_dec_m2m_ops,
> +	.dev_name =3D "mtk-jpeg-dec",
> +	.ioctl_ops =3D &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc =3D V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc =3D V4L2_PIX_FMT_YUV420M,
> +	.multi_core =3D true,
> +	.jpeg_worker =3D mtk_jpegdec_worker,
> +};
> +
> =C2=A0static const struct of_device_id mtk_jpeg_match[] =3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8173-jpgdec",
> @@ -1966,6 +1992,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgdec",
> =C2=A0		.data =3D &mtk8195_jpegdec_drvdata,
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgenc",
> +		.data =3D &mtk8196_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgdec",
> +		.data =3D &mtk8196_jpegdec_drvdata,
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index b3142dc9be85..e453a1634f33 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -45,6 +45,9 @@ static const struct of_device_id mtk_jpegdec_hw_ids[] =
=3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgdec-hw",
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgdec-hw",
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 82c971936c4d..b30c728c3712 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -52,6 +52,9 @@ static const struct of_device_id mtk_jpegenc_drv_ids[] =
=3D {
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-jpgenc-hw",
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-jpgenc-hw",
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);

--=-YBjB4a/FKYc454GerwhG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHT2AAKCRDZQZRRKWBy
9IZqAPkBoSLa+bFdlDtR1FQo5Uc5A2dt+rMGU51H/CGtt205EAEAqnmGw/ine3cr
vP6MeovY8uQj7THLju96VbvCAKmDCQY=
=jQmg
-----END PGP SIGNATURE-----

--=-YBjB4a/FKYc454GerwhG--

