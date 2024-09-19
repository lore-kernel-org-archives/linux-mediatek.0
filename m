Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABEDCE8D78
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1SfHddMinVKqBnBm88AjNHZXXoOonLGMKU9hBryUwg=; b=LLjh4GcAmy3MF+J6+EKl+TSr5G
	AEVdFEAXyCX9eJYdSe/4UkyGPE531ZdYbkD4QHCu2psXifzysfGvF3j5KS+cTcs4FCKjGruMiYPyc
	UOvLT5gBm1W6OsIGO0pS938hpQ1Wcr0rlpzEzPGWFsUpcqZkjbDUPl8gxUefZZ4QA1VT4NtXwlUjV
	XjEJVCHnZlX4UZYftNhj5aM56xMa/pdu9+Brb9RZCi9MlWv5xg9qa+nI/xIFXdSNeME20CtMTCKCZ
	w5oirmDV+OfvE3+m4JI1j0JVZ3OiGe7SLUL/FZHvTVWGkAJeiUbN0lh93OxwxoPpi0gjenFjaqbTx
	Q2FaPYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srFPr-0000000AAbo-2dsB;
	Thu, 19 Sep 2024 11:33:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srFMb-0000000AA2d-0887;
	Thu, 19 Sep 2024 11:30:22 +0000
X-UUID: 89c65f96767a11efb3adad29d29602c1-20240919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Z1SfHddMinVKqBnBm88AjNHZXXoOonLGMKU9hBryUwg=;
	b=H+UYOB/jxS26nMcyuJNX2vQjHqqwM6HxZ5BlhzQRcFpBxpne/WVLeOzAqB170VtJyLlanVhtUyyqOgZHg/xJu5+9PD4F8Zv6VmCpWAAhHXOe/6I5x7uLDIr+HgbSEqQx9SWSgLGe/vQwfex726o+bnECzCrwiUeEFDDQTmPucCk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:491685d5-aba9-4721-8f4d-70a97f01e1d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e6f03d9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 89c65f96767a11efb3adad29d29602c1-20240919
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1539984087; Thu, 19 Sep 2024 04:30:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Sep 2024 19:30:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Sep 2024 19:30:10 +0800
From: Qun-Wei Lin <qun-wei.lin@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ryan Roberts
	<ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, David
 Hildenbrand <david@redhat.com>, Chris Li <chrisl@kernel.org>, "Matthew Wilcox
 (Oracle)" <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, Dan
 Schatzberg <schatzberg.dan@gmail.com>, Kairui Song <kasong@tencent.com>,
	Barry Song <baohua@kernel.org>, Jens Axboe <axboe@kernel.dk>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-block@vger.kernel.org>, Casper Li <casper.li@mediatek.com>, Chinwen
 Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>,
	John Hsu <john.hsu@mediatek.com>, <wsd_upstream@mediatek.com>, Qun-Wei Lin
	<qun-wei.lin@mediatek.com>
Subject: [PATCH 2/2] mm, swap: introduce SWP_READ_SYNCHRONOUS_IO
Date: Thu, 19 Sep 2024 19:29:52 +0800
Message-ID: <20240919112952.981-3-qun-wei.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240919112952.981-1-qun-wei.lin@mediatek.com>
References: <20240919112952.981-1-qun-wei.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_043021_138521_FDD2BF07 
X-CRM114-Status: GOOD (  17.40  )
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

