Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC32DEB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89B20YeAg/sOI5tG4Ue+qiZY0x7A1oBUW3Grt3g3ZCU=; b=iXhDypyeLF7iM5G9R0mV973SOG
	JerQSHVWo3ZtEOgoamMp10cTpFaOUltNOQVClH+vUPaEfL3/1xx4FPEZTLV2yISyNZhgPygLsOwqI
	qniqZU/ji4WUBCjqbuUS+6GLCu+ONcbh3ufpL3476Db/aPyNCF+IDAhsmKCXyEaNOVEwEa/rtM10N
	Ts+JPD4sna+pI0aZqDwE/w6Atu5N8DXevgzPoC0ajYaT2EBdLzwhEtHe/pVK1UeLrJ7DECtHovAfB
	PJCSvkCCAK1ezJntgApnMiGlJsW643I6R89OhLjg/GAlt1fzzsC89zmkm91gfiO3v6Edhn3VMA40U
	ns6iebLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qESwZ-00FX5P-1e;
	Wed, 28 Jun 2023 11:02:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qESwW-00FX02-2Z;
	Wed, 28 Jun 2023 11:02:38 +0000
X-UUID: 43e72f7015a311ee912e1518a6540028-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=89B20YeAg/sOI5tG4Ue+qiZY0x7A1oBUW3Grt3g3ZCU=;
	b=n+IxyXmA/vpGQ/x+aT8zShgmrAKvIwjk05Vapqo6Crr0MHy7Ym6vKwHAcEoYQG1jU78GZ6SAUzLSP5XARymogSX53BaKPu8YjQSpbW6ZaZTL7cztqrtKKAPgnSNxVA/JaWfxv5g+XaM0vPNzU1RNiJBDHvXSiJZyVjYczcZoQDQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:143a3103-6a42-45d8-a56b-d551e6558500,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:d1ac7782-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 43e72f7015a311ee912e1518a6540028-20230628
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 925431606; Wed, 28 Jun 2023 04:02:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 19:02:23 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 19:02:22 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<xiaoming.yu@mediatek.com>, Haibo Li <haibo.li@mediatek.com>
Subject: [PATCH] mm/filemap.c:fix update prev_pos after one read request done
Date: Wed, 28 Jun 2023 19:02:20 +0800
Message-ID: <20230628110220.120134-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_040236_867505_EDC2ADD8 
X-CRM114-Status: GOOD (  17.52  )
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

ra->prev_pos tracks the last visited byte in the previous read request.
It is used to check whether it is sequential read in
ondemand_readahead and thus affects the readahead window.

From commit 06c0444290ce ("mm/filemap.c: generic_file_buffered_read()
now uses find_get_pages_contig"),update logic of prev_pos is changed.
It updates prev_pos after each returns from filemap_get_pages.
But the read request from user may be not fully completed
at this point.
The updated prev_pos impacts the subsequent readahead window.

The real problem is performance drop of fsck_msdos between linux-5.4
and linux-5.15(also linux-6.4).
Comparing to linux-5.4,It spends about 110% time and read 140% pages.
The read pattern of fsck_msdos is not fully sequential.

Simplified read pattern of fsck_msdos likes below:
1.read at page offset 0xa,size 0x1000
2.read at other page offset like 0x20,size 0x1000
3.read at page offset 0xa,size 0x4000
4.read at page offset 0xe,size 0x1000

Here is the read status on linux-6.4:
1.after read at page offset 0xa,size 0x1000
    ->page ofs 0xa go into pagecache
2.after read at page offset 0x20,size 0x1000
    ->page ofs 0x20 go into pagecache
3.read at page offset 0xa,size 0x4000
    ->filemap_get_pages read ofs 0xa from pagecache and returns
    ->prev_pos is updated to 0xb and goto next loop
    ->filemap_get_pages tends to read ofs 0xb,size 0x3000
    ->initial_readahead case in ondemand_readahead since prev_pos is
      the same as request ofs.
    ->read 8 pages while async size is 5 pages
      (PageReadahead flag at page 0xe)
4.read at page offset 0xe,size 0x1000
    ->hit page 0xe with PageReadahead flag set,double the ra_size.
      read 16 pages while async size is 16 pages
Now it reads 24 pages while actually uses 5 pages

on linux-5.4:
1.the same as 6.4
2.the same as 6.4
3.read at page offset 0xa,size 0x4000
    ->read ofs 0xa from pagecache
    ->read ofs 0xb,size 0x3000 using page_cache_sync_readahead
      read 3 pages
    ->prev_pos is updated to 0xd before generic_file_buffered_read
      returns
4.read at page offset 0xe,size 0x1000
    ->initial_readahead case in ondemand_readahead since
      request ofs-prev_pos==1
    ->read 4 pages while async size is 3 pages

Now it reads 7 pages while actually uses 5 pages.

In above demo,the initial_readahead case is triggered by offset
of user request on linux-5.4.
While it may be triggered by update logic of prev_pos on linux-6.4.

To fix the performance drop,update prev_pos after finishing one read
request.

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
---
 mm/filemap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 83dda76d1fc3..16b2054eee71 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2670,6 +2670,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
 	int i, error = 0;
 	bool writably_mapped;
 	loff_t isize, end_offset;
+	loff_t last_pos = ra->prev_pos;
 
 	if (unlikely(iocb->ki_pos >= inode->i_sb->s_maxbytes))
 		return 0;
@@ -2721,8 +2722,8 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
 		 * When a read accesses the same folio several times, only
 		 * mark it as accessed the first time.
 		 */
-		if (!pos_same_folio(iocb->ki_pos, ra->prev_pos - 1,
-							fbatch.folios[0]))
+		if (!pos_same_folio(iocb->ki_pos, last_pos - 1,
+				    fbatch.folios[0]))
 			folio_mark_accessed(fbatch.folios[0]);
 
 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
@@ -2749,7 +2750,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
 
 			already_read += copied;
 			iocb->ki_pos += copied;
-			ra->prev_pos = iocb->ki_pos;
+			last_pos = iocb->ki_pos;
 
 			if (copied < bytes) {
 				error = -EFAULT;
@@ -2763,7 +2764,7 @@ ssize_t filemap_read(struct kiocb *iocb, struct iov_iter *iter,
 	} while (iov_iter_count(iter) && iocb->ki_pos < isize && !error);
 
 	file_accessed(filp);
-
+	ra->prev_pos = last_pos;
 	return already_read ? already_read : error;
 }
 EXPORT_SYMBOL_GPL(filemap_read);
-- 
2.25.1


