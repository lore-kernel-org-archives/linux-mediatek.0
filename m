Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F5CC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:44:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF75664D9E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF75664D9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+xnOTWf9fhjuaifBGuyPvjCn04L7y9jqN2tXLku7A1I=; b=TRQ4HZNtncqcukf4VWdbQRKTa
	6WQTxJn8w6grCwEL7utPhclNoRKQUy8HZfpmcHd5l/+u2A5IEBtAEr8liOSTI/ellHEvljO0QrlcO
	UHAhEeTOHgh4ns2dadLC/ksyM49f3UvHBZ8vDRazdouOW502vPjF/iWrcZDQkvGoX5KNV1SZjk9gz
	zlQ8JPkHsjnGnv0ak3/fJkbq22BpPIOGJZlo4F026MIiZY9nkKGY6TRufUc061QPePLFsHVH8DFeO
	mBZ7JMMKx2KT+yucF6alXGa04/rDK14lfdTLcyjdMN9tUcWn8Spn1okkTczkrAQkIAjHfMZjM96wM
	rXd8CF3Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4qjy-0003w8-7H; Wed, 27 Jan 2021 19:44:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qjo-0003q5-OF
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 19:44:29 +0000
X-UUID: 26de79f479df40ccb4493b6a4f1c2586-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=272YGtQeKkgtZac52vAk60ZEfLPBCDtLpiFSdi1XNeo=; 
 b=lvkGiDP5O3nKIENBr4xJL4dIzKLmYCGhqqxW5pgbiuL25rMUe/CPzL9XhFJVp/LBDC+3J8izWblgXiBf6gwJgOL4B7TUqgvfXsZAus8C2XtJwuUIReuHxQUks/cG56QYVa6rYJUSHSU2JDEN2Fc+6LHoiCTJlK4dLOeyzBX8r0k=;
X-UUID: 26de79f479df40ccb4493b6a4f1c2586-20210127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1964862751; Wed, 27 Jan 2021 11:44:20 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 11:34:20 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 03:34:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Jan 2021 03:34:01 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v8 14/20] mt76: mt7921: rely on mt76_connac_mcu module
 for sched_scan and hw_scan
Date: Thu, 28 Jan 2021 03:33:51 +0800
Message-ID: <f7a4e64a5d2cdc26d2f6437ce28cd415fd38d6e4.1611774181.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611774181.git.objelf@gmail.com>
References: <cover.1611774181.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A462A907918ABF169E6C74557704DD1D9D1E0DD66BA3AFFD3ADDB53F13ADD8F62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_144425_102409_A7584E4E 
X-CRM114-Status: GOOD (  13.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder.Lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>, Stella.Chang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

Rely on mt76_connac_mcu module for sched_scan and hw_scan and remove
duplicated code

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   9 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  10 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 197 +-----------------
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 116 -----------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  17 +-
 5 files changed, 15 insertions(+), 334 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 4ee7453800c1..04fc69de7369 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -69,12 +69,13 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 
 	wiphy->iface_combinations = if_comb;
 	wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
-	wiphy->max_scan_ie_len = MT7921_SCAN_IE_LEN;
+	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
-	wiphy->max_sched_scan_plan_interval = MT7921_MAX_SCHED_SCAN_INTERVAL;
+	wiphy->max_sched_scan_plan_interval =
+		MT76_CONNAC_MAX_SCHED_SCAN_INTERVAL;
 	wiphy->max_sched_scan_ie_len = IEEE80211_MAX_DATA_LEN;
-	wiphy->max_sched_scan_ssids = MT7921_MAX_SCHED_SCAN_SSID;
-	wiphy->max_match_sets = MT7921_MAX_SCAN_MATCH;
+	wiphy->max_sched_scan_ssids = MT76_CONNAC_MAX_SCHED_SCAN_SSID;
+	wiphy->max_match_sets = MT76_CONNAC_MAX_SCAN_MATCH;
 	wiphy->max_sched_scan_reqs = 1;
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 43ab1d929025..bff00be537f7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -864,7 +864,7 @@ mt7921_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	int err;
 
 	mutex_lock(&dev->mt76.mutex);
-	err = mt7921_mcu_hw_scan(mphy->priv, vif, req);
+	err = mt76_connac_mcu_hw_scan(mphy, vif, req);
 	mutex_unlock(&dev->mt76.mutex);
 
 	return err;
@@ -877,7 +877,7 @@ mt7921_cancel_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	struct mt76_phy *mphy = hw->priv;
 
 	mutex_lock(&dev->mt76.mutex);
-	mt7921_mcu_cancel_hw_scan(mphy->priv, vif);
+	mt76_connac_mcu_cancel_hw_scan(mphy, vif);
 	mutex_unlock(&dev->mt76.mutex);
 }
 
