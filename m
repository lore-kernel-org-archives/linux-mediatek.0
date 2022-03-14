Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE46C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBq4WSDJ2uW7OW4IxQllrTC0rHs4DkOpLU5W4OjcJpQ=; b=yD8GQwEzNaCRLz
	vp6+MKATnyXrSew0mjqmoJpAzSUPDktoV/xRbUWrM13FEJ4+I3u6ZtQuKq8o67VoUl2mNmABxI4yv
	XznWOXd89TXWoZmZSFeXggFCwEgyGHGV6IpJWFS7a2O/WPwTFYhaOsrWjD798StqZAUmXgbMoqWgs
	51n1o8ZUpPu48KErfe9HnK3g+88YT7JSXzam6IWCqnWHFsBtek4fWww5pNLwuYT8ec5nywBsq//iO
	X9756vYHe84ZbY7glmJO/oYGG6ssdKKFYo7db0mibz9ah9tof+oocnOOlfLsLNt9bS6Mzd5HhcoRE
	B22NJO87nB5M4++JB90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTmLm-005mMi-EG; Mon, 14 Mar 2022 15:11:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTmLi-005mJP-Mx
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 15:11:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E9F0B80E4E;
 Mon, 14 Mar 2022 15:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3299C340EC;
 Mon, 14 Mar 2022 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647270664;
 bh=pomHZCI1jTvGq81oYz6HEuxGrxQdT2oYPA4Rpcrpg7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TfDxXcyidcTSg9Ldz967S6vUZQYEpXy5dtNLq49bXtjBc6pxsVqjlDy+wjEBrNwVq
 rG5p5kE77F5IQ9cW/shUJCfBFQoeiwqMqA5/jpKkkuUzW1gklR4zHCw78f1qXFSmPh
 3ZWBQOJrfosLH7sbo44VzD7Sv49hy7yGzpp5DSuWcS4C6QBTZ+818F0q88cYX9Kh62
 bGE7OhQzFqBMrfa2e7FvTrDRnAkJIrRiRHPgTiXetwDtAHWWGEvLn/E2EuaBCRf8eL
 hbvvQkAXr4i3FZEfDuFZkjckOZsjzjymcu9Vdq95YIq6Ajysfnl1ympN6rOS6Gci63
 02FH7dKi0CMNQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 6/9] mt76: mt7921: move mt7921_usb_sdio_tx_prepare_skb in
 common mac code
Date: Mon, 14 Mar 2022 16:10:28 +0100
Message-Id: <d1844479f538310badb0f4cd3a6d55c22b5b2423.1647270525.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647270525.git.lorenzo@kernel.org>
References: <cover.1647270525.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_081107_089559_FE50F7B0 
X-CRM114-Status: GOOD (  15.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a preliminary patch to add mt7921u driver support.

Tested-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 58 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  9 +--
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  2 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  | 53 -----------------
 4 files changed, 64 insertions(+), 58 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 8bd8b4fe1047..dd1a241c45d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1622,3 +1622,61 @@ void mt7921_coredump_work(struct work_struct *work)
 
 	mt7921_reset(&dev->mt76);
 }
+
+/* usb_sdio */
+static void
+mt7921_usb_sdio_write_txwi(struct mt7921_dev *dev, struct mt76_wcid *wcid,
+			   enum mt76_txq_id qid, struct ieee80211_sta *sta,
+			   struct ieee80211_key_conf *key, int pid,
+			   struct sk_buff *skb)
+{
+	__le32 *txwi = (__le32 *)(skb->data - MT_SDIO_TXD_SIZE);
+
+	memset(txwi, 0, MT_SDIO_TXD_SIZE);
+	mt7921_mac_write_txwi(dev, txwi, skb, wcid, key, pid, false);
+	skb_push(skb, MT_SDIO_TXD_SIZE);
+}
+
+int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
+				   enum mt76_txq_id qid, struct mt76_wcid *wcid,
+				   struct ieee80211_sta *sta,
+				   struct mt76_tx_info *tx_info)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
+	struct ieee80211_key_conf *key = info->control.hw_key;
+	struct sk_buff *skb = tx_info->skb;
+	int err, pad, pktid, type;
+
+	if (unlikely(tx_info->skb->len <= ETH_HLEN))
+		return -EINVAL;
+
+	if (!wcid)
+		wcid = &dev->mt76.global_wcid;
+
+	if (sta) {
+		struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
+
+		if (time_after(jiffies, msta->last_txs + HZ / 4)) {
+			info->flags |= IEEE80211_TX_CTL_REQ_TX_STATUS;
+			msta->last_txs = jiffies;
+		}
+	}
+
+	pktid = mt76_tx_status_skb_add(&dev->mt76, wcid, skb);
+	mt7921_usb_sdio_write_txwi(dev, wcid, qid, sta, key, pktid, skb);
+
+	type = mt76_is_sdio(mdev) ? MT7921_SDIO_DATA : 0;
+	mt7921_skb_add_usb_sdio_hdr(dev, skb, type);
+	pad = round_up(skb->len, 4) - skb->len;
+	if (mt76_is_usb(mdev))
+		pad += 4;
+
+	err = mt76_skb_adjust_pad(skb, pad);
+	if (err)
+		/* Release pktid in case of error. */
+		idr_remove(&wcid->pktid, pktid);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mt7921_usb_sdio_tx_prepare_skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 39ad75af988c..06db3e1f39a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -444,14 +444,15 @@ int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_init(struct mt7921_dev *dev);
 int mt7921s_mcu_drv_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev);
