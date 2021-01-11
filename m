Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CD2C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 18:59:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2651422795
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 18:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2651422795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jnGZJOPX7aJRaGLPc0yF/91QGWlzbHqGIVgG8hAZgTU=; b=gAsmqgMWi9YnJEduRAH40WyJD
	0UBBnmBvBaV3S0ud3NWeCjrIYIQ+BcScHjimBnvA1T5kH/ArQo8BC+Hmwo1a1jzt8nDh4JZL1o3VI
	dJaUq01SxDpDZVH7UH4lEYRfofnxL5S7XyOlUe2rkVvSpEH78c4AWJcuBQ/ZaB+w+RONhE6rb5POO
	4VAVU0r3V2exqSV2cZpcZCglBDT9CS/3YiU5szOtC2tUIWxO5fyYeADA3/PSGzAjHEInwTPEVisno
	SbGpaFgCfzEcIW78vcrfAJ1HOIodPUXDByyFJPOttGueKrCbhKSwHuz10Ob2TExegyc8cDUxUjNFa
	I04TqzZrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz2PO-0000ka-TH; Mon, 11 Jan 2021 18:59:18 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz2PD-0000gV-Vh; Mon, 11 Jan 2021 18:59:10 +0000
Received: by mail-qk1-x72a.google.com with SMTP id p14so483235qke.6;
 Mon, 11 Jan 2021 10:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NHAKhb75s2fP4VkAw0VIGRYTr0gRRezE8oxv1qzuvrE=;
 b=QTv/dYc0f0P5nzgLazjMRr87AHBLnprNeGj7tpoJO6JmY1+7bUwo6riv8LuV3TqJZI
 5PedQxR3Dop57sJNDG0uxmzFbBlf6c2dFmPT3Z0WUWROGJjYN3fqi8kKHLIAsPIgF+p0
 EoTbPO22Bp+KC5UvFEydx50XHBOdcj4XENLdNB9IVNR8j2H8OC/ZWd5gtPdw5YUhbjcP
 QpsYHs0A4irdSNSnZvXhUrBAiZ+mC8w21S3wn3FHklx2xYsbwBzmEOTt+klsnlwUcgf2
 9yAhF/eKmxHXcwtkeUfLWS+Snq+f1i2Dj8B4cNkoJmRgsDRCRifoVYkEyy/CRZiAUdLF
 nzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NHAKhb75s2fP4VkAw0VIGRYTr0gRRezE8oxv1qzuvrE=;
 b=Mk1MllJ7hIU373N57UmDYtgDOJultcG/M0GmZvq+AUFhCXrw6/W2gC72c62Fr9MQVd
 SuvBSxqigf7ZC591daYTlFfwn2MBwTQsqE3c1MrtrganNugVJnrY1szXTSRpivcYqBOt
 bZUC42aNQTcmI52q9d/42SPhtd58UuOIvt8iFEORDG9FIlALyshcP5H6AMBdVoP23UVt
 Qxw71bjNMwju4zGXXi/aRo8x+KsuGLmryx8+XLlw7DnrtaYIjMe0Xp3PwZxpqE23Lwvl
 OtoBfB73Sdj6ztajstyZvZtTcPk/K9MBEIm3MtMF7lkVIl3Hs5OWONkCj1sFLKOEnec+
 TlIQ==
X-Gm-Message-State: AOAM531VszViNnfhYtv1wjlk6QY8oJjDtYnHmcLjWgctZjpdRHdobqpT
 Oy9KI8pfWW3H3ILLA0IE+Qg=
X-Google-Smtp-Source: ABdhPJwb0K8J5rpR/v/W2BYF4s3Ror0uuCiL9oxhkdXMhZYB0WfDbI9BVUzWFSXOvrMXI/7c2ylTRw==
X-Received: by 2002:a37:9d84:: with SMTP id g126mr794137qke.262.1610391544127; 
 Mon, 11 Jan 2021 10:59:04 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id a21sm385628qkb.124.2021.01.11.10.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 10:59:03 -0800 (PST)
