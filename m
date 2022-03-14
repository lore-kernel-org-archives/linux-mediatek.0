Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A30C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QX/DMvLAPDMB+I84BltWhktsNm21GYHZD6fCX55NGMo=; b=qmy19XatDYUn4G
	Bvkrtpgt1wZ8DpcucfmEZZTHhoJDoHWe0zhb3vcnZNWi+Z9MG9l4okD22NtKddfvGupF48AxLK5mQ
	06DUGxI6fIoxmTBr3NCICuebEDQWQ+lD4CFzDNtpVBN2YmM0xHZC2Zex4ZbOQIsMOvzlHFAvTtI2l
	07D4ZxmlfeKrKelWnK5S4htZIJ9Tq9R7v92nHUPLw+7Ifb0fmdL0pMoGyG7esTKS1z/nj8BzDFtOO
	SXoTLLLmYAkXB2Oxit9YM5UvKGGRmyg2v3TsGOPe9b+0WFdRGGEWWleJ5SjdQD0ZPKT7H1Ux3/dYI
	nnZfLyh6nNrS/8rJQJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTmLq-005mQQ-IP; Mon, 14 Mar 2022 15:11:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTmLj-005mJt-Ip
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 15:11:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D5F861243;
 Mon, 14 Mar 2022 15:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4AAC340E9;
 Mon, 14 Mar 2022 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647270665;
 bh=TjFXY1PLMPmn45MMd18YrVcpeBIXkMa96WVOBZ+EbpU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eIYBuSGpiCRGmtuNLCE5deX66pASzqQqVgU2UpjGlVy/3nZMlUVC7PDyavgiDDJSu
 zCdUOrSgW+0Bk/iGgHQCdRL5mhj5uuIkq1C5W2L0xIpG1ACqvEqD38acPL9XUHB5rp
 gROehZGBEhk7NcIxJbZOglZsUGXEvibENsgx19nh7O76LrqEe90Sb2XRZPyY79nL1k
 5Ztb2DKfbxGVHhPpi+AdtrRx2w7wWYKwKMSHjiZ5XuBkJ5rclQAyikLEc8QLQkoPUn
 E7PMn2k3RcwXdFYtgu0Gw2pd5urYi5iTv3V12Zh+Cmi3w6RrTgKchZcNkDzONw7s+T
 2w9WqQufEtdsQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 7/9] mt76: mt7921: move mt7921_usb_sdio_tx_complete_skb in
 common mac code.
Date: Mon, 14 Mar 2022 16:10:29 +0100
Message-Id: <2aff0517bb4ca03cc3a88b24f8b5808fb551953e.1647270525.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647270525.git.lorenzo@kernel.org>
References: <cover.1647270525.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_081107_995904_2A8916FD 
X-CRM114-Status: GOOD (  12.12  )
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
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 21 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  3 ++-
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  2 +-
 .../wireless/mediatek/mt76/mt7921/sdio_mac.c  | 19 -----------------
 4 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index dd1a241c45d6..0c1b65653102 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1680,3 +1680,24 @@ int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
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
+	idx = le32_get_bits(txwi[1], MT_TXD1_WLAN_IDX);
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
index 06db3e1f39a2..32b77fe49abd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -444,7 +444,6 @@ int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_init(struct mt7921_dev *dev);
 int mt7921s_mcu_drv_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev);
-void mt7921s_tx_complete_skb(struct mt76_dev *mdev, struct mt76_queue_entry *e);
 bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
 void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
 void mt7921_set_runtime_pm(struct mt7921_dev *dev);
@@ -455,4 +454,6 @@ int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
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
index d741a58c1260..fa9db21bb3e8 100644
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
-	idx = le32_get_bits(txwi[1], MT_TXD1_WLAN_IDX);
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
