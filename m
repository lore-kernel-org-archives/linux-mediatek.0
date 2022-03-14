Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CDDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 15:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEkyoiM8PXNH6Ji9g4QOHTqDTAXfmm1UKLZpdz61oDo=; b=Y1RdUYOQqfKoPO
	Url2TApI52zsJeren/Z9y5B4Ai9ml200k3JeKP1MADhYYG9FnUxlabWaKiezbwVquRgbHfU2vIC+t
	ywgkm0dNKwCNvExW+hnOBARZ9FMcje645VuhKfl0VmdYxJf9Lt3Iah8xCUjjL7a2/fcRZ6wf15DPJ
	DVz62AaiyyeKQhX+6SGpnmmbDP8hD5niWVsBueZsb0hB9Xlh4I7eAZgxr0Qmvu+pCe0T4Uuqz3xLW
	pJpqNze6C0qpXj7NW/DeCBPliKe3u8Wg/rwmWWPM50/tN9rxihCKTxtUGnDRa9eCKBl1US5Q1jXnc
	M15XubiAoVxm2ocnlygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTmLt-005mSa-QY; Mon, 14 Mar 2022 15:11:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTmLm-005mLv-GD
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 15:11:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1144EB80E4F;
 Mon, 14 Mar 2022 15:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51284C340EC;
 Mon, 14 Mar 2022 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647270667;
 bh=s3xRTfbrH8vtStvqYR1zB8PSsipXAPrSQeVn1wGyZPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NhrujJgwlhvtl/AEZQuRFWIkGaMtaR/mxD8pi4lvPvhWNW4u+rizdQyB65py1qfV+
 lgGKwmNXNL7fYdz5Cimwrn53c5ulLadjFreUXfKh60YzYH24Bi2ExeZFTV2pGDFuX7
 Wi0EYgHntS/FdmJyMaYGQeQaqDaBLXWwdXft5eDsdEUiXbmGUJ9MNAxRXdjKtOL6jh
 FG9xc48u1/YZYp1qM7SHsp8J+6K/e0F5ihk+RZnrWC3GrOE3LIoERCO1pvwQmfuB9h
 6CG55fsqM3rY8NMEAlpFxr94Fj3UaOm+s99tl24WZKdc8cQWzIiCVVTz5P70oZVVtL
 wcpn5j2GBBnmA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 8/9] mt76: mt7921: move mt7921_usb_sdio_tx_status_data in
 mac common code.
Date: Mon, 14 Mar 2022 16:10:30 +0100
Message-Id: <c661adc4fe4cf0f03be53d0354e639672fa1f937.1647270525.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647270525.git.lorenzo@kernel.org>
References: <cover.1647270525.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_081110_894213_0527A4CD 
X-CRM114-Status: GOOD (  11.07  )
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
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c      | 12 ++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c     |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c | 11 -----------
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 0c1b65653102..263ac62d88b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1701,3 +1701,15 @@ void mt7921_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
 	mt76_tx_complete_skb(mdev, e->wcid, e->skb);
 }
 EXPORT_SYMBOL_GPL(mt7921_usb_sdio_tx_complete_skb);
+
+bool mt7921_usb_sdio_tx_status_data(struct mt76_dev *mdev, u8 *update)
+{
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+
+	mt7921_mutex_acquire(dev);
+	mt7921_mac_sta_poll(dev);
+	mt7921_mutex_release(dev);
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(mt7921_usb_sdio_tx_status_data);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 32b77fe49abd..e0d67756673f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -444,7 +444,6 @@ int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_init(struct mt7921_dev *dev);
 int mt7921s_mcu_drv_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev);
-bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update);
 void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
 void mt7921_set_runtime_pm(struct mt7921_dev *dev);
 int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif *vif,
@@ -456,4 +455,5 @@ int mt7921_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 				   struct mt76_tx_info *tx_info);
 void mt7921_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
 				     struct mt76_queue_entry *e);
+bool mt7921_usb_sdio_tx_status_data(struct mt76_dev *mdev, u8 *update);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 507bd550b063..9b2bc0b11492 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -93,7 +93,7 @@ static int mt7921s_probe(struct sdio_func *func,
 				SURVEY_INFO_TIME_BSS_RX,
 		.tx_prepare_skb = mt7921_usb_sdio_tx_prepare_skb,
 		.tx_complete_skb = mt7921_usb_sdio_tx_complete_skb,
-		.tx_status_data = mt7921s_tx_status_data,
+		.tx_status_data = mt7921_usb_sdio_tx_status_data,
 		.rx_skb = mt7921_queue_rx_skb,
 		.sta_ps = mt7921_sta_ps,
 		.sta_add = mt7921_mac_sta_add,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index fa9db21bb3e8..1b3adb3d91e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -140,14 +140,3 @@ int mt7921s_mac_reset(struct mt7921_dev *dev)
 
 	return err;
 }
-
-bool mt7921s_tx_status_data(struct mt76_dev *mdev, u8 *update)
-{
-	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
-
-	mt7921_mutex_acquire(dev);
-	mt7921_mac_sta_poll(dev);
-	mt7921_mutex_release(dev);
-
-	return false;
-}
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
