Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41596C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 16:18:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAD8520756
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 16:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WNBHwU8h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UuLTJKI/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAD8520756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BPHnEXv5OpPffQoNygSWz5hVT9VIbKS2ngheRbooDYY=; b=WNBHwU8hw4eCiGQ4M5yka8iqd
	lL3iL0sxBNi2FQeJpPmf3xnKv/LY6e2DzmKNuTxiTq0doeupRbTJLAqiI1rX0R2e4MPIjS8HRdhel
	sB5lm59O+UVtYVHHfufFFeFdHqEpUFudORRDIpelVAiGgF8nbwHo4liWnFXnIuhfave6p4qZeDFWP
	C0surtLklvM8XWlgz78PiUHBNbScQwhpnHprTgZNs76znMaD2SsLI5c4I7HnWI03ZfvsYFcv7RfI8
	ePA7pwWfdBl4uQPTx1V/m5zin2rYTqR2F9GVTx/UXq9UaNxl8EVd3VJMrP8+9mProjMqj5ZKBoug0
	AGGk1AyTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIDfC-00005E-5C; Tue, 15 Sep 2020 16:18:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDeq-0008OG-QU; Tue, 15 Sep 2020 16:18:21 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96A0920936;
 Tue, 15 Sep 2020 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600186696;
 bh=kNS2VFYnEd/KPhRHtnmjYC2U0lgvccEpIWWRdZorjVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UuLTJKI/2BDlkCzhAdZXdO7Phze+fU6p3ap+8i/sd3vdr/I5Hi5U4yp9o6PB13lH0
 ZuDFlAbkp3tgU9RFrayVzFqYW4WJCxXIWagM397axnyN9OCpPbLSgg6bdhU9c5PFF/
 sRar6wzjO68M3MXjSEmVY0h5IDBQ7UJv15+bCkLU=
Date: Tue, 15 Sep 2020 19:18:08 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Phil Chang <phil.chang@mediatek.com>
Subject: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Message-ID: <20200915161808.GH2142832@kernel.org>
References: <20200915150855.24825-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915150855.24825-1-phil.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_121817_440680_813ACAAB 
X-CRM114-Status: GOOD (  29.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alix Wu <alix.wu@mediatek.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, YJ Chiang <yj.chiang@mediatek.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 11:08:55PM +0800, Phil Chang wrote:
> Allowing the DMA32 zone be configurable in ARM64 but at most 4Gb.

Please add more details why would you like to limit the DMA32 zone.

> Signed-off-by: Alix Wu <alix.wu@mediatek.com>
> Signed-off-by: YJ Chiang <yj.chiang@mediatek.com>
> Signed-off-by: Phil Chang <phil.chang@mediatek.com>
> ---
> 
>  .../admin-guide/kernel-parameters.txt         |  3 ++
>  arch/arm64/include/asm/memory.h               |  2 +
>  arch/arm64/mm/init.c                          | 39 +++++++++++++++++--
>  3 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index bdc1f33fd3d1..5be6259e9ba8 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -980,6 +980,9 @@
>  			The filter can be disabled or changed to another
>  			driver later using sysfs.
>  
> +	dma32_size=nn[MG]  [KNL,BOOT,ARM64]
> +			Forces the DMA32 zone size of <nn> in MB.

Most of the kernel parameters that deal with memory sizes allow either
of [KMG] suffixes.

> +
>  	driver_async_probe=  [KNL]
>  			List of driver names to be probed asynchronously.
>  			Format: <driver_name1>,<driver_name2>...
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index afa722504bfd..710de08ae8ae 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -175,6 +175,8 @@ extern u64			kimage_vaddr;
>  /* the offset between the kernel virtual and physical mappings */
>  extern u64			kimage_voffset;
>  
> +extern phys_addr_t		dma32_zone_size;
> +
>  static inline unsigned long kaslr_offset(void)
>  {
>  	return kimage_vaddr - KIMAGE_VADDR;
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 481d22c32a2e..c8af53680d46 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -60,6 +60,9 @@ EXPORT_SYMBOL(physvirt_offset);
>  struct page *vmemmap __ro_after_init;
>  EXPORT_SYMBOL(vmemmap);
>  
> +phys_addr_t dma32_zone_size __ro_after_init;
> +EXPORT_SYMBOL(dma32_zone_size);
> +
>  /*
>   * We create both ZONE_DMA and ZONE_DMA32. ZONE_DMA covers the first 1G of
>   * memory as some devices, namely the Raspberry Pi 4, have peripherals with
> @@ -242,6 +245,29 @@ static int __init early_mem(char *p)
>  }
>  early_param("mem", early_mem);
>  
> +static int __init setup_dma32_zone(char *p)
> +{
> +	u64 size;
> +
> +	if (!p)
> +		return -EINVAL;
> +
> +	if (kstrtoull(p, 0, &size))
> +		return -EINVAL;

Better to use memparse() here.

> +
> +	/* DMA32 zone size should never grater than 4G */
> +	if (size > max_zone_phys(32) / SZ_1M)
> +		return -EINVAL;
> +
> +	pr_notice("Setup dma32 zone size to %llu Mb\n", size);
> +
> +	dma32_zone_size = size * SZ_1M;
> +
> +	return 0;
> +}
> +
> +early_param("dma32_size", setup_dma32_zone);
> +
>  static int __init early_init_dt_scan_usablemem(unsigned long node,
>  		const char *uname, int depth, void *data)
>  {
> @@ -392,10 +418,17 @@ void __init arm64_memblock_init(void)
>  		arm64_dma_phys_limit = max_zone_phys(ARM64_ZONE_DMA_BITS);
>  	}
>  
> -	if (IS_ENABLED(CONFIG_ZONE_DMA32))
> -		arm64_dma32_phys_limit = max_zone_phys(32);
> -	else
> +	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
> +		if (dma32_zone_size) {
> +			arm64_dma32_phys_limit = min(max_zone_phys(32),
> +				dma32_zone_size + memblock_start_of_DRAM());
> +		} else {
> +			arm64_dma32_phys_limit = max_zone_phys(32);
> +			dma32_zone_size = arm64_dma32_phys_limit;
> +		}

I think this calculations can be hidden in max_zone_phys(), e.g.

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 481d22c32a2e..be3fdfb35a56 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -189,7 +189,12 @@ static void __init reserve_elfcorehdr(void)
 static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
 {
 	phys_addr_t offset = memblock_start_of_DRAM() & GENMASK_ULL(63, zone_bits);
-	return min(offset + (1ULL << zone_bits), memblock_end_of_DRAM());
+	phys_addr_t zone_size = (1ULL << zone_bits);
+
+	if (IS_ENABLED(CONFIG_ZONE_DMA32) && zone_bits == 32 && dma32_zone_size)
+		zone_bits = min(zone_size,dma32_zone_size);
+
+	return min(offset + zone_size, memblock_end_of_DRAM());
 }
 
 static void __init zone_sizes_init(unsigned long min, unsigned long max)

> +	} else {
>  		arm64_dma32_phys_limit = PHYS_MASK + 1;
> +	}
>  
>  	reserve_crashkernel();
>  
> -- 
> 2.18.0

-- 
Sincerely yours,
Mike.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
