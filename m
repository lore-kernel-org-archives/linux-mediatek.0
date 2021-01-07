Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5CDC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 06:22:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9555F22E03
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 06:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9555F22E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NxW4A8iBw6J82oLaXqdX0UakICozMgwJyI4nECrwLVo=; b=2GQAgeIgxBX67ExD6Ydi8pU1xA
	JJWTZ3KgSJtKfS6IOdIdwnYenmKZlJxe+fCVxikUEpsN+AqsSTjlG1Olb/F8vhFKWqu3gOpK3ca5x
	HyMoZ5WjqiOu8UnfsNumZFzzK9lMaOUMzpZ/0fG0tPbXkL9FAzDTtpt8Bda2ayJ7W+x+IhRNE1vLK
	4h0r7l6rRvRzfd7BDG+Zb5oun3bzprH8SGovuley3y46zOCcW/ELgZjFSwZFIwE+kEghQmaHuMn+G
	kreWtKfqf94/O3JLzkEL771tKhtK+ZKfoyxLGS6h5mXEjvvu45y6nXJhscel1f38GGhqdpUBR69Uo
	rwSBsiiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxOgY-0006jO-SH; Thu, 07 Jan 2021 06:22:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxOgT-0006iP-E9; Thu, 07 Jan 2021 06:22:11 +0000
X-UUID: dc33c2cb2560431e91538e603695294c-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GH1TJYoiag+PvFMcYpXjLRuDzluiF+yVDz7NKQqJ7VA=; 
 b=jZdANrKYyIs19DfGMOhvpOhm4HU7wiTdLP/Q/o817YfGxSVUnvqn6Yo1BsM2RKIORIpv2x9BZIZkI5A7aa4WiaKooz0iOiQKLpJKcXTljZenCrHGPXQaUmIY4iQOXx9pZGLtPnqRRdGsNNWnNyyWRLtfX3C5ZEPxw+Pbq2x/Krk=;
X-UUID: dc33c2cb2560431e91538e603695294c-20210106
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2131167532; Wed, 06 Jan 2021 22:22:03 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 22:22:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 14:21:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Jan 2021 14:21:54 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov
 <andreyknvl@google.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] kasan: remove redundant config option
Date: Thu, 7 Jan 2021 14:21:52 +0800
Message-ID: <20210107062152.2015-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_012210_306152_2BD7D5E4 
X-CRM114-Status: GOOD (  14.96  )
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
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CONFIG_KASAN_STACK and CONFIG_KASAN_STACK_ENABLE both enable KASAN
stack instrumentation, but we should only need one config option,
so that we remove CONFIG_KASAN_STACK_ENABLE. see [1].

For gcc we could do no prompt and default value y, and for clang
prompt and default value n.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=210221

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Konovalov <andreyknvl@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 arch/arm64/kernel/sleep.S        |  2 +-
 arch/x86/kernel/acpi/wakeup_64.S |  2 +-
 include/linux/kasan.h            |  2 +-
 lib/Kconfig.kasan                | 11 ++++-------
 mm/kasan/common.c                |  2 +-
 mm/kasan/kasan.h                 |  2 +-
 mm/kasan/report_generic.c        |  2 +-
 scripts/Makefile.kasan           | 10 ++++++++--
 8 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index 6bdef7362c0e..7c44ede122a9 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -133,7 +133,7 @@ SYM_FUNC_START(_cpu_resume)
 	 */
 	bl	cpu_do_resume
 
-#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
 	mov	x0, sp
 	bl	kasan_unpoison_task_stack_below
 #endif
diff --git a/arch/x86/kernel/acpi/wakeup_64.S b/arch/x86/kernel/acpi/wakeup_64.S
index 5d3a0b8fd379..c7f412f4e07d 100644
--- a/arch/x86/kernel/acpi/wakeup_64.S
+++ b/arch/x86/kernel/acpi/wakeup_64.S
@@ -112,7 +112,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
 	movq	pt_regs_r14(%rax), %r14
 	movq	pt_regs_r15(%rax), %r15
 
