Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52742D5C0C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CuHDA2MV+hxzyPXQmomjbbSPnFoUK+qEfMGB6jwT/28=; b=d90K13EmqDuEj6XTg6kIJ/Hu3Y
	WT2NLJSivfjrkko5e1PCfZ0PlsAVTeScfI63zwEy4d5W1hwDeg7bXUtlaO8dDG0oBsB8Y6DN28s3k
	cIaGV1pMKWzMSPF1Kfe/Sm9HzLVRuabgfA0Sqe9nXcIDPMNhQMDawIOh4whEQz28a3jahScTxJVAJ
	UObKfqXNYL9JCGYfk4F05VnwbWl9In4yPfAlm+yRXx+zF7FGS80WoU1mjkkgvBpnf96CLsh0L7Can
	c7qSshG6ZaP6jOEAdK9h54RMrf27no5bbBX5Q/6jXDkgQ2CuL3lvf7Lf0v3HpC+UGtaWNqiusKTRU
	roC7gy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ObJ-0000000AbdX-3DO6;
	Fri, 08 Nov 2024 13:00:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ObG-0000000Abbk-3TCT
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Nov 2024 13:00:32 +0000
X-UUID: 6ac644b69dd111ef9048ed6ed365623b-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CuHDA2MV+hxzyPXQmomjbbSPnFoUK+qEfMGB6jwT/28=;
	b=B575EoUZtVNyyJp3aE4MHn2Q8Pl36TWzveuvrbg5T1YGY5dgWQEIfiKTE07f+ouYOhVjcqafSHrvDC/mci1Vl68mFzh0LHEEY8u7QIkpN29/t/Hzf95YXJJbDLDiH1VVsJsvDmHfVwx7wj6TdGLN62H91VWjVPIkK/eOtM7bifs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:6b040827-2fce-4eb8-96c3-a7a50f93e9ce,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:c35fd81b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6ac644b69dd111ef9048ed6ed365623b-20241108
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <quan.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486017186; Fri, 08 Nov 2024 06:00:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 05:00:21 -0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 21:00:20 +0800
From: Quan Zhou <quan.zhou@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	Leon Yen <Leon.Yen@mediatek.com>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Allan Wang <allan.wang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Shengxi Xu
	<shengxi.xu@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Quan Zhou <quan.zhou@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix interference with kernel scheduler
Date: Fri, 8 Nov 2024 20:59:40 +0800
Message-ID: <57c68a7ce1dd9022fa5e06af2c53d6313f30ec83.1731069062.git.quan.zhou@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_050030_898247_EF1ACBFA 
X-CRM114-Status: GOOD (  11.44  )
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

In dma init or reset scene, need alloc buffer for all
rx ring unit, this is a time-consuming process. In fact,
a spinlock is not needed in these scenarios, add a new
API mt76_dma_rx_fill_buf which does not use a spinlock to
resolve this interference issue.

Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Reviewed-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 5f46d6daeaa7..844af16ee551 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -631,7 +631,8 @@ mt76_dma_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	return ret;
 }
 
-int mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q,
+static int
+mt76_dma_rx_fill_buf(struct mt76_dev *dev, struct mt76_queue *q,
 		     bool allow_direct)
 {
 	int len = SKB_WITH_OVERHEAD(q->buf_size);
@@ -640,8 +641,6 @@ int mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q,
 	if (!q->ndesc)
 		return 0;
 
-	spin_lock_bh(&q->lock);
-
 	while (q->queued < q->ndesc - 1) {
 		struct mt76_queue_buf qbuf = {};
 		enum dma_data_direction dir;
@@ -674,6 +673,19 @@ int mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q,
 	if (frames || mt76_queue_is_wed_rx(q))
 		mt76_dma_kick_queue(dev, q);
 
+	return frames;
+}
+
+int mt76_dma_rx_fill(struct mt76_dev *dev, struct mt76_queue *q,
+		     bool allow_direct)
+{
+	int frames;
+
+	if (!q->ndesc)
+		return 0;
+
+	spin_lock_bh(&q->lock);
+	frames = mt76_dma_rx_fill_buf(dev, q, allow_direct);
 	spin_unlock_bh(&q->lock);
 
 	return frames;
@@ -796,7 +808,7 @@ mt76_dma_rx_reset(struct mt76_dev *dev, enum mt76_rxq_id qid)
 		return;
 
 	mt76_dma_sync_idx(dev, q);
-	mt76_dma_rx_fill(dev, q, false);
+	mt76_dma_rx_fill_buf(dev, q, false);
 }
 
 static void
@@ -969,7 +981,7 @@ mt76_dma_init(struct mt76_dev *dev,
 
 	mt76_for_each_q_rx(dev, i) {
 		netif_napi_add(dev->napi_dev, &dev->napi[i], poll);
-		mt76_dma_rx_fill(dev, &dev->q_rx[i], false);
+		mt76_dma_rx_fill_buf(dev, &dev->q_rx[i], false);
 		napi_enable(&dev->napi[i]);
 	}
 
-- 
2.46.0


