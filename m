Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DFEC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 10:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A96F8610A7
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 10:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A96F8610A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrIAjB91mipGYcGYGQr89ulnHSrmB96bQF6BpmbuJxc=; b=twdgbKLyIW/GEq
	E1mgIcnWFRLqkoOalJwT+r+Ho08ujS5NgrCP286UpSXR1LGAvN5k1WAwK4NiPARDly4jQFNm2ys/E
	Rh/CUaz8Culed+dTDIkeQneeNPFu8aRHHZ6Q/ehBqy3nuLszhv6OQtemJtC4qvDi+Dayep6OZtMTV
	4nnDCCDJ9Wh+WQQmx839M2vUc8Fvm+gEjUjySqadj5gI/FXvFLdbSAB1dgZ9lpyNV8kz7rFiT8Srk
	09oUxgF0JOCzafLgg2AsO559areTRb8DFd/6jRzNdYsox9xed/M+jhgsvVmEsbeZWsyHPEIg0GIlz
	XxCjtQ+sm1S8pxYBr9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3cEf-00DB6s-Kc; Wed, 14 Jul 2021 10:35:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3cBV-00D9p5-01
 for linux-mediatek@lists.infradead.org; Wed, 14 Jul 2021 10:32:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id a13so2551538wrf.10
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Jul 2021 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hA7grU+s8xTzHDiN3chHrqXRM0NV+J697ZPMtp629lU=;
 b=Z9sd383cULVxmZk+/4TY7e8qfi1MFLCXj0i9y3rEwQK/n4ncYe8f+Utlis30DSfCa0
 QnoiqFnfSN7VOI1+7p6anUk0p2PV8vJPEQlCms4fy/X69x+sP2SMofTWE+eSXn5zsPYP
 i2cCZBxNJOedzXzf2Dle3wOy+NcHuY/uWabYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hA7grU+s8xTzHDiN3chHrqXRM0NV+J697ZPMtp629lU=;
 b=tz0RFwkH1S5A+5pwGLe9uBKzD+qyqt9GN9n9CWTEOdx2WzS8z+ToZamgWHR6uHvGSb
 GmoGkDOHT6vae/t1WAlWv0Y3nNwJIg+q9k5iM3C3I/Fr7EwoFFE9a7BWMwmpH8WJd2MA
 ozMj8Ubv2pR2yLMii6dKn+kFhNnxPRw2ggH91E2eHhU3k6gFEDDtpAxNs7M2sDyj7eT4
 UTUJiVBxhUf6GPTZlE3CWOa6jMGXuS/RGsemTNwwCtxnsWXV1oPKZl/TqR3BgVCsRvDk
 5y2EwbKLlJSrkD5JXu9t4w2yPe02D+ljuLBUQcxTwLxeGCXAUycs1pv16OGXrSfOIhKD
 MvYA==
X-Gm-Message-State: AOAM532ojFA5VRQTWsK9YuU5cVp9xG0aISh8VECLTj3+XxYJoQtbjsg0
 3Rw1yhIY+PwMpzqhdw+PaezeYw==
X-Google-Smtp-Source: ABdhPJzvSc2OjoSlFuxPRvs9s3AyFVzpM4KB/ZPzIs3nRgrLA+4Sk5mYljlfPoCZzJpjqs697gBVBQ==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr12031463wrg.167.1626258725391; 
 Wed, 14 Jul 2021 03:32:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d10sm1972253wro.43.2021.07.14.03.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 03:32:04 -0700 (PDT)
Date: Wed, 14 Jul 2021 12:32:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Yu Jiahua <yujiahua1@huawei.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Use pm_runtime_force_{suspend,resume}
Message-ID: <YO69IsBXv+lbcuWp@phenom.ffwll.local>
Mail-Followup-To: Pi-Hsun Shih <pihsun@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Yu Jiahua <yujiahua1@huawei.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
References: <20210714060221.1483752-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714060221.1483752-1-pihsun@chromium.org>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_033209_148208_3E8ADF56 
X-CRM114-Status: GOOD (  43.00  )
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

