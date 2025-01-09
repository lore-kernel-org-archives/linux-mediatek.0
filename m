Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B661E7719D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5X3Tmvihn3grkA7Jge4RjfqiSvPeilgE9yOD+d9FpVI=; b=Al8CUi2aWeA1ujbRNS0W3TfnLE
	MmyMEgGmPv2vuZAtqj3AnbhBBsn1mFAK7Eb87b4QL4Rabazly11wJ1G4+z7DS+FDdlzARmRT7SGk3
	AbbIsT73I88+6WbSiexEqR3J9zYZkL7lgIGk2Yci+ly+V9t1EQum99V4lJ2D0NY2OqeYdH3olnVls
	ZqygBWWvJO9LDhxQmal9ltXF2arTwJtD16/z1pSZ3Y4XbMBs07pFR6jhiwPSTqNMbWnxyBqB263j/
	JHlXt9es27cVG6WVNoBj67KkvM0a6iMYu2gkRNPIz9pGa79YxR9leDG8+TsM5+hvQrCqGUJZuXSfz
	/phXIH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1V7-0000000DVdW-07MK;
	Thu, 09 Jan 2025 22:59:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1V4-0000000DVcv-0O7E;
	Thu, 09 Jan 2025 22:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5X3Tmvihn3grkA7Jge4RjfqiSvPeilgE9yOD+d9FpVI=; b=s+jwsQH2++ZJTa21jBBjugQMXI
	4bHOZkHr3BtbA6u/uOhHobPv3MGeFWhNFGUl43iw9TYIyTjmoijwv6stOdPuOX44mYtM+Ex4veIlv
	GanP8Ltk9SSPFArY9HIjzDL6w9HBmiDH9lkAf/YRbJ76vQtfeMTBh+9CdrFBgxC6jT1PLksF27MCM
	uT5h6cp1P/vX38GEwJikltALOY4zAv1uVLPRdaX6J8i+zNB6LmK+4A346bu7woaR2Pb1GBGscGht6
	qpjxlF/C8UEv09LkPOGTvCxTCmWsQsAVjWgo7DBUgDUT6zw9zcZF7Od+phqWlT6xPgO3SWYExc5bS
	MfLPLsiA==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW1Uq-0005mI-C2; Thu, 09 Jan 2025 23:59:24 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 19/25] drm/rockchip: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Thu, 09 Jan 2025 23:59:23 +0100
Message-ID: <3227546.fEcJ0Lxnt5@diego>
In-Reply-To: <20250109150310.219442-20-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-20-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_145938_152774_B6C834CA 
X-CRM114-Status: GOOD (  19.09  )
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

Am Donnerstag, 9. Januar 2025, 15:57:13 CET schrieb Thomas Zimmermann:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch to a multiple of 64.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>

I've looked up the patch implementing the new functionality - patch2 of
this series [0] and that looks really nice to get proper helpers and not
having many drivers open-coding the same functionality in different ways.

So for the Rockchip adaptation:

Acked-by: Heiko Stuebner <heiko@sntech.de>

and looking forward to this getting merged :-)

Thanks a lot for working on that
Heiko

[0] https://patchwork.kernel.org/project/linux-rockchip/patch/2025010915031=
0.219442-3-tzimmermann@suse.de/

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_gem.c
> index 6330b883efc3..3bd06202e232 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -9,6 +9,7 @@
>  #include <linux/vmalloc.h>
> =20
>  #include <drm/drm.h>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_dma_helper.h>
> @@ -403,13 +404,12 @@ int rockchip_gem_dumb_create(struct drm_file *file_=
priv,
>  			     struct drm_mode_create_dumb *args)
>  {
>  	struct rockchip_gem_object *rk_obj;
> -	int min_pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> +	int ret;
> =20
> -	/*
> -	 * align to 64 bytes since Mali requires it.
> -	 */
> -	args->pitch =3D ALIGN(min_pitch, 64);
> -	args->size =3D args->pitch * args->height;
> +	/* 64-byte alignment required by Mali */
> +	ret =3D drm_mode_size_dumb(dev, args, SZ_64, 0);
> +	if (ret)
> +		return ret;
> =20
>  	rk_obj =3D rockchip_gem_create_with_handle(file_priv, dev, args->size,
>  						 &args->handle);
>=20





