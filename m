Return-Path: <SRS0=Yz5u=2N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4155C2D0D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 11:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0A62063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 11:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y7s+dLjl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hjqqHWuj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B0A62063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0LkkjGBvLSh2rkH2fOUyqZmUb15XZ9KpOFwGoUWiE84=; b=Y7s+dLjlCdzUBf
	+eYZ0yR46wdj6vPu3xYKAEZuPjrXZcyCapVShV51sTSg2P1R5e95RQ73xNVpIq6MUu6x6KZPeW8Mq
	N+F450VFlKlCeV+7wSHPOz4Eor1JXi7sx1l5g8yghsQZ4vDgrTawBoPjL4dx0VF/cvvtOtzsH6dMH
	0irn4ZeZ5dtjLmVdpqv5bfCY9r2jO6f58wUYm78QHL1UEOpsQcDo60W+fsfzyxCgq2SIepiz02CeB
	h6hbe2SExdLYor7tSG2lE0+P7VYzwatUmW+5fXlQmRrz1Vq7wloqgA6k9bgvKmMf97G7wt5lRJYx3
	IIm1klIMCNAQVqI7T+QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijLy1-0007H7-CF; Mon, 23 Dec 2019 11:33:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijLxy-0007GX-CK
 for linux-mediatek@lists.infradead.org; Mon, 23 Dec 2019 11:33:40 +0000
X-UUID: b97d5ce91e5d43f38b2268c197e5097b-20191223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qX14vySNe6dWHS9CVDjOljRuxmLr34hwjucjAyQrc40=; 
 b=hjqqHWujsKPp7M8G3XBepzWUuos1NXZO7NRHReI4zK9WxsB0H96Tdw1RN3Gdf3uxTi/KCiM4UTstKJ7K/MifEvdv74G7Scu7htGYhonscSWa33NWPVbWzLL7YmfSmKOpCBBFu9s55Ebebv1+Uxxc9I2Hg2msUn+kv+g99bAi+C0=;
X-UUID: b97d5ce91e5d43f38b2268c197e5097b-20191223
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 534524938; Mon, 23 Dec 2019 03:33:32 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Dec 2019 03:34:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Dec 2019 19:33:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 23 Dec 2019 19:32:33 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm/page_owner: print largest memory consumer when OOM panic
 occurs
Date: Mon, 23 Dec 2019 19:33:26 +0800
Message-ID: <20191223113326.13828-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B750EF3048915A1305E13950C7313796853CA057EF394FBE0BAF085AE76E0202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_033338_437180_1AAE0023 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: Michal Hocko <mhocko@suse.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Motivation:
-----------

When debug with a OOM kernel panic, it is difficult to know the
memory allocated by kernel drivers of vmalloc() by checking the
Mem-Info or Node/Zone info. For example:

  Mem-Info:
  active_anon:5144 inactive_anon:16120 isolated_anon:0
   active_file:0 inactive_file:0 isolated_file:0
   unevictable:0 dirty:0 writeback:0 unstable:0
   slab_reclaimable:739 slab_unreclaimable:442469
   mapped:534 shmem:21050 pagetables:21 bounce:0
   free:14808 free_pcp:3389 free_cma:8128

  Node 0 active_anon:20576kB inactive_anon:64480kB active_file:0kB
  inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB
  mapped:2136kB dirty:0kB writeback:0kB shmem:84200kB shmem_thp: 0kB
  shmem_pmdmapped: 0kB anon_thp: 0kB writeback_tmp:0kB unstable:0kB
  all_unr eclaimable? yes

  Node 0 DMA free:14476kB min:21512kB low:26888kB high:32264kB
  reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
  active_file: 0kB inactive_file:0kB unevictable:0kB writepending:0kB
  present:1048576kB managed:952736kB mlocked:0kB kernel_stack:0kB
  pagetables:0kB bounce:0kB free_pcp:2716kB local_pcp:0kB free_cma:0kB

The information above tells us the memory usage of the known memory
categories and we can check the abnormal large numbers. However, if a
memory leakage cannot be observed in the categories above, we need to
reproduce the issue with CONFIG_PAGE_OWNER.

It is possible to read the page owner information from coredump files.
However, coredump files may not always be available, so my approach is
to print out the largest page consumer when OOM kernel panic occurs.

The heuristic approach assumes that the OOM kernel panic is caused by
a single backtrace. The assumption is not always true but it works in
many cases during our test.

We have tested this heuristic approach since 2019/5 on android devices.
In 38 internal OOM kernel panic reports:

31/38: can be analyzed by using existing information
7/38: need page owner formatino and the heuristic approach in this patch
prints the correct backtraces of abnormal memory allocations. No need to
reproduce the issues.

Output:
-------

This output below is generated by a dummy infinite
kmalloc(256, GFP_KERNEL) loop:

