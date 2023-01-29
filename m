Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD6AC38142
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jan 2023 02:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XhHmJ2XlHdSznR6d+1zWQZ89NMCKCkYujHZawrbnfto=; b=LbTG6K8nJafzIVfsSuOpRX+fGs
	Odbvn6f85X03gMSrp6WwwFTj6NpYersl3i83bkl0x3vVy4g8Z0Hf2CeIBFzmQr/Zml+IExoB2gSc2
	wk4g07ls84YrRSlGnjKS6GbptZFRamXvl4mP0sb5Pu+z3KXy63jREbeMs5EoAI4S/THpCfgISGbzS
	2UTA+t2XHdvnoLamTwUTMB0stbS8Ta/bEiLggkuywH1Kwe3wnAwrjx/g/FDRlAlbeShC1wlFP6iA2
	f8VjG1LuYUv9w1MHKTa9wQBI31peAP0xLnpX3j0YhPE8AwCr6J6HP9Q4zxIi5ueRDZvlyNdTVDEiA
	NKhaKc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLxFH-000t07-A7; Sun, 29 Jan 2023 02:16:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLxFF-000szl-Hy; Sun, 29 Jan 2023 02:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=XhHmJ2XlHdSznR6d+1zWQZ89NMCKCkYujHZawrbnfto=; b=LWR8z7cUFLD213yJ44G2W0UnV+
	cq79zRYIcKqfyNYni2pMYeH2ZotgzKi5zNgbeu1sClAKRuLn6D5G6Nh2Dmkf7IaZuIz/XUiYi1vxY
	mRbAEU3x1gk4aSFBhhNtXY6HmKTNgQY5WkN6XCLQwjjPeMm8cfOi9cUrCiFqKLhfoC/97fGEefxWG
	iI/Vev0Pmcov0KUDReZn/8tsrX2bLn09Zt3Ad1et1UBJ9fvo7cxfiQXF3LWfGLHqb9UymecP32SRE
	zT7J3O1j0/qoKVpMzGc89XLIzHnlKNtEfUkC4tpcRm6dNGKXGyaSv1z5EbjHm0Eq/jkPnQzyAhQs/
	gpEFvW0g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pLxEH-003PwX-0N;
	Sun, 29 Jan 2023 02:15:55 +0000
X-UUID: d7f0a39e9f7a11edbbe3f76fe852e059-20230128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XhHmJ2XlHdSznR6d+1zWQZ89NMCKCkYujHZawrbnfto=;
	b=nRPuXgax0T4hV98h/7Wjn2En6Oa6PkX2uqNvUe9zKCIp2q5rB5TZFmX8lkJLDNWgzcGaj66QkAD1GSJ4Y9YWt9JyDHb7m8m8ukvsr9m/3ohoDRchHI3jcKeWDpysU8wJjAIz3hSdBrh3iLPXsVjRHpEn8rYJWnryDVzmGtW6pvQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:2412d406-c2fa-4dc8-b212-8e815ab9df6d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:40a3caf6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: d7f0a39e9f7a11edbbe3f76fe852e059-20230128
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 669717645; Sat, 28 Jan 2023 19:15:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sun, 29 Jan 2023 10:15:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 29 Jan 2023 10:15:44 +0800
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
Subject: [PATCH v4] kasan: infer allocation size by scanning metadata
Date: Sun, 29 Jan 2023 10:14:35 +0800
Message-ID: <20230129021437.18812-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_021540_231523_F858191F 
X-CRM114-Status: GOOD (  29.72  )
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

Make KASAN scan metadata to infer the requested allocation size instead of
printing cache->object_size.

This patch fixes confusing slab-out-of-bounds reports as reported in:

https://bugzilla.kernel.org/show_bug.cgi?id=216457

As an example of the confusing behavior, the report below hints that the
allocation size was 192, while the kernel actually called kmalloc(184):

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

With this patch, the report shows:

==================================================================
...
The buggy address belongs to the object at ffff888017576600
 which belongs to the cache kmalloc-192 of size 192
The buggy address is located 0 bytes to the right of
 allocated 184-byte region [ffff888017576600, ffff8880175766b8)
