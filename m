Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B87C2D0B1
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 04:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44482253D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 04:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JHhx+YNu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fL8dDpBS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A44482253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SV8+GOHciyGl46X0T34aTcErmBx100cdcyFtt+CwmaI=; b=JHhx+YNudYHODc
	OU0s8atG8AcQnuLYn80fHIOT5hqTKZzIuCWCZ+zHbTUMtskFmE+jKzaaJmsSUvkuBW8AxqhRmNmpC
	G2gKG0v4tT9HpGW37gyHpLFF/s2G5oMBTVVHf4gm/7DJrEZv2P/KAik9Rt4ukQ3Wu6CMaFOi98Q//
	L2niDf+bis7S+JTjlKuSWlibsoJgosFR+1aoOZVJnt+htl0TMt3W9PYMkOD+TArt2qA+OC9/q567p
	3ai7OBxqqVvRyxj4d9fTHFV5MNEAZAkiSW+YHdBn7mO8IVaCnsce1aVCFAHAZoEXbwZUwRelRUzZc
	Eimvria5Z0eQAC6/dGAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izvdD-0004d3-Jq; Fri, 07 Feb 2020 04:52:43 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izvd5-0004Vp-Np
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 04:52:37 +0000
Received: by mail-oi1-x242.google.com with SMTP id q81so866951oig.0
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 20:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W8urWy+QgrC/YMF1CIIkby5XffaDuEx4UNskBOy8RUs=;
 b=fL8dDpBSRVSlM8FGOuZfEp6zopgEtvglqThCVlfAdJyXUd1xw/bl5PyyXPjVJMmE6O
 xhruU/YngLkt6YE9gdDXeL0++a8tYHMimWtQCT1caaDsqrcfcL2TXNgDO46Tg6IwfPBc
 N68ToIQHl33MkLSupJmZeDaLwA89c5qw5fqL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W8urWy+QgrC/YMF1CIIkby5XffaDuEx4UNskBOy8RUs=;
 b=JIoB2VDssQ3YLP2KwRNiXhjQ32FNErQ5kWa16g8gW5KYgdQkMr+RZkAeuMZBC55Lbl
 fI1K5fgMZx+8CfxvH+IqitnFVU8IG6SARzx0sgAGPJ99+J+FDwnNOxplcMfkYT7WGfxV
 Nm8FwtoTQdjAKQogLj5MenTMT64w04wi3ioEt2bCbEZKabUUlm9DINlq/IlrznfJtBeH
 x5jPIxw5F6S69BHFUaQ0XJvoA9DeiCCLFHpuXq6+hiDr1rYoXnUwWb1Xd7aPt32I+rHX
 jcdvPYP5Fb8WvWqRtdvP+coELl2sgULAq8g6b89JKpUvaaRL2MDqaV6n0247XY0GCzZl
 06dg==
X-Gm-Message-State: APjAAAWvUqYpA6z0j8Y9iXTrwz9jnuCEbl7GcS/vs/YCbzP903E2vMw0
 91FaCSRajYIj7HuStjDODREQ0QwO/E1b5PhF664MNQ==
X-Google-Smtp-Source: APXvYqxiVoCiey9ViAoCoUEG25fwaEz1f1ghn+enzI8QQgzUweirJ8Q8HY0XByHEr76nc8HhKhRjfHYPpevMD5tHvRo=
X-Received: by 2002:aca:ebc3:: with SMTP id j186mr871922oih.15.1581051154041; 
 Thu, 06 Feb 2020 20:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
In-Reply-To: <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
From: Evan Benn <evanbenn@chromium.org>
Date: Fri, 7 Feb 2020 15:52:23 +1100
Message-ID: <CAEJYR+nhwfqOK3Ogy=w_D9uS8uV-YsPckactgTX0nAe-_MKsQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
To: dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_205235_802203_6DDD035D 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Apologies for the confusing thread. Please apply the above patch:
'drm/mediatek: Find the cursor plane instead of hard coding it'
before Sean Paul's original patch:
'drm/mediatek: Ensure the cursor plane is on top of other overlays'

This way authorship is correctly preserved, but we do not introduce the bug.

Thanks


On Fri, Feb 7, 2020 at 3:23 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> The cursor and primary planes were hard coded.
> Now search for them for passing to drm_crtc_init_with_planes
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
>
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7b392d6c71cc..935652990afa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>
>  static int mtk_drm_crtc_init(struct drm_device *drm,
>                              struct mtk_drm_crtc *mtk_crtc,
> -                            struct drm_plane *primary,
> -                            struct drm_plane *cursor, unsigned int pipe)
> +                            unsigned int pipe)
>  {
> -       int ret;
> +       struct drm_plane *primary = NULL;
> +       struct drm_plane *cursor = NULL;
> +       int i, ret;
> +
> +       for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +               if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> +                       primary = &mtk_crtc->planes[i];
> +               else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> +                       cursor = &mtk_crtc->planes[i];
> +       }
>
>         ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>                                         &mtk_crtc_funcs, NULL);
> @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                         return ret;
>         }
>
> -       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> -                               mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> -                               NULL, pipe);
> +       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.25.0.341.g760bfbb309-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
