Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91543C3F68F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 07:04:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 646F3217BA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 07:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N0thi5k0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QZk8BNm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 646F3217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBhThT/ygXohhBPx/MYzr1Mih6PrG/eOstCm4nMOktQ=; b=N0thi5k0moIubB
	ltZ00Z3NaRB4niKBvIvTB6wJ9QyQS9hvwHcS2TLF3uvoKevNFye+Oy6c3zJey81KO6KpWNR/mx7PM
	0w6rSXMv6MX+mD9RMd+Vj/kEkMvHCIPVG6zVoeWvdJb/g6zklzpXJI0zpugkIvAaUrfTEebVGv3RB
	Fdi2cDzPmZ47QU3SI6RNyyjDH24pj83MURKEU+YRU8v7DS86506B42oVyy2zvVHQca6gWIvK8P3PQ
	UeDIKfFHXoBMeqq1xizdWlbCXu2yujCw67koh+Dwt6AwAem66+umBayqVEOSp+/1bqAq3tQ94215L
	i+yjAqTjnPvMVHe1e7ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izbDN-0005jo-Iz; Thu, 06 Feb 2020 07:04:41 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izbDH-0005de-3z
 for linux-mediatek@lists.infradead.org; Thu, 06 Feb 2020 07:04:36 +0000
Received: by mail-ua1-x941.google.com with SMTP id l6so1865782uap.13
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2020 23:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ove59E8b1DoXqKIMNbPWcUTEg1A71z0FSmp+cEYbzQU=;
 b=QZk8BNm9AWR4jIvF+08vBb+bhGvV4R815TnZP+O4tXRraowiur+hfQqiL8TyyApr7C
 rVOGy2c+cDYsUyDvSWEWv0/FH1cqNBX500KcSsKr/dWPOInSoWs9KCioKaah/tNa4vyA
 TPBsPXHhMzHphpg+9YQIhWeGwH1a/P3Y2kZ+ytuJLd2bqOhQUu9wOtoToe5oX7lCtIW9
 dt5WOJTFWEE3Aj/K8VlZiB9Dcr3adGHXbaLqk9/edfimimn8FXosBwqf+ef/QSsWmsvI
 QhGF3HocD/AbVy48+/dBj34xGJa29qFJuxevVWbi9UlFLlSOi/vQtqbpaK6roSeIHNVv
 7Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ove59E8b1DoXqKIMNbPWcUTEg1A71z0FSmp+cEYbzQU=;
 b=IDd8YQQt+n7kyDx0t7s1wULLDzwy4VcvzO4TwxSiNejMHIFzs/1z4rD7iCj41bbige
 Z0i9juTuL0s7XUEeVcppppfX4c++oFA4RdzWFSSjrsnPuSLqs+jF8LTKYvPfHHfIO8zM
 M33aKOZPodcmvuQRmCf9IuODMBxl3Nu3Bx7BC7/uuSPmsg9Ad6QwHx42H4fEHQPV1dYB
 MOhpr7ElWM+5LwaPrEGNDcyw2CUe/Uc3ppWGDYM5y29keZ6urz85ESj54NajBtgFQNj2
 n/kI+/BDkF6agAHufPzT8uaE1OIud2mFUhMXM0xVPyxhgLTEmYNnFZjnKI6ecbZZHry1
 93UQ==
X-Gm-Message-State: APjAAAW4RgmNdLcuUe4s2es5AByerNQDtNbwlveFo1wzfvZNyKm0l4o/
 7h0DDYz4PtjH+UWcM+SHZEiOC0WRaLs0BHGmHmij9Q==
X-Google-Smtp-Source: APXvYqxUIf4tTjk0lKaAU43HHPHTdd0HPVTfnwWeW7nPH1mbgyJ0/ALEAhi8JI96h4uENmu5c/D5OVnD//9hW3plidw=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr824857uak.22.1580972667836;
 Wed, 05 Feb 2020 23:04:27 -0800 (PST)
MIME-Version: 1.0
References: <1580441226.9516.1.camel@mtksdaap41>
 <20200206065951.213862-1-evanbenn@google.com>
In-Reply-To: <20200206065951.213862-1-evanbenn@google.com>
From: Evan Benn <evanbenn@google.com>
Date: Thu, 6 Feb 2020 18:04:02 +1100
Message-ID: <CAKz_xw0Ue_B=E6UixLshoKa_J4jkOzK-C1RsAna4c4ALAALhAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Ensure the cursor plane is on top of other
 overlays
To: ck.hu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_230435_187904_2BB12A7E 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: dcastagna@chromium.org, evanbenn@gmail.com, evanbenn@chromium.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, seanpaul@chromium.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Apologies if I have formatted this wrong / sent to the wrong place!

The patch posted had an issue, another place in the driver was
assuming planes[1] still referred to the cursor.
Now search for the cursor before sending (as the plane cannot be
hard-coded, some devices have different numbers of planes).

Thanks

Evan Benn


On Thu, Feb 6, 2020 at 6:00 PM <evanbenn@google.com> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Currently the cursor is placed on the first overlay plane, which means
> it will be at the bottom of the stack when the hw does the compositing
> with anything other than primary plane. Since mtk doesn't support plane
> zpos, change the cursor location to the top-most plane.
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 29 +++++++++++++++++--------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7b392d6c71cc..d4078c2089e0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -658,10 +658,21 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>
>  static int mtk_drm_crtc_init(struct drm_device *drm,
>                              struct mtk_drm_crtc *mtk_crtc,
> -                            struct drm_plane *primary,
> -                            struct drm_plane *cursor, unsigned int pipe)
> +                            unsigned int pipe)
>  {
> -       int ret;
> +       int i, ret;
> +
> +       struct drm_plane *primary = NULL;
> +       struct drm_plane *cursor = NULL;
> +
> +       for (i = 0; i < mtk_crtc->layer_nr; ++i) {
> +               if (!primary && mtk_crtc->planes[i].type ==
> +                               DRM_PLANE_TYPE_PRIMARY)
> +                       primary = &mtk_crtc->planes[i];
> +               if (!cursor && mtk_crtc->planes[i].type ==
> +                               DRM_PLANE_TYPE_CURSOR)
> +                       cursor = &mtk_crtc->planes[i];
> +       }
>
>         ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>                                         &mtk_crtc_funcs, NULL);
> @@ -711,11 +722,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
>  }
>
>  static inline
> -enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
> +enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
> +                                           unsigned int num_planes)
>  {
>         if (plane_idx == 0)
>                 return DRM_PLANE_TYPE_PRIMARY;
> -       else if (plane_idx == 1)
> +       else if (plane_idx == (num_planes - 1))
>                 return DRM_PLANE_TYPE_CURSOR;
>         else
>                 return DRM_PLANE_TYPE_OVERLAY;
> @@ -734,7 +746,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>                 ret = mtk_plane_init(drm_dev,
>                                 &mtk_crtc->planes[mtk_crtc->layer_nr],
>                                 BIT(pipe),
> -                               mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
> +                               mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
> +                                                       num_planes),
>                                 mtk_ddp_comp_supported_rotations(comp));
>                 if (ret)
>                         return ret;
> @@ -830,9 +843,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
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
