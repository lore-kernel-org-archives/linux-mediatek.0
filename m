Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE18C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 16:24:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D70D20657
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 16:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lU2KS+ZP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u7VfcMsh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D70D20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EA6W+iiZbr4Ss4G42fwHIaoJteo7OhqDoU3l1CyP4f0=; b=lU2KS+ZPOZVj9NEisA4hZ8xoet
	eEW0wTw1WVIl9NDFn54hVbdHWmkF10AGjLfRmrXup6esK0tPglkrrJPmBTUkuMd2xoDtol2jP8YY5
	IZgG3Vf0Eb31nXDS5FAnViyHsKfmDSUALcEHTP/hLk6WtDhmfJVKeydod+I4zv4k/x3AYRSV8ekO8
	FndOtcJCmf3qXp/BBoW7N03c9xl6WT5eS3iQ/CYTpGPoO0eNkQUv7UuwgZ3Lmsu9eNO7W4kIYeBbP
	tF51kzhW21VO3yu2QgJ5FjGcVBhToa5ZpG3pzhwZlAvIlirffm2hRLY2Pkqr1BMQJoHn4CJBx7OoG
	PP0PRnpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtvp4-0001F0-I5; Fri, 10 Jul 2020 16:24:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtvp0-0001De-E2; Fri, 10 Jul 2020 16:24:23 +0000
X-UUID: 0325afa37b8442a3b47af0f05ac7e320-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lz5bM/DGUrKvyb0iA7Fk88tu9GouKoqnG5Xv/sMmmGU=; 
 b=u7VfcMshZ8Y7ty/WN9MazF+y63TRZoPt2YRKx9JEUEnH8bx5HHaqLkMjJf0oPlz7g+s+i0IX0CKtsu17OwXr2crzl0+wkh/cEo2W9cPUXAREwPQnBlznizg9FIWsu0bzYse4iTPZiid/Bp1hyzyky0AXVWTfufuph+2UrqvmEo0=;
X-UUID: 0325afa37b8442a3b47af0f05ac7e320-20200710
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 93105167; Fri, 10 Jul 2020 08:24:17 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 09:24:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 00:24:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Jul 2020 00:24:03 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 1/4] rcu: kasan: record and print call_rcu() call stack
Date: Sat, 11 Jul 2020 00:24:01 +0800
Message-ID: <20200710162401.23816-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6E9BA3A2DA6E0C0B9514B97C67FF9D9D1AA47C1C91B5E3D4CA23464A593A44492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_122422_633126_74279443 
X-CRM114-Status: GOOD (  19.33  )
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
 "Paul E . McKenney" <paulmck@kernel.org>,
 Andrey Konovalov <andreyknvl@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry
 Vyukov <dvyukov@google.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This feature will record the last two call_rcu() call stacks and
prints up to 2 call_rcu() call stacks in KASAN report.

When call_rcu() is called, we store the call_rcu() call stack into
slub alloc meta-data, so that the KASAN report can print rcu stack.