[   49.691027] OOM: largest memory consumer: 428468 pages are allocated from:
[   49.691278]  prep_new_page+0x198/0x19c
[   49.691390]  get_page_from_freelist+0x1cb4/0x1e54
[   49.691500]  __alloc_pages_nodemask+0x16c/0xe10
[   49.691599]  alloc_pages_current+0x104/0x190
[   49.691697]  alloc_slab_page+0x160/0x4e8
[   49.691782]  new_slab+0xb8/0x510
[   49.691866]  ___slab_alloc+0x294/0x3dc
[   49.691957]  kmem_cache_alloc+0x1f0/0x250
[   49.692047]  meminfo_proc_show+0x68/0x8fc
[   49.692135]  seq_read+0x1dc/0x47c
[   49.692217]  proc_reg_read+0x5c/0xb4
[   49.692303]  do_iter_read+0xdc/0x1c0
[   49.692389]  vfs_readv+0x60/0xa8
[   49.692471]  default_file_splice_read+0x1f0/0x304
[   49.692582]  splice_direct_to_actor+0x100/0x294
[   49.692679]  do_splice_direct+0x78/0xc8
[   39.328607] Kernel panic - not syncing: System is deadlocked on memory

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 include/linux/oom.h |   1 +
 mm/oom_kill.c       |   4 ++
 mm/page_owner.c     | 135 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)

diff --git a/include/linux/oom.h b/include/linux/oom.h
index c696c265f019..fe3c923ac8f3 100644
--- a/include/linux/oom.h
+++ b/include/linux/oom.h
@@ -121,6 +121,7 @@ extern bool oom_killer_disable(signed long timeout);
 extern void oom_killer_enable(void);
 
 extern struct task_struct *find_lock_task_mm(struct task_struct *p);
+extern void report_largest_page_consumer(void);
 
 /* sysctls */
 extern int sysctl_oom_dump_tasks;
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 71e3acea7817..9b069b5a4aff 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -42,6 +42,7 @@
 #include <linux/kthread.h>
 #include <linux/init.h>
 #include <linux/mmu_notifier.h>
+#include <linux/once.h>
 
 #include <asm/tlb.h>
 #include "internal.h"
@@ -1099,6 +1100,9 @@ bool out_of_memory(struct oom_control *oc)
 	if (!oc->chosen) {
 		dump_header(oc, NULL);
 		pr_warn("Out of memory and no killable processes...\n");
+#ifdef CONFIG_PAGE_OWNER
+		DO_ONCE(report_largest_page_consumer);
+#endif
 		/*
 		 * If we got here due to an actual allocation at the
 		 * system level, we cannot survive this and will enter
diff --git a/mm/page_owner.c b/mm/page_owner.c
index 18ecde9f45b2..b23e5fe35dad 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -10,6 +10,8 @@
 #include <linux/migrate.h>
 #include <linux/stackdepot.h>
 #include <linux/seq_file.h>
+#include <linux/stacktrace.h>
+#include <linux/hashtable.h>
 
 #include "internal.h"
 
@@ -19,12 +21,16 @@
  */
 #define PAGE_OWNER_STACK_DEPTH (16)
 
+#define OOM_HANDLE_HASH_BITS	10
+
 struct page_owner {
 	unsigned short order;
 	short last_migrate_reason;
 	gfp_t gfp_mask;
 	depot_stack_handle_t handle;
 	depot_stack_handle_t free_handle;
+	struct hlist_node node;
+	unsigned long page_count; /* number of pages points to this handle */
 };
 
 static bool page_owner_enabled = false;
@@ -33,6 +39,8 @@ DEFINE_STATIC_KEY_FALSE(page_owner_inited);
 static depot_stack_handle_t dummy_handle;
 static depot_stack_handle_t failure_handle;
 static depot_stack_handle_t early_handle;
+static DEFINE_HASHTABLE(oom_handle_hash, OOM_HANDLE_HASH_BITS);
+static struct page_owner *most_referenced_page_owner;
 
 static void init_early_allocated_pages(void);
 
@@ -48,6 +56,57 @@ static int __init early_page_owner_param(char *buf)
 }
 early_param("page_owner", early_page_owner_param);
 
