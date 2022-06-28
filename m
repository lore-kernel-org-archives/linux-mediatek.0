Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266D4CCA479
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zXu0ktyw7BMrjs+/PsBz2fQRMG/j+JasIZ/NDWZBX0=; b=4jKnNnfElaAW1+Gh/IYhAmSYUB
	iMubsNGcs1EEWc+CDSjbB8o06rUiRSpUNpncMEDyxQ3jZr8G+T3Eh4f9TPYC4mkEobDJ9D0EOtZW7
	vm7xaGHZsxmkLqGDc86NNjXjhPJhwOIKLKiWzjZ72B+LhqutdHkfZFHUlhsTrjtznSHyMf3V1WHNN
	Crdh33oVbk+94zPZDx6uRSjl+cI4OyIW/3DWEOB0fGdKqAdEQdxNLQklZHVsHwMVDv6P6lf9FSyD0
	zUNhJnZS1nyEl7U3yjyCiQk/G4RCxnE32iWYLxq29AVZbMoFxtCvaB5IkXixrNzW//wNNTEAavs7m
	Kj5UX7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6AAT-0068FB-B6; Tue, 28 Jun 2022 12:18:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6AAQ-0068BQ-2x; Tue, 28 Jun 2022 12:18:07 +0000
X-UUID: 24d200fb1ecc478781ce5c9009635f16-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:0e93d573-6df8-4583-9bd7-bb5a313d2dd0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:7a500ed6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 24d200fb1ecc478781ce5c9009635f16-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yee.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 587943295; Tue, 28 Jun 2022 05:17:53 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 19:37:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 19:37:18 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <catalin.marinas@arm.com>, Yee Lee <yee.lee@mediatek.com>, "Alexander
 Potapenko" <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov
	<dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "open list:KFENCE"
	<kasan-dev@googlegroups.com>, "open list:MEMORY MANAGEMENT"
	<linux-mm@kvack.org>, "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/1] mm: kfence: apply kmemleak_ignore_phys on early allocated pool
Date: Tue, 28 Jun 2022 19:37:11 +0800
Message-ID: <20220628113714.7792-2-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220628113714.7792-1-yee.lee@mediatek.com>
References: <20220628113714.7792-1-yee.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_051806_177043_5BEE17FA 
X-CRM114-Status: GOOD (  14.17  )
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

This patch solves two issues.

(1) The pool allocated by memblock needs to unregister from
kmemleak scanning. Apply kmemleak_ignore_phys to replace the
original kmemleak_free as its address now is stored in the phys tree.

(2) The pool late allocated by page-alloc doesn't need to unregister.
Move out the freeing operation from its call path.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Suggested-by: Marco Elver <elver@google.com>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 mm/kfence/core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 4e7cd4c8e687..32a4a75e820c 100644
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
 
@@ -620,8 +612,16 @@ static bool __init kfence_init_pool_early(void)
 
 	addr = kfence_init_pool();
 
-	if (!addr)
+	if (!addr) {
+		/*
+		 * The pool is live and will never be deallocated from this point on.
+		 * Ignore the pool object from the kmemleak phys object tree, as it would
+		 * otherwise overlap with allocations returned by kfence_alloc(), which
+		 * are registered with kmemleak through the slab post-alloc hook.
+		 */
+		kmemleak_ignore_phys(__pa(__kfence_pool));
 		return true;
+	}
 
 	/*
 	 * Only release unprotected pages, and do not try to go back and change
-- 
2.18.0


