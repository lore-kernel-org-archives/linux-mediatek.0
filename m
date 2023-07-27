Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2C3C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 06:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HVj27kBDVpPvZ+j4dkr5RIuiJz1r0HErENAsJMpj6ng=; b=KTA/jA/Z1HZkN1XlL1A7wj4k2+
	YhMOYJG1An+CmpYat7o8ttKH6Xx+eamTVRFBWOcsovI0jN0n0M7fAhv6OhqE74W0a6zcpY2klDqcj
	s1lEe4rfA1FMLEe590h2sTR86xDebrIAlKo1FKToA8pYBvUavmPpKbzA2tG5+71bEdN5Xc+I0GCKe
	oE6wl21QT1gpwVNEDfzp6YS8oMzdIJWfHCDdPiv8YKf6n7eTEBMw5sV9F9kb5GzkujYNDYnSYZfeP
	ZKkkSYz32fo9OetHXHWYT7vP8K0KDcEDdFAMaFue6Q/qs5PiFg0u7JrVnBT+yB6oprD0SSdambQPp
	cFMscz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuVf-00CJsg-1f;
	Thu, 27 Jul 2023 06:30:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuVd-00CJrH-15;
	Thu, 27 Jul 2023 06:30:02 +0000
X-UUID: fc8ddef22c4611ee83ed1395ce914268-20230726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HVj27kBDVpPvZ+j4dkr5RIuiJz1r0HErENAsJMpj6ng=;
	b=tj+XxvzvVKQqp4VEbm1pCbjkR0B2LfxdiN/GXsGp7S++KvdCOrDDoRbUdPH8oG2lgCtG//3WMwTZ/GOuDSrjsrAVow/viUZ2/axaZOYhXIhsFwf4Y7Nf/Sb1tl2b1s93QhjH6PxFsnNusGIiQMTh+nR2IzCLCCmwSRxfe0AJvd4=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:d4e6346c-04be-4a78-be4b-2c2fcb7a2ea9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.29,REQID:d4e6346c-04be-4a78-be4b-2c2fcb7a2ea9,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:e7562a7,CLOUDID:26988242-d291-4e62-b539-43d7d78362ba,B
	ulkID:230727142932X71U816G,BulkQuantity:1,Recheck:0,SF:16|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_USA,TF_CID_SPAM_FSD,
	TF_CID_SPAM_SNR
X-UUID: fc8ddef22c4611ee83ed1395ce914268-20230726
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 725371684; Wed, 26 Jul 2023 23:29:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jul 2023 14:29:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jul 2023 14:29:13 +0800
From: Andrew Yang <andrew.yang@mediatek.com>
To: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky
	<senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
CC: <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>, Andrew Yang
	<andrew.yang@mediatek.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] zsmalloc: Fix races between modifications of fullness and isolated
Date: Thu, 27 Jul 2023 14:29:07 +0800
Message-ID: <20230727062910.6337-1-andrew.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_233001_407618_2737A7E7 
X-CRM114-Status: GOOD (  12.63  )
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

Since fullness and isolated share the same unsigned int,
modifications of them should be protected by the same lock.

Signed-off-by: Andrew Yang <andrew.yang@mediatek.com>
Fixes: c4549b871102 ("zsmalloc: remove zspage isolation for migration")
---
v2: Moving comment too
---
 mm/zsmalloc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 32f5bc4074df..b58f957429f0 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1777,6 +1777,7 @@ static void replace_sub_page(struct size_class *class, struct zspage *zspage,
 
 static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 {
+	struct zs_pool *pool;
 	struct zspage *zspage;
 
 	/*
@@ -1786,9 +1787,10 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 	VM_BUG_ON_PAGE(PageIsolated(page), page);
 
 	zspage = get_zspage(page);
-	migrate_write_lock(zspage);
+	pool = zspage->pool;
+	spin_lock(&pool->lock);
 	inc_zspage_isolation(zspage);
-	migrate_write_unlock(zspage);
+	spin_unlock(&pool->lock);
 
 	return true;
 }
@@ -1854,12 +1856,12 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	kunmap_atomic(s_addr);
 
 	replace_sub_page(class, zspage, newpage, page);
+	dec_zspage_isolation(zspage);
 	/*
 	 * Since we complete the data copy and set up new zspage structure,
 	 * it's okay to release the pool's lock.
 	 */
 	spin_unlock(&pool->lock);
-	dec_zspage_isolation(zspage);
 	migrate_write_unlock(zspage);
 
 	get_page(newpage);
@@ -1876,14 +1878,16 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 static void zs_page_putback(struct page *page)
 {
+	struct zs_pool *pool;
 	struct zspage *zspage;
 
 	VM_BUG_ON_PAGE(!PageIsolated(page), page);
 
 	zspage = get_zspage(page);
-	migrate_write_lock(zspage);
+	pool = zspage->pool;
+	spin_lock(&pool->lock);
 	dec_zspage_isolation(zspage);
-	migrate_write_unlock(zspage);
+	spin_unlock(&pool->lock);
 }
 
 static const struct movable_operations zsmalloc_mops = {
-- 
2.18.0


