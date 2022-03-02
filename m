Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B96C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGfcGkLGxlsoBK8fDXm9o+OQz/ZKQfPs1IowNg8B+24=; b=onCUmsTJSG5WdZ
	gLcQp7wp6LTjPVFnz/hlWkJmgBkRTtsV6hdJZOgbaPcGuaD6g51QxnEhdBQWQmDobfNp9mp4BdGod
	YCHyUZ8+3EELVef2OYplh4tTNes6AZUgccHz93+dtc+Jxfb7ykpOUYi2xkWZQgFTkrLqFNmA+mIl+
	5uukkC7GK79X3Z8XAXGdhmnCgS1nb4ox0l0dtGbKdTmKyDpUfCqwNurLPJKOudFVwxkCl8ey7lA61
	XPyEwz3EceUCGz0ThUo23pOGrW2I1CdrhE6pTtK5mIPItOEK9S4GJvyCj0yYCoGnvVvdiBLBt4/p8
	Ly3LPUNPpSWt/m/2go9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPRDg-003DnI-Rd; Wed, 02 Mar 2022 15:48:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPRDd-003Dja-BK
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 15:48:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F298EB81F2D;
 Wed,  2 Mar 2022 15:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B933C340ED;
 Wed,  2 Mar 2022 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646236127;
 bh=ID/JqgSoy0vJ4IGhJND/usGmmDfObdI6gG2D2LCJBCI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZB1XaH6tMaNBT+gYfDtgm1FBERdi3jdDj0laogkS7nXh8cJI8FXtFrpvM214xz8uw
 4ttHR6nj1Hayc09bCxu5DQCf77IrVFdQpQ40tZ5liVsjg6zjINMVtjP8zo4PRLRBA1
 av5LBKIpV7oGnaP+iovGhxN1ZH7BpfGELoynaegoTBPZd3B93Qhss3LHt/nrR7NQsh
 +zMRfutGxT5MuYV0Agl2vViyXoX4MXquDcZbHEcBeLbS7Mk2aYkFQyxqHJJhc2Kxfb
 wVKtPcFtUKOhnjVFxCyssxkCicyfuiOpHTZdkcplvpXnPcUy5yYYJChvr5/NLf41xy
 bcfRzefWfHJtQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 6/9] mt76: mt7921: move mt7921_usb_sdio_tx_prepare_skb in
 common mac code
Date: Wed,  2 Mar 2022 16:48:10 +0100
Message-Id: <f9c9202376f64f16eb7a7dd83de7acc3d7592cb1.1646235785.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646235785.git.lorenzo@kernel.org>
References: <cover.1646235785.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_074849_737395_D0073120 
X-CRM114-Status: GOOD (  15.91  )
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

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 58 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  9 +--
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  2 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  | 53 -----------------
 4 files changed, 64 insertions(+), 58 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index ab9acdf6cd74..4652ec2985be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1630,3 +1630,61 @@ void mt7921_coredump_work(struct work_struct *work)
 
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
index 3c7ff09a36ac..9bd281de2854 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -445,12 +445,13 @@ int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev);
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
index 5462ab05fb13..e039b1bd16a4 100644
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
