Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B418AC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:23:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3292073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pEYDLaVw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mUc+I3UY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3292073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DgyS2m4fLf7bOWYP/EpcjAN1L2haIgP6X9KGBB+K4Q=; b=pEYDLaVwOkTbH9V2AdODngsz9K
	RJP015O2N9rQxrDPaOdVsYXHWTuZpQUCbCifsFDjWNGjBsNr18CsfYfZckm6k9os4+RpHP8DXUL4t
	uoRV96PElOP3pUd1GvUV3CP0jklNS3GHf7pVdZwxhX94/HokHMu2VITCePvx11ATfa4T38z6wMOb+
	WVAJKbW2PzmFUMoFR7I8TSxwbwjgzERDk8otO0BFRFQaTktGBBpVZPTKeftAedjnc4qLkN1lLvx8r
	ogqgN7Q8hcuGu+bRotL5asBccnt/SZ2Ks0GGC06DO+J76uoHrCWjtajOWEMM2088L/VCPnBuqPRDu
	aTLdoigw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k529X-0003XF-Hn; Mon, 10 Aug 2020 07:23:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k529S-0003Un-JD; Mon, 10 Aug 2020 07:23:23 +0000
X-UUID: c9bf5e8de03c4cc8bac455d5393c2fed-20200809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PpSc/tEQuCx3Ee+gj4Ko/cEUAbvYmxsK1TcRUj0zqIE=; 
 b=mUc+I3UYkH6D5bMqSwM0Z2C483rqHVq6lSsH5OADMnuNFWEb24s6QtIuT7rCeJ8hUKIWjczy1obNaHtGA892W56rwWuDunYSHh8s1suqhZ37d64RoeuqFBThFO1sTDEGfKEBmxQyzEGN12cUqmhGgTFZbtR1/SH6t4IRnZLkDic=;
X-UUID: c9bf5e8de03c4cc8bac455d5393c2fed-20200809
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1282365801; Sun, 09 Aug 2020 23:23:14 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 00:23:15 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 15:23:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Aug 2020 15:23:13 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, John Stultz <john.stultz@linaro.org>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/5] timer: kasan: record and print timer stack
Date: Mon, 10 Aug 2020 15:23:13 +0800
Message-ID: <20200810072313.529-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 98F01DCE42DA20CE4E3012D87E3ABB3D61BAAF8BDBEAA7561BC5D251A16DF3722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_032322_803673_032316B7 
X-CRM114-Status: GOOD (  18.60  )
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
 linux-mediatek@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch records the last two timer queueing stacks and prints
up to 2 timer stacks in KASAN report. It is useful for programmers
to solve use-after-free or double-free memory timer issues.

When timer_setup() or timer_setup_on_stack() is called, then it
prepares to use this timer and sets timer callback, we store
this call stack in order to print it in KASAN report.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/kasan.h |  2 ++
 kernel/time/timer.c   |  2 ++
 mm/kasan/generic.c    | 21 +++++++++++++++++++++
 mm/kasan/kasan.h      |  4 +++-
 mm/kasan/report.c     | 11 +++++++++++
 5 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 23b7ee00572d..763664b36dc6 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -175,12 +175,14 @@ static inline size_t kasan_metadata_size(struct kmem_cache *cache) { return 0; }
 void kasan_cache_shrink(struct kmem_cache *cache);
 void kasan_cache_shutdown(struct kmem_cache *cache);
 void kasan_record_aux_stack(void *ptr);
+void kasan_record_tmr_stack(void *ptr);
 
 #else /* CONFIG_KASAN_GENERIC */
 
 static inline void kasan_cache_shrink(struct kmem_cache *cache) {}
 static inline void kasan_cache_shutdown(struct kmem_cache *cache) {}
 static inline void kasan_record_aux_stack(void *ptr) {}
+static inline void kasan_record_tmr_stack(void *ptr) {}
 
 #endif /* CONFIG_KASAN_GENERIC */
 
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index a5221abb4594..ef2da9ddfac7 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -783,6 +783,8 @@ static void do_init_timer(struct timer_list *timer,
 	timer->function = func;
 	timer->flags = flags | raw_smp_processor_id();
 	lockdep_init_map(&timer->lockdep_map, name, key, 0);
+
+	kasan_record_tmr_stack(timer);
 }
 
 /**
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 4b3cbad7431b..f35dcec990ab 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -347,6 +347,27 @@ void kasan_record_aux_stack(void *addr)
 	alloc_info->aux_stack[0] = kasan_save_stack(GFP_NOWAIT);
 }
 
+void kasan_record_tmr_stack(void *addr)
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
+	 * record the last two timer stacks.
+	 */
+	alloc_info->tmr_stack[1] = alloc_info->tmr_stack[0];
+	alloc_info->tmr_stack[0] = kasan_save_stack(GFP_NOWAIT);
+}
+
 void kasan_set_free_info(struct kmem_cache *cache,
 				void *object, u8 tag)
 {
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index ef655a1c6e15..c50827f388a3 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -108,10 +108,12 @@ struct kasan_alloc_meta {
 	struct kasan_track alloc_track;
 #ifdef CONFIG_KASAN_GENERIC
 	/*
-	 * call_rcu() call stack is stored into struct kasan_alloc_meta.
+	 * call_rcu() call stack and timer queueing stack are stored
+	 * into struct kasan_alloc_meta.
 	 * The free stack is stored into struct kasan_free_meta.
 	 */
 	depot_stack_handle_t aux_stack[2];
+	depot_stack_handle_t tmr_stack[2];
 #else
 	struct kasan_track free_track[KASAN_NR_FREE_STACKS];
 #endif
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index fed3c8fdfd25..6fa3bfee381f 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -191,6 +191,17 @@ static void describe_object(struct kmem_cache *cache, void *object,
 			print_stack(alloc_info->aux_stack[1]);
 			pr_err("\n");
 		}
+
+		if (alloc_info->tmr_stack[0]) {
+			pr_err("Last timer stack:\n");
+			print_stack(alloc_info->tmr_stack[0]);
+			pr_err("\n");
+		}
+		if (alloc_info->tmr_stack[1]) {
+			pr_err("Second to last timer stack:\n");
+			print_stack(alloc_info->tmr_stack[1]);
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
