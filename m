Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DD4D637BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtO3mBnlJngwwd/+oPp34lwyxlbeQ/BrynEuE59imH0=; b=ceSMa4qbhZpCXiFX/xPzTmm4dL
	h2qZcpH9Reqp83jwJYjumHh2zybdhg2a3pdEzdV+JRIIisfGXKN59DyFAM4qp/X1kcnjtvPv5fqKK
	mTLRztZscokigX6f0wa9IxoQp6gB3WbeOsbSZm55noudbQf/Go6tLgWSd4DHDmYpKta89JGzpSiQ4
	CJVcqfFwNkDjSg+S2VbgNJ7PMy6TU80Jce1cXXtcWihQcnE/QhkcfWpuSDjPVpDHCWQNUUScFmw23
	+64KqAyghb9/XAHlWKBzq0dXIS5p1yPE41hg0uV9rnWEvfPMMonCsv5J8zSwoPMhdZwh1qhdqa9YK
	ppfW39Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcjG-00000005qkH-3Ldv;
	Tue, 16 Dec 2025 21:37:10 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcjE-00000005qjZ-2zUh
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 21:37:09 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-88888d80590so26405416d6.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Dec 2025 13:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921027; x=1766525827; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GtO3mBnlJngwwd/+oPp34lwyxlbeQ/BrynEuE59imH0=;
        b=CNz/IzldSmRKvTMfKsZ+ytIK9B0tF7EU/gnxnVIikxRx4m55H9rxcRAy4ZJTYmLjFg
         mQKGiWgqry3TX3x0VDdFy5SvMDWWcSc0mcZV5zlFEYGzxhln3BOH2enszfNmxQJWbJG7
         W7Xel5y9/07kh4i0sCz/UDTjD6bek4owkyTC2G0NW2b9EAnVoQdtHFtnCifufmTpDgiv
         ckmijGG8DP8rqBe6tHSY9/X9M7mZcWGYnv+A1U3Ym7KAT9nQEtbAK3+YFPirkIcnhKCg
         0cKUygt0QhBpQ3Xcc/Gc+X37aFmq1PKnMbY/HegmfA6dtGcyjz43cKKHl2yPWVagU0sr
         DpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921027; x=1766525827;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtO3mBnlJngwwd/+oPp34lwyxlbeQ/BrynEuE59imH0=;
        b=Nj31Ar3KpelCW+pjwxvRtzOm0u/qhKMc3qvIFEPjD2+j5IbM1+zO6PGk6e7OVgOU5u
         ZzbL93h0NyNiAsRsknNFbmzZdsG+BKPszOjOm5MqZGMQPzLLwyz2u54AFJyYns2NvtNQ
         vtN2HazGo/RaThntkyFSci8ULn1I0uDTSlu3X/f7fFREQEffz4oarZfmHeh0bN6XiN+C
         pL9CoUb24gZFvmsMQGXEgMaSC3F5nfDKjdpEWf3zPhXxIKOnmYpH+0zyTZhyeUBV3Fkf
         ASQcwG3GhOP41qYy+hskcpcfUenfGzdGSlZh1HTJepiHmIDJ9RRX6ByIqAFMCZfvFxyM
         350w==
X-Forwarded-Encrypted: i=1; AJvYcCXPjTzLw1n/DEubqmXhqc9jeEvuADnoY5JFQRzY61lbX25qCwQp+3Cu4VwrjRBem5OUj8cE95OGHuG5+nmcYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEdHiSRplRJWSQsIN/Lp4QxxBhiALpIE5Hr6ZprN+k0JVEypx7
	ylon3ERXr5kmNCBBuRG+9E7G7gfEnaYFj5mAujAIYzOV7g6vCzeXD8MR2PI5u582Ku8=
