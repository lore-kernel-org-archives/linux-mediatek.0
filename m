Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD30C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 01:12:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78781601FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 01:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78781601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XL0k0HjT/2gRbDDGS8y/tK4RvJnkqlnU1bq+iT8oxE4=; b=v6VYW+x341iDy/
	vmlrFK5FLwj2F6vrQSvUeJb2vkPBiBaLrMg+4D1tQHUKV+TJ9O1GrMY8SxmUT9mYQpJ1qjX+YXgeQ
	cgbCy9+yxWAIHH36HcZmCupSSXmIGBQzqPyDtkxo0kuoEdrwgIZZ/n/vvz09x0Wl2T+SjIUnOnmUs
	l6ygNQ+qjzGcGbmP0aUhDXeabPwhAieG65vwSY9jYfJbT8Lgz6mqM1WSZRXePQ+yeinU0IpDlnwm9
	hzkyMBohRlki+v8sC+jLqu3hCapId4cMPoH3WX4zv0PzMLeW38owh3cy9jtuvdNAprnuZFRCd4yzc
	Ly+KmVeJ327IFSVgQeLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfB0c-000PEB-Tq; Tue, 26 Oct 2021 01:12:10 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfB0Q-000PC5-JQ
 for linux-mediatek@lists.infradead.org; Tue, 26 Oct 2021 01:12:00 +0000
Received: by mail-qk1-x735.google.com with SMTP id h20so13494371qko.13
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Oct 2021 18:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=10z83rn1dQLyIYsIkVAoxSDw4ZTZcNGKVFgCWqQpaRI=;
 b=O7FUpJ+Lf4ouk0CQSS6+rtrpb05h/csYBf6gBMi8eubWIEhWnUqA2KK+OMs0E5hnyP
 OJ75tTKAku67GQiKymEqwhHgdANicgK7TGgeRl0hNPvfBSPr2wbtOTHyeXdQlcI+6gYw
 RS5iVhKU1qq6NGWT+SlV4cuWiasAzrbr4gvXoXT1fYxzFZ3buCfJ+9gjYFyOAE/wmY16
 yPZS3+kP60A/CO28QONPKM/1WT2ZuOADXMEBrHoBMepZamFHQu0kEXfYu/qTcDtEnRqW
 +ia5+lP0mHkpRKx5xZvkTm2zIoMbSXw6Ny6QPbtIeV3Sfbj4SWJ1XP/M2BEKSKpPBm5N
 aqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=10z83rn1dQLyIYsIkVAoxSDw4ZTZcNGKVFgCWqQpaRI=;
 b=a/xjgLcAjTp4frRgXuQAP50IM1Gz7cuJHz+LO5wc7ykxWZFm6rxKV9DMOzzAHuh94m
 0dMV1s7QvWkiqu2teaNkkiBd5T31Yzfzw2sOrQe0SA5fMXobXHQLqSzg4Nop0Tio6U8a
 XXTw6SA+T95V9mOsplqJdAGygyW+VgdkrGWIc3iUkRUnPEcwuWC7M0/qjZTRN3O4SGBG
 Hj9P166seqrap3K+JlRmQHhA8qSwQ3PYF+xuyNOf2YcEzheAFOhupqSWyJf1AoIT7DEb
 f0CxTccEmR07ScrAau5tA9RhUcpNvGHoIsTuMAc796FxBQPR6z+R0sNbnfdyDMYyDv5L
 rzHQ==
X-Gm-Message-State: AOAM533o263tHzcpTP2GemyIwpe9ZBkqJEbHEKMoApgk2k5touZqelMb
 a18W3nSoUdDlJa7MVOe12/iMEzHQMjY=
X-Google-Smtp-Source: ABdhPJx3AyIQMi7nUKZ0qGI6PBHImbS56SPUe1LBpNs8MI9iz9C3YGwpEtgyc8Trb9/CIxVjLfPTOw==
X-Received: by 2002:a05:620a:f0b:: with SMTP id
 v11mr16051354qkl.429.1635210716577; 
 Mon, 25 Oct 2021 18:11:56 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id 14sm10381079qtp.97.2021.10.25.18.11.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Oct 2021 18:11:56 -0700 (PDT)
