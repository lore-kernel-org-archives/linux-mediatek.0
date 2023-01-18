Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA06C004D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WaDG+rrqxlJT/6GIGWHNWGiT1aQrPsWBNzoW/dbYNnM=; b=xrTCtU2V8XeE/+iefaEA9AcD8E
	WzxNl2hi4Cl5EvGi27DbaZku4RESzynL5cyrGFw1zZTwCbfIplqM7zSSkI6De23GIvwJIM9jsqSOZ
	enD486fTz3R0pW7pjfTudPfBqMiDPU5TFLqLEUumGypqFP9Hpt7KLX/9QBgZafl0iyFUa1xmxDt4z
	W4PwBxioaWRqVlPZ9yF6sokkyHUw2sPp4ywcRW+3DwvBaT6L4qVOfpqZHjBq7OfYv9s3QoegoHhzM
	9xpcV3B0faEZanSsq5mRfBC1t6NMGixihW56g2ozVhurUlGtfxsa2Sslhn0T17e8COVsutA4BnI84
	ZJ9dmI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI59J-000D2t-UO; Wed, 18 Jan 2023 09:54:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI59I-000D2Q-Ts; Wed, 18 Jan 2023 09:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=WaDG+rrqxlJT/6GIGWHNWGiT1aQrPsWBNzoW/dbYNnM=; b=k43/fKd11r7FPi7mC7YDMn7L5G
	+BvN41i2NVCzPIgeIbb89xtptM7kDc8TjHlkrAVzYy81Tm3CEAP7bGMrcOBwEji9OHIq5huFsbeMi
	9VTg6MWNvRommf+ch00KR/qp1LdhDi0oo3XWbiBQ2h1nRA9br5Npl/XdnjIuvMa4b5DvNM5ONo0jl
	ooj03WgkQ3apa/UCBGeECsHsXcgt1DYYg2AGb1jnMsnt8dsvFFy/2dCbdGxCydWfNFeO9XsJxXcjH
	0+MppmSefathe5GrJMSq+gkcIlj0a9G2cQKRJc3I2L+fgS6IvDZe6ImV8erg4wjod7MnfbpJ+cMkG
	WXnFKbxg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI59Q-00AYO7-WF; Wed, 18 Jan 2023 09:54:40 +0000
X-UUID: efb136fc971311edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WaDG+rrqxlJT/6GIGWHNWGiT1aQrPsWBNzoW/dbYNnM=;
	b=V8eIWzGwUm3H3qqhVEsZDmJB+fBOvydGVPyVJrVUyXF7+fnAFH8F0U84AmMsTqCt3u81Cdj2I7KV+YxTbqLNn6bUX1wWF3yjr41Ld1o9RmNKa/TiL4ySSLQh05BjDfVOy6+ZhXio0+Njmg5yMzHXEInFK6SwXn/BqDJmMHit1fk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:96488671-7f99-4e40-acc7-fb014ad925b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.18,REQID:96488671-7f99-4e40-acc7-fb014ad925b8,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b,CLOUDID:7fd90055-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230118173901PP2WWLL9,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0
X-UUID: efb136fc971311edbbe3f76fe852e059-20230118
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1680895235; Wed, 18 Jan 2023 02:38:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 17:38:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 17:38:57 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
	<dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <chinwen.chang@mediatek.com>, <qun-wei.lin@mediatek.com>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <kasan-dev@googlegroups.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] kasan: infer the requested size by scanning shadow memory
