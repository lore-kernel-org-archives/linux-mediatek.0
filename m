Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CBAC07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 10:28:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA59A60233
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 10:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA59A60233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAQ+mr6X8jiuHvE4SpYWAh5z8JaYSxSZ0jF/V+Yj7SI=; b=chqCvVeMm0tiDE
	lNGoSy1+XOfx213iBtDvlX/n+NmYYwcXnWOdj22cLMg4Zu6zgziT1RT/YBNvemWxE0hgbQuh3OGyA
	EVn5GKf9dw3SoR1uDPDZonjE9V/XBFT9wOCQxQ1GYJJOtAlLblRWhi8kFy4M5cxpnkgcWEXhiZQI/
	rTHOrWv81PFr2tJOM1SZ8am+Iz8QYRxhhBcF41CcGd3vnDRMiYkV0vtDykucuc5JqZ85We/XP8QMq
	5FgskyUdgLCz1QUY9etScnujiVdASBICp151GRwoPBHE34D+uy3weCkbdRD/qQvdmvPUaZK14Wpwm
	NJ5LdxGKQVkId4CkN4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5QVH-009GbF-VT; Mon, 19 Jul 2021 10:28:04 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5QVE-009GaC-UU; Mon, 19 Jul 2021 10:28:02 +0000
Received: by mail-oi1-x233.google.com with SMTP id w194so20176842oie.5;
 Mon, 19 Jul 2021 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v2dUDnfhrWV1GcdFhFWODw8LtsoVKTvHQwSdjp2I7IE=;
 b=Me6X5lcw9AeyzCra5gqYX3bWrJoAw/trfs/eSG+FCVUui6VoQdFL+6r+wGCi3gohBE
 PUZpAfZuQ0C83pBLQosfS7erxoKvt+uq/nHlIlPvg1nDAsa35npI+UuLqGEOLuVr4Lsz
 LiF8KRDBeghye9L4rTF7Fq/nLBtuCgALbeWPQH6a1/52kkCS9t1jXmaQR8gLLJGS4ma8
 zLD1KEjYWmNRCaSnBZNqa2RVNG0psHIcIX427CgPzfCP0Gd/J9nugOo69bBng/6RXejp
 uWWuKsww5YB3Ps+op63rA0xTKofWMwk+WVcE0iuobYMs3k1+QbZiC8GIxemmHKuCbeiz
 u5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v2dUDnfhrWV1GcdFhFWODw8LtsoVKTvHQwSdjp2I7IE=;
 b=HOleIFHafyMRE9HIajkDj6oxTSKC/9Gtl0vtC1VA1JLTEe5mFubDmhBSoepeS3o3QS
 ly209s2Nsh+x46LE4TAG17FuxEWpFLvekFaqX3jBr/ukzK1UincfCQxFEDqI3LJeP5E1
 FRnq99gjyoDtVIHVgAcLxjs4dFLFvCxJyG20h5oWJXHV6Z3CCOKwhuQ5hkbzNZ+vqh11
 y1dLftt52bksD5xwFeZ8RH2P+FuwsedFWU61ER4VF0X1b/267SjGqVbIctvpU+4RY8Sb
 yk/0GR6hmuyxAs4h0anUJ87ys2DVYL1PlUqUGMDkutKaaqBSEirMPWUpU5tPacB4TksB
 RNeg==
X-Gm-Message-State: AOAM533XQ+8/3znvLkA8DiQemEF1AOOX0GydCAdwXu6lhANqrsQlvpB9
 xMGU91mb/tsuMMiE0uUjkLO05wg4v94DoyeCIR4=
X-Google-Smtp-Source: ABdhPJzDVmukU2cfX815a2lb5DnoBTMmh+nwXAPmFnqqzkWYorjPe/Np7EQDK4m5XQgMGcQiCEphGA7VAs6IuAeHHoM=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr16617749oif.47.1626690479452; 
 Mon, 19 Jul 2021 03:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210719082238.26210-1-jason-jh.lin@mediatek.com>
 <20210719082238.26210-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210719082238.26210-2-jason-jh.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 19 Jul 2021 12:27:47 +0200
Message-ID: <CAFqH_5224qCXnLGKsO+iF8bG8fLa9Q9VYMpSmcnnh9yc3FevYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Fix cursor plane didn't update
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Maxime Ripard <maxime@cerno.tech>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, fshao@chromium.org,
 hsinyi@google.com, 
 nancy.lin@mediatek.com, singo.chang@mediatek.com, David-YH.Chiu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_032801_051454_398DD882 
