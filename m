Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48780C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 23:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orF4MmvENbtPn9ArKvzBScZduwRUTzmJQm8/XMEgeIg=; b=Y+yYgVw6XFv2i+/EpCAH4K0U2L
	BY6oPImHAP3oeOFwECrZOZHDbtixu81MQ1EH2JKSSm3Y/Uo0AwUgvu1VatKEALQZtImrsPHEigA4E
	/AHWybFFfF37r4+v7arWisjmkAWrnBISJSbibXsNdZP2m5fIzDQ/B0lCe09qQg9KCFMtBX/WuKvTB
	RkVm0PCgh3vc7AWlpGiN/qjXPLQYmlMggRaAMmamKkUPC5shr/FDaK/JYYh/ekU2qIpMHbXpPFmUV
	YKnNVg3GeGK0nOFQdW1HOBoCFH+h6TcxskB0sivMWdvPp5LcCDV0LNULsJm6GutMT3XzNZlcczzk7
	nl4SQa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa3AK-00784X-D8; Wed, 08 Mar 2023 23:25:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa3AG-00782V-57
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 23:25:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB7B6619D0
	for <linux-mediatek@lists.infradead.org>; Wed,  8 Mar 2023 23:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB16C433A7
	for <linux-mediatek@lists.infradead.org>; Wed,  8 Mar 2023 23:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678317935;
	bh=TpYn0H8JcGDOzBuVDB4sWru2HwVpWoAeJw+bkPkNvQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f1txx5IK93vMi02N0uIHlMQ+a/H4R7USq5MfO22T4+YW1407D2Rpbo226Eiix+QP/
	 eBwQ4a/Knt/F9C6CodPtujxcMehIOSAwIExeSp3vEkks+rvMSX0KpWmi7v+kW5lJbG
	 L3TAEdDJ2xDAWRsqWPxfX94AhU+61isZJQopezJ0C5fjjOYTbDvNKwq91D/HetX/cx
	 xAIYBZmQBRBL4V+R0NcZS3dSjbAm+c7Oq0dJvsWdnzrTGgEcNXh7MMVk8bBzbQoFbq
	 VFBlDsr4gk8qPeN7GsxAoTzQswfSRZe0aFHAxDUoS3DKkCy9Qt5rlZStu4eNhlkZuH
	 7XFWVoZOnJDgw==
Received: by mail-lf1-f41.google.com with SMTP id t11so100688lfr.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 15:25:35 -0800 (PST)
X-Gm-Message-State: AO0yUKUq9TvZoO+hgoL1p+jagNlYKYWOaVStfIXkOKcd0quzOR8H9GuF
	XDPuErNdQWR/X9G0LOWVTdrx02CmrrH8pjynxA==
X-Google-Smtp-Source: AK7set+9sek6VGxljpAjpmp3Jbe3Jx+jwbptMksXrLFsF/AAaWKgYRgjQY7NYC0OshY1wZVOXRPzMKlwoFVX7bMKqeQ=
X-Received: by 2002:ac2:593b:0:b0:4dd:9931:c555 with SMTP id
 v27-20020ac2593b000000b004dd9931c555mr6344336lfi.0.1678317933468; Wed, 08 Mar
 2023 15:25:33 -0800 (PST)
MIME-Version: 1.0
References: <20230308153358.333297-1-greenjustin@chromium.org> <20230308153358.333297-2-greenjustin@chromium.org>
In-Reply-To: <20230308153358.333297-2-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Mar 2023 07:25:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8TAjh082cspy6-KyEgUP6G1h8fcX=+4r2ON3PYxgMOWQ@mail.gmail.com>
Message-ID: <CAAOTY_8TAjh082cspy6-KyEgUP6G1h8fcX=+4r2ON3PYxgMOWQ@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 1/3] drm/mediatek: Refactor pixel format logic
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, daniel@ffwll.ch, 
	daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_152544_314488_E13D0B86 
X-CRM114-Status: GOOD (  21.20  )
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

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add an DDP component interface for querying pixel format support and move=
 list
