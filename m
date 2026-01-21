Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E6BC44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jan 2026 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hqpD5OOg+H+RntKIKrpktwgC0gBqsySSmqwI37/qcTQ=; b=rnqDkUNThDl77zgaUMCUModZ8q
	1SN578aSXibS6QNzoivxxBXED87wdMmLwlJcUwAJclJtMxL6pg0BKUig4rsPxIEQ2nDWTG+nSF89c
	NWAgaSJAN6dph82t861ZEsIzHe9olcb1n5g12S3PdlnNbxXedAQcdfyxPlN1tyU+6qaBjL2t3bWi6
	ejdYA02EXeo0z+UVNEtqYHfwiMG45mhuyAR/OqAlpQDISLA5IimaWH92T80Dksx+8i5TWxcG6XuIj
	yzDT2Jc7rjbvmAbGhSoUplqIEplVintTt0U1G6+h8zJYcBSrJqxZUI7+9MPNPXWJW+EXClgxhwSyg
	9jvXXcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicDk-00000005sfi-1LWp;
	Wed, 21 Jan 2026 17:42:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicDh-00000005seu-0wRB
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Jan 2026 17:42:18 +0000
X-UUID: 8292154cf6f011f0ad39f32c34db0b1c-20260121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hqpD5OOg+H+RntKIKrpktwgC0gBqsySSmqwI37/qcTQ=;
	b=qX182eiPQOOXkarna+0P4A+RuixBMuupvHX8R1v5dvvGodEv1Ad1DCTM401JMJZToymx/9TjFi0uo9MF1nz0pfN1liwZBDyKTL4AS78kRUbTa+63AnFEWbCUwdsboVc4w3uQw5TY9rtSNHCgXGbPXd5OFvuzU07r5WvcjqXZD0o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:9d22eb44-0667-4a9b-86c4-38fe3e9e8339,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:123c655a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8292154cf6f011f0ad39f32c34db0b1c-20260121
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1504991179; Wed, 21 Jan 2026 10:42:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 22 Jan 2026 01:42:06 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 22 Jan 2026 01:42:05 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7615: fix use_cts_prot support
Date: Wed, 21 Jan 2026 09:41:56 -0800
Message-ID: <edb87088b0111b32fafc6c4179f54a5286dd37d8.1768879119.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_094217_274193_C155FCAE 
X-CRM114-Status: GOOD (  13.36  )
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

Driver should not directly write WTBL to prevent overwritten issues.

With this fix, when driver needs to adjust its behavior for compatibility,
especially concerning older 11g/n devices, by enabling or disabling CTS
protection frames, often for hidden SSIDs or to manage legacy clients.

Fixes: e34235ccc5e3 ("wifi: mt76: mt7615: enable use_cts_prot support")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 15 ------
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  7 +--
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 47 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  5 +-
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  2 -
 5 files changed, 53 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index bd56cdb02..d3478390f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1167,21 +1167,6 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 }
 EXPORT_SYMBOL_GPL(mt7615_mac_set_rates);
 
-void mt7615_mac_enable_rtscts(struct mt7615_dev *dev,
-			      struct ieee80211_vif *vif, bool enable)
-{
-	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	u32 addr;
-
-	addr = mt7615_mac_wtbl_addr(dev, mvif->sta.wcid.idx) + 3 * 4;
-
-	if (enable)
-		mt76_set(dev, addr, MT_WTBL_W3_RTS);
-	else
-		mt76_clear(dev, addr, MT_WTBL_W3_RTS);
-}
-EXPORT_SYMBOL_GPL(mt7615_mac_enable_rtscts);
-
 static int
 mt7615_mac_wtbl_update_key(struct mt7615_dev *dev, struct mt76_wcid *wcid,
 			   struct ieee80211_key_conf *key,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 727266892..fc619acbb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -583,9 +583,6 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 		}
 	}
 
-	if (changed & BSS_CHANGED_ERP_CTS_PROT)
-		mt7615_mac_enable_rtscts(dev, vif, info->use_cts_prot);
-
 	if (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon) {
 		mt7615_mcu_add_bss_info(phy, vif, NULL, true);
 		mt7615_mcu_sta_add(phy, vif, NULL, true);
@@ -598,6 +595,10 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 		       BSS_CHANGED_BEACON_ENABLED))
 		mt7615_mcu_add_beacon(dev, hw, vif, info->enable_beacon);
 
