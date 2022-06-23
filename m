Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E794C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 11:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sm76w41pAm8PnOIyccnGOO5LV1X4Kpl21+W+/cD3KqE=; b=ekJ6Nncs0JQVqwbBDfqXmfugxB
	hQxR+GpYuFq4Te15zCEUqoc86Uf1OkURzEmOUyzSXYuqha8d9jdWNsVSQ50gd3z4J8tboKpQnogaO
	LfwAd51rO7hL+8m1dOjRDQiwHNyUicExKmG0lAQ46jJzNR1UNBkdb9qqpWCFmZcfeigtUMNnZcLs4
	kuMsr02BR6oHx73PREYfPKeRNVaAxz2ZQha/BkIHzF5dt658p0/Mte+jg44Yi8MCDJDr7SSLRBdo7
	+omGm305zU9SMc+BjF8RteiyzufCuG8JZu3ilnEzaPKKLnTGbt/lGJ+yBMDJ3cpFtjI++k5p88BU0
	JhNJ5F2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kve-00EhSM-73; Thu, 23 Jun 2022 11:23:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Kvb-00EhQW-QU; Thu, 23 Jun 2022 11:23:17 +0000
X-UUID: d2946e6c663d40baad0a61ca4e0d7e0a-20220623
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:3da2f226-3a40-4bdf-84b2-3b7732b717a5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:0c5254ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d2946e6c663d40baad0a61ca4e0d7e0a-20220623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yee.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1758445860; Thu, 23 Jun 2022 04:23:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jun 2022 04:19:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 23 Jun 2022 19:19:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 23 Jun 2022 19:19:54 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Yee Lee <yee.lee@mediatek.com>, Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, "open list:KFENCE" <kasan-dev@googlegroups.com>,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support"
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] mm: kfence: skip kmemleak alloc in kfence_pool
Date: Thu, 23 Jun 2022 19:19:35 +0800
Message-ID: <20220623111937.6491-2-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220623111937.6491-1-yee.lee@mediatek.com>
References: <20220623111937.6491-1-yee.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_042315_909857_FD9CA06D 
X-CRM114-Status: GOOD (  12.19  )
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

From: Yee Lee <yee.lee@mediatek.com>

Use MEMBLOCK_ALLOC_NOLEAKTRACE to skip kmemleak registration when
the kfence pool is allocated from memblock. And the kmemleak_free
later can be removed too.

Signed-off-by: Yee Lee <yee.lee@mediatek.com>

---
 mm/kfence/core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 4e7cd4c8e687..0d33d83f5244 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -600,14 +600,6 @@ static unsigned long kfence_init_pool(void)
 		addr += 2 * PAGE_SIZE;
 	}
 
-	/*
-	 * The pool is live and will never be deallocated from this point on.
-	 * Remove the pool object from the kmemleak object tree, as it would
-	 * otherwise overlap with allocations returned by kfence_alloc(), which
-	 * are registered with kmemleak through the slab post-alloc hook.
-	 */
-	kmemleak_free(__kfence_pool);
-
 	return 0;
 }
 
@@ -831,8 +823,14 @@ void __init kfence_alloc_pool(void)
 {
 	if (!kfence_sample_interval)
 		return;
-
-	__kfence_pool = memblock_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);
+	/*
+	 * The pool is live and will never be deallocated from this point on.
+	 * Skip the pool object from the kmemleak object allocation, as it would
+	 * otherwise overlap with allocations returned by kfence_alloc(), which
+	 * are registered with kmemleak through the slab post-alloc hook.
+	 */
+	__kfence_pool = memblock_alloc_try_nid(KFENCE_POOL_SIZE, PAGE_SIZE,
+		 MEMBLOCK_LOW_LIMIT, MEMBLOCK_ALLOC_NOLEAKTRACE, NUMA_NO_NODE);
 
 	if (!__kfence_pool)
 		pr_err("failed to allocate pool\n");
-- 
2.18.0


