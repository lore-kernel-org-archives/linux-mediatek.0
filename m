Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C7BC4708F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 23:29:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D90D61396
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 23:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D90D61396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7f5OzfCw5OOLD53nrMMDo8W5TOJ4RkYzjcN0AD/JOqc=; b=3cPkQG+OVmhDg3
	KoLUTLnOo+IMiwAsVDv+N2ioVR0rsUP3v0q8+tsJ8jDMaoZ3BIsySUdWA8pl5knBeS1jFaFmOU7AT
	l38HiFjBRdOrBd63qDz2o0RiGwgUu/ZHAkLK9Sy+kaUHoM+Gqo71tdM98Ff3+ulSOS0OIR+fwpthe
	yJ8/+O1x5M6bQThaMCjntXkm/GOVZn1dP8G4Ctvti6FUCeTj0XJ4jLpfOyIPswA5flN3IB3vXFoLC
	YOt8aGKwKcoguC9NBN2QHulH5HqK+YIb0qzRoJ8Ly8627/J4iIdQvnVA+OaP3tNKjyWLnGGwSMMUu
	+KhD+3GTg4O1DF615RKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loDpB-001EYR-3i; Tue, 01 Jun 2021 23:29:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loDp4-001EXx-Pi
 for linux-mediatek@lists.infradead.org; Tue, 01 Jun 2021 23:29:26 +0000
X-UUID: 86a9a037432b4328b5d85bc5944c9b25-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4N698Or+OzdASsci1EZ4FkBpg/NKA2aJnI1dcai0wwY=; 
 b=IPhrifKb+z2anA47loHgxRE12Gs+Vw2qggRRQt5MPwAnf51XmhF3s1wDRtmv1nhk9zUmmx/a1iS5MlpuG8brxs1YdyIXtd91AFQraBvr+LMgkwjMYRv2aFmTGxF5AsT9Ncdd2ixZ0hZol0Vd9ABkrzdM71CKFFOyu1khRBU35yI=;
X-UUID: 86a9a037432b4328b5d85bc5944c9b25-20210601
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 929350092; Tue, 01 Jun 2021 16:29:17 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 16:29:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 07:29:14 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 07:29:13 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/3] mt76: connac: add mt76_connac_mcu_update_sta_cmd support
Date: Wed, 2 Jun 2021 07:29:09 +0800
Message-ID: <37cd2b61bfeeb4fd6c14bd3eb2ff611d6b127e1a.1622589640.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_162924_296255_22208AD3 
X-CRM114-Status: GOOD (  18.19  )
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

Add mt76_connac_mcu_update_sta_cmd support that is the prerequisite patch
for we are able to update the station record with the current state the
station has into the offload firmware at runtime.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  6 ++--
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 32 ++++++++++++++-----
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 16 ++++++++--
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  8 +++--
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  3 +-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 +-
 6 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index fc9cd8da2a11..3352c3559c09 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1024,9 +1024,10 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	if (IS_ERR(sskb))
 		return PTR_ERR(sskb);
 
-	mt76_connac_mcu_sta_basic_tlv(sskb, vif, sta, enable);
+	mt76_connac_mcu_sta_basic_tlv(sskb, vif, sta, enable, true);
 	if (enable && sta)
-		mt76_connac_mcu_sta_tlv(phy->mt76, sskb, sta, vif, 0);
+		mt76_connac_mcu_sta_tlv(phy->mt76, sskb, sta, vif, 0,
+					MT76_STA_INFO_STATE_3);
 
 	wtbl_hdr = mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
 						  WTBL_RESET_AND_SET, NULL,
@@ -1152,6 +1153,7 @@ __mt7615_mcu_add_sta(struct mt76_phy *phy, struct ieee80211_vif *vif,
 		.vif = vif,
 		.enable = enable,
 		.cmd = cmd,
+		.state = MT76_STA_INFO_STATE_3,
 	};
 
 	info.wcid = sta ? (struct mt76_wcid *)sta->drv_priv : &mvif->sta.wcid;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 73359defa176..c49e4763fa4c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -304,7 +304,7 @@ EXPORT_SYMBOL_GPL(mt76_connac_mcu_alloc_wtbl_req);
 void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