> of supported pixel formats into DDP components instead of mtk_drm_plane.c

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Tested by running Chrome on an MT8195.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 44 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 ++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++++-------
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
>  8 files changed, 123 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 33e61a136bbc..0df6a06defb8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -96,6 +96,8 @@ void mtk_ovl_register_vblank_cb(struct device *dev,
>  void mtk_ovl_unregister_vblank_cb(struct device *dev);
>  void mtk_ovl_enable_vblank(struct device *dev);
>  void mtk_ovl_disable_vblank(struct device *dev);
> +const u32 *mtk_ovl_get_formats(struct device *dev);
> +size_t mtk_ovl_get_num_formats(struct device *dev);
>
>  void mtk_rdma_bypass_shadow(struct device *dev);
>  int mtk_rdma_clk_enable(struct device *dev);
> @@ -115,6 +117,8 @@ void mtk_rdma_register_vblank_cb(struct device *dev,
>  void mtk_rdma_unregister_vblank_cb(struct device *dev);
>  void mtk_rdma_enable_vblank(struct device *dev);
>  void mtk_rdma_disable_vblank(struct device *dev);
> +const u32 *mtk_rdma_get_formats(struct device *dev);
> +size_t mtk_rdma_get_num_formats(struct device *dev);
>
>  int mtk_mdp_rdma_clk_enable(struct device *dev);
>  void mtk_mdp_rdma_clk_disable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 84daeaffab6a..8743c8047dc9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -66,6 +66,20 @@
>  #define        OVL_CON_VIRT_FLIP       BIT(9)
>  #define        OVL_CON_HORZ_FLIP       BIT(10)
>
> +static const u32 mt8173_formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};
> +
>  struct mtk_disp_ovl_data {
>         unsigned int addr;
>         unsigned int gmc_bits;
> @@ -73,6 +87,8 @@ struct mtk_disp_ovl_data {
>         bool fmt_rgb565_is_0;
>         bool smi_id_en;
>         bool supports_afbc;
> +       const u32 *formats;
> +       size_t num_formats;
>  };
>
>  /*
> @@ -138,6 +154,20 @@ void mtk_ovl_disable_vblank(struct device *dev)
>         writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
>  }
>
> +const u32 *mtk_ovl_get_formats(struct device *dev)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +
> +       return ovl->data->formats;
> +}
> +
> +size_t mtk_ovl_get_num_formats(struct device *dev)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +
> +       return ovl->data->num_formats;
> +}
> +
>  int mtk_ovl_clk_enable(struct device *dev)
>  {
>         struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> @@ -495,6 +525,8 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driv=
er_data =3D {
>         .gmc_bits =3D 8,
>         .layer_nr =3D 4,
>         .fmt_rgb565_is_0 =3D false,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_ovl_data mt8173_ovl_driver_data =3D {
> @@ -502,6 +534,8 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driv=
er_data =3D {
>         .gmc_bits =3D 8,
>         .layer_nr =3D 4,
>         .fmt_rgb565_is_0 =3D true,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_ovl_data mt8183_ovl_driver_data =3D {
> @@ -509,6 +543,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driv=
er_data =3D {
>         .gmc_bits =3D 10,
>         .layer_nr =3D 4,
>         .fmt_rgb565_is_0 =3D true,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data =3D {
> @@ -516,6 +552,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_d=
river_data =3D {
>         .gmc_bits =3D 10,
>         .layer_nr =3D 2,
>         .fmt_rgb565_is_0 =3D true,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_ovl_data mt8192_ovl_driver_data =3D {
> @@ -524,6 +562,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driv=
er_data =3D {
>         .layer_nr =3D 4,
>         .fmt_rgb565_is_0 =3D true,
>         .smi_id_en =3D true,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data =3D {
> @@ -532,6 +572,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_d=
river_data =3D {
>         .layer_nr =3D 2,
>         .fmt_rgb565_is_0 =3D true,
>         .smi_id_en =3D true,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_ovl_data mt8195_ovl_driver_data =3D {
> @@ -541,6 +583,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driv=
er_data =3D {
>         .fmt_rgb565_is_0 =3D true,
>         .smi_id_en =3D true,
>         .supports_afbc =3D true,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index 0ec2e4049e07..cf92df845160 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -54,8 +54,24 @@
>
>  #define RDMA_MEM_GMC                           0x40402020
>
> +static const u32 mt8173_formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};
> +
>  struct mtk_disp_rdma_data {
>         unsigned int fifo_size;
> +       const u32 *formats;
> +       size_t num_formats;
>  };
>
>  /*
> @@ -126,6 +142,20 @@ void mtk_rdma_disable_vblank(struct device *dev)
>         rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_IN=
T, 0);
>  }
>
> +const u32 *mtk_rdma_get_formats(struct device *dev)
> +{
> +       struct mtk_disp_rdma *rdma =3D dev_get_drvdata(dev);
> +
> +       return rdma->data->formats;
> +}
> +
> +size_t mtk_rdma_get_num_formats(struct device *dev)
> +{
> +       struct mtk_disp_rdma *rdma =3D dev_get_drvdata(dev);
> +
> +       return rdma->data->num_formats;
> +}
> +
>  int mtk_rdma_clk_enable(struct device *dev)
>  {
>         struct mtk_disp_rdma *rdma =3D dev_get_drvdata(dev);
> @@ -360,18 +390,26 @@ static int mtk_disp_rdma_remove(struct platform_dev=
ice *pdev)
>
>  static const struct mtk_disp_rdma_data mt2701_rdma_driver_data =3D {
>         .fifo_size =3D SZ_4K,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_rdma_data mt8173_rdma_driver_data =3D {
>         .fifo_size =3D SZ_8K,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_rdma_data mt8183_rdma_driver_data =3D {
>         .fifo_size =3D 5 * SZ_1K,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct mtk_disp_rdma_data mt8195_rdma_driver_data =3D {
>         .fifo_size =3D 1920,
> +       .formats =3D mt8173_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8173_formats),
>  };
>
>  static const struct of_device_id mtk_disp_rdma_driver_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 112615817dcb..2ba01c484228 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -856,7 +856,9 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_d=
evice *drm_dev,
>                                 BIT(pipe),
>                                 mtk_drm_crtc_plane_type(mtk_crtc->layer_n=
r,
>                                                         num_planes),
> -                               mtk_ddp_comp_supported_rotations(comp));
> +                               mtk_ddp_comp_supported_rotations(comp),
> +                               mtk_ddp_comp_get_formats(comp),
> +                               mtk_ddp_comp_get_num_formats(comp));
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 6b6d5335c834..4a4c1928f83d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -359,6 +359,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl =3D {
>         .layer_config =3D mtk_ovl_layer_config,
>         .bgclr_in_on =3D mtk_ovl_bgclr_in_on,
>         .bgclr_in_off =3D mtk_ovl_bgclr_in_off,
> +       .get_formats =3D mtk_ovl_get_formats,
> +       .get_num_formats =3D mtk_ovl_get_num_formats,
>  };
>
>  static const struct mtk_ddp_comp_funcs ddp_postmask =3D {
> @@ -381,6 +383,8 @@ static const struct mtk_ddp_comp_funcs ddp_rdma =3D {
>         .disable_vblank =3D mtk_rdma_disable_vblank,
>         .layer_nr =3D mtk_rdma_layer_nr,
>         .layer_config =3D mtk_rdma_layer_config,
> +       .get_formats =3D mtk_rdma_get_formats,
> +       .get_num_formats =3D mtk_rdma_get_num_formats,
>  };
>
>  static const struct mtk_ddp_comp_funcs ddp_ufoe =3D {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 2d0052c23dcb..7f2e638cfdc2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -71,6 +71,8 @@ struct mtk_ddp_comp_funcs {
>         void (*bgclr_in_off)(struct device *dev);
>         void (*ctm_set)(struct device *dev,
>                         struct drm_crtc_state *state);
> +       const u32 *(*get_formats)(struct device *dev);
> +       size_t (*get_num_formats)(struct device *dev);
>  };
>
>  struct mtk_ddp_comp {
> @@ -203,6 +205,24 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_co=
mp *comp,
>                 comp->funcs->ctm_set(comp->dev, state);
>  }
>
> +static inline
> +const u32 *mtk_ddp_comp_get_formats(struct mtk_ddp_comp *comp)
> +{
> +       if (comp->funcs && comp->funcs->get_formats)
> +               return comp->funcs->get_formats(comp->dev);
> +
> +       return NULL;
> +}
> +
> +static inline
> +size_t mtk_ddp_comp_get_num_formats(struct mtk_ddp_comp *comp)
> +{
> +       if (comp->funcs && comp->funcs->get_num_formats)
> +               return comp->funcs->get_num_formats(comp->dev);
> +
> +       return 0;
> +}
> +
>  int mtk_ddp_comp_get_id(struct device_node *node,
>                         enum mtk_ddp_comp_type comp_type);
>  unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index d54fbf34b000..31f9420aff6f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -19,20 +19,6 @@
>  #include "mtk_drm_gem.h"
>  #include "mtk_drm_plane.h"
>
> -static const u32 formats[] =3D {
> -       DRM_FORMAT_XRGB8888,
> -       DRM_FORMAT_ARGB8888,
> -       DRM_FORMAT_BGRX8888,
> -       DRM_FORMAT_BGRA8888,
> -       DRM_FORMAT_ABGR8888,
> -       DRM_FORMAT_XBGR8888,
> -       DRM_FORMAT_RGB888,
> -       DRM_FORMAT_BGR888,
> -       DRM_FORMAT_RGB565,
> -       DRM_FORMAT_UYVY,
> -       DRM_FORMAT_YUYV,
> -};
> -
>  static const u64 modifiers[] =3D {
>         DRM_FORMAT_MOD_LINEAR,
>         DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> @@ -315,13 +301,19 @@ static const struct drm_plane_helper_funcs mtk_plan=
e_helper_funcs =3D {
>
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
> -                  unsigned int supported_rotations)
> +                  unsigned int supported_rotations, const u32 *formats,
> +                  size_t num_formats)
>  {
>         int err;
>
> +       if (!formats || !num_formats) {
> +               DRM_ERROR("no formats for plane\n");
> +               return -EINVAL;
> +       }
> +
>         err =3D drm_universal_plane_init(dev, plane, possible_crtcs,
>                                        &mtk_plane_funcs, formats,
> -                                      ARRAY_SIZE(formats), modifiers, ty=
pe, NULL);
> +                                      num_formats, modifiers, type, NULL=
);
>         if (err) {
>                 DRM_ERROR("failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.h
> index 8f39011cdbfc..99aff7da0831 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -48,6 +48,7 @@ to_mtk_plane_state(struct drm_plane_state *state)
>
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
> -                  unsigned int supported_rotations);
> +                  unsigned int supported_rotations, const u32 *formats,
> +                  size_t num_formats);
>
>  #endif
> --
> 2.39.1.456.gfc5497dd1b-goog
>

