Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1BDC54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2Q86j92pQ9q2wsMYUDefPiRAUR/rCfcZ3Y/y0U02v8=; b=dyZA0VvHBn+9B95NXnnGU4kXKa
	jYprx3q2nU8squApkL2tmzPabkwjPNUjBu+SiLbxSSJBeaFmaWTDpceryAO392WM9UVntrOE0eAbc
	MnWolft8FGue01kTMjQUE/FKWqYwjotFbbLGoEa5//F8qVJfF13dTr/6pfv6C5NXcs6qOGoGVQRLC
	fwzzbfNWH703D8lJQUkHwC1PDHHZqo23myyNBhrk7IsL9vqq8Yw9aBVkHoJvq4V0mvFXjadd8sMFg
	/SpUSqLDLl32sEisgFShBczW92IfEbE/UahRAnFD32SPhKZ3qZSv46AJcA+BijAOnmip9JCqBsSvc
	nGEZotyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLT3f-00Fyg2-Sr; Fri, 27 Jan 2023 18:02:39 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLT3d-00Fyed-05
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 18:02:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id v13so5417656eda.11
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 10:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2Q86j92pQ9q2wsMYUDefPiRAUR/rCfcZ3Y/y0U02v8=;
        b=CdDAORiYi7i8Rh5tx0vLXUjR6M49l7zi6wYWbctYHIiW9d5EDVrOzpXzWHxCvweTiM
         VsRE9D8RDYs6Gc07Ig3Gv2Goti67GkR3oaCqb91zHJ/hTw59daVB1+K0ukgP5parwwp9
         GZPYuqHvTRS3J1F85pOsxMJNi9unlWXkqxle8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2Q86j92pQ9q2wsMYUDefPiRAUR/rCfcZ3Y/y0U02v8=;
        b=ELkaJPSbFyeBV8cWCwQVOwUYDMNMRmbWjJUGa9brtYKUb2jc5Y1WH12unBX905vJBe
         nk9058ErTfTK5DxwYZUeyhJNMKn3dnKCP6Zvq2QzzVBFk9/H9WR1rCJNZrSg/Wny+DVT
         SBJNyMG2YqRh0DkgYBiNlV5i71smTV2DSmgEvf6SHyKf/evwDsLYgrnUfL2zGGGaNTaN
         6wwCLYoFH9WWkQ6eBQlaJPZwOd39R1V4Qo4E+xrF+Hz16mP4UMyCe5aMN0PG3EpWvFGI
         OcqCq/IGcDzsuilmH70Xe2siVgKGuJMFdcoER2o+ErFJA9p+9zja83vCp4TmMnuKgb/6
         Tyiw==
X-Gm-Message-State: AO0yUKVSSUn2mqLS4NbKSyLt5e26G6nD9cdT5nHjM+HjlH+v7yUAlHom
	hwJ2hM6s2BW07lVgJSYkOWAXB4dSaCP+GNyVQY8=
X-Google-Smtp-Source: AK7set8TVPDc4qZNJg5w6MKVsJVOX+ODbWsVY61spxYSfJ5HtfmrL6sMWKmM+0oEy5byfdpGOrttZw==
X-Received: by 2002:a05:6402:430b:b0:4a0:afd5:df81 with SMTP id m11-20020a056402430b00b004a0afd5df81mr13289241edc.35.1674842553317;
        Fri, 27 Jan 2023 10:02:33 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id w25-20020aa7d299000000b0048789661fa2sm2634734edq.66.2023.01.27.10.02.31
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 10:02:31 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id t18so5719234wro.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 10:02:31 -0800 (PST)
X-Received: by 2002:a5d:6b51:0:b0:2bf:c5cc:e1d6 with SMTP id
 x17-20020a5d6b51000000b002bfc5cce1d6mr164739wrw.659.1674842551177; Fri, 27
 Jan 2023 10:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20230127165409.3512501-1-robdclark@gmail.com>
In-Reply-To: <20230127165409.3512501-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Jan 2023 10:02:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XL_KKB1vbU=gZVXYJzs4pLEnACysp0Q9DxhkHGTR9AgA@mail.gmail.com>
Message-ID: <CAD=FV=XL_KKB1vbU=gZVXYJzs4pLEnACysp0Q9DxhkHGTR9AgA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove unused GEM DMA header include
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Rob Clark <robdclark@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_100237_057743_8E22525E 
X-CRM114-Status: GOOD (  14.13  )
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

Hi,

On Fri, Jan 27, 2023 at 8:54 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> No longer needed since the removal of dependency on DMA helper.
>
> Fixes: 2ea8aec56bf1 ("drm/mediatek: Remove dependency on GEM DMA helper")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reported-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index cd5b18ef7951..7e2fad8e8444 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -20,8 +20,8 @@
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
> -#include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_ioctl.h>

It took me a little while to realize why you needed this extra
include. I guess DEFINE_DRM_GEM_FOPS implicitly refers to drm_ioctl().
Seems like really drm_gem.h ought to be the one including drm_ioctl.h,
but maybe there's a good reason why we don't do that?

-Doug

