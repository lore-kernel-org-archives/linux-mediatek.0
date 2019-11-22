Return-Path: <SRS0=vzOr=ZO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5ACC432C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 17:09:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A075920714
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 17:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wl09CDLN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="eIBsIiSX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A075920714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4yqforITvZFMBsfSCpSs56vbYnMAwpBFvvicqqJWG8=; b=Wl09CDLN3Mwj8D
	XioV/V5F7SwdzAAzkB38JaNbJfFnMXujQOBVuNuSPNb0U021iJDV8eGqfsaN6fWN9QP2ACvRPeL20
	tQha3WCC3hp/h1HEkHS++gbiK5QuM+wpVef1XmGNazXu/4YriIHaadPXWaelrkJGDhjmGCrNQPUgN
	6WJFsgZj7rIslsYUWz5J/aTc6Ib2tpjps8xYZGcROUSqzT1OrCFVRhfqurke5nytzztMdMeCowJ1b
	LwG2KUqPzxaWRYARFFFCi6dZx/ycDRd15xhMZT7vi8eoOdFt8ipxI+u2hNzeSqiWOsDcAEML5RBdR
	SLVLO8hD0oS35ew4D6jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYCRS-0005sJ-R9; Fri, 22 Nov 2019 17:09:58 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYCRP-0005r0-M7
 for linux-mediatek@lists.infradead.org; Fri, 22 Nov 2019 17:09:57 +0000
Received: by mail-wr1-x441.google.com with SMTP id s5so9507762wrw.2
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Nov 2019 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GveeeDV1nQsr0bSwcCCx8Vsl+3Babn6Mlzv1ByhFH+Y=;
 b=eIBsIiSXvp5sCJ0yKABqoG/j1h+d84G9Zl0HXR0dSvxVhfIscq6daBNS4i0L3j3Fbf
 duO+xDNv0XJY09AcoqHPk0Ix3qIgPTsZ0UDjULIVZXqDQWkXjSytqrRayjTNAz81gVce
 goTINcX86DPQxJjU2D2wGD4TGIw4AIpqF/sgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GveeeDV1nQsr0bSwcCCx8Vsl+3Babn6Mlzv1ByhFH+Y=;
 b=qCkRlu7BZZ1UOBebbRAtBYZe37NKubIgzIu+BgzLiilhNwdpbcHhxLGMeLWIq/8569
 y1BV7vHj1+QHNb66NIkql6HhJYOH6SDW/DXVCF4ygk+nG9L/0plknPBs8KFS9x4CcNIc
 77X7GEDyEGzMi5SS4nA4F2Rgi8YPV6DAxVpnyiAuOqru+s6/XAcLKwivUxO0SisZJb74
 DP13GrkYFAl5TDr169ndPbJzfUpH1Q/yklJ+KPpg6bT1N1fkV4GQ8+BEPDQNadJCxSJb
 X1pYYD5UagnlA7Ws0ogMXJL4Fket1cOai+xSVkx9nNEkpMNTFqYUCZ5IrKYArUB8e/+r
 +jLA==
X-Gm-Message-State: APjAAAUFB7x3wJJeHs26ufyL3/XhFC2/9SuwKWaxXiTrjEGWsXA357T5
 8tPc+J/IXxPT3dC8E7y/Ft2xyw==
X-Google-Smtp-Source: APXvYqw21AitnDiR+uQCAQr38tNh94j5CW1Rt6qcwqHjdlzEy/qK8QLOZBeeWzbGVlFlIo1UR84bxw==
X-Received: by 2002:a5d:570f:: with SMTP id a15mr18390167wrv.316.1574442592095; 
 Fri, 22 Nov 2019 09:09:52 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id y11sm6590631wrq.12.2019.11.22.09.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 09:09:51 -0800 (PST)
Date: Fri, 22 Nov 2019 18:09:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 3/8] drm/mediatek: don't open-code drm_gem_fb_create
Message-ID: <20191122170949.GH6236@phenom.ffwll.local>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-4-daniel.vetter@ffwll.ch>
 <1574408559.21408.2.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574408559.21408.2.camel@mtksdaap41>
