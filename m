Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17966E77173
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MOsCEHeKH1qMagFzRz2vOz6tCGm5i6Uo8wrZ86cr+mI=; b=q2+KHEPP2hsqQlzDCGuq0L2eXU
	YI5fX6RkDu/rdMcLAQIFnaApQgcvPgzanTScJP4VTyj4wg1WV8bjSTwqU/ZjpMeUr+zPL5UPpKmws
	jtbPpzqcbmviPQBAswyLm3xv3haoegfDeyruBRtHMzG8iabUIuaK36xUQzlA3s0pD5zphQKBOnzgv
	f52dnPnDBSo8yNBu5YHph71xRO6UrpLL6fzqBopD6WpgmNQ6gIqSqmHcfrOMVSB9O4QYI1FMs26A/
	CHxRR+vwX0LsqU1h1Cfuf/ArLRrfYWoVXBzRiR6u2pEiMuj/LG/OuBDoBSJVI+J60soi774VzzxrL
	gKyia1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXtf-00000006ekv-0UzS;
	Mon, 09 Dec 2024 07:09:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXtc-00000006ekT-3T0c
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Dec 2024 07:09:33 +0000
X-UUID: 86e30074b5fc11ef9048ed6ed365623b-20241209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MOsCEHeKH1qMagFzRz2vOz6tCGm5i6Uo8wrZ86cr+mI=;
	b=Iv7w6+xZ1VUWUh54O84YQD6eXfp0XbJoQZJ6ld3E/r3pc/RxEmC2gAn5+PEC1Ki3SvzvUcOJpEJip3iHIBPTtSRR3SSZqdZOCy9JFPvNCzX5Z+tvPrDZpmvx2jq97L0MT4korXzE1W7v2aAB26PdlDYbEl31n7hneWDo7YPbr8Y=;
X-CID-CACHE: Type:Local,Time:202412090001-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:03c635c0-60ca-4328-8070-c630d47ecf4c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:d7c56b04-b3ca-4202-ba41-09fe265db19f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 86e30074b5fc11ef9048ed6ed365623b-20241209
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <allan.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1126156902; Mon, 09 Dec 2024 00:09:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Dec 2024 15:09:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Dec 2024 15:09:23 +0800
From: Allan Wang <allan.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <mingyen.hsieh@mediatek.com>,
	<Sean.Wang@mediatek.com>, <Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allan Wang <allan.wang@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7921: add rfkill_poll for hardware rfkill
Date: Mon, 9 Dec 2024 15:09:22 +0800
Message-ID: <20241209070922.28106-1-allan.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.940800-8.000000
X-TMASE-MatchedRID: 2A2D2NujXZJ7EGbCBtXNhxn0UD4GU5IqvtVce6w5+K8DvHelfu2d5KpO
	PV77FUz6NJnt9TW/xwZDxo0ZYj4mPdbms8wOrodvrDFtme53Kvt+iqFlMGARD0X5hc8ioB2+O0G
	OztpQSYSTFmqgSxbocNnFK+oGmxAsSt8UOB40zJCO0rt0LpQGeY7vhl9PIBCwBfoAvdqdJ5eGOC
	LWLQQgISTCeqf00rH8e6Dl8iogyLdF/TNFimjSuM9tRbA8O6QzSoCG4sefl8Tgb8WBYTcHTKLoS
	LE/BAxZhfDazV9C0NwP7qDK2MfcBtee6yiQro3rnIGynr5ObIZ9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO22utO5qEfOUQFgDlhJ2+R0vj882pwVgm77gy1cMDcqOMHRIHZVAvyrAEYBoVhFLJ+45f/
	3fxUsc71rmcLvvc0VNLgCHvN0TdRsSWudO9L2W0ma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6x
	5U/HriPpCuffGH9zI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.940800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1F18AF78987C5BE079B8523A599077F72A8F7519E246D5D318E43CF9800DD9492000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_230932_868796_2C3E9A56 
X-CRM114-Status: GOOD (  15.85  )
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

Add mac80211 rfkill_poll ops to monitor hardware rfkill state
and state change will be updated.

Signed-off-by: Allan Wang <allan.wang@mediatek.com>
---
v2:
 - Fix cast to restricted __le32 warning
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  2 ++
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 18 ++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 21 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   |  5 +++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  4 ++++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  4 ++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 7 files changed, 55 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 1b0e80dfc346..d3c03fb0d36a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1043,6 +1043,7 @@ enum {
 	MCU_EXT_EVENT_CSA_NOTIFY = 0x4f,
 	MCU_EXT_EVENT_WA_TX_STAT = 0x74,
 	MCU_EXT_EVENT_BCC_NOTIFY = 0x75,
+	MCU_EXT_EVENT_WF_RF_PIN_CTRL = 0x9a,
 	MCU_EXT_EVENT_MURU_CTRL = 0x9f,
 };
 
@@ -1251,6 +1252,7 @@ enum {
 	MCU_EXT_CMD_GROUP_PRE_CAL_INFO = 0xab,
 	MCU_EXT_CMD_DPD_PRE_CAL_INFO = 0xac,
 	MCU_EXT_CMD_PHY_STAT_INFO = 0xad,
+	MCU_EXT_CMD_WF_RF_PIN_CTRL = 0xbd,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 573a2cd7fe45..18daf2bee27b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -252,6 +252,11 @@ int __mt7921_start(struct mt792x_phy *phy)
 			return err;
 	}
 
