Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_RED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAB3C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 21:01:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 496DD233CF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 21:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 496DD233CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eJXAadksyDqrC6BBiYG42Y/2Y7IvLwL6Ofk3JsiuHUg=; b=d0gEB5mWVlb7Pf2hfr5OE0mB8
	2ZX+D1AXbRUZiJphHCWSEc7v8UC/qhxhZE31nNLXRsYPKoPCRNiYw+Rr3ZVfiMTTGJg4almTiJaVD
	872anZh/e+usAzdxfYK4IhZ/0DPAdbnO/ksHIYGX7ZStVRAogHp1+DIqb0fVwPfMZcxf3bDV2wz/u
	eUimvhFgDGYAdCTQFA7zlefsIt4YSmOm/+NJDByMJ9GhM+Tlq4Nq5mdZd69FFdfgRxBn7wKG2Cvbb
	F8f461EavvpwWXcDHmpQUOxR7NzOWrX+Sx44JE35M2kIQZu8Z5AGMw+p0wsll3AT5VnOGUG3I3mL4
	x5SXugrHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxcOu-0001TS-9o; Thu, 07 Jan 2021 21:00:56 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxcOp-0001SV-Ig; Thu, 07 Jan 2021 21:00:52 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id d11so3404977qvo.11;
 Thu, 07 Jan 2021 13:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=unMrV0zhpUV0GILjeHwsieeOs0TVSvZbf5iDIce41oA=;
 b=i9CtxiGDp+wHb2ljojX8tVLU7TiZzkGUoVuKBFFqh76jhoGQB7ZziS4raB857oOLlu
 ls1hlhm4z0r2Yu3sAioXg6jkPzMxcXQX79j63Yo5kOh/gN9yX3GZtFRU7FbPEI1tsVrl
 YoAavsWjTCXbCxJDaGLOefWs8Kv/qs2ue5Uoh15UO6VR+kUJ/h9YH4mUNEtre/9eYOVR
 6VCnoaBThTNvECxaHCmB+trOL4LbdUNaO1zDTG5CaalOk9i5ww16KJIlFWpOOPBbHNSb
 O0Qv0cAVEYYKarc4YdywcAAR/O5sc/EC8fUSyq64fUIHdK274iTp7wZIfGLWS+DsBnNM
 yJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=unMrV0zhpUV0GILjeHwsieeOs0TVSvZbf5iDIce41oA=;
 b=DN75krbTTuitgTb06nDO/zw5o/V+0dJ8ijVRdiV4dBesZOWUBmPmLF/2aUG+JHeH1l
 e+o3cM56Hv8MA0OD1BJPS1MrGXCOn9Sw36tigjvdg88Q/b0WM7+996P9MyECuUOxEX97
 yZYKVV57eIrJzAIP5j4O7lscs3gBZZ1eqGoxWBZAijMotjtpsYPiS+5Pn8YCrVikc5Fi
 R7gQ1JYD+LDe+XCDnFbWlpeEy7RuZKhhq5EY52wOT66LlWcPCkkYOYnIVZ3un3EhnC1P
 znsS4XlysrPb8Fh5xs7Du4GoaXNNmgurLQtTNO/BBmCap0tr7pYsF6KMkW1Ub/8D/qWF
 xvHA==
X-Gm-Message-State: AOAM531EaPRE0f/lPecotZQsIa5WY80Dg6r3AMCI+OgUQ/WkPrOUjvIC
 GYGB2WTN8uqdXj+qq+aIxYE=
X-Google-Smtp-Source: ABdhPJwmSKq2k01h2aQbm0/qCF1bOAHZ//H9xdf6+hI7eCl4LGGvWkZI/IAVMKJriVoxqfiL+cqaHg==
X-Received: by 2002:a0c:d403:: with SMTP id t3mr3799962qvh.4.1610053248333;
 Thu, 07 Jan 2021 13:00:48 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id a203sm3885880qkb.31.2021.01.07.13.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 13:00:47 -0800 (PST)
