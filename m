Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0E1C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:55:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D40611BD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D40611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qZZBuAFzvBmUYpEXCb3gtXrMI3aKb/Za39IYc1/Modk=; b=eXNEqmNvn3uZxfWFexqWkv1j3
	Og2WbLZB4dzYIbgFloLs5xmLMX+COv/zV0v3HylX/FQXYi7/ebXu22pFrZNDDggvP80EtmJLvLVqG
	x6jvOpYxdmlpuHQhJmhRAuVwgMnRjPNn+elC1MPXd/+Y0MtPS7UWUwvBUtJdy6QuUugD8bEt8Ll4p
	V/U5nzOluam9rPlOKmswA7R/UWiiVkG39ZFy1i6VybIWMt42U/JpXzZwxQHYf9JwCmX+hnO+Bo23p
	L4BziW0zlUTZTBIOeRUBQHR1euRQC7mwpZRoTky5OXpsnPo5FOIdHpSTEZuxOtD9D9movpmQ3Tlqc
	iTfTypT4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljZmH-005oGr-7s; Thu, 20 May 2021 03:55:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZmF-005oGV-Dj
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 03:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OZ6VS2QJMKCzoPLlDNWgVyV4xwBqPYXMZ6s6V0FP1g0=; b=DQFUMmLRLKS4RTZbjhn0YxwNBx
 lOkGb9iy5jq6e1wx62GfDbuH0o52IeCxhTSGooB9hcqbrMWoyILFpieR6GNxKtPpZM4sfVqvSf+nY
 7PPbvSpD+nQBHQQd+KsojbN3hkoBmAnmNszPYBG4TPKLSPHuMwK0ypfq+1Q2IZzxCDb+fmpgh3T0Y
 V8NxaEGY9xYtVul+AH4kIlNL8FF6dH9Zs/RL9RKOygknBP/9ykesjxER6Vzc8GTw8DYsst/FG+lBG
 17HhyIZQEHLalunOfrVCOXxYYs0fXTY7Sfs9k5zfxdmtpHcMzq/GtPX9eLvdDMXXL3Ud+TlH4klmZ
 52owAJwg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZmC-00FuwQ-RZ
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 03:55:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id 69so8241500plc.5
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 20:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OZ6VS2QJMKCzoPLlDNWgVyV4xwBqPYXMZ6s6V0FP1g0=;
 b=oCmte63xvzhUNs94qdZmYE6cRuv8cTD8Rvshq/a7UxcZbRheldugpn+yj5tUJG5TZA
 YIcDm4hUw/dJeTSW9V/Vn8igeqZ3UYxi3tNM/C3DlPq2991nYIu+uEBwm27mMacvEM/A
 H6NFPJTjV8F4g5wP4iTbd8f1/BtJlDUksBLvjlSf/gjyxdpJXT0kCWu+YRtzzAT9q7hH
 Gs/Ajy71xyCSZeCNYSAXdE6tzOgyFlSevqz5zWiXU9CX3th7UJXM/7TCYNY8w/0EYhxf
 rdm8tPR/ozfZei20s92L+3M7SVal9aLKmwnMjpSZG/P/oxSwf3HHVMdqsWW7a3H6kTPB
 rdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OZ6VS2QJMKCzoPLlDNWgVyV4xwBqPYXMZ6s6V0FP1g0=;
 b=di1ANCQ3RuHXai+2V1n+HbP9fRJOTlOSWHlatMTkW+HVtttaR8jJ1lsEH9rl+uBnMH
 6j/VbXcIF9JYtpaZBD9cYyZo/u5wiv3b7yq1krg096u4M9djlfvrJVLSHM1M5GClX9AQ
 IWp2yp5+n8smhTVo8hkWXkcQQV828BV/rGkKmpvV/dBWj9UVsh85Lj68AXVeawqcd9mz
 cKmEeWEYPgQw5nRxJvqmVu/GEdvaV6oVFJG80LvYPpDZkqYRblnMdjv5G5Ddu/G9xLSL
 3dQ/pra7ZQSJ9XX5+2Htgdm4bYf8f3J1T9UDcC8GVm4++f+HZGYkWI9Npg/+GLP2M//i
 TRmQ==
X-Gm-Message-State: AOAM53063Z/de8aDkIYmZkrv3Dn9reKqSXcekjvmDq8remJSXZCmXCB0
 GJj21BJgf30gmDHx3T002PinIQ==
X-Google-Smtp-Source: ABdhPJzcJpX0uew5mRSMgYp21Vdrcgs5nOW8XPejq4gAYE/EMCAHLekXJ5VZxMf7m+5mTmTbj7cGww==
X-Received: by 2002:a17:902:8205:b029:f4:a8f3:78c8 with SMTP id
 x5-20020a1709028205b02900f4a8f378c8mr3352663pln.11.1621482908279; 
 Wed, 19 May 2021 20:55:08 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id 6sm689249pfx.117.2021.05.19.20.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 20:55:07 -0700 (PDT)
Date: Thu, 20 May 2021 09:25:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 mkorpershoek@baylibre.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: add support for mt8365
Message-ID: <20210520035506.2ufedv7vj6wz2nze@vireshk-i7>
References: <20210519162550.3757832-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519162550.3757832-1-fparent@baylibre.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_205512_913519_1CDF50A9 
X-CRM114-Status: GOOD (  15.69  )
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

On 19-05-21, 18:25, Fabien Parent wrote:
> Add compatible stirng for MediaTek MT8365 SoC. Add also the
> compatible in the blacklist of the cpufreq-dt-platdev driver.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/mediatek-cpufreq.c   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 5e07065ec22f..d6fd821e3f5a 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -126,6 +126,7 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "mediatek,mt8173", },
>  	{ .compatible = "mediatek,mt8176", },
>  	{ .compatible = "mediatek,mt8183", },
> +	{ .compatible = "mediatek,mt8365", },
>  	{ .compatible = "mediatek,mt8516", },
>  
>  	{ .compatible = "nvidia,tegra20", },
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index f2e491b25b07..87019d5a9547 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -537,6 +537,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
>  	{ .compatible = "mediatek,mt8173", },
>  	{ .compatible = "mediatek,mt8176", },
>  	{ .compatible = "mediatek,mt8183", },
> +	{ .compatible = "mediatek,mt8365", },
>  	{ .compatible = "mediatek,mt8516", },
>  
>  	{ }

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
