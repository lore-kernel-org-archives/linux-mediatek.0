Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687F606A32A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cEsayba7;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eRco/R1g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=; b=cEsayba74LTK7PiIVIB2Kpc0jR
	msaOPbFg4iW388KfNlhYswZa6X+pvCu09Y5Eyqw2+GGbkF18bHjk9931Gkx7QEnSp6EcpIBsSCifl
	sxYPa9l+C2nhNq/f098Yb2c9FqiTBIokhMT+nUOjWqW0LtMmT/63cKSdHwaD7GDbo9lf+rjqne96S
	XbupXlvV8Kl4fTc5fWlu+bpWka4DkBicr9lN77pJannqpYxRZ7CR7Vj0WENfDi+8exXBl+fIK0Yo5
	9jhWXF/IRg7l+b10/NhfNBQ4IXvbEBQmX1glZx+5WxLPDR9R2o+tMNFQIp8uXK8Vz/PJLqDg3+s8o
	PzCfnQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhoo-0000000EcZd-2EMR;
	Thu, 26 Nov 2026 22:19:54 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhol-0000000EcYg-3YDX
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 22:19:53 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-943e8d35f74so730516885a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 14:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731590; x=1796336390; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=;
        b=eRco/R1g7FZj/eRzXm24JBcAikUgEe0EC8tT+kOWCrpttFsCbVC8W8dHkGQvmZh5aG
         pgs1aqN/6/d+7e2hcDKm9n6+gLOq2YzS3XvpMA0C5sooTQpZw9cWWIQ3XNdxnkzH1jC5
         yoyyKwt5qyJ6jUacA6pCZzEAN7WyPw9YdSiDJUe8e991OZhI4rMdCuMTKl7wxPyLvDzc
         f1t0y3RQ0BjapWD3IfDlaoIuj+BM02JdIMR36JP0onMndw4/jjlwMHhjes2gu9jmWfRm
         SsdCsdSvTFvQuJvXaGYeV2PATxgftuBVo/Q1sr8oPtS/ruiTWL4VUP+2e/q993UfJPcU
         qqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731590; x=1796336390;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=;
        b=HTnJxen7SRGbWQeQA0DZwB4xDRTt47EXReU1j0EZazQgl0Lxlk2+7vdsK+q8B1Y01r
         XaBYYfnjL9mLGT4W4yQg7Yv6GpYVMeyAU8ziucxajbX/5vRp5fN/9uwYi5HM9MgJ+wMz
         Ynbfj71PE4JwKNpOcsDDbzs4i7gvEn5toj82xToegRoaAMTByLDxmzhic+dmqI3K8zlR
         GnZKxsfQwILuDWf8gNe0AAIoqIyToifR20lO5eSxsgTAf6EYZPBgeNX3T3ygBXWrtyc6
         6mCsC6jRA2GQIp0aZuulzvQifmSmkJ2nfOmdHWzlHwBiLV6pB48PSqAChgkeuRhxZDGi
         hVsA==
X-Forwarded-Encrypted: i=1; AL+hErGblVpv4w/cZLPseq9wMP0h/t5VYuXi0klF1FcGcSaDPQUUIAyYhmfHELfgANbaAsQMway4ZhZCulqZRPsnHQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/hE4CssV2XrSRsyChiedSXnfoQ9H7C7GA+NFloVPyUFcA6q0vf
	ZZLSAwg8KluUZf1vqf2SdtGiZtuKU/4hzJmhgtuRUUcdHWkDg1misqvVqi9VgcSKMKU=
