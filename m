Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A57C53210
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 07:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NZ9NhCNssNEj8jHwgbBdhsDJ/+YeWKw4bYC90Z9LVjk=; b=N2RbiXlws+p41d/z9Py7E6158R
	j7JrS3qby43F8OLeU3ZBkWtPlTE7ctQoWMomPr9SIcQwO8bokyBtA0PVuKfWrSZCcj4yz5F/XJLWQ
	xWSa/tPZi5Sth6iwX81loRdR6AUFRaRsK4fPcNmp2OoJ4EI8p9DtQGz7zubSnG3gfrsano+EcZUCc
	z+P3PLFtsoI6DInHcE+xZj8BWIgCm/ESMZNQjPWRxJxNMZubz438aSFTLqIpyWpde2vE1uREtEH6r
	rYVTdi+hs8QI4DGU+g1ZU9XqGyfubvEz+wW9M4eH5jkzgOd1XcFrDm30CnsVQ58uYvs98gjJUdVzW
	Q3a71ZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcAw-0000dq-8A; Tue, 03 Jan 2023 07:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCcAa-0000Ua-W8; Tue, 03 Jan 2023 07:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NZ9NhCNssNEj8jHwgbBdhsDJ/+YeWKw4bYC90Z9LVjk=; b=LDBpjSjEz4hozGTBhx4VYlNhpM
	hWyYMIfBDnwbyGLKH/hZDkc9MfkRDPbX8fF3x2MJtnXSCIniwI587EoqBq50XkE2I29WbyAjYF+hX
	aSsoj5EYD0+8+sivTv8amJtfJ+LReYHwTD1I50HLS2pGC9sthJXvIixjUAd4gOjceqeZSwCGxX3og
	qhdEyoWSI76iwvcxV4+0uHizZPWXR4ibjCFOWO8x5rjpJgRbThdkM3YM8rj2oCG4sXduvieLpXPta
	vE6ZOLse5dWdQvoSVRU0nFusTyDCfx9THxGSTTN+PFEi6MLOZIbGiz1KRmJrE02mvCNgtAjh07ha5
	ystoOqPw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCcAN-000X8N-2h;
	Tue, 03 Jan 2023 07:57:06 +0000
X-UUID: d6b2201e69d447cda0eca82cc9643180-20230103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NZ9NhCNssNEj8jHwgbBdhsDJ/+YeWKw4bYC90Z9LVjk=;
	b=nR+3dsVKmbCAehJGYivb98X9J3AJZcILW7qt46EDi1sdadR8Lz1yW3Ud+EMun+f4MSMpb6siI89X6f3VLiLZ2INahYO18CfCTVZla7dWIqc/c5VJmClEsltdKAPFFt/mJUdig4q4beRKbolNSB/dotPG5yxbACkhltTu216nJtU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:949d3e2a-e1ea-486b-9078-8df6da0d89d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:d1b9a3f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: d6b2201e69d447cda0eca82cc9643180-20230103
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1420441518; Tue, 03 Jan 2023 00:56:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 3 Jan 2023 15:56:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 3 Jan 2023 15:56:18 +0800
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
Subject: [PATCH] kasan: infer the requested size by scanning shadow memory
Date: Tue, 3 Jan 2023 15:55:58 +0800
Message-ID: <20230103075603.12294-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_075701_883920_68841FCA 
X-CRM114-Status: GOOD (  17.06  )
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

This patch will fix the confusing generic kasan report like below. [1]
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

After this patch, report will show "cache kmalloc-192 of size 184".

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216457 [1]

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 mm/kasan/kasan.h          |  5 +++++
 mm/kasan/report.c         |  3 ++-
 mm/kasan/report_generic.c | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 32413f22aa82..7bb627d21580 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -340,8 +340,13 @@ static inline void kasan_print_address_stack_frame(const void *addr) { }
 
 #ifdef CONFIG_KASAN_GENERIC
 void kasan_print_aux_stacks(struct kmem_cache *cache, const void *object);
+int kasan_get_alloc_size(void *object_addr, struct kmem_cache *cache);
 #else
 static inline void kasan_print_aux_stacks(struct kmem_cache *cache, const void *object) { }
+static inline int kasan_get_alloc_size(void *object_addr, struct kmem_cache *cache)
+{
+	return cache->object_size;
+}
 #endif
 
 bool kasan_report(unsigned long addr, size_t size,
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 1d02757e90a3..6de454bb2cad 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -236,12 +236,13 @@ static void describe_object_addr(const void *addr, struct kmem_cache *cache,
 {
 	unsigned long access_addr = (unsigned long)addr;
 	unsigned long object_addr = (unsigned long)object;
+	int real_size = kasan_get_alloc_size((void *)object_addr, cache);
 	const char *rel_type;
 	int rel_bytes;
 
 	pr_err("The buggy address belongs to the object at %px\n"
 	       " which belongs to the cache %s of size %d\n",
-		object, cache->name, cache->object_size);
+		object, cache->name, real_size);
 
 	if (access_addr < object_addr) {
 		rel_type = "to the left";
diff --git a/mm/kasan/report_generic.c b/mm/kasan/report_generic.c
index 043c94b04605..01b38e459352 100644
--- a/mm/kasan/report_generic.c
+++ b/mm/kasan/report_generic.c
@@ -43,6 +43,24 @@ void *kasan_find_first_bad_addr(void *addr, size_t size)
 	return p;
 }
 
+int kasan_get_alloc_size(void *addr, struct kmem_cache *cache)
+{
+	int size = 0;
+	u8 *shadow = (u8 *)kasan_mem_to_shadow(addr);
+
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
-- 
2.18.0