Date: Wed, 18 Jan 2023 17:38:30 +0800
Message-ID: <20230118093832.1945-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_095437_690301_DDC3B5D8 
X-CRM114-Status: GOOD (  19.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We scan the shadow memory to infer the requested size instead of
printing cache->object_size directly.

This patch will fix the confusing kasan slab-out-of-bounds
report like below. [1]
Report shows "cache kmalloc-192 of size 192", but user
actually kmalloc(184).

==================================================================
BUG: KASAN: slab-out-of-bounds in _find_next_bit+0x143/0x160 lib/find_bit.c:109
Read of size 8 at addr ffff8880175766b8 by task kworker/1:1/26
...
The buggy address belongs to the object at ffff888017576600
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 184 bytes inside of
 192-byte region [ffff888017576600, ffff8880175766c0)
...
Memory state around the buggy address:
 ffff888017576580: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
 ffff888017576600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888017576680: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
                                        ^
 ffff888017576700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888017576780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================

After this patch, slab-out-of-bounds report will show as below.
==================================================================
...
The buggy address belongs to the object at ffff888017576600
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 0 bytes right of
 allocated 184-byte region [ffff888017576600, ffff8880175766b8)
...
==================================================================

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216457 [1]

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
V1 -> V2:
 - Implement getting allocated size of object for tag-based kasan.
 - Refine the kasan report.
 - Check if it is slab-out-of-bounds report type.
 - Thanks for Andrey and Dmitry suggestion.

 mm/kasan/kasan.h          |  2 ++
 mm/kasan/report.c         | 20 +++++++++++++-------
 mm/kasan/report_generic.c | 24 ++++++++++++++++++++++++
 mm/kasan/report_hw_tags.c | 18 ++++++++++++++++++
 mm/kasan/report_sw_tags.c | 17 +++++++++++++++++
 mm/kasan/report_tags.c    |  8 ++++++++
 6 files changed, 82 insertions(+), 7 deletions(-)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index abbcc1b0eec5..15ffd46fec6a 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -185,6 +185,7 @@ struct kasan_report_info {
 	const char *bug_type;
 	struct kasan_track alloc_track;
 	struct kasan_track free_track;
+	int obj_size;
 };
 
 /* Do not change the struct layout: compiler ABI. */
@@ -306,6 +307,7 @@ static inline bool addr_has_metadata(const void *addr)
 void *kasan_find_first_bad_addr(void *addr, size_t size);
 void kasan_complete_mode_report_info(struct kasan_report_info *info);
 void kasan_metadata_fetch_row(char *buffer, void *row);
+int kasan_get_alloc_size(void *object_addr, struct kmem_cache *cache);
 
 #if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
 void kasan_print_tags(u8 addr_tag, const void *addr);
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index df3602062bfd..dae0d4ae8fe9 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -210,12 +210,13 @@ static inline struct page *addr_to_page(const void *addr)
 }
 
 static void describe_object_addr(const void *addr, struct kmem_cache *cache,
-				 void *object)
+				 void *object, int obj_size, const char *bug_type)
 {
 	unsigned long access_addr = (unsigned long)addr;
 	unsigned long object_addr = (unsigned long)object;
 	const char *rel_type;
 	int rel_bytes;
+	bool slab_oob = false;
 
 	pr_err("The buggy address belongs to the object at %px\n"
 	       " which belongs to the cache %s of size %d\n",
@@ -224,18 +225,22 @@ static void describe_object_addr(const void *addr, struct kmem_cache *cache,
 	if (access_addr < object_addr) {
 		rel_type = "to the left";
 		rel_bytes = object_addr - access_addr;
-	} else if (access_addr >= object_addr + cache->object_size) {
+	} else if (access_addr >= object_addr + obj_size) {
 		rel_type = "to the right";
-		rel_bytes = access_addr - (object_addr + cache->object_size);
+		rel_bytes = access_addr - (object_addr + obj_size);
 	} else {
 		rel_type = "inside";
 		rel_bytes = access_addr - object_addr;
 	}
 
+	if (strcmp(bug_type, "slab-out-of-bounds") == 0)
+		slab_oob = true;
+
 	pr_err("The buggy address is located %d bytes %s of\n"
-	       " %d-byte region [%px, %px)\n",
-		rel_bytes, rel_type, cache->object_size, (void *)object_addr,
-		(void *)(object_addr + cache->object_size));
+	       " %s%d-byte region [%px, %px)\n",
+	       rel_bytes, rel_type, slab_oob ? "allocated " : "",
+	       obj_size, (void *)object_addr,
+	       (void *)(object_addr + obj_size));
 }
 
 static void describe_object_stacks(struct kasan_report_info *info)
@@ -257,7 +262,8 @@ static void describe_object(const void *addr, struct kasan_report_info *info)
 {
 	if (kasan_stack_collection_enabled())
 		describe_object_stacks(info);
-	describe_object_addr(addr, info->cache, info->object);
+	describe_object_addr(addr, info->cache, info->object, info->obj_size,
+			info->bug_type);
 }
 
 static inline bool kernel_or_module_addr(const void *addr)
diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
index 043c94b04605..7b4bec9e6d1a 100644
--- a/mm/kasan/report_generic.c
+++ b/mm/kasan/report_generic.c
@@ -43,6 +43,25 @@ void *kasan_find_first_bad_addr(void *addr, size_t size)
 	return p;
 }
 
