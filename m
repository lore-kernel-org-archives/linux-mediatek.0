Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9764C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 06:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RpthVqrmOJ7J2xKNoYVxNTyGK79hRg8DTTNG1frteX4=; b=yL1YTiOB5qTPyWNGkphASu4v4Q
	Kjtr/ss5AfsFpWq1pCEJNPfzwbsC8IEFHGQwpS3fTbbwho9w5HmJUadcH3TeGv4hVwa5zwQNOlSGV
	KhM6adc4eg2VICBtriJaZ4h7FSp+ZFk0ELFRtguu9FVe8agVQp3MkfEpjRSMSF4Pnj7Yn7WgurnII
	eK976vIYbBkBdtedZBS+fe62t7BdPhd+UfDF2styag66MeyJVmFMPH5rWUnhc3ssB5ZA4AyJ7Oa7b
	ofbZvfSv4dN1A1QLlqmjOIoBw5CQNbO19j9IIAN5rSBdDyhOirsi9NRxnCxKnGbRxRDM/cMdeGyt9
	SanODdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUipu-00AyWt-8X; Wed, 22 Feb 2023 06:42:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUipq-00AyWH-W9; Wed, 22 Feb 2023 06:42:40 +0000
X-UUID: 16ba5908b27c11edbbe3f76fe852e059-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RpthVqrmOJ7J2xKNoYVxNTyGK79hRg8DTTNG1frteX4=;
	b=HBeHEXQzX3rTh2wOnLMh5jOcseV22TRc+wr7/VmZHHc6bRcOi2AXZLKmLExFXlSqORzZmL/f2PdzfAG2sh6WNE8t1+quGzu6U7a4JIW/4peGbmFTuyS15d4vN851TVz6jiFOLxHL1PHnwUsas75NIEtUqgiecS6FW08NO9vDmkA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:92e12320-3667-4339-99df-327a5cbc3a70,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:0e5e5526-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 16ba5908b27c11edbbe3f76fe852e059-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1482595338; Tue, 21 Feb 2023 23:42:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Feb 2023 14:42:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 22 Feb 2023 14:42:26 +0800
From: Andrew Yang <andrew.yang@mediatek.com>
To: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>, andrew.yang
	<andrew.yang@mediatek.com>, <stable@vger.kernel.org>,
	<damon@lists.linux.dev>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v3] mm/damon/paddr: fix missing folio_put()
Date: Wed, 22 Feb 2023 14:42:20 +0800
Message-ID: <20230222064223.6735-1-andrew.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_224239_069455_5B02E4A6 
X-CRM114-Status: GOOD (  12.92  )
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

From: "andrew.yang" <andrew.yang@mediatek.com>

damon_get_folio() would always increase folio _refcount and
folio_isolate_lru() would increase folio _refcount if the folio's lru
flag is set.

If an unevictable folio isolated successfully, there will be two more
_refcount. The one from folio_isolate_lru() will be decreased in
folio_puback_lru(), but the other one from damon_get_folio() will be
left behind. This causes a pin page.

Whatever the case, the _refcount from damon_get_folio() should be
decreased.

Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
Fixes: 57223ac29584 ("mm/damon/paddr: support the pageout scheme")
Cc: <stable@vger.kernel.org> # 5.16.x
---
v3:
  add fixes tag and cc stable
v2:
  according to David's suggestion
    1. revise subject
  according to SeongJae's suggestions
    1. rebase to mm-unstable tree 
    2. remove braces for th single statements
---
 mm/damon/paddr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 607bb69e526c..6c655d9b5639 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -250,12 +250,11 @@ static unsigned long damon_pa_pageout(struct damon_region *r, struct damos *s)
 			folio_put(folio);
 			continue;
 		}
-		if (folio_test_unevictable(folio)) {
+		if (folio_test_unevictable(folio))
 			folio_putback_lru(folio);
-		} else {
+		else
 			list_add(&folio->lru, &folio_list);
-			folio_put(folio);
-		}
+		folio_put(folio);
 	}
 	applied = reclaim_pages(&folio_list);
 	cond_resched();
-- 
2.18.0


