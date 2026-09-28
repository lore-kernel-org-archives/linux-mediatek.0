Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8587CA5FA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 21:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaYLtQdPOAs5MVg3mEQ2w8dEl9KRvDeu2m3mohc4wFA=; b=x0EC9BNADIbu4/GMTLYyy4vjii
	zReaQjljXUeJQMjxf5364aimEZN7p+lUMZ6XP+20e+3LUnrjNyB4YoIuTX8Lr/J2HuijzoKmKTaC4
	0X8LU2yM4WX1C3kIRMlm8N7H/nJ+iPKiMt1q4SkC7vYAZ95e4VLi9Vtmjn+HJzAz0EG5XxFh/k3un
	W8NI530UvPwWrIBihkKs1ckC8TmsBZfVwBwHHJIlUNSz41H8IGSlaQW21DQq85npcnFWco8QgGoKe
	Y4lIyXrG+2gDLbp/rXb/1UZigtu2yyG/4tle16RKOu6QAeIJoNHPGKVeOhI99JynR4yC9pvnp2f3Z
	DRSBwMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIp1-00000001fHB-1TCz;
	Mon, 28 Sep 2026 21:23:39 +0000
Received: from mail-qv2-x0d.google.com ([2607:f8b0:4864:33::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIox-00000001fGN-301g
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 21:23:37 +0000
Received: by mail-qv2-x0d.google.com with SMTP id 6a1803df08f44-91786b004f2so414426d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 14:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790630614; x=1791235414; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaYLtQdPOAs5MVg3mEQ2w8dEl9KRvDeu2m3mohc4wFA=;
        b=fVPcxoHrtGuFLWJYt8lKRixTYYsO8ysQcSwiJxVjvB/+mYWMT/lBS4a9GU2Rhwq81L
         SFIZcr+PSvcohCOeozKqipS4EeHJd1G3AIrW+1UjjDga9aJ2oRep7XKztWuLSgFDCswP
         /6NnWLD8xL0s8U3KnVTtnzoJv8kTaumjmjPK2VExPoVXBeGwBKYD97/+DtTYwF+6QBou
         90rPoXQdVuqha6efqnB2uiC5oMwedFZnGScdsdV2A2UWrkr/gj7Io0qWSkN7mBH94Qyk
         Q7qCEas+QL+HED99s0pPUeK0rcgwEiUNIhIrGfWJ+6q/h2GUa8i5m7vP308OmZsNiSqa
         4nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790630614; x=1791235414;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaYLtQdPOAs5MVg3mEQ2w8dEl9KRvDeu2m3mohc4wFA=;
        b=PxI+Ku7DUQn5c5UrEVZKPjLXM0wPI0fqHvqyit1dc5HFflPRt607XnUbTUYHRLhr8f
         KfLRPSzR3XTJLsprOoF/1h4iizOXYo0gdHh7oEAQ8wFuhegN9BwHxL9X/kQ47T6+3Ob0
         QN0ycTpgmHrhgETK0J/hVE78F0z1jA+PgXJXpUM2dcq84yUJzyjCEtwY0FTJ8OXaVp8d
         rJIeh5MjfwaRkmFN1iIV2mqnDa8chb2rknqoRDlXDJL5VS3xe85QzHMI0/3lBqmbUn1o
         uaou/BMFEP8NJEYGVdix7NrIREfqgWj77kmuZdQSAKyHlZe9N+OCx2VP3wvpeH9q1dJl
         A2bA==
X-Forwarded-Encrypted: i=1; AKwUvBxG1B2SZtcXhDkuu/VYBSPGuN1Oitzjc+jqgbDkRJqV8iAAg92IBW8hsZ+qB5a7UrWJJvb9Mth6x0MvOdK9JA==@lists.infradead.org
X-Gm-Message-State: AFuF++lPHKRby/tEdNvAPnZCTr+4Ki6eCddhpnRXmYnbTSUU6qUdTUwH
	FuTqFlP5YuMZbpinOjb0w7Elc4bXqHOLHfiZY+0wBn5sbl5CqBnMV0t8CoD7FnH3kbE=
X-Gm-Gg: AYBFou2r3fnwpYnYL9ecU8UFEVtFQ2p3/sqB14l77rzBakmH4kq7ZKRs+jRRo480ejD
	Xg6b+6/04VMbVMEVvqiN9iB9m0/Mw4K4b2o1mqAR9BiRvF98nt4hV0hYdKcEzQJsAc2s6E30Idq
	SfvuoWfTFJwev9YOm2OHR+oawPFJlNDwvjriH99ch1O0T970mC1fZ5/OK4j1kJon0LYBbA/K5a2
	xXnHYVDC9FVF90Y1WUX9TqmTHKxtpFFu1memP8yaqIJRSfvuuEN4lw0yUFbh0xVtDpaBuYbaqO0
	oUBeu5oJ0o6nwV38JQQp5FMJl6cXv1368LMsbQf2URgJYnJjV/6z+nRb5OEhS3XmI9FJaNjGQgC
	ycsKUc2me//8JeMGOu6KQyJ6sUh0pyUKi79+Owgvr6Pi1G0NBrs97Pu9BgDBzwOKcQ4H9gacWZQ
	e4F/1nj853xGTQUeAEewhekSnLEnsG7ko0LN1rQnjT6st5JkT8vFz+sTl0rj1h5JHCLeSShb3Sb
	Eomv72/0rYfdw==
X-Received: by 2002:a05:6214:1308:b0:90e:9aa2:5169 with SMTP id 6a1803df08f44-9142f6440e0mr233721456d6.7.1790630614149;
        Mon, 28 Sep 2026 14:23:34 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9144e8c132bsm58091816d6.41.2026.09.28.14.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:23:33 -0700 (PDT)
Message-ID: <1cf92b98383885f2e58431ab520efb242bcb311a.camel@ndufresne.ca>
Subject: Re: [PATCH v10 3/3] media: mediatek: jpeg: add compatible for
 MT8189 SoC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 sirius.wang@mediatek.com, 	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Date: Mon, 28 Sep 2026 17:23:31 -0400
In-Reply-To: <20260720062829.7343-4-jianhua.lin@mediatek.com>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
	 <20260720062829.7343-4-jianhua.lin@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-XXMA3sGS6EjACn9YD7p9"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_142336_070399_D01F0BE9 
X-CRM114-Status: GOOD (  15.91  )
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


--=-XXMA3sGS6EjACn9YD7p9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 20 juillet 2026 =C3=A0 14:28 +0800, Jianhua Lin a =C3=A9crit=C2=A0=
:
> Compared to the previous generation ICs, the MT8189 uses a 34-bit IOVA
> address space (16GB) and requires a single clock configuration.
>=20
> Therefore, add new compatible strings ("mediatek,mt8189-jpgenc" and
> "mediatek,mt8189-jpgdec") along with their specific driver data to
> support the JPEG encoder and decoder of the MT8189 SoC.
>=20
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483081..14f2991a4053 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1868,6 +1868,10 @@ static struct clk_bulk_data mt8173_jpeg_dec_clocks=
[] =3D {
>  	{ .id =3D "jpgdec" },
>  };
> =20
> +static struct clk_bulk_data mtk_jpeg_dec_clocks[] =3D {
> +	{ .id =3D "jpgdec" },
> +};
> +
>  static const struct mtk_jpeg_variant mt8173_jpeg_drvdata =3D {
>  	.clks =3D mt8173_jpeg_dec_clocks,
>  	.num_clks =3D ARRAY_SIZE(mt8173_jpeg_dec_clocks),
> @@ -1899,6 +1903,38 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvd=
ata =3D {
>  	.multi_core =3D false,
>  };
> =20
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
>  static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata =3D {
>  	.formats =3D mtk_jpeg_enc_formats,
>  	.num_formats =3D MTK_JPEG_ENC_NUM_FORMATS,
> @@ -1938,6 +1974,14 @@ static const struct of_device_id mtk_jpeg_match[] =
=3D {
>  		.compatible =3D "mediatek,mtk-jpgenc",
>  		.data =3D &mtk_jpeg_drvdata,
>  	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgenc",
> +		.data =3D &mtk8189_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible =3D "mediatek,mt8189-jpgdec",
> +		.data =3D &mtk8189_jpegdec_drvdata,
> +	},
>  	{
>  		.compatible =3D "mediatek,mt8195-jpgenc",
>  		.data =3D &mtk8195_jpegenc_drvdata,

--=-XXMA3sGS6EjACn9YD7p9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarra1AAKCRDZQZRRKWBy
9PgyAP90ID6nr8DXz9EU9G9cUMSWNsFKmJUohZ0RKC19B7xjVwD/WygXzFMIdb/P
AAfRq3LMsOABefslze2ZwSqMr6V7Vgs=
=UgZf
-----END PGP SIGNATURE-----

--=-XXMA3sGS6EjACn9YD7p9--

