Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10FE60A2615
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FuItu5kz;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HjlA8VJf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EvBI1HOBk5so1Ik7KOrp+QzwLFuoYR+tPWzAi8hv8nI=; b=FuItu5kzLf9/ef9GnPtbOOpfCw
	BToyjn9rNi6HNeFR1MNmHnUEffdK1JIgyck03h8OLadpw1PDJUvhWeQAgzg3/Dy/ZjO4PgjH1oMxf
	rKWFd9lOmkTX6YpbeoH1sq/zJmtzJArwFwR+Nz8TYZrcvPJFV1TYpFj7zOFWZecPJT0vOXWMGfsRX
	U52Fy6XKgGugAV0Hl1Ng/9R1qJb6m1vm2QaP52xdOSPgNFvOjqe+H72v3vLBxQM4w6Mk0LLsRDErw
	64xX25Ox9p/Oh9SkFWPRrEw80htbirfJpO6SYq8rAglyEGvxtlPz3N213/XqvvrRObWKSoX8oDSdW
	zq2xujuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5dy-0000000CnQA-22tE;
	Thu, 19 Nov 2026 17:09:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5dw-0000000CnNy-0mys;
	Thu, 19 Nov 2026 17:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795108189;
	bh=s9hbqJNmvcktvQ/jMN3/lfoazKpFldfe3uLAwKl70/o=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=HjlA8VJfufD0syLtBk3fw6KnnsV9UNLM7CPI9Xb/oGzYs+Du9R9QTtcguDN03lLHm
	 I2jhsrH5hTTniTIl4OMosX9iVVvEhVS/FC8JD7H6JgOREI7ku7HQss/1+sOsRGL8MA
	 LtCnFcVfKNID7vFCIcOz5X7kb7KYNbbMvDE6dcQqQ+GMreMdkia46KhiU7r2eMwnIV
	 WCcWxN7X3/u+oEFWa1HEdpPHpa2Y9SQqHXOA2m/69Bqk0dMQ9HbdNw2CnwPWTdTQ6l
	 d5GH9AdHyt6Of6g/xvnwftWaQ5lXVV18vovhOb4dyyNTYt/PbLioDi8QPd2hRST7eU
	 M8nFc9Xld1VmQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BE4317E0406;
	Thu, 19 Nov 2026 18:09:47 +0100 (CET)
Message-ID: <7af073fd2a783c58543ff89103b49c0fd139b8c9.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: mediatek: vpu: add watchdog handler
 unregister helper
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Minghsiu Tsai	
 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Tiffany Lin	 <tiffany.lin@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Fei Shao	 <fshao@chromium.org>, Tomasz
 Figa <tfiga@chromium.org>, Haoxiang Li	 <haoxiang_li2024@163.com>, Eizan
 Miyamoto <eizan@chromium.org>, Enric Balletbo i Serra
 <eballetbo@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 19 Nov 2026 12:09:45 -0500
In-Reply-To: <20260720085756.465667-2-lgs201920130244@gmail.com>
References: <20260720085756.465667-1-lgs201920130244@gmail.com>
	 <20260720085756.465667-2-lgs201920130244@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Pehf/38Oju4fgimGiob5"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_090952_404687_1F617EA4 
X-CRM114-Status: GOOD (  17.84  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-Pehf/38Oju4fgimGiob5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 20 juillet 2026 =C3=A0 16:57 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> VPU clients register watchdog reset handlers with private data owned by
> the client device. The VPU driver currently provides no way to clear a
> handler when client initialization fails or when the client device is
> removed.
>=20
> Add vpu_wdt_unreg_handler() to clear the reset callback and its private
> data while holding the VPU mutex. This allows clients to remove stale
> watchdog entries before releasing their device references.
>=20
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c | 14 ++++++++++++++
>  drivers/media/platform/mediatek/vpu/mtk_vpu.h |  2 ++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..a2b937095248 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -437,6 +437,20 @@ int vpu_wdt_reg_handler(struct platform_device *pdev=
,
>  }
>  EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
> =20
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
> +{
> +=09struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> +
> +=09if (!vpu || id >=3D VPU_RST_MAX)
> +=09=09return;
> +
> +=09mutex_lock(&vpu->vpu_mutex);
> +=09vpu->wdt.handler[id].reset_func =3D NULL;
> +=09vpu->wdt.handler[id].priv =3D NULL;
> +=09mutex_unlock(&vpu->vpu_mutex);

I just read sashiko report, and I tend to agree that this fix is incomplete=
. I
think though you that you can just extend the critical section in
vpu_wdt_reset_func(). Add comment that vpu_mutex is helpd when reset_func i=
s
called, might spare someone a headache.

Nicolas

> +}
> +EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
> +
>  unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
>  {
>  =09struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index 3951547e9ec5..2ccb481a04cf 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
>  =09=09=09void vpu_wdt_reset_func(void *priv),
>  =09=09=09void *priv, enum rst_id id);
> =20
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)=
;
> +
>  /**
>   * vpu_get_vdec_hw_capa - get video decoder hardware capability
>   *

--=-Pehf/38Oju4fgimGiob5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8tWQAKCRDZQZRRKWBy
9CkVAQCaxVutZXPhsny39ejIDbenFzNsqModgSF7tuaTtaPlYgEA5xKyeTsyKJnf
vgi1Q8jJKypwz1sOph0DseoT4PolMAw=
=yZTa
-----END PGP SIGNATURE-----

--=-Pehf/38Oju4fgimGiob5--

