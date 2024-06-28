Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77201C3064D
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tmrZUBPNyMMeNJR9r/BDDYhTc0KElRLWUJVIlzehPM=; b=zGYjME4gzLbvwz
	GJW8jclHyfqgwLefYKnJ4rxnN0QrO6WndcLTXVLv0HT0lMhVM4K5BPlQwwsOHbq2LcyQ6NW3hnEgy
	wXnbbvcFm2kZauYGO54E7bR0icU8PJSNJbJglnjuFs/m/Vp5n54IPRXAdnP+fYLRp6Ul93nqr/ADb
	rcCAWf0d2xzXPKBkSfMSyRPzyUtZQuNz+5ExHLbduogmnuvGSI8dfcO8Y+WRfjbeGOpxYEFoqKwtZ
	CElBF0uyOHUtqedImltOa7c/BHkABIRJbwXmftew9EOMhvGPOs+U2rZXcc7QKxBvnz6kgwfDdgkbW
	cjSwMSZy6L9rNtvyZoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAmD-0000000DhMK-3g8e;
	Fri, 28 Jun 2024 12:32:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAm2-0000000DhK5-4Be1;
	Fri, 28 Jun 2024 12:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41FAB62167;
	Fri, 28 Jun 2024 12:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC73BC4AF0A;
	Fri, 28 Jun 2024 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719577938;
	bh=QS20hUrmVwpirQtGJibxsIuWGE8OeJujhIhKjKkf07U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e2K67uGoZuTnFesVk+VXWWROnNKRdtPnTNJhSXEH995/3IjlUUfLNTVgOfO8snKVR
	 GXMaq93B7QzKqt8VuYfj4kICxiAF5btvozj/Hc/Tjq7Klgw2XjuP3EBnA6QpGuCobt
	 lJMhFt3MyEz3EGfhKkJRtgLd4YB7HflWzTrNEAeAIPUvoAvz1DcA/YbMk8qMz6JC82
	 zu5t6YBaUuOEj5fwllPOJy5iyZ7aa5a2+QZp/aFTSvbeyD7v7e2oxQW4+W8xlVy5vn
	 8jR/tDEbC7+Bv9TgClSV0ZP31PLNCTg/ZGvvhiwCosiOVqZzXlowdN9OJWZxXk/Q0k
	 sIhuQ1HiGazCw==
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c7dff0f4e4so408275a91.2;
        Fri, 28 Jun 2024 05:32:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPlGnHS95SUE3x4tMGqKfdPNW9mseQ8uCAJy4VraAFt0/kO8O4fgl95Cv7GjWHBTlG4S1Uac1LlYBxYXvUYaNMpIc8t6q0aTHxkG3ASE9c61c5qrqtGjDh5URiKD1q+ItWl7GnS5BMPMfYo+m1PA5pCDaq2W4AFok=
X-Gm-Message-State: AOJu0YwqcyhlQV5OGScV4dTfQjoz/S8w/oLNiSVjcBt7L4sADZ+2IC+d
	yjNekMNKRPMcHT0CtBLdIMNo4t6Jn1exjA160LxlmBUH/3tyCT7SlfPxU9lrU3ggmVid1u47RWC
	YiX7m8YQ0TtvBlaoB9GCrzqOYMg==
X-Google-Smtp-Source: AGHT+IHQ/05JNn97WxtnIagHd/uIS+roxfEJNPFeT15eOh7yNWGchsB1UnEjvW48a7x8gKm79Zo4hN4aG5yan43uUBQ=
X-Received: by 2002:a17:90b:110a:b0:2c2:ce08:d0e4 with SMTP id
 98e67ed59e1d1-2c8613db083mr14966731a91.23.1719577937460; Fri, 28 Jun 2024
 05:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240606092122.2026313-1-mwalle@kernel.org>
