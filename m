Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8331CCE8D78
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyX6ix+Ca+kuBSd2zaDcetxDLf8fGfj/eEE4RWU8lsQ=; b=nC/cZdBOt7e8oKqv/0P+Yiprcv
	6ahGBh44xmF7SZExABBfFZ7M7h99DU2O4EaWNhO8ytQo86UHKmQI20VL2NtuCuwgTvkk9P8BpFUMZ
	S0VSbSdfavy4HEcRVl84UmIN66X7O4sYM6cF0aagAScKAgRxCplQSJbVp2mEyEX2+mWmv2kzHgP7N
	bBvyZ3DQdWusgXHebZDX/Zoobm3Xm8ddPzFh0yCc+3wi8fAAnMGWzENpAo8K5ksBLKW8bEO/fxlXQ
	+mvJ0pTzWO3IgO++OZWbmJ4yeqLIn2PuQA9Yle46dv+WmFqAOegOWihoihi5e+i6gF/EfXWFZl2TG
	+zGhTaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srFNj-0000000AALK-0fZj;
	Thu, 19 Sep 2024 11:31:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srFMZ-0000000AA2d-2zgW;
	Thu, 19 Sep 2024 11:30:21 +0000
X-UUID: 89a67c3a767a11efb3adad29d29602c1-20240919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oyX6ix+Ca+kuBSd2zaDcetxDLf8fGfj/eEE4RWU8lsQ=;
	b=JpoSK834JdxhsMfYUVK1hDaZCq9YE9044w41Yle4h+LdHzSZKymPykj3vRiV6sdKKCTI6a2M9wG4FdtbtC0miLERvDSZvB+DrqjcwApRRTVJ8A19FvchOE0OFsjr7+o27ewfgwElCnbx9byDn8Bpn6g/ksHWagblqNHn+IhcXzo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1ff07fb1-1fa1-4f4e-8525-375b2f703bcd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:cef03d9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 89a67c3a767a11efb3adad29d29602c1-20240919
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <qun-wei.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 961147067; Thu, 19 Sep 2024 04:30:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Sep 2024 04:30:10 -0700
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
Subject: [PATCH 1/2] block: add BLK_FEAT_READ_SYNCHRONOUS feature for synchronous read
Date: Thu, 19 Sep 2024 19:29:51 +0800
Message-ID: <20240919112952.981-2-qun-wei.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240919112952.981-1-qun-wei.lin@mediatek.com>
References: <20240919112952.981-1-qun-wei.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_043019_786640_CD57E568 
X-CRM114-Status: GOOD (  12.93  )
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

This commit introduces a new feature flag, BLK_FEAT_READ_SYNCHRONOUS,
which ensures that read operations always complete in the submit context.
This is useful for scenarios where synchronous read operations are required
while allowing write operations to remain asynchronous.

This patch is preparation for optimizing of the operation of the swap
device with next patch.

Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
---
 include/linux/blkdev.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 643c9020a35a..a697db11d91c 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -332,6 +332,9 @@ typedef unsigned int __bitwise blk_features_t;
 #define BLK_FEAT_RAID_PARTIAL_STRIPES_EXPENSIVE \
 	((__force blk_features_t)(1u << 15))
 
+/* read operations always completes in submit context */
+#define BLK_FEAT_READ_SYNCHRONOUS	((__force blk_features_t)(1u << 16))
+
 /*
  * Flags automatically inherited when stacking limits.
  */
@@ -1310,6 +1313,11 @@ static inline bool bdev_synchronous(struct block_device *bdev)
 	return bdev->bd_disk->queue->limits.features & BLK_FEAT_SYNCHRONOUS;
 }
 
+static inline bool bdev_read_synchronous(struct block_device *bdev)
+{
+	return bdev->bd_disk->queue->limits.features & BLK_FEAT_READ_SYNCHRONOUS;
+}
+
 static inline bool bdev_stable_writes(struct block_device *bdev)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
-- 
2.45.2


