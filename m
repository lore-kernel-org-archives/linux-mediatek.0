Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC4AC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 00:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ+7xSniRx/2eV9iTDyixenPaHJ2it0P+naagTgyAo0=; b=2z9kGpU6B955cCb4H6CpkRHExI
	evXR6SWvw6GNsnI+eOlgaY/1typO0GzRCkAC5IHdgtFsDVoaM3woNEKOuNC/YHX50XXJNH26JsmzO
	J4VDh7W7JxEQ4DTttYJKBH2JrZlRRy/65GRZO6tiUr8hTzZcLkoEEpfa3u5xR/n1QOKzw1EJIFfzf
	fpJ1DohW6ZxT0Fq/p7q/6vidVNev9PVpW7XY/kPj6K9KGNxnS3NqkxGUGsfsx5/K4kCa+5KY702U6
	zkC42lHbenu7PLKWBOPScwH/xVT2iE35XCSBBGgUbMFpPaSvwEeQHnz75MIV04TdDPbhY0JZfhmjr
	bYXHOSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCjK-00D0mP-OT; Fri, 27 Jan 2023 00:36:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCjH-00D0ln-AA
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 00:36:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3269B81F4F
	for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 00:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B216C433A1
	for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 00:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674779787;
	bh=htil2G7vSkaGngmPhVZSFcsq/eWnyHmMS73jnIqKA2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MWRvX8IvcfIZTdFC6MqAkRfTXusgKtouS6100E3DS53efBnN6/V3tfHEmKwy05+6V
	 Tk0z5M1nKSBCfb6kb7o7fLx+LSMH6bmfdb5RnqH5hWBDPVVP1upVAXTBKOC20Q3Eqo
	 fdbxuq/ruHOxEg8sYpzFAqf6S+meo0P3Bl+lvOoiANIc4KuLjN09lWSQaTiBGVNNWO
	 I1132fNJJEdiDZB43vJk27qFVXsUROS6wCAYzh7Z9lOV2qUm9s+OF8q6cGADKKef2p
	 qODoVxRX5aMlgUANb6jOk+RHxmeuTMTl55MpGmLdPKonf1TZKZ/qvqAkWNkgJVSvr6
	 4koedu3WOCN8w==
Received: by mail-lf1-f53.google.com with SMTP id g13so5724190lfv.7
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 16:36:27 -0800 (PST)
X-Gm-Message-State: AFqh2krKVPlP8WBdg8fffNSM6dzY0QsgmFaGGdcTF1k19RyRkMKH3IvJ
	FanT//csADcFr8C+oPc+rt+myr2eXoOkVr1SlA==
X-Google-Smtp-Source: AMrXdXvTt5h4itMwEuVxRw0njJR4Wi7NlGp2WLONYT5gj3uMLKntH8Xf8A4QJVn+Rgs1j/vRnpZ0N2B6HxyjBriyoJo=
X-Received: by 2002:a05:6512:2514:b0:4cb:3b23:626b with SMTP id
 be20-20020a056512251400b004cb3b23626bmr2256653lfb.384.1674779785234; Thu, 26
 Jan 2023 16:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20230110204742.1354797-1-greenjustin@chromium.org>
In-Reply-To: <20230110204742.1354797-1-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 08:36:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8iPJAku-SGgd3NoHA8LOWbXiKfNtfVt_oGuEJqA-=Q-w@mail.gmail.com>
Message-ID: <CAAOTY_8iPJAku-SGgd3NoHA8LOWbXiKfNtfVt_oGuEJqA-=Q-w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add support for AR30 and BA30
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com, 
	daniel@ffwll.ch, daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_163631_700744_C0BE94B2 
X-CRM114-Status: GOOD (  25.26  )
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

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B41=E6=9C=8811=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=884:47=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.
>
> Tested using "modetest -P" on an MT8195.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
> v2:
>  * Rebase and resolve merge conflicts with the AFBC patch.
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 28 +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 19 +++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 39 +++++++++++++++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 +-
>  4 files changed, 81 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 84daeaffab6a..667ae57c8754 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -41,6 +41,7 @@
>  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
>  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
>  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> +#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
>  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
>  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20=
 * (n))
>  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x20=
 * (n) + 0x04)