X-Gm-Gg: AZFdTZehp6gaqIzpHOx4G9SLSMKIGPGrZfO2mBx1ErgNUW8aFZjGxGv5KeNfCO5Les/
	35aANV4wvrSx26V3eIcb+ZH7UCtFU+aTr6i7liahnzXAf80mIbashuZLOgg3kWv7k3KCBRhLYtq
	lFGF+N2QDF0vviaJbH4wu6MMuAmN1uXEum4XGmz8fQ/TLL0NH/tKfd5AEfaNAORg/eh48pF4YUP
	D904m/CZnXhMgzKqkUoKeULvuuoM9QNv5abPb/zhStZHAGqc35k820cxAQfBoD2YPii8U64mGHz
	F6PEAw0r/Pu1fCaExb5kBqyUB3LcCPy4HGLz3H8IhTdjbLI6y7yt3wrhHrRit8+RysbFu2RfXgr
	qgPuNo5s9uhMquOPTSicU8EEqwCfZZx8en3U9ghoVqNtbZHjoFl4ogmEs8pQYarlcYZ/Eja4De4
	zki/8P6VgFL1zW/+4lAMhFL+6snj9dEa8DAXlXPVnD5MXQ4UAxRaXsPtLDp/sdlx52WD5WcKbxX
	W1CRIeRSfPQtq3fKdBHU8GEMA0RVViq2N2DP8c/C9IXCPAGROOXFuN8rs2poQh4TuzPzCQx2x90
	yVj88ZS6oXgDuS/xvintSBuHH/aiI9YwMm9g5wMrvkeL4weglIgt3rA=
X-Received: by 2002:a05:620a:3188:b0:947:3673:f902 with SMTP id af79cd13be357-949ba9e9297mr3983731285a.55.1795731590418;
        Thu, 26 Nov 2026 14:19:50 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a09477acfsm454257385a.32.2026.11.26.14.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:19:49 -0800 (PST)
Message-ID: <c2ac221b70cc33e550f550ab21c1a5a5967d4676.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Free encoder controls when
 setup fails
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 26 Nov 2026 17:19:48 -0500
In-Reply-To: <20261103083533.1176842-1-vulab@iscas.ac.cn>
References: <20261103083533.1176842-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-v7c+rvNTZeeZDaQiPqM0"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_141952_022184_7C498FBB 
X-CRM114-Status: GOOD (  14.45  )
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

--=-v7c+rvNTZeeZDaQiPqM0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 08:35 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> mtk_vcodec_enc_ctrls_setup() can fail after creating some controls. On
> that error, fops_vcodec_open() jumps past the control handler cleanup and
> frees the context, leaking the handler's controls and allocation.
>=20
> Use the same control handler cleanup as the later m2m context creation
> failure, and remove the now-unused label. No m2m context is released on
> this path because its initialization has not been attempted yet.
>=20
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video E=
ncoder Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c      | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index 4e4541b2fc8e..dd47feea6acd 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -140,7 +140,7 @@ static int fops_vcodec_open(struct file *file)
>  =09ret =3D mtk_vcodec_enc_ctrls_setup(ctx);
>  =09if (ret) {
>  =09=09mtk_v4l2_venc_err(ctx, "Failed to setup controls() (%d)", ret);
> -=09=09goto err_ctrls_setup;
> +=09=09goto err_m2m_ctx_init;
>  =09}
>  =09ctx->m2m_ctx =3D v4l2_m2m_ctx_init(dev->m2m_dev_enc, ctx,
>  =09=09=09=09=09 &mtk_vcodec_enc_queue_init);
> @@ -191,7 +191,6 @@ static int fops_vcodec_open(struct file *file)
>  =09v4l2_m2m_ctx_release(ctx->m2m_ctx);
>  err_m2m_ctx_init:
>  =09v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> -err_ctrls_setup:

Fix mtk_vcodec_enc_ctrls_setup() instead.

Nicolas

>  =09v4l2_fh_del(&ctx->fh, file);
>  =09v4l2_fh_exit(&ctx->fh);
>  =09kfree(ctx);

--=-v7c+rvNTZeeZDaQiPqM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiwhAAKCRDZQZRRKWBy
9OypAQDmjeaO3tv2K1mt6YGlWFssP0QrnOt96UUjRwEVvDQy0AD+NPHYtKJ2HV/T
EhM1Fwjl1AFFmsIQcqTGIoFBfxMBkgw=
=EM4e
-----END PGP SIGNATURE-----

--=-v7c+rvNTZeeZDaQiPqM0--