Date: Mon, 25 Oct 2021 21:11:54 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: linux-mediatek@lists.infradead.org, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mediatek: Set Rotation default value to 1.
Message-ID: <20211026011154.GE2515@art_vandelay>
References: <20211022165409.178281-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022165409.178281-1-markyacoub@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_181158_721776_00EB6A4D 
X-CRM114-Status: GOOD (  27.68  )
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

On Fri, Oct 22, 2021 at 12:54:02PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> The Rotation prob is a bitmask value. It must always have a valid value.

nit: s/prob/prop/

> A default NO rotation is equal to 1 not 0.
> 
> [How]
> 1. At the reset hook, call __drm_atomic_helper_plane_reset which is
> called at the initialization of the plane and sets the default value of
> all planes to DRM_MODE_ROTATE_0 which is equal to 1.
> 2. At the ovl layer check, do no overwrite the state->rotation value 0
> if DRM_MODE_ROTATE_0 is set. We should not change the value that the
> userspace has set, especially if it's an unsupported value.

nit: I would probably split these into 2 patches since they're related but
different

Sean

> 
> Tested on Jacuzzi(MTK).
> Fixes IGT@kms_properties@plane-properties-{legacy,atomic} and
> IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 20 +++++++-------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  3 ++-
>  4 files changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 86c3068894b11..2fc566964f68e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -64,7 +64,7 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
>  		    unsigned int h, unsigned int vrefresh,
>  		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
>  int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
> -			struct mtk_plane_state *mtk_state);
> +			const struct mtk_plane_state *mtk_state);
>  void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>  			  struct mtk_plane_state *state,
>  			  struct cmdq_pkt *cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index ea5760f856ec6..13999564304bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -190,19 +190,15 @@ unsigned int mtk_ovl_supported_rotations(struct device *dev)
>  }
>  
>  int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
> -			struct mtk_plane_state *mtk_state)
> +			const struct mtk_plane_state *mtk_state)
>  {
> -	struct drm_plane_state *state = &mtk_state->base;
> -	unsigned int rotation = 0;
> +	const struct drm_plane_state *state = &mtk_state->base;
> +	unsigned int rotation = drm_rotation_simplify(
> +		state->rotation,
> +		DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y);
>  
> -	rotation = drm_rotation_simplify(state->rotation,
> -					 DRM_MODE_ROTATE_0 |
> -					 DRM_MODE_REFLECT_X |
> -					 DRM_MODE_REFLECT_Y);
> -	rotation &= ~DRM_MODE_ROTATE_0;
> -
> -	/* We can only do reflection, not rotation */
> -	if ((rotation & DRM_MODE_ROTATE_MASK) != 0)
> +	/* We can only do reflection, not non-zero rotation */
> +	if (((rotation & ~DRM_MODE_ROTATE_0) & DRM_MODE_ROTATE_MASK) != 0)
>  		return -EINVAL;
>  
>  	/*
> @@ -212,8 +208,6 @@ int mtk_ovl_layer_check(struct device *dev, unsigned int idx,
>  	if (state->fb->format->is_yuv && rotation != 0)
>  		return -EINVAL;
>  
> -	state->rotation = rotation;
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 1b582262b682b..530bdd031933f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -53,9 +53,8 @@ struct mtk_ddp_comp_funcs {
>  	void (*disable_vblank)(struct device *dev);
>  	unsigned int (*supported_rotations)(struct device *dev);
>  	unsigned int (*layer_nr)(struct device *dev);
> -	int (*layer_check)(struct device *dev,
> -			   unsigned int idx,
> -			   struct mtk_plane_state *state);
> +	int (*layer_check)(struct device *dev, unsigned int idx,
> +			   const struct mtk_plane_state *state);
>  	void (*layer_config)(struct device *dev, unsigned int idx,
>  			     struct mtk_plane_state *state,
>  			     struct cmdq_pkt *cmdq_pkt);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index e6dcb34d30522..accd26481b9fb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plane)
>  		state = kzalloc(sizeof(*state), GFP_KERNEL);
>  		if (!state)
>  			return;
> -		plane->state = &state->base;
>  	}
>  
> +	__drm_atomic_helper_plane_reset(plane, &state->base);
> +
>  	state->base.plane = plane;
>  	state->pending.format = DRM_FORMAT_RGB565;
>  }
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
