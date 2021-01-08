Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85A2C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:56:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B3923A81
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B3923A81
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2r+HL8VqUDKOlSJzlG4wTfogadfyr3pc6mh3GVkHfG4=; b=b2ofTSV+cSakwoTawlyPGBM+7
	9+Duo3GtYc3TKwjU3QRF850dbyJZnvEdS4hGePuArxPu6tiXigg/91hSszbDPRZNYddGHp+rxsAUn
	nvU81x0JkLveLYIAEHvNp5j065zsq563YQlRDzobptc/sJKMamLqay7SPE1n0r57YCBWuH9KEfQ1c
	mR/teaRItAau5xRbANtyDFUl/QR/nZze2+vaxDPQ7h+q3JwMifnOjWa9MjTrWyK3fvGvKLeDAeiVO
	Ms8RKGNp2mdH9UswuQ6Svlm7X7R3nc5RxpNvaHsB9wTshZIjBiJhlbfKFDhk/5LWeRFDT6CoydPvC
	HqOldOi2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxwwB-0002dU-9I; Fri, 08 Jan 2021 18:56:39 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxww5-0002bV-Ny
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 18:56:35 +0000
Received: by mail-pf1-x42e.google.com with SMTP id a188so6798848pfa.11
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 10:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GU+9P9R4Nfik1tMFFGFZP2iMEdTwiDCN49DQfnWs2Fg=;
 b=rI9Nkb8RfNTcTNbl8NxZxLJ39gag+j+T/gQqjA5/GLP8/a6JWhmsyDjiHIujKO31pX
 WexouWXBO2fBxlvSWK+GPUAusO6MvbVgF5lhXzUcQQQK21DNH/bM0KIQuT7kOcPn/zOt
 BKyBvSIi3uajiYuS5vTWMdSzxaECBh3Hbhem3N44/iKt4+ok9fVmqu7JOmyOtrktI8/C
 0hqcQ5cv7QqwytzTCvxrlktKxVqSoWQ6TRHOEYgqk5ooC3JeBTefaGAL0vg09qcg6mqC
 2Ki51DivAFOtIZjQ34u2xZ/hLPodMNtEJMz5bLVkAwwromMV56RD0betFF9tXYDP/gTB
 7J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GU+9P9R4Nfik1tMFFGFZP2iMEdTwiDCN49DQfnWs2Fg=;
 b=lUwG/0oX1ZdwvOt7p7KyxtGpqb9k9lCr96Onr3LWFPlCifAAR54u7IFiFOrpOCjIKB
 346oNNvbqoyPElMFVbJeL+YsMv/87s53cA/5Vo3hTm51FkD1jjvODghJa/+zlM6tUwRJ
 tGEywCCUVS+f18aNPwdk5+X/AOdfqVwBVlDUZi1PSi41U18J/KsPEe2dXTICVwa7xRRj
 seserkRpSBsuuEP9cFtjU4WLl+ov6Ku+vLhZdmt2UCPLk5OgntKb81ZW6/dM3RMs4oo1
 FPea4fmGmGnWa2q6smEasI3onV9PLIe5h4fUs0+J0bZKq6EBpwDopF5INd9nffJfo7Wz
 X16w==
X-Gm-Message-State: AOAM5324AcENTkOkBd2SA8KezPy/l6iDkG9uJ1x45xOV3fMN7BjeQQVL
 PQI5nWwjt7Y0PvdTIe/nF+ZKlu7AEb7ItW+HsF2GOQ==
X-Google-Smtp-Source: ABdhPJzSv6afZ0EsuX9maWLblEYV4pwfphAGS6Z+1iv8NySmwTPvb9LKqJ8cg1jJLjuw5hA9kjgLTMi0DmIsXpQ0JW4=
X-Received: by 2002:a62:e309:0:b029:1ae:5b4a:3199 with SMTP id
 g9-20020a62e3090000b02901ae5b4a3199mr5032496pfh.24.1610132191222; Fri, 08 Jan
 2021 10:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
