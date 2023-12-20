Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC5DC46CD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 07:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zWnIxvvt9i9Arc7rR/Bktc59NaeLptNqSNuvQsls8/s=; b=rNhJ3Pupi/ZxBu7g/GzhjVigpU
	FjNr+qhwAc2LhYeIY/OymHlwSUThKAHC3qYozVmaqlKij1jNquhyHXz755HE7NnmMo3aa8O+7Pbb/
	EZ9TlXmaI138TFcfYzpNROLrPp/U+RX+beUyfaX101y26CrKCmc2Oc0jjZyCLnNokD3uY66+vGGzu
	Stwwlui8gfQRr+qpi4kV6+KQaHdzuSy+EtFbbxJFnOG64A7b/086xTVone4z7B0Riz2RiVs/HQswR
	lpAP+QGaJ6kFU197u2Qtkc8V/wbrttNIjKHn2pzaZTdKMIAH9h7gWj8udfX6z3axbRxomhuO4ykEB
	86ylci4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrK0-00GTMq-14;
	Wed, 20 Dec 2023 07:48:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrJx-00GTLW-1T;
	Wed, 20 Dec 2023 07:48:51 +0000
X-UUID: 330371a89f0c11ee958cff29c719f35b-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zWnIxvvt9i9Arc7rR/Bktc59NaeLptNqSNuvQsls8/s=;
	b=eTgT4jLA87EuL8ZD2Xc5k1/KIXqXnUPNmvI5RRYrSTyHXXl7Nf+3mbe6IQeeutC31Hz4+rfhf0VDl7jz0xxIEam6In3creyP8txNSXs/h2IgStMj0MrH59OhVy5RVrhmB0acvPMr0iNaKUHHGsmMrOjE1ZnD6gJ427S4qiUnHtE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:48860895-8f61-4cf1-b620-d374c14dd116,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:97cf5f8d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 330371a89f0c11ee958cff29c719f35b-20231220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 944657187; Wed, 20 Dec 2023 00:48:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 15:48:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 15:48:09 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <casper.li@mediatek.com>, <chinwen.chang@mediatek.com>,
	<qun-wei.lin@mediatek.com>, <linux-mm@kvack.org>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mm: page_alloc: remove duplication of free_one_page()
Date: Wed, 20 Dec 2023 15:47:56 +0800
Message-ID: <20231220074757.3656-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.042100-8.000000
X-TMASE-MatchedRID: JWnFpJnSkzs5HWa1kxc3Mc36paW7ZnFoBCxvLPUx407fUZT83lbkEK1r
	wNdVdYipgrCec5Bjx+qAMuqetGVetnyef22ep6XYro1URZJFbJvd1KJkmiEcSkExS0sIXgpfF27
	mDyBvZ5CSjwm7NH6qsNECzCqMxVGBuUqn/hcBctSNWcj5w63xsn8wdqmWSBW9n1s5w+bk2xuOh+
	wyNBrFXDJiNuKohDcKzKSG3JdyKAPqtV2AGMNPavWdclq8lU1q
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.042100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F5135FF66DB980116838C225763DDE80253B6A99B2BB8055C0B14DC95FFE14C42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_234849_493934_9D3C0C6F 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Remove duplication of free_one_page().

Cc: Casper Li <casper.li@mediatek.com>
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 mm/page_alloc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2f646773a934..f46af8616cac 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1262,7 +1262,6 @@ static void free_one_page(struct zone *zone,
 static void __free_pages_ok(struct page *page, unsigned int order,
 			    fpi_t fpi_flags)
 {
-	unsigned long flags;
 	int migratetype;
 	unsigned long pfn = page_to_pfn(page);
 	struct zone *zone = page_zone(page);
@@ -1277,13 +1276,7 @@ static void __free_pages_ok(struct page *page, unsigned int order,
 	 */
 	migratetype = get_pfnblock_migratetype(page, pfn);
 
-	spin_lock_irqsave(&zone->lock, flags);
-	if (unlikely(has_isolate_pageblock(zone) ||
-		is_migrate_isolate(migratetype))) {
-		migratetype = get_pfnblock_migratetype(page, pfn);
-	}
-	__free_one_page(page, pfn, zone, order, migratetype, fpi_flags);
-	spin_unlock_irqrestore(&zone->lock, flags);
+	free_one_page(zone, page, pfn, order, migratetype, fpi_flags);
 
 	__count_vm_events(PGFREE, 1 << order);
 }
-- 
2.18.0