+static struct hlist_head *get_bucket(depot_stack_handle_t handle)
+{
+	unsigned long hash;
+
+	hash = hash_long(handle, OOM_HANDLE_HASH_BITS);
+	return &oom_handle_hash[hash];
+}
+
+/*
+ * lookup a page_owner in the hash bucket
+ */
+static struct page_owner *lookup_page_owner(depot_stack_handle_t handle,
+						struct hlist_head *b)
+{
+	struct page_owner *page_owner;
+
+	hlist_for_each_entry(page_owner, b, node) {
+		if (page_owner->handle == handle)
+			return page_owner;
+	}
+
+	return NULL;
+}
+
+/*
+ * Increase the page_owner->page_count in the handle_hash by (1 << order)
+ */
+static void increase_handle_count(struct page_owner *page_owner)
+{
+	struct hlist_head *bucket;
+	struct page_owner *owner;
+
+	bucket = get_bucket(page_owner->handle);
+
+	owner = lookup_page_owner(page_owner->handle, bucket);
+
+	if (!owner) {
+		owner = page_owner;
+		hlist_add_head(&page_owner->node, bucket);
+	}
+
+	/* increase page counter */
+	owner->page_count += (1 << owner->order);
+
+	/* update most_referenced_page_owner */
+	if (!most_referenced_page_owner)
+		most_referenced_page_owner = owner;
+	if (most_referenced_page_owner->page_count < owner->page_count)
+		most_referenced_page_owner = owner;
+}
+
 static bool need_page_owner(void)
 {
 	return page_owner_enabled;
@@ -172,6 +231,7 @@ static inline void __set_page_owner_handle(struct page *page,
 		page_owner->order = order;
 		page_owner->gfp_mask = gfp_mask;
 		page_owner->last_migrate_reason = -1;
+		page_owner->page_count = 0;
 		__set_bit(PAGE_EXT_OWNER, &page_ext->flags);
 		__set_bit(PAGE_EXT_OWNER_ALLOCATED, &page_ext->flags);
 
@@ -216,6 +276,7 @@ void __split_page_owner(struct page *page, unsigned int order)
 	for (i = 0; i < (1 << order); i++) {
 		page_owner = get_page_owner(page_ext);
 		page_owner->order = 0;
+		page_owner->page_count = 0;
 		page_ext = page_ext_next(page_ext);
 	}
 }
@@ -236,6 +297,7 @@ void __copy_page_owner(struct page *oldpage, struct page *newpage)
 	new_page_owner->last_migrate_reason =
 		old_page_owner->last_migrate_reason;
 	new_page_owner->handle = old_page_owner->handle;
+	new_page_owner->page_count = new_page_owner->page_count;
 
 	/*
 	 * We don't clear the bit on the oldpage as it's going to be freed
@@ -615,6 +677,79 @@ static void init_pages_in_zone(pg_data_t *pgdat, struct zone *zone)
 		pgdat->node_id, zone->name, count);
 }
 
+static void __report_largest_page_consumer(struct page_owner *page_owner)
+{
+	unsigned long *entries = NULL;
+	unsigned int nr_entries;
+
+	nr_entries = stack_depot_fetch(page_owner->handle, &entries);
+	pr_info("OOM: largest memory consumer: %lu pages are allocated from:\n",
+			page_owner->page_count);
+	stack_trace_print(entries, nr_entries, 0);
+}
+
+void report_largest_page_consumer(void)
+{
+	unsigned long pfn;
+	struct page *page;
+	struct page_ext *page_ext;
+	struct page_owner *page_owner;
+	depot_stack_handle_t handle;
+
+	pfn = min_low_pfn;
+
+	if (!static_branch_unlikely(&page_owner_inited))
+		return;
+
+	/* Find a valid PFN or the start of a MAX_ORDER_NR_PAGES area */
+	while (!pfn_valid(pfn) && (pfn & (MAX_ORDER_NR_PAGES - 1)) != 0)
+		pfn++;
+
+	/* Find an allocated page */
+	for (; pfn < max_pfn; pfn++) {
+		if ((pfn & (MAX_ORDER_NR_PAGES - 1)) == 0 && !pfn_valid(pfn)) {
+			pfn += MAX_ORDER_NR_PAGES - 1;
+			continue;
+		}
+
+		if (!pfn_valid_within(pfn))
+			continue;
+
+		page = pfn_to_page(pfn);
+		if (PageBuddy(page)) {
+			unsigned long freepage_order = page_order_unsafe(page);
+
+			if (freepage_order < MAX_ORDER)
+				pfn += (1UL << freepage_order) - 1;
+			continue;
+		}
+
+		if (PageReserved(page))
+			continue;
+
+		page_ext = lookup_page_ext(page);
+		if (unlikely(!page_ext))
+			continue;
+
+		if (!test_bit(PAGE_EXT_OWNER_ALLOCATED, &page_ext->flags))
+			continue;
+
+		page_owner = get_page_owner(page_ext);
+
+		if (!IS_ALIGNED(pfn, 1 << page_owner->order))
+			continue;
+
+		handle = READ_ONCE(page_owner->handle);
+		if (!handle)
+			continue;
+
+		increase_handle_count(page_owner);
+	}
+
+	__report_largest_page_consumer(most_referenced_page_owner);
+}
+
+
 static void init_zones_in_node(pg_data_t *pgdat)
 {
 	struct zone *zone;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