@@ -892,11 +892,11 @@ mt7921_start_sched_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 
 	mutex_lock(&dev->mt76.mutex);
 
-	err = mt7921_mcu_sched_scan_req(mphy->priv, vif, req);
+	err = mt76_connac_mcu_sched_scan_req(mphy, vif, req);
 	if (err < 0)
 		goto out;
 
-	err = mt7921_mcu_sched_scan_enable(mphy->priv, vif, true);
+	err = mt76_connac_mcu_sched_scan_enable(mphy, vif, true);
 out:
 	mutex_unlock(&dev->mt76.mutex);
 
@@ -911,7 +911,7 @@ mt7921_stop_sched_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	int err;
 
 	mutex_lock(&dev->mt76.mutex);
-	err = mt7921_mcu_sched_scan_enable(mphy->priv, vif, false);
+	err = mt76_connac_mcu_sched_scan_enable(mphy, vif, false);
 	mutex_unlock(&dev->mt76.mutex);
 
 	return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index a6a2ee6d5c56..e36cae5711aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1110,197 +1110,7 @@ int mt7921_mcu_get_eeprom(struct mt7921_dev *dev, u32 offset)
 	return 0;
 }
 
-#define MT7921_SCAN_CHANNEL_TIME	60
-int mt7921_mcu_hw_scan(struct mt7921_phy *phy, struct ieee80211_vif *vif,
-		       struct ieee80211_scan_request *scan_req)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct cfg80211_scan_request *sreq = &scan_req->req;
-	int n_ssids = 0, err, i, duration = MT7921_SCAN_CHANNEL_TIME;
-	int ext_channels_num = max_t(int, sreq->n_channels - 32, 0);
-	struct ieee80211_channel **scan_list = sreq->channels;
-	struct mt7921_dev *dev = phy->dev;
-	struct mt7921_mcu_scan_channel *chan;
-	struct mt7921_hw_scan_req *req;
-	struct sk_buff *skb;
-
-	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL, sizeof(*req));
-	if (!skb)
-		return -ENOMEM;
-
-	set_bit(MT76_HW_SCANNING, &phy->mt76->state);
-	mvif->mt76.scan_seq_num = (mvif->mt76.scan_seq_num + 1) & 0x7f;
-
-	req = (struct mt7921_hw_scan_req *)skb_put(skb, sizeof(*req));
-
-	req->seq_num = mvif->mt76.scan_seq_num;
-	req->bss_idx = mvif->mt76.idx;
-	req->scan_type = sreq->n_ssids ? 1 : 0;
-	req->probe_req_num = sreq->n_ssids ? 2 : 0;
-	req->version = 1;
-
-	for (i = 0; i < sreq->n_ssids; i++) {
-		if (!sreq->ssids[i].ssid_len)
-			continue;
-
-		req->ssids[i].ssid_len = cpu_to_le32(sreq->ssids[i].ssid_len);
-		memcpy(req->ssids[i].ssid, sreq->ssids[i].ssid,
-		       sreq->ssids[i].ssid_len);
-		n_ssids++;
-	}
-	req->ssid_type = n_ssids ? BIT(2) : BIT(0);
-	req->ssid_type_ext = n_ssids ? BIT(0) : 0;
-	req->ssids_num = n_ssids;
-
-	/* increase channel time for passive scan */
-	if (!sreq->n_ssids)
-		duration *= 2;
-	req->timeout_value = cpu_to_le16(sreq->n_channels * duration);
-	req->channel_min_dwell_time = cpu_to_le16(duration);
-	req->channel_dwell_time = cpu_to_le16(duration);
-
-	req->channels_num = min_t(u8, sreq->n_channels, 32);
-	req->ext_channels_num = min_t(u8, ext_channels_num, 32);
-	for (i = 0; i < req->channels_num + req->ext_channels_num; i++) {
-		if (i >= 32)
-			chan = &req->ext_channels[i - 32];
-		else
-			chan = &req->channels[i];
-
-		chan->band = scan_list[i]->band == NL80211_BAND_2GHZ ? 1 : 2;
-		chan->channel_num = scan_list[i]->hw_value;
-	}
-	req->channel_type = sreq->n_channels ? 4 : 0;
-
-	if (sreq->ie_len > 0) {
-		memcpy(req->ies, sreq->ie, sreq->ie_len);
-		req->ies_len = cpu_to_le16(sreq->ie_len);
-	}
-
-	memcpy(req->bssid, sreq->bssid, ETH_ALEN);
-	if (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
-		get_random_mask_addr(req->random_mac, sreq->mac_addr,
-				     sreq->mac_addr_mask);
-		req->scan_func = 1;
-	}
-
-	err = mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_CMD_START_HW_SCAN,
-				    false);
-	if (err < 0)
-		clear_bit(MT76_HW_SCANNING, &phy->mt76->state);
-
-	return err;
-}
-
-int mt7921_mcu_cancel_hw_scan(struct mt7921_phy *phy,
-			      struct ieee80211_vif *vif)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct mt7921_dev *dev = phy->dev;
-	struct {
-		u8 seq_num;
-		u8 is_ext_channel;
-		u8 rsv[2];
-	} __packed req = {
-		.seq_num = mvif->mt76.scan_seq_num,
-	};
-
-	if (test_and_clear_bit(MT76_HW_SCANNING, &phy->mt76->state)) {
-		struct cfg80211_scan_info info = {
-			.aborted = true,
-		};
-
-		ieee80211_scan_completed(phy->mt76->hw, &info);
-	}
-
-	return mt76_mcu_send_msg(&dev->mt76,  MCU_CMD_CANCEL_HW_SCAN, &req,
-				 sizeof(req), false);
-}
-
-int mt7921_mcu_sched_scan_req(struct mt7921_phy *phy,
-			      struct ieee80211_vif *vif,
-			      struct cfg80211_sched_scan_request *sreq)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct ieee80211_channel **scan_list = sreq->channels;
-	struct mt7921_dev *dev = phy->dev;
-	struct mt7921_mcu_scan_channel *chan;
-	struct mt7921_sched_scan_req *req;
-	struct cfg80211_match_set *match;
-	struct cfg80211_ssid *ssid;
-	struct sk_buff *skb;
-	int i;
-
-	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL,
-				 sizeof(*req) + sreq->ie_len);
-	if (!skb)
-		return -ENOMEM;
-
-	mvif->mt76.scan_seq_num = (mvif->mt76.scan_seq_num + 1) & 0x7f;
-
-	req = (struct mt7921_sched_scan_req *)skb_put(skb, sizeof(*req));
-	req->version = 1;
-	req->seq_num = mvif->mt76.scan_seq_num;
-
-	req->ssids_num = sreq->n_ssids;
-	for (i = 0; i < req->ssids_num; i++) {
-		ssid = &sreq->ssids[i];
-		memcpy(req->ssids[i].ssid, ssid->ssid, ssid->ssid_len);
-		req->ssids[i].ssid_len = cpu_to_le32(ssid->ssid_len);
-	}
-
-	req->match_num = sreq->n_match_sets;
-	for (i = 0; i < req->match_num; i++) {
-		match = &sreq->match_sets[i];
-		memcpy(req->match[i].ssid, match->ssid.ssid,
-		       match->ssid.ssid_len);
-		req->match[i].rssi_th = cpu_to_le32(match->rssi_thold);
-		req->match[i].ssid_len = match->ssid.ssid_len;
-	}
-
-	req->channel_type = sreq->n_channels ? 4 : 0;
-	req->channels_num = min_t(u8, sreq->n_channels, 64);
-	for (i = 0; i < req->channels_num; i++) {
-		chan = &req->channels[i];
-		chan->band = scan_list[i]->band == NL80211_BAND_2GHZ ? 1 : 2;
-		chan->channel_num = scan_list[i]->hw_value;
-	}
-
-	req->intervals_num = sreq->n_scan_plans;
-	for (i = 0; i < req->intervals_num; i++)
-		req->intervals[i] = cpu_to_le16(sreq->scan_plans[i].interval);
-
-	if (sreq->ie_len > 0) {
-		req->ie_len = cpu_to_le16(sreq->ie_len);
-		memcpy(skb_put(skb, sreq->ie_len), sreq->ie, sreq->ie_len);
-	}
-
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_CMD_SCHED_SCAN_REQ,
-				     false);
-}
-
-int mt7921_mcu_sched_scan_enable(struct mt7921_phy *phy,
-				 struct ieee80211_vif *vif,
-				 bool enable)
-{
-	struct mt7921_dev *dev = phy->dev;
-	struct {
-		u8 active; /* 0: enabled 1: disabled */
-		u8 rsv[3];
-	} __packed req = {
-		.active = !enable,
-	};
-
-	if (enable)
-		set_bit(MT76_HW_SCHED_SCANNING, &phy->mt76->state);
-	else
-		clear_bit(MT76_HW_SCHED_SCANNING, &phy->mt76->state);
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SCHED_SCAN_ENABLE, &req,
-				 sizeof(req), false);
-}
-
-u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u16 wlan_idx)
+u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u32 wlan_idx)
 {
 	struct mt7921_mcu_wlan_info wtbl_info = {
 		.wlan_idx = cpu_to_le32(wlan_idx),
@@ -1502,9 +1312,10 @@ mt7921_mcu_set_wow_ctrl(struct mt7921_phy *phy, struct ieee80211_vif *vif,
 	if (wowlan->disconnect)
 		req.wow_ctrl_tlv.trigger |= BIT(2);
 	if (wowlan->nd_config) {
-		mt7921_mcu_sched_scan_req(phy, vif, wowlan->nd_config);
+		mt76_connac_mcu_sched_scan_req(&dev->mphy, vif,
+					       wowlan->nd_config);
 		req.wow_ctrl_tlv.trigger |= BIT(5);
-		mt7921_mcu_sched_scan_enable(phy, vif, suspend);
+		mt76_connac_mcu_sched_scan_enable(&dev->mphy, vif, suspend);
 	}
 
 	if (mt76_is_mmio(&dev->mt76))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index 081c9abc9386..4682cc7c583b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -386,122 +386,6 @@ struct mt7921_mcu_reg_event {
 	__le32 val;
 } __packed;
 
-struct mt7921_mcu_scan_ssid {
-	__le32 ssid_len;
-	u8 ssid[IEEE80211_MAX_SSID_LEN];
-} __packed;
-
-struct mt7921_mcu_scan_channel {
-	u8 band; /* 1: 2.4GHz
-		  * 2: 5.0GHz
-		  * Others: Reserved
-		  */
-	u8 channel_num;
-} __packed;
-
-struct mt7921_mcu_scan_match {
-	__le32 rssi_th;
-	u8 ssid[IEEE80211_MAX_SSID_LEN];
-	u8 ssid_len;
-	u8 rsv[3];
-} __packed;
-
-struct mt7921_hw_scan_req {
-	u8 seq_num;
-	u8 bss_idx;
-	u8 scan_type; /* 0: PASSIVE SCAN
-		       * 1: ACTIVE SCAN
-		       */
-	u8 ssid_type; /* BIT(0) wildcard SSID
-		       * BIT(1) P2P wildcard SSID
-		       * BIT(2) specified SSID + wildcard SSID
-		       * BIT(2) + ssid_type_ext BIT(0) specified SSID only
-		       */
-	u8 ssids_num;
-	u8 probe_req_num; /* Number of probe request for each SSID */
-	u8 scan_func; /* BIT(0) Enable random MAC scan
-		       * BIT(1) Disable DBDC scan type 1~3.
-		       * BIT(2) Use DBDC scan type 3 (dedicated one RF to scan).
-		       */
-	u8 version; /* 0: Not support fields after ies.
-		     * 1: Support fields after ies.
-		     */
-	struct mt7921_mcu_scan_ssid ssids[4];
-	__le16 probe_delay_time;
-	__le16 channel_dwell_time; /* channel Dwell interval */
-	__le16 timeout_value;
-	u8 channel_type; /* 0: Full channels
-			  * 1: Only 2.4GHz channels
-			  * 2: Only 5GHz channels
-			  * 3: P2P social channel only (channel #1, #6 and #11)
-			  * 4: Specified channels
-			  * Others: Reserved
-			  */
-	u8 channels_num; /* valid when channel_type is 4 */
-	/* valid when channels_num is set */
-	struct mt7921_mcu_scan_channel channels[32];
-	__le16 ies_len;
-	u8 ies[MT7921_SCAN_IE_LEN];
-	/* following fields are valid if version > 0 */
-	u8 ext_channels_num;
-	u8 ext_ssids_num;
-	__le16 channel_min_dwell_time;
-	struct mt7921_mcu_scan_channel ext_channels[32];
-	struct mt7921_mcu_scan_ssid ext_ssids[6];
-	u8 bssid[ETH_ALEN];
-	u8 random_mac[ETH_ALEN]; /* valid when BIT(1) in scan_func is set. */
-	u8 pad[63];
-	u8 ssid_type_ext;
-} __packed;
-
-#define SCAN_DONE_EVENT_MAX_CHANNEL_NUM	64
-struct mt7921_hw_scan_done {
-	u8 seq_num;
-	u8 sparse_channel_num;
-	struct mt7921_mcu_scan_channel sparse_channel;
-	u8 complete_channel_num;
-	u8 current_state;
-	u8 version;
-	u8 pad;
-	__le32 beacon_scan_num;
-	u8 pno_enabled;
-	u8 pad2[3];
-	u8 sparse_channel_valid_num;
-	u8 pad3[3];
-	u8 channel_num[SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
-	/* idle format for channel_idle_time
-	 * 0: first bytes: idle time(ms) 2nd byte: dwell time(ms)
-	 * 1: first bytes: idle time(8ms) 2nd byte: dwell time(8ms)
-	 * 2: dwell time (16us)
-	 */
-	__le16 channel_idle_time[SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
-	/* beacon and probe response count */
-	u8 beacon_probe_num[SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
-	u8 mdrdy_count[SCAN_DONE_EVENT_MAX_CHANNEL_NUM];
-	__le32 beacon_2g_num;
-	__le32 beacon_5g_num;
-} __packed;
-
-struct mt7921_sched_scan_req {
-	u8 version;
-	u8 seq_num;
-	u8 stop_on_match;
-	u8 ssids_num;
-	u8 match_num;
-	u8 pad;
-	__le16 ie_len;
-	struct mt7921_mcu_scan_ssid ssids[MT7921_MAX_SCHED_SCAN_SSID];
-	struct mt7921_mcu_scan_match match[MT7921_MAX_SCAN_MATCH];
-	u8 channel_type;
-	u8 channels_num;
-	u8 intervals_num;
-	u8 scan_func;
-	struct mt7921_mcu_scan_channel channels[64];
-	__le16 intervals[MT7921_MAX_SCHED_SCAN_INTERVAL];
-	u8 bss_idx;
-	u8 pad2[64];
-} __packed;
-
 struct mt7921_mcu_tx_config {
 	u8 peer_addr[ETH_ALEN];
 	u8 sw;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 96f205ffbbd1..6085531cfd06 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -43,11 +43,6 @@
 #define MT7921_SKU_MAX_DELTA_IDX	MT7921_SKU_RATE_NUM
 #define MT7921_SKU_TABLE_SIZE		(MT7921_SKU_RATE_NUM + 1)
 
-#define MT7921_SCAN_IE_LEN		600
-#define MT7921_MAX_SCHED_SCAN_INTERVAL	10
-#define MT7921_MAX_SCHED_SCAN_SSID	10
-#define MT7921_MAX_SCAN_MATCH		16
-
 struct mt7921_vif;
 struct mt7921_sta;
 
@@ -314,17 +309,7 @@ int mt7921_mcu_uni_rx_ba(struct mt7921_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool enable);
 void mt7921_scan_work(struct work_struct *work);
-int mt7921_mcu_hw_scan(struct mt7921_phy *phy, struct ieee80211_vif *vif,
-		       struct ieee80211_scan_request *scan_req);
-int mt7921_mcu_sched_scan_req(struct mt7921_phy *phy,
-			      struct ieee80211_vif *vif,
-			      struct cfg80211_sched_scan_request *sreq);
-int mt7921_mcu_sched_scan_enable(struct mt7921_phy *phy,
-				 struct ieee80211_vif *vif,
-				 bool enable);
-int mt7921_mcu_cancel_hw_scan(struct mt7921_phy *phy,
-			      struct ieee80211_vif *vif);
-u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u16 wlan_idx);
+u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u32 wlan_idx);
 int mt7921_mcu_uni_bss_ps(struct mt7921_dev *dev, struct ieee80211_vif *vif);
 int mt7921_mcu_uni_bss_bcnft(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 			     bool enable);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