X-Operating-System: Linux phenom 5.3.0-1-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_090955_792901_163B9138 
X-CRM114-Status: GOOD (  22.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Nov 22, 2019 at 03:42:39PM +0800, CK Hu wrote:
> Hi, Daniel:
> 
> On Fri, 2019-11-15 at 10:21 +0100, Daniel Vetter wrote:
> > Aside: There's a few other fb_create implementations which
> > simply check for valid buffer format (or an approximation thereof),
> > and then call drm_gem_fb_create. For atomic drivers at least we could
> > walk all planes and make sure the format/modifier combo is valid,
> > and remove even more code.
> > 
> > For non-atomic drivers that's not possible, since the format list for
> > the primary buffer might be garbage (and most likely it is).
> > 
> > Also delete mtk_drm_fb.[hc] since it would now only contain one
> > function.
> 
> Acked-by: CK Hu <ck.hu@mediatek.com>

Pushed to drm-misc-next, thanks for taking a look.
-Daniel

> 
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: CK Hu <ck.hu@mediatek.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 16 ++++-
> >  drivers/gpu/drm/mediatek/mtk_drm_fb.c    | 92 ------------------------
> >  drivers/gpu/drm/mediatek/mtk_drm_fb.h    | 13 ----
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c |  1 -
> >  4 files changed, 15 insertions(+), 107 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_fb.c
> >  delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_fb.h
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 84d14213d992..2b1c122066ea 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -16,8 +16,10 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_fb_helper.h>
> > +#include <drm/drm_fourcc.h>
> >  #include <drm/drm_gem.h>
> >  #include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_vblank.h>
> > @@ -27,7 +29,6 @@
> >  #include "mtk_drm_ddp.h"
> >  #include "mtk_drm_ddp_comp.h"
> >  #include "mtk_drm_drv.h"
> > -#include "mtk_drm_fb.h"
> >  #include "mtk_drm_gem.h"
> >  
> >  #define DRIVER_NAME "mediatek"
> > @@ -115,6 +116,19 @@ static int mtk_atomic_commit(struct drm_device *drm,
> >  	return 0;
> >  }
> >  
> > +static struct drm_framebuffer *
> > +mtk_drm_mode_fb_create(struct drm_device *dev,
> > +		       struct drm_file *file,
> > +		       const struct drm_mode_fb_cmd2 *cmd)
> > +{
> > +	const struct drm_format_info *info = drm_get_format_info(dev, cmd);
> > +
> > +	if (info->num_planes != 1)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	return drm_gem_fb_create(dev, file, cmd);
> > +}
> > +
> >  static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
> >  	.fb_create = mtk_drm_mode_fb_create,
> >  	.atomic_check = drm_atomic_helper_check,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.c b/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> > deleted file mode 100644
> > index 3f230a28a2dc..000000000000
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_fb.c
> > +++ /dev/null
> > @@ -1,92 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0-only
> > -/*
> > - * Copyright (c) 2015 MediaTek Inc.
> > - */
> > -
> > -#include <linux/dma-buf.h>
> > -#include <linux/dma-resv.h>
> > -
> > -#include <drm/drm_modeset_helper.h>
> > -#include <drm/drm_fb_helper.h>
> > -#include <drm/drm_fourcc.h>
> > -#include <drm/drm_gem.h>
> > -#include <drm/drm_gem_framebuffer_helper.h>
> > -
> > -#include "mtk_drm_drv.h"
> > -#include "mtk_drm_fb.h"
> > -#include "mtk_drm_gem.h"
> > -
> > -static const struct drm_framebuffer_funcs mtk_drm_fb_funcs = {
> > -	.create_handle = drm_gem_fb_create_handle,
> > -	.destroy = drm_gem_fb_destroy,
> > -};
> > -
> > -static struct drm_framebuffer *mtk_drm_framebuffer_init(struct drm_device *dev,
> > -					const struct drm_mode_fb_cmd2 *mode,
> > -					struct drm_gem_object *obj)
> > -{
> > -	const struct drm_format_info *info = drm_get_format_info(dev, mode);
> > -	struct drm_framebuffer *fb;
> > -	int ret;
> > -
> > -	if (info->num_planes != 1)
> > -		return ERR_PTR(-EINVAL);
> > -
> > -	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
> > -	if (!fb)
> > -		return ERR_PTR(-ENOMEM);
> > -
> > -	drm_helper_mode_fill_fb_struct(dev, fb, mode);
> > -
> > -	fb->obj[0] = obj;
> > -
> > -	ret = drm_framebuffer_init(dev, fb, &mtk_drm_fb_funcs);
> > -	if (ret) {
> > -		DRM_ERROR("failed to initialize framebuffer\n");
> > -		kfree(fb);
> > -		return ERR_PTR(ret);
> > -	}
> > -
> > -	return fb;
> > -}
> > -
> > -struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
> > -					       struct drm_file *file,
> > -					       const struct drm_mode_fb_cmd2 *cmd)
> > -{
> > -	const struct drm_format_info *info = drm_get_format_info(dev, cmd);
> > -	struct drm_framebuffer *fb;
> > -	struct drm_gem_object *gem;
> > -	unsigned int width = cmd->width;
> > -	unsigned int height = cmd->height;
> > -	unsigned int size, bpp;
> > -	int ret;
> > -
> > -	if (info->num_planes != 1)
> > -		return ERR_PTR(-EINVAL);
> > -
> > -	gem = drm_gem_object_lookup(file, cmd->handles[0]);
> > -	if (!gem)
> > -		return ERR_PTR(-ENOENT);
> > -
> > -	bpp = info->cpp[0];
> > -	size = (height - 1) * cmd->pitches[0] + width * bpp;
> > -	size += cmd->offsets[0];
> > -
> > -	if (gem->size < size) {
> > -		ret = -EINVAL;
> > -		goto unreference;
> > -	}
> > -
> > -	fb = mtk_drm_framebuffer_init(dev, cmd, gem);
> > -	if (IS_ERR(fb)) {
> > -		ret = PTR_ERR(fb);
> > -		goto unreference;
> > -	}
> > -
> > -	return fb;
> > -
> > -unreference:
> > -	drm_gem_object_put_unlocked(gem);
> > -	return ERR_PTR(ret);
> > -}
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_fb.h b/drivers/gpu/drm/mediatek/mtk_drm_fb.h
> > deleted file mode 100644
> > index eb64d26001c6..000000000000
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_fb.h
> > +++ /dev/null
> > @@ -1,13 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Copyright (c) 2015 MediaTek Inc.
> > - */
> > -
> > -#ifndef MTK_DRM_FB_H
> > -#define MTK_DRM_FB_H
> > -
> > -struct drm_framebuffer *mtk_drm_mode_fb_create(struct drm_device *dev,
> > -					       struct drm_file *file,
> > -					       const struct drm_mode_fb_cmd2 *cmd);
> > -
> > -#endif /* MTK_DRM_FB_H */
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > index 3b0cc91c7023..540ef2faa40a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -13,7 +13,6 @@
> >  #include "mtk_drm_crtc.h"
> >  #include "mtk_drm_ddp_comp.h"
> >  #include "mtk_drm_drv.h"
> > -#include "mtk_drm_fb.h"
> >  #include "mtk_drm_gem.h"
> >  #include "mtk_drm_plane.h"
> >  
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
