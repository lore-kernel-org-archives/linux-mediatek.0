Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3433DC44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nd9R7pzCUtLZPwwIvxP5DkpQqu2Y3+lqlCBrszORcZ0=; b=2P54j9ubqWtqvnwtKfcBEvLomO
	L+WOldeO47o/WhBsSrFA41wYCXw3ioKkuS5GYIuuWALP+Xht3PBDp85cZFa4yzI8f+38/NeMadUnq
	487q6fgYhEEDe15vDExX7lyrQWBIfwKuweoR9lKerAkMisxGyjUiK0pITN6ytl5Z03a9GNCvnmxHl
	FFBCxN17jbBcCbTBqrCJzk2isVZWhle0K4RMGgmzYlgLxeFdONFj+pIig5OxTcaDN5+YzGpwvNott
	HEvpW01aNUwl8ob89LwyZi3IYgO2CIM5qWhCW2/+xJ2f1tkg6uC8WMJqb6a1eFAFEkfluo+myliyU
	jxggZAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjcR-00000001MjX-0afx;
	Thu, 09 Jul 2026 07:56:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjcM-00000001Mgi-49OR
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 07:56:24 +0000
X-UUID: a958ffd87b6b11f1afed4741b24580c9-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nd9R7pzCUtLZPwwIvxP5DkpQqu2Y3+lqlCBrszORcZ0=;
	b=OLHl2lwpEQkUYoWKag4vmwV8NbbPj6kFp8aD+UxDqGhZYe6ozQOH5KagOw6MgIRQOcf8ldRMpMP6hDt2oDskEEmkw9zzgvm27wFy1PzHU4VoLGQcyBjWx4n077GsM9c+DHB2ZpA1hOfKrFEOMw3HT1bACAYseSdWkcdzwT4zzKs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:d8bd1d51-583e-4c5e-b842-3d676c1fc278,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:61dea303-430e-43d5-9a6c-19a994ddbd60,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a958ffd87b6b11f1afed4741b24580c9-20260709
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1371453926; Thu, 09 Jul 2026 00:56:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 15:56:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 15:56:13 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Yf.Luo@mediatek.com>, <kun.wu@mediatek.com>, <deren.wu@mediatek.com>,
	<sean.wang@mediatek.com>, <quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>,
	<leon.yen@mediatek.com>, <litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.lai@mediatek.com>, Eason Lai <Eason.Lai@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: Separate skb and page_pool_buf pointers in mt76_txwi_cache
Date: Thu, 9 Jul 2026 15:55:56 +0800
Message-ID: <20260709075558.1654164-2-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260709075558.1654164-1-eason.lai@mediatek.com>
References: <20260709075558.1654164-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_005623_055957_C517AEBA 
X-CRM114-Status: GOOD (  15.83  )
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

From: Eason Lai <Eason.Lai@mediatek.com>

Refactor mt76_txwi_cache structure to use separate skb and page_pool_buf
fields instead of a union with ptr. This improves type safety and makes
the code more explicit about which pointer type is being used in
different contexts.

Also add skip_unmap flag to tx_info.buf to handle cases where DMA
unmapping should be skipped.

Signed-off-by: Eason Lai <Eason.Lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c      | 29 ++++++++++++-------
 drivers/net/wireless/mediatek/mt76/mt76.h     |  4 +--
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 10 +++----
 drivers/net/wireless/mediatek/mt76/tx.c       |  2 +-
 drivers/net/wireless/mediatek/mt76/wed.c      |  6 ++--
 5 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f8c2fe5f2f58..2716278788bd 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -43,7 +43,8 @@ mt76_alloc_rxwi(struct mt76_dev *dev)
 	if (!t)
 		return NULL;
 
-	t->ptr = NULL;
+	t->skb = NULL;
+	t->page_pool_buf = NULL;
 	return t;
 }
 
@@ -84,8 +85,11 @@ mt76_get_txwi(struct mt76_dev *dev)
 {
 	struct mt76_txwi_cache *t = __mt76_get_txwi(dev);
 
-	if (t)
+	if (t) {
+		t->skb = NULL;
+		t->page_pool_buf = NULL;
 		return t;
+	}
 
 	return mt76_alloc_txwi(dev);
 }
@@ -147,8 +151,8 @@ mt76_free_pending_rxwi(struct mt76_dev *dev)
 
 	local_bh_disable();
 	while ((t = __mt76_get_rxwi(dev)) != NULL) {
-		if (t->ptr)
-			mt76_put_page_pool_buf(t->ptr, false);
+		if (t->page_pool_buf)
+			mt76_put_page_pool_buf(t->page_pool_buf, false);
 		kfree(t);
 	}
 	local_bh_enable();
