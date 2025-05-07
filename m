Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18D0C369DC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 05:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pixdk5rgkJ7JFR+t6+4hCwvqh3IN3gRUoapBmNv5Rlw=; b=VOv0ho6Evn4F8AMoTxGO3y/v9J
	KkZYsWho1c8cUDsuI07MBxdh/PY7U7KySWc1wMqYIT7Lm8B06x3gSnu66jdwVCmk1LG+X4KnhGN4J
	ts8Ct0KIVRJpY8aWk+mYJOxeKG5Hi5LxIyjFvCn/MNcG4yd7OXc7aLOdaNP/sgHpkubIseJdpLl8N
	tU0+cvOXsa5AAgjDMnwJwqKeQGrS/n90anm/v5TaXLHIOdZoL4MV+OmxEoPnfuPMuH1oUHZAZ+1Be
	j7dzY0KiQwIBwQZLCRIHeThZU6xH0AImbwV2eBn3eWjoPitpXSN45Bxi7PNLQ7PI6wtPydF65xfYM
	386dxdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXNf-0000000EH1I-2fRR;
	Wed, 07 May 2025 05:31:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXNc-0000000EH0o-3eJg
	for linux-mediatek@lists.infradead.org;
	Wed, 07 May 2025 05:31:41 +0000
X-UUID: 8b25f61e2b0411f0bed96b30c12bc3d6-20250506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pixdk5rgkJ7JFR+t6+4hCwvqh3IN3gRUoapBmNv5Rlw=;
	b=SqgD5xLTzxmCpE/UXaHqkoPHe32JusTTKwpkX9AigQqJjPrxD4wGXpQD+NV9xJ78NNFPjRv2J0k0+gaaXoZpn6Ft6Z0PlxWD82BbdvzuBmcCUk2A9MmV0dO9nOsfZCo0l+8sQimV9cku/PV8dNkbMcvkgMvgy+uSp475Z85d3Uw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f8fdd46e-7244-415f-aefd-c92956478945,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:1f6a57b7-6aeb-4a76-9513-22b6350bff3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b25f61e2b0411f0bed96b30c12bc3d6-20250506
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <allan.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1289049718; Tue, 06 May 2025 22:31:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 7 May 2025 13:31:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 7 May 2025 13:31:33 +0800
From: Allan Wang <allan.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <mingyen.hsieh@mediatek.com>,
	<Sean.Wang@mediatek.com>, <Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allan Wang <allan.wang@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7925: add rfkill_poll for hardware rfkill
Date: Wed, 7 May 2025 13:31:31 +0800
Message-ID: <20250507053131.4173691-1-allan.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_223140_914793_6DF1ACE1 
X-CRM114-Status: GOOD (  14.10  )
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
v2: Refine coding style
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 16 ++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 37 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  4 ++
 5 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 478cd1886736..e195d69f61f6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1298,6 +1298,7 @@ enum {
 	MCU_UNI_CMD_PER_STA_INFO = 0x6d,
 	MCU_UNI_CMD_ALL_STA_INFO = 0x6e,
 	MCU_UNI_CMD_ASSERT_DUMP = 0x6f,
+	MCU_UNI_CMD_RADIO_STATUS = 0x80,
 	MCU_UNI_CMD_SDO = 0x88,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 83f93f9e002c..e1ea7136751a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -334,6 +334,9 @@ int __mt7925_start(struct mt792x_phy *phy)
 	ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
 				     MT792x_WATCHDOG_TIME);
 
+	if (phy->chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
+		wiphy_rfkill_start_polling(mphy->hw->wiphy);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__mt7925_start);
@@ -2205,6 +2208,18 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	mutex_unlock(&dev->mt76.mutex);
 }
 
+static void mt7925_rfkill_poll(struct ieee80211_hw *hw)
+{
+	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	int ret;
+
+	mt792x_mutex_acquire(phy->dev);
+	ret = mt7925_mcu_wf_rf_pin_ctrl(phy);
+	mt792x_mutex_release(phy->dev);
+
+	wiphy_rfkill_set_hw_state(hw->wiphy, ret == 0);
+}
+
 const struct ieee80211_ops mt7925_ops = {
 	.tx = mt792x_tx,
 	.start = mt7925_start,
@@ -2265,6 +2280,7 @@ const struct ieee80211_ops mt7925_ops = {
 	.link_info_changed = mt7925_link_info_changed,
 	.change_vif_links = mt7925_change_vif_links,
 	.change_sta_links = mt7925_change_sta_links,
+	.rfkill_poll = mt7925_rfkill_poll,
 };
 EXPORT_SYMBOL_GPL(mt7925_ops);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 286f602623c0..ec4c4a027922 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3633,6 +3633,43 @@ int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy)
 	return 0;
 }
 
+int mt7925_mcu_wf_rf_pin_ctrl(struct mt792x_phy *phy)
+{
+#define UNI_CMD_RADIO_STATUS_GET	0
+	struct mt792x_dev *dev = phy->dev;
+	struct sk_buff *skb;
+	int ret;
+	struct {
+		__le16 tag;
+		__le16 len;
+		u8 rsv[4];
+	} __packed req = {
+		.tag = UNI_CMD_RADIO_STATUS_GET,
+		.len = cpu_to_le16(sizeof(req)),
+	};
+	struct mt7925_radio_status_event {
+		__le16 tag;
+		__le16 len;
+
+		u8 data;
+		u8 rsv[3];
+	} __packed *status;
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76,
+					MCU_UNI_CMD(RADIO_STATUS),
+					&req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	skb_pull(skb, sizeof(struct tlv));
+	status = (struct mt7925_radio_status_event *)skb->data;
+	ret = status->data;
+
+	dev_kfree_skb(skb);
+
+	return ret;
+}
+
 int mt7925_mcu_set_rxfilter(struct mt792x_dev *dev, u32 fif,
 			    u8 bit_op, u32 bit_map)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 4e50f2597ccd..283a40badd28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -365,5 +365,6 @@ int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     struct ieee80211_vif *vif,
 				     struct ieee80211_sta *sta,
 				     int link_id);
+int mt7925_mcu_wf_rf_pin_ctrl(struct mt792x_phy *phy);
 
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index c7b5dc1dbb34..b997cd8bf8d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -31,6 +31,10 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 {
 	int i;
 	struct mt76_connac_pm *pm = &dev->pm;
+	struct ieee80211_hw *hw = mt76_hw(dev);
+
+	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
+		wiphy_rfkill_stop_polling(hw->wiphy);
 
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
-- 
2.45.2