The existing SWP_SYNCHRONOUS_IO flag is not enough for certain swap
devices that support synchronous read operations but asynchronous write
operations, so we need to introduce a new flag SWP_READ_SYNCHRONOUS_IO.

Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
---
 include/linux/swap.h | 31 ++++++++++++++++---------------
 mm/memory.c          |  3 ++-
 mm/page_io.c         |  2 +-
 mm/swapfile.c        |  3 +++
 4 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index ba7ea95d1c57..f595050f431b 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -205,21 +205,22 @@ struct swap_extent {
 	  offsetof(union swap_header, info.badpages)) / sizeof(int))
 
 enum {
-	SWP_USED	= (1 << 0),	/* is slot in swap_info[] used? */
-	SWP_WRITEOK	= (1 << 1),	/* ok to write to this swap?	*/
-	SWP_DISCARDABLE = (1 << 2),	/* blkdev support discard */
-	SWP_DISCARDING	= (1 << 3),	/* now discarding a free cluster */
-	SWP_SOLIDSTATE	= (1 << 4),	/* blkdev seeks are cheap */
-	SWP_CONTINUED	= (1 << 5),	/* swap_map has count continuation */
-	SWP_BLKDEV	= (1 << 6),	/* its a block device */
-	SWP_ACTIVATED	= (1 << 7),	/* set after swap_activate success */
-	SWP_FS_OPS	= (1 << 8),	/* swapfile operations go through fs */
-	SWP_AREA_DISCARD = (1 << 9),	/* single-time swap area discards */
-	SWP_PAGE_DISCARD = (1 << 10),	/* freed swap page-cluster discards */
-	SWP_STABLE_WRITES = (1 << 11),	/* no overwrite PG_writeback pages */
-	SWP_SYNCHRONOUS_IO = (1 << 12),	/* synchronous IO is efficient */
-					/* add others here before... */
-	SWP_SCANNING	= (1 << 14),	/* refcount in scan_swap_map */
+	SWP_USED	= (1 << 0),		/* is slot in swap_info[] used? */
+	SWP_WRITEOK	= (1 << 1),		/* ok to write to this swap?	*/
+	SWP_DISCARDABLE = (1 << 2),		/* blkdev support discard */
+	SWP_DISCARDING	= (1 << 3),		/* now discarding a free cluster */
+	SWP_SOLIDSTATE	= (1 << 4),		/* blkdev seeks are cheap */
+	SWP_CONTINUED	= (1 << 5),		/* swap_map has count continuation */
+	SWP_BLKDEV	= (1 << 6),		/* its a block device */
+	SWP_ACTIVATED	= (1 << 7),		/* set after swap_activate success */
+	SWP_FS_OPS	= (1 << 8),		/* swapfile operations go through fs */
+	SWP_AREA_DISCARD = (1 << 9),		/* single-time swap area discards */
+	SWP_PAGE_DISCARD = (1 << 10),		/* freed swap page-cluster discards */
+	SWP_STABLE_WRITES = (1 << 11),		/* no overwrite PG_writeback pages */
+	SWP_SYNCHRONOUS_IO = (1 << 12),		/* synchronous IO is efficient */
+	SWP_READ_SYNCHRONOUS_IO = (1 << 13),	/* synchronous IO is efficient */
+						/* add others here before... */
+	SWP_SCANNING	= (1 << 14),		/* refcount in scan_swap_map */
 };
 
 #define SWAP_CLUSTER_MAX 32UL
diff --git a/mm/memory.c b/mm/memory.c
index ebfc9768f801..f531a6bfea5b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4089,7 +4089,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	swapcache = folio;
 
 	if (!folio) {
-		if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
+		if ((data_race(si->flags & (SWP_SYNCHRONOUS_IO |
+		    SWP_READ_SYNCHRONOUS_IO))) &&
 		    __swap_count(entry) == 1) {
 			/*
 			 * Prevent parallel swapin from proceeding with
diff --git a/mm/page_io.c b/mm/page_io.c
index ff8c99ee3af7..98a00709e98c 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -499,7 +499,7 @@ static void swap_read_folio_bdev_async(struct folio *folio,
 void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
 {
 	struct swap_info_struct *sis = swp_swap_info(folio->swap);
-	bool synchronous = sis->flags & SWP_SYNCHRONOUS_IO;
+	bool synchronous = sis->flags & (SWP_SYNCHRONOUS_IO | SWP_READ_SYNCHRONOUS_IO);
 	bool workingset = folio_test_workingset(folio);
 	unsigned long pflags;
 	bool in_thrashing;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 38bdc439651a..7b8feb235aab 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3177,6 +3177,9 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (p->bdev && bdev_synchronous(p->bdev))
 		p->flags |= SWP_SYNCHRONOUS_IO;
 
+	if (p->bdev && bdev_read_synchronous(p->bdev))
+		p->flags |= SWP_READ_SYNCHRONOUS_IO;
+
 	if (p->bdev && bdev_nonrot(p->bdev)) {
 		int cpu, i;
 		unsigned long ci, nr_cluster;
-- 
2.45.2


