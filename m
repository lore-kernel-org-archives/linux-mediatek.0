Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D6AC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:21:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBED9206E6
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z1wUs9VF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pi6CaFpJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBED9206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J0bXUV8YnRO+Pe4i2zPfLZyhL8/ShTQgOp1BTilSmZs=; b=Z1wUs9VF6b6FAl
	zOmIzLtd2o/8Kne8n2lxHR5EEHf+UEb3b8H15zgkNXtxsNsAx4XoeO9qO9mSthZo4mwnndS7AXNDN
	CkNvuliy4NwX6D61q4DSSjOBCpstUdmQPZtulgd6lMBarAW8WXbHgP43hnKRc2+nktUsH05dPFFc0
	dosgQxO21VXjr7QUBT6RLxutWEgA7xRg37gwjKa2scLrbaARfRMO8FQPCkYbDaj3yWpLZHfMeF5PU
	FfTgyfhpkT5gbvbpWz5Xv5OEx7FptRav0OW/ozi0Vugbg/66k2TcVRw97kfwOH67LCIYFx+Mn9MIy
	g65XVDgyke65iBOwreUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWCUW-0002X9-5Y; Wed, 06 May 2020 05:21:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWCUO-0002PU-0f; Wed, 06 May 2020 05:21:01 +0000
X-UUID: f927278f36c94a2688c0ce9cbec1cb28-20200505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ETHA4HWY0Hog3Z3ytmN4JoSnKcZh6hg7h8BcVESgFcc=; 
 b=pi6CaFpJouwWda1nCFSwZws5kCsSONdvR4/uIgxKsPbJ9yTX+4lNYOcIui408Ra8I/+Z+6MrSbDwO5m5S955tRyVBDbcvwD3sASjsHpxauQqyY1iRHNZiBGj3P02FhcFXdE5vUIkl2crfZPaXvk9mAFNqTsgq7ldtbp9yPGjYoA=;
X-UUID: f927278f36c94a2688c0ce9cbec1cb28-20200505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 206150361; Tue, 05 May 2020 21:20:58 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 May 2020 22:20:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 13:20:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 May 2020 13:20:54 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Josh
 Triplett" <josh@joshtriplett.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: [PATCH 1/3] rcu/kasan: record and print call_rcu() call stack
Date: Wed, 6 May 2020 13:20:46 +0800
Message-ID: <20200506052046.14451-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 207E808D1826991DB0A16DB3C4D0C374BC1D58B8654CEFD3C6BB5AFBE7FBB2F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_222100_065925_F8C2228C 
X-CRM114-Status: GOOD (  15.55  )
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

When call_rcu() is called, we store the call_rcu() call stack into
slub alloc meta-data, so that KASAN report prints call_rcu() information.

We add new KASAN_RCU_STACK_RECORD configuration option. It will record
first and last call_rcu() call stack and KASAN report will print two
call_rcu() call stack.

This option doesn't increase the cost of memory consumption. Because
we don't enlarge struct kasan_alloc_meta size.
- add two call_rcu() call stack into kasan_alloc_meta, size is 8 bytes.
- remove free track from kasan_alloc_meta, size is 8 bytes.

[1]https://bugzilla.kernel.org/show_bug.cgi?id=198437

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Joel Fernandes <joel@joelfernandes.org>
---
 include/linux/kasan.h |  7 +++++++
 kernel/rcu/tree.c     |  4 ++++
 lib/Kconfig.kasan     | 11 +++++++++++
 mm/kasan/common.c     | 23 +++++++++++++++++++++++
 mm/kasan/kasan.h      | 12 ++++++++++++
 mm/kasan/report.c     | 33 +++++++++++++++++++++++++++------
 6 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 31314ca7c635..5eeece6893cd 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -96,6 +96,12 @@ size_t kasan_metadata_size(struct kmem_cache *cache);
 bool kasan_save_enable_multi_shot(void);
 void kasan_restore_multi_shot(bool enabled);
 
+#ifdef CONFIG_KASAN_RCU_STACK_RECORD
+void kasan_record_callrcu(void *ptr);
+#else
+static inline void kasan_record_callrcu(void *ptr) {}
+#endif
+
 #else /* CONFIG_KASAN */
 
 static inline void kasan_unpoison_shadow(const void *address, size_t size) {}