+int kasan_get_alloc_size(void *addr, struct kmem_cache *cache)
+{
+	int size = 0;
+	u8 *shadow;
+
+	shadow = (u8 *)kasan_mem_to_shadow(addr);
+	while (size < cache->object_size) {
+		if (*shadow == 0)
+			size += KASAN_GRANULE_SIZE;
+		else if (*shadow >= 1 && *shadow <= KASAN_GRANULE_SIZE - 1)
+			size += *shadow;
+		else
+			return size;
+		shadow++;
+	}
+
+	return cache->object_size;
+}
+
 static const char *get_shadow_bug_type(struct kasan_report_info *info)
 {
 	const char *bug_type = "unknown-crash";
@@ -149,6 +168,11 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
 		memcpy(&info->free_track, &free_meta->free_track,
 		       sizeof(info->free_track));
 	}
+
+	if (strcmp(info->bug_type, "slab-out-of-bounds") == 0)
+		info->obj_size = kasan_get_alloc_size(info->object, info->cache);
+	else
+		info->obj_size = info->cache->object_size;
 }
 
 void kasan_metadata_fetch_row(char *buffer, void *row)
diff --git a/mm/kasan/report_hw_tags.c b/mm/kasan/report_hw_tags.c
index f3d3be614e4b..e462dd750fe2 100644
--- a/mm/kasan/report_hw_tags.c
+++ b/mm/kasan/report_hw_tags.c
@@ -21,6 +21,24 @@ void *kasan_find_first_bad_addr(void *addr, size_t size)
 	return kasan_reset_tag(addr);
 }
 
+int kasan_get_alloc_size(void *addr, struct kmem_cache *cache)
+{
+	int size = 0, i = 0;
+	u8 memory_tag;
+
+	while (size < cache->object_size) {
+		memory_tag = hw_get_mem_tag(addr + i * KASAN_GRANULE_SIZE);
+
+		if (memory_tag != KASAN_TAG_INVALID)
+			size += KASAN_GRANULE_SIZE;
+		else
+			return size;
+		i++;
+	}
+
+	return cache->object_size;
+}
+
 void kasan_metadata_fetch_row(char *buffer, void *row)
 {
 	int i;
diff --git a/mm/kasan/report_sw_tags.c b/mm/kasan/report_sw_tags.c
index 7a26397297ed..d50caefd7fd5 100644
--- a/mm/kasan/report_sw_tags.c
+++ b/mm/kasan/report_sw_tags.c
@@ -45,6 +45,23 @@ void *kasan_find_first_bad_addr(void *addr, size_t size)
 	return p;
 }
 
+int kasan_get_alloc_size(void *addr, struct kmem_cache *cache)
+{
+	int size = 0;
+	u8 *shadow;
+
+	shadow = (u8 *)kasan_mem_to_shadow(addr);
+	while (size < cache->object_size) {
+		if (*shadow != KASAN_TAG_INVALID)
+			size += KASAN_GRANULE_SIZE;
+		else
+			return size;
+		shadow++;
+	}
+
+	return cache->object_size;
+}
+
 void kasan_metadata_fetch_row(char *buffer, void *row)
 {
 	memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
diff --git a/mm/kasan/report_tags.c b/mm/kasan/report_tags.c
index ecede06ef374..b349a0ae1b83 100644
--- a/mm/kasan/report_tags.c
+++ b/mm/kasan/report_tags.c
@@ -7,6 +7,7 @@
 #include <linux/atomic.h>
 
 #include "kasan.h"
+#include "../slab.h"
 
 extern struct kasan_stack_ring stack_ring;
 
@@ -113,4 +114,11 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
 	/* Assign the common bug type if no entries were found. */
 	if (!info->bug_type)
 		info->bug_type = get_common_bug_type(info);
+
+	if (info->object && info->cache) {
+		if (strcmp(info->bug_type, "slab-out-of-bounds") == 0)
+			info->obj_size = kasan_get_alloc_size(info->object, info->cache);
+		else
+			info->obj_size = info->cache->object_size;
+	}
 }
-- 
2.18.0


