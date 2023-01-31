Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FC1C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 06:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oufRUM8fbS/q0Osr9kwiWtQoCrYF3ZQFN+pIz30N6fI=; b=PpJOTWXBFFpIsy2XsrSkMxFgsb
	DXAND5MczCRSqdqTgCDSvZJyVuYOtFJna1VJWrhNGNeKF2q0y1+DSMwqw7J4ZjoyACWRdyCUvsn2e
	KOhHlv83uTmfYeuVUGYTzwgygF0VgUD/VeNObv7a+0PRTxf44I9Nu/Lg+aody+3FwQT05nnEWonJa
	S43Rjr6N6v04cbSAKDIYGcVe1zy5PiZaajE5Nl5q+NpG5GLvLI8Zx09iGyePDkgiO3Q4yGgYAS4XF
	mSkcRx0EP+ef44WtLfHzBoznd9ryoIURlw4ELv+4MIO8hN08WOih/V2H9xHyMw1539b9QIv8oGIH+
	toOborLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMk9D-006SXm-4M; Tue, 31 Jan 2023 06:29:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMk9A-006SX9-1o; Tue, 31 Jan 2023 06:29:38 +0000
X-UUID: 9da25b30a13011edbbe3f76fe852e059-20230130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oufRUM8fbS/q0Osr9kwiWtQoCrYF3ZQFN+pIz30N6fI=;
	b=Y/9tSPL3wdyklvt1VfBzcxSU5du3mWj7PhovxtyFaqJ5+96fjzhReiJJ/tcqjWkg3CWDOfUfKwRnGyXKgtKsj4cSrb7ichO+ORlv4GEm+JDcdtr2hVPfLOpL6SbKdK+ceHYNQ39MkQGxp+YNXxrMTxyXIJD7WyKHQJ/xqEBSpn4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:e6266bf6-83bd-4e18-a965-94b3594c31e0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:56586f8d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 9da25b30a13011edbbe3f76fe852e059-20230130
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1658703475; Mon, 30 Jan 2023 23:29:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 31 Jan 2023 14:28:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 31 Jan 2023 14:28:56 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Jonathan Corbet <corbet@lwn.net>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <chinwen.chang@mediatek.com>, <andrew.yang@mediatek.com>, Kuan-Ying Lee
	<Kuan-Ying.Lee@mediatek.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] mm/doc: Replace isolate_lru_page with folio_isolate_lru
Date: Tue, 31 Jan 2023 14:28:51 +0800
Message-ID: <20230131062853.28449-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_222936_114700_26F85F0B 
X-CRM114-Status: GOOD (  12.52  )
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

Since we introduce folio, replace isolate_lru_page() with
folio_isolate_lru().

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 Documentation/mm/page_migration.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
index 11493bad7112..1f8cc175d770 100644
--- a/Documentation/mm/page_migration.rst
+++ b/Documentation/mm/page_migration.rst
@@ -69,8 +69,8 @@ In kernel use of migrate_pages()
 
    Lists of pages to be migrated are generated by scanning over
    pages and moving them into lists. This is done by
-   calling isolate_lru_page().
-   Calling isolate_lru_page() increases the references to the page
+   calling folio_isolate_lru().
+   Calling folio_isolate_lru() increases the references to the page
    so that it cannot vanish while the page migration occurs.
    It also prevents the swapper or other scans from encountering
    the page.
@@ -89,7 +89,7 @@ How migrate_pages() works
 
 migrate_pages() does several passes over its list of pages. A page is moved
 if all references to a page are removable at the time. The page has
-already been removed from the LRU via isolate_lru_page() and the refcount
+already been removed from the LRU via folio_isolate_lru() and the refcount
 is increased so that the page cannot be freed while page migration occurs.
 
 Steps:
-- 
2.18.0