Date: Mon, 11 Jan 2021 11:59:02 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v3] kasan: remove redundant config option
Message-ID: <20210111185902.GA2112090@ubuntu-m3-large-x86>
References: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
 <CAAeHK+weY_DMNbYGz0ZEWXp7yho3_L3qfzY94QbH9pxPgqczoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+weY_DMNbYGz0ZEWXp7yho3_L3qfzY94QbH9pxPgqczoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_135908_160234_64914E41 
X-CRM114-Status: GOOD (  38.26  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 06:49:37PM +0100, Andrey Konovalov wrote:
> On Fri, Jan 8, 2021 at 5:09 AM Walter Wu <walter-zh.wu@mediatek.com> wrote:
> >
> > CONFIG_KASAN_STACK and CONFIG_KASAN_STACK_ENABLE both enable KASAN stack
> > instrumentation, but we should only need one config, so that we remove
> > CONFIG_KASAN_STACK_ENABLE and make CONFIG_KASAN_STACK workable. see [1].
> >
> > When enable KASAN stack instrumentation, then for gcc we could do
> > no prompt and default value y, and for clang prompt and default
> > value n.
> >
> > [1]: https://bugzilla.kernel.org/show_bug.cgi?id=210221
> >
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Andrey Konovalov <andreyknvl@google.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > v2: make commit log to be more readable.
> > v3: remain CONFIG_KASAN_STACK_ENABLE setting
> >     fix the pre-processors syntax
> >
> > ---
> >  arch/arm64/kernel/sleep.S        |  2 +-
> >  arch/x86/kernel/acpi/wakeup_64.S |  2 +-
> >  include/linux/kasan.h            |  2 +-
> >  lib/Kconfig.kasan                |  8 ++------
> >  mm/kasan/common.c                |  2 +-
> >  mm/kasan/kasan.h                 |  2 +-
> >  mm/kasan/report_generic.c        |  2 +-
> >  scripts/Makefile.kasan           | 10 ++++++++--
> >  8 files changed, 16 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> > index 6bdef7362c0e..7c44ede122a9 100644
> > --- a/arch/arm64/kernel/sleep.S
> > +++ b/arch/arm64/kernel/sleep.S
> > @@ -133,7 +133,7 @@ SYM_FUNC_START(_cpu_resume)
> >          */
> >         bl      cpu_do_resume
> >
> > -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
> >         mov     x0, sp
> >         bl      kasan_unpoison_task_stack_below
> >  #endif
> > diff --git a/arch/x86/kernel/acpi/wakeup_64.S b/arch/x86/kernel/acpi/wakeup_64.S
> > index 5d3a0b8fd379..c7f412f4e07d 100644
> > --- a/arch/x86/kernel/acpi/wakeup_64.S
> > +++ b/arch/x86/kernel/acpi/wakeup_64.S
> > @@ -112,7 +112,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
> >         movq    pt_regs_r14(%rax), %r14
> >         movq    pt_regs_r15(%rax), %r15
> >
> > -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
> >         /*
> >          * The suspend path may have poisoned some areas deeper in the stack,
> >          * which we now need to unpoison.
> > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > index 5e0655fb2a6f..35d1e9b2cbfa 100644
> > --- a/include/linux/kasan.h
> > +++ b/include/linux/kasan.h
> > @@ -302,7 +302,7 @@ static inline void kasan_kfree_large(void *ptr, unsigned long ip) {}
> >
> >  #endif /* CONFIG_KASAN */
> >
> > -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
> >  void kasan_unpoison_task_stack(struct task_struct *task);
> >  #else
> >  static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
> > diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> > index f5fa4ba126bf..fde82ec85f8f 100644
> > --- a/lib/Kconfig.kasan
> > +++ b/lib/Kconfig.kasan
> > @@ -138,9 +138,10 @@ config KASAN_INLINE
> >
> >  endchoice
> >
> > -config KASAN_STACK_ENABLE
> > +config KASAN_STACK
> >         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
> 
> Does this syntax mean that KASAN_STACK is only present for
> CC_IS_CLANG? Or that it can only be disabled for CC_IS_CLANG?

It means that the option can only be disabled for clang.

> Anyway, I think it's better to 1. allow to control KASAN_STACK
> regardless of the compiler (as it was possible before), and 2. avoid

It has never been possible to control KASAN_STACK for GCC because of the
bool ... if ... syntax. This patch does not change that logic. Making it
possible to control KASAN_STACK with GCC seems fine but that is going to
be a new change that would probably be suited for a new patch on top of
this one.

> this "bool ... if ..." syntax as it's confusing.
> 
> >         depends on KASAN_GENERIC || KASAN_SW_TAGS
> > +       default y if CC_IS_GCC
> >         help
> >           The LLVM stack address sanitizer has a know problem that
> >           causes excessive stack usage in a lot of functions, see
> > @@ -154,11 +155,6 @@ config KASAN_STACK_ENABLE
> >           CONFIG_COMPILE_TEST.  On gcc it is assumed to always be safe
> >           to use and enabled by default.
> >
> > -config KASAN_STACK
> > -       int
> > -       default 1 if KASAN_STACK_ENABLE || CC_IS_GCC
> > -       default 0
> > -
> >  config KASAN_SW_TAGS_IDENTIFY
> >         bool "Enable memory corruption identification"
> >         depends on KASAN_SW_TAGS
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index 38ba2aecd8f4..bf8b073eed62 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -63,7 +63,7 @@ void __kasan_unpoison_range(const void *address, size_t size)
> >         unpoison_range(address, size);
> >  }
> >
> > -#if CONFIG_KASAN_STACK
> > +#ifdef CONFIG_KASAN_STACK
> >  /* Unpoison the entire stack for a task. */
> >  void kasan_unpoison_task_stack(struct task_struct *task)
> >  {
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index cc4d9e1d49b1..bdfdb1cff653 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -224,7 +224,7 @@ void *find_first_bad_addr(void *addr, size_t size);
> >  const char *get_bug_type(struct kasan_access_info *info);
> >  void metadata_fetch_row(char *buffer, void *row);
> >
> > -#if defined(CONFIG_KASAN_GENERIC) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN_GENERIC) && defined(CONFIG_KASAN_STACK)
> >  void print_address_stack_frame(const void *addr);
> >  #else
> >  static inline void print_address_stack_frame(const void *addr) { }
> > diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
> > index 8a9c889872da..4e16518d9877 100644
> > --- a/mm/kasan/report_generic.c
> > +++ b/mm/kasan/report_generic.c
> > @@ -128,7 +128,7 @@ void metadata_fetch_row(char *buffer, void *row)
> >         memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
> >  }
> >
> > -#if CONFIG_KASAN_STACK
> > +#ifdef CONFIG_KASAN_STACK
> >  static bool __must_check tokenize_frame_descr(const char **frame_descr,
> >                                               char *token, size_t max_tok_len,
> >                                               unsigned long *value)
> > diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> > index 1e000cc2e7b4..abf231d209b1 100644
> > --- a/scripts/Makefile.kasan
> > +++ b/scripts/Makefile.kasan
> > @@ -2,6 +2,12 @@
> >  CFLAGS_KASAN_NOSANITIZE := -fno-builtin
> >  KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
> >
> > +ifdef CONFIG_KASAN_STACK
> > +       stack_enable := 1
> > +else
> > +       stack_enable := 0
> > +endif
> > +
> >  ifdef CONFIG_KASAN_GENERIC
> >
> >  ifdef CONFIG_KASAN_INLINE
> > @@ -27,7 +33,7 @@ else
> >         CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
> >          $(call cc-param,asan-globals=1) \
> >          $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
> > -        $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK)) \
> > +        $(call cc-param,asan-stack=$(stack_enable)) \
> >          $(call cc-param,asan-instrument-allocas=1)
> >  endif
> >
> > @@ -42,7 +48,7 @@ else
> >  endif
> >
> >  CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
> > -               -mllvm -hwasan-instrument-stack=$(CONFIG_KASAN_STACK) \
> > +               -mllvm -hwasan-instrument-stack=$(stack_enable) \
> >                 -mllvm -hwasan-use-short-granules=0 \
> >                 $(instrumentation_flags)
> >
> > --
> > 2.18.0
> >
> > --
> > You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210108040940.1138-1-walter-zh.wu%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
