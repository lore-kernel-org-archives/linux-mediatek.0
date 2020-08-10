Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCFFC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:34:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204762073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bpuAIVX6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="owPhiPoI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204762073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MMWQu7IQvcw+szlrV6yhyp88IWLvStYYlZb9SYYxr5c=; b=bpuAIVX6a+PsKD9xczgMRHvGMV
	oVpSR6gY4e4biBDCGSprplc0aNVRWCFrAHuDtX8RRgnw1npHbOpP7TSpUqTwlauS2DuJNQ0ORlElm
	D+3dxjMv+Rhu0Jg8m8VZJyaw/WcUa22gYfpL6oFI5s+n+C85xmFHWb0QbdfRHWCih/Nf0v42wwHiX
	TG6pkDGtcqgLYHFz19hPiHmFTgyC9bq2CE4JOqWz9ke80tTAu+Nla6oOGl8cCJMItgXz0rrE8gfZo
	8n3LX0qZ9rb2IUKsl61MvPeBhdrbHLWaam1mB4QhdPTfhPsTpZkSoG1ucSjDYwEYRnpma/M5czwe1
	KfP8EoDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k52KT-0005CR-UI; Mon, 10 Aug 2020 07:34:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k52KM-00059J-Dc; Mon, 10 Aug 2020 07:34:39 +0000
X-UUID: 14a7bf915ec44db79c533d8756850f58-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WMW/SN71MKFExQk+QjN4pv2EvhjdGtOmUqiO3skR3Gk=; 
 b=owPhiPoIDMcnubY5Z8f1Rw7M/M5k3XE0bCrsz9GdwgqBqYz8ZUYnObXZSNTfgxhvj4dA6As6gw8yJmpVb+zkOudWjZK9k2E+2crNvA8v0P+kApu9UVyMjofLVQfkyQZOzvol/mb1o0FBi8bC+b8qe4FdQlZckXnoY0/tgv3HpP8=;
X-UUID: 14a7bf915ec44db79c533d8756850f58-20200809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1043358307; Sun, 09 Aug 2020 23:34:27 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 00:25:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 15:25:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Aug 2020 15:25:15 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "Tejun
 Heo" <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Subject: [PATCH 2/5] workqueue: kasan: record and print workqueue stack
Date: Mon, 10 Aug 2020 15:25:15 +0800
Message-ID: <20200810072515.632-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_033438_632651_0CAF6E5C 
X-CRM114-Status: GOOD (  18.54  )
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

This patch records the last two enqueueing work call stacks on workqueue
and prints up to 2 workqueue stacks in KASAN report. It is useful for
programmers to solve use-after-free or double-free memory wq issue.

When queue_work() is called, then queue the work into a workqueue, we
store this call stack in order to print it in KASAN report.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/kasan.h |  2 ++
 kernel/workqueue.c    |  3 +++
 mm/kasan/generic.c    | 21 +++++++++++++++++++++
 mm/kasan/kasan.h      |  8 +++++---
 mm/kasan/report.c     | 11 +++++++++++
 5 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 43ae040ae9b2..687cbf2faf83 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -174,6 +174,7 @@ void kasan_cache_shrink(struct kmem_cache *cache);
 void kasan_cache_shutdown(struct kmem_cache *cache);
 void kasan_record_aux_stack(void *ptr);
 void kasan_record_tmr_stack(void *ptr);
+void kasan_record_wq_stack(void *ptr);
 
 #else /* CONFIG_KASAN_GENERIC */
 
@@ -181,6 +182,7 @@ static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
 static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
 static inline void kasan_record_aux_stack(void *ptr) {}
 static inline void kasan_record_tmr_stack(void *ptr) {}
+static inline void kasan_record_wq_stack(void *ptr) {}
 
 #endif /* CONFIG_KASAN_GENERIC */
 
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index c41c3c17b86a..0e5963e06730 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -1324,6 +1324,9 @@ static void insert_work(struct pool_workqueue *pwq, struct work_struct *work,
 {
 	struct worker_pool *pool = pwq->pool;
 
+	/* record the work in order to print it in KASAN reports */
+	kasan_record_wq_stack(work);
+
 	/* we own @work, set data and link */
 	set_work_pwq(work, pwq, extra_flags);
 	list_add_tail(&work->entry, head);
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 627792d11569..592dc58fbe42 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -367,6 +367,27 @@ void kasan_record_tmr_stack(void *addr)
 	alloc_info->tmr_stack[0] = kasan_save_stack(GFP_NOWAIT);
 }
 
+void kasan_record_wq_stack(void *addr)
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
+	 * record the last two workqueue stacks.
+	 */
+	alloc_info->wq_stack[1] = alloc_info->wq_stack[0];
+	alloc_info->wq_stack[0] = kasan_save_stack(GFP_NOWAIT);
+}
+
 void kasan_set_free_info(struct kmem_cache *cache,
 				void *object, u8 tag)
 {
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 4059f327767c..a4f76b1bde0a 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -108,12 +108,14 @@ struct kasan_alloc_meta {
 	struct kasan_track alloc_track;
 #ifdef CONFIG_KASAN_GENERIC
 	/*
-	 * call_rcu() call stack and timer queueing stack are stored
-	 * into struct kasan_alloc_meta.
-	 * The free stack is stored into struct kasan_free_meta.
+	 * call_rcu() call stack, timer queueing stack, and workqueue
+	 * queueing stack are stored into kasan_alloc_meta.
+	 *
+	 * With generic KASAN the free stack is stored into kasan_free_meta.
 	 */
 	depot_stack_handle_t aux_stack[2];
 	depot_stack_handle_t tmr_stack[2];
+	depot_stack_handle_t wq_stack[2];
 #else
 	struct kasan_track free_track[KASAN_NR_FREE_STACKS];
 #endif
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index f602f090d90b..e6bc470fcd0a 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -203,6 +203,17 @@ static void describe_object(struct kmem_cache *cache, void *object,
 			print_stack(alloc_info->tmr_stack[1]);
 			pr_err("\n");
 		}
+
+		if (alloc_info->wq_stack[0]) {
+			pr_err("Last workqueue stack:\n");
+			print_stack(alloc_info->wq_stack[0]);
+			pr_err("\n");
+		}
+		if (alloc_info->wq_stack[1]) {
+			pr_err("Second to last workqueue stack:\n");
+			print_stack(alloc_info->wq_stack[1]);
+			pr_err("\n");
+		}
 #endif
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
