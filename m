Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D848C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 23:12:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F316560C51
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 23:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F316560C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpdursY48fUGStehIAPHOOq/k+shiQKrIlHez2yeeRg=; b=PacvmUeSmhX+us
	iSDH7zM48nVZQBDutste7z4OTXdRQ77iBACq8PGYCN8Fj9nMUDLPcs5GAYXppc7qI0LCbMjOJtdmT
	lwKdF+NRboFbemiwEMcnuEStqOXrTyGGDrSSoX3ElqOU2xZtVOOcGkmXn3oeORkioPzLOhdqe3m6X
	G76i8Izs+VmbFOD2YHy5M1HkS3l7Mo65OyOCMsZ7hE/5VYPK+xNYQzgQsjr3NrEaKIb8wJv5/Sg2J
	SRsYVOHHnik7ztWObg3zAJ1uqzTtin6Z2wQyH8g5kOHle68QuTCOjPH8xanDIuvUusgOnB2XpgqSh
	wdaFj/FlgiaO2G0N7hbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcbni-00HQdn-Ks; Mon, 18 Oct 2021 23:12:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcbnf-00HQc5-RQ
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 23:12:13 +0000
X-UUID: ae6179e895ec4b06950cca433e81bca6-20211018
X-UUID: ae6179e895ec4b06950cca433e81bca6-20211018
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 612070886; Mon, 18 Oct 2021 16:12:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 16:12:07 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Oct 2021 07:12:06 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 05/17] mt76: mt7921: add MT7921_COMMON module
Date: Tue, 19 Oct 2021 07:11:35 +0800
Message-ID: <9d8413116497a6bea530bae71ea945cb056186e3.1634598341.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1634598341.git.objelf@gmail.com>
References: <cover.1634598341.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_161211_940242_3C12DF31 
X-CRM114-Status: GOOD (  11.76  )
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

From: Sean Wang <sean.wang@mediatek.com>

This is a preliminary patch to introduce mt7921s support.

MT7921_COMMON module grouping bus independent objects the both mt7921e and
mt7921s can share with and have to rely on.

Tested-by: Deren Wu <deren.wu@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/Kconfig  | 8 ++++++--
 drivers/net/wireless/mediatek/mt76/mt7921/Makefile | 7 ++++---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c   | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c    | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   | 8 ++++++++
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c    | 8 ++++++++
 6 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
index 001f2b9cec26..071746809b1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
@@ -1,8 +1,12 @@
 # SPDX-License-Identifier: ISC
-config MT7921E
-	tristate "MediaTek MT7921E (PCIe) support"
+config MT7921_COMMON
+	tristate
 	select MT76_CONNAC_LIB
 	select WANT_DEV_COREDUMP
+
+config MT7921E
+	tristate "MediaTek MT7921E (PCIe) support"
+	select MT7921_COMMON
 	depends on MAC80211
 	depends on PCI
 	help
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
index 4cb0b000cfe1..8cea896d5965 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
@@ -1,9 +1,10 @@
 # SPDX-License-Identifier: ISC
 
+obj-$(CONFIG_MT7921_COMMON) += mt7921-common.o
 obj-$(CONFIG_MT7921E) += mt7921e.o
 
 CFLAGS_trace.o := -I$(src)
 
-mt7921e-y := pci.o pci_mac.o pci_mcu.o mac.o mcu.o dma.o eeprom.o main.o \
-	     init.o debugfs.o trace.o
-mt7921e-$(CONFIG_NL80211_TESTMODE) += testmode.o
+mt7921-common-y := mac.o mcu.o eeprom.o main.o init.o debugfs.o trace.o
+mt7921-common-$(CONFIG_NL80211_TESTMODE) += testmode.o
+mt7921e-y := pci.o pci_mac.o pci_mcu.o dma.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index f0fd32c424c6..d310d6e1e566 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -145,6 +145,7 @@ int mt7921_mac_init(struct mt7921_dev *dev)
 
 	return mt76_connac_mcu_set_rts_thresh(&dev->mt76, 0x92b, 0);
 }
+EXPORT_SYMBOL_GPL(mt7921_mac_init);
 
 static int __mt7921_init_hardware(struct mt7921_dev *dev)
 {
@@ -285,3 +286,4 @@ int mt7921_register_device(struct mt7921_dev *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt7921_register_device);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index bb6f0cea93bb..e49dfcf5558d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -39,6 +39,7 @@ static struct mt76_wcid *mt7921_rx_get_wcid(struct mt7921_dev *dev,
 void mt7921_sta_ps(struct mt76_dev *mdev, struct ieee80211_sta *sta, bool ps)
 {
 }
+EXPORT_SYMBOL_GPL(mt7921_sta_ps);
 
 bool mt7921_mac_wtbl_update(struct mt7921_dev *dev, int idx, u32 mask)
 {
@@ -165,6 +166,7 @@ void mt7921_mac_sta_poll(struct mt7921_dev *dev)
 		}
 	}
 }
