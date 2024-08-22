Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD07C52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqQrvchW0HkSOzS2pSqD+l7UJujl1OgB3mkky4QtnmI=; b=hG6Ce1EzmKH84yKtYFXlsfVUef
	/rnyfhunJQjITYfPud7t3/T8ByIiN0fhXNX41yixCxUa4FyVCpmwrjMlds2my31to4P8bD4n7Kyjl
	d8gS3NnS7sMLk7VeSP/Ek8PTlhsLBEYcA8ucrSi/TFRAaaepPFsk/I/Z83qjLs1Z0MLTJmk26q3n0
	V7DSt2wV1Mh3wNmmFCUnm4Gz3tMWqT5DMlFJErHlPOZoB13yPtBa2JmhQ3VPECcmZ9AToFTRcniPM
	PtA/IDkFuTP1bzqee8vQpq3Fn+fVC9ComWF0e/SelLTwCXiHbapbenlYF3Qsm2sp1rvYAUCj2mYaD
	vQdLQq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8cW-0000000D7Jz-44GF;
	Thu, 22 Aug 2024 14:17:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8bj-0000000D75K-2BEf;
	Thu, 22 Aug 2024 14:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6637CA40272;
	Thu, 22 Aug 2024 14:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D06C4AF11;
	Thu, 22 Aug 2024 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724336169;
	bh=W5kwXF+wJz51bitQriLhe8Uli77pQxLNfl6KnfeRs/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XIgbiW8FQYxrDZR0nMP5Ve6yr+YP7T4Dg3ykcO3Ro7O0JixNowObn9fRCQGWk9WWD
	 z3zm77AxqRUP+r+52AM2h8TY3CKWfdcnPfvyXgMbRAK87J0xhZC+mjH7SEkYxclXYc
	 cP88L+blh8qdgCyuC5/1KBov+tyKMSDcljEoL2fDKAqJmp69Zy3/oUCIiqGfg+F1dh
	 WoKoYm3Z74CQ/4Qp8fNbnxZ8iWyneN8Q+SMAttml/LvhXelKRrbm4/rhQhWYI/otoO
	 yjh6djVUkKDRkyLN6ekbuLboaA42uyQsNKdZyQh33mNBSP6261LESQ0wPInfBpg6Hz
	 ouyJu7Uh325vg==
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6e7b121be30so614644a12.1;
        Thu, 22 Aug 2024 07:16:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWP9I98fVY8XDUi8JfPtju3Y/cYJMbtJoN/HHsLq1SRS8h2AIAYv8C9mw1RcwLZV0dAjosXg1eXn6B1evibGWY=@lists.infradead.org, AJvYcCXqQ+cJ2kucby5RdFn7aWy35PTg5FMK8e4rwUdvo+YgqT7uWIUf3KpEp2ImjGSB2R50LjvY2bq7TUkSLxgULd6P@lists.infradead.org
X-Gm-Message-State: AOJu0YzXTBJgo42ZWTh5iLpYkKRlehtC2pgyK2tfGXE9OdCLcS6Bf5b7
	XwuKjR9LQHnI4W9KDLA0yVPvS7gz1O199Bc8zKRPbCKiyTWwwkuwGlI1jLKTVIgz0+dHPlwFP9s
	IOo55oK2GvBzTZD4BI+gOj9EWhQ==
X-Google-Smtp-Source: AGHT+IHWa/d6YEshaBG7X/oWKaxeKpPhnMr3wygRupON5CVgJxcR8GfDfn3XtpvG+CdSumjZAvL45/if2dc9g07I6Lc=
X-Received: by 2002:a17:90b:8c:b0:2d3:b748:96dd with SMTP id
 98e67ed59e1d1-2d616b56691mr2332303a91.25.1724336168860; Thu, 22 Aug 2024
 07:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240819-drm-fixup-0819-v2-1-a03580ece3ec@mediatek.com>
In-Reply-To: <20240819-drm-fixup-0819-v2-1-a03580ece3ec@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Aug 2024 22:16:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-XUtAGz26KUiXyceY=2OiqEoGMerLt3BpUOKcD36xH+g@mail.gmail.com>
Message-ID: <CAAOTY_-XUtAGz26KUiXyceY=2OiqEoGMerLt3BpUOKcD36xH+g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()
To: jason-jh.lin@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_071611_854347_68F99C8C 
X-CRM114-Status: GOOD (  25.73  )
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

Hi, Jason:

