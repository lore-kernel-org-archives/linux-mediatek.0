Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16720C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:39:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F7B2076C
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 15:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBc7ypMV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9F7B2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a5pjKmccAA0hUaDom/PRWpHHP5dQH4ecHhh8IXu0q7I=; b=JBc7ypMVNKfJcta9bPLB24Yql
	OdDf8L8Ckp2tGL0E35gWrGsGw/in1q+W348dbfP2areAutUJkj6rPIAUgoSpMZxbOp/61OpG0Eb2D
	C3B2XLST6vLk/L0PHpCHjVwxcEi5dFIz5eJ1RO8KWeW9uyP2M/SuZO/1iVqcsC2wAOP36FyjVSPcv
	JZHXf1s8cp9CpMWe5yhsWMj7d4QnX/DAiVQxPpzTDEiEyNPu9p1GsbxskJOWvD5QoLenRGEeBMD0Z
	O6eLj2vKl3yYOvxgMeCMRu0E9pR/wD+AB9LavsphatQEyovP6sWAW08zMzEjZ/AWVmC0A0fR767FY
	E/2ACK9GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2cZ4-0002iV-QV; Mon, 03 Aug 2020 15:39:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2cYz-0002gw-LK; Mon, 03 Aug 2020 15:39:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9126E30E;
 Mon,  3 Aug 2020 08:39:43 -0700 (PDT)
Received: from [10.57.35.143] (unknown [10.57.35.143])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D4DA3F718;
 Mon,  3 Aug 2020 08:39:40 -0700 (PDT)
Subject: Re: [PATCH] ARM64: Setup DMA32 zone size by bootargs
To: Phil Chang <phil.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org
References: <20200803142647.16737-1-phil.chang@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <db255462-7a02-f3a4-075a-5070f630e9d6@arm.com>
Date: Mon, 3 Aug 2020 16:39:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200803142647.16737-1-phil.chang@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_113945_829997_CB5235A3 
X-CRM114-Status: GOOD (  31.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Alix Wu <alix.wu@mediatek.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Steve Capper <steve.capper@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 YJ Chiang <yj.chiang@mediatek.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-03 15:26, Phil Chang wrote:
> this patch allowing the arm64 DMA zone be configurable.
> 
> Signed-off-by: Alix Wu <alix.wu@mediatek.com>
> Signed-off-by: YJ Chiang <yj.chiang@mediatek.com>
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> ---
> Hi
> 
> For some devices, the main memory split into 2 part due to the memory architecture,
> the efficient and less inefficient part.
> One of the use case is fine-tune the dma32 size to contain all the
> efficient part of memory block on this kind of architecture,
> but in general, the DMA32 zone size is hardcode to 4G.

The sole point of ZONE_DMA32 is to contain all the 32-bit addressable 
memory which is not covered by ZONE_DMA. As such the only possible thing 
that could be configured is the size of ZONE_DMA (if present), and this 
patch makes no sense.

If you want to describe NUMA characteristics, use NUMA properties. 
Giving users freedom to break fundamental assumptions of the DMA layer 
by arbitrarily changing the meaning of "32-bit" is not an appropriate 
solution.

Robin.

>   .../admin-guide/kernel-parameters.txt         |  3 ++
>   arch/arm64/include/asm/memory.h               |  2 ++
>   arch/arm64/mm/init.c                          | 33 +++++++++++++++++--
>   3 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index fb95fad81c79..441ad3cb8ee8 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -956,6 +956,9 @@
>   			The filter can be disabled or changed to another
>   			driver later using sysfs.
>   
> +	dma32_zone=nn	[KMG] [KNL,BOOT]
> +			Forces the DMA32 zone size of <nn> in mb, arm64 only.
> +
>   	driver_async_probe=  [KNL]
>   			List of driver names to be probed asynchronously.
>   			Format: <driver_name1>,<driver_name2>...
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index a1871bb32bb1..377f2252618a 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -174,6 +174,8 @@ extern u64			kimage_vaddr;
>   /* the offset between the kernel virtual and physical mappings */
>   extern u64			kimage_voffset;
>   
> +extern phys_addr_t		arm_dma_zone_size;
> +
>   static inline unsigned long kaslr_offset(void)
>   {
>   	return kimage_vaddr - KIMAGE_VADDR;
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 1e93cfc7c47a..642ab323392c 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -60,6 +60,9 @@ EXPORT_SYMBOL(physvirt_offset);
>   struct page *vmemmap __ro_after_init;
>   EXPORT_SYMBOL(vmemmap);
>   
> +phys_addr_t arm_dma_zone_size __ro_after_init;
> +EXPORT_SYMBOL(arm_dma_zone_size);
> +
>   /*
>    * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G of
>    * memory as some devices, namely the Raspberry Pi 4, have peripherals with
> @@ -242,6 +245,25 @@ static int __init early_mem(char *p)
>   }
>   early_param("mem", early_mem);
>   
> +/*
> + * Setup the dma32 zone size
> + */
> +static int __init setup_dma32_zone(char *p)
> +{
> +	if (!p)
> +		return -EINVAL;
> +
> +	if (kstrtoull(p, 0, &arm_dma_zone_size))
> +		return -EINVAL;
> +
> +	arm_dma_zone_size *= SZ_1M;
> +	pr_notice("Setup dma32 zone size to %llu Mb\n", arm_dma_zone_size);
> +
> +	return 0;
> +}
> +
> +early_param("dma32_zone", setup_dma32_zone);
> +
>   static int __init early_init_dt_scan_usablemem(unsigned long node,
>   		const char *uname, int depth, void *data)
>   {
> @@ -392,10 +414,15 @@ void __init arm64_memblock_init(void)
>   		arm64_dma_phys_limit = max_zone_phys(ARM64_ZONE_DMA_BITS);
>   	}
>   
> -	if (IS_ENABLED(CONFIG_ZONE_DMA32))
> -		arm64_dma32_phys_limit = max_zone_phys(32);
> -	else
> +	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
> +		if (arm_dma_zone_size)
> +			arm64_dma32_phys_limit = arm_dma_zone_size +
> +						memblock_start_of_DRAM();
> +		else
> +			arm64_dma32_phys_limit = max_zone_phys(32);
> +	} else {
>   		arm64_dma32_phys_limit = PHYS_MASK + 1;
> +	}
>   
>   	reserve_crashkernel();
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
