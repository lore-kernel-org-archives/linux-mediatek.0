Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F5DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 03:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aOcEj4YuTo5pvKaU6FoaTGTafb+wjDf2FINOWEmlhg=; b=sAJXgWmL5TEasD
	KhmfsZkrHXNk8pI8apUTGPRyXBJmh1MsdTwH4NLeleoEsxVVXWOYurpuunDqFAoiPvbVIQaCd9kFD
	KkUgUVOeG/YxQrbDZrTk7Xr9bx30Nhic1jxA40OxNyYzzLsen6WcX1IwCIT4NaMaWdMX2ikIY9SFZ
	JKZklZOyVZRW9C44qG0jaYs4M0SnyW0sB5IeMPMw+uoIdzWxE14WIaVyFCjaByZSl6Rugcr50WVSy
	ZfPtK3Hr8pGOwlkCeLBS2Q5/mEVjgCfpl/MtqEZGr+gpVNypYn46Wz9vGdmz8W7gcBk55bo5F7/6z
	Le4WmkcgiwEY5tHe/E7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYg2a-007CCF-02; Mon, 28 Mar 2022 03:27:36 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYg2W-007CBQ-Um
 for linux-mediatek@lists.infradead.org; Mon, 28 Mar 2022 03:27:34 +0000
Received: by mail-pj1-x102d.google.com with SMTP id v4so12789381pjh.2
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 20:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vixNEnSztPR8utodtJVMHUP5vGc5IFUieG6cY4fj2LI=;
 b=l4+cafefdkk1SKuYN5gW3dNkluFT+Izkym8RFbJXpzSWF/FcmSHtJSjlWnNGp1VRX5
 8fTTT5Fu1YOXwcesLTjW9inl9HSuBPHPUr87DMoTuU4pa2harly0/EinoSfTc6KHy1qr
 mnIsTVIZoxxKqrdUapVZccd6tJjNM6ORGClyKUHYKKGw3dCr0vKYoYOUdmx4pbtf8s+N
 pafNwAylYUOkzCVWpK/kxB+v5/ay3S2avsPq06LJXcL+xxsduO8fqbbVWXuBIBt7zNgY
 3JKdX+QNcKgzt9CM4E3ewuQzk8TX2ZrB8BXpQoje6OE8v+Ny5dt3sR6GOT63yPtvXazN
 Voog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vixNEnSztPR8utodtJVMHUP5vGc5IFUieG6cY4fj2LI=;
 b=Q0YDzDV8/DGEr6W9Tf7aNUlqikFoICQPIxlfpKKKAh5z8a+tf7mc1J0wW+YCZDqBpk
 D4mWvK+eChjQssS/IzxPcwo05YMpjYEJ+ZAijkG9pSK924zITCfbrjCD8ccSOV6Jzcyj
 SDv9xfJ5ZzoSYsOXIsqIVGHEnnL6+T4Z51stUUvSBvvcGR2XBZyXQh1X6olDlLss5NGK
 MA9/uuhIYLjZoJzu4bwf/UT94HDXiQUS3J5BlxdzY6M1D8SWtmCLc4poJzqN2uZRF7dp
 phZInwv+5s4T5CmzAwSXF8Ahi1c/Z4AVa5zs2k8XjJRPyoxI7gry+cVbwaY0rI3z6D6j
 03+A==
X-Gm-Message-State: AOAM531Xse1rC7/GJ5cugZUP3oE6FBbG9dsiZ5jnPztoNiQKvJjLeBTN
 4LGZrNVTm6o+ODDR0WKtuOT0zQ==
X-Google-Smtp-Source: ABdhPJwV9q7eU9xDrd6oK2UlSipEyCUfSuAQ0dQ8mYg421xzTw+iZO8tpC3efbnOWbahidP0avM5ag==
X-Received: by 2002:a17:90b:17ca:b0:1c7:3010:5901 with SMTP id
 me10-20020a17090b17ca00b001c730105901mr39307960pjb.22.1648438052109; 
 Sun, 27 Mar 2022 20:27:32 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 u18-20020a056a00125200b004fb112ee9b7sm9331890pfi.75.2022.03.27.20.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 20:27:31 -0700 (PDT)
Date: Mon, 28 Mar 2022 08:57:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 Pierre.Gondois@arm.com, ionela.voinescu@arm.com, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
 mka@chromium.org, nm@ti.com, sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: Re: [RESEND][PATCH 7/8] thermal: cooling: Check Energy Model type in
 cpufreq_cooling and devfreq_cooling
Message-ID: <20220328032729.mutbjailxbmylffs@vireshk-i7>
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <20220321095729.20655-8-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220321095729.20655-8-lukasz.luba@arm.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_202733_034053_4361E9C5 
X-CRM114-Status: GOOD (  22.49  )
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

On 21-03-22, 09:57, Lukasz Luba wrote:
> The Energy Model can now be artificial, which means the power values
> are mathematically generated to leverage EAS while not expected to be on
> an uniform scale with other devices providing power information. If this
> EM type is in use, the thermal governor IPA should not be allowed to
> operate, since the relation between cooling devices is not properly
> defined. Thus, it might be possible that big GPU has lower power values
> than a Little CPU. To mitigate a misbehaviour of the thermal control
> algorithm, simply do not register the cooling device as IPA's power
> actor.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/thermal/cpufreq_cooling.c | 2 +-
>  drivers/thermal/devfreq_cooling.c | 8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
> index 0bfb8eebd126..b8151d95a806 100644
> --- a/drivers/thermal/cpufreq_cooling.c
> +++ b/drivers/thermal/cpufreq_cooling.c
> @@ -328,7 +328,7 @@ static inline bool em_is_sane(struct cpufreq_cooling_device *cpufreq_cdev,
>  	struct cpufreq_policy *policy;
>  	unsigned int nr_levels;
>  
> -	if (!em)
> +	if (!em || em_is_artificial(em))
>  		return false;
>  
>  	policy = cpufreq_cdev->policy;
> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
> index 4310cb342a9f..b04dcbbf721a 100644
> --- a/drivers/thermal/devfreq_cooling.c
> +++ b/drivers/thermal/devfreq_cooling.c
> @@ -358,6 +358,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
>  	struct thermal_cooling_device *cdev;
>  	struct device *dev = df->dev.parent;
>  	struct devfreq_cooling_device *dfc;
> +	struct em_perf_domain *em;
>  	char *name;
>  	int err, num_opps;
>  
> @@ -367,8 +368,9 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
>  
>  	dfc->devfreq = df;
>  
> -	dfc->em_pd = em_pd_get(dev);
> -	if (dfc->em_pd) {
> +	em = em_pd_get(dev);
> +	if (em && !em_is_artificial(em)) {
> +		dfc->em_pd = em;
>  		devfreq_cooling_ops.get_requested_power =
>  			devfreq_cooling_get_requested_power;
>  		devfreq_cooling_ops.state2power = devfreq_cooling_state2power;
> @@ -379,7 +381,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
>  		num_opps = em_pd_nr_perf_states(dfc->em_pd);
>  	} else {
>  		/* Backward compatibility for drivers which do not use IPA */
> -		dev_dbg(dev, "missing EM for cooling device\n");
> +		dev_dbg(dev, "missing proper EM for cooling device\n");
>  
>  		num_opps = dev_pm_opp_get_opp_count(dev);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