Jason-JH.Lin via B4 Relay
<devnull+jason-jh.lin.mediatek.com@kernel.org> =E6=96=BC 2024=E5=B9=B48=E6=
=9C=8819=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8B=E5=8D=8811:26=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>
> In mtk_crtc_ddp_config(), mtk_crtc will use some configuration flags to
> generate instructions to cmdq_handle, such as:
>   state->pending_config
>   mtk_crtc->pending_planes
>   plane_state->pending.config
>   mtk_crtc->pending_async_planes
>   plane_state->pending.async_config
>
> These configuration flags may be set to false when a GCE IRQ comes callin=
g
> ddp_cmdq_cb(). This may result in missing prepare instructions,
> especially if mtk_crtc_update_config() with the flase need_vblank (no nee=
d
> to wait for vblank) cases.
>
> Therefore, the mtk_crtc->config_updating flag is set at the beginning of
> mtk_crtc_update_config() to ensure that these configuration flags won't b=
e
> changed when the mtk_crtc_ddp_config() is preparing instructions.
> But somehow the ddp_cmdq_cb() didn't use the mtk_crtc->config_updating
> flag to prevent those pending config flags from being cleared.
>
> To avoid missing the configuration when generating the config instruction=
,
> the config_updating flag should be added into ddp_cmdq_cb() and be
> protected with spin_lock.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in v2:
> Add spin_lock protection for config_updating flag.
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 6f34f573e127..b752c0b46383 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -69,6 +69,8 @@ struct mtk_crtc {
>         /* lock for display hardware access */
>         struct mutex                    hw_lock;
>         bool                            config_updating;
> +       /* lock for config_updating to cmd buffer */
> +       spinlock_t                      config_lock;
>  };
>
>  struct mtk_crtc_state {
> @@ -107,10 +109,13 @@ static void mtk_crtc_finish_page_flip(struct mtk_cr=
tc *mtk_crtc)
>  static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
>  {
>         drm_crtc_handle_vblank(&mtk_crtc->base);
> +
> +       spin_lock(&mtk_crtc->config_lock);
>         if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank)=
 {
>                 mtk_crtc_finish_page_flip(mtk_crtc);
>                 mtk_crtc->pending_needs_vblank =3D false;
>         }
> +       spin_unlock(&mtk_crtc->config_lock);
>  }
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> @@ -314,6 +319,13 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void=
 *mssg)
>
>         state =3D to_mtk_crtc_state(mtk_crtc->base.state);
>
> +       spin_lock(&mtk_crtc->config_lock);
> +
> +       if (mtk_crtc->config_updating) {
> +               spin_unlock(&mtk_crtc->config_lock);
> +               goto ddp_cmdq_cb_out;
> +       }
> +
>         state->pending_config =3D false;
>
>         if (mtk_crtc->pending_planes) {
> @@ -340,6 +352,10 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void=
 *mssg)
>                 mtk_crtc->pending_async_planes =3D false;
>         }
>
> +       spin_unlock(&mtk_crtc->config_lock);
> +
> +ddp_cmdq_cb_out:
> +
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
>         wake_up(&mtk_crtc->cb_blocking_queue);
>  }
> @@ -571,7 +587,11 @@ static void mtk_crtc_update_config(struct mtk_crtc *=
mtk_crtc, bool needs_vblank)
>         int i;
>
>         mutex_lock(&mtk_crtc->hw_lock);
> +
> +       spin_lock(&mtk_crtc->config_lock);
>         mtk_crtc->config_updating =3D true;
> +       spin_unlock(&mtk_crtc->config_lock);
> +
>         if (needs_vblank)
>                 mtk_crtc->pending_needs_vblank =3D true;
>
> @@ -625,7 +645,10 @@ static void mtk_crtc_update_config(struct mtk_crtc *=
mtk_crtc, bool needs_vblank)
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
>  #endif
> +       spin_lock(&mtk_crtc->config_lock);
>         mtk_crtc->config_updating =3D false;
> +       spin_unlock(&mtk_crtc->config_lock);
> +
>         mutex_unlock(&mtk_crtc->hw_lock);
>  }
>
> @@ -1068,6 +1091,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, con=
st unsigned int *path,
>                 drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_s=
ize);
>         drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut=
_size);
>         mutex_init(&mtk_crtc->hw_lock);
> +       spin_lock_init(&mtk_crtc->config_lock);
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         i =3D priv->mbox_index++;
>
> ---
> base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
> change-id: 20240819-drm-fixup-0819-f51e2d37fcd7
>
> Best regards,
> --
> Jason-JH.Lin <jason-jh.lin@mediatek.com>
>
>

