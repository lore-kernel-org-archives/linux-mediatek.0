Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB04AC54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 22:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MleSlqBPzFKRTf0US9J7uS09Y4mRHY0IjYS38IETijI=; b=RiBCuTQbsA73qrCdWEH8am17yn
	yUYvVdbhXcCHjxIYuW0Y77iu0Ht43vHrfF8COmHk6nr506BSiLXvKn56ja2yZxecn6ygnYbPoLgLo
	PMxk4dqpTKwuAnYYVBznpED2m/Y4zJMfmKXLCQ794dbjjYt54tZ5ifpiZg1DTjvpsbaaMypBAOToL
	a5CtHNfMACwkIk/IjYIu2bCSsPLwSDTWgX28S31JJiadCFGDyQn1s0YCCSGW9XlzToqC7z3Qp5Uq/
	HhvVl+DjYEmMXEuSPEALiQZ9B7HuD4XiJgoe1xniXH0WUEwIRuS8NCkgBrnGyHMsGcFD4Ol/JIfb7
	ONK4IbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWlt-00GciP-7n; Fri, 27 Jan 2023 22:00:33 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWlT-00GcWs-HI
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 22:00:10 +0000
Received: by mail-pf1-x435.google.com with SMTP id cr11so2515620pfb.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 14:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MleSlqBPzFKRTf0US9J7uS09Y4mRHY0IjYS38IETijI=;
        b=TLB5hNxOR2xyTyxf7MbSt2T/+KpFqPHhG9dEJqdzJDYEck7/RRGajp4K0DRMB7PTD1
         ZLLoZMCgjtSlnaHz1HH+kwPCxtg2vlT5UVodT7vraT/MIwZ7to1Dt4MvCnFnQ0tpF/jq
         31lQ9EXgNn4/EOVm/OYEZFprXXl5XCpIMuFEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MleSlqBPzFKRTf0US9J7uS09Y4mRHY0IjYS38IETijI=;
        b=S9xiGJDOmUwP8mbG2mNNkPv2bGEdnBnih3mzZmmbSFn7md6vKvByDYqPVJQoJ/D4FF
         7X76X4IOTX66Pw9fQJwLNs+kGAAWyRV12BTEr0HxgbE+A3NpBwN8vdAfPuGt6kLTEHmO
         WCU5kHNxNMYXadge/E1b77+WtLTDKlSuTbJgY+OHzBhAQWTbyQ6T9AZHj0xYFFWdvJ20
         K8LTT9Vkk+LKuiFt6LlluvaH7XMrvaq3POvCmpmN3KcFGousPpFifCKzWnD9oW6+tBIK
         KE8hS1DEHsAar3GsJICX2qwtU4NtpyDvRWEx1lgQDf09B8OOakLfAgVLrAFbG/eeYP/n
         zkUw==
X-Gm-Message-State: AO0yUKXfaoEGzroCXnGErV2NdAYG+QR4CWzYPSEmk+8mRAR8laLYkF/4
	odIWQBb91VqaznvAkhc7QHhxcvrBHyruiAXWa21Ueg==
X-Google-Smtp-Source: AK7set+/wUE6nxoSYvbFiYWaYD+msKqtbVD4fY7+bMCU9kBMQDGJ3dZ0UGXXl5gFzgzMK/29iCDajl2pXRH4UlA5mQI=
X-Received: by 2002:a63:5418:0:b0:4d7:fc60:7ec1 with SMTP id
 i24-20020a635418000000b004d7fc607ec1mr1887297pgb.106.1674856803489; Fri, 27
 Jan 2023 14:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20230110204742.1354797-1-greenjustin@chromium.org> <CAAOTY_8iPJAku-SGgd3NoHA8LOWbXiKfNtfVt_oGuEJqA-=Q-w@mail.gmail.com>
In-Reply-To: <CAAOTY_8iPJAku-SGgd3NoHA8LOWbXiKfNtfVt_oGuEJqA-=Q-w@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Fri, 27 Jan 2023 16:59:52 -0500
Message-ID: <CAHC42RdnQ_=XzufhQRonYE3mM+Nr_dO+x2PiS+7Ad-pN5pz0cA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add support for AR30 and BA30
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, p.zabel@pengutronix.de, 
	airlied@linux.ie, matthias.bgg@gmail.com, daniel@ffwll.ch, 
	daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_140007_681537_4183412E 
X-CRM114-Status: GOOD (  27.86  )
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

Thanks for the suggestion! That's a lot cleaner than manually
traversing the device tree. Will send out another patch.

