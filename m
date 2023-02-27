Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D651C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 02:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ls/2DbGDVQ920cSuMd7N8W/74oBS2X+tX+BeZCFVl4=; b=E2hLCW9gQ4PaIXhNr5Fqo98NKQ
	DxNohfU2tw2lyOzvI8xsFzPtZ6jUwoWwckLEn66r4hEH3NtJgTtpaBuLwl1lc3+22dhbkLwqh0e77
	2iHtYrKBsZ6ULhCgjHBWUluaDMkc1RVIlO5m7FqybgLe9JAi3uytXWJR3SbsMv9BuElIX8/zc9HiI
	hHXksdovfGFgWYSbRaoCbaH4ZXlhgDhUX2pEd/UeODbEziLciTOsIHNHQQflYWskI1NVWPBp7YN3V
	AycIbH+T222arZhKcvFC5xBzFwxjyXUamg8Lbu1qrK6AuXnCBR270si7vTfP2R7GH6y3bjVIMvPWT
	3rReheOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWT8H-008HC9-Ay; Mon, 27 Feb 2023 02:20:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWT86-008HAF-3C; Mon, 27 Feb 2023 02:20:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A019FB80CB4;
	Mon, 27 Feb 2023 02:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56726C433D2;
	Mon, 27 Feb 2023 02:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677464438;
	bh=DKX4bjELnRDqNqB8Xibfj95F2AwEphb/8kHdo67CygU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hfdS6BftSt27OjmlOt+JUdbKAi0qalls81x3ScbHGIIUbfIzzCm9NSBYVRPkCAoZi
	 +Hfq/v/eUSHQR28qshjGh6DKDOeaokVDtg95loi1nk4IvsWfKSXuwbc3rrFJGFGo70
	 rX/63w7FgJidAgnQC1StIAuJboVRR2jDifdpEOdB3eIeeDj/7PAzL+SlCKLGSFFsZh
	 yiB4zgam4cIRCKzGrX1rseOMW1ae/EYsUZgvM0whYZHbaaxBWTkLpqHEeh6PqrnWEv
	 uDisw9R56m0/hTykIPD2EbSEOuqQL90P+0NhuIcd2Psaj6bO9m1R4O2V5TEqUbNW+e
	 KgYKqSAJZSFjA==
Received: by mail-lj1-f177.google.com with SMTP id z42so4891855ljq.13;
        Sun, 26 Feb 2023 18:20:38 -0800 (PST)
X-Gm-Message-State: AO0yUKVD2XrUtBPiFxYSzersnZOkY+JvWlGQgTxd+1ccpYEmrPwlu5Fx
	cvHUzbJo3MEhZmo9EspufB9s4dTAI+ZXZeAtig==
X-Google-Smtp-Source: AK7set9TwQ+Yn52E98mmUGHtGbh3/2lCt51pVRpWc51R7zlsaGH1EKaIm1duY59Jn1xjlBsYZwZCnHK6Q6CV2N4dFys=
X-Received: by 2002:a05:651c:2cc:b0:295:b1af:64ca with SMTP id
 f12-20020a05651c02cc00b00295b1af64camr1067491ljo.7.1677464436309; Sun, 26 Feb
 2023 18:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20230221081224.23017-1-yongqiang.niu@mediatek.com>
In-Reply-To: <20230221081224.23017-1-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 27 Feb 2023 10:20:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-wcao3GF=uaGJvMRy+mJJkBz8wib1eAN98XHr195G_9g@mail.gmail.com>
Message-ID: <CAAOTY_-wcao3GF=uaGJvMRy+mJJkBz8wib1eAN98XHr195G_9g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: add dma buffer control for drm plane disable
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_182042_475734_065ECE92 
X-CRM114-Status: GOOD (  22.20  )
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

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2023=E5=B9=B42=E6=9C=
=8821=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:12=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> dma buffer release before overlay disable, that will cause
> m4u translation fault warning.
>
> add dma buffer control flow in mediatek driver:
> get dma buffer when drm plane disable
> put dma buffer when overlay really disable