X-Gm-Gg: AY/fxX4hu2zj5S9LkP5iKjmAtLntpbHM9UyQqEdgr0r8S2q4c9brFRZdsBuHaIHusia
	PMW8tlIhzbB4mPKIAvQGLrOqbjg+uCG1fa/WGXdBA5Hn69+gVfboC+aTbO8gy1STfjdbtNL7x+h
	0KiFsLIKtTPiG7JHUrO5D/egkujXvMP/b2auOhlCSXf5kg7P4MYoE+WQ57pwDrmWQDucPvtD6YK
	8OXoK/ubkrnbLA6qoXrc1ZUAwmOdr5l4bq5HjzLTWOyZ/A62+Wt4FWeZfHJqmD6//YarMdeEJCj
	Y8flMK36tuV/r9EXjinmPGFfqStESAoqdf0wUqSfhJXtfjFUzCOC+Cj+J6zm94PUi7gNfmtBA2i
	AZZWPx/A1JcL2SRG20vqlYbzDI80TmCXEETmiosFSHvQOrE4eGa+Dvoa19kN77vgVJy0SfLHRFG
	zM9oJcS2a5PWkyZ2fd
X-Google-Smtp-Source: AGHT+IFZ5TNFfy7xbJTH9G96PLJ3apFSZllZ5dKBvddlWXLy4lM0DJZEKU1hmri8DCWd/YG4FoqsFw==
X-Received: by 2002:a05:620a:4002:b0:84a:5f9d:a30c with SMTP id af79cd13be357-8bb3a37660emr2397868585a.63.1765921027539;
        Tue, 16 Dec 2025 13:37:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30c91bfasm265781385a.12.2025.12.16.13.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:37:06 -0800 (PST)
Message-ID: <043630a657ff5403b74202f6a856ff4bcfc6a192.camel@ndufresne.ca>
Subject: Re: [PATCH v11 06/12] media: mediatek: jpeg: fix decoding buffer
 number setting timing issue
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:37:05 -0500
In-Reply-To: <20251202094800.6140-7-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-LOhQi3igSxhC90HVoS+h"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_133708_789584_15B71231 
X-CRM114-Status: GOOD (  14.93  )
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


--=-LOhQi3igSxhC90HVoS+h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> move decoding buffer increase code into spinlock
> protecting aera for multi-core

I don't understand this text, please rework.

>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
>=20

Drop that blank line.

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0 | =
9 +++------
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
> =C2=A03 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index e45d7e82b8a0..5ffaee4dcd19 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1746,7 +1746,6 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> =C2=A0	jpeg_src_buf =3D mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> -	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> =C2=A0
> =C2=A0	if (mtk_jpeg_check_resolution_change(ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &jpeg_src_buf->dec_param)) {
> @@ -1755,11 +1754,6 @@ static void mtk_jpegdec_worker(struct work_struct =
*work)
> =C2=A0		goto getbuf_fail;
> =C2=A0	}
> =C2=A0
> -	jpeg_src_buf->curr_ctx =3D ctx;
> -	jpeg_src_buf->frame_num =3D ctx->total_frame_num;
> -	jpeg_dst_buf->curr_ctx =3D ctx;
> -	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> -
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> =C2=A0	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {
> @@ -1784,6 +1778,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> =C2=A0	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> +	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> +	jpeg_dst_buf->curr_ctx =3D ctx;
> +	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 5f1557dafad6..b3142dc9be85 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -513,6 +513,7 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_co=
mp_dev *jpeg)
> =C2=A0				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> =C2=A0						=C2=A0 VB2_BUF_STATE_DONE);
> =C2=A0				ctx->last_done_frame_num++;
> +				break;
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 785db5ba4770..82c971936c4d 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -242,6 +242,7 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_co=
mp_dev *jpeg)
> =C2=A0				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> =C2=A0						=C2=A0 VB2_BUF_STATE_DONE);
> =C2=A0				ctx->last_done_frame_num++;
> +				break;
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}

Normally I'd seek for the context in the code. But I think I'll wait for a
proper commit message, and do a proper review then.

Nicolas

--=-LOhQi3igSxhC90HVoS+h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHRAQAKCRDZQZRRKWBy
9CkJAQDFF2fMiQe1Z/KUSsnqSHOjrR++9jQ8kibQtTJ7ib9yMQEAoTpMq+Kmn3Lu
aOyRrlUky49dw8xZ9yef7ZluPkVGWg4=
=7UUl
-----END PGP SIGNATURE-----

--=-LOhQi3igSxhC90HVoS+h--

