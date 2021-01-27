Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9D8C433E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:34:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A274064D9E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 19:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A274064D9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L3s3gNWCFGXJBdo0whRoK4P5YiQuEQRYZLe3y3LqvsE=; b=YOS6K9o4rHwf/tuYrlwqixZKH
	ovPNqsW1JNSOREF8/2DLFa/1UI04BlDx9K0633KFa++n/+SK1QeAbz+j8LiFr+AxM4dYH9YfvHL+R
	oqBv7oVBI9odtG74JNYYYfyrbuZ/1lmpg3JYiK3fqUUXoBlZ53KNPPAkriLjIf08bcZFHoypUWVUo
	GY35QF305CLJ9nSYLARzflD4fKT/6qLtIpf7+fgix1qSxiryvG74QwjyWEdlyau9MMKDFFj/pTkBR
	U2x+HebefDYxLRjIhVhPIZcmEv8kCoPwifVUVaU9gQDfgbq212bLHynA2OahqqzhWpPRUGnqmdA/1
	gRyEufo5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4qa0-00021y-Jk; Wed, 27 Jan 2021 19:34:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qZs-0001yQ-Md
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 19:34:11 +0000
X-UUID: 8599690a3e304fe5a727b6f9b3a0cad0-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aimapEgmp/36395Gd5CNBSGM3rQNuPm6xJR+R9sxbkk=; 
 b=cEPc51UiFySOSAaenJrF7J4M/yJEyIASwR82gCDk96UFQkMXqhQjZrlgUqaBBDPcySJccAERQHReUWO5W7KwUnPvan9ilJ0uYEDiK8vs1A1CcXR+gUkXheFxoKJ3oX0mtpD/h1fw6utHJMa8n4kTfHGg+IGp47XcvRuzO1qqavc=;
X-UUID: 8599690a3e304fe5a727b6f9b3a0cad0-20210127
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1954687661; Wed, 27 Jan 2021 11:34:02 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 11:34:01 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 03:34:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Jan 2021 03:34:00 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v8 08/20] mt76: mt7921: introduce schedule scan support
Date: Thu, 28 Jan 2021 03:33:45 +0800
Message-ID: <a26b11b405013edd68c7d2903c8ee3bc61221f2a.1611774181.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611774181.git.objelf@gmail.com>
References: <cover.1611774181.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8BB5DFD5E8F3D5DA032A60C5E270D9824AC920A0CD1B2BD180A765295A6837102000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_143409_013445_9E8D5D82 
X-CRM114-Status: GOOD (  17.12  )
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

From: Sean Wang <sean.wang@mediatek.com>

introduce schedule scan to control mt7921 firmware to do background scan in
defined plan to see if the matched SSID is available.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  5 ++
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 38 +++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 83 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   | 20 +++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  9 ++
 5 files changed, 155 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 1ce87a4bfdd9..14d78370d525 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -70,6 +70,11 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
 	wiphy->max_scan_ie_len = MT7921_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
+	wiphy->max_sched_scan_plan_interval = MT7921_MAX_SCHED_SCAN_INTERVAL;
+	wiphy->max_sched_scan_ie_len = IEEE80211_MAX_DATA_LEN;
+	wiphy->max_sched_scan_ssids = MT7921_MAX_SCHED_SCAN_SSID;
+	wiphy->max_match_sets = MT7921_MAX_SCAN_MATCH;
+	wiphy->max_sched_scan_reqs = 1;
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SET_SCAN_DWELL);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index ed82dc193bf3..018025a666a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -868,6 +868,42 @@ mt7921_cancel_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	mutex_unlock(&dev->mt76.mutex);
 }
 