Add Fixes tag.

>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 19 +++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 12 ++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  1 +
>  3 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 5071f1263216..ff7924d8a167 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/mailbox_controller.h>
>  #include <linux/pm_runtime.h>
> @@ -282,6 +283,14 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(stru=
ct drm_crtc *crtc,
>         return NULL;
>  }
>
> +static void mtk_drm_dma_buf_put(struct mtk_plane_state *plane_state)
> +{
> +       if (plane_state && plane_state->pending.dma_buf) {
> +               dma_buf_put(plane_state->pending.dma_buf);
> +               plane_state->pending.dma_buf =3D NULL;
> +       }
> +}
> +
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
> @@ -306,6 +315,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void =
*mssg)
>                         plane_state =3D to_mtk_plane_state(plane->state);
>
>                         plane_state->pending.config =3D false;
> +                       mtk_drm_dma_buf_put(plane_state);
>                 }
>                 mtk_crtc->pending_planes =3D false;
>         }
> @@ -318,6 +328,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void =
*mssg)
>                         plane_state =3D to_mtk_plane_state(plane->state);
>
>                         plane_state->pending.async_config =3D false;
> +                       mtk_drm_dma_buf_put(plane_state);
>                 }
>                 mtk_crtc->pending_async_planes =3D false;
>         }
> @@ -498,8 +509,10 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crt=
c,
>                                 mtk_ddp_comp_layer_config(comp, local_lay=
er,
>                                                           plane_state,
>                                                           cmdq_handle);
> -                       if (!cmdq_handle)
> +                       if (!cmdq_handle) {
>                                 plane_state->pending.config =3D false;
> +                               mtk_drm_dma_buf_put(plane_state);

In shadow register case, it would also call into here, but it should
put dma buf in irq handler.

> +                       }
>                 }
>
>                 if (!cmdq_handle)
> @@ -523,8 +536,10 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crt=
c,
>                                 mtk_ddp_comp_layer_config(comp, local_lay=
er,
>                                                           plane_state,
>                                                           cmdq_handle);
> -                       if (!cmdq_handle)
> +                       if (!cmdq_handle) {
>                                 plane_state->pending.async_config =3D fal=
se;
> +                               mtk_drm_dma_buf_put(plane_state);
> +                       }
>                 }
>
>                 if (!cmdq_handle)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index d54fbf34b000..16495a057c42 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <linux/align.h>
> +#include <linux/dma-buf.h>
>
>  #include "mtk_drm_crtc.h"
>  #include "mtk_drm_ddp_comp.h"
> @@ -280,6 +281,17 @@ static void mtk_plane_atomic_disable(struct drm_plan=
e *plane,
>         struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
>                                                                          =
  plane);
>         struct mtk_plane_state *mtk_plane_state =3D to_mtk_plane_state(ne=
w_state);
> +       struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_st=
ate(state,
> +                                                                        =
  plane);
> +
> +       if (old_state && old_state->fb) {
> +               struct drm_gem_object *gem =3D old_state->fb->obj[0];
> +
> +               if (gem && gem->dma_buf) {
> +                       get_dma_buf(gem->dma_buf);
> +                       mtk_plane_state->pending.dma_buf =3D gem->dma_buf=
;

Should we check old pending.dma_buf is null here or somewhere else?
I would like to make sure that old dma buf is put before new dma buf
need to be put.

Regards,
Chun-Kuang.

> +               }
> +       }
>         mtk_plane_state->pending.enable =3D false;
>         wmb(); /* Make sure the above parameter is set before update */
>         mtk_plane_state->pending.dirty =3D true;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.h
> index 8f39011cdbfc..b724e56b7283 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -33,6 +33,7 @@ struct mtk_plane_pending_state {
>         bool                            async_dirty;
>         bool                            async_config;
>         enum drm_color_encoding         color_encoding;
> +       struct dma_buf                  *dma_buf;
>  };
>
>  struct mtk_plane_state {
> --
> 2.25.1
>

