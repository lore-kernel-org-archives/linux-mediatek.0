Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9EAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 01:33:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75AB864FC1
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 01:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75AB864FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uMxxP19Ui2RKz4HnCYmYl+5Qnm8IXkzIUkuNJY63YNc=; b=n8cgIUHvjsBsHjDnHAygguOm1
	JKJDqVd8HhoGRkSjvRWd3Z7by7w82OnDdTnBzgJzQyXBvVuZS3z/4g0F/HJEjv3BZWhMK6iG//U2F
	z9RmcOIQ5FeSr4XMX6gy/Uc6rblpOE+j7EuTyXBGhk94cg8VpGle1cv/lbhtOXPGh+kdMDUjDwN6v
	lHNIxATiEUnWOFvrV0weANEQ0LR1BRlzSQnYYWeyDWQObfmO3MTt/b2h3c7p9E8TtffM/607xaSWS
	9EpKU9biVdeAtZVz0KW/U98gRRBVSosuIcxc7uNKRmuN6A9LLFy3kQeuOU3J4oSOzdhvLgxwrYjnw
	V1soQ2cIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKACT-008CBY-Du; Thu, 11 Mar 2021 01:33:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKAC8-008C9B-Rj; Thu, 11 Mar 2021 01:33:00 +0000
X-UUID: 2acb2a9100954fc38eff47d26ea19e92-20210310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XEghooLt2sbP0TcI8ia1WGtbusXI3SQZoYYSMtDBNdo=; 
 b=fiiYEY4jElQ3hb60xerWFUlYzrxWepJ20Hr7ZHkI6SFj0TBPrVmTi8lNmZZlIfG8bk9XJiYh3un+pyPNUMBQxEdjH1+vxQGCx7Adv6BY8zM+8sFFuVtCXqpKHRSix38PuinyCT2KIbsI+ZeXmqc6W9kW6r4z3rW3SKrGpoz+sIQ=;
X-UUID: 2acb2a9100954fc38eff47d26ea19e92-20210310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1238663110; Wed, 10 Mar 2021 17:32:48 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 17:32:47 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Mar 2021 09:32:45 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Mar 2021 09:32:45 +0800
Message-ID: <1615426365.20483.4.camel@mtksdccf07>
Subject: Re: [PATCH v4] kasan: remove redundant config option
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Alexander Potapenko <glider@google.com>, Dmitry Vyukov
 <dvyukov@google.com>, Nathan Chancellor <natechancellor@gmail.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Andrey Konovalov <andreyknvl@google.com>,
 <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>
Date: Thu, 11 Mar 2021 09:32:45 +0800
In-Reply-To: <1614772099.26785.3.camel@mtksdccf07>
References: <20210226012531.29231-1-walter-zh.wu@mediatek.com>
 <1614772099.26785.3.camel@mtksdccf07>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_013257_620706_EA228FEB 
X-CRM114-Status: GOOD (  34.94  )
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

On Wed, 2021-03-03 at 19:48 +0800, Walter Wu wrote:
> On Fri, 2021-02-26 at 09:25 +0800, Walter Wu wrote:
> > CONFIG_KASAN_STACK and CONFIG_KASAN_STACK_ENABLE both enable KASAN stack
> > instrumentation, but we should only need one config, so that we remove
> > CONFIG_KASAN_STACK_ENABLE and make CONFIG_KASAN_STACK workable.  see [1].
> > 
> > When enable KASAN stack instrumentation, then for gcc we could do no
> > prompt and default value y, and for clang prompt and default value n.
> > 
> > [1]: https://bugzilla.kernel.org/show_bug.cgi?id=210221
> > 
> > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > Suggested-by: Dmitry Vyukov <dvyukov@google.com>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
> > Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> > Cc: Dmitry Vyukov <dvyukov@google.com>
> > Cc: Alexander Potapenko <glider@google.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > ---
> > 
> > v4: After this patch sent, someone had modification about KASAN_STACK,
> >     so I need to rebase codebase. Thank Andrey for your pointing.
> > 
> Hi Andrew,
> 
> Could you pick this v4 patch up into mm?
> Thanks.
> 
> Walter
> 
> > ---
> >  arch/arm64/kernel/sleep.S        |  2 +-
> >  arch/x86/kernel/acpi/wakeup_64.S |  2 +-
> >  include/linux/kasan.h            |  2 +-
> >  lib/Kconfig.kasan                |  8 ++------
> >  mm/kasan/common.c                |  2 +-
> >  mm/kasan/kasan.h                 |  2 +-
> >  mm/kasan/report_generic.c        |  2 +-
> >  scripts/Makefile.kasan           | 10 ++++++++--
> >  security/Kconfig.hardening       |  4 ++--
> >  9 files changed, 18 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> > index 5bfd9b87f85d..4ea9392f86e0 100644
> > --- a/arch/arm64/kernel/sleep.S
> > +++ b/arch/arm64/kernel/sleep.S
> > @@ -134,7 +134,7 @@ SYM_FUNC_START(_cpu_resume)
> >  	 */
> >  	bl	cpu_do_resume
> >  
> > -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
> >  	mov	x0, sp
> >  	bl	kasan_unpoison_task_stack_below
> >  #endif
> > diff --git a/arch/x86/kernel/acpi/wakeup_64.S b/arch/x86/kernel/acpi/wakeup_64.S
> > index 56b6865afb2a..d5d8a352eafa 100644
> > --- a/arch/x86/kernel/acpi/wakeup_64.S
> > +++ b/arch/x86/kernel/acpi/wakeup_64.S
> > @@ -115,7 +115,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
> >  	movq	pt_regs_r14(%rax), %r14
> >  	movq	pt_regs_r15(%rax), %r15
> >  
> > -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
> >  	/*
> >  	 * The suspend path may have poisoned some areas deeper in the stack,
> >  	 * which we now need to unpoison.
> > diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> > index b91732bd05d7..14f72ec96492 100644
> > --- a/include/linux/kasan.h
> > +++ b/include/linux/kasan.h
> > @@ -330,7 +330,7 @@ static inline bool kasan_check_byte(const void *address)
> >  
> >  #endif /* CONFIG_KASAN */
> >  
> > -#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
> >  void kasan_unpoison_task_stack(struct task_struct *task);
> >  #else
> >  static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
> > diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> > index 624ae1df7984..cffc2ebbf185 100644
> > --- a/lib/Kconfig.kasan
> > +++ b/lib/Kconfig.kasan
> > @@ -138,9 +138,10 @@ config KASAN_INLINE
> >  
> >  endchoice
> >  
> > -config KASAN_STACK_ENABLE
> > +config KASAN_STACK
> >  	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
> >  	depends on KASAN_GENERIC || KASAN_SW_TAGS
> > +	default y if CC_IS_GCC
> >  	help
> >  	  The LLVM stack address sanitizer has a know problem that
> >  	  causes excessive stack usage in a lot of functions, see
> > @@ -154,11 +155,6 @@ config KASAN_STACK_ENABLE
> >  	  CONFIG_COMPILE_TEST.	On gcc it is assumed to always be safe
> >  	  to use and enabled by default.
> >  
> > -config KASAN_STACK
> > -	int
> > -	default 1 if KASAN_STACK_ENABLE || CC_IS_GCC
> > -	default 0
> > -

