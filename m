Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C33CA5FD4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 23:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2Ct0/bWmZg0045LkT8XFFR+cuxnWwmmUDTjfb+QZ+I=; b=Xqt9dSE3jU/MDv4NHQb4hNSm8+
	8u7PNFCnPOnrmv+u8I7aeZ27UlhLvvjMa7SAgjqKmT5Ak+6F3xJJDbA5Po9+6AwZMDEHDIviRH1Xm
	ODEJCKZXcxh2UNax/geupdvIONMsefOLkUq0jHJlSq720bQn5hvlwnOpdAJJ2rMAF+eHFbJm+yMib
	PaP/9W502TSWByGLtWEVascd+0O6KZJ2Lh8yXGvO0e9sBoZ3QpHuVZ9FLYSQnO35Kon4S74jre5/1
	URXR7VJ9Rv872ZP2+cUkbktiU0ScWOMVBFe3Eiqf5iwrnGDFcyv89tVHUqyZj4MwcX7gmwl5u+EQu
	5704LJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCQ5y-0000000AOrs-0C1t;
	Thu, 01 Oct 2026 23:21:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCQ5x-0000000AOri-2q65
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Oct 2026 23:21:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D7E643DEF
	for <linux-mediatek@lists.infradead.org>; Thu,  1 Oct 2026 23:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7791F0089D
	for <linux-mediatek@lists.infradead.org>; Thu,  1 Oct 2026 23:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790896905;
	bh=P2Ct0/bWmZg0045LkT8XFFR+cuxnWwmmUDTjfb+QZ+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Paq0/jFcHy1N3vQSR8Ap+EoYMiP/a2ijfiCc9AnRW0aIMmF/yssXWVjTz0R7dmwAS
	 oyvLjnvaTsqQyeXa0HQZqrwUnY3BP/Z/uSw01UUZ++gFQR9owLmLfqODsKIYMl7FAO
	 zgQ+h/YxN/USSE5g52BNd5yf3Ld8gESl4qqr138TvCzKkNQkomMYGhTcpm7qHIA0Gk
	 e+VoZM2vAU3yC2h3G21hPsgm7zGqn18P8UJJMyAsKGh44nVvQKq0KOUb1/k5eMdEbb
	 2xTIy+IXPnIzq5xRHjN7G4ZlF49Iqfhh6k58p12bEAdrHloqkvBlEEb1ZpBoYxP+vX
	 8aa9vJ/YHnrpQ==
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-344447f9c3dso4136319eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2026 16:21:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzty4Yb8JYKgt6UandtCCvKXGN7gSpBCxTsuswzbzb+feExB+CoXDy188Z69CkSqTObA+gdj1vvIbJv9DsZ5w==@lists.infradead.org
X-Gm-Message-State: AFuF++kEk6z5qwb8fRrFVzEWCPEUUy6Z1GQoFEWP5Wq+OAvKOEVbltU9
	oFGchd/Ahh6bCG7JCu/C9Cw7pPA0EufS2U54xuJcbFGJ/WR2UUZl2zCk2bbBf9CmXnn5JNrBOU9
	WpI1HVeEs26rzE5FghD5kHvladgDT9w==
X-Received: by 2002:a05:7022:f515:b0:143:297c:82e0 with SMTP id
 a92af1059eb24-14f5bffa779mr757615c88.32.1790896904343; Thu, 01 Oct 2026
 16:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260921131156.403652-1-lgs201920130244@gmail.com>
In-Reply-To: <20260921131156.403652-1-lgs201920130244@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 1 Oct 2026 23:21:30 +0000
X-Gmail-Original-Message-ID: <CAAOTY__kLYfpbyD+nQOmdGPu8Qm_aC5BjsOQzYGVnQvD0WGP_Q@mail.gmail.com>
X-Gm-Features: AclHuK-E9VLgmUd_-lnnf9Q-aBBowJwr-pxvO9-FXnzpDzOztdORiwXC2sJecYk
Message-ID: <CAAOTY__kLYfpbyD+nQOmdGPu8Qm_aC5BjsOQzYGVnQvD0WGP_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fix ovl adaptor platform device leak
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Nancy.Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Guangshuo:

Guangshuo Li <lgs201920130244@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=882=
1=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:12=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> mtk_drm_probe() creates an OVL adaptor platform device with
> platform_device_register_data() when the display pipeline requires the
> OVL adaptor.
>
> If a later initialization step fails, the probe error path releases
> the DRM resources without unregistering the already registered OVL
> adaptor device. The normal remove path likewise leaves the device
> registered after the DRM driver is unbound.
>
> Keep track of whether the OVL adaptor was successfully registered and
> unregister it on probe failure. Also recover the platform device from
> the stored DDP component device and unregister it during normal
> removal.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT=
8195")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index c86a3f54f35b..d176e6496aa7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -1060,7 +1060,7 @@ static int mtk_drm_probe(struct platform_device *pd=
ev)
>         struct mtk_mmsys_driver_data *mtk_drm_data;
>         struct device_node *node;
>         struct component_match *match =3D NULL;
> -       struct platform_device *ovl_adaptor;
> +       struct platform_device *ovl_adaptor =3D NULL;
>         int ret;
>         int i;
>
> @@ -1205,6 +1205,8 @@ static int mtk_drm_probe(struct platform_device *pd=
ev)
>  err_pm:
>         pm_runtime_disable(dev);
>  err_node:
> +       if (ovl_adaptor)
> +               platform_device_unregister(ovl_adaptor);
>         of_node_put(private->mutex_node);
>         for (i =3D 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
>                 of_node_put(private->comp_node[i]);
> @@ -1214,9 +1216,15 @@ static int mtk_drm_probe(struct platform_device *p=
dev)
>  static void mtk_drm_remove(struct platform_device *pdev)
>  {
>         struct mtk_drm_private *private =3D platform_get_drvdata(pdev);
> +       struct device *ovl_adaptor_dev;
>         int i;
>
> +       ovl_adaptor_dev =3D
> +               private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev;
> +
>         component_master_del(&pdev->dev, &mtk_drm_ops);
> +       if (ovl_adaptor_dev)
> +               platform_device_unregister(to_platform_device(ovl_adaptor=
_dev));
>         pm_runtime_disable(&pdev->dev);
>         of_node_put(private->mutex_node);
>         for (i =3D 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
> --
> 2.43.0
>