On Wed, Jul 14, 2021 at 02:01:59PM +0800, Pi-Hsun Shih wrote:
> Use pm_runtime_force_suspend and pm_runtime_force_resume to ensure that
> anx7625 would always be powered off when suspended. Also update the
> bridge enable hook to always ensure that the anx7625 is powered on
> before starting DP operations.
> 
> Fixes: 409776fa3c42 ("drm/bridge: anx7625: add suspend / resume hooks")
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> 
> ---
> 
> An issue was found that the anx7625 driver won't power off when used as
> eDP bridge on Asurada board if suspend is entered via VT2.
> 
> The reason is that in this case, anx7625_suspend won't power off anx7625
> (since intp_irq is not set). And anx7625_bridge_disable is only called
> indirectly by other driver's (mediatek-drm) suspend.
> pm_runtime_put_sync won't do anything since it's already in system
> suspend.
> 
> If not in VT2, the bridge disable is indirectly called when Chrome
> stops, so anx7625 will be powered off correctly.
> 
> To fix the issue, the suspend resume hooks are changed to
> pm_runtime_force_{suspend,resume} to ensure the runtime suspend / resume
> is always called correctly when system suspend / resume.
> (Note that IRQ no longer needs to be disabled on suspend after commit
> f03ab6629c7b ("drm/bridge: anx7625: Make hpd workqueue freezable"))
> 
> Since bridge disable is called indirectly by mediatek-drm driver's
> suspend, it might happens after anx7625 suspend is called. So a check
> if the driver is already suspended via pm_runtime_force_suspend is also
> added, to ensure that the anx7625_dp_stop won't be called when power
> is off. And also since bridge enable might happens before anx7625 resume
> is called, a check to that is also added, and would force resume the
> device in this case.
> 
> I'm not sure if the approach to fix this is the most appropriate way,
> since using pm_runtime_force_resume in bridge enable kinda feels hacky
> to me. I'm open to any suggestions.

I thought the real fix was to create device links between the bridge and
the other parts of the overall drm driver, so that the driver core can
resume devices in the right order.

Unfortunately those device link patches haven't made it in yet. Quick
search on lore didn't find anything, maybe I was just dreaming, or maybe
the patches only existed for panels.

Either way, this is a drm_bridge.c problem that needs to be fixed there,
not individually in each driver.
-Daniel

> 
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 55 +++++++++--------------
>  1 file changed, 20 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a3d82377066b..9d0f5dc88b16 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1559,7 +1559,20 @@ static void anx7625_bridge_enable(struct drm_bridge *bridge)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
>  
> -	pm_runtime_get_sync(dev);
> +	/*
> +	 * The only case where pm_runtime is disabled here is when the function
> +	 * is called other driver's resume hook by
> +	 * drm_mode_config_helper_resume, but when the pm_runtime_force_resume
> +	 * hasn't been called on this device.
> +	 *
> +	 * pm_runtime_get_sync won't power on anx7625 in this case since we're
> +	 * in system resume, so instead we force resume anx7625 to make sure
> +	 * the following anx7625_dp_start would succeed.
> +	 */
> +	if (pm_runtime_enabled(dev))
> +		pm_runtime_get_sync(dev);
> +	else
> +		pm_runtime_force_resume(dev);
>  
>  	anx7625_dp_start(ctx);
>  }
> @@ -1571,9 +1584,10 @@ static void anx7625_bridge_disable(struct drm_bridge *bridge)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
>  
> -	anx7625_dp_stop(ctx);
> -
> -	pm_runtime_put_sync(dev);
> +	if (pm_runtime_enabled(dev)) {
> +		anx7625_dp_stop(ctx);
> +		pm_runtime_put_sync(dev);
> +	}
>  }
>  
>  static enum drm_connector_status
> @@ -1705,38 +1719,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused anx7625_resume(struct device *dev)
> -{
> -	struct anx7625_data *ctx = dev_get_drvdata(dev);
> -
> -	if (!ctx->pdata.intp_irq)
> -		return 0;
> -
> -	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
> -		enable_irq(ctx->pdata.intp_irq);
> -		anx7625_runtime_pm_resume(dev);
> -	}
> -
> -	return 0;
> -}
> -
> -static int __maybe_unused anx7625_suspend(struct device *dev)
> -{
> -	struct anx7625_data *ctx = dev_get_drvdata(dev);
> -
> -	if (!ctx->pdata.intp_irq)
> -		return 0;
> -
> -	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
> -		anx7625_runtime_pm_suspend(dev);
> -		disable_irq(ctx->pdata.intp_irq);
> -	}
> -
> -	return 0;
> -}
> -
>  static const struct dev_pm_ops anx7625_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
>  			   anx7625_runtime_pm_resume, NULL)
>  };
> 
> base-commit: c0d438dbc0b74901f1901d97a6c84f38daa0c831
> -- 
> 2.32.0.93.g670b81a890-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