Hi Andrew,

I see my v4 patch is different in the next tree now. please see below
information.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ebced5fb0ef969620ecdc4011f600f9e7c229a3c
The different is in lib/Kconfig.kasan.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/diff/lib/Kconfig.kasan?id=ebced5fb0ef969620ecdc4011f600f9e7c229a3c

Would you please help to check it.
Thanks.

Walter

> >  config KASAN_SW_TAGS_IDENTIFY
> >  	bool "Enable memory corruption identification"
> >  	depends on KASAN_SW_TAGS
> > diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> > index b5e08d4cefec..7b53291dafa1 100644
> > --- a/mm/kasan/common.c
> > +++ b/mm/kasan/common.c
> > @@ -63,7 +63,7 @@ void __kasan_unpoison_range(const void *address, size_t size)
> >  	kasan_unpoison(address, size);
> >  }
> >  
> > -#if CONFIG_KASAN_STACK
> > +#ifdef CONFIG_KASAN_STACK
> >  /* Unpoison the entire stack for a task. */
> >  void kasan_unpoison_task_stack(struct task_struct *task)
> >  {
> > diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> > index 8c55634d6edd..3436c6bf7c0c 100644
> > --- a/mm/kasan/kasan.h
> > +++ b/mm/kasan/kasan.h
> > @@ -231,7 +231,7 @@ void *kasan_find_first_bad_addr(void *addr, size_t size);
> >  const char *kasan_get_bug_type(struct kasan_access_info *info);
> >  void kasan_metadata_fetch_row(char *buffer, void *row);
> >  
> > -#if defined(CONFIG_KASAN_GENERIC) && CONFIG_KASAN_STACK
> > +#if defined(CONFIG_KASAN_GENERIC) && defined(CONFIG_KASAN_STACK)
> >  void kasan_print_address_stack_frame(const void *addr);
> >  #else
> >  static inline void kasan_print_address_stack_frame(const void *addr) { }
> > diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
> > index 41f374585144..de732bc341c5 100644
> > --- a/mm/kasan/report_generic.c
> > +++ b/mm/kasan/report_generic.c
> > @@ -128,7 +128,7 @@ void kasan_metadata_fetch_row(char *buffer, void *row)
> >  	memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
> >  }
> >  
> > -#if CONFIG_KASAN_STACK
> > +#ifdef CONFIG_KASAN_STACK
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
> > diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> > index 269967c4fc1b..a56c36470cb1 100644
> > --- a/security/Kconfig.hardening
> > +++ b/security/Kconfig.hardening
> > @@ -64,7 +64,7 @@ choice
> >  	config GCC_PLUGIN_STRUCTLEAK_BYREF
> >  		bool "zero-init structs passed by reference (strong)"
> >  		depends on GCC_PLUGINS
> > -		depends on !(KASAN && KASAN_STACK=1)
> > +		depends on !(KASAN && KASAN_STACK)
> >  		select GCC_PLUGIN_STRUCTLEAK
> >  		help
> >  		  Zero-initialize any structures on the stack that may
> > @@ -82,7 +82,7 @@ choice
> >  	config GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
> >  		bool "zero-init anything passed by reference (very strong)"
> >  		depends on GCC_PLUGINS
> > -		depends on !(KASAN && KASAN_STACK=1)
> > +		depends on !(KASAN && KASAN_STACK)
> >  		select GCC_PLUGIN_STRUCTLEAK
> >  		help
> >  		  Zero-initialize any stack variables that may be passed
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
