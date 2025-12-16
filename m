Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97658D637DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 21:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1hVF7LpvbkkuKE9m+RYf2cnRUEh77RSxKXBsc+XQp8=; b=Tjkq7A4cyuS2ypPP4zBOCDeCMu
	rhgHJtLYHEqa8Z//hKn7tbYapFtRbt3JQs768mpMf+kDb8l7H2H90nQV3iUdIRpAP/lnQm6DfBtaw
	WdCIqygSw1u66YjIw7Kr31gFHlqI/Q6NJi0HAxo2TyAWcd/GwK75YccMAqeIslXr4xa+X2ATyn65+
	OQyP1aorAMnp2Y5h6SsBCNGD23KQ8e9wgkMuiZVXNkRTkxtR30+FQH4Lp3Vgzxm2Q1Nvd5mOAIumb
	wXfjzLWTvkYNPVKersKR9C6b9YxCPbOa/38FQO9gXj3/R66yBhr5EavsF+JYtcuChG07mIje2Xhd5
	gh47qmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcpV-00000005r8c-27UJ;
	Tue, 16 Dec 2025 21:43:37 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcpS-00000005r7h-0h9b
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 21:43:35 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8b2627269d5so517560685a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Dec 2025 13:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765921413; x=1766526213; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b1hVF7LpvbkkuKE9m+RYf2cnRUEh77RSxKXBsc+XQp8=;
        b=UeazhK3Sb5enjNWsggSPYBdHimyRjD9fj8NjBOwx1tTbdumGJ9nOqdRgA6Iu3AXDCo
         uEl/LlZkv3z1I19KxJt1RaRmHaMGhC7DfYiqU4NQTSknVlEh93cD7IJYvOgbqYJN+P4a
         vLar8AMy1/7IyyIWHIceAmSv0YEgbjNUnrqDaxLoKvZct5SCKQGcehn0LJICsavBlXdU
         ZEyEZKOWD5aG4agk4K1hcgPl5jpyHPKVdLIwIsShw+/j+WkD2bdAeuUrbWtSkLJRIvLy
         XVrfE+WRUFNtOfdHpcoQYxr6zQfHrZF7XMtEkin0ax58esl8KJnrDjPI+vpREKEs2Ztx
         nokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765921413; x=1766526213;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1hVF7LpvbkkuKE9m+RYf2cnRUEh77RSxKXBsc+XQp8=;
        b=hOhR3Rm2ExKdN+h6U8l26a1CRPvdBgI2TL9soaWbd6xrpIn602CIBmxpPf6hSqh4GE
         px0vZJr2T7fHvtm05U64qpaCVAyFrYvwCfvoviDOyxFqQxBnlLpoLu627kwA02YQH+nL
         yOyN/xiA3cQXf9A5EzZvd7thg5rzFb8AlWiXWzfOV1iW3sxmf2XjFd5j0bSgiPweDz1+
         0xjY+0nsbLgkqz+Ek9mJo2ha79zlFaXmXPWxRgF5eGZJ553eHaW+eQ9G9fazqmSCW+/Q
         IgVq3dEgvIKGZnV/+hNPG8pqEenSmY2EB+gcDOaPxH9Ak1Vi/mPFNjx3bmlowmHwkKfr
         ayvw==
X-Forwarded-Encrypted: i=1; AJvYcCW+4FtVrU/O6TbNLc5thR/NskQh/JWmZrBzwTkOyeX+OLGVc2vOMAO37kPftu70IQH4gdQlh+Vx6iiYxko8Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhkxq5qSSrSt2xCCdGsjuUqs/V+lqchWs7Ui52tsv4bblvcboI
	TkBmMsi3WxKki+S/0jXLp8vZIe9doxD29gaNbLIzDSnGV8+QdfRMYOosfgOfn0oSjxA=
X-Gm-Gg: AY/fxX67ssBkMZw/ky+505bUnLjvcNl9w5DxBtxWIYOWVemrfoVn/gXHF7hkWpwd/Li
	WdzJlbH5VLadOqbok8gvBlX3nmPXJXS25GTCzG3MSUg5is2yV/Y5j6CjRJWoAN0phcwhhdw8dk5
	xU+koPhZR49rtj+/pzsEkgIPS08mFuY1HFUp2zEYoQrl/fDTPDlqY8AbZQjFo/mba5+lLqLpkuU
	w6szguuPAF3yFIoIUl9dZOd6DsRX6DuaJk93yi7F2UGSc4C27gRS0/XNBCOd32wpCt90X4HJglB
	FJNri0AN1XReuf/d5ATUUca/c0Od4HLF8rk9AN7almPBW9NCAuqSgCNNXHFw7MT7AhZyQDKEH79
	X6Mdsw2PRR5O431LkrtPZ3TdoMqxOryvmyTpZ8HeXOC9YEagxOykXZWXBAjorIRpz4OviRqCREp
	RPH9JCrq+gKuKMrW3T
X-Google-Smtp-Source: AGHT+IHCVAnsdhFi8VkMSKLmu7Ku3KLARd8TeNT/vK47QyRUaJG+LTfRi/IKTHyD/KvPom88nmKrrw==
X-Received: by 2002:a05:620a:4112:b0:89f:2d97:98fd with SMTP id af79cd13be357-8bb399dc444mr2151909585a.2.1765921412932;
        Tue, 16 Dec 2025 13:43:32 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30d86a2dsm265456785a.15.2025.12.16.13.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:43:32 -0800 (PST)
Message-ID: <a8376a71b87cc8944bf05be3bc45dc2e4fe2764e.camel@ndufresne.ca>
Subject: Re: [PATCH v11 08/12] media: mediatek: jpeg: fix remove buffer
 operation for multi-core
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:43:31 -0500
In-Reply-To: <20251202094800.6140-9-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-9-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-Si22i6HkJzRfHSqHC37A"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_134334_207976_FD981CAD 
X-CRM114-Status: GOOD (  13.20  )
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


--=-Si22i6HkJzRfHSqHC37A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> move remove buffer code to spinlock protect area for multi-core

Perhaps:

Move calls to v4l2_m2m_src/dst_buf_remove() outside of the spinlock protect=
ed
scope.

And perhaps extend in why this is needed. Deadlock, bad lock ordering?

>=20
> Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow"=
)
>=20

No blank.

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 10 ++++-----=
-
> =C2=A01 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 9233bbfe2d97..da1ca494ed4b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1665,9 +1665,6 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0		goto enc_end;
> =C2=A0	}
> =C2=A0
> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> @@ -1685,6 +1682,8 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 &src_buf->vb2_buf);
> =C2=A0	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> =C2=A0	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
> @@ -1767,9 +1766,6 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0		goto dec_end;
> =C2=A0	}
> =C2=A0
> -	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -
> =C2=A0	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> =C2=A0	if (mtk_jpeg_set_dec_dst(ctx,
> =C2=A0				 &jpeg_src_buf->dec_param,
> @@ -1794,6 +1790,8 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				jpeg_src_buf->bs_size,
> =C2=A0				&bs,
> =C2=A0				&fb);
> +	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> =C2=A0	jpeg_buf_queue_inc(ctx);
> =C2=A0	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);

--=-Si22i6HkJzRfHSqHC37A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHSgwAKCRDZQZRRKWBy
9JcnAP9X9/KPI6GsErRhlqFgw3okba30C65KuHLjIZqWoee34gD/fbQFW9sQBK3S
ex/e1Ql3MM0wQLFqMGzHvi8lUaErCgA=
=L24+
-----END PGP SIGNATURE-----

--=-Si22i6HkJzRfHSqHC37A--

