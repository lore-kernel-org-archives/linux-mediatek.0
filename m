Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F015CD4F39
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 14:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghJU4+sBBeNZalbCO/6Wmyn1b4SsHB/Hv9J6qbQkDwk=; b=q8ZhDM1wMoPko6MYWK+oeZ0v2c
	CCh5Dc4cOmk+zwh+il9cuR5QiFrDC67EvI81p8t6YNXXqu9po4QldPL64jj2Jq5HI7CPiSr9TWUUm
	boW3ThH5FY5/TmW7lcHTw7azDwbaKSGfFyFmzzUVt8yM+rphDnGzZXv+IBYFPR9MOdjqm88GZyz/e
	ig9OU8aQV6zdWhWkM8bvPG4uyO3hCkJPCBvayFMhTkSdydEK1Q9zlZs7urSlhM5aVi6/BLdjHoGLJ
	SJkfPtfX6OOkpt3ue95aSJoOSlO/YASQOdALMBIXSP4DABQi20D2A7NIUzQdgDUACaKpwMJy5GDIJ
	Pg3d0e9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAxp-00000002zJe-411h;
	Wed, 13 May 2026 14:53:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAxn-00000002zIh-1CdH
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 14:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA8FA44510
	for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 14:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B8CC4AF0C
	for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778684010;
	bh=LMhdgoi3njzJotgYcklPor79GNIBzJsVfXsl3qI6Kk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TKAbkL06NRIUOFtZQUCIOXnZYnSu80pwRDQO94B9hL9he39AJIPBvovzEvwVfteaI
	 itY8WTQZ60PL4ARlaBHG3ACL/78bajJ6pRjpeH1PFaHkqkSVXmoIuQKHlvT0jxN6Ov
	 0YYAZpY7VdalRcNXYaI3UnixyRgxVx00phYd0xKKaqHzPslG3vMjNv8XMv/SpI9qGI
	 80tkQl04CWSpuNKmQucrsD4rY+s2Hadw16F3jCpfyKswCiSVVGjnPgydcP/SL1GSCF
	 XZnjO5LlhQx8oPd34xc/ZnIQWBQE+3vDF0deqIGy9e7baN2Nk4KaoQFlpSuQ4d1OE8
	 8De+FnUxhCIzw==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-134ac81c445so1286334c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 07:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/P8atllMo8EEEOQvz+1gdmUWS1fCsP3JVI4pK7y6WAu6G94qgFUiyc4ea82v+oboMqU+vkt42BENL6LW5hfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLnoGdlohzBIVp0j4aVi9MEH8MTm4DDEq0/mhVd7sPOvHUHthq
	iHtfrEKxDBcTKsmEiefrP4eOtVI8ZRRffg967bO2bVJL15KXbbBR4m1Wqs/LWHrTMIgnOIO4B8T
	Zx+3VcO1vzQnEx/JotRUttYx5UG5rpQ==
X-Received: by 2002:a05:7022:43a1:b0:130:5ec9:7ad0 with SMTP id
 a92af1059eb24-13436bb11f1mr2400986c88.41.1778684009895; Wed, 13 May 2026
 07:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260331002357.7995-1-rosenp@gmail.com>
In-Reply-To: <20260331002357.7995-1-rosenp@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 May 2026 14:53:17 +0000
X-Gmail-Original-Message-ID: <CAAOTY__MJGamrOAENzdvzL3gVMdhon-yYGV8rfvsE_euG2jw0A@mail.gmail.com>
X-Gm-Features: AVHnY4LYLjxIAceAyLRSTOkEhrTPNAlqPiXtwzu6SK6gKwAm8kNQnVmKIaBiuH0
Message-ID: <CAAOTY__MJGamrOAENzdvzL3gVMdhon-yYGV8rfvsE_euG2jw0A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: simplify mtk_crtc allocation
To: Rosen Penev <rosenp@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_075331_363172_F90839F0 
X-CRM114-Status: GOOD (  14.87  )
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

Hi, Rosen:

Rosen Penev <rosenp@gmail.com> =E6=96=BC 2026=E5=B9=B43=E6=9C=8831=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Use a flexible array member to combine allocations.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index fcb16f3f7b23..914841d2396e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -62,7 +62,6 @@ struct mtk_crtc {
>         struct device                   *dma_dev;
>         struct mtk_mutex                *mutex;
>         unsigned int                    ddp_comp_nr;
> -       struct mtk_ddp_comp             **ddp_comp;
>         unsigned int                    num_conn_routes;
>         const struct mtk_drm_route      *conn_routes;
>
> @@ -71,6 +70,8 @@ struct mtk_crtc {
>         bool                            config_updating;
>         /* lock for config_updating to cmd buffer */
>         spinlock_t                      config_lock;
> +
> +       struct mtk_ddp_comp             *ddp_comp[];
>  };
>
>  struct mtk_crtc_state {
> @@ -1048,18 +1049,12 @@ int mtk_crtc_create(struct drm_device *drm_dev, c=
onst unsigned int *path,
>                 }
>         }
>
> -       mtk_crtc =3D devm_kzalloc(dev, sizeof(*mtk_crtc), GFP_KERNEL);
> +       mtk_crtc =3D devm_kzalloc(dev, struct_size(mtk_crtc, ddp_comp, pa=
th_len + (conn_routes ? 1 : 0)), GFP_KERNEL);
>         if (!mtk_crtc)
>                 return -ENOMEM;
>
> -       mtk_crtc->mmsys_dev =3D priv->mmsys_dev;
>         mtk_crtc->ddp_comp_nr =3D path_len;
> -       mtk_crtc->ddp_comp =3D devm_kcalloc(dev,
> -                                         mtk_crtc->ddp_comp_nr + (conn_r=
outes ? 1 : 0),
> -                                         sizeof(*mtk_crtc->ddp_comp),
> -                                         GFP_KERNEL);
> -       if (!mtk_crtc->ddp_comp)
> -               return -ENOMEM;
> +       mtk_crtc->mmsys_dev =3D priv->mmsys_dev;
>
>         mtk_crtc->mutex =3D mtk_mutex_get(priv->mutex_dev);
>         if (IS_ERR(mtk_crtc->mutex)) {
> --
> 2.53.0
>

