Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D478EE4993
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 14:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mh33x1veGcoIeG4tLi1iKunkiaT9A4F6hZfRHyU7p6I=; b=nXZ7Eunt6kxktMkQ8Rz5oomKH8
	I6d4iHkk2i+kfdYzsv4XTKr6U0s57LvHXHdZ6yZJCtss/3mPL2ROpAu1/3SMNypIMWhmWptVpB/J3
	9Stma4S/RrwmXxBp6cF234T1yyldSMAuEDWUshn/Hl8F9zz5mD3NZzWM48VbGvQ6vqvLLNxx4AOBD
	QRJaCtGhQ3upVNIReLKI2DjsdnwMapBfXGWZvkUqAbr9k7YcPxdL75AN47Fi/Ag7iiaJNVOn0Z05y
	cWrU4+A5SYkkoKoVuoAGQhuqQg+kHywOx+zz0K0tewzBiNkFhj01oCn9IhCnzRRLS+lZT6UQ4jpIY
	EWLMXNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY5cp-00E9IO-1G;
	Mon, 21 Aug 2023 14:11:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY5cm-00E9GW-1F;
	Mon, 21 Aug 2023 14:11:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 886412F4;
	Mon, 21 Aug 2023 07:11:56 -0700 (PDT)
Received: from [10.57.34.4] (unknown [10.57.34.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E125C3F740;
	Mon, 21 Aug 2023 07:11:13 -0700 (PDT)
Message-ID: <562371e2-ef8f-0bc0-835b-23975e5e7a6d@arm.com>
Date: Mon, 21 Aug 2023 15:11:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next v2 1/2] drm/panfrost: Do not check for 0 return
 after calling platform_get_irq_byname()
Content-Language: en-GB
To: Ruan Jinjie <ruanjinjie@huawei.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230803040401.3067484-1-ruanjinjie@huawei.com>
 <20230803040401.3067484-2-ruanjinjie@huawei.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230803040401.3067484-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_071120_493258_35279F0F 
X-CRM114-Status: GOOD (  14.49  )
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

On 03/08/2023 05:03, Ruan Jinjie wrote:
> It is not possible for platform_get_irq_byname() to return 0.
> Use the return value from platform_get_irq_byname().
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++--
>  drivers/gpu/drm/panfrost/panfrost_job.c | 4 ++--
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index d28b99732dde..2faa344d89ee 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -390,8 +390,8 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
>  
>  	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
> -	if (irq <= 0)
> -		return -ENODEV;
> +	if (irq < 0)
> +		return irq;
>  
>  	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
>  			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..3322b3024937 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -794,8 +794,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  	spin_lock_init(&js->job_lock);
>  
>  	js->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
> -	if (js->irq <= 0)
> -		return -ENODEV;
> +	if (js->irq < 0)
> +		return js->irq;
>  
>  	ret = devm_request_threaded_irq(pfdev->dev, js->irq,
>  					panfrost_job_irq_handler,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index c0123d09f699..d54d4e7b2195 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -755,8 +755,8 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
>  	int err, irq;
>  
>  	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
> -	if (irq <= 0)
> -		return -ENODEV;
> +	if (irq < 0)
> +		return irq;
>  
>  	err = devm_request_threaded_irq(pfdev->dev, irq,
>  					panfrost_mmu_irq_handler,


