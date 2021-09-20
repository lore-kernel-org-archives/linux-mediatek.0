Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FEBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 13:34:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E446109D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 13:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30E446109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2OiNE9mHAMsXOKZ/t8LnlBenrLFVe9VgI/U3E292pK8=; b=Jx1Yb2foVrIXWHyD1PvfNTfKzC
	mW//WP8294hwZhbHxc9yGI1anprdqHGtqCNsRaowBIw8oK3Cyj4BOMqD9HKrwydpD8NFt7b1wzasm
	5i6N79hVfyTYwHoM9eObx0RKWYkqCaAiAegXotmdaW/Gw/AKOoLC7xSyxH+axgbkFBqRuZ3IQbDuA
	msQi1j+yJ2iToCm6tV5Apjw4QiZ42BSmBu5a/aVfWLMSrUoR6Oxj2TWtnZ/j95tDt2jvAYYdBvvP/
	QjT+7e8VrEe5E3AaqzJv9/tMJZxAToDAi79PZVQesWNW0KFxcsTpfAcjCvxSHDZhQC90ICeW/eqPU
	UDH/KdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJR7-001njA-Q2; Mon, 20 Sep 2021 13:34:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJQl-001nda-9d; Mon, 20 Sep 2021 13:34:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D0AF11B3;
 Mon, 20 Sep 2021 06:33:53 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C6B3F719;
 Mon, 20 Sep 2021 06:33:50 -0700 (PDT)
Subject: Re: [PATCH] panfrost: make mediatek_mt8183_supplies and
 mediatek_mt8183_pm_domains static
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, robh@kernel.org
Cc: tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <1631956414-85412-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <616fa113-7718-918c-db07-4826ef61b57f@arm.com>
Date: Mon, 20 Sep 2021 14:33:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631956414-85412-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_063359_477349_8285C986 
X-CRM114-Status: GOOD (  17.63  )
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

On 18/09/2021 10:13, Jiapeng Chong wrote:
> This symbol is not used outside of panfrost_drv.c, so marks it static.
> 
> Fix the following sparse warning:
> 
> drivers/gpu/drm/panfrost/panfrost_drv.c:641:12: warning: symbol
> 'mediatek_mt8183_supplies' was not declared. Should it be static?
> 
> drivers/gpu/drm/panfrost/panfrost_drv.c:642:12: warning: symbol
> 'mediatek_mt8183_pm_domains' was not declared. Should it be static?
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push to drm-misc-next.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 077cbbf..82ad9a6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -638,8 +638,8 @@ static int panfrost_remove(struct platform_device *pdev)
>  	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>  };
>  
> -const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
> -const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
> +static const char * const mediatek_mt8183_supplies[] = { "mali", "sram" };
> +static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
>  static const struct panfrost_compatible mediatek_mt8183_data = {
>  	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies),
>  	.supply_names = mediatek_mt8183_supplies,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
