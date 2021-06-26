Return-Path: <SRS0=XU5C=LU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DF8C49EA6
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 10:10:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 228286191C
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 10:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 228286191C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHwdMfC9fCx0+meHgdVKCJ7YGW55+Ch5UNFtI+0N4zk=; b=HO8xJg2jMJqnaL
	WTLqgjyIT2vBXqrq7tEcbda3ZE6gcKQ+uGNdlnQ5buWR2j4YEsuqcYO9aiJD5yQrpC6uhccHQbZ4V
	Cqc+O3gLwtRhkzqWuvfPPRcP2dZeDrnJNYO4ww3sGHFw8vSuKJQg/qvLVkoS37UJLjVCmWoR+7LRT
	f/UC032rCFUvfLEbECkyUha+WBrr0SXOF7fA61MprNobcXqOFBXAhSoHgzO1TFJTHBvdyONSlBUYF
	V46FJ1BsUYsDP+rJzEr48H2w69mt1R5+i7DvC6upUWnt1VtGzXnxqGG5MTNC/M/0LzD/TkESqWJ7B
	Q6BZK7+IDqpugaxjkgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lx5Gn-003pY5-31; Sat, 26 Jun 2021 10:10:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lx5G9-003pMb-Bo; Sat, 26 Jun 2021 10:09:59 +0000
X-UUID: 3724909009d647a78dec5b9051825447-20210626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZjBG6gau1BwO17GQuMrSKt+XZUtfoYhNoC1/+u8cr/E=; 
 b=gbh9eRLrQL9Kd6rmQn/DHeXsdb3CqUaMEyYZBmMarHLiTR2vZMDSXv2LpKPGNu2dOX88TL55CcvfcyQ6chmZkH0jRWR6XFkzL2cf8zwNeiIMLXlz0Dd5FmAXT4WLLmaKwrvezcIpKSEB5JaV67Y7fenFXEpXp4XJ5anwMwP4DLE=;
X-UUID: 3724909009d647a78dec5b9051825447-20210626
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2075255348; Sat, 26 Jun 2021 03:09:52 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 03:09:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 18:09:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 26 Jun 2021 18:09:37 +0800
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
Subject: [PATCH v4 2/3] kasan: integrate the common part of two KASAN
 tag-based modes
Date: Sat, 26 Jun 2021 18:09:30 +0800
Message-ID: <20210626100931.22794-3-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210626100931.22794-1-Kuan-Ying.Lee@mediatek.com>
References: <20210626100931.22794-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_030957_470402_41F13DE6 
X-CRM114-Status: GOOD (  22.58  )
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
   into tags.c and combine these two functions for
   SW_TAGS and HW_TAGS kasan mode.
2. Move kasan_get_bug_type() to report_tags.c and
   make this function compatible for SW_TAGS and
   HW_TAGS kasan mode.

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
 mm/kasan/report_hw_tags.c |  5 ----
 mm/kasan/report_sw_tags.c | 43 ----------------------------
 mm/kasan/report_tags.c    | 51 +++++++++++++++++++++++++++++++++
 mm/kasan/sw_tags.c        | 41 ---------------------------
 mm/kasan/tags.c           | 59 +++++++++++++++++++++++++++++++++++++++
 7 files changed, 112 insertions(+), 113 deletions(-)
 create mode 100644 mm/kasan/report_tags.c
 create mode 100644 mm/kasan/tags.c

diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
index 9fe39a66388a..adcd9acaef61 100644
--- a/mm/kasan/Makefile
+++ b/mm/kasan/Makefile
@@ -37,5 +37,5 @@ CFLAGS_sw_tags.o := $(CC_FLAGS_KASAN_RUNTIME)
 
 obj-$(CONFIG_KASAN) := common.o report.o
 obj-$(CONFIG_KASAN_GENERIC) += init.o generic.o report_generic.o shadow.o quarantine.o
-obj-$(CONFIG_KASAN_HW_TAGS) += hw_tags.o report_hw_tags.o
-obj-$(CONFIG_KASAN_SW_TAGS) += init.o report_sw_tags.o shadow.o sw_tags.o
+obj-$(CONFIG_KASAN_HW_TAGS) += hw_tags.o report_hw_tags.o tags.o report_tags.o
+obj-$(CONFIG_KASAN_SW_TAGS) += init.o report_sw_tags.o shadow.o sw_tags.o tags.o report_tags.o
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
index 42b2168755d6..5dbbbb930e7a 100644
--- a/mm/kasan/report_hw_tags.c
+++ b/mm/kasan/report_hw_tags.c
@@ -15,11 +15,6 @@
 
 #include "kasan.h"
 
-const char *kasan_get_bug_type(struct kasan_access_info *info)
-{
-	return "invalid-access";
-}
-
 void *kasan_find_first_bad_addr(void *addr, size_t size)
 {
 	return kasan_reset_tag(addr);
diff --git a/mm/kasan/report_sw_tags.c b/mm/kasan/report_sw_tags.c
index 821a14a19a92..d2298c357834 100644
--- a/mm/kasan/report_sw_tags.c
+++ b/mm/kasan/report_sw_tags.c
@@ -29,49 +29,6 @@
 #include "kasan.h"
 #include "../slab.h"
 
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
-
 void *kasan_find_first_bad_addr(void *addr, size_t size)
 {
 	u8 tag = get_tag(addr);
diff --git a/mm/kasan/report_tags.c b/mm/kasan/report_tags.c
new file mode 100644
index 000000000000..8a319fc16dab
--- /dev/null
+++ b/mm/kasan/report_tags.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd.
+ * Copyright (c) 2020 Google, Inc.
+ */
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
