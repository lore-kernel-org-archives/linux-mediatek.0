Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17064C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFQQ7kdKfU1DpkoVCzcuQmRTCSCa1KHacz9MYlr6A4w=; b=qY+1ppSogy0vXzUIxjSiUmrCy2
	kDVo9Gd6zWKLLIaDFvaYdyUvJndis2h1hEL95bqvutm51x1Jt9H6T9+plauqxO1MvTY6AK4hAbG38
	whbpF9n5P/IIt6CAov3FkcnlpAVx8Gdwd8os4GjxLkU+W4XDQ799fVMBtPMbBtsVC6Xk10+vPkuOK
	vtZq7movq2NgItXpd/DrxiAOlQY0SyrkEFhgVJvARqxtiB8ztEdYPELmbMvNrMj3jAB722qjSc0ox
	/eEtYB1AZuDs7EP9Ztefyum1TCtzXtUU+9RYN/NCF3klFvSM4gHSj0zwI+IAR26AN7n+6uPbJhwSL
	jl+ZdtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIhm-00000007iZf-1xwa;
	Mon, 15 Apr 2024 09:32:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIhi-00000007iYX-2ptg;
	Mon, 15 Apr 2024 09:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07A7960B4F;
	Mon, 15 Apr 2024 09:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E561C113CC;
	Mon, 15 Apr 2024 09:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713173565;
	bh=hrn2Cpax6bG0+tBLHhsKA6HphenkfmI0P4jCJ4Nb38M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTO9CrGXjb2iRtX3VcwAqY0jWcf+Q8kFyy3K/cU6keDvqq2q+zQRd87m/PumOKSlT
	 UBLIOMUwLtEuWI2s8KAcwm2cTc+LjwASPSsQbFDJYsNPwSCmCcHS+aqKQ6khKnprMX
	 ynRp1SbmFTCpiRd2rbugH650wz7eqpi9X1RXpPZqEOYV8SE7fIxGeiNiHIJh4Uddmf
	 m0pnLX8zhUU7G6253EQRUFvvD/4yyIEj25K+QzyOl/QmVhaDXVX7ZQU63mE0NJYkCD
	 9n3g/uT4urnwhy5dPdmLylCaigrWWuJdsMKRI+nxWRi4Fd9zzdt/CWSDzewI8UC7yG
	 1W6arDroYB4Dg==
Date: Mon, 15 Apr 2024 11:32:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Shawn Sung <shawn.sung@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v5 1/9] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATE_ENCRYPTED flag
Message-ID: <20240415-ultramarine-oxpecker-of-completion-8a2298@houat>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
 <20240403102701.369-2-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hhxojz7wd43elnlw"
Content-Disposition: inline
In-Reply-To: <20240403102701.369-2-shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_023246_800641_AF60EE54 
X-CRM114-Status: GOOD (  16.11  )
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


--hhxojz7wd43elnlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 03, 2024 at 06:26:53PM +0800, Shawn Sung wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>=20
> Add DRM_MTK_GEM_CREATE_ENCRYPTED flag to allow user to allocate
> a secure buffer to support secure video path feature.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  include/uapi/drm/mediatek_drm.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_=
drm.h
> index b0dea00bacbc4..e9125de3a24ad 100644
> --- a/include/uapi/drm/mediatek_drm.h
> +++ b/include/uapi/drm/mediatek_drm.h
> @@ -54,6 +54,7 @@ struct drm_mtk_gem_map_off {
> =20
>  #define DRM_MTK_GEM_CREATE		0x00
>  #define DRM_MTK_GEM_MAP_OFFSET		0x01
> +#define DRM_MTK_GEM_CREATE_ENCRYPTED	0x02
> =20
>  #define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
>  		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)

That flag doesn't exist in drm-misc-next, which tree is this based on?

Maxime

--hhxojz7wd43elnlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZhz0MwAKCRAnX84Zoj2+
dn3gAYDXi9cjUdHf2aEBheomLq/GUTf8sVV73EPWmCbpiNi2jzl0oe8c+ikVUjWX
5TiuHpwBgPVRTxUq5IhrqZvI3ysT+Lm44XxAlrk1rkAg3qZzilUjJKsvuAHAp7Qa
7fpwnKIfLg==
=wTVi
-----END PGP SIGNATURE-----

--hhxojz7wd43elnlw--

