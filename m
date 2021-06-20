Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88C5C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 11:49:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860E161057
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 11:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 860E161057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzKkGiOFv8gfMLrknO8zYWufO5lOw/yeuQvyEFr7xko=; b=v8kBTF82gSZYDj
	cJSBQGdhKAsDEGBCuR306luAfn3FsofbXF+KHvFGrEaTCsWNeudtS1kHJNd0pJOeqPC/h3WR7R8O+
	ouk/gi1rBQ09J0sZUGQBCOxk/xpmaqlvprwCePZLZqBkE27I1ptpRSyLqW78bHVckTBuwokG+F9uD
	2xpZ+mC1RN8BiA8dsLa7LAn1+37Fkt8zC8bitw3p1DR2EMOtCbFrrK7DaL5w5uFc78ehAZILRfQhS
	7eSYgaM4yqSSG8XrT6wQ/GpwoszLqtsqp9VKen6k3jJljxGjEcCzQzz/3kxZIEuXFuzaUm/nBzlLq
	ddGZ4gnU+XTOu3BY2psg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luvwm-000v7M-Gg; Sun, 20 Jun 2021 11:49:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luvwD-000ut5-3B; Sun, 20 Jun 2021 11:48:31 +0000
X-UUID: 1d847ab9fae04d14b585f3c29538fa5d-20210620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=grYPIWnX/epXg43vfPwR0XP8h9dx/G8CncYBLCqiBvE=; 
 b=nFf04fxdbW6Kkqo84Qgqv0OdLVZvyztzN5TXMK0MAIpRdFwLi7XKmQANwcpNQJmyOX/cL1aR0PBuDqSaU66FD1XK8/Ox+bTSepiO2pop6ucquFnHqOe44hm8GgJz16b2FQteQNN6FsJnQa4PEgh6Mk+7BXk4GvYCY5hffcAQhNU=;
X-UUID: 1d847ab9fae04d14b585f3c29538fa5d-20210620
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1923012421; Sun, 20 Jun 2021 04:48:24 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 04:48:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 19:48:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 20 Jun 2021 19:48:09 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver
 <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <kasan-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
 <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH v3 2/3] kasan: integrate the common part of two KASAN
 tag-based modes
Date: Sun, 20 Jun 2021 19:47:55 +0800
Message-ID: <20210620114756.31304-3-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_044829_191712_C983F9A5 
X-CRM114-Status: GOOD (  22.33  )
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

1. Move kasan_get_free_track() and kasan_set_free_info()
   into tags.c
2. Move kasan_get_bug_type() to header file

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Suggested-by: Marco Elver <elver@google.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/kasan/Makefile         |  4 +--
 mm/kasan/hw_tags.c        | 22 ---------------
 mm/kasan/report_hw_tags.c |  6 +---
 mm/kasan/report_sw_tags.c | 46 +-----------------------------
 mm/kasan/report_tags.h    | 55 ++++++++++++++++++++++++++++++++++++
 mm/kasan/sw_tags.c        | 41 ---------------------------
 mm/kasan/tags.c           | 59 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 118 insertions(+), 115 deletions(-)
 create mode 100644 mm/kasan/report_tags.h
 create mode 100644 mm/kasan/tags.c

diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
index 9fe39a66388a..634de6c1da9b 100644
--- a/mm/kasan/Makefile
+++ b/mm/kasan/Makefile
@@ -37,5 +37,5 @@ CFLAGS_sw_tags.o := $(CC_FLAGS_KASAN_RUNTIME)
 
 obj-$(CONFIG_KASAN) := common.o report.o
 obj-$(CONFIG_KASAN_GENERIC) += init.o generic.o report_generic.o shadow.o quarantine.o
-obj-$(CONFIG_KASAN_HW_TAGS) += hw_tags.o report_hw_tags.o
-obj-$(CONFIG_KASAN_SW_TAGS) += init.o report_sw_tags.o shadow.o sw_tags.o
+obj-$(CONFIG_KASAN_HW_TAGS) += hw_tags.o report_hw_tags.o tags.o
+obj-$(CONFIG_KASAN_SW_TAGS) += init.o report_sw_tags.o shadow.o sw_tags.o tags.o
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index ed5e5b833d61..4ea8c368b5b8 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -216,28 +216,6 @@ void __init kasan_init_hw_tags(void)
 	pr_info("KernelAddressSanitizer initialized\n");
 }
 