-				   bool enable)
+				   bool enable, bool newly)
 {
 	struct sta_rec_basic *basic;
 	struct tlv *tlv;
@@ -316,7 +316,8 @@ void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
 	basic->extra_info = cpu_to_le16(EXTRA_INFO_VER);
 
 	if (enable) {
-		basic->extra_info |= cpu_to_le16(EXTRA_INFO_NEW);
+		if (newly)
+			basic->extra_info |= cpu_to_le16(EXTRA_INFO_NEW);
 		basic->conn_state = CONN_STATE_PORT_SECURE;
 	} else {
 		basic->conn_state = CONN_STATE_DISCONNECT;
@@ -709,7 +710,7 @@ mt76_connac_get_phy_mode_v2(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 			     struct ieee80211_sta *sta,
 			     struct ieee80211_vif *vif,
-			     u8 rcpi)
+			     u8 rcpi, u8 sta_state)
 {
 	struct cfg80211_chan_def *chandef = &mphy->chandef;
 	enum nl80211_band band = chandef->chan->band;
@@ -770,7 +771,7 @@ void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_STATE, sizeof(*state));
 	state = (struct sta_rec_state *)tlv;
-	state->state = 2;
+	state->state = sta_state;
 
 	if (sta->vht_cap.vht_supported) {
 		state->vht_opmode = sta->bandwidth;
@@ -862,8 +863,9 @@ void mt76_connac_mcu_wtbl_ht_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_wtbl_ht_tlv);
 
-int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
-				struct mt76_sta_cmd_info *info)
+static int mt76_connac_mcu_sta_cmd(struct mt76_phy *phy,
+				   struct mt76_sta_cmd_info *info,
+				   bool newly)
 {
 	struct mt76_vif *mvif = (struct mt76_vif *)info->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
@@ -875,10 +877,11 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta, info->enable);
+	mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta, info->enable,
+				      newly);
 	if (info->enable && info->sta)
 		mt76_connac_mcu_sta_tlv(phy, skb, info->sta, info->vif,
-					info->rcpi);
+					info->rcpi, info->state);
 
 	sta_wtbl = mt76_connac_mcu_add_tlv(skb, STA_REC_WTBL,
 					   sizeof(struct tlv));
@@ -902,8 +905,21 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
 
 	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
 }
+
+int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
+				struct mt76_sta_cmd_info *info)
+{
+	return mt76_connac_mcu_sta_cmd(phy, info, true);
+}
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_add_sta_cmd);
 
+int mt76_connac_mcu_update_sta_cmd(struct mt76_phy *phy,
+				   struct mt76_sta_cmd_info *info)
+{
+	return mt76_connac_mcu_sta_cmd(phy, info, false);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_update_sta_cmd);
+
 void mt76_connac_mcu_wtbl_ba_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				 struct ieee80211_ampdu_params *params,
 				 bool enable, bool tx, void *sta_wtbl,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index d64b8058b744..6666507f43ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -902,6 +902,14 @@ struct mt76_connac_suspend_tlv {
 	u8 pad[5];
 } __packed;
 
+ /* 0: state 1 - unauthenticated & unassociated
+  * 1: state 2 - authenticated & unassociated
+  * 2: state 3 - authenticated & associated
+  */
+#define MT76_STA_INFO_STATE_1	0
+#define MT76_STA_INFO_STATE_2	1
+#define MT76_STA_INFO_STATE_3	2
+
 struct mt76_sta_cmd_info {
 	struct ieee80211_sta *sta;
 	struct mt76_wcid *wcid;
@@ -911,6 +919,7 @@ struct mt76_sta_cmd_info {
 	bool enable;
 	int cmd;
 	u8 rcpi;
+	u8 state;
 };
 
 #define MT_SKU_POWER_LIMIT	161
@@ -980,7 +989,8 @@ int mt76_connac_mcu_set_channel_domain(struct mt76_phy *phy);
 int mt76_connac_mcu_set_vif_ps(struct mt76_dev *dev, struct ieee80211_vif *vif);
 void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
 				   struct ieee80211_vif *vif,
-				   struct ieee80211_sta *sta, bool enable);
+				   struct ieee80211_sta *sta, bool enable,
+				   bool newly);
 void mt76_connac_mcu_wtbl_generic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_sta *sta, void *sta_wtbl,
