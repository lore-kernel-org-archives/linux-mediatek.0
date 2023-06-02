Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFB1C7EE24
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 15:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/zl9/sAL/WSYQIUSpW5rr1GSMVilykdjXQeyrImSkE=; b=4D+23pm2azroiRHw60YD7/v9Fd
	jwVuJDh/Fr/LVxmYfCbjJ+xvYfCqd2IVVEt03E/HQyTkPt5p3u1DiyNakMYuY7YdpyZHsBHaU1i1J
	5fU3wFcNWoZjXBOiVSra0LlCpjR6yR/VRumAUF69AN3jthemGetZgDsVOShO1o643ovHDx0MYwKAh
	sDUXMgbh62KbXW20pJr7+9kxfdf0SZr915HoYY5e01nrNwoEsb2iwCRWSrPxK/hRrKjc8OLnMW0zh
	DoH/6FIqPCztL8vGPIGBi5XhGfUcy7nxHNNXQ6FJJXtMhhkdgTILHkc45Dmx85e8BpZnJZv7FOEfB
	gVQbYSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q56bv-007FGh-1u;
	Fri, 02 Jun 2023 15:22:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q56bq-007FDQ-2G
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jun 2023 15:22:36 +0000
X-UUID: 4963ee38015911ee83ed1395ce914268-20230602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o/zl9/sAL/WSYQIUSpW5rr1GSMVilykdjXQeyrImSkE=;
	b=t4NY04PIA0gjujoSRrqOKRINGbkEGg09j3LCSZ47ja6mAahMCF8HYhHjVYl3WSEwdJ8d4nyyFuDztFg4tF1htBr9qvDc98+EicBMmAd98SWGSOHuReFNbhf8UHUu9wPHcdKxvPq6+rDeBV2CLAYe1fvcQJrtrDxB0kZKj119NPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:e1839ee5-642a-4951-889f-6db372936356,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:3bf1663d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 4963ee38015911ee83ed1395ce914268-20230602
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2035598142; Fri, 02 Jun 2023 08:22:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 23:21:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 23:21:51 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 08/12] wifi: mt76: mt7996: set ifs time by mcu command
Date: Fri, 2 Jun 2023 23:21:04 +0800
Message-ID: <20230602152108.26860-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230602152108.26860-1-shayne.chen@mediatek.com>
References: <20230602152108.26860-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_082234_749489_D78041A4 
X-CRM114-Status: GOOD (  14.91  )
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

There's a race between driver and fw on some tx/rx control registers
when setting ifs, which will cause accidental hw queue pause problems.
Avoid this by setting ifs time with bss_info mcu command.

Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 27 +----------
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  5 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 47 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   | 17 +++++++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  3 +-
 5 files changed, 70 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 130eb7b4fd91..78d9127e63ab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1604,20 +1604,19 @@ void mt7996_mac_reset_counters(struct mt7996_phy *phy)
 	mt7996_mcu_get_chan_mib_info(phy, true);
 }
 
-void mt7996_mac_set_timing(struct mt7996_phy *phy)
+void mt7996_mac_set_coverage_class(struct mt7996_phy *phy)
 {
 	s16 coverage_class = phy->coverage_class;
 	struct mt7996_dev *dev = phy->dev;
 	struct mt7996_phy *phy2 = mt7996_phy2(dev);
 	struct mt7996_phy *phy3 = mt7996_phy3(dev);
-	u32 val, reg_offset;
+	u32 reg_offset;
 	u32 cck = FIELD_PREP(MT_TIMEOUT_VAL_PLCP, 231) |
 		  FIELD_PREP(MT_TIMEOUT_VAL_CCA, 48);
 	u32 ofdm = FIELD_PREP(MT_TIMEOUT_VAL_PLCP, 60) |
 		   FIELD_PREP(MT_TIMEOUT_VAL_CCA, 28);
 	u8 band_idx = phy->mt76->band_idx;
 	int offset;
-	bool a_band = !(phy->mt76->chandef.chan->band == NL80211_BAND_2GHZ);
 
 	if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 		return;
@@ -1630,34 +1629,12 @@ void mt7996_mac_set_timing(struct mt7996_phy *phy)
 		coverage_class = max_t(s16, coverage_class,
 				       phy3->coverage_class);
 
-	mt76_set(dev, MT_ARB_SCR(band_idx),
-		 MT_ARB_SCR_TX_DISABLE | MT_ARB_SCR_RX_DISABLE);
-	udelay(1);
-
 	offset = 3 * coverage_class;
 	reg_offset = FIELD_PREP(MT_TIMEOUT_VAL_PLCP, offset) |
 		     FIELD_PREP(MT_TIMEOUT_VAL_CCA, offset);
 
 	mt76_wr(dev, MT_TMAC_CDTR(band_idx), cck + reg_offset);
 	mt76_wr(dev, MT_TMAC_ODTR(band_idx), ofdm + reg_offset);
-	mt76_wr(dev, MT_TMAC_ICR0(band_idx),
-		FIELD_PREP(MT_IFS_EIFS_OFDM, a_band ? 84 : 78) |
-		FIELD_PREP(MT_IFS_RIFS, 2) |
-		FIELD_PREP(MT_IFS_SIFS, 10) |
-		FIELD_PREP(MT_IFS_SLOT, phy->slottime));
-
-	if (!a_band)
-		mt76_wr(dev, MT_TMAC_ICR1(band_idx),
-			FIELD_PREP(MT_IFS_EIFS_CCK, 314));
-
-	if (phy->slottime < 20 || a_band)
-		val = MT7996_CFEND_RATE_DEFAULT;
-	else
-		val = MT7996_CFEND_RATE_11B;
-
-	mt76_rmw_field(dev, MT_RATE_HRCR0(band_idx), MT_RATE_HRCR0_CFEND_RATE, val);
-	mt76_clear(dev, MT_ARB_SCR(band_idx),
-		   MT_ARB_SCR_TX_DISABLE | MT_ARB_SCR_RX_DISABLE);
 }
 
 void mt7996_mac_enable_nf(struct mt7996_dev *dev, u8 band)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 8a1edc5c1288..6001b534b657 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -287,7 +287,6 @@ int mt7996_set_channel(struct mt7996_phy *phy)
 	if (ret)
 		goto out;
 
