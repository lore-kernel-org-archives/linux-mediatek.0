Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185E8C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 06:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B3820787
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 06:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CIhRC39i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nHwFdGhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94B3820787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vOdJUHa9IShkakgvsndOaJCpke/gwlBvA78fwPsH8PA=; b=CIhRC39i0GLQW3
	HeG+TpdHE0pgdVEPGutrC5FubivDUtb5STdh0djgLu2lVIa+vta8h8td0F7x8iM9qww8+Orp2K7ic
	cnS+9Y7zaUIifi70QmYLCRiiiT8kA2CWcFAEcmOh9vij5VazXJeu8rtRgABfWB6tCJX7D7AycUi1/
	/aAKuVkfRDmzR79pLisjt8theIK4LPf9VcKaltN3r6c+A+JgcTvbFNXt4OLoLY+UWeFsFfGNP7746
	qQmDuCrdHZLeNu0yJ5DQrz0TX4OwW4P+fPnEQuZOqj4h7F5J7I3NtPT9Lars+f4qVVIvSVc+sV0b7
	WEchjIc9QmwrUbtuH5HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaZPW-0001Lk-Lp; Mon, 18 May 2020 06:38:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaZP7-0000vF-WC; Mon, 18 May 2020 06:37:39 +0000
X-UUID: aae2dafbf41b4629a01443b505cb754f-20200517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ISBcatq6mVn60qvM3IFa85BGa9k8Ralk+4f4AH+hBXM=; 
 b=nHwFdGhZOeP2uI3vKofQxDaPLR4DXBugFdRB/dWY0nvq/SZk6YlGgl04HRIxz4ZIhsqzP+V5EbKzPiTozrCPTRc+Ff0qvuFydhYYK/7uT+qcgzNBVneiHFI9tgpJS0T93MRHEMSLnhSIdCPOCd6h1oUylz430Gi1xln1srG6VbU=;
X-UUID: aae2dafbf41b4629a01443b505cb754f-20200517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1572015276; Sun, 17 May 2020 22:37:13 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 May 2020 23:27:32 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 14:27:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 May 2020 14:27:30 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/4] kasan: record and print the free track
Date: Mon, 18 May 2020 14:27:30 +0800
Message-ID: <20200518062730.4665-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_233738_041702_239B7A34 
X-CRM114-Status: GOOD (  12.35  )
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

Move free track from slub alloc meta-data to slub free meta-data in
order to make struct kasan_free_meta size is 16 bytes. It is a good
size because it is the minimal redzone size and a good number of
alignment.

For free track in generic KASAN, we do the modification in struct
kasan_alloc_meta and kasan_free_meta:
- remove free track from kasan_alloc_meta.
- add free track into kasan_free_meta.

[1]https://bugzilla.kernel.org/show_bug.cgi?id=198437

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
---
 mm/kasan/common.c  | 33 ++++++++++-----------------------
 mm/kasan/generic.c | 18 ++++++++++++++++++
 mm/kasan/kasan.h   |  7 +++++++
 mm/kasan/report.c  | 20 --------------------
 mm/kasan/tags.c    | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 72 insertions(+), 43 deletions(-)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 8bc618289bb1..6500bc2bb70c 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -51,7 +51,7 @@ depot_stack_handle_t kasan_save_stack(gfp_t flags)
 	return stack_depot_save(entries, nr_entries, flags);
 }
 