...
==================================================================

Also report slab use-after-free bugs as "slab-use-after-free" and print
"freed" instead of "allocated" in the report when describing the accessed
memory region.

Also improve the metadata-related comment in kasan_find_first_bad_addr
and use addr_has_metadata across KASAN code instead of open-coding
KASAN_SHADOW_START checks.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216457
Co-developed-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

---

Changes v3->v4:

- Change the author

Changes v2->v3:

- Rename obj_size to alloc_size and change its type to size_t.
- Add comments into kasan_get_alloc_size.
- Infer and report alloc_size for all report types.
- Update metadata-related comment in kasan_find_first_bad_addr for HW_TAGS.
- Use addr_has_metadata for Generic and SW_TAGS modes instead of
  open-coding KASAN_SHADOW_START checks.
- Introduce slab-use-after-free report type.
- Print "freed" when describing memory region for slab-use-after-free bugs.
- Only print memory region state for Generic mode.

Changes v1->v2:

- Implement getting allocated size of object for tag-based kasan.
- Refine the kasan report.
- Check if it is slab-out-of-bounds report type.
- Thanks for Andrey and Dmitry suggestion.

---
 mm/kasan/generic.c        |  4 +---
 mm/kasan/kasan.h          |  2 ++
 mm/kasan/report.c         | 41 ++++++++++++++++++++++++++++-----------
 mm/kasan/report_generic.c | 32 +++++++++++++++++++++++++++++-
 mm/kasan/report_hw_tags.c | 35 ++++++++++++++++++++++++++++++++-
 mm/kasan/report_sw_tags.c | 26 +++++++++++++++++++++++++
 mm/kasan/report_tags.c    |  2 +-
 mm/kasan/sw_tags.c        |  6 ++----
 8 files changed, 127 insertions(+), 21 deletions(-)

diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index cb762982c8ba..e5eef670735e 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -172,10 +172,8 @@ static __always_inline bool check_region_inline(unsigned long addr,
 	if (unlikely(addr + size < addr))
 		return !kasan_report(addr, size, write, ret_ip);
 
-	if (unlikely((void *)addr <
-		kasan_shadow_to_mem((void *)KASAN_SHADOW_START))) {
+	if (unlikely(!addr_has_metadata((void *)addr)))
 		return !kasan_report(addr, size, write, ret_ip);
-	}
 
 	if (likely(!memory_is_poisoned(addr, size)))
 		return true;
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index dcc2a88e8121..3231314e071f 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -207,6 +207,7 @@ struct kasan_report_info {
 	void *first_bad_addr;
 	struct kmem_cache *cache;
 	void *object;
+	size_t alloc_size;
 
 	/* Filled in by the mode-specific reporting code. */
 	const char *bug_type;
@@ -323,6 +324,7 @@ static inline bool addr_has_metadata(const void *addr)
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
 
 void *kasan_find_first_bad_addr(void *addr, size_t size);
+size_t kasan_get_alloc_size(void *object, struct kmem_cache *cache);
 void kasan_complete_mode_report_info(struct kasan_report_info *info);
 void kasan_metadata_fetch_row(char *buffer, void *row);
 
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 22598b20c7b7..e0492124e90a 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -231,33 +231,46 @@ static inline struct page *addr_to_page(const void *addr)
 	return NULL;
 }
 
-static void describe_object_addr(const void *addr, struct kmem_cache *cache,
-				 void *object)
+static void describe_object_addr(const void *addr, struct kasan_report_info *info)
 {
 	unsigned long access_addr = (unsigned long)addr;
-	unsigned long object_addr = (unsigned long)object;
-	const char *rel_type;
+	unsigned long object_addr = (unsigned long)info->object;
+	const char *rel_type, *region_state = "";
 	int rel_bytes;
 
 	pr_err("The buggy address belongs to the object at %px\n"
 	       " which belongs to the cache %s of size %d\n",
-		object, cache->name, cache->object_size);
+		info->object, info->cache->name, info->cache->object_size);
 
 	if (access_addr < object_addr) {
 		rel_type = "to the left";
 		rel_bytes = object_addr - access_addr;
-	} else if (access_addr >= object_addr + cache->object_size) {
+	} else if (access_addr >= object_addr + info->alloc_size) {
 		rel_type = "to the right";
-		rel_bytes = access_addr - (object_addr + cache->object_size);
+		rel_bytes = access_addr - (object_addr + info->alloc_size);
 	} else {
 		rel_type = "inside";
 		rel_bytes = access_addr - object_addr;
 	}
 
+	/*
+	 * Tag-Based modes use the stack ring to infer the bug type, but the
+	 * memory region state description is generated based on the metadata.
+	 * Thus, defining the region state as below can contradict the metadata.
+	 * Fixing this requires further improvements, so only infer the state
+	 * for the Generic mode.
+	 */
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
+		if (strcmp(info->bug_type, "slab-out-of-bounds") == 0)
+			region_state = "allocated ";
+		else if (strcmp(info->bug_type, "slab-use-after-free") == 0)
+			region_state = "freed ";
+	}
+
 	pr_err("The buggy address is located %d bytes %s of\n"
-	       " %d-byte region [%px, %px)\n",
-		rel_bytes, rel_type, cache->object_size, (void *)object_addr,
-		(void *)(object_addr + cache->object_size));
+	       " %s%lu-byte region [%px, %px)\n",
+	       rel_bytes, rel_type, region_state, info->alloc_size,
+	       (void *)object_addr, (void *)(object_addr + info->alloc_size));
 }
 
 static void describe_object_stacks(struct kasan_report_info *info)