X-CRM114-Status: GOOD (  26.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jason-jh,

Thank you for your patch. Please prefix this patch with 'drm/mediatek'
so it is clear what the changes are.

Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dl., 19
de jul. 2021 a les 10:24:
>
> The cursor plane should use the current plane state in atomic_async_update
> because it would not be the new plane state in the global atomic state
> since _swap_state happened when those hook are run.
>
> Fix cursor plane issue by below modification:
> 1. Remove plane_helper_funcs->atomic_update(plane, state) in
>    mtk_drm_crtc_async_update.
> 2. Add mtk_drm_update_new_state in to mtk_plane_atomic_async_update to
>    update the cursor plane by current plan hook and update the normal
>    plane by the new_state.
>
> Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")
>

Drop this new line

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

The patch below fixes the cursor issue on my two boards, one based on
mt8173 and the other on mt8183, so

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 60 ++++++++++++++----------
>  2 files changed, 34 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 474efb844249..063c75bab3a8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -538,7 +538,6 @@ void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
>         if (!mtk_crtc->enabled)
>                 return;
>
> -       plane_helper_funcs->atomic_update(plane, state);
>         mtk_drm_crtc_update_config(mtk_crtc, false);
>  }
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index b5582dcf564c..e6dcb34d3052 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -110,6 +110,35 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
>                                                    true, true);
>  }
>
> +static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
> +                                      struct mtk_plane_state *mtk_plane_state)
> +{
> +       struct drm_framebuffer *fb = new_state->fb;
> +       struct drm_gem_object *gem;
> +       struct mtk_drm_gem_obj *mtk_gem;
> +       unsigned int pitch, format;
> +       dma_addr_t addr;
> +
> +       gem = fb->obj[0];
> +       mtk_gem = to_mtk_gem_obj(gem);
> +       addr = mtk_gem->dma_addr;
> +       pitch = fb->pitches[0];
> +       format = fb->format->format;
> +
> +       addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
> +       addr += (new_state->src.y1 >> 16) * pitch;
> +
> +       mtk_plane_state->pending.enable = true;
> +       mtk_plane_state->pending.pitch = pitch;
> +       mtk_plane_state->pending.format = format;
> +       mtk_plane_state->pending.addr = addr;
> +       mtk_plane_state->pending.x = new_state->dst.x1;
> +       mtk_plane_state->pending.y = new_state->dst.y1;
> +       mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
> +       mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
> +       mtk_plane_state->pending.rotation = new_state->rotation;
> +}
> +
>  static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>                                           struct drm_atomic_state *state)
>  {
> @@ -126,8 +155,10 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>         plane->state->src_h = new_state->src_h;
>         plane->state->src_w = new_state->src_w;
>         swap(plane->state->fb, new_state->fb);
> -       new_plane_state->pending.async_dirty = true;
>
> +       mtk_plane_update_new_state(new_state, new_plane_state);
> +       wmb(); /* Make sure the above parameters are set before update */
> +       new_plane_state->pending.async_dirty = true;
>         mtk_drm_crtc_async_update(new_state->crtc, plane, state);
>  }
>
> @@ -189,14 +220,8 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>         struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
>                                                                            plane);
>         struct mtk_plane_state *mtk_plane_state = to_mtk_plane_state(new_state);
> -       struct drm_crtc *crtc = new_state->crtc;
> -       struct drm_framebuffer *fb = new_state->fb;
> -       struct drm_gem_object *gem;
> -       struct mtk_drm_gem_obj *mtk_gem;
> -       unsigned int pitch, format;
> -       dma_addr_t addr;
>
> -       if (!crtc || WARN_ON(!fb))
> +       if (!new_state->crtc || WARN_ON(!new_state->fb))
>                 return;
>
>         if (!new_state->visible) {
> @@ -204,24 +229,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>                 return;
>         }
>
> -       gem = fb->obj[0];
> -       mtk_gem = to_mtk_gem_obj(gem);
> -       addr = mtk_gem->dma_addr;
> -       pitch = fb->pitches[0];
> -       format = fb->format->format;
> -
> -       addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
> -       addr += (new_state->src.y1 >> 16) * pitch;
> -
> -       mtk_plane_state->pending.enable = true;
> -       mtk_plane_state->pending.pitch = pitch;
> -       mtk_plane_state->pending.format = format;
> -       mtk_plane_state->pending.addr = addr;
> -       mtk_plane_state->pending.x = new_state->dst.x1;
> -       mtk_plane_state->pending.y = new_state->dst.y1;
> -       mtk_plane_state->pending.width = drm_rect_width(&new_state->dst);
> -       mtk_plane_state->pending.height = drm_rect_height(&new_state->dst);
> -       mtk_plane_state->pending.rotation = new_state->rotation;
> +       mtk_plane_update_new_state(new_state, mtk_plane_state);
>         wmb(); /* Make sure the above parameters are set before update */
>         mtk_plane_state->pending.dirty = true;
>  }
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
