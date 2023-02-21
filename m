Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EF5C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 09:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZiCKkXRKaBMEPM33tFzlW1XDIvB4CcSTT6creyaUOs=; b=I1n/99uBw6N6HVQb72IzpZ1r+A
	5X2A63LUAlnfRpvS0k0SsEPDr4SQ39quXBqBQJsCOcJeIEA1SxxfGQANTdGWROfu3GvQ1hloFzdqX
	hioiORtJhsznPfebaR1aWX6w5PO1FwKi1mPjWCu8ztqHbFbLNPzmTh2zWRBCA1kK9zbRppYAXnv6t
	jtjsc05BJxM1j2SLji+/7SbDewKhK9zU/bw7GPFQ0Cdh/FSruNuV2aMEkq1KJZyY3pdu1HUrbRAZC
	v/psluAhmyDkiqVhcG1dqK5T0vhyuokY6JHQyPX/HHjXNkaoEUnzFXDSzURGQQbIpGJc+2cLravKV
	SIfOnisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOsb-007BUR-7B; Tue, 21 Feb 2023 09:24:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOsY-007BSh-1b; Tue, 21 Feb 2023 09:24:07 +0000
X-UUID: 7901fbd8b1c911edbbe3f76fe852e059-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DZiCKkXRKaBMEPM33tFzlW1XDIvB4CcSTT6creyaUOs=;
	b=Ke7xi24zxJ4Fc0DrdI8y4+RFQ3//kqLq0/lcATVL19t65+Qz27ioUGdEr67dGpreLRVR9jCR9Y/iYD3yvWyzjbhnnkNyrqyzshw+izTCkqwzQl6afvc6QX50rxevcrI6MCTOgGOqsRacFbr4uPjWxFa+H1xuWLVAMVcZfQ9TMJs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:9b412b9f-89fd-4935-985c-544fcc23d9f8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:61441cb1-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 7901fbd8b1c911edbbe3f76fe852e059-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1663150472; Tue, 21 Feb 2023 02:23:59 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Feb 2023 17:03:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 21 Feb 2023 17:03:24 +0800
From: Andrew Yang <andrew.yang@mediatek.com>
To: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <casper.lin@mediatek.com>, andrew.yang
	<andrew.yang@mediatek.com>, <damon@lists.linux.dev>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] mm/damon/paddr: fix pin page problem
Date: Tue, 21 Feb 2023 17:03:13 +0800
Message-ID: <20230221090313.15396-1-andrew.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_012406_141494_6C0E53CB 
X-CRM114-Status: GOOD (  13.12  )
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

damon_get_page() would always increase page _refcount and
isolate_lru_page() would increase page _refcount if the page's lru
flag is set.

If a unevictable page isolated successfully, there will be two more
_refcount. The one from isolate_lru_page() will be decreased in
putback_lru_page(), but the other one from damon_get_page() will be
left behind. This causes a pin page.

Whatever the case, the _refcount from damon_get_page() should be
decreased.

Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
---
 mm/damon/paddr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index e1a4315c4be6..56d8abd08fb1 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -223,8 +223,8 @@ static unsigned long damon_pa_pageout(struct damon_region *r)
 			putback_lru_page(page);
 		} else {
 			list_add(&page->lru, &page_list);
-			put_page(page);
 		}
+		put_page(page);
 	}
 	applied = reclaim_pages(&page_list);
 	cond_resched();
-- 
2.18.0


