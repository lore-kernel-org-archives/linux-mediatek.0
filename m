Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4032DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:39:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C33C12311E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C33C12311E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=II76B7cnVkX5J7F6ZrSoN5OUUaRrLApoipfuUQWEvgA=; b=FOc3oOIzKBn5gDGaOVLV1s8pR
	V0/4HkCbbrxIXLQWPfpNXA5Rj85LG/UfqvLNTdw2ivXyQsSrduIFqgwguDRuByG7fNZMR7cMHRFQ7
	hSXh7TR3e+hlcxCtNASMZAzy8nTVfVsGBYHX5v4T8M1loVfog4NNZbogX51SImK5LIrw/uklVbZ9b
	9rJdtElagVv+xq5QK6Ci6igegiZnSSnOv2CeDMvmpvhwusnZA7pLTaKI/GG+KpaEdFkFWLwhvpZAd
	mnzO79PXE3a03kNzJ+AaAKDNjypSQgzurOd6ob89taVJnpIftWqtGK8Zf8oSjIGJcSW59tnM/z6pq
	22FnwVKfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxgjm-0002L5-1S; Fri, 08 Jan 2021 01:38:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxgjh-0002Js-83; Fri, 08 Jan 2021 01:38:42 +0000
X-UUID: 82edd45754804bcc83effe00e02ad429-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s+o0wQ44oQ0OJjcZVE6WER+igqM6j9ySewzTsgGNyp8=; 
 b=cV7EBqGbmT2/J3zHRidlEZ1iZfKQZXZPFUgA40G8x0oi8n7WRmPYGhqu+N0GYY0ApkNr1egbdXv6//KXOIOxFyhyPbj2tZoy7RX0Romx4Ezx4wpLrauewyzoov31dWYwkjbIBsP4Mg+A+2hwwfn4+CIpq8aCyvnzowyTdB/dEmk=;
X-UUID: 82edd45754804bcc83effe00e02ad429-20210107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1646687370; Thu, 07 Jan 2021 17:38:34 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 17:38:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Jan 2021 09:38:30 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jan 2021 09:38:30 +0800
Message-ID: <1610069910.29507.3.camel@mtksdccf07>
Subject: Re: [PATCH] kasan: remove redundant config option
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Date: Fri, 8 Jan 2021 09:38:30 +0800
In-Reply-To: <20210107210045.GA1456581@ubuntu-m3-large-x86>
References: <20210107062152.2015-1-walter-zh.wu@mediatek.com>
 <20210107210045.GA1456581@ubuntu-m3-large-x86>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CFE1FE589981CD48E25B11BC0CC153010BB4FBB961CFCB681BFAFCF0AF1E593B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_203841_487421_F8C4CB11 
X-CRM114-Status: GOOD (  34.86  )
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

