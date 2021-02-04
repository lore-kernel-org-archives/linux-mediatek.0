Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84502C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 12:46:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B6A64F5C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 12:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B6A64F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bZ9m7xc7WNMV6GrXaQUOpxIVvd9rCMUlwbwGDQ8AO4M=; b=Dw4elG6ICFCwH2UiTVt4MopE9
	aHUk3uJGwn/gTPhhD0/QU6lFoPUHYBwwLDBQo3Jjw0n3fDKCqCudMUtY+oRQ2SX9hHP0dinNJETZP
	3eFenfUcJlukaOdclarmkMNtV3k5RO6keKiE8TJjP3LYt98/tMv24POPuNDRI5YbY6Rq9B4DToAXI
	GceK1RTJzaxESZrThGS5lR25T7qI7vkNQqtTdumW+uyevd5RNuCb8Rk8QNd5D8B0b8CXc2ecKjkPV
	vJW7L+iX8rbK8VNZnMuL7CwFL9AwKaCJJom7mXLlSTtfIAsGI0cIUM9FXhFJaIQ9t4CPB0F+/+v66
	5GKeqsK5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7e1E-0001d0-Ms; Thu, 04 Feb 2021 12:45:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7e1A-0001c4-2z; Thu, 04 Feb 2021 12:45:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FBF664F41;
 Thu,  4 Feb 2021 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612442751;
 bh=SOnQy9RxOKww3FwtcmXtlNIaVMdG5cK/YIx9GSd2M48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dG/U0a+xaSr261uO6Sj/SU5bdTLBoZ8g1XHARG/8dEABI3D4ZPIyOFPS/QsysXGC2
 sZL7qauWqARMR6/bElBXzMasqAVx7p+ROhtZo2MKsyJaSoC74GT2fIPx3k8IoZSmyP
 YdzMr2K1eqnkENuzQNKlHpf6xx85c1+DE2elfQPasxfufiZWCbjkTDFGnGWQbqed/U
 hbVmNI6p0caFF0aecWklnKLhjQRWPEdIqf9YoOlZXmZXhmHAWttM7hnzi+q0o3JtRD
 iT67+pIC457vEjSd2+iCbh6VuUGvW/Erpqqh2Z5Euu66XtJbknR93QiqmbvasIrGvU
 EJ4ggbI1KF9rA==
Date: Thu, 4 Feb 2021 12:45:43 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
Message-ID: <20210204124543.GA20468@willie-the-truck>
References: <20210109103252.812517-1-lecopzer@gmail.com>
 <20210109103252.812517-2-lecopzer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109103252.812517-2-lecopzer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_074552_295509_03405EF2 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tyhicks@linux.microsoft.com,
 glider@google.com, vincenzo.frascino@arm.com, ardb@kernel.org,
 yj.chiang@mediatek.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, aryabinin@virtuozzo.com,
 linux@roeck-us.net, andreyknvl@google.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, dan.j.williams@intel.com,
 dvyukov@google.com, gustavoars@kernel.org, akpm@linux-foundation.org,
 robin.murphy@arm.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jan 09, 2021 at 06:32:49PM +0800, Lecopzer Chen wrote:
> Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
> ("kasan: support backing vmalloc space with real shadow memory")
> 
> Like how the MODULES_VADDR does now, just not to early populate
> the VMALLOC_START between VMALLOC_END.
> similarly, the kernel code mapping is now in the VMALLOC area and
> should keep these area populated.
> 
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  arch/arm64/mm/kasan_init.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index d8e66c78440e..39b218a64279 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
>  {
>  	u64 kimg_shadow_start, kimg_shadow_end;
>  	u64 mod_shadow_start, mod_shadow_end;
> +	u64 vmalloc_shadow_start, vmalloc_shadow_end;
>  	phys_addr_t pa_start, pa_end;
>  	u64 i;
>  
> @@ -223,6 +224,9 @@ static void __init kasan_init_shadow(void)
>  	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
>  	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
>  
> +	vmalloc_shadow_start = (u64)kasan_mem_to_shadow((void *)VMALLOC_START);
> +	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
> +
>  	/*
>  	 * We are going to perform proper setup of shadow memory.
>  	 * At first we should unmap early shadow (clear_pgds() call below).
> @@ -241,12 +245,21 @@ static void __init kasan_init_shadow(void)
>  
>  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
>  				   (void *)mod_shadow_start);
> -	kasan_populate_early_shadow((void *)kimg_shadow_end,
> -				   (void *)KASAN_SHADOW_END);
> +	if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {

Do we really need yet another CONFIG option for KASAN? What's the use-case
for *not* enabling this if you're already enabling one of the KASAN
backends?

> +		kasan_populate_early_shadow((void *)vmalloc_shadow_end,
> +					    (void *)KASAN_SHADOW_END);
> +		if (vmalloc_shadow_start > mod_shadow_end)

To echo Ard's concern: when is the above 'if' condition true?

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