On Thu, Jan 26, 2023 at 7:36 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
>
> Hi, Justin:
>
> Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B41=E6=9C=88=
11=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=884:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > Add support for AR30 and BA30 pixel formats to the Mediatek DRM driver.
> >
> > Tested using "modetest -P" on an MT8195.
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > ---
> > v2:
> >  * Rebase and resolve merge conflicts with the AFBC patch.
> >
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 28 +++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 19 +++++++++++-
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 39 +++++++++++++++++++++---
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  2 +-
> >  4 files changed, 81 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/=
mediatek/mtk_disp_ovl.c
> > index 84daeaffab6a..667ae57c8754 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -41,6 +41,7 @@
> >  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
> >  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
> >  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> > +#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
> >  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
> >  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x=
20 * (n))
> >  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x=
20 * (n) + 0x04)
> > @@ -61,6 +62,10 @@
> >                                         0 : OVL_CON_CLRFMT_RGB)
> >  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ?=
 \
> >                                         OVL_CON_CLRFMT_RGB : 0)
> > +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> > +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> > +#define OVL_CON_CLRFMT_8_BIT                   0x00
> > +#define OVL_CON_CLRFMT_10_BIT                  0x01
> >  #define        OVL_CON_AEN             BIT(8)
> >  #define        OVL_CON_ALPHA           0xff
> >  #define        OVL_CON_VIRT_FLIP       BIT(9)
> > @@ -188,6 +193,26 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *=
ovl, struct cmdq_pkt *cmdq_pkt
> >                            DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN=
(idx));
> >  }
> >
> > +static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 for=
mat,
> > +                                 struct cmdq_pkt *cmdq_pkt)
> > +{
> > +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> > +       unsigned int reg;
> > +       unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
> > +
> > +       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> > +       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> > +
> > +       if (format =3D=3D DRM_FORMAT_RGBA1010102 ||
> > +           format =3D=3D DRM_FORMAT_BGRA1010102 ||
> > +           format =3D=3D DRM_FORMAT_ARGB2101010)
> > +               bit_depth =3D OVL_CON_CLRFMT_10_BIT;
> > +
> > +       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> > +
> > +       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg, ovl->regs, DISP_RE=
G_OVL_CLRFMT_EXT);
> > +}
> > +
> >  void mtk_ovl_config(struct device *dev, unsigned int w,
> >                     unsigned int h, unsigned int vrefresh,
> >                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> > @@ -302,9 +327,11 @@ static unsigned int ovl_fmt_convert(struct mtk_dis=
p_ovl *ovl, unsigned int fmt)
> >                 return OVL_CON_CLRFMT_ARGB8888;
> >         case DRM_FORMAT_BGRX8888:
> >         case DRM_FORMAT_BGRA8888:
> > +       case DRM_FORMAT_BGRA1010102:
> >                 return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
> >         case DRM_FORMAT_XRGB8888:
> >         case DRM_FORMAT_ARGB8888:
> > +       case DRM_FORMAT_ARGB2101010:
> >                 return OVL_CON_CLRFMT_RGBA8888;
> >         case DRM_FORMAT_XBGR8888:
> >         case DRM_FORMAT_ABGR8888:
> > @@ -388,6 +415,7 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
> >                                       &ovl->cmdq_reg, ovl->regs, DISP_R=
EG_OVL_PITCH_MSB(idx));
> >         }
> >
> > +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
> >         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
> >  }
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> > index 112615817dcb..d50379c97c4b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -842,6 +842,21 @@ enum drm_plane_type mtk_drm_crtc_plane_type(unsign=
ed int plane_idx,
> >
> >  }
> >
> > +static const char *ovls_with_10bit_cap[] =3D {
> > +       "mediatek,mt8195-disp-ovl",
> > +};
> > +
> > +static bool is_10bit_cap_device(void)
> > +{
> > +       for (int i =3D 0; i < ARRAY_SIZE(ovls_with_10bit_cap); i++) {
> > +               if (of_find_compatible_node(NULL, NULL,
> > +                                           ovls_with_10bit_cap[i]))
> > +                       return true;
> > +       }
> > +
> > +       return false;
> > +}
> > +
> >  static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
> >                                          struct mtk_drm_crtc *mtk_crtc,
> >                                          int comp_idx, int pipe)
> > @@ -849,6 +864,7 @@ static int mtk_drm_crtc_init_comp_planes(struct drm=
_device *drm_dev,
> >         int num_planes =3D mtk_drm_crtc_num_comp_planes(mtk_crtc, comp_=
idx);
> >         struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[comp_idx];
> >         int i, ret;
> > +       bool supports_10bit =3D is_10bit_cap_device();
> >
> >         for (i =3D 0; i < num_planes; i++) {
> >                 ret =3D mtk_plane_init(drm_dev,
> > @@ -856,7 +872,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm=
_device *drm_dev,
> >                                 BIT(pipe),
> >                                 mtk_drm_crtc_plane_type(mtk_crtc->layer=
_nr,
> >                                                         num_planes),
> > -                               mtk_ddp_comp_supported_rotations(comp))=
;
> > +                               mtk_ddp_comp_supported_rotations(comp),
> > +                               supports_10bit);
> >                 if (ret)
> >                         return ret;
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm=
/mediatek/mtk_drm_plane.c
> > index d54fbf34b000..7fe5c47b4d50 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -12,6 +12,8 @@
> >  #include <drm/drm_framebuffer.h>
> >  #include <drm/drm_gem_atomic_helper.h>
> >  #include <linux/align.h>
> > +#include <drm/drm_plane_helper.h>
> > +#include <linux/of.h>
> >
> >  #include "mtk_drm_crtc.h"
> >  #include "mtk_drm_ddp_comp.h"
> > @@ -19,7 +21,7 @@
> >  #include "mtk_drm_gem.h"
> >  #include "mtk_drm_plane.h"
> >
> > -static const u32 formats[] =3D {
> > +static const u32 default_formats[] =3D {
> >         DRM_FORMAT_XRGB8888,
> >         DRM_FORMAT_ARGB8888,
> >         DRM_FORMAT_BGRX8888,
> > @@ -41,6 +43,22 @@ static const u64 modifiers[] =3D {
> >         DRM_FORMAT_MOD_INVALID,
> >  };
> >
> > +static const u32 formats_with_10bit_cap[] =3D {
> > +       DRM_FORMAT_XRGB8888,
> > +       DRM_FORMAT_ARGB8888,
> > +       DRM_FORMAT_ARGB2101010,
> > +       DRM_FORMAT_BGRX8888,
> > +       DRM_FORMAT_BGRA8888,
> > +       DRM_FORMAT_BGRA1010102,
> > +       DRM_FORMAT_ABGR8888,
> > +       DRM_FORMAT_XBGR8888,
> > +       DRM_FORMAT_RGB888,
> > +       DRM_FORMAT_BGR888,
> > +       DRM_FORMAT_RGB565,
> > +       DRM_FORMAT_UYVY,
> > +       DRM_FORMAT_YUYV,
> > +};
>
> I would like to move these array to ovl/rdma driver and query these
> array with ovl/rdma driver (struct mtk_ddp_comp *comp in
> mtk_drm_crtc_init_comp_planes()).
>
> Regards,
> Chun-Kuang.
>
> > +
> >  static void mtk_plane_reset(struct drm_plane *plane)
> >  {
> >         struct mtk_plane_state *state;
> > @@ -315,13 +333,24 @@ static const struct drm_plane_helper_funcs mtk_pl=
ane_helper_funcs =3D {
> >
> >  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
> >                    unsigned long possible_crtcs, enum drm_plane_type ty=
pe,
> > -                  unsigned int supported_rotations)
> > +                  unsigned int supported_rotations, bool supports_10bi=
t)
> >  {
> >         int err;
> >
> > -       err =3D drm_universal_plane_init(dev, plane, possible_crtcs,
> > -                                      &mtk_plane_funcs, formats,
> > -                                      ARRAY_SIZE(formats), modifiers, =
type, NULL);
> > +       if (supports_10bit) {
> > +               err =3D drm_universal_plane_init(dev, plane, possible_c=
rtcs,
> > +                                              &mtk_plane_funcs,
> > +                                              formats_with_10bit_cap,
> > +                                              ARRAY_SIZE(formats_with_=
10bit_cap),
> > +                                              modifiers, type, NULL);
> > +       } else {
> > +               err =3D drm_universal_plane_init(dev, plane, possible_c=
rtcs,
> > +                                              &mtk_plane_funcs,
> > +                                              default_formats,
> > +                                              ARRAY_SIZE(default_forma=
ts),
> > +                                              modifiers, type, NULL);
> > +       }
> > +
> >         if (err) {
> >                 DRM_ERROR("failed to initialize plane\n");
> >                 return err;
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm=
/mediatek/mtk_drm_plane.h
> > index 8f39011cdbfc..d3e6f29a1e25 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> > @@ -48,6 +48,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
> >
> >  int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
> >                    unsigned long possible_crtcs, enum drm_plane_type ty=
pe,
> > -                  unsigned int supported_rotations);
> > +                  unsigned int supported_rotations, bool supports_10bi=
t);
> >
> >  #endif
> > --
> > 2.39.0.314.g84b9a713c41-goog
> >

