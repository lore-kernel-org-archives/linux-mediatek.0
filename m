Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58623C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 10:00:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1452F2173B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 10:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KkrAVYSK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="C+n82oQN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1452F2173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxiTEWA2G4KQOlaKSG0vMqwEbqq3xlMilq4Z0h9AhKQ=; b=KkrAVYSKxgiz7K
	NDBFEjUukeK2YUPWz6/YFwc4GTX/ep+fO2mgoJtCt024TtRjdACxAEhWKVAtdFFc3Wq+nqBgP4zIr
	NTJbmDsri59Yb6I7kT1JkAxdJ+5A3kUkcxFxNF0CvBW7SroPzvFeUV7ciLAVFhXCpPaveczdN/sO1
	CfpyKKX8SUf3QEqamUdlhWf+UUPI5+Fdgdg0ZwVj8ckHzGgIKReDZ+ChVY4JJ20kJXuIr+N1g7pCK
	Ry8nGjiQopoKEnXLiASnWt7gd+G4pxvq07sk0Rxy88PLe5hGnpxIhTKMV0CnT/0Jkz1HkFDYIQlxv
	5gfqvMF/DhesF8KUKRpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSI7Q-00061I-QS; Wed, 06 Nov 2019 10:00:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSI6k-0004qc-6K
 for linux-mediatek@lists.infradead.org; Wed, 06 Nov 2019 10:00:12 +0000
Received: by mail-wm1-x344.google.com with SMTP id t26so2576913wmi.4
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 02:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zy+pSn3ZcoonGSv1GO7C8DvEXQpMaLJfKmRCgcy5jsg=;
 b=C+n82oQNJFjenuv/DNJAgBzVrh8fyteQYuLVy1XYG0jKDYAL0O8OiwweQ2NLFw5+5Z
 ZdIrd+/HVctvnEXkFTMOx5+k//af4trZVXXZxnubH7Vim5naTIuY8nLC3gKoBR3quozj
 8X7xb90cwVKttEgAQgiN9Nv/y8jr4IvUoqNeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=zy+pSn3ZcoonGSv1GO7C8DvEXQpMaLJfKmRCgcy5jsg=;
 b=Itl8290tbwiTFqmxmszJXNGdVuNPRRdTsmgBmJmIO6BMqzSd/mNh2tzy+IvrXk/F4Q
 MLu8ST2kVEGTdenQ423sO0OlVt67uPm25h+1q20BgVVtFCVXK9weSB1pXRmBZ1ctu4gv
 TAnt5jxz42Rivw0/LcHW5uRXN4sEnKqeRIGcccZ0nfxUVFFrbP2Smy8JyARaV8fI5E8Z
 MVxGthHUzvosEeGL/8a0tQscT4FhglKWU/P9qAQPHkHhGW5ZWegZoIesqqfVeB2mfg2O
 gzrqMPzrPqa07TQWg1bicQ8fxS6KGE8/bRXTPLrIuvjfuhebL3LlAHft8qwhemmzbqVc
 i+sw==
X-Gm-Message-State: APjAAAXLSfYny104NPjBOefZvCiChHVq3W0ByQDZ1edgPtFcvrhIODYG
 HUI3lw03hQ1N+nrRLPwwOMMwsQ==
X-Google-Smtp-Source: APXvYqyQxNqhhawsrrSWps1N79qhazCv6pc1zOL9i3tUA/WFWiss6Xh9eJvnifMvzvFih9IDJzCAvg==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr1740732wmj.90.1573034407343;
 Wed, 06 Nov 2019 02:00:07 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id c144sm2310805wmd.1.2019.11.06.02.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 02:00:06 -0800 (PST)
Date: Wed, 6 Nov 2019 11:00:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH 1/1] drm/panel: boe-tv101wum-n16 seperate the panel power
 control
Message-ID: <20191106100004.GC23790@phenom.ffwll.local>
Mail-Followup-To: Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 cawa.cheng@mediatek.com, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, stonea168@163.com
References: <20191106081752.12944-1-jitao.shi@mediatek.com>
 <20191106081752.12944-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106081752.12944-2-jitao.shi@mediatek.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_020010_295762_20553602 
X-CRM114-Status: GOOD (  16.08  )
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
Cc: bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 06, 2019 at 04:17:52PM +0800, Jitao Shi wrote:
> Seperate the panel power control from prepare/unprepare.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Your patch series is all kinds of split up. Can you pls resend, with the
entire thing all in one go?

Thanks, Daniel

> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 69 +++++++++++++------
>  1 file changed, 49 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index e2496a334ab6..5b1b285a2194 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -50,6 +50,7 @@ struct boe_panel {
>  	struct regulator *avdd;
>  	struct gpio_desc *enable_gpio;
>  
> +	bool prepared_power;
>  	bool prepared;
>  	bool enabled;
>  
> @@ -501,12 +502,11 @@ static int boe_panel_disable(struct drm_panel *panel)
>  	return 0;
>  }
>  
> -static int boe_panel_unprepare(struct drm_panel *panel)
> +static int boe_panel_unprepare_power(struct drm_panel *panel)
>  {
>  	struct boe_panel *boe = to_boe_panel(panel);
> -	int ret;
>  
> -	if (!boe->prepared)
> +	if (!boe->prepared_power)
>  		return 0;
>  
>  	if (boe->desc->discharge_on_disable) {
> @@ -518,12 +518,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
>  		usleep_range(5000, 7000);
>  		regulator_disable(boe->pp1800);
>  	} else {
> -		ret = boe_panel_off(boe);
> -		if (ret < 0) {
> -			dev_err(panel->dev, "failed to set panel off: %d\n",
> -				ret);
> -			return ret;
> -		}
>  		msleep(150);
>  		gpiod_set_value(boe->enable_gpio, 0);
>  		usleep_range(500, 1000);
> @@ -533,17 +527,39 @@ static int boe_panel_unprepare(struct drm_panel *panel)
>  		regulator_disable(boe->pp1800);
>  	}
>  
> +	boe->prepared_power = false;
> +
> +	return 0;
> +}
> +
> +static int boe_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct boe_panel *boe = to_boe_panel(panel);
> +	int ret;
> +
> +	if (!boe->prepared)
> +		return 0;
> +
> +	if (!boe->desc->discharge_on_disable) {
> +		ret = boe_panel_off(boe);
> +		if (ret < 0) {
> +			dev_err(panel->dev, "failed to set panel off: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
>  	boe->prepared = false;
>  
>  	return 0;
>  }
>  
> -static int boe_panel_prepare(struct drm_panel *panel)
> +static int boe_panel_prepare_power(struct drm_panel *panel)
>  {
>  	struct boe_panel *boe = to_boe_panel(panel);
>  	int ret;
>  
> -	if (boe->prepared)
> +	if (boe->prepared_power)
>  		return 0;
>  
>  	gpiod_set_value(boe->enable_gpio, 0);
> @@ -571,18 +587,10 @@ static int boe_panel_prepare(struct drm_panel *panel)
>  	gpiod_set_value(boe->enable_gpio, 1);
>  	usleep_range(6000, 10000);
>  
> -	ret = boe_panel_init(boe);
> -	if (ret < 0) {
> -		dev_err(panel->dev, "failed to init panel: %d\n", ret);
> -		goto poweroff;
> -	}
> -
> -	boe->prepared = true;
> +	boe->prepared_power = true;
>  
>  	return 0;
>  
> -poweroff:
> -	regulator_disable(boe->avee);
>  poweroffavdd:
>  	regulator_disable(boe->avdd);
>  poweroff1v8:
> @@ -593,6 +601,25 @@ static int boe_panel_prepare(struct drm_panel *panel)
>  	return ret;
>  }
>  
> +static int boe_panel_prepare(struct drm_panel *panel)
> +{
> +	struct boe_panel *boe = to_boe_panel(panel);
> +	int ret;
> +
> +	if (boe->prepared)
> +		return 0;
> +
> +	ret = boe_panel_init(boe);
> +	if (ret < 0) {
> +		dev_err(panel->dev, "failed to init panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	boe->prepared = true;
> +
> +	return 0;
> +}
> +
>  static int boe_panel_enable(struct drm_panel *panel)
>  {
>  	struct boe_panel *boe = to_boe_panel(panel);
> @@ -754,7 +781,9 @@ static int boe_panel_get_modes(struct drm_panel *panel)
>  static const struct drm_panel_funcs boe_panel_funcs = {
>  	.disable = boe_panel_disable,
>  	.unprepare = boe_panel_unprepare,
> +	.unprepare_power = boe_panel_unprepare_power,
>  	.prepare = boe_panel_prepare,
> +	.prepare_power = boe_panel_prepare_power,
>  	.enable = boe_panel_enable,
>  	.get_modes = boe_panel_get_modes,
>  };
> -- 
> 2.21.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