In-Reply-To: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Fri, 8 Jan 2021 19:56:20 +0100
Message-ID: <CAAeHK+wW3bTCvk=6v_vDQFYLC6=3kunmprXA-P=tWyXCTMZjhQ@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: remove redundant config option
To: Walter Wu <walter-zh.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_135633_853041_44431EA2 
X-CRM114-Status: GOOD (  25.77  )
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
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 8, 2021 at 5:09 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
>
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
>          */
>         bl      cpu_do_resume
>
> -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
>         mov     x0, sp
>         bl      kasan_unpoison_task_stack_below
>  #endif
> diff --git a/arch/x86/kernel/acpi/wakeup_64.S b/arch/x86/kernel/acpi/wakeup_64.S
> index 5d3a0b8fd379..c7f412f4e07d 100644
> --- a/arch/x86/kernel/acpi/wakeup_64.S
> +++ b/arch/x86/kernel/acpi/wakeup_64.S
> @@ -112,7 +112,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
>         movq    pt_regs_r14(%rax), %r14
>         movq    pt_regs_r15(%rax), %r15
>
> -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
>         /*
>          * The suspend path may have poisoned some areas deeper in the stack,
>          * which we now need to unpoison.
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
>         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
>         depends on KASAN_GENERIC || KASAN_SW_TAGS
> +       default y if CC_IS_GCC
>         help
>           The LLVM stack address sanitizer has a know problem that
>           causes excessive stack usage in a lot of functions, see
> @@ -154,11 +155,6 @@ config KASAN_STACK_ENABLE
>           CONFIG_COMPILE_TEST.  On gcc it is assumed to always be safe
>           to use and enabled by default.
>
> -config KASAN_STACK
> -       int
> -       default 1 if KASAN_STACK_ENABLE || CC_IS_GCC
> -       default 0
> -
>  config KASAN_SW_TAGS_IDENTIFY
>         bool "Enable memory corruption identification"
>         depends on KASAN_SW_TAGS
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 38ba2aecd8f4..bf8b073eed62 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -63,7 +63,7 @@ void __kasan_unpoison_range(const void *address, size_t size)
>         unpoison_range(address, size);
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
>         memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
>  }
>
> -#if CONFIG_KASAN_STACK
> +#ifdef CONFIG_KASAN_STACK
>  static bool __must_check tokenize_frame_descr(const char **frame_descr,
>                                               char *token, size_t max_tok_len,
>                                               unsigned long *value)
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 1e000cc2e7b4..abf231d209b1 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -2,6 +2,12 @@
>  CFLAGS_KASAN_NOSANITIZE := -fno-builtin
>  KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
>
> +ifdef CONFIG_KASAN_STACK
> +       stack_enable := 1
> +else
> +       stack_enable := 0
> +endif
> +
>  ifdef CONFIG_KASAN_GENERIC
>
>  ifdef CONFIG_KASAN_INLINE
> @@ -27,7 +33,7 @@ else
>         CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
>          $(call cc-param,asan-globals=1) \
>          $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
> -        $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK)) \
> +        $(call cc-param,asan-stack=$(stack_enable)) \
>          $(call cc-param,asan-instrument-allocas=1)
>  endif
>
> @@ -42,7 +48,7 @@ else
>  endif
>
>  CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
> -               -mllvm -hwasan-instrument-stack=$(CONFIG_KASAN_STACK) \
> +               -mllvm -hwasan-instrument-stack=$(stack_enable) \
>                 -mllvm -hwasan-use-short-granules=0 \
>                 $(instrumentation_flags)
>
> --
> 2.18.0

AFAIR, Arnd wanted to avoid having KASAN_STACK to be enabled by
default when compiling with Clang, since Clang instrumentation leads
to very large kernel stacks, which, in turn, lead to compile-time
warnings. What I don't remember is why there are two configs.

Arnd, is that correct? What was the reason behind having two configs?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