+EXPORT_SYMBOL_GPL(mt7921_mac_sta_poll);
 
 static void
 mt7921_mac_decode_he_radiotap_ru(struct mt76_rx_status *status,
@@ -916,6 +918,7 @@ void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
 		txwi[3] |= cpu_to_le32(MT_TXD3_BA_DISABLE);
 	}
 }
+EXPORT_SYMBOL_GPL(mt7921_mac_write_txwi);
 
 void mt7921_tx_check_aggr(struct ieee80211_sta *sta, __le32 *txwi)
 {
@@ -940,6 +943,7 @@ void mt7921_tx_check_aggr(struct ieee80211_sta *sta, __le32 *txwi)
 	if (!test_and_set_bit(tid, &msta->ampdu_state))
 		ieee80211_start_tx_ba_session(sta, tid, 0);
 }
+EXPORT_SYMBOL_GPL(mt7921_tx_check_aggr);
 
 static bool
 mt7921_mac_add_txs_skb(struct mt7921_dev *dev, struct mt76_wcid *wcid, int pid,
@@ -1128,6 +1132,7 @@ void mt7921_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 		break;
 	}
 }
+EXPORT_SYMBOL_GPL(mt7921_queue_rx_skb);
 
 void mt7921_mac_reset_counters(struct mt7921_phy *phy)
 {
@@ -1243,6 +1248,7 @@ void mt7921_update_channel(struct mt76_phy *mphy)
 
 	mt76_connac_power_save_sched(mphy, &dev->pm);
 }
+EXPORT_SYMBOL_GPL(mt7921_update_channel);
 
 static void
 mt7921_vif_connect_iter(void *priv, u8 *mac,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index c51266e40cb4..d968990dac6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -237,6 +237,7 @@ int __mt7921_start(struct mt7921_phy *phy)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(__mt7921_start);
 
 static int mt7921_start(struct ieee80211_hw *hw)
 {
@@ -646,6 +647,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt7921_mac_sta_add);
 
 void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			  struct ieee80211_sta *sta)
@@ -667,6 +669,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt7921_mutex_release(dev);
 }
+EXPORT_SYMBOL_GPL(mt7921_mac_sta_assoc);
 
 void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta)
@@ -698,6 +701,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
+EXPORT_SYMBOL_GPL(mt7921_mac_sta_remove);
 
 void mt7921_tx_worker(struct mt76_worker *w)
 {
@@ -1250,3 +1254,7 @@ const struct ieee80211_ops mt7921_ops = {
 	.flush = mt7921_flush,
 	.set_sar_specs = mt7921_set_sar_specs,
 };
+EXPORT_SYMBOL_GPL(mt7921_ops);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 54a2c846fd0d..10b992103ade 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -222,6 +222,7 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mt7921_mcu_parse_response);
 
 int mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			    int cmd, int *wait_seq)
@@ -319,6 +320,7 @@ int mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 
 	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[txq], skb, 0);
 }
+EXPORT_SYMBOL_GPL(mt7921_mcu_send_message);
 
 static void
 mt7921_mcu_scan_event(struct mt7921_dev *dev, struct sk_buff *skb)
@@ -600,6 +602,7 @@ int mt7921_mcu_restart(struct mt76_dev *dev)
 	return mt76_mcu_send_msg(dev, MCU_CMD_NIC_POWER_CTRL, &req,
 				 sizeof(req), false);
 }
+EXPORT_SYMBOL_GPL(mt7921_mcu_restart);
 
 static u32 mt7921_get_data_mode(struct mt7921_dev *dev, u32 info)
 {
@@ -903,11 +906,13 @@ int mt7921_run_firmware(struct mt7921_dev *dev)
 
 	return mt76_connac_mcu_get_nic_capability(&dev->mphy);
 }
+EXPORT_SYMBOL_GPL(mt7921_run_firmware);
 
 void mt7921_mcu_exit(struct mt7921_dev *dev)
 {
 	skb_queue_purge(&dev->mt76.mcu.res_q);
 }
+EXPORT_SYMBOL_GPL(mt7921_mcu_exit);
 
 int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif)
 {
@@ -1082,6 +1087,7 @@ int mt7921_mcu_set_eeprom(struct mt7921_dev *dev)
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EFUSE_BUFFER_MODE,
 				 &req, sizeof(req), true);
 }
+EXPORT_SYMBOL_GPL(mt7921_mcu_set_eeprom);
 
 int mt7921_mcu_get_eeprom(struct mt7921_dev *dev, u32 offset)
 {
@@ -1264,6 +1270,7 @@ int mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev)
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mt7921_mcu_drv_pmctrl);
 
 int mt7921_mcu_fw_pmctrl(struct mt7921_dev *dev)
 {
@@ -1285,6 +1292,7 @@ int mt7921_mcu_fw_pmctrl(struct mt7921_dev *dev)
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mt7921_mcu_fw_pmctrl);
 
 int mt7921_mcu_set_beacon_filter(struct mt7921_dev *dev,
 				 struct ieee80211_vif *vif,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