[1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
[2]https://groups.google.com/forum/#!searchin/kasan-dev/better$20stack$20traces$20for$20rcu%7Csort:date/kasan-dev/KQsjT_88hDE/7rNUZprRBgAJ

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Dmitry Vyukov <dvyukov@google.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-and-tested-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Joel Fernandes <joel@joelfernandes.org>
---

Changes since v7:
- fix this commit dependence in the series

Changes since v6:
- fix typo

---
 include/linux/kasan.h |  2 ++
 kernel/rcu/tree.c     |  2 ++
 mm/kasan/common.c     |  4 ++--
 mm/kasan/generic.c    | 21 +++++++++++++++++++++
 mm/kasan/kasan.h      |  9 +++++++++
 mm/kasan/report.c     | 28 +++++++++++++++++++++++-----
 6 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 31314ca7c635..23b7ee00572d 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -174,11 +174,13 @@ static inline size_t kasan_metadata_size(struct kmem_cache *cache) { return 0; }
 
 void kasan_cache_shrink(struct kmem_cache *cache);
 void kasan_cache_shutdown(struct kmem_cache *cache);
+void kasan_record_aux_stack(void *ptr);
 
 #else /* CONFIG_KASAN_GENERIC */
 
 static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
 static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
+static inline void kasan_record_aux_stack(void *ptr) {}
 
 #endif /* CONFIG_KASAN_GENERIC */
 
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 06548e2ebb72..36a4ff7f320b 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -57,6 +57,7 @@
 #include <linux/slab.h>
 #include <linux/sched/isolation.h>
 #include <linux/sched/clock.h>
+#include <linux/kasan.h>
 #include "../time/tick-internal.h"
 
 #include "tree.h"
@@ -2668,6 +2669,7 @@ __call_rcu(struct rcu_head *head, rcu_callback_t func)
 	head->func = func;
 	head->next = NULL;
 	local_irq_save(flags);
+	kasan_record_aux_stack(head);
 	rdp = this_cpu_ptr(&rcu_data);
 
 	/* Add the callback to our list. */
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 2906358e42f0..8bc618289bb1 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -41,7 +41,7 @@
 #include "kasan.h"
 #include "../slab.h"
 
-static inline depot_stack_handle_t save_stack(gfp_t flags)
+depot_stack_handle_t kasan_save_stack(gfp_t flags)
 {
 	unsigned long entries[KASAN_STACK_DEPTH];
 	unsigned int nr_entries;
@@ -54,7 +54,7 @@ static inline depot_stack_handle_t save_stack(gfp_t flags)
 static inline void set_track(struct kasan_track *track, gfp_t flags)
 {
 	track->pid = current->pid;
-	track->stack = save_stack(flags);
+	track->stack = kasan_save_stack(flags);
 }
 
 void kasan_enable_current(void)
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 56ff8885fe2e..8acf48882ba2 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -325,3 +325,24 @@ DEFINE_ASAN_SET_SHADOW(f2);
 DEFINE_ASAN_SET_SHADOW(f3);
 DEFINE_ASAN_SET_SHADOW(f5);
 DEFINE_ASAN_SET_SHADOW(f8);
+
+void kasan_record_aux_stack(void *addr)
+{
+	struct page *page = kasan_addr_to_page(addr);
+	struct kmem_cache *cache;
+	struct kasan_alloc_meta *alloc_info;
+	void *object;
+
+	if (!(page && PageSlab(page)))
+		return;
+
+	cache = page->slab_cache;
+	object = nearest_obj(cache, page, addr);
+	alloc_info = get_alloc_info(cache, object);
+
+	/*
+	 * record the last two call_rcu() call stacks.
+	 */
+	alloc_info->aux_stack[1] = alloc_info->aux_stack[0];
+	alloc_info->aux_stack[0] = kasan_save_stack(GFP_NOWAIT);
+}
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index e8f37199d885..b1a88c75416a 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -104,6 +104,13 @@ struct kasan_track {
 
 struct kasan_alloc_meta {
 	struct kasan_track alloc_track;
+#ifdef CONFIG_KASAN_GENERIC
+	/*
+	 * call_rcu() call stack is stored into struct kasan_alloc_meta.
+	 * The free stack is stored into struct kasan_free_meta.
+	 */
+	depot_stack_handle_t aux_stack[2];
+#endif
 	struct kasan_track free_track[KASAN_NR_FREE_STACKS];
 #ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
 	u8 free_pointer_tag[KASAN_NR_FREE_STACKS];
@@ -159,6 +166,8 @@ void kasan_report_invalid_free(void *object, unsigned long ip);
 
 struct page *kasan_addr_to_page(const void *addr);
 
+depot_stack_handle_t kasan_save_stack(gfp_t flags);
+
 #if defined(CONFIG_KASAN_GENERIC) && \
 	(defined(CONFIG_SLAB) || defined(CONFIG_SLUB))
 void quarantine_put(struct kasan_free_meta *info, struct kmem_cache *cache);
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 80f23c9da6b0..2421a4bd9227 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -105,15 +105,20 @@ static void end_report(unsigned long *flags)
 	kasan_enable_current();
 }
 
+static void print_stack(depot_stack_handle_t stack)
+{
+	unsigned long *entries;
+	unsigned int nr_entries;
+
+	nr_entries = stack_depot_fetch(stack, &entries);
+	stack_trace_print(entries, nr_entries, 0);
+}
+
 static void print_track(struct kasan_track *track, const char *prefix)
 {
 	pr_err("%s by task %u:\n", prefix, track->pid);
 	if (track->stack) {
-		unsigned long *entries;
-		unsigned int nr_entries;
-
-		nr_entries = stack_depot_fetch(track->stack, &entries);
-		stack_trace_print(entries, nr_entries, 0);
+		print_stack(track->stack);
 	} else {
 		pr_err("(stack is not available)\n");
 	}
@@ -192,6 +197,19 @@ static void describe_object(struct kmem_cache *cache, void *object,
 		free_track = kasan_get_free_track(cache, object, tag);
 		print_track(free_track, "Freed");
 		pr_err("\n");
+
+#ifdef CONFIG_KASAN_GENERIC
+		if (alloc_info->aux_stack[0]) {
+			pr_err("Last call_rcu():\n");
+			print_stack(alloc_info->aux_stack[0]);
+			pr_err("\n");
+		}
+		if (alloc_info->aux_stack[1]) {
+			pr_err("Second to last call_rcu():\n");
+			print_stack(alloc_info->aux_stack[1]);
+			pr_err("\n");
+		}
+#endif
 	}
 
 	describe_object_addr(cache, object, addr);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