-	mt7996_mac_set_timing(phy);
 	ret = mt7996_dfs_init_radar_detector(phy);
 	mt7996_mac_cca_stats_reset(phy);
 
@@ -565,7 +564,7 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 
 		if (slottime != phy->slottime) {
 			phy->slottime = slottime;
-			mt7996_mac_set_timing(phy);
+			mt7996_mcu_set_timing(phy, vif);
 		}
 	}
 
@@ -905,7 +904,7 @@ mt7996_set_coverage_class(struct ieee80211_hw *hw, s16 coverage_class)
 
 	mutex_lock(&dev->mt76.mutex);
 	phy->coverage_class = max_t(s16, coverage_class, 0);
-	mt7996_mac_set_timing(phy);
+	mt7996_mac_set_coverage_class(phy);
 	mutex_unlock(&dev->mt76.mutex);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index db51b3023654..52c6c502e9b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -701,6 +701,35 @@ mt7996_mcu_muar_config(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 				 sizeof(req), true);
 }
 
+static void
+mt7996_mcu_bss_ifs_timing_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_phy *phy = mvif->phy;
+	struct bss_ifs_time_tlv *ifs_time;
+	struct tlv *tlv;
+	bool a_band = !(phy->mt76->chandef.chan->band == NL80211_BAND_2GHZ);
+	u16 eifs_time = a_band ? 84 : 78;
+
+	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_IFS_TIME, sizeof(*ifs_time));
+
+	ifs_time = (struct bss_ifs_time_tlv *)tlv;
+	ifs_time->slot_valid = true;
+	ifs_time->sifs_valid = true;
+	ifs_time->rifs_valid = true;
+	ifs_time->eifs_valid = true;
+
+	ifs_time->slot_time = cpu_to_le16(phy->slottime);
+	ifs_time->sifs_time = cpu_to_le16(10);
+	ifs_time->rifs_time = cpu_to_le16(2);
+	ifs_time->eifs_time = cpu_to_le16(eifs_time);
+
+	if (!a_band) {
+		ifs_time->eifs_cck_valid = true;
+		ifs_time->eifs_cck_time = cpu_to_le16(314);
+	}
+}
+
 static int
 mt7996_mcu_bss_basic_tlv(struct sk_buff *skb,
 			 struct ieee80211_vif *vif,
@@ -826,6 +855,7 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy,
 		mt7996_mcu_bss_bmc_tlv(skb, vif, phy);
 		mt7996_mcu_bss_ra_tlv(skb, vif, phy);
 		mt7996_mcu_bss_txcmd_tlv(skb, true);
+		mt7996_mcu_bss_ifs_timing_tlv(skb, vif);
 
 		if (vif->bss_conf.he_support)
 			mt7996_mcu_bss_he_tlv(skb, vif, phy);
@@ -838,6 +868,23 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy,
 				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
+int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *vif)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_dev *dev = phy->dev;
+	struct sk_buff *skb;
+
+	skb = __mt7996_mcu_alloc_bss_req(&dev->mt76, &mvif->mt76,
+					 MT7996_BSS_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt7996_mcu_bss_ifs_timing_tlv(skb, vif);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
+}
+
 static int
 mt7996_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif *mvif,
 		  struct ieee80211_ampdu_params *params,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index d7075a4d0667..078f82858621 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -317,6 +317,22 @@ struct bss_sec_tlv {
 	u8 __rsv2[1];
 } __packed;
 
+struct bss_ifs_time_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 slot_valid;
+	u8 sifs_valid;
+	u8 rifs_valid;
+	u8 eifs_valid;
+	__le16 slot_time;
+	__le16 sifs_time;
+	__le16 rifs_time;
+	__le16 eifs_time;
+	u8 eifs_cck_valid;
+	u8 rsv;
+	__le16 eifs_cck_time;
+} __packed;
+
 struct bss_power_save {
 	__le16 tag;
 	__le16 len;
@@ -552,6 +568,7 @@ enum {
 					 sizeof(struct bss_txcmd_tlv) +		\
 					 sizeof(struct bss_power_save) +	\
 					 sizeof(struct bss_sec_tlv) +		\
+					 sizeof(struct bss_ifs_time_tlv) +	\
 					 sizeof(struct bss_mld_tlv))
 
 #define MT7996_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +		\
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 7dfdc7384056..42892f06faa7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -463,6 +463,7 @@ int mt7996_mcu_set_radar_th(struct mt7996_dev *dev, int index,
 			    const struct mt7996_dfs_pattern *pattern);
 int mt7996_mcu_set_radio_en(struct mt7996_phy *phy, bool enable);
 int mt7996_mcu_set_rts_thresh(struct mt7996_phy *phy, u32 val);
+int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *vif);
 int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch);
 int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 index,
 		       u8 rx_sel, u8 val);
@@ -526,7 +527,7 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid,
 			   struct ieee80211_key_conf *key, int pid,
 			   enum mt76_txq_id qid, u32 changed);
-void mt7996_mac_set_timing(struct mt7996_phy *phy);
+void mt7996_mac_set_coverage_class(struct mt7996_phy *phy);
 int mt7996_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta);
 void mt7996_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
-- 
2.39.2