@@ -279,7 +292,7 @@ static void describe_object(const void *addr, struct kasan_report_info *info)
 {
 	if (kasan_stack_collection_enabled())
 		describe_object_stacks(info);
-	describe_object_addr(addr, info->cache, info->object);
+	describe_object_addr(addr, info);
 }
 
 static inline bool kernel_or_module_addr(const void *addr)
@@ -436,6 +449,12 @@ static void complete_report_info(struct kasan_report_info *info)
 	if (slab) {
 		info->cache = slab->slab_cache;
 		info->object = nearest_obj(info->cache, slab, addr);
+
+		/* Try to determine allocation size based on the metadata. */
+		info->alloc_size = kasan_get_alloc_size(info->object, info->cache);
+		/* Fallback to the object size if failed. */
+		if (!info->alloc_size)
+			info->alloc_size = info->cache->object_size;
 	} else
 		info->cache = info->object = NULL;
 
diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
index 043c94b04605..87d39bc0a673 100644
--- a/mm/kasan/report_generic.c
+++ b/mm/kasan/report_generic.c
@@ -43,6 +43,34 @@ void *kasan_find_first_bad_addr(void *addr, size_t size)
 	return p;
 }
 
+size_t kasan_get_alloc_size(void *object, struct kmem_cache *cache)
+{
+	size_t size = 0;
+	u8 *shadow;
+
+	/*
+	 * Skip the addr_has_metadata check, as this function only operates on
+	 * slab memory, which must have metadata.
+	 */
+
+	/*
+	 * The loop below returns 0 for freed objects, for which KASAN cannot
+	 * calculate the allocation size based on the metadata.
+	 */
+	shadow = (u8 *)kasan_mem_to_shadow(object);
+	while (size < cache->object_size) {
+		if (*shadow == 0)
+			size += KASAN_GRANULE_SIZE;
+		else if (*shadow >= 1 && *shadow <= KASAN_GRANULE_SIZE - 1)
+			return size + *shadow;
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
@@ -79,9 +107,11 @@ static const char *get_shadow_bug_type(struct kasan_report_info *info)
 		bug_type = "stack-out-of-bounds";
 		break;
 	case KASAN_PAGE_FREE:
+		bug_type = "use-after-free";
+		break;
 	case KASAN_SLAB_FREE:
 	case KASAN_SLAB_FREETRACK:
-		bug_type = "use-after-free";
+		bug_type = "slab-use-after-free";
 		break;
 	case KASAN_ALLOCA_LEFT:
 	case KASAN_ALLOCA_RIGHT:
diff --git a/mm/kasan/report_hw_tags.c b/mm/kasan/report_hw_tags.c
index f3d3be614e4b..32e80f78de7d 100644
--- a/mm/kasan/report_hw_tags.c
+++ b/mm/kasan/report_hw_tags.c
@@ -17,10 +17,43 @@
 
 void *kasan_find_first_bad_addr(void *addr, size_t size)
 {
-	/* Return the same value regardless of whether addr_has_metadata(). */
+	/*
+	 * Hardware Tag-Based KASAN only calls this function for normal memory
+	 * accesses, and thus addr points precisely to the first bad address
+	 * with an invalid (and present) memory tag. Therefore:
+	 * 1. Return the address as is without walking memory tags.
+	 * 2. Skip the addr_has_metadata check.
+	 */
 	return kasan_reset_tag(addr);
 }
 
+size_t kasan_get_alloc_size(void *object, struct kmem_cache *cache)
+{
+	size_t size = 0;
+	int i = 0;
+	u8 memory_tag;
+
+	/*
+	 * Skip the addr_has_metadata check, as this function only operates on
+	 * slab memory, which must have metadata.
+	 */
+
+	/*
+	 * The loop below returns 0 for freed objects, for which KASAN cannot
+	 * calculate the allocation size based on the metadata.
+	 */
+	while (size < cache->object_size) {
+		memory_tag = hw_get_mem_tag(object + i * KASAN_GRANULE_SIZE);
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
index 7a26397297ed..8b1f5a73ee6d 100644
--- a/mm/kasan/report_sw_tags.c
+++ b/mm/kasan/report_sw_tags.c
@@ -45,6 +45,32 @@ void *kasan_find_first_bad_addr(void *addr, size_t size)
 	return p;
 }
 
+size_t kasan_get_alloc_size(void *object, struct kmem_cache *cache)
+{
+	size_t size = 0;
+	u8 *shadow;
+
+	/*
+	 * Skip the addr_has_metadata check, as this function only operates on
+	 * slab memory, which must have metadata.
+	 */
+
+	/*
+	 * The loop below returns 0 for freed objects, for which KASAN cannot
+	 * calculate the allocation size based on the metadata.
+	 */
+	shadow = (u8 *)kasan_mem_to_shadow(object);
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
index ecede06ef374..8b8bfdb3cfdb 100644
--- a/mm/kasan/report_tags.c
+++ b/mm/kasan/report_tags.c
@@ -89,7 +89,7 @@ void kasan_complete_mode_report_info(struct kasan_report_info *info)
 			 * a use-after-free.
 			 */
 			if (!info->bug_type)
-				info->bug_type = "use-after-free";
+				info->bug_type = "slab-use-after-free";
 		} else {
 			/* Second alloc of the same object. Give up. */
 			if (alloc_found)
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index a3afaf2ad1b1..30da65fa02a1 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -106,10 +106,8 @@ bool kasan_check_range(unsigned long addr, size_t size, bool write,
 		return true;
 
 	untagged_addr = kasan_reset_tag((const void *)addr);
-	if (unlikely(untagged_addr <
-			kasan_shadow_to_mem((void *)KASAN_SHADOW_START))) {
+	if (unlikely(!addr_has_metadata(untagged_addr)))
 		return !kasan_report(addr, size, write, ret_ip);
-	}
 	shadow_first = kasan_mem_to_shadow(untagged_addr);
 	shadow_last = kasan_mem_to_shadow(untagged_addr + size - 1);
 	for (shadow = shadow_first; shadow <= shadow_last; shadow++) {
@@ -127,7 +125,7 @@ bool kasan_byte_accessible(const void *addr)
 	void *untagged_addr = kasan_reset_tag(addr);
 	u8 shadow_byte;
 
-	if (untagged_addr < kasan_shadow_to_mem((void *)KASAN_SHADOW_START))
+	if (!addr_has_metadata(untagged_addr))
 		return false;
 
 	shadow_byte = READ_ONCE(*(u8 *)kasan_mem_to_shadow(untagged_addr));
-- 
2.18.0


