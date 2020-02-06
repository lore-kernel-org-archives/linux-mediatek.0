Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACFEC2D0B1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 14:01:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B1021775
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 14:01:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oYj8uWiX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="SNO7Opxb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B1021775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbBoDNx6DWkvMteBucA10Oyr3HF/y6gaEJXqvKPHvIg=; b=oYj8uWiXMho8A4
	H5jmFu9aB7QInlsPv4XYQctvktSQBmaofZbYN0+X8ZFnR/6gPFx28MAhW41XaDucdwbgLLBqxI9BQ
	FPzgAq2XRldJyz2qntTwbPfiOh4QKRWWZLmu13RM0CdBhx2LqLYtCKwFhKQo7VglEXTrmYAvkaP2H
	S7ueWQVRrfnDzxJMgga57RCIOr7ExrtPr7zSvQZlwaTNOi1tZNU40n5dlAe0keRXKRwycuZWIckC5
	SVxB9Sp9o/yhkFmEVrVswbFa5hjsqHAhyxYXYOzubjLRzvHFq0QxDs6egU0LB46WUbrM/hnm9xljj
	x6HtSEpFzdTVCiaxm06w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izhj1-0002tl-Bj; Thu, 06 Feb 2020 14:01:47 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izhiy-0002sl-P8
 for linux-mediatek@lists.infradead.org; Thu, 06 Feb 2020 14:01:46 +0000
Received: by mail-yw1-xc41.google.com with SMTP id l5so5084414ywd.4
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 06:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DRB074YSrrw/Ajxbs86TrGm+cCr0lMPv565TdcUESKg=;
 b=SNO7Opxbqqr4USlH83nYZoF8Y/k3VNM1/AJNyi744lvue8HQAM51fJoc9sEosvRjFg
 +c0VwftSCxrSYWER5VkCTAr0Cp7KG6d7nYGuIIxKGAqI6ZGBKo7ozDQJtTYjTi+DGKlm
 0rBl1XN6C7x96HGnj20QkKLpYjFIpo4atXb42xL1763ihEgyuOKUrjWnpyX3U8OUzNqU
 XGs69QadXJG9DpydCEOZVMCXzdJxlo5m6s4QNFnxlfglpt+ktXv5yjdu60b/9FUaW6gF
 sg6Sik5l1eiN65KhjjBywlodgftu087eQ1BUGc+m6Z4vpsdUGq7x2/FE6s7ulU5gqIij
 1YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DRB074YSrrw/Ajxbs86TrGm+cCr0lMPv565TdcUESKg=;
 b=FEsKiaqIcOncQ0Rs6f2UJzWRmz3wK0o3Hi33xEWozA0fcYsyvp6Uo0JYR3+lPNCGHn
 hRME2F/T0z87APnhAOFUD02VvBnziP2hW6GV4GyTWzF2f6iwPqmSF6AGMkFvyzWj4cFD
 uHQmn2KbY4aVJj1H6bgai61GkZWtyBODE15bSwmnUMl5NpUWU3psVEw93+JFx8ARd4wS
 /rjcmYg3S7nUD1uQrAovU/yskqrL5t1znqQ1AgOB1UTEMkI4DlR3Lg9GTB9UBQAvoXBn
 VowHbVekODovlColpfyij3E5e1R5N+A/B8GNCQee4EXPOrdpw/HAJn6KbzLJnfAX29P8
 U8RQ==
X-Gm-Message-State: APjAAAWBT8faOn19XuCbarp5PLVMiKlZOaHp5Iieg2ibxQeTjxCEPCnZ
 gc/uIjX0dDQCBviQrNTAGzv84A==
X-Google-Smtp-Source: APXvYqxJ+qRIn5vw9ovBPy9eJ6PeFCEu6ye2FTwRuxN+5nN5TWx37YeBqVpz08U44oMti/32NqN4jw==
X-Received: by 2002:a81:37d3:: with SMTP id e202mr3220444ywa.292.1580997703374; 
 Thu, 06 Feb 2020 06:01:43 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id m137sm1471226ywd.108.2020.02.06.06.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 06:01:42 -0800 (PST)
Date: Thu, 6 Feb 2020 09:01:40 -0500
From: Sean Paul <sean@poorly.run>
To: evanbenn@google.com
Subject: Re: [PATCH] drm/mediatek: Ensure the cursor plane is on top of other
 overlays
Message-ID: <20200206140140.GA18465@art_vandelay>
References: <1580441226.9516.1.camel@mtksdaap41>
 <20200206065951.213862-1-evanbenn@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206065951.213862-1-evanbenn@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_060145_377145_BB171BC4 
X-CRM114-Status: GOOD (  20.70  )
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
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, ck.hu@mediatek.com,
 seanpaul@chromium.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2020 at 05:59:51PM +1100, evanbenn@google.com wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Currently the cursor is placed on the first overlay plane, which means
> it will be at the bottom of the stack when the hw does the compositing
> with anything other than primary plane. Since mtk doesn't support plane
> zpos, change the cursor location to the top-most plane.
> 
> Signed-off-by: Evan Benn <evanbenn@chromium.org>

Hi Evan,
Thanks for spotting the issue! I think this should probably be 2 patches, one to
fix crtc init and then the cursor patch on top of that. We generally try to only
do one thing per patch.

A few other nits below..

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
>  			     struct mtk_drm_crtc *mtk_crtc,
> -			     struct drm_plane *primary,
> -			     struct drm_plane *cursor, unsigned int pipe)
> +			     unsigned int pipe)
>  {
> -	int ret;
> +	int i, ret;
> +

extra line

> +	struct drm_plane *primary = NULL;
> +	struct drm_plane *cursor = NULL;

These should be on top of the int declaration

> +
> +	for (i = 0; i < mtk_crtc->layer_nr; ++i) {

We don't really do pre-increment in kernel for loops

> +		if (!primary && mtk_crtc->planes[i].type ==
> +				DRM_PLANE_TYPE_PRIMARY)

Line breaks should be around '&&':

                if (!primary &&
                    mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)

> +			primary = &mtk_crtc->planes[i];
> +		if (!cursor && mtk_crtc->planes[i].type ==

else if?

> +				DRM_PLANE_TYPE_CURSOR)
> +			cursor = &mtk_crtc->planes[i];


Since we can only have one primary and one cursor, the NULL checks on primary
and cursor are unnecessary, you can just blindly assign them when you hit a
plane of the right type. If the driver creates multiples the behavior is
undefined anyways.

> +	}
>  
>  	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>  					&mtk_crtc_funcs, NULL);
> @@ -711,11 +722,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
>  }
>  
>  static inline
> -enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
> +enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
> +					    unsigned int num_planes)
>  {
>  	if (plane_idx == 0)
>  		return DRM_PLANE_TYPE_PRIMARY;
> -	else if (plane_idx == 1)
> +	else if (plane_idx == (num_planes - 1))
>  		return DRM_PLANE_TYPE_CURSOR;
>  	else
>  		return DRM_PLANE_TYPE_OVERLAY;
> @@ -734,7 +746,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>  		ret = mtk_plane_init(drm_dev,
>  				&mtk_crtc->planes[mtk_crtc->layer_nr],
>  				BIT(pipe),
> -				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
> +				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
> +							num_planes),
>  				mtk_ddp_comp_supported_rotations(comp));
>  		if (ret)
>  			return ret;
> @@ -830,9 +843,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  			return ret;
>  	}
>  
> -	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> -				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> -				NULL, pipe);
> +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.25.0.341.g760bfbb309-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