> @@ -61,6 +62,10 @@
>                                         0 : OVL_CON_CLRFMT_RGB)
>  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ? \
>                                         OVL_CON_CLRFMT_RGB : 0)
> +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> +#define OVL_CON_CLRFMT_8_BIT                   0x00
> +#define OVL_CON_CLRFMT_10_BIT                  0x01
>  #define        OVL_CON_AEN             BIT(8)
>  #define        OVL_CON_ALPHA           0xff
>  #define        OVL_CON_VIRT_FLIP       BIT(9)
> @@ -188,6 +193,26 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ov=
l, struct cmdq_pkt *cmdq_pkt
>                            DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(i=
dx));
>  }
>
> +static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 forma=
t,
> +                                 struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +       unsigned int reg;
> +       unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
> +
> +       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> +       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> +
> +       if (format =3D=3D DRM_FORMAT_RGBA1010102 ||
> +           format =3D=3D DRM_FORMAT_BGRA1010102 ||
> +           format =3D=3D DRM_FORMAT_ARGB2101010)
> +               bit_depth =3D OVL_CON_CLRFMT_10_BIT;
> +
> +       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> +
> +       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg, ovl->regs, DISP_REG_=
OVL_CLRFMT_EXT);
> +}
> +
>  void mtk_ovl_config(struct device *dev, unsigned int w,
>                     unsigned int h, unsigned int vrefresh,
>                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -302,9 +327,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_=
ovl *ovl, unsigned int fmt)
>                 return OVL_CON_CLRFMT_ARGB8888;
>         case DRM_FORMAT_BGRX8888:
>         case DRM_FORMAT_BGRA8888:
> +       case DRM_FORMAT_BGRA1010102:
>                 return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
>         case DRM_FORMAT_XRGB8888:
>         case DRM_FORMAT_ARGB8888:
> +       case DRM_FORMAT_ARGB2101010:
>                 return OVL_CON_CLRFMT_RGBA8888;
>         case DRM_FORMAT_XBGR8888:
>         case DRM_FORMAT_ABGR8888:
> @@ -388,6 +415,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigne=
d int idx,
>                                       &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
>         }
>
> +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
>  }
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 112615817dcb..d50379c97c4b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -842,6 +842,21 @@ enum drm_plane_type mtk_drm_crtc_plane_type(unsigned=
 int plane_idx,
>
>  }
>
> +static const char *ovls_with_10bit_cap[] =3D {
> +       "mediatek,mt8195-disp-ovl",
> +};
> +
> +static bool is_10bit_cap_device(void)
> +{
> +       for (int i =3D 0; i < ARRAY_SIZE(ovls_with_10bit_cap); i++) {
> +               if (of_find_compatible_node(NULL, NULL,
> +                                           ovls_with_10bit_cap[i]))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>                                          struct mtk_drm_crtc *mtk_crtc,
>                                          int comp_idx, int pipe)
> @@ -849,6 +864,7 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_d=
evice *drm_dev,
>         int num_planes =3D mtk_drm_crtc_num_comp_planes(mtk_crtc, comp_id=
x);
>         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx];
>         int i, ret;
> +       bool supports_10bit =3D is_10bit_cap_device();
>
>         for (i =3D 0; i < num_planes; i++) {
>                 ret =3D mtk_plane_init(drm_dev,
> @@ -856,7 +872,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_d=
evice *drm_dev,
>                                 BIT(pipe),
>                                 mtk_drm_crtc_plane_type(mtk_crtc->layer_n=
r,
>                                                         num_planes),
> -                               mtk_ddp_comp_supported_rotations(comp));
> +                               mtk_ddp_comp_supported_rotations(comp),
> +                               supports_10bit);
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index d54fbf34b000..7fe5c47b4d50 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -12,6 +12,8 @@
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <linux/align.h>
> +#include <drm/drm_plane_helper.h>
> +#include <linux/of.h>
>
>  #include "mtk_drm_crtc.h"
>  #include "mtk_drm_ddp_comp.h"
> @@ -19,7 +21,7 @@
>  #include "mtk_drm_gem.h"
>  #include "mtk_drm_plane.h"
>
> -static const u32 formats[] =3D {
> +static const u32 default_formats[] =3D {
>         DRM_FORMAT_XRGB8888,
>         DRM_FORMAT_ARGB8888,
>         DRM_FORMAT_BGRX8888,
> @@ -41,6 +43,22 @@ static const u64 modifiers[] =3D {
>         DRM_FORMAT_MOD_INVALID,
>  };
>
> +static const u32 formats_with_10bit_cap[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_ARGB2101010,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_BGRA1010102,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};

I would like to move these array to ovl/rdma driver and query these
array with ovl/rdma driver (struct mtk_ddp_comp *comp in
mtk_drm_crtc_init_comp_planes()).

Regards,
Chun-Kuang.

> +
>  static void mtk_plane_reset(struct drm_plane *plane)
>  {
>         struct mtk_plane_state *state;
> @@ -315,13 +333,24 @@ static const struct drm_plane_helper_funcs mtk_plan=
e_helper_funcs =3D {
>
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
> -                  unsigned int supported_rotations)
> +                  unsigned int supported_rotations, bool supports_10bit)
>  {
>         int err;
>
> -       err =3D drm_universal_plane_init(dev, plane, possible_crtcs,
> -                                      &mtk_plane_funcs, formats,
> -                                      ARRAY_SIZE(formats), modifiers, ty=
pe, NULL);
> +       if (supports_10bit) {
> +               err =3D drm_universal_plane_init(dev, plane, possible_crt=
cs,
> +                                              &mtk_plane_funcs,
> +                                              formats_with_10bit_cap,
> +                                              ARRAY_SIZE(formats_with_10=
bit_cap),
> +                                              modifiers, type, NULL);
> +       } else {
> +               err =3D drm_universal_plane_init(dev, plane, possible_crt=
cs,
> +                                              &mtk_plane_funcs,
> +                                              default_formats,
> +                                              ARRAY_SIZE(default_formats=
),
> +                                              modifiers, type, NULL);
> +       }
> +
>         if (err) {
>                 DRM_ERROR("failed to initialize plane\n");
>                 return err;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.h
> index 8f39011cdbfc..d3e6f29a1e25 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -48,6 +48,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
>
>  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>                    unsigned long possible_crtcs, enum drm_plane_type type=
,
> -                  unsigned int supported_rotations);
> +                  unsigned int supported_rotations, bool supports_10bit)=
;
>
>  #endif
> --
> 2.39.0.314.g84b9a713c41-goog
>

