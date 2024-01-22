Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32F7C47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 02:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bRxKAlBcxk+wjGn9fgIoumEgOFMc9m85oqcebArTOQs=; b=RYsR09xuzb0jZV3d8PyhO88ulT
	ykV9aCQSXLdlUb8Jsx2sy0k4vLiPdhAisE3cq06f4+Wjw/mNjKsMCoZmCKD1df2LF/eM9quxYPa1j
	AnxV/irL/2DrvU9fxULd9Sun+mg3Jpn3BOS2b5cnP6sPzBKw5n95Sy202bAGPCxR5QdE1EBD9tIPe
	0mTItKWrhskb/lYp9LbUNnb6YjEMTZbEV+j3RZKXKQQeIafiCs4zp8YHT/uJyMRpYl1A/yNIDCyBk
	unp3sGM3nbLuBjlWfD+QoBdkwK8X8jPzzh5IazunqXvSWjjXSjfwBYSWwaUHt2jagK5QPbZsikPP5
	dTEjltjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRjz4-00AO2a-2S;
	Mon, 22 Jan 2024 02:24:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRjyx-00ANz0-24;
	Mon, 22 Jan 2024 02:24:20 +0000
X-UUID: 4a9ed728b8cd11eea0bf134e88e6c2dc-20240121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bRxKAlBcxk+wjGn9fgIoumEgOFMc9m85oqcebArTOQs=;
	b=Ogz9f/WnjJkKND+iWq8RxdlEuTaMO/8DZT2p/bxdhTQawN9iZUfIPI7Rtl+KO1Ea+oyyJzZ1liRc0J35skL0Fm0ewaq6T5bqpdWGO6vNXO/7VaxA+1m3qPOci+Fo8pwhYZr8FIf1tkYunr8Uj9oPF+iwbaZK9OI1X9pO3x0D/1A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:de4f1cd2-eb01-4fa6-bdcc-7f60d74f2762,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6e16cf4,CLOUDID:32d51883-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4a9ed728b8cd11eea0bf134e88e6c2dc-20240121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <haiqiang.gong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1359334817; Sun, 21 Jan 2024 19:23:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 22 Jan 2024 10:23:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 22 Jan 2024 10:23:20 +0800
From: Haiqiang Gong <Haiqiang.Gong@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <haiqiang.gong@mediatek.com>, <mike.zhang@mediatek.com>, Andrew Morton
	<akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Haiqiang Gong
	<Haiqiang.Gong@mediatek.com>
Subject: [PATCH] mm/compaction: add check mechanism to avoid cma alloc fail
Date: Mon, 22 Jan 2024 10:23:17 +0800
Message-ID: <20240122022317.30091-1-Haiqiang.Gong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.251100-8.000000
X-TMASE-MatchedRID: riRbj5ZX+8qJ+w2BcN2shkZakoam9+aeKFFZAe4nyZ6M2ehTV+imi/+i
	UQ058Mu6pSxgXQCmVD5G77nj4gxZpFXkr5xNB8EcyeVujmXuYYUzTWEsGiZW/N9RlPzeVuQQMSu
	S6JxBG64Cym2hDB78TgykqSdZGSoeZMLMXtQ7bzGJLx4p0P/u5AYX4TqbN42omyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1ropAi/FV10xvOMKV9GJxgt1zlJ6cDFtyq0Ik/XvnkHxi4XnZ0i355d/T4
	9kdKys+
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.251100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: AC853335170166E5CE942A0222C21DE05826A344C137900CD90F48576EEBCC162000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_182415_710339_B3E2131B 
X-CRM114-Status: GOOD (  15.47  )
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

cma alloc may fail when we doing cma alloc/free test on kernel 5.10/5.15.

We found that the next memory cannot be migrated because of the alloc of
fs as next backtrace:
__alloc_pages_nodemask
pagecache_get_page
grow_dev_page
__getblk_gfp
ext4_sb_breadahead_unmovable
__ext4_get_inode_loc
__ext4_iget
ext4_lookup
__lookup_slow
walk_component
path_lookupat
filename_lookup
vfs_statx
This kind of unmovable memory is not placed in the cma buffer when kernel
memory alloc but is migrated in by kcompactd when the kernel migration.
It will cause memory can't be migrate when cma alloc.

Add check mechanism in the compaction_alloc() where kcompaced alloc for
memory. Will return NULL and give up this memory migration if the
allocated memory is in the cma buffer and the memory is unmovable.

Signed-off-by: Haiqiang Gong <Haiqiang.Gong@mediatek.com>
---
 mm/compaction.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index 27ada42924d5..29c0661adc22 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -25,6 +25,11 @@
 #include <linux/psi.h>
 #include "internal.h"
 
+#ifdef CONFIG_CMA
+#include <linux/cma.h>
+#include "cma.h"
+#endif
+
 #ifdef CONFIG_COMPACTION
 /*
  * Fragmentation score check interval for proactive compaction purposes.
@@ -1758,6 +1763,33 @@ static void isolate_freepages(struct compact_control *cc)
 	split_map_pages(freelist);
 }
 
+#ifdef CONFIG_CMA
+static bool is_in_cma_range(struct folio *folio)
+{
+	int i;
+	unsigned long pfn = 0;
+	struct page *page = folio_page(folio, 0);
+
+	pfn = page_to_pfn(page);
+	for (i = 0; i < cma_area_count; i++) {
+		struct cma *cma = &cma_areas[i];
+
+		if (cma->base_pfn <= pfn && (cma->base_pfn + cma->count) > pfn)
+			return true;
+	}
+
+	return false;
+}
+
+static bool forbid_move_to_cma_range(struct folio *src, struct folio *dst)
+{
+	if (folio_mapping(src) && is_in_cma_range(dst))
+		return true;
+
+	return false;
+}
+#endif
+
 /*
  * This is a migrate-callback that "allocates" freepages by taking pages
  * from the isolated freelists in the block we are migrating to.
@@ -1775,6 +1807,12 @@ static struct folio *compaction_alloc(struct folio *src, unsigned long data)
 	}
 
 	dst = list_entry(cc->freepages.next, struct folio, lru);
+#ifdef CONFIG_CMA
+	if (forbid_move_to_cma_range(src, dst)) {
+		pr_notice("kcompactd: could not move non-cma memory to cma buffer\n");
+		return NULL;
+	}
+#endif
 	list_del(&dst->lru);
 	cc->nr_freepages--;
 
-- 
2.25.1