-void kasan_set_free_info(struct kmem_cache *cache,
-				void *object, u8 tag)
-{
-	struct kasan_alloc_meta *alloc_meta;
-
-	alloc_meta = kasan_get_alloc_meta(cache, object);
-	if (alloc_meta)
-		kasan_set_track(&alloc_meta->free_track[0], GFP_NOWAIT);
-}
-
-struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
-				void *object, u8 tag)
-{
-	struct kasan_alloc_meta *alloc_meta;
-
-	alloc_meta = kasan_get_alloc_meta(cache, object);
-	if (!alloc_meta)
-		return NULL;
-
-	return &alloc_meta->free_track[0];
-}
-
 void kasan_alloc_pages(struct page *page, unsigned int order, gfp_t flags)
 {
 	/*
diff --git a/mm/kasan/report_hw_tags.c b/mm/kasan/report_hw_tags.c
index 42b2168755d6..ef5e7378f3aa 100644
--- a/mm/kasan/report_hw_tags.c
+++ b/mm/kasan/report_hw_tags.c
@@ -14,11 +14,7 @@
 #include <linux/types.h>
 
 #include "kasan.h"
-
-const char *kasan_get_bug_type(struct kasan_access_info *info)
-{
-	return "invalid-access";
-}
+#include "report_tags.h"
 
 void *kasan_find_first_bad_addr(void *addr, size_t size)
 {
diff --git a/mm/kasan/report_sw_tags.c b/mm/kasan/report_sw_tags.c
index 821a14a19a92..d965a170083e 100644
--- a/mm/kasan/report_sw_tags.c
+++ b/mm/kasan/report_sw_tags.c
@@ -26,51 +26,7 @@
 
 #include <asm/sections.h>
 
-#include "kasan.h"
-#include "../slab.h"
-
-const char *kasan_get_bug_type(struct kasan_access_info *info)
-{
-#ifdef CONFIG_KASAN_TAGS_IDENTIFY
-	struct kasan_alloc_meta *alloc_meta;
-	struct kmem_cache *cache;
-	struct page *page;
-	const void *addr;
-	void *object;
-	u8 tag;
-	int i;
-
-	tag = get_tag(info->access_addr);
-	addr = kasan_reset_tag(info->access_addr);
-	page = kasan_addr_to_page(addr);
-	if (page && PageSlab(page)) {
-		cache = page->slab_cache;
-		object = nearest_obj(cache, page, (void *)addr);
-		alloc_meta = kasan_get_alloc_meta(cache, object);
-
-		if (alloc_meta) {
-			for (i = 0; i < KASAN_NR_FREE_STACKS; i++) {
-				if (alloc_meta->free_pointer_tag[i] == tag)
-					return "use-after-free";
-			}
-		}
-		return "out-of-bounds";
-	}
-
-#endif
-	/*
-	 * If access_size is a negative number, then it has reason to be
-	 * defined as out-of-bounds bug type.
-	 *
-	 * Casting negative numbers to size_t would indeed turn up as
-	 * a large size_t and its value will be larger than ULONG_MAX/2,
-	 * so that this can qualify as out-of-bounds.
-	 */
-	if (info->access_addr + info->access_size < info->access_addr)
-		return "out-of-bounds";
-
-	return "invalid-access";
-}
+#include "report_tags.h"
 
 void *kasan_find_first_bad_addr(void *addr, size_t size)
 {
diff --git a/mm/kasan/report_tags.h b/mm/kasan/report_tags.h
new file mode 100644
index 000000000000..1cb872177904
--- /dev/null
+++ b/mm/kasan/report_tags.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2020 Google, Inc.
+ */
+#ifndef __MM_KASAN_REPORT_TAGS_H
+#define __MM_KASAN_REPORT_TAGS_H
+
+#include "kasan.h"
+#include "../slab.h"
+
+const char *kasan_get_bug_type(struct kasan_access_info *info)
+{
+#ifdef CONFIG_KASAN_TAGS_IDENTIFY
+	struct kasan_alloc_meta *alloc_meta;
+	struct kmem_cache *cache;
+	struct page *page;
+	const void *addr;
+	void *object;
+	u8 tag;
+	int i;
+
+	tag = get_tag(info->access_addr);
+	addr = kasan_reset_tag(info->access_addr);
+	page = kasan_addr_to_page(addr);
+	if (page && PageSlab(page)) {
+		cache = page->slab_cache;
+		object = nearest_obj(cache, page, (void *)addr);
+		alloc_meta = kasan_get_alloc_meta(cache, object);
+
+		if (alloc_meta) {
+			for (i = 0; i < KASAN_NR_FREE_STACKS; i++) {
+				if (alloc_meta->free_pointer_tag[i] == tag)
+					return "use-after-free";
+			}
+		}
+		return "out-of-bounds";
+	}
+#endif
+
+	/*
+	 * If access_size is a negative number, then it has reason to be
+	 * defined as out-of-bounds bug type.
+	 *
+	 * Casting negative numbers to size_t would indeed turn up as
+	 * a large size_t and its value will be larger than ULONG_MAX/2,
+	 * so that this can qualify as out-of-bounds.
+	 */
+	if (info->access_addr + info->access_size < info->access_addr)
+		return "out-of-bounds";
+
+	return "invalid-access";
+}
+
+#endif
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index dd05e6c801fa..bd3f540feb47 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -167,47 +167,6 @@ void __hwasan_tag_memory(unsigned long addr, u8 tag, unsigned long size)
 }
 EXPORT_SYMBOL(__hwasan_tag_memory);
 
