Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A672C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 23:04:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789BA64DD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 23:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789BA64DD0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cfocqtPV5nED8iFbpfmyhKqCP0xRWSOcXM8QIF7vS1M=; b=im+eW7pn48d4NDb7AT6r8hM9o
	yPNUZV+TMIykWWA/ugtGleEZ9KZ6Y1tJ51x97Q5P84/DqvROwR8FkO++VJZE4Sf1XdmrhPX7LeseU
	rZgB+nQwKYsU9c2WozH6hDUQ9CdKcrrOfmavKflF0czRDqPDo62GT9GCcRtKwoiaoYZPLf6R7keFE
	Fa2dDmGcYTQnTu+vnWpEjm0i6GoLwUO6mKKYgmBdtaU95YKwRozLtlHrEJcncKeC05r1NhNH3m9Jn
	CKMXQl2NNnliVyR1kAoyRKKNYVHIbpaPvjKVq3N4SIRwCO61fUUc8fIqU/nAZ3hzY9S3hojf/1IT8
	ssSay60Wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4trP-00080Y-JZ; Wed, 27 Jan 2021 23:04:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4trL-000800-Ct; Wed, 27 Jan 2021 23:04:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A84E64DCE;
 Wed, 27 Jan 2021 23:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611788661;
 bh=3Jk8U/JdRNH+EkcfRbQkniS/eY1h1c1PGw5876r0Qeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Or6G1XJCcSY0tUxiG7eWRkWxY1zu10ldDMd2CaVn53QLTsg/SwbcQyI1MDpuviHEA
 5bNiuF9k8OvH/fuA8Tlluiuc2oUOLR3UlbehfATDgAHWmrJOjHdQp8HlHff9b7ASz+
 s4+1vB7kRlylHeB7D6Y8fQVMAOW/ooLYkq7gFQarXqrtucnWcXCK5/q33yHVLkq9n3
 f45VGFywiax2CWgR0LOB9XQByXD/OasiIuAgI2RLzcbz9qRpOa3kN+AUPs4uNLa9QD
 rPIM5KMKR+gHpL2qXG5Z0l+emdbACmeH11j/73u6/Y9936Na0Z52d9P4WtiHgM1f2I
 rhQdgxwfZu14A==
Date: Wed, 27 Jan 2021 23:04:14 +0000
From: Will Deacon <will@kernel.org>
To: Lecopzer Chen <lecopzer@gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: kaslr: support randomized module area with
 KASAN_VMALLOC
Message-ID: <20210127230413.GA1016@willie-the-truck>
References: <20210109103252.812517-1-lecopzer@gmail.com>
 <20210109103252.812517-5-lecopzer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109103252.812517-5-lecopzer@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_180423_542341_33033FDA 
X-CRM114-Status: GOOD (  14.73  )
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

On Sat, Jan 09, 2021 at 06:32:52PM +0800, Lecopzer Chen wrote:
> After KASAN_VMALLOC works in arm64, we can randomize module region
> into vmalloc area now.
> 
> Test:
> 	VMALLOC area ffffffc010000000 fffffffdf0000000
> 
> 	before the patch:
> 		module_alloc_base/end ffffffc008b80000 ffffffc010000000
> 	after the patch:
> 		module_alloc_base/end ffffffdcf4bed000 ffffffc010000000
> 
> 	And the function that insmod some modules is fine.
> 
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  arch/arm64/kernel/kaslr.c  | 18 ++++++++++--------
>  arch/arm64/kernel/module.c | 16 +++++++++-------
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> index 1c74c45b9494..a2858058e724 100644
> --- a/arch/arm64/kernel/kaslr.c
> +++ b/arch/arm64/kernel/kaslr.c
> @@ -161,15 +161,17 @@ u64 __init kaslr_early_init(u64 dt_phys)
>  	/* use the top 16 bits to randomize the linear region */
>  	memstart_offset_seed = seed >> 48;
>  
> -	if (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
> -	    IS_ENABLED(CONFIG_KASAN_SW_TAGS))
> +	if (!IS_ENABLED(CONFIG_KASAN_VMALLOC) &&
> +	    (IS_ENABLED(CONFIG_KASAN_GENERIC) ||

CONFIG_KASAN_VMALLOC depends on CONFIG_KASAN_GENERIC so why is this
necessary?

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