+static int
+mt7921_start_sched_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			struct cfg80211_sched_scan_request *req,
+			struct ieee80211_scan_ies *ies)
+{
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	struct mt76_phy *mphy = hw->priv;
+	int err;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	err = mt7921_mcu_sched_scan_req(mphy->priv, vif, req);
+	if (err < 0)
+		goto out;
+
+	err = mt7921_mcu_sched_scan_enable(mphy->priv, vif, true);
+out:
+	mutex_unlock(&dev->mt76.mutex);
+
+	return err;
+}
+
+static int
+mt7921_stop_sched_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+{
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	struct mt76_phy *mphy = hw->priv;
+	int err;
+
+	mutex_lock(&dev->mt76.mutex);
+	err = mt7921_mcu_sched_scan_enable(mphy->priv, vif, false);
+	mutex_unlock(&dev->mt76.mutex);
+
+	return err;
+}
+
 static int
 mt7921_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 {
@@ -957,4 +993,6 @@ const struct ieee80211_ops mt7921_ops = {
 	.hw_scan = mt7921_hw_scan,
 	.cancel_hw_scan = mt7921_cancel_hw_scan,
 	.sta_statistics = mt7921_sta_statistics,
+	.sched_scan_start = mt7921_start_sched_scan,
+	.sched_scan_stop = mt7921_stop_sched_scan,
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index ee4b52558974..6f2b4086ca81 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -2361,6 +2361,89 @@ int mt7921_mcu_cancel_hw_scan(struct mt7921_phy *phy,
 				 sizeof(req), false);
 }
 
+int mt7921_mcu_sched_scan_req(struct mt7921_phy *phy,
+			      struct ieee80211_vif *vif,
+			      struct cfg80211_sched_scan_request *sreq)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct ieee80211_channel **scan_list = sreq->channels;
+	struct mt7921_dev *dev = phy->dev;
+	struct mt7921_mcu_scan_channel *chan;
+	struct mt7921_sched_scan_req *req;
+	struct cfg80211_match_set *match;
+	struct cfg80211_ssid *ssid;
+	struct sk_buff *skb;
+	int i;
+
+	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL,
+				 sizeof(*req) + sreq->ie_len);
+	if (!skb)
+		return -ENOMEM;
+
+	mvif->mt76.scan_seq_num = (mvif->mt76.scan_seq_num + 1) & 0x7f;
+
+	req = (struct mt7921_sched_scan_req *)skb_put(skb, sizeof(*req));
+	req->version = 1;
+	req->seq_num = mvif->mt76.scan_seq_num;
+
+	req->ssids_num = sreq->n_ssids;
+	for (i = 0; i < req->ssids_num; i++) {
+		ssid = &sreq->ssids[i];
+		memcpy(req->ssids[i].ssid, ssid->ssid, ssid->ssid_len);
+		req->ssids[i].ssid_len = cpu_to_le32(ssid->ssid_len);
+	}
+
+	req->match_num = sreq->n_match_sets;
+	for (i = 0; i < req->match_num; i++) {
+		match = &sreq->match_sets[i];
+		memcpy(req->match[i].ssid, match->ssid.ssid,
+		       match->ssid.ssid_len);
+		req->match[i].rssi_th = cpu_to_le32(match->rssi_thold);
+		req->match[i].ssid_len = match->ssid.ssid_len;
+	}
+
+	req->channel_type = sreq->n_channels ? 4 : 0;
+	req->channels_num = min_t(u8, sreq->n_channels, 64);
+	for (i = 0; i < req->channels_num; i++) {
+		chan = &req->channels[i];
+		chan->band = scan_list[i]->band == NL80211_BAND_2GHZ ? 1 : 2;
+		chan->channel_num = scan_list[i]->hw_value;
+	}
+
+	req->intervals_num = sreq->n_scan_plans;
+	for (i = 0; i < req->intervals_num; i++)
+		req->intervals[i] = cpu_to_le16(sreq->scan_plans[i].interval);
+
+	if (sreq->ie_len > 0) {
+		req->ie_len = cpu_to_le16(sreq->ie_len);
+		memcpy(skb_put(skb, sreq->ie_len), sreq->ie, sreq->ie_len);
+	}
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_CMD_SCHED_SCAN_REQ,
+				     false);
+}
+
+int mt7921_mcu_sched_scan_enable(struct mt7921_phy *phy,
+				 struct ieee80211_vif *vif,
+				 bool enable)
+{
+	struct mt7921_dev *dev = phy->dev;
+	struct {
+		u8 active; /* 0: enabled 1: disabled */
+		u8 rsv[3];
+	} __packed req = {
+		.active = !enable,
+	};
+
+	if (enable)
+		set_bit(MT76_HW_SCHED_SCANNING, &phy->mt76->state);
+	else
+		clear_bit(MT76_HW_SCHED_SCANNING, &phy->mt76->state);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SCHED_SCAN_ENABLE, &req,
+				 sizeof(req), false);
+}
+
 u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u16 wlan_idx)
 {
 	struct mt7921_mcu_wlan_info wtbl_info = {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index 96eecea22d94..6894b44ff62d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -879,6 +879,26 @@ struct mt7921_hw_scan_done {
 	__le32 beacon_5g_num;
 } __packed;
 
+struct mt7921_sched_scan_req {
+	u8 version;
+	u8 seq_num;
+	u8 stop_on_match;
+	u8 ssids_num;
+	u8 match_num;
+	u8 pad;
+	__le16 ie_len;
+	struct mt7921_mcu_scan_ssid ssids[MT7921_MAX_SCHED_SCAN_SSID];
+	struct mt7921_mcu_scan_match match[MT7921_MAX_SCAN_MATCH];
+	u8 channel_type;
+	u8 channels_num;
+	u8 intervals_num;
+	u8 scan_func;
+	struct mt7921_mcu_scan_channel channels[64];
+	__le16 intervals[MT7921_MAX_SCHED_SCAN_INTERVAL];
+	u8 bss_idx;
+	u8 pad2[64];
+} __packed;
+
 struct mt7921_mcu_bss_event {
 	u8 bss_idx;
 	u8 is_absent;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index b08ece8544ff..8cd9d3e214ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -44,6 +44,9 @@
 #define MT7921_SKU_TABLE_SIZE		(MT7921_SKU_RATE_NUM + 1)
 
 #define MT7921_SCAN_IE_LEN		600
+#define MT7921_MAX_SCHED_SCAN_INTERVAL	10
+#define MT7921_MAX_SCHED_SCAN_SSID	10
+#define MT7921_MAX_SCAN_MATCH		16
 
 struct mt7921_vif;
 struct mt7921_sta;
@@ -343,6 +346,12 @@ void mt7921_scan_work(struct work_struct *work);
 int mt7921_mcu_set_channel_domain(struct mt7921_phy *phy);
 int mt7921_mcu_hw_scan(struct mt7921_phy *phy, struct ieee80211_vif *vif,
 		       struct ieee80211_scan_request *scan_req);
+int mt7921_mcu_sched_scan_req(struct mt7921_phy *phy,
+			      struct ieee80211_vif *vif,
+			      struct cfg80211_sched_scan_request *sreq);
+int mt7921_mcu_sched_scan_enable(struct mt7921_phy *phy,
+				 struct ieee80211_vif *vif,
+				 bool enable);
 int mt7921_mcu_cancel_hw_scan(struct mt7921_phy *phy,
 			      struct ieee80211_vif *vif);
 u32 mt7921_get_wtbl_info(struct mt7921_dev *dev, u16 wlan_idx);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