-static inline void set_track(struct kasan_track *track, gfp_t flags)
+void kasan_set_track(struct kasan_track *track, gfp_t flags)
 {
 	track->pid = current->pid;
 	track->stack = kasan_save_stack(flags);
@@ -249,9 +249,7 @@ void kasan_cache_create(struct kmem_cache *cache, unsigned int *size,
 	*size += sizeof(struct kasan_alloc_meta);
 
 	/* Add free meta. */
-	if (IS_ENABLED(CONFIG_KASAN_GENERIC) &&
-	    (cache->flags & SLAB_TYPESAFE_BY_RCU || cache->ctor ||
-	     cache->object_size < sizeof(struct kasan_free_meta))) {
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
 		cache->kasan_info.free_meta_offset = *size;
 		*size += sizeof(struct kasan_free_meta);
 	}
@@ -299,24 +297,6 @@ struct kasan_free_meta *get_free_info(struct kmem_cache *cache,
 	return (void *)object + cache->kasan_info.free_meta_offset;
 }
 
-
-static void kasan_set_free_info(struct kmem_cache *cache,
-		void *object, u8 tag)
-{
-	struct kasan_alloc_meta *alloc_meta;
-	u8 idx = 0;
-
-	alloc_meta = get_alloc_info(cache, object);
-
-#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
-	idx = alloc_meta->free_track_idx;
-	alloc_meta->free_pointer_tag[idx] = tag;
-	alloc_meta->free_track_idx = (idx + 1) % KASAN_NR_FREE_STACKS;
-#endif
-
-	set_track(&alloc_meta->free_track[idx], GFP_NOWAIT);
-}
-
 void kasan_poison_slab(struct page *page)
 {
 	unsigned long i;
@@ -396,6 +376,13 @@ void * __must_check kasan_init_slab_obj(struct kmem_cache *cache,
 	alloc_info = get_alloc_info(cache, object);
 	__memset(alloc_info, 0, sizeof(*alloc_info));
 
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
+		struct kasan_free_meta *free_info;
+
+		free_info = get_free_info(cache, object);
+		__memset(free_info, 0, sizeof(*free_info));
+	}
+
 	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS))
 		object = set_tag(object,
 				assign_tag(cache, object, true, false));
@@ -492,7 +479,7 @@ static void *__kasan_kmalloc(struct kmem_cache *cache, const void *object,
 		KASAN_KMALLOC_REDZONE);
 
 	if (cache->flags & SLAB_KASAN)
-		set_track(&get_alloc_info(cache, object)->alloc_track, flags);
+		kasan_set_track(&get_alloc_info(cache, object)->alloc_track, flags);
 
 	return set_tag(object, tag);
 }
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 78d8e0a75a8a..988bc095b738 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -345,3 +345,21 @@ void kasan_record_aux_stack(void *addr)
 		alloc_info->rcu_stack[1] = alloc_info->rcu_stack[0];
 	alloc_info->rcu_stack[0] = kasan_save_stack(GFP_NOWAIT);
 }
+
+void kasan_set_free_info(struct kmem_cache *cache,
+				void *object, u8 tag)
+{
+	struct kasan_free_meta *free_meta;
+
+	free_meta = get_free_info(cache, object);
+	kasan_set_track(&free_meta->free_track, GFP_NOWAIT);
+}
+
+struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
+				void *object, u8 tag)
+{
+	struct kasan_free_meta *free_meta;
+
+	free_meta = get_free_info(cache, object);
+	return &free_meta->free_track;
+}
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 870c5dd07756..87ee3626b8b0 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -127,6 +127,9 @@ struct kasan_free_meta {
 	 * Otherwise it might be used for the allocator freelist.
 	 */
 	struct qlist_node quarantine_link;
+#ifdef CONFIG_KASAN_GENERIC
+	struct kasan_track free_track;
+#endif
 };
 
 struct kasan_alloc_meta *get_alloc_info(struct kmem_cache *cache,
@@ -168,6 +171,10 @@ void kasan_report_invalid_free(void *object, unsigned long ip);
 struct page *kasan_addr_to_page(const void *addr);
 
 depot_stack_handle_t kasan_save_stack(gfp_t flags);
+void kasan_set_track(struct kasan_track *track, gfp_t flags);
+void kasan_set_free_info(struct kmem_cache *cache, void *object, u8 tag);
+struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
+				void *object, u8 tag);
 
 #if defined(CONFIG_KASAN_GENERIC) && \
 	(defined(CONFIG_SLAB) || defined(CONFIG_SLUB))
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 5ee66cf7e27c..7e9f9f6d5e85 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -159,26 +159,6 @@ static void describe_object_addr(struct kmem_cache *cache, void *object,
 		(void *)(object_addr + cache->object_size));
 }
 
-static struct kasan_track *kasan_get_free_track(struct kmem_cache *cache,
-		void *object, u8 tag)
-{
-	struct kasan_alloc_meta *alloc_meta;
-	int i = 0;
-
-	alloc_meta = get_alloc_info(cache, object);
-
-#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
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
 #ifdef CONFIG_KASAN_GENERIC
 static void print_stack(depot_stack_handle_t stack)
 {
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index 25b7734e7013..201dee5d6ae0 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -162,3 +162,40 @@ void __hwasan_tag_memory(unsigned long addr, u8 tag, unsigned long size)
 	kasan_poison_shadow((void *)addr, size, tag);
 }
 EXPORT_SYMBOL(__hwasan_tag_memory);
+
+void kasan_set_free_info(struct kmem_cache *cache,
+				void *object, u8 tag)
+{
+	struct kasan_alloc_meta *alloc_meta;
+	u8 idx = 0;
+
+	alloc_meta = get_alloc_info(cache, object);
+
+#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
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
+	alloc_meta = get_alloc_info(cache, object);
+
+#ifdef CONFIG_KASAN_SW_TAGS_IDENTIFY
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