On Thu, 2021-01-07 at 14:00 -0700, Nathan Chancellor wrote:
> On Thu, Jan 07, 2021 at 02:21:52PM +0800, Walter Wu wrote:
> > CONFIG_KASAN_STACK and CONFIG_KASAN_STACK_ENABLE both enable KASAN
> > stack instrumentation, but we should only need one config option,
> > so that we remove CONFIG_KASAN_STACK_ENABLE. see [1].
> > 
> > For gcc we could do no prompt and default value y, and for clang
> > prompt and default value n.
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
> > ---
> >  arch/arm64/kernel/sleep.S        |  2 +-
> >  arch/x86/kernel/acpi/wakeup_64.S |  2 +-
> >  include/linux/kasan.h            |  2 +-
> >  lib/Kconfig.kasan                | 11 ++++-------
> >  mm/kasan/common.c                |  2 +-
> >  mm/kasan/kasan.h                 |  2 +-
> >  mm/kasan/report_generic.c        |  2 +-
> >  scripts/Makefile.kasan           | 10 ++++++++--
> >  8 files changed, 18 insertions(+), 15 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> > index 6bdef7362c0e..7c44ede122a9 100644
> > --- a/arch/arm64/kernel/sleep.S
> > +++ b/arch/arm64/kernel/sleep.S
> > @@ -133,7 +133,7 @@ SYM_FUNC_START(_cpu_resume)
> >  	 */
> >  	bl	cpu_do_resume
> >  
> > -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
> >  	mov	x0, sp
> >  	bl	kasan_unpoison_task_stack_below
> >  #endif
> > diff --git a/arch/x86/kernel/acpi/wakeup_64.S b/arch/x86/kernel/acpi/wakeup_64.S
> > index 5d3a0b8fd379..c7f412f4e07d 100644
> > --- a/arch/x86/kernel/acpi/wakeup_64.S
> > +++ b/arch/x86/kernel/acpi/wakeup_64.S
> > @@ -112,7 +112,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
> >  	movq	pt_regs_r14(%rax), %r14
> >  	movq	pt_regs_r15(%rax), %r15
> >  
> > -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
> >  	/*
> >  	 * The suspend path may have poisoned some areas deeper in the stack,
> >  	 * which we now need to unpoison.
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
> > index f5fa4ba126bf..59de74293454 100644
> > --- a/lib/Kconfig.kasan
> > +++ b/lib/Kconfig.kasan
> > @@ -138,9 +138,11 @@ config KASAN_INLINE
> >  
> >  endchoice
> >  
> > -config KASAN_STACK_ENABLE
> > -	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
> 
> You are effectively undoing commits 6baec880d7a5 ("kasan: turn off
> asan-stack for clang-8 and earlier") and ebb6d35a74ce ("kasan: remove
> clang version check for KASAN_STACK") with this change. This change
> should still remain around so that all{mod,yes}config remain mostly
> clean for clang builds. This should not change anything from the user's
> perspective because this option was never user selectable for GCC and
> the default y keeps it on.
> 

Ok, I will remain this.

> > +config KASAN_STACK
> > +	bool "Enable stack instrumentation (unsafe)"
> >  	depends on KASAN_GENERIC || KASAN_SW_TAGS
> > +	default y if CC_IS_GCC
> > +	default n if CC_IS_CLANG
> 
> This is implied and can be removed.
> 
> >  	help
> >  	  The LLVM stack address sanitizer has a know problem that
> >  	  causes excessive stack usage in a lot of functions, see
> > @@ -154,11 +156,6 @@ config KASAN_STACK_ENABLE
> >  	  CONFIG_COMPILE_TEST.	On gcc it is assumed to always be safe
> >  	  to use and enabled by default.
> >  
> > -config KASAN_STACK
> > -	int
> > -	default 1 if KASAN_STACK_ENABLE || CC_IS_GCC
> > -	default 0
> > -
> >  config KASAN_SW_TAGS_IDENTIFY
> >  	bool "Enable memory corruption identification"
> >  	depends on KASAN_SW_TAGS
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index 38ba2aecd8f4..02ec7f81dc16 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -63,7 +63,7 @@ void __kasan_unpoison_range(const void *address, size_t size)
> >  	unpoison_range(address, size);
> >  }
> >  
> > -#if CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN_STACK)
> 
> Isn't '#ifdef CONFIG_...' preferred for CONFIG symbols?
> 

Yes, I will fix in the next version. Thanks for your review.

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
> > index 8a9c889872da..137a1dba1978 100644
> > --- a/mm/kasan/report_generic.c
> > +++ b/mm/kasan/report_generic.c
> > @@ -128,7 +128,7 @@ void metadata_fetch_row(char *buffer, void *row)
> >  	memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
> >  }
> >  
> > -#if CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN_STACK)
> >  static bool __must_check tokenize_frame_descr(const char **frame_descr,
> >  					      char *token, size_t max_tok_len,
> >  					      unsigned long *value)
> > diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> > index 1e000cc2e7b4..abf231d209b1 100644
> > --- a/scripts/Makefile.kasan
> > +++ b/scripts/Makefile.kasan
> > @@ -2,6 +2,12 @@
> >  CFLAGS_KASAN_NOSANITIZE := -fno-builtin
> >  KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
> >  
> > +ifdef CONFIG_KASAN_STACK
> > +	stack_enable := 1
> > +else
> > +	stack_enable := 0
> > +endif
> > +
> >  ifdef CONFIG_KASAN_GENERIC
> >  
> >  ifdef CONFIG_KASAN_INLINE
> > @@ -27,7 +33,7 @@ else
> >  	CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
> >  	 $(call cc-param,asan-globals=1) \
> >  	 $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
> > -	 $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK)) \
> > +	 $(call cc-param,asan-stack=$(stack_enable)) \
> >  	 $(call cc-param,asan-instrument-allocas=1)
> >  endif
> >  
> > @@ -42,7 +48,7 @@ else
> >  endif
> >  
> >  CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
> > -		-mllvm -hwasan-instrument-stack=$(CONFIG_KASAN_STACK) \
> > +		-mllvm -hwasan-instrument-stack=$(stack_enable) \
> >  		-mllvm -hwasan-use-short-granules=0 \
> >  		$(instrumentation_flags)
> >  
> > -- 
> > 2.18.0
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