@@ -995,7 +1005,7 @@ int mt76_connac_mcu_sta_update_hdr_trans(struct mt76_dev *dev,
 void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 			     struct ieee80211_sta *sta,
 			     struct ieee80211_vif *vif,
-			     u8 rcpi);
+			     u8 rcpi, u8 state);
 void mt76_connac_mcu_wtbl_ht_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				 struct ieee80211_sta *sta, void *sta_wtbl,
 				 void *wtbl_tlv);
@@ -1019,6 +1029,8 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 				bool enable);
 int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
 				struct mt76_sta_cmd_info *info);
+int mt76_connac_mcu_update_sta_cmd(struct mt76_phy *phy,
+				   struct mt76_sta_cmd_info *info);
 void mt76_connac_mcu_beacon_loss_iter(void *priv, u8 *mac,
 				      struct ieee80211_vif *vif);
 int mt76_connac_mcu_set_rts_thresh(struct mt76_dev *dev, u32 val, u8 band);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 472afd4ea487..ece0cecf049d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -570,7 +570,8 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 		mt7921_mcu_uni_bss_ps(dev, vif);
 
 	if (changed & BSS_CHANGED_ASSOC) {
-		mt7921_mcu_sta_add(dev, NULL, vif, true);
+		mt7921_mcu_sta_add(dev, NULL, vif, true,
+				   MT76_STA_INFO_STATE_3);
 		mt7921_bss_bcnft_apply(dev, vif, info->assoc);
 	}
 
@@ -616,7 +617,8 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt7921_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	ret = mt7921_mcu_sta_add(dev, sta, vif, true);
+	ret = mt7921_mcu_sta_add(dev, sta, vif, true,
+				 MT76_STA_INFO_STATE_3);
 	if (ret)
 		return ret;
 
@@ -634,7 +636,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt76_connac_free_pending_tx_skbs(&dev->pm, &msta->wcid);
 	mt76_connac_pm_wake(&dev->mphy, &dev->pm);
 
-	mt7921_mcu_sta_add(dev, sta, vif, false);
+	mt7921_mcu_sta_add(dev, sta, vif, false, MT76_STA_INFO_STATE_1);
 	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 4c97c5bdbf86..631f408520c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1322,7 +1322,7 @@ int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 }
 
 int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
-		       struct ieee80211_vif *vif, bool enable)
+		       struct ieee80211_vif *vif, bool enable, u8 state)
 {
 	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
 	int rssi = -ewma_rssi_read(&mvif->rssi);
@@ -1330,6 +1330,7 @@ int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
 		.sta = sta,
 		.vif = vif,
 		.enable = enable,
+		.state = state,
 		.cmd = MCU_UNI_CMD_STA_REC_UPDATE,
 		.rcpi = to_rcpi(rssi),
 	};
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index a9b21fcc321c..694f85e52222 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -261,7 +261,7 @@ int mt7921_mcu_add_key(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 		       enum set_key_cmd cmd);
 int mt7921_set_channel(struct mt7921_phy *phy);
 int mt7921_mcu_sta_add(struct mt7921_dev *dev, struct ieee80211_sta *sta,
-		       struct ieee80211_vif *vif, bool enable);
+		       struct ieee80211_vif *vif, bool enable, u8 state);
 int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd);
 int mt7921_mcu_set_tx(struct mt7921_dev *dev, struct ieee80211_vif *vif);
 int mt7921_mcu_set_eeprom(struct mt7921_dev *dev);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
