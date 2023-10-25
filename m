Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE1C25B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GD07mFMHD4ZCgjq6WI7FIX+ZSbE7ZY0N7D7XCgHgxDs=; b=GM7t6RkOYbBFxw933QqUjvCfvE
	CR+Q6TJ3dJxAyQyEZw1DZVqI9o6IDTagshFwxmnxnYyYqg1twqDVoNQfjUJ8Is+IzhrPMDMU7vC4i
	EAAyYKRvJet767cNHFhyT5xURF8Y8gzx6dw0pdGTya03NwItcY+tMar/GIK/g31L7jinye0whB+il
	2hgWi620mkWzrsczxxff8MMhll9LAPYwmN3i+IeK3bRLXVqkZmPUAVF2MBk+J3pY+LVDf46sh/Eys
	+Nqf8/X140GU37bkiAyJ2WZ0em28o/lr/WS6Dh5fRwwxW9aq8dAlfGRMyGEwGvwnmlJRF7j3SU8NB
	l0IW6LQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaQn-00BrOF-1C;
	Wed, 25 Oct 2023 09:44:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvaQk-00BrMm-1w;
	Wed, 25 Oct 2023 09:44:03 +0000
X-UUID: 051e3588731b11ee86758d4a7c00f3a0-20231025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GD07mFMHD4ZCgjq6WI7FIX+ZSbE7ZY0N7D7XCgHgxDs=;
	b=DSL30w6qIjB8sRl+shY6Eu/derXnAgpR2r8Wg4fmAqtrl9Ke6lZvLHb5tSpSYioor4pOdka7aP+7X85+74MdoYIqBDHjkYHzi9TLgba2ur/xrp0HW5v2FIulUtPc03iKitVhmyrBOBNrAnSPlEiEeVlop1VSq4ahm+v3BziZkm0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:801f2ff6-76fb-4027-8e45-45cce7404290,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:3f6ac1fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 051e3588731b11ee86758d4a7c00f3a0-20231025
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1475596525; Wed, 25 Oct 2023 02:43:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Oct 2023 17:23:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Oct 2023 17:23:19 +0800
From: <ed.tsai@mediatek.com>
To: Jens Axboe <axboe@kernel.dk>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <stanley.chu@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<powen.kao@mediatek.com>, <naomi.chu@mediatek.com>, <will.shiu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <casper.li@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] block: Check the queue limit before bio submitting
Date: Wed, 25 Oct 2023 17:22:52 +0800
Message-ID: <20231025092255.27930-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.727700-8.000000
X-TMASE-MatchedRID: BmApTv+lLq0waD7CCdj96ei9l247YAX3lFphfRKYquoUtdRZTmEaIS3u
	UJEx/mLPreNj5HHxl21nGN5KPPuDsG31PKYofPF/XTwa0AqaSsKLB4sTRpOnCdCb26mGD2jLFXo
	+i3C0P4mvLLwTZdNynSvcqxXFsTtBue4A1S8vO3qM29hkek7XdwRryDXHx6oX2m/9xxi5QYn0Vn
	grMLma4CACA5ub2VruHVVF1Gr4vCs9d1nHWxkekOKXavbHY/C1uCESrx7wlnI4FRAn4eAUA31Qr
	wyU0uRkPdC7NjHVzscy2ii2lrm+Dx8TzIzimOwPC24oEZ6SpSk6XEE7Yhw4FgRTi3vHGzbgVIN/
	lHwV0gMDutLgGfA+guP9LE9sG2stVbTvIYsYMpM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.727700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7092A3517B8EBB70E790EACEFA197BBBB6340BDF01AC26F8DD7E4A6F9D08CF272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_024402_646582_D5D06CAF 
X-CRM114-Status: GOOD (  15.93  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

Referring to commit 07173c3ec276 ("block: enable multipage bvecs"),
each bio_vec now holds more than one page, potentially exceeding
1MB in size and causing alignment issues with the queue limit.

In a sequential read/write scenario, the file system maximizes the
bio's capacity before submitting. However, misalignment with the
queue limit can result in the bio being split into smaller I/O
operations.

For instance, assuming the maximum I/O size is set to 512KB and the
memory is highly fragmented, resulting in each bio containing only
one 2-pages bio_vec (i.e., bi_size = 1028KB). This would cause the
bio to be split into two 512KB portions and one 4KB portion. As a
result, the originally expected continuous large I/O operations are
interspersed with many small I/O operations.

To address this issue, this patch adds a check for the max_sectors
before submitting the bio. This allows the upper layers to proactively
detect and handle alignment issues.

I performed the Antutu V10 Storage Test on a UFS 4.0 device, which
resulted in a significant improvement in the Sequential test:

Sequential Read (average of 5 rounds):
Original: 3033.7 MB/sec
Patched: 3520.9 MB/sec

Sequential Write (average of 5 rounds):
Original: 2225.4 MB/sec
Patched: 2800.3 MB/sec

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 block/bio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/bio.c b/block/bio.c
index 816d412c06e9..a4a1f775b9ea 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1227,6 +1227,7 @@ static int __bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
 	iov_iter_extraction_t extraction_flags = 0;
 	unsigned short nr_pages = bio->bi_max_vecs - bio->bi_vcnt;
 	unsigned short entries_left = bio->bi_max_vecs - bio->bi_vcnt;
+	struct queue_limits *lim = &bdev_get_queue(bio->bi_bdev)->limits;
 	struct bio_vec *bv = bio->bi_io_vec + bio->bi_vcnt;
 	struct page **pages = (struct page **)bv;
 	ssize_t size, left;
@@ -1275,6 +1276,11 @@ static int __bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
 		struct page *page = pages[i];
 
 		len = min_t(size_t, PAGE_SIZE - offset, left);
+		if (bio->bi_iter.bi_size + len >
+		    lim->max_sectors << SECTOR_SHIFT) {
+			ret = left;
+			break;
+		}
 		if (bio_op(bio) == REQ_OP_ZONE_APPEND) {
 			ret = bio_iov_add_zone_append_page(bio, page, len,
 					offset);
-- 
2.18.0