-#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
 	/*
 	 * The suspend path may have poisoned some areas deeper in the stack,
 	 * which we now need to unpoison.
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 5e0655fb2a6f..35d1e9b2cbfa 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -302,7 +302,7 @@ static inline void kasan_kfree_large(void *ptr, unsigned long ip) {}
 
 #endif /* CONFIG_KASAN */
 
-#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
 void kasan_unpoison_task_stack(struct task_struct *task);
 #else
 static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f5fa4ba126bf..59de74293454 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -138,9 +138,11 @@ config KASAN_INLINE
 
 endchoice
 
-config KASAN_STACK_ENABLE
-	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
+config KASAN_STACK
+	bool "Enable stack instrumentation (unsafe)"
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
+	default y if CC_IS_GCC
+	default n if CC_IS_CLANG
 	help
 	  The LLVM stack address sanitizer has a know problem that
 	  causes excessive stack usage in a lot of functions, see
@@ -154,11 +156,6 @@ config KASAN_STACK_ENABLE
 	  CONFIG_COMPILE_TEST.	On gcc it is assumed to always be safe
 	  to use and enabled by default.
 
-config KASAN_STACK
-	int
-	default 1 if KASAN_STACK_ENABLE || CC_IS_GCC
-	default 0
-
 config KASAN_SW_TAGS_IDENTIFY
 	bool "Enable memory corruption identification"
 	depends on KASAN_SW_TAGS
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 38ba2aecd8f4..02ec7f81dc16 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -63,7 +63,7 @@ void __kasan_unpoison_range(const void *address, size_t size)
 	unpoison_range(address, size);
 }
 
-#if CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN_STACK)
 /* Unpoison the entire stack for a task. */
 void kasan_unpoison_task_stack(struct task_struct *task)
 {
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index cc4d9e1d49b1..bdfdb1cff653 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -224,7 +224,7 @@ void *find_first_bad_addr(void *addr, size_t size);
 const char *get_bug_type(struct kasan_access_info *info);
 void metadata_fetch_row(char *buffer, void *row);
 
-#if defined(CONFIG_KASAN_GENERIC) && CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN_GENERIC) && defined(CONFIG_KASAN_STACK)
 void print_address_stack_frame(const void *addr);
 #else
 static inline void print_address_stack_frame(const void *addr) { }
diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
index 8a9c889872da..137a1dba1978 100644
--- a/mm/kasan/report_generic.c
+++ b/mm/kasan/report_generic.c
@@ -128,7 +128,7 @@ void metadata_fetch_row(char *buffer, void *row)
 	memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
 }
 
-#if CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN_STACK)
 static bool __must_check tokenize_frame_descr(const char **frame_descr,
 					      char *token, size_t max_tok_len,
 					      unsigned long *value)
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 1e000cc2e7b4..abf231d209b1 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -2,6 +2,12 @@
 CFLAGS_KASAN_NOSANITIZE := -fno-builtin
 KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
 
+ifdef CONFIG_KASAN_STACK
+	stack_enable := 1
+else
+	stack_enable := 0
+endif
+
 ifdef CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_INLINE
@@ -27,7 +33,7 @@ else
 	CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
 	 $(call cc-param,asan-globals=1) \
 	 $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
-	 $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK)) \
+	 $(call cc-param,asan-stack=$(stack_enable)) \
 	 $(call cc-param,asan-instrument-allocas=1)
 endif
 
@@ -42,7 +48,7 @@ else
 endif
 
 CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
-		-mllvm -hwasan-instrument-stack=$(CONFIG_KASAN_STACK) \
+		-mllvm -hwasan-instrument-stack=$(stack_enable) \
 		-mllvm -hwasan-use-short-granules=0 \
 		$(instrumentation_flags)
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