-void kasan_set_free_info(struct kmem_cache *cache,
-				void *object, u8 tag)
-{
-	struct kasan_alloc_meta *alloc_meta;
-	u8 idx = 0;
-
-	alloc_meta = kasan_get_alloc_meta(cache, object);
-	if (!alloc_meta)
-		return;
-
-#ifdef CONFIG_KASAN_TAGS_IDENTIFY
-	idx = alloc_meta->free_track_idx;
-	alloc_meta->free_pointer_tag[idx] = tag;
-	alloc_meta->free_track_idx = (idx + 1) % KASAN_NR_FREE_STACKS;
-#endif
-
-	kasan_set_track(&alloc_meta->free_track[idx], GFP_NOWAIT);
-}
-
-struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
-				void *object, u8 tag)
-{
-	struct kasan_alloc_meta *alloc_meta;
-	int i = 0;
-
-	alloc_meta = kasan_get_alloc_meta(cache, object);
-	if (!alloc_meta)
-		return NULL;
-
-#ifdef CONFIG_KASAN_TAGS_IDENTIFY
-	for (i = 0; i < KASAN_NR_FREE_STACKS; i++) {
-		if (alloc_meta->free_pointer_tag[i] == tag)
-			break;
-	}
-	if (i == KASAN_NR_FREE_STACKS)
-		i = alloc_meta->free_track_idx;
-#endif
-
-	return &alloc_meta->free_track[i];
-}
-
 void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,
 			unsigned long ret_ip)
 {
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
new file mode 100644
index 000000000000..8f48b9502a17
--- /dev/null
+++ b/mm/kasan/tags.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file contains common tag-based KASAN code.
+ *
+ * Copyright (c) 2018 Google, Inc.
+ * Copyright (c) 2020 Google, Inc.
+ */
+
+#include <linux/init.h>
+#include <linux/kasan.h>
+#include <linux/kernel.h>
+#include <linux/memory.h>
+#include <linux/mm.h>
+#include <linux/static_key.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "kasan.h"
+
+void kasan_set_free_info(struct kmem_cache *cache,
+				void *object, u8 tag)
+{
+	struct kasan_alloc_meta *alloc_meta;
+	u8 idx = 0;
+
+	alloc_meta = kasan_get_alloc_meta(cache, object);
+	if (!alloc_meta)
+		return;
+
+#ifdef CONFIG_KASAN_TAGS_IDENTIFY
+	idx = alloc_meta->free_track_idx;
+	alloc_meta->free_pointer_tag[idx] = tag;
+	alloc_meta->free_track_idx = (idx + 1) % KASAN_NR_FREE_STACKS;
+#endif
+
+	kasan_set_track(&alloc_meta->free_track[idx], GFP_NOWAIT);
+}
+
+struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
+				void *object, u8 tag)
+{
+	struct kasan_alloc_meta *alloc_meta;
+	int i = 0;
+
+	alloc_meta = kasan_get_alloc_meta(cache, object);
+	if (!alloc_meta)
+		return NULL;
+
+#ifdef CONFIG_KASAN_TAGS_IDENTIFY
+	for (i = 0; i < KASAN_NR_FREE_STACKS; i++) {
+		if (alloc_meta->free_pointer_tag[i] == tag)
+			break;
+	}
+	if (i == KASAN_NR_FREE_STACKS)
+		i = alloc_meta->free_track_idx;
+#endif
+
+	return &alloc_meta->free_track[i];
+}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