+	if (changed & BSS_CHANGED_HT || changed & BSS_CHANGED_ERP_CTS_PROT)
+		mt7615_mcu_set_protection(phy, vif, info->ht_operation_mode,
+					  info->use_cts_prot);
+
 	if (changed & BSS_CHANGED_PS)
 		mt76_connac_mcu_set_vif_ps(&dev->mt76, vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index fc0054f8b..ff57ede87 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2564,3 +2564,50 @@ int mt7615_mcu_set_roc(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	return mt76_mcu_send_msg(&dev->mt76, MCU_CE_CMD(SET_ROC),
 				 &req, sizeof(req), false);
 }
+
+int mt7615_mcu_set_protection(struct mt7615_phy *phy, struct ieee80211_vif *vif,
+			      u8 ht_mode, bool use_cts_prot)
+{
+	struct mt7615_dev *dev = phy->dev;
+	struct {
+		u8 prot_idx;
+		u8 band;
+		u8 rsv[2];
+
+		bool long_nav;
+		bool prot_mm;
+		bool prot_gf;
+		bool prot_bw40;
+		bool prot_rifs;
+		bool prot_bw80;
+		bool prot_bw160;
+		u8 prot_erp_mask;
+	} __packed req = {
+		.prot_idx = 0x2,
+		.band = phy != &dev->phy,
+	};
+
+	switch (ht_mode & IEEE80211_HT_OP_MODE_PROTECTION) {
+	case IEEE80211_HT_OP_MODE_PROTECTION_NONMEMBER:
+	case IEEE80211_HT_OP_MODE_PROTECTION_NONHT_MIXED:
+		req.prot_mm = true;
+		req.prot_gf = true;
+		fallthrough;
+	case IEEE80211_HT_OP_MODE_PROTECTION_20MHZ:
+		req.prot_bw40 = true;
+		break;
+	}
+
+	if (ht_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
+		req.prot_gf = true;
+
+	if (use_cts_prot) {
+		struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+		u8 i = mvif->mt76.omac_idx > HW_BSSID_MAX ? HW_BSSID_0 : mvif->mt76.omac_idx;
+
+		req.prot_erp_mask = BIT(i);
+	}
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(PROTECT_CTRL), &req,
+				 sizeof(req), true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index c93fd245c..391928405 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -467,8 +467,6 @@ void mt7615_mac_reset_counters(struct mt7615_phy *phy);
 void mt7615_mac_cca_stats_reset(struct mt7615_phy *phy);
 void mt7615_mac_set_scs(struct mt7615_phy *phy, bool enable);
 void mt7615_mac_enable_nf(struct mt7615_dev *dev, bool ext_phy);
-void mt7615_mac_enable_rtscts(struct mt7615_dev *dev,
-			      struct ieee80211_vif *vif, bool enable);
 void mt7615_mac_sta_poll(struct mt7615_dev *dev);
 int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 			  struct sk_buff *skb, struct mt76_wcid *wcid,
@@ -523,7 +521,8 @@ int mt7615_mcu_set_sku_en(struct mt7615_phy *phy, bool enable);
 int mt7615_mcu_apply_rx_dcoc(struct mt7615_phy *phy);
 int mt7615_mcu_apply_tx_dpd(struct mt7615_phy *phy);
 int mt7615_dfs_init_radar_detector(struct mt7615_phy *phy);
-
+int mt7615_mcu_set_protection(struct mt7615_phy *phy, struct ieee80211_vif *vif,
+			      u8 ht_mode, bool use_cts_prot);
 int mt7615_mcu_set_roc(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 		       struct ieee80211_channel *chan, int duration);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index eb3c24d51..e4133e918 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -455,8 +455,6 @@ enum mt7615_reg_base {
 #define MT_WTBL_RIUCR3_RATE6		GENMASK(19, 8)
 #define MT_WTBL_RIUCR3_RATE7		GENMASK(31, 20)
 
-#define MT_WTBL_W3_RTS			BIT(22)
-
 #define MT_WTBL_W5_CHANGE_BW_RATE	GENMASK(7, 5)
 #define MT_WTBL_W5_SHORT_GI_20		BIT(8)
 #define MT_WTBL_W5_SHORT_GI_40		BIT(9)
-- 
2.45.2