In-Reply-To: <20240606092122.2026313-1-mwalle@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Jun 2024 20:32:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY__x_-O2AGuWqZ_HSwORTJXcyb+g4uMFnwpxWr338fPpaA@mail.gmail.com>
Message-ID: <CAAOTY__x_-O2AGuWqZ_HSwORTJXcyb+g4uMFnwpxWr338fPpaA@mail.gmail.com>
Subject: Re: [PATCH RESEND v5] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
To: Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_053219_171184_A0A13DD8 
X-CRM114-Status: GOOD (  31.52  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, Stu Hsieh <stu.hsieh@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Michael:

Michael Walle <mwalle@kernel.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=886=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> mtk_find_possible_crtcs() assumes that the main path will always have
> the CRTC with id 0, the ext id 1 and the third id 2. This is only true
> if the paths are all available. But paths are optional (see also
> comment in mtk_drm_kms_init()), e.g. the main path might not be enabled
> or available at all. Then the CRTC IDs will shift one up, e.g. ext will
> be 0 and the third path will be 1.
>
> To fix that, dynamically calculate the IDs by the presence of the paths.
>
> While at it, make the return code a signed one and return -ENODEV if no
> path is found and handle the error in the callers.
>
> Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_=
crtc way")
> Suggested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> You can find v4 at [1]. Unfortunately, it was never applied and in the
> meantime there was a change in mtk_find_possible_crtcs(). So I've
> dropped N=C3=ADcolas Reviewed and Tested-by tags and Angelos Reviewed-by
> tag.
>
> [1] https://lore.kernel.org/r/20230905084922.3908121-2-mwalle@kernel.org/
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 105 ++++++++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c      |   5 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c      |   5 +-
>  4 files changed, 78 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/me=
diatek/mtk_ddp_comp.c
> index 17b036411292..9a8c1cace8a0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> @@ -514,29 +514,42 @@ static bool mtk_ddp_comp_find(struct device *dev,
>         return false;
>  }
>
> -static unsigned int mtk_ddp_comp_find_in_route(struct device *dev,
> -                                              const struct mtk_drm_route=
 *routes,
> -                                              unsigned int num_routes,
> -                                              struct mtk_ddp_comp *ddp_c=
omp)
> +static int mtk_ddp_comp_find_in_route(struct device *dev,
> +                                     const struct mtk_drm_route *routes,
> +                                     unsigned int num_routes,
> +                                     struct mtk_ddp_comp *ddp_comp)
>  {
> -       int ret;
>         unsigned int i;
>
> -       if (!routes) {
> -               ret =3D -EINVAL;
> -               goto err;
> -       }
> +       if (!routes)
> +               return -EINVAL;
>
>         for (i =3D 0; i < num_routes; i++)
>                 if (dev =3D=3D ddp_comp[routes[i].route_ddp].dev)
>                         return BIT(routes[i].crtc_id);
>
> -       ret =3D -ENODEV;
> -err:
> +       return -ENODEV;
> +}
>
> -       DRM_INFO("Failed to find comp in ddp table, ret =3D %d\n", ret);
> +static bool mtk_ddp_path_available(const unsigned int *path,
> +                                  unsigned int path_len,
> +                                  struct device_node **comp_node)
> +{
> +       unsigned int i;
>
> -       return 0;
> +       if (!path || !path_len)
> +               return false;
> +
> +       for (i =3D 0U; i < path_len; i++) {
> +               /* OVL_ADAPTOR doesn't have a device node */
> +               if (path[i] =3D=3D DDP_COMPONENT_DRM_OVL_ADAPTOR)
> +                       continue;
> +
> +               if (!comp_node[path[i]])
> +                       return false;
> +       }
> +
> +       return true;
>  }
>
>  int mtk_ddp_comp_get_id(struct device_node *node,
> @@ -554,32 +567,52 @@ int mtk_ddp_comp_get_id(struct device_node *node,
>         return -EINVAL;
>  }
>
> -unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct devi=
ce *dev)
> +int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
>  {
>         struct mtk_drm_private *private =3D drm->dev_private;
> -       unsigned int ret =3D 0;
> -
> -       if (mtk_ddp_comp_find(dev,
> -                             private->data->main_path,
> -                             private->data->main_len,
> -                             private->ddp_comp))
> -               ret =3D BIT(0);
> -       else if (mtk_ddp_comp_find(dev,
> -                                  private->data->ext_path,
> -                                  private->data->ext_len,
> -                                  private->ddp_comp))
> -               ret =3D BIT(1);
> -       else if (mtk_ddp_comp_find(dev,
> -                                  private->data->third_path,
> -                                  private->data->third_len,
> -                                  private->ddp_comp))
> -               ret =3D BIT(2);
> -       else
> -               ret =3D mtk_ddp_comp_find_in_route(dev,
> -                                                private->data->conn_rout=
es,
> -                                                private->data->num_conn_=
routes,
> -                                                private->ddp_comp);
> +       const struct mtk_mmsys_driver_data *data;
> +       struct mtk_drm_private *priv_n;
> +       int i =3D 0, j;
> +       int ret;
>
> +       for (j =3D 0; j < private->data->mmsys_dev_num; j++) {
> +               priv_n =3D private->all_drm_private[j];
> +               data =3D priv_n->data;
> +
> +               if (mtk_ddp_path_available(data->main_path, data->main_le=
n,
> +                                          priv_n->comp_node)) {
> +                       if (mtk_ddp_comp_find(dev, data->main_path,
> +                                             data->main_len,
> +                                             priv_n->ddp_comp))
> +                               return BIT(i);
> +                       i++;
> +               }
> +
> +               if (mtk_ddp_path_available(data->ext_path, data->ext_len,
> +                                          priv_n->comp_node)) {
> +                       if (mtk_ddp_comp_find(dev, data->ext_path,
> +                                             data->ext_len,
> +                                             priv_n->ddp_comp))
> +                               return BIT(i);
> +                       i++;
> +               }
> +
> +               if (mtk_ddp_path_available(data->third_path, data->third_=
len,
> +                                          priv_n->comp_node)) {
> +                       if (mtk_ddp_comp_find(dev, data->third_path,
> +                                             data->third_len,
> +                                             priv_n->ddp_comp))
> +                               return BIT(i);
> +                       i++;
> +               }
> +       }
> +
> +       ret =3D mtk_ddp_comp_find_in_route(dev,
> +                                        private->data->conn_routes,
> +                                        private->data->num_conn_routes,
> +                                        private->ddp_comp);
> +
> +       DRM_INFO("Failed to find comp in ddp table, ret =3D %d\n", ret);

After checking ret < 0 then print this error message, applied to
mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/me=
diatek/mtk_ddp_comp.h
> index 26236691ce4c..e2ea19d5ddcb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
> @@ -326,7 +326,7 @@ static inline void mtk_ddp_comp_encoder_index_set(str=
uct mtk_ddp_comp *comp)
>
>  int mtk_ddp_comp_get_id(struct device_node *node,
>                         enum mtk_ddp_comp_type comp_type);
> -unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct devi=
ce *dev);
> +int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev);
>  int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp=
 *comp,
