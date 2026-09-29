Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA72CA5FA7
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 21:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQOfsK+HlKeVCf8Z4OdzeQNNGZLvLEYB73B+IGrPM8Q=; b=S9m4YFKCmKBRsKZPtkUinZ20Ni
	Isub+LbTrFk6UcgqLei0h+nKc4Xa9yd3BmwPzMmzYAImxGLdZEjTeYMDcnVq8fPQXdfndWUW0WX0t
	wOcsylYO3dioOTd/qcIgX7t4OOro1KgNN+aFiDFqhqUGVCRsfm9XWNS+uyyDMm9UpaUidG3Rr05lq
	u/w93Xjg8VrOBtgqJfUK4FVXkCblGqpfrdVrGtD/M0ifahjHhBjV/KeqEZ2FHBrOyY1Km3wwF0wf1
	dshI0LazeXhg+5S4tP7cH1CmQXV2DK2a+HNGdtbsyLiJSdOyBBdoHa4qTBGvMv50Qe9LCKRA90Wce
	9J2sSrAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBewz-00000004Yph-13yr;
	Tue, 29 Sep 2026 21:01:21 +0000
Received: from mail-vs2-x28.google.com ([2a00:1450:4864:3a::28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBewx-00000004Yoj-235q
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 21:01:20 +0000
Received: by mail-vs2-x28.google.com with SMTP id 71dfb90a1353d-5d4b5d7413dso340606e0c.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2026 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790715678; x=1791320478; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQOfsK+HlKeVCf8Z4OdzeQNNGZLvLEYB73B+IGrPM8Q=;
        b=s/56zz8lXDc5/nd7pM02A8uESGEcf8oxGtYMVUywJRrYSoiO7/813TrU4/LExNUxx3
         mn10YhERg9GYtQ2LpL6HHmgwrp3c4kGwgP5+GbAxUQYcinuQVgU2HVUzsVTR5GD3+PE6
         TKfQtwXfkT6TAYrF6pPF8KA8Jc58T3m1bGwGYIkVe+TbZe9ElE+O25FDgz7W+Njt3XpJ
         QVJ7Z05rZC2I2AURruaRTbsycWGAMb+bFzcwpGzpCRgebZ+hdnlG7oNijQfPL7Bz9C17
         KRD5CbOEFXl0iJEUbDhlJf3wxvPGMlszmGsmWCMO4VBCBO73iWG9U3jLkAW6hhcQ/7rG
         xupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715678; x=1791320478;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQOfsK+HlKeVCf8Z4OdzeQNNGZLvLEYB73B+IGrPM8Q=;
        b=1H651k0yIP/dPRqT5dsjZf84dTwJUXSJl1VMN4YBLODt0cGyQ+ut3j6wzttEYb7FNv
         DBog8n/pSdhX8+AZqNPp4q3fLokOw6NDLMHs/OGi6q8Va7e5R9i1lwcEL9D6eKYUskJk
         BLHVgVdPwF8l2cBOdT2faotMhcZWFRnVSBLAiFUw5PhiBPzUlKQ3pV8T0MlqGd5oaIY6
         7wAJmS2WQvNpBWgnW/it7CLwqAbDpned4Mzx+qMSLs7/u6uRGMVvJ8PA/QnaQ5r07RaU
         z5GxYiCnNazDVkqaDma19mpc+H8SviDy4tqbe6PULVYV+/lZy80oHGGiQshMdqBElKlc
         Dgsg==
X-Forwarded-Encrypted: i=1; AKwUvBzZjjTbnw4qe9ea9KeJ+qyQ2WvypFLfUSh1+E/FkDCQioiyyjF+3xOQLsF2XKjzqa/jCiUZrnbBaCQPUKGppQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIszp3tKJjZGQIuIoa4e4H0OLaajEYH+d4yHi/dVyxblJ90g5po
	yIKNtObQnxqZg8fR/mfGO0B8SwRFavMEgo08GgpAuC7z7CZdM5SvwIGKNCJDWU2zfV4=
X-Gm-Gg: AYBFou0mFicSTyZqQ2KOqr2EBPnll1rJKpxY+yQItW51b2AioRcYkConD6yABlltxmV
	/kcqUnaMMgImGORaRrebaTfdYsxaF1VTCCSYNp4gjPIBAHusNLYOTUeAFBuJEr+4Q8PedTm8UmQ
	a+MAEBFBxIDHMwTuPpRsUHlG80u9JsO5DlKgezbltm0OtsjdJKRkd1XC1x/+696AL/dNxqOjAZQ
	Ph34qn/VgSpdhSB6HaeAr19UMvXzlQKa1mxI4sppsFWCnr3RhbBas/iILo3GBw2bQXH2sD9kAZW
	0Pk5n/kjpk5NBkOI0NrPpSUe9jqR8/TsGuXPqdnqreT69sWCGqFwEzp7IVmsg3YUQlyI1ruAb+5
	wr3Fn6F4bK0z0HPzK3ymPJ1CzfN1wtMn1gPRcEbWrtS098ioEZGp6pbr8kc1JuBtpXr/Fl4yvYG
	OW4S/zp6soLo2dYuWDgUB9o15yv+V0XY4sxkIcigshKh8i7cJ7tpC+xSOKS0q6UTnTk2dtCRdT5
	0fzWLJ3NkhmbtjUuHIHGzgc
X-Received: by 2002:a05:6122:1c05:b0:5c9:ae70:e784 with SMTP id 71dfb90a1353d-5d5131cdd4cmr304268e0c.3.1790715678096;
        Tue, 29 Sep 2026 14:01:18 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e778bafasm1226873e0c.5.2026.09.29.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:01:17 -0700 (PDT)
Message-ID: <dd1d9010ad1a3ee11fc38923dfa1252992c2b245.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: Fix runtime PM leak in
 mtk_jpegdec_worker()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com
Cc: bin.liu@mediatek.com, hverkuil@kernel.org, irui.wang@mediatek.com, 
	kyrie.wu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mchehab@kernel.org, 	stable@vger.kernel.org
Date: Tue, 29 Sep 2026 17:01:16 -0400
In-Reply-To: <20260917100247.2145872-1-vulab@iscas.ac.cn>
References: <20260917100247.2145872-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-OaQi5nvPKDU3qCHl6JAX"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_140119_585609_10A930E9 
X-CRM114-Status: GOOD (  15.41  )
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


--=-OaQi5nvPKDU3qCHl6JAX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 10:02 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> pm_runtime_get_sync() leaves the device's runtime PM usage count
> incremented even when it fails.  mtk_jpegdec_worker() jumps to
> dec_end on that failure, which does not call pm_runtime_put(), so
> the reference taken by the failed resume is leaked.
>=20
> Use pm_runtime_resume_and_get() instead, which drops the reference
> again when resuming the device fails.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8c684756d5fc..ed1d5858c942 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1732,7 +1732,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =20
>  	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> -	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> +	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
>  	if (ret < 0) {
>  		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
>  			__func__, __LINE__);

--=-OaQi5nvPKDU3qCHl6JAX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwnHAAKCRDZQZRRKWBy
9E83APwLk0zeKWzQOIGJYqNZSVuM65LfwP9mlNJVQ/ss2bY3FAD9EhLs8d7/vbqz
J2u9T+/yffmnP0xvF8G43YoE4lnGZQg=
=AlR/
-----END PGP SIGNATURE-----

--=-OaQi5nvPKDU3qCHl6JAX--