-int mt7921s_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
-			   enum mt76_txq_id qid, struct mt76_wcid *wcid,
-			   struct ieee80211_sta *sta,
-			   struct mt76_tx_info *tx_info);
 void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
 bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
 void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
 void mt7921_set_runtime_pm(struct mt7921_dev *dev);
 int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 			   bool enable);
+
+int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
+				   enum mt76_txq_id qid, struct mt76_wcid *wcid,
+				   struct ieee80211_sta *sta,
+				   struct mt76_tx_info *tx_info);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index a6ae29c97e0e..fc6499640a1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -91,7 +91,7 @@ static int mt7921s_probe(struct sdio_func *func,
 		.survey_flags = SURVEY_INFO_TIME_TX |
 				SURVEY_INFO_TIME_RX |
 				SURVEY_INFO_TIME_BSS_RX,
-		.tx_prepare_skb = mt7921s_tx_prepare_skb,
+		.tx_prepare_skb = mt7921_usb_sdio_tx_prepare_skb,
 		.tx_complete_skb = mt7921s_tx_complete_skb,
 		.tx_status_data = mt7921s_tx_status_data,
 		.rx_skb = mt7921_queue_rx_skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index 248d3f3cdb08..d741a58c1260 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -141,59 +141,6 @@ int mt7921s_mac_reset(struct mt7921_dev *dev)
 	return err;
 }
 
-static void
-mt7921s_write_txwi(struct mt7921_dev *dev, struct mt76_wcid *wcid,
-		   enum mt76_txq_id qid, struct ieee80211_sta *sta,
-		   struct ieee80211_key_conf *key, int pid,
-		   struct sk_buff *skb)
-{
-	__le32 *txwi = (__le32 *)(skb->data - MT_SDIO_TXD_SIZE);
-
-	memset(txwi, 0, MT_SDIO_TXD_SIZE);
-	mt7921_mac_write_txwi(dev, txwi, skb, wcid, key, pid, false);
-	skb_push(skb, MT_SDIO_TXD_SIZE);
-}
-
-int mt7921s_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
-			   enum mt76_txq_id qid, struct mt76_wcid *wcid,
-			   struct ieee80211_sta *sta,
-			   struct mt76_tx_info *tx_info)
-{
-	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
-	struct ieee80211_key_conf *key = info->control.hw_key;
-	struct sk_buff *skb = tx_info->skb;
-	int err, pad, pktid;
-
-	if (unlikely(tx_info->skb->len <= ETH_HLEN))
-		return -EINVAL;
-
-	if (!wcid)
-		wcid = &dev->mt76.global_wcid;
-
-	if (sta) {
-		struct mt7921_sta *msta = (struct mt7921_sta *)sta->drv_priv;
-
-		if (time_after(jiffies, msta->last_txs + HZ / 4)) {
-			info->flags |= IEEE80211_TX_CTL_REQ_TX_STATUS;
-			msta->last_txs = jiffies;
-		}
-	}
-
-	pktid = mt76_tx_status_skb_add(&dev->mt76, wcid, skb);
-	mt7921s_write_txwi(dev, wcid, qid, sta, key, pktid, skb);
-
-	mt7921_skb_add_usb_sdio_hdr(dev, skb, MT7921_SDIO_DATA);
-	pad = round_up(skb->len, 4) - skb->len;
-
-	err = mt76_skb_adjust_pad(skb, pad);
-	if (err)
-		/* Release pktid in case of error. */
-		idr_remove(&wcid->pktid, pktid);
-
-	return err;
-}
-
 void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e)
 {
 	__le32 *txwi = (__le32 *)(e->skb->data + MT_SDIO_HDR_SIZE);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
