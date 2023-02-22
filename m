Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F06C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 06:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GlIiKdz81RC+WT6ye6XFZWOPht8IFh4/MI/IcySt7tk=; b=YHXOjRy/3lrGzhUG7NHdaUQcvx
	8/uonaJxYRLdl0CtTxt8d5j0/tywrdlc+FqnKHBGeF4GvhNaqZCAXeXCOjJ3VqQNebeC4HHemzYon
	+bdt13wLyuA1+aI07cqtifa6oGC5aH7AzODSjNNXiq5X7kVStyeVA9IUKDewOV6RHruakZWMkJ6mM
	q0FrJJX59oyrQW95iIWZD7c72uNT095CJE45f9Ngt9f9XrF8oYseFGIig2N5362GsFBhiLIcdqggt
	hsG8sS5uoBc16NrWJgE1zPs2lZS0UDjvSxfU7bQ2U7MWtIrGGGImflMAjMfSaB6DRY/4xt3QjlKE8
	uXfJYX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUicN-00Awlb-76; Wed, 22 Feb 2023 06:28:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUicK-00Awl8-Np; Wed, 22 Feb 2023 06:28:41 +0000
X-UUID: 241f503cb27a11eda08d4d6090ec5a5c-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GlIiKdz81RC+WT6ye6XFZWOPht8IFh4/MI/IcySt7tk=;
	b=Wy5W7Pma7ksrsOWmCqdALFtvC2TG9DiuPqdcpe8rFJx0sULsSyYjxbelVrC4lrS6IIT2ULuqVVe4sGqu9mVaiwzzA5TRngbFm1pXJlCQiBb06vvrXF3mWpCIJB0h+Ok/R4J1DebHGio5Qu8e7tjuESz5sBHH5A0aVycuCA2euOk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:b5f48757-0239-4ee0-9146-e58b6f06fa90,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:2ee15426-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 241f503cb27a11eda08d4d6090ec5a5c-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <andrew.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1471509684; Tue, 21 Feb 2023 23:28:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Feb 2023 14:28:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 22 Feb 2023 14:28:02 +0800
From: Andrew Yang <andrew.yang@mediatek.com>
To: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <casper.li@mediatek.com>, andrew.yang
	<andrew.yang@mediatek.com>, <damon@lists.linux.dev>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] mm/damon/paddr: fix missing folio_put()
Date: Wed, 22 Feb 2023 14:27:54 +0800
Message-ID: <20230222062758.6183-1-andrew.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_222840_805497_B2B89C69 
X-CRM114-Status: GOOD (  13.34  )
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
---
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


