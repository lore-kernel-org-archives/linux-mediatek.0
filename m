Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F651C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnuS+Hq/T4esGhgBt9mdLBUR0LzXMJ9FEJUPx0UEiiA=; b=Sps9+jH8G4+4VI
	1Qwl4zt7iDMc4y+eZ+HAGqnCHXjc86vNVFfi8lvXBXr1uZW9h89t7pfrlX9kD4KGfTII5/boXY4nx
	2ovDdXWU+m7pQ3AluRIT26EW+qP8QhXfrYaeezBXX7OpoTIaC9Usho+e4nzQzN4LzxZEHgInbCzCj
	YgFQ80Y2lR2ffj6DxU8pEuPPtjexRP12CZPeH7/x+1J9hWauVBOpVuWfKuCbvGGGr2F/X9OaS93qI
	dru+pLt+8tzfWJypvOT2XbGZJsgZvNixqpqdBZldDN56ZUGaNXXW7LofggH2DAcOK+FgfG1xGGDXY
	K3Zd0zUaDXuEygQzEVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPRDi-003DpU-Vx; Wed, 02 Mar 2022 15:48:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPRDf-003DlU-EQ
 for linux-mediatek@lists.infradead.org; Wed, 02 Mar 2022 15:48:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15F61B8208B;
 Wed,  2 Mar 2022 15:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE99C340F1;
 Wed,  2 Mar 2022 15:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646236129;
 bh=Siws3O4zUaQ+2UN3PU4ZrA1nA+JgT7ZP/IiyqQZ47so=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kfkt2X7eZhhIiDw/4Do4y9+0zU3Y4w3l8YQa0rc039mSRMBsOoHg7D2lcXVIiVhhZ
 65WVE3Tcdz+SpmvZZml0reZn/i+FEmWwtNAbB69d5ykVN61W65JcUVFbgzvWqHYvXp
 iED0CROluy3TeJMLHPkWo5v/W5KpbguWBLNqV8xmnacXRjiR1BsCTV/Pn9IFcfBQhM
 YoTnhu+RS2puHu+7oUAmKI+XvbRRMihmh7WcWcxOt8RfFTOUFLhSXWdZ/KjGrSlCbk
 H+IN4Vf9EhnAEFePY501q+6cF3oO/0revCOXPHYHo4wrtcETFCHEmodIF/8ZyMjVp3
 bArb8pCwHDyAQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 7/9] mt76: mt7921: move mt7921_usb_sdio_tx_complete_skb in
 common mac code.
Date: Wed,  2 Mar 2022 16:48:11 +0100
Message-Id: <c71bbc27e77315d8863fe9c8bd70ac955718a59e.1646235785.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646235785.git.lorenzo@kernel.org>
References: <cover.1646235785.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_074851_862198_96E3DE98 
X-CRM114-Status: GOOD (  12.88  )
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
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 21 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  3 ++-
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  2 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  | 19 -----------------
 4 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 4652ec2985be..b11c4eb8fdb7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1688,3 +1688,24 @@ int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	return err;
 }
 EXPORT_SYMBOL_GPL(mt7921_usb_sdio_tx_prepare_skb);
+
+void mt7921_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
+				     struct mt76_queue_entry *e)
+{
+	__le32 *txwi = (__le32 *)(e->skb->data + MT_SDIO_HDR_SIZE);
+	unsigned int headroom = MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
+	struct ieee80211_sta *sta;
+	struct mt76_wcid *wcid;
+	u16 idx;
+
+	idx = FIELD_GET(MT_TXD1_WLAN_IDX, le32_to_cpu(txwi[1]));
+	wcid = rcu_dereference(mdev->wcid[idx]);
+	sta = wcid_to_sta(wcid);
+
+	if (sta && likely(e->skb->protocol != cpu_to_be16(ETH_P_PAE)))
+		mt7921_tx_check_aggr(sta, txwi);
+
+	skb_pull(e->skb, headroom);
+	mt76_tx_complete_skb(mdev, e->wcid, e->skb);
+}
+EXPORT_SYMBOL_GPL(mt7921_usb_sdio_tx_complete_skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 9bd281de2854..edd3c5938035 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -445,7 +445,6 @@ int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_init(struct mt7921_dev *dev);
 int mt7921s_mcu_drv_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev);
-void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
 bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
 void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
 void mt7921_set_runtime_pm(struct mt7921_dev *dev);
@@ -454,4 +453,6 @@ int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				   enum mt76_txq_id qid, struct mt76_wcid *wcid,
 				   struct ieee80211_sta *sta,
 				   struct mt76_tx_info *tx_info);
+void mt7921_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
+				     struct mt76_queue_entry *e);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index fc6499640a1c..507bd550b063 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -92,7 +92,7 @@ static int mt7921s_probe(struct sdio_func *func,
 				SURVEY_INFO_TIME_RX |
 				SURVEY_INFO_TIME_BSS_RX,
 		.tx_prepare_skb = mt7921_usb_sdio_tx_prepare_skb,
-		.tx_complete_skb = mt7921s_tx_complete_skb,
+		.tx_complete_skb = mt7921_usb_sdio_tx_complete_skb,
 		.tx_status_data = mt7921s_tx_status_data,
 		.rx_skb = mt7921_queue_rx_skb,
 		.sta_ps = mt7921_sta_ps,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index e039b1bd16a4..fa9db21bb3e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -141,25 +141,6 @@ int mt7921s_mac_reset(struct mt7921_dev *dev)
 	return err;
 }
 
-void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e)
-{
-	__le32 *txwi = (__le32 *)(e->skb->data + MT_SDIO_HDR_SIZE);
-	unsigned int headroom = MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
-	struct ieee80211_sta *sta;
-	struct mt76_wcid *wcid;
-	u16 idx;
-
-	idx = FIELD_GET(MT_TXD1_WLAN_IDX, le32_to_cpu(txwi[1]));
-	wcid = rcu_dereference(mdev->wcid[idx]);
-	sta = wcid_to_sta(wcid);
-
-	if (sta && likely(e->skb->protocol != cpu_to_be16(ETH_P_PAE)))
-		mt7921_tx_check_aggr(sta, txwi);
-
-	skb_pull(e->skb, headroom);
-	mt76_tx_complete_skb(mdev, e->wcid, e->skb);
-}
-
 bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update)
 {
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
