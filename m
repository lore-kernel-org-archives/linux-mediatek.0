Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753DDC7EE26
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 04:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2v+g4RsngFemUgp6ZfuGfAPF5iAiDBaH/vypSDOymw=; b=UdA3FLnI2OScX9hkmRSCHPHYz2
	H7ZPh23GuGDNTGKO/YhlBmTm6f2r0IEcBvfbA1Yv5vkXjlbzufWzDkxpSR7Rwa4poA1cLlxN/C1+H
	HCYdYsCHfVhFP+wpASIyNYV7FbO3wdW/RkIgetcceR6FKnMwqUzA6tRXx1uFqVHun2xFmZ/hQPqYh
	tkBr95D7+F8zdbHJVYB+9K2ZMELddrCKkrwmMkd2rYu34WmwH1NmkZqbBTJtkjpDg86NpBfFlJtLk
	RdNYI8u1jf9vb1hSVwwKmkgLMpbHZcQN6VI4ggumGtAUQjvbk9AtqLCD+V7gjoKxNHj/BDpC+mFf1
	Mkh36y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbpa-0054Wq-10;
	Wed, 10 May 2023 04:53:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwbpX-0054Tl-1l
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 04:53:37 +0000
X-UUID: 994244feeeee11ed912e1518a6540028-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=J2v+g4RsngFemUgp6ZfuGfAPF5iAiDBaH/vypSDOymw=;
	b=Ub5pWiOk9wIAuw09hEyGzLqMqn4VoDfIVVIHr9VRIX5vAsg8AuhM3zmxuig1Y6K+Nln4gtpd542DduogCzBbm56uyK96E18zXMj8nK6ZjXrRtNqiSIF+/gkQoOuYnicTPUf9f2ek6m2dVKYSx8aEu3zPsiNAo+k3VxYSapvCDmY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:6354a9cd-377e-43f8-a616-961781e0ee49,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:178d4d4,CLOUDID:87a7ad3a-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 994244feeeee11ed912e1518a6540028-20230509
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1437523213; Tue, 09 May 2023 21:53:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 12:53:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 12:53:23 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3 3/6] wifi: mt76: mt7915: rework tx bytes counting when WED is active
Date: Wed, 10 May 2023 12:53:18 +0800
Message-ID: <0f8482ec7ad454df065411a065e6b0a2d4f6da9c.1683670255.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <e3cddf1cff5f060478c2de9e4e4021541549e750.1683670255.git.ryder.lee@mediatek.com>
References: <e3cddf1cff5f060478c2de9e4e4021541549e750.1683670255.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_215335_596657_0C72ADAA 
X-CRM114-Status: GOOD (  15.76  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Concurrent binding/non-binding skbs could be handled anywhere which leads
to mixed byte counting, so switch to use PPDU TxS reporting regardless Tx
paths when WED is active.

Fixes: 43eaa3689507 ("wifi: mt76: add PPDU based TxS support for WED device")
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mac.c  |  2 --
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  6 ++++
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 30 ++-----------------
 drivers/net/wireless/mediatek/mt76/tx.c       |  6 ++++
 4 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index f6346a458978..3501f0503118 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -521,8 +521,6 @@ void mt76_connac2_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 		q_idx = wmm_idx * MT76_CONNAC_MAX_WMM_SETS +
 			mt76_connac_lmac_mapping(skb_get_queue_mapping(skb));
 
-		/* counting non-offloading skbs */
-		wcid->stats.tx_bytes += skb->len;
 		/* mt7915 WA only counts WED path */
 		if (is_mt7915(dev) && mtk_wed_device_active(&dev->mmio.wed))
 			wcid->stats.tx_packets++;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 8d6e09605dc4..30c552a5f920 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -499,6 +499,12 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
 	set = FIELD_PREP(MT_WTBLOFF_TOP_RSCR_RCPI_MODE, 0) |
 	      FIELD_PREP(MT_WTBLOFF_TOP_RSCR_RCPI_PARAM, 0x3);
 	mt76_rmw(dev, MT_WTBLOFF_TOP_RSCR(band), mask, set);
+
+	/* MT_TXD5_TX_STATUS_HOST (MPDU format) has higher priority than
+	 * MT_AGG_ACR_PPDU_TXS2H (PPDU format) even though ACR bit is set.
+	 */
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed))
+		mt76_set(dev, MT_AGG_ACR4(band), MT_AGG_ACR_PPDU_TXS2H);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 45f3558bf31c..2fa059af23de 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -545,8 +545,6 @@ static u32 mt7915_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
 static int mt7915_mmio_wed_offload_enable(struct mtk_wed_device *wed)
 {
 	struct mt7915_dev *dev;
-	struct mt7915_phy *phy;
-	int ret;
 
 	dev = container_of(wed, struct mt7915_dev, mt76.mmio.wed);
 
@@ -554,43 +552,19 @@ static int mt7915_mmio_wed_offload_enable(struct mtk_wed_device *wed)
 	dev->mt76.token_size = wed->wlan.token_start;
 	spin_unlock_bh(&dev->mt76.token_lock);
 
-	ret = wait_event_timeout(dev->mt76.tx_wait,
-				 !dev->mt76.wed_token_count, HZ);
-	if (!ret)
-		return -EAGAIN;
-
-	phy = &dev->phy;
-	mt76_set(dev, MT_AGG_ACR4(phy->mt76->band_idx), MT_AGG_ACR_PPDU_TXS2H);
-
-	phy = dev->mt76.phys[MT_BAND1] ? dev->mt76.phys[MT_BAND1]->priv : NULL;
-	if (phy)
-		mt76_set(dev, MT_AGG_ACR4(phy->mt76->band_idx),
-			 MT_AGG_ACR_PPDU_TXS2H);
-
-	return 0;
+	return !wait_event_timeout(dev->mt76.tx_wait,
+				   !dev->mt76.wed_token_count, HZ);
 }
 
 static void mt7915_mmio_wed_offload_disable(struct mtk_wed_device *wed)
 {
 	struct mt7915_dev *dev;
-	struct mt7915_phy *phy;
 
 	dev = container_of(wed, struct mt7915_dev, mt76.mmio.wed);
 
 	spin_lock_bh(&dev->mt76.token_lock);
 	dev->mt76.token_size = MT7915_TOKEN_SIZE;
 	spin_unlock_bh(&dev->mt76.token_lock);
-
-	/* MT_TXD5_TX_STATUS_HOST (MPDU format) has higher priority than
-	 * MT_AGG_ACR_PPDU_TXS2H (PPDU format) even though ACR bit is set.
-	 */
-	phy = &dev->phy;
-	mt76_clear(dev, MT_AGG_ACR4(phy->mt76->band_idx), MT_AGG_ACR_PPDU_TXS2H);
-
-	phy = dev->mt76.phys[MT_BAND1] ? dev->mt76.phys[MT_BAND1]->priv : NULL;
-	if (phy)
-		mt76_clear(dev, MT_AGG_ACR4(phy->mt76->band_idx),
-			   MT_AGG_ACR_PPDU_TXS2H);
 }
 
 static void mt7915_mmio_wed_release_rx_buf(struct mtk_wed_device *wed)
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 72b3ec715e47..99d395bd1bba 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -121,6 +121,7 @@ int
 mt76_tx_status_skb_add(struct mt76_dev *dev, struct mt76_wcid *wcid,
 		       struct sk_buff *skb)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct mt76_tx_cb *cb = mt76_tx_skb_cb(skb);
 	int pid;
@@ -133,6 +134,11 @@ mt76_tx_status_skb_add(struct mt76_dev *dev, struct mt76_wcid *wcid,
 	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
 		return MT_PACKET_ID_NO_ACK;
 
+	if (mtk_wed_device_active(&dev->mmio.wed) &&
+	    ((info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) ||
+	      ieee80211_is_data(hdr->frame_control)))
+		return MT_PACKET_ID_WED;
+
 	if (!(info->flags & (IEEE80211_TX_CTL_REQ_TX_STATUS |
 			     IEEE80211_TX_CTL_RATE_CTRL_PROBE)))
 		return MT_PACKET_ID_NO_SKB;
-- 
2.18.0


