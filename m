Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDD8C433C1
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 17:38:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B33661925
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 17:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B33661925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pEicN5GQvKpxElqUCo0NcB03I5z26dh90gLXtfEFn1k=; b=GQ3YTmpHUlwG2rX8ODLWInvMY
	yrxRZkVsXHTB0wVfLs7rzTX0IECU5g+aAu4+K0dMOoY96+OzEHoI7V/H4P9mYNqc1JLUkwxC2ALoI
	ynVfBFIIzCdPUtpSDf9DDIjeSWdjmw8uNyqOImlGDxYD0MoMCr/ZH81CQ77LdLM8R3flSqNp0rRpz
	h5/rC3UqPtt+NWcjt1u7/rLytSSP6NGoT0Q8FGZN8Rj/iTLA7I4HlX5bJDfVPGnk2qT8fkl9jV9FA
	qQcSERTg9kPJs1dvOxDADCjlVPyA8ksOxVBG2K7nISYAA9fcguKll3v87/wh/34WZsF/75QymvjZy
	lEn5HfO5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNJ4q-007rTa-Fw; Fri, 19 Mar 2021 17:38:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNJ4Y-007rQE-CG; Fri, 19 Mar 2021 17:38:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5557B6197A;
 Fri, 19 Mar 2021 17:38:01 +0000 (UTC)
Date: Fri, 19 Mar 2021 17:37:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 will@kernel.org, dan.j.williams@intel.com, aryabinin@virtuozzo.com,
 glider@google.com, dvyukov@google.com, akpm@linux-foundation.org,
 linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com,
 ardb@kernel.org, andreyknvl@google.com, broonie@kernel.org,
 linux@roeck-us.net, rppt@kernel.org, tyhicks@linux.microsoft.com,
 robin.murphy@arm.com, vincenzo.frascino@arm.com,
 gustavoars@kernel.org, lecopzer@gmail.com
Subject: Re: [PATCH v3 1/5] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
Message-ID: <20210319173758.GC6832@arm.com>
References: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
 <20210206083552.24394-2-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210206083552.24394-2-lecopzer.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_173806_836488_43160BD4 
X-CRM114-Status: GOOD (  20.29  )
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

On Sat, Feb 06, 2021 at 04:35:48PM +0800, Lecopzer Chen wrote:
> Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> ("kasan: support backing vmalloc space with real shadow memory")
> 
> Like how the MODULES_VADDR does now, just not to early populate
> the VMALLOC_START between VMALLOC_END.
> 
> Before:
> 
> MODULE_VADDR: no mapping, no zoreo shadow at init
> VMALLOC_VADDR: backed with zero shadow at init
> 
> After:
> 
> MODULE_VADDR: no mapping, no zoreo shadow at init
> VMALLOC_VADDR: no mapping, no zoreo shadow at init

s/zoreo/zero/

> Thus the mapping will get allocated on demand by the core function
> of KASAN_VMALLOC.
> 
>   -----------  vmalloc_shadow_start
>  |           |
>  |           |
>  |           | <= non-mapping
>  |           |
>  |           |
>  |-----------|
>  |///////////|<- kimage shadow with page table mapping.
>  |-----------|
>  |           |
>  |           | <= non-mapping
>  |           |
>  ------------- vmalloc_shadow_end
>  |00000000000|
>  |00000000000| <= Zero shadow
>  |00000000000|
>  ------------- KASAN_SHADOW_END
> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  arch/arm64/mm/kasan_init.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index d8e66c78440e..20d06008785f 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
>  {
>  	u64 kimg_shadow_start, kimg_shadow_end;
>  	u64 mod_shadow_start, mod_shadow_end;
> +	u64 vmalloc_shadow_end;
>  	phys_addr_t pa_start, pa_end;
>  	u64 i;
>  
> @@ -223,6 +224,8 @@ static void __init kasan_init_shadow(void)
>  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
>  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
>  
> +	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
> +
>  	/*
>  	 * We are going to perform proper setup of shadow memory.
>  	 * At first we should unmap early shadow (clear_pgds() call below).
> @@ -241,12 +244,17 @@ static void __init kasan_init_shadow(void)
>  
>  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
>  				   (void *)mod_shadow_start);
> -	kasan_populate_early_shadow((void *)kimg_shadow_end,
> -				   (void *)KASAN_SHADOW_END);
>  
> -	if (kimg_shadow_start > mod_shadow_end)
> -		kasan_populate_early_shadow((void *)mod_shadow_end,
> -					    (void *)kimg_shadow_start);

Not something introduced by this patch but what happens if this
condition is false? It means that kimg_shadow_end < mod_shadow_start and
the above kasan_populate_early_shadow(PAGE_END, mod_shadow_start)
overlaps with the earlier kasan_map_populate(kimg_shadow_start,
kimg_shadow_end).

> +	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
> +		kasan_populate_early_shadow((void *)vmalloc_shadow_end,
> +					    (void *)KASAN_SHADOW_END);
> +	else {
> +		kasan_populate_early_shadow((void *)kimg_shadow_end,
> +					    (void *)KASAN_SHADOW_END);
> +		if (kimg_shadow_start > mod_shadow_end)
> +			kasan_populate_early_shadow((void *)mod_shadow_end,
> +						    (void *)kimg_shadow_start);
> +	}
>  
>  	for_each_mem_range(i, &pa_start, &pa_end) {
>  		void *start = (void *)__phys_to_virt(pa_start);
> -- 
> 2.25.1
> 

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