@@ -165,6 +171,7 @@ static inline void kasan_remove_zero_shadow(void *start,
 
 static inline void kasan_unpoison_slab(const void *ptr) { }
 static inline size_t kasan_metadata_size(struct kmem_cache *cache) { return 0; }
+static inline void kasan_record_callrcu(void *ptr) {}
 
 #endif /* CONFIG_KASAN */
 
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 06548e2ebb72..145c79becf7b 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -57,6 +57,7 @@
 #include <linux/slab.h>
 #include <linux/sched/isolation.h>
 #include <linux/sched/clock.h>
+#include <linux/kasan.h>
 #include "../time/tick-internal.h"
 
 #include "tree.h"
@@ -2694,6 +2695,9 @@ __call_rcu(struct rcu_head *head, rcu_callback_t func)
 		trace_rcu_callback(rcu_state.name, head,
 				   rcu_segcblist_n_cbs(&rdp->cblist));
 
+	if (IS_ENABLED(CONFIG_KASAN_RCU_STACK_RECORD))
+		kasan_record_callrcu(head);
+
 	/* Go handle any RCU core processing required. */
 	if (IS_ENABLED(CONFIG_RCU_NOCB_CPU) &&
 	    unlikely(rcu_segcblist_is_offloaded(&rdp->cblist))) {
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index 81f5464ea9e1..022934049cc2 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -158,6 +158,17 @@ config KASAN_VMALLOC
 	  for KASAN to detect more sorts of errors (and to support vmapped
 	  stacks), but at the cost of higher memory usage.
 
+config KASAN_RCU_STACK_RECORD
+	bool "Record and print call_rcu() call stack"
+	depends on KASAN_GENERIC
+	help
+	  By default, the KASAN report doesn't print call_rcu() call stack.
+	  It is very difficult to analyze memory issues(e.g., use-after-free).
+
+	  Enabling this option will print first and last call_rcu() call stack.
+	  It doesn't enlarge slub alloc meta-data size, so it doesn't increase
+	  the cost of memory consumption.
+
 config TEST_KASAN
 	tristate "Module for testing KASAN for bug detection"
 	depends on m && KASAN
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 2906358e42f0..32d422bdf127 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -299,6 +299,29 @@ struct kasan_free_meta *get_free_info(struct kmem_cache *cache,
 	return (void *)object + cache->kasan_info.free_meta_offset;
 }
 
+#ifdef CONFIG_KASAN_RCU_STACK_RECORD
+void kasan_record_callrcu(void *addr)
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
+	if (!alloc_info->rcu_free_stack[0])
+		/* record first call_rcu() call stack */
+		alloc_info->rcu_free_stack[0] = save_stack(GFP_NOWAIT);
+	else
+		/* record last call_rcu() call stack */
+		alloc_info->rcu_free_stack[1] = save_stack(GFP_NOWAIT);
+}
+#endif
 
 static void kasan_set_free_info(struct kmem_cache *cache,
 		void *object, u8 tag)
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index e8f37199d885..adc105b9cd07 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -96,15 +96,27 @@ struct kasan_track {
 	depot_stack_handle_t stack;
 };
 
+#ifdef CONFIG_KASAN_RCU_STACK_RECORD
+#define BYTES_PER_WORD 4
+#define KASAN_NR_RCU_FREE_STACKS 2
+#else /* CONFIG_KASAN_RCU_STACK_RECORD */
 #ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
 #define KASAN_NR_FREE_STACKS 5
 #else
 #define KASAN_NR_FREE_STACKS 1
 #endif
+#endif /* CONFIG_KASAN_RCU_STACK_RECORD */
 
 struct kasan_alloc_meta {
 	struct kasan_track alloc_track;
+#ifdef CONFIG_KASAN_RCU_STACK_RECORD
+	/* call_rcu() call stack is stored into kasan_alloc_meta.
+	 * free stack is stored into freed object.
+	 */
+	depot_stack_handle_t rcu_free_stack[KASAN_NR_RCU_FREE_STACKS];
+#else
 	struct kasan_track free_track[KASAN_NR_FREE_STACKS];
+#endif
 #ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
 	u8 free_pointer_tag[KASAN_NR_FREE_STACKS];
 	u8 free_track_idx;
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 80f23c9da6b0..7aaccc70b65b 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -105,9 +105,13 @@ static void end_report(unsigned long *flags)
 	kasan_enable_current();
 }
 
-static void print_track(struct kasan_track *track, const char *prefix)
+static void print_track(struct kasan_track *track, const char *prefix,
+						bool is_callrcu)
 {
-	pr_err("%s by task %u:\n", prefix, track->pid);
+	if (is_callrcu)
+		pr_err("%s:\n", prefix);
+	else
+		pr_err("%s by task %u:\n", prefix, track->pid);
 	if (track->stack) {
 		unsigned long *entries;
 		unsigned int nr_entries;
@@ -159,8 +163,22 @@ static void describe_object_addr(struct kmem_cache *cache, void *object,
 		(void *)(object_addr + cache->object_size));
 }
 
+#ifdef CONFIG_KASAN_RCU_STACK_RECORD
+static void kasan_print_rcu_free_stack(struct kasan_alloc_meta *alloc_info)
+{
+	struct kasan_track free_track;
+
+	free_track.stack  = alloc_info->rcu_free_stack[0];
+	print_track(&free_track, "First call_rcu() call stack", true);
+	pr_err("\n");
+	free_track.stack  = alloc_info->rcu_free_stack[1];
+	print_track(&free_track, "Last call_rcu() call stack", true);
+	pr_err("\n");
+}
+#endif
+
 static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
-		void *object, u8 tag)
+		void *object, u8 tag, const void *addr)
 {
 	struct kasan_alloc_meta *alloc_meta;
 	int i = 0;
@@ -187,11 +205,14 @@ static void describe_object(struct kmem_cache *cache, void *object,
 	if (cache->flags & SLAB_KASAN) {
 		struct kasan_track *free_track;
 
-		print_track(&alloc_info->alloc_track, "Allocated");
+		print_track(&alloc_info->alloc_track, "Allocated", false);
 		pr_err("\n");
-		free_track = kasan_get_free_track(cache, object, tag);
-		print_track(free_track, "Freed");
+		free_track = kasan_get_free_track(cache, object, tag, addr);
+		print_track(free_track, "Freed", false);
 		pr_err("\n");
+#ifdef CONFIG_KASAN_RCU_STACK_RECORD
+		kasan_print_rcu_free_stack(alloc_info);
+#endif
 	}
 
 	describe_object_addr(cache, object, addr);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