@@ -475,14 +479,14 @@ mt76_dma_get_rxdmad_c_buf(struct mt76_dev *dev, struct mt76_queue *q,
 	if (more)
 		*more = !FIELD_GET(RRO_RXDMAD_DATA1_LS_MASK, data1);
 
-	buf = t->ptr;
+	buf = t->page_pool_buf;
 	ind_reason = FIELD_GET(RRO_RXDMAD_DATA2_IND_REASON_MASK, data2);
 	if (ind_reason == MT_DMA_WED_IND_REASON_REPEAT ||
 	    ind_reason == MT_DMA_WED_IND_REASON_OLDPKT) {
 		mt76_put_page_pool_buf(buf, false);
 		buf = ERR_PTR(-EAGAIN);
 	}
-	t->ptr = NULL;
+	t->page_pool_buf = NULL;
 	t->dma_addr = 0;
 
 	mt76_put_rxwi(dev, t);
@@ -529,9 +533,9 @@ mt76_dma_get_buf(struct mt76_dev *dev, struct mt76_queue *q, int idx,
 				SKB_WITH_OVERHEAD(q->buf_size),
 				page_pool_get_dma_dir(q->page_pool));
 
-		buf = t->ptr;
+		buf = t->page_pool_buf;
 		t->dma_addr = 0;
-		t->ptr = NULL;
+		t->page_pool_buf = NULL;
 
 		mt76_put_rxwi(dev, t);
 		if (drop)
@@ -694,6 +698,7 @@ mt76_dma_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 			goto unmap;
 
 		tx_info.buf[n].addr = addr;
+		tx_info.buf[n].skip_unmap = false;
 		tx_info.buf[n++].len = iter->len;
 	}
 	tx_info.nbuf = n;
@@ -718,9 +723,11 @@ mt76_dma_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 				tx_info.info, tx_info.skb, t);
 
 unmap:
-	for (n--; n > 0; n--)
-		dma_unmap_single(dev->dma_dev, tx_info.buf[n].addr,
-				 tx_info.buf[n].len, DMA_TO_DEVICE);
+	for (n--; n > 0; n--) {
+		if (!tx_info.buf[n].skip_unmap)
+			dma_unmap_single(dev->dma_dev, tx_info.buf[n].addr,
+					 tx_info.buf[n].len, DMA_TO_DEVICE);
+	}
 
 free:
 #ifdef CONFIG_NL80211_TESTMODE
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 527bef97e122..927c21536f4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -445,10 +445,8 @@ struct mt76_txwi_cache {
 	struct list_head list;
 	dma_addr_t dma_addr;
 
-	union {
 		struct sk_buff *skb;
-		void *ptr;
-	};
+	void *page_pool_buf;
 
 	u8 qid;
 	u8 phy_idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index e2a83da3a09c..924b0dc0ff1e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1775,12 +1775,12 @@ static void mt7996_rx_token_put(struct mt7996_dev *dev)
 		struct mt76_txwi_cache *t;
 
 		t = mt76_rx_token_release(&dev->mt76, i);
-		if (!t || !t->ptr)
+		if (!t || !t->page_pool_buf)
 			continue;
 
-		mt76_put_page_pool_buf(t->ptr, false);
+		mt76_put_page_pool_buf(t->page_pool_buf, false);
 		t->dma_addr = 0;
-		t->ptr = NULL;
+		t->page_pool_buf = NULL;
 
 		mt76_put_rxwi(&dev->mt76, t);
 	}
@@ -1928,14 +1928,14 @@ void mt7996_rro_rx_process(struct mt76_dev *mdev, void *data)
 				goto next_page;
 
 			qid = t->qid;
-			buf = t->ptr;
+			buf = t->page_pool_buf;
 			q = &mdev->q_rx[qid];
 			dma_sync_single_for_cpu(mdev->dma_dev, t->dma_addr,
 						SKB_WITH_OVERHEAD(q->buf_size),
 						page_pool_get_dma_dir(q->page_pool));
 
 			t->dma_addr = 0;
-			t->ptr = NULL;
+			t->page_pool_buf = NULL;
 			mt76_put_rxwi(mdev, t);
 			if (!buf)
 				goto next_page;
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 22f9690634c9..665156a7ea65 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -899,7 +899,7 @@ int mt76_rx_token_consume(struct mt76_dev *dev, void *ptr,
 	token = idr_alloc(&dev->rx_token, t, 0, dev->rx_token_size,
 			  GFP_ATOMIC);
 	if (token >= 0) {
-		t->ptr = ptr;
+		t->page_pool_buf = ptr;
 		t->dma_addr = phys;
 	}
 	spin_unlock_bh(&dev->rx_token_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/wed.c b/drivers/net/wireless/mediatek/mt76/wed.c
index ed657d952de2..e1cf81d722b8 100644
--- a/drivers/net/wireless/mediatek/mt76/wed.c
+++ b/drivers/net/wireless/mediatek/mt76/wed.c
@@ -15,11 +15,11 @@ void mt76_wed_release_rx_buf(struct mtk_wed_device *wed)
 		struct mt76_txwi_cache *t;
 
 		t = mt76_rx_token_release(dev, i);
-		if (!t || !t->ptr)
+		if (!t || !t->page_pool_buf)
 			continue;
 
-		mt76_put_page_pool_buf(t->ptr, false);
-		t->ptr = NULL;
+		mt76_put_page_pool_buf(t->page_pool_buf, false);
+		t->page_pool_buf = NULL;
 
 		mt76_put_rxwi(dev, t);
 	}
-- 
2.45.2