+	if (phy->chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN) {
+		mt7921_mcu_wf_rf_pin_ctrl(phy, WF_RF_PIN_INIT);
+		wiphy_rfkill_start_polling(mphy->hw->wiphy);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__mt7921_start);
@@ -1398,6 +1403,18 @@ static void mt7921_mgd_complete_tx(struct ieee80211_hw *hw,
 	mt7921_abort_roc(mvif->phy, mvif);
 }
 
+static void mt7921_rfkill_poll(struct ieee80211_hw *hw)
+{
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	int ret = 0;
+
+	mt792x_mutex_acquire(phy->dev);
+	ret = mt7921_mcu_wf_rf_pin_ctrl(phy, WF_RF_PIN_POLL);
+	mt792x_mutex_release(phy->dev);
+
+	wiphy_rfkill_set_hw_state(hw->wiphy, ret ? false : true);
+}
+
 const struct ieee80211_ops mt7921_ops = {
 	.tx = mt792x_tx,
 	.start = mt7921_start,
@@ -1457,6 +1474,7 @@ const struct ieee80211_ops mt7921_ops = {
 	.unassign_vif_chanctx = mt792x_unassign_vif_chanctx,
 	.mgd_prepare_tx = mt7921_mgd_prepare_tx,
 	.mgd_complete_tx = mt7921_mgd_complete_tx,
+	.rfkill_poll = mt7921_rfkill_poll,
 };
 EXPORT_SYMBOL_GPL(mt7921_ops);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index ddc5986086d9..3f45221d00e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -61,6 +61,12 @@ int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		skb_pull(skb, sizeof(*rxd));
 		event = (struct mt76_connac_mcu_reg_event *)skb->data;
 		ret = (int)le32_to_cpu(event->val);
+	} else if (cmd == MCU_EXT_CMD(WF_RF_PIN_CTRL)) {
+		struct mt7921_wf_rf_pin_ctrl_event *event;
+
+		skb_pull(skb, sizeof(*rxd));
+		event = (struct mt7921_wf_rf_pin_ctrl_event *)skb->data;
+		ret = (int)event->result;
 	} else {
 		skb_pull(skb, sizeof(struct mt76_connac2_mcu_rxd));
 	}
@@ -1427,6 +1433,21 @@ int mt7921_mcu_get_temperature(struct mt792x_phy *phy)
 				 sizeof(req), true);
 }
 
+int mt7921_mcu_wf_rf_pin_ctrl(struct mt792x_phy *phy, u8 action)
+{
+	struct mt792x_dev *dev = phy->dev;
+	struct {
+		u8 action;
+		u8 value;
+	} req = {
+		.action = action,
+		.value = 0,
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(WF_RF_PIN_CTRL), &req,
+				 sizeof(req), action ? true : false);
+}
+
 int mt7921_mcu_set_rxfilter(struct mt792x_dev *dev, u32 fif,
 			    u8 bit_op, u32 bit_map)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index f9a259ee6b82..2834c6c53e58 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -74,6 +74,11 @@ struct mt7921_txpwr_event {
 	struct mt7921_txpwr txpwr;
 } __packed;
 
+struct mt7921_wf_rf_pin_ctrl_event {
+	u8 result;
+	u8 value;
+} __packed;
+
 enum {
 	TM_SWITCH_MODE,
 	TM_SET_AT_CMD,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 16c89815c0b8..5a221579b092 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -31,6 +31,9 @@
 #define EXT_CMD_RADIO_ON_LED            0x2
 #define EXT_CMD_RADIO_OFF_LED           0x3
 
+#define WF_RF_PIN_INIT		0x0
+#define WF_RF_PIN_POLL		0x1
+
 enum {
 	UNI_ROC_ACQUIRE,
 	UNI_ROC_ABORT,
@@ -202,6 +205,7 @@ void mt7921_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb);
 int mt7921_mcu_set_rxfilter(struct mt792x_dev *dev, u32 fif,
 			    u8 bit_op, u32 bit_map);
 int mt7921_mcu_radio_led_ctrl(struct mt792x_dev *dev, u8 value);
+int mt7921_mcu_wf_rf_pin_ctrl(struct mt792x_phy *phy, u8 action);
 
 static inline u32
 mt7921_reg_map_l1(struct mt792x_dev *dev, u32 addr)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 67723c22aea6..b76660325599 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -42,6 +42,10 @@ static void mt7921e_unregister_device(struct mt792x_dev *dev)
 {
 	int i;
 	struct mt76_connac_pm *pm = &dev->pm;
+	struct ieee80211_hw *hw = mt76_hw(dev);
+
+	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
+		wiphy_rfkill_stop_polling(hw->wiphy);
 
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index ab12616ec2b8..11c57b9c7bb3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -28,6 +28,7 @@
 #define MT792x_CHIP_CAP_CLC_EVT_EN BIT(0)
 #define MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN BIT(1)
 #define MT792x_CHIP_CAP_MLO_EVT_EN BIT(2)
+#define MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN BIT(3)
 
 /* NOTE: used to map mt76_rates. idx may change if firmware expands table */
 #define MT792x_BASIC_RATES_TBL	11
-- 
2.45.2


