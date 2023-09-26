Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D753E7F140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wh7XXbbE9dPhO5x00gz66x2RM9r1g2P9zNdBAYceaHc=; b=AbE34sC0AT5n+ooD2ZPdHl9xmu
	owTOmG6p1B/0ncHNxUROiTMAkc460BvtIXtDp0nIjZwG0hM0bj854e7Run5ODYUBvTwmIZt2oALTO
	N2MvE4RcJaNZdjiz/UMz74+QuSOaD7PSSFLFAqeBMyYycvu+VZYTpViQaWQ0OEVLsAmCkA7hQMV2p
	y/p0VmBaW6SgdLWKI3i7qgcCppSHnRs5rPZhQlmosSFVqyIV7661PEEONbwKi7St0u9faxCMych7F
	D0SIG2V0KRAR1ecxlcGEACpTcXpLi9uJ6QPfevqSctlsnbFdBmXR+pqpHbTKjWYPZ01ywLmoo49v8
	EmIIiNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlGQa-00H6cV-37;
	Tue, 26 Sep 2023 22:21:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlGQW-00H6bo-35
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 22:21:10 +0000
X-UUID: f92ed4b05cba11ee86758d4a7c00f3a0-20230926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wh7XXbbE9dPhO5x00gz66x2RM9r1g2P9zNdBAYceaHc=;
	b=CQdhlxEQ0/08MAcm7FY+C22YAfc8PZmuiWZd3xltME52oH0vYu3TvqDzy05BeCBQa/BYJUg42tz2Xt8xd88M+Tci69b6DXaa+jcgH6RB7Ptcp5yly5CfpPBHXttkyKrisXaEj7rBPD3XzN+R5P2NuhD1VdqVFLdY9UMHryHdQnQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:fd701016-3ae2-48e1-ab60-91de9e48b8ea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:3d2b4ebf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f92ed4b05cba11ee86758d4a7c00f3a0-20230926
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1832950793; Tue, 26 Sep 2023 15:21:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Sep 2023 06:20:26 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Sep 2023 06:20:26 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <jsiuda@google.com>, <arowa@google.org>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] wifi: mt76: reduce spin_lock_bh held up in mt76_dma_rx_cleanup
Date: Wed, 27 Sep 2023 06:20:25 +0800
Message-ID: <4983e1bf8f5e707a67bf6b04a0cbdce359110f48.1695766375.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_152108_999503_9D7CDA1E 
X-CRM114-Status: GOOD (  12.73  )
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

From: Sean Wang <sean.wang@mediatek.com>

mt76_dma_rx_cleanup would be frequenetly called up to reset the dma rings
to be freshed as new ones when switching back from the deep sleep mode to
the active mode on mt7921 and mt7922.

Shrink the scope of spin_lock_bh in mt76_dma_rx_cleanup being held up
to allow the kernel scheduler to be able to switch other tasks in time
by reducing the latency.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 643e18ebb5ee..5f31d4d6a640 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -739,16 +739,18 @@ mt76_dma_rx_cleanup(struct mt76_dev *dev, struct mt76_queue *q)
 	if (!q->ndesc)
 		return;
 
-	spin_lock_bh(&q->lock);
-
 	do {
+		spin_lock_bh(&q->lock);
 		buf = mt76_dma_dequeue(dev, q, true, NULL, NULL, &more, NULL);
+		spin_unlock_bh(&q->lock);
+
 		if (!buf)
 			break;
 
 		mt76_put_page_pool_buf(buf, false);
 	} while (1);
 
+	spin_lock_bh(&q->lock);
 	if (q->rx_head) {
 		dev_kfree_skb(q->rx_head);
 		q->rx_head = NULL;
-- 
2.25.1


