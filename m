Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD0AD339A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZu8xvjHxZba+3eh7yj1gxmmXMRVMkdDPiFN2ynDSGo=; b=gAruVUy4UpPpwjvld6iI95er0s
	RDhLUCLCz4v2BjSACLV7sNg9mgzGWWthT3I6rNLxEqrRsaJaOFkHI7Cw1eSN1ENaJa0XZWLU9t5ei
	u4HkXMKLpWi2DAOrIwPyC0H6/t9yGQoH16Z8TISeGM+SoM4QdF6HgR+nEOktreog/871t5wFCrA2t
	WrOi5m6D1inJ+0EwVp7pjnPmFrHJLfj7DQAUaQg+SGDv9OvM4RmzjAgq9RXWxO9fa5A8nQm0Ikknb
	BflL2VhG2pQ1N/48tMb2ftT0VtzmYbMiCqfWMxZ5HIDVfambXQK7oBgG05S4b3xJ2q3QuyG3oF1BM
	vaVsFH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TUw-0000000BeG5-2v62;
	Mon, 28 Oct 2024 17:25:46 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TSP-0000000Bdwl-2CVh
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 17:23:11 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso3973927e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730136187; x=1730740987; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZu8xvjHxZba+3eh7yj1gxmmXMRVMkdDPiFN2ynDSGo=;
        b=UyZ8K0PzV8MWvEdV4/EXKcz1rMFHe02qCdYClEGg7VPPRx3Fen9p5jAZ16L5X/OMsI
         ANi7h8RFDDPJZqNqS8BvftLbne/D4RqtNSvag5Y8CR/sqbigM73zqvgldTKbsve3wshd
         GgdiYMZG9RrhJ1Mjllp54WXOplDdlBktnNXYUAbH6zw022xXRzGJuVWkDoQh6gc4kHhO
         AzKYXLT3T8R7BZzyr2N+q4WXygLYBs1+HIwFHlj0T6yBJaZrcPtmu5BLuqTRPL/mzyYK
         k9koRCOqA84DAw2/ncYCtYU+wXK1ZdwqJk4V2eHqCZyDqbRjM7oh0Qcd0LHnO8B0HCqT
         abKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730136187; x=1730740987;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZu8xvjHxZba+3eh7yj1gxmmXMRVMkdDPiFN2ynDSGo=;
        b=wmByqaQyWC/Sjy4yvDnFK6xDdlR73L+o4DqwoGB6m7AiaFo9g9pQJLG+w01dZh7dDj
         2/TkEkJrPLMEsf+STt55tSKX4RTdwo1La4No7Ow8dHrRs/Ynh70AH4qcJ+tG697LA7ZH
         b1LkIroHH1kW4WfFxEsODOeoPXAFhkwnMdM3ByZOHNNcAkyxt/6m9qQo28sb08X68H1L
         8y8I+ZTjasFJoWgKIVjG/FH/GEvZDaGAKfNu/a2EcC0PyAiu1HA3NrRqQNDYnzX7aPon
         129Uo2nGPe3yDcy96Ulf+qM+9yQrVfN1v0i4uywuEp1qEjGFvZgiJyBkUULfaeZWIyVM
         pBQw==
X-Forwarded-Encrypted: i=1; AJvYcCUrDvsnWLpw5XkNPRffxpHZjk3EtzfOYCBImTCsMRkcDI1SVzBpNVo0edDVFbD6Cf0n2CXJiPshZh8bElo9lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1l2Y0JLFLWxmICKX3Rdt9ihU8RoF5j+K6Gu3Ys/sOfd7ovONA
	ahoMO6E7l93QGG3mNBe6FmLHqyXYvBkEvSSGcSyzYDxqZ7OTClXL8gde8pNlhNI=
X-Google-Smtp-Source: AGHT+IHgK/eV4on9k8mtCyUHrPvuiJUh7pQDUSq/q4wEJPNA22QGtkqRpLmwAMr6fW897v1uNQTfNg==
X-Received: by 2002:a05:6512:3087:b0:539:dc87:fd3a with SMTP id 2adb3069b0e04-53b348b508cmr3989900e87.6.1730136187288;
        Mon, 28 Oct 2024 10:23:07 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43193573cedsm120692905e9.4.2024.10.28.10.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 10:23:06 -0700 (PDT)
Message-ID: <be7ad677-f7e3-4eab-8b7e-1c375eed3ef7@linaro.org>
Date: Mon, 28 Oct 2024 18:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/of: support thermal zones w/o trips subnode
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wenst@chromium.org, rafael@kernel.org
Cc: Icenowy Zheng <uwu@icenowy.me>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20241018073139.1268995-1-wenst@chromium.org>
 <20241028171901.2484882-1-daniel.lezcano@linaro.org>
Content-Language: en-US
In-Reply-To: <20241028171901.2484882-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_102309_598142_8E5A17F5 
X-CRM114-Status: GOOD (  22.07  )
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

On 28/10/2024 18:19, Daniel Lezcano wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Although the current device tree binding of thermal zones require the
> trips subnode, the binding in kernel v5.15 does not require it, and many
> device trees shipped with the kernel, for example,
> allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, still
> comply to the old binding and contain no trips subnode.
> 
> Allow the code to successfully register thermal zones w/o trips subnode
> for DT binding compatibility now.
> 
> Furtherly, the inconsistency between DTs and bindings should be resolved
> by either adding empty trips subnode or dropping the trips subnode
> requirement.
> 
> Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> [wenst@chromium.org: Reworked logic and kernel log messages]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
> Link: https://lore.kernel.org/r/20241018073139.1268995-1-wenst@chromium.org
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

In order to fix a conflict when merging this patch I did the following 
changes. Let me know if you [dis]agree with the changes

This change will go through the 'fixes' branch, so for v6.12

Thanks

> ---
>   drivers/thermal/thermal_of.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index a4caf7899f8e..07e09897165f 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -99,18 +99,15 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>   	struct device_node *trips;
>   	int ret, count;
>   
> +	*ntrips = 0;
> +	
>   	trips = of_get_child_by_name(np, "trips");
> -	if (!trips) {
> -		pr_err("Failed to find 'trips' node\n");
> -		return ERR_PTR(-EINVAL);
> -	}
> +	if (!trips)
> +		return NULL;
>   
>   	count = of_get_child_count(trips);
> -	if (!count) {
> -		pr_err("No trip point defined\n");
> -		ret = -EINVAL;
> -		goto out_of_node_put;
> -	}
> +	if (!count)
> +		return NULL;
>   
>   	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
>   	if (!tt) {
> @@ -133,7 +130,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>   
>   out_kfree:
>   	kfree(tt);
> -	*ntrips = 0;
>   out_of_node_put:
>   	of_node_put(trips);
>   
> @@ -401,11 +397,14 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
>   
>   	trips = thermal_of_trips_init(np, &ntrips);
>   	if (IS_ERR(trips)) {
> -		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
> +		pr_err("Failed to parse trip points for %pOFn id=%d\n", sensor, id);
>   		ret = PTR_ERR(trips);
>   		goto out_of_node_put;
>   	}
>   
> +	if (!trips)
> +		pr_info("No trip points found for %pOFn id=%d\n", sensor, id);
> +
>   	ret = thermal_of_monitor_init(np, &delay, &pdelay);
>   	if (ret) {
>   		pr_err("Failed to initialize monitoring delays from %pOFn\n", np);


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