Date: Thu, 7 Jan 2021 14:00:45 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH] kasan: remove redundant config option
Message-ID: <20210107210045.GA1456581@ubuntu-m3-large-x86>
References: <20210107062152.2015-1-walter-zh.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107062152.2015-1-walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_160051_634442_488F7FA1 
X-CRM114-Status: GOOD (  27.40  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 clang-built-linux@googlegroups.com, Andrey Konovalov <andreyknvl@google.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 07, 2021 at 02:21:52PM +0800, Walter Wu wrote:
> CONFIG_KASAN_STACK and CONFIG_KASAN_STACK_ENABLE both enable KASAN
> stack instrumentation, but we should only need one config option,
> so that we remove CONFIG_KASAN_STACK_ENABLE. see [1].
> 
> For gcc we could do no prompt and default value y, and for clang
> prompt and default value n.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=210221
> 
> Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  arch/arm64/kernel/sleep.S        |  2 +-
>  arch/x86/kernel/acpi/wakeup_64.S |  2 +-
>  include/linux/kasan.h            |  2 +-
>  lib/Kconfig.kasan                | 11 ++++-------
>  mm/kasan/common.c                |  2 +-
>  mm/kasan/kasan.h                 |  2 +-
>  mm/kasan/report_generic.c        |  2 +-
>  scripts/Makefile.kasan           | 10 ++++++++--
>  8 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> index 6bdef7362c0e..7c44ede122a9 100644
> --- a/arch/arm64/kernel/sleep.S
> +++ b/arch/arm64/kernel/sleep.S
> @@ -133,7 +133,7 @@ SYM_FUNC_START(_cpu_resume)
>  	 */
>  	bl	cpu_do_resume
>  
> -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
>  	mov	x0, sp
>  	bl	kasan_unpoison_task_stack_below
>  #endif
> diff --git a/arch/x86/kernel/acpi/wakeup_64.S b/arch/x86/kernel/acpi/wakeup_64.S
> index 5d3a0b8fd379..c7f412f4e07d 100644
> --- a/arch/x86/kernel/acpi/wakeup_64.S
> +++ b/arch/x86/kernel/acpi/wakeup_64.S
> @@ -112,7 +112,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
>  	movq	pt_regs_r14(%rax), %r14
>  	movq	pt_regs_r15(%rax), %r15
>  
> -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
>  	/*
>  	 * The suspend path may have poisoned some areas deeper in the stack,
>  	 * which we now need to unpoison.
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 5e0655fb2a6f..35d1e9b2cbfa 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -302,7 +302,7 @@ static inline void kasan_kfree_large(void *ptr, unsigned long ip) {}
>  
>  #endif /* CONFIG_KASAN */
>  
> -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
>  void kasan_unpoison_task_stack(struct task_struct *task);
>  #else
>  static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index f5fa4ba126bf..59de74293454 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -138,9 +138,11 @@ config KASAN_INLINE
>  
>  endchoice
>  
> -config KASAN_STACK_ENABLE
> -	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST

You are effectively undoing commits 6baec880d7a5 ("kasan: turn off
asan-stack for clang-8 and earlier") and ebb6d35a74ce ("kasan: remove
clang version check for KASAN_STACK") with this change. This change
should still remain around so that all{mod,yes}config remain mostly
clean for clang builds. This should not change anything from the user's
perspective because this option was never user selectable for GCC and
the default y keeps it on.

> +config KASAN_STACK
> +	bool "Enable stack instrumentation (unsafe)"
>  	depends on KASAN_GENERIC || KASAN_SW_TAGS
> +	default y if CC_IS_GCC
> +	default n if CC_IS_CLANG

This is implied and can be removed.

>  	help
>  	  The LLVM stack address sanitizer has a know problem that
>  	  causes excessive stack usage in a lot of functions, see
> @@ -154,11 +156,6 @@ config KASAN_STACK_ENABLE
>  	  CONFIG_COMPILE_TEST.	On gcc it is assumed to always be safe
>  	  to use and enabled by default.
>  
> -config KASAN_STACK
> -	int
> -	default 1 if KASAN_STACK_ENABLE || CC_IS_GCC
> -	default 0
> -
>  config KASAN_SW_TAGS_IDENTIFY
>  	bool "Enable memory corruption identification"
>  	depends on KASAN_SW_TAGS
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 38ba2aecd8f4..02ec7f81dc16 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -63,7 +63,7 @@ void __kasan_unpoison_range(const void *address, size_t size)
>  	unpoison_range(address, size);
>  }
>  
> -#if CONFIG_KASAN_STACK
> +#if defined(CONFIG_KASAN_STACK)

Isn't '#ifdef CONFIG_...' preferred for CONFIG symbols?

>  /* Unpoison the entire stack for a task. */
>  void kasan_unpoison_task_stack(struct task_struct *task)
>  {
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index cc4d9e1d49b1..bdfdb1cff653 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -224,7 +224,7 @@ void *find_first_bad_addr(void *addr, size_t size);
>  const char *get_bug_type(struct kasan_access_info *info);
>  void metadata_fetch_row(char *buffer, void *row);
>  
> -#if defined(CONFIG_KASAN_GENERIC) && CONFIG_KASAN_STACK
> +#if defined(CONFIG_KASAN_GENERIC) && defined(CONFIG_KASAN_STACK)
>  void print_address_stack_frame(const void *addr);
>  #else
>  static inline void print_address_stack_frame(const void *addr) { }
> diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
> index 8a9c889872da..137a1dba1978 100644
> --- a/mm/kasan/report_generic.c
> +++ b/mm/kasan/report_generic.c
> @@ -128,7 +128,7 @@ void metadata_fetch_row(char *buffer, void *row)
>  	memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
>  }
>  
> -#if CONFIG_KASAN_STACK
> +#if defined(CONFIG_KASAN_STACK)
>  static bool __must_check tokenize_frame_descr(const char **frame_descr,
>  					      char *token, size_t max_tok_len,
>  					      unsigned long *value)
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 1e000cc2e7b4..abf231d209b1 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -2,6 +2,12 @@
>  CFLAGS_KASAN_NOSANITIZE := -fno-builtin
>  KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
>  
> +ifdef CONFIG_KASAN_STACK
> +	stack_enable := 1
> +else
> +	stack_enable := 0
> +endif
> +
>  ifdef CONFIG_KASAN_GENERIC
>  
>  ifdef CONFIG_KASAN_INLINE
> @@ -27,7 +33,7 @@ else
>  	CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
>  	 $(call cc-param,asan-globals=1) \
>  	 $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
> -	 $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK)) \
> +	 $(call cc-param,asan-stack=$(stack_enable)) \
>  	 $(call cc-param,asan-instrument-allocas=1)
>  endif
>  
> @@ -42,7 +48,7 @@ else
>  endif
>  
>  CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
> -		-mllvm -hwasan-instrument-stack=$(CONFIG_KASAN_STACK) \
> +		-mllvm -hwasan-instrument-stack=$(stack_enable) \
>  		-mllvm -hwasan-use-short-granules=0 \
>  		$(instrumentation_flags)
>  
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
