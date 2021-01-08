Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F6CC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 04:17:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D9722075A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 04:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D9722075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IxZDXjYR+NjQI4KCgO+TjOX22rewh9taIV0Ewr3CLCY=; b=b2oNtD50DH5xQBoNMazEfLLAG
	deEf4h1avFCGgE8sGFZnxpIFPKTQ2MtdGjVypan4uvh+vr2MNOYV0TxMqe4GJwzZxs1FKyIf8eSIk
	gD2F7ykMrBNdixtQPm3Z1+6aFKZsmxZ13AyspImodkjqprIHIWcJ9eQgDvAfcsqN239Bz+NOErabz
	RkjkhDiXpU88zIFMUixpsOI+oTwDFuFjMj9X5/LRk6ly5DjmFkwCwxzzqVqvZZe8Vmiq9jkF3Wz6G
	358sVZ6F5zlnvlFDyAVOrNzOxtbkwHvszMjB6UUaJahBHIDGv07Ancrn6G/uCwIxKRR41/yDkjoyA
	p3/+YBmvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxjD3-00080E-Bj; Fri, 08 Jan 2021 04:17:09 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxjCx-0007yn-Au; Fri, 08 Jan 2021 04:17:05 +0000
Received: by mail-io1-xd2c.google.com with SMTP id w18so8546662iot.0;
 Thu, 07 Jan 2021 20:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Zx0d6MSUcYWK+im6j4aQFprWATgh0hiLgWJYR9X2G+I=;
 b=EC1OMQpphliIXrjHXRV5dh5HU6NUEgBHhO+B3twZCrr39gUl6HLEXWaLci6PT4ZWXh
 1vlYRLDAgT/Jdq+2xoaKyrMS9bfNUzZ0+PB7UgjrRTaroRpMjBupazSreo/WSAKYzBTi
 /RBPPEgofwf6wvrkFdXLOP7ioXNR6+LutDUMplfBOmnAuj+oCVHUPPX4oOIqzAzkYcKq
 dMz4EROlPFKZd/lfbt3WkMyIuZaEuqs+87R+dHPczKE5DPJeYqChG83JEG8FJQgMGQK6
 v1dgWAGgWZnvslslPvF6H9UmfYgPlVolwLtMgZiteKTUDoIBcNTibg2yhAQiPPhB2PNi
 sXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zx0d6MSUcYWK+im6j4aQFprWATgh0hiLgWJYR9X2G+I=;
 b=XFjxLJIWgSP7zZpVm1ehOhgNMUnHX6jKDopBqk1eC580+vCqzBoPVFZubEPe74IA5k
 6e7czhLhmCXQNf3A4X1jBzSrU6LseE5WXX7eHgJj2VFjILAySxkMFObjdIMvewwd4zhL
 w7y7RyP100303Dc4lEPz2ZkPRNf9SNcTBGn/1UKIDkssvKREq2Qm5J9dcWVLom9hlwEJ
 XhQ0WPM3qnsU+Gu0HDICAzdBqnBPtJlxo/CbBPRRlTXCQMDQcOsgxVeBr6oyh0LQiGZu
 JedFtRFYZuuboZKLDORPjOhOHvn057uN5zwaD5cxXTEysHk5KZdihIDkfe3q7du6GG6j
 69ow==
X-Gm-Message-State: AOAM5338w9MPqbR/amBiSgha5X5J92WhXbv3dhatrsVyDYZu3+VzIh3Q
 09IT77v/wElQ0KewpZ+/Xsjq0oTSxWoedg==
X-Google-Smtp-Source: ABdhPJy10Bgj9vqsUK/oiMgqBRRufZFGPu9BDDoPQgMT7da41v8LcDq5alP4bNNHpGVCF1+bSLfl+w==
X-Received: by 2002:a05:6638:2243:: with SMTP id
 m3mr1688386jas.115.1610079419408; 
 Thu, 07 Jan 2021 20:16:59 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id l6sm6476419ili.78.2021.01.07.20.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 20:16:58 -0800 (PST)
Date: Thu, 7 Jan 2021 21:16:56 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v3] kasan: remove redundant config option
Message-ID: <20210108041656.GA2479132@ubuntu-m3-large-x86>
References: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_231703_409867_27E9173F 
X-CRM114-Status: GOOD (  25.38  )
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
 Andrey Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 08, 2021 at 12:09:40PM +0800, Walter Wu wrote:
> CONFIG_KASAN_STACK and CONFIG_KASAN_STACK_ENABLE both enable KASAN stack
> instrumentation, but we should only need one config, so that we remove
> CONFIG_KASAN_STACK_ENABLE and make CONFIG_KASAN_STACK workable. see [1].
> 
> When enable KASAN stack instrumentation, then for gcc we could do
> no prompt and default value y, and for clang prompt and default
> value n.
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
> Cc: Nathan Chancellor <natechancellor@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
> v2: make commit log to be more readable.
> v3: remain CONFIG_KASAN_STACK_ENABLE setting
>     fix the pre-processors syntax
> 
> ---
>  arch/arm64/kernel/sleep.S        |  2 +-
>  arch/x86/kernel/acpi/wakeup_64.S |  2 +-
>  include/linux/kasan.h            |  2 +-
>  lib/Kconfig.kasan                |  8 ++------
>  mm/kasan/common.c                |  2 +-
>  mm/kasan/kasan.h                 |  2 +-
>  mm/kasan/report_generic.c        |  2 +-
>  scripts/Makefile.kasan           | 10 ++++++++--
>  8 files changed, 16 insertions(+), 14 deletions(-)
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
> index f5fa4ba126bf..fde82ec85f8f 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -138,9 +138,10 @@ config KASAN_INLINE
>  
>  endchoice
>  
> -config KASAN_STACK_ENABLE
> +config KASAN_STACK
>  	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
>  	depends on KASAN_GENERIC || KASAN_SW_TAGS
> +	default y if CC_IS_GCC
>  	help
>  	  The LLVM stack address sanitizer has a know problem that
>  	  causes excessive stack usage in a lot of functions, see
> @@ -154,11 +155,6 @@ config KASAN_STACK_ENABLE
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
> index 38ba2aecd8f4..bf8b073eed62 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -63,7 +63,7 @@ void __kasan_unpoison_range(const void *address, size_t size)
>  	unpoison_range(address, size);
>  }
>  
> -#if CONFIG_KASAN_STACK
> +#ifdef CONFIG_KASAN_STACK
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
> index 8a9c889872da..4e16518d9877 100644
> --- a/mm/kasan/report_generic.c
> +++ b/mm/kasan/report_generic.c
> @@ -128,7 +128,7 @@ void metadata_fetch_row(char *buffer, void *row)
>  	memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
>  }
>  
> -#if CONFIG_KASAN_STACK
> +#ifdef CONFIG_KASAN_STACK
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