>                       unsigned int comp_id);
>  enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 5c86aa0b75b2..b894be9f1f53 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -814,7 +814,10 @@ static int mtk_dpi_bind(struct device *dev, struct d=
evice *master, void *data)
>                 return ret;
>         }
>
> -       dpi->encoder.possible_crtcs =3D mtk_find_possible_crtcs(drm_dev, =
dpi->dev);
> +       ret =3D mtk_find_possible_crtcs(drm_dev, dpi->dev);
> +       if (ret < 0)
> +               goto err_cleanup;
> +       dpi->encoder.possible_crtcs =3D ret;
>
>         ret =3D drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
>                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 2b0ac859a653..b450b7223aa2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -861,7 +861,10 @@ static int mtk_dsi_encoder_init(struct drm_device *d=
rm, struct mtk_dsi *dsi)
>                 return ret;
>         }
>
> -       dsi->encoder.possible_crtcs =3D mtk_find_possible_crtcs(drm, dsi-=
>host.dev);
> +       ret =3D mtk_find_possible_crtcs(drm, dsi->host.dev);
> +       if (ret < 0)
> +               goto err_cleanup_encoder;
> +       dsi->encoder.possible_crtcs =3D ret;
>
>         ret =3D drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
>                                 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> --
> 2.39.2
>

