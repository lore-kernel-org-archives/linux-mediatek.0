Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C244FC2BA17
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9416220787
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 13:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PiuBPCCe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rpozFOB8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9416220787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sg3TTQjCBksnFM1JHDFYISerNhEwedu3EVhOjjiJCbM=; b=PiuBPCCedBZFqR
	3TTQ5jJ80XEx79nPx068fmykSUR8jk87KIezfo2eOKMVq507lZ7f7bp3VgmFzzX2BMuQfpUJBfQfN
	PjEvNS47pNvUB07SqFprFFi6tnYJX36/mayZeDs+nGE74rORyUYXQlXcbU45caWXtcsYp1vV9Drla
	bERs4vEaCUDk3ME/aHE+qQ63paBVtXDtBLMt9MI/JK2VALhSYs623eYoy+I9zBQsl1gOJ1HcCnAJz
	Zyiv8d+xv2MLsbrumHTpuGnv0Z1sbUkj78wh9Qzt9OZLUBPO07Jwe2wYelQQVHZEDQ6CwBS9a3ng6
	/swrpw7uBVWJSmfVC8PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJzZs-0005Dl-LE; Thu, 02 Apr 2020 13:08:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJzZp-00058a-Pv
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 13:08:11 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29C58206F5;
 Thu,  2 Apr 2020 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585832889;
 bh=EFk0mHZTq0Lpip6iQdkOjEdbeYMwalfhB/zwSXKtj6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rpozFOB8fvRpqAkvYSBQq0MUmGzmDja1cEubTvmFeSvqrsOhrkgTfzWvvaOzt5oMI
 CYTkkvJDQg+aBT4s8oszbVFGz5H8CaUq1VVtGQMgWuYZ637n6YQZLixu6s7CbMUrIl
 9UaNHO5SUe+wWmvCNF5BqeJ/uFtZJPTD/AUMkzgU=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 11/12] mt76: mt7615: introduce rlm tlv in bss_info mcu command
Date: Thu,  2 Apr 2020 15:06:41 +0200
Message-Id: <571a8321571203e8ee5cb395cdd069f2c40b893d.1585832459.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585832458.git.lorenzo@kernel.org>
References: <cover.1585832458.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_060809_899011_2A6F1A53 
X-CRM114-Status: GOOD (  14.10  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce rlm tlv header in bss_info mcu command in order to
inform the mcu about operating channel. Rlm header is necessary only if
the mcu is running low power functionalities (e.g offloaded scan)

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   6 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 111 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |   1 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |   4 +-
 4 files changed, 104 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 2c2d763b667c..c91f0896b09f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -410,15 +410,15 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 				    u32 changed)
 {
 	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	struct mt7615_phy *phy = mt7615_hw_phy(hw);
 
 	mutex_lock(&dev->mt76.mutex);
 
 	if (changed & BSS_CHANGED_ASSOC)
-		mt7615_mcu_add_bss_info(dev, vif, info->assoc);
+		mt7615_mcu_add_bss_info(phy, vif, info->assoc);
 
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = info->use_short_slot ? 9 : 20;
-		struct mt7615_phy *phy = mt7615_hw_phy(hw);
 
 		if (slottime != phy->slottime) {
 			phy->slottime = slottime;
@@ -427,7 +427,7 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
-		mt7615_mcu_add_bss_info(dev, vif, info->enable_beacon);
+		mt7615_mcu_add_bss_info(phy, vif, info->enable_beacon);
 		mt7615_mcu_sta_add(dev, vif, NULL, info->enable_beacon);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 5385d16e435d..9bb65de0cc64 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -967,10 +967,11 @@ mt7615_mcu_wtbl_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 }
 
 static int
-mt7615_mcu_add_bss(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+mt7615_mcu_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 		   bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	struct mt7615_dev *dev = phy->dev;
 	struct sk_buff *skb;
 
 	skb = mt7615_mcu_alloc_sta_req(mvif, NULL);
@@ -1244,12 +1245,15 @@ mt7615_mcu_uni_ctrl_pm_state(struct mt7615_dev *dev, int band, int state)
 }
 
 static int
-mt7615_mcu_uni_add_bss(struct mt7615_dev *dev,
+mt7615_mcu_uni_add_bss(struct mt7615_phy *phy,
 		       struct ieee80211_vif *vif, bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
+	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
+	struct mt7615_dev *dev = phy->dev;
 	struct {
-		struct req_hdr {
+		struct {
 			u8 bss_idx;
 			u8 pad[3];
 		} __packed hdr;
@@ -1267,12 +1271,18 @@ mt7615_mcu_uni_add_bss(struct mt7615_dev *dev,
 			__le16 bmc_tx_wlan_idx;
 			__le16 bcn_interval;
 			u8 dtim_period;
-			u8 phymode;
+			u8 phymode; /* bit(0): A
+				     * bit(1): B
+				     * bit(2): G
+				     * bit(3): GN
+				     * bit(4): AN
+				     * bit(5): AC
+				     */
 			__le16 sta_idx;
 			u8 nonht_basic_phy;
 			u8 pad[3];
 		} __packed basic;
-	} req = {
+	} basic_req = {
 		.hdr = {
 			.bss_idx = mvif->idx,
 		},
@@ -1285,17 +1295,53 @@ mt7615_mcu_uni_add_bss(struct mt7615_dev *dev,
 			.band_idx = mvif->band_idx,
 			.wmm_idx = mvif->wmm_idx,
 			.active = enable,
+			.phymode = 0x38,
+		},
+	};
+	struct {
+		struct {
+			u8 bss_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct rlm_tlv {
+			__le16 tag;
+			__le16 len;
+			u8 control_channel;
+			u8 center_chan;
+			u8 center_chan2;
+			u8 bw;
+			u8 tx_streams;
+			u8 rx_streams;
+			u8 short_st;
+			u8 ht_op_info;
+			u8 sco;
+			u8 pad[3];
+		} __packed rlm;
+	} __packed rlm_req = {
+		.hdr = {
+			.bss_idx = mvif->idx,
+		},
+		.rlm = {
+			.tag = cpu_to_le16(UNI_BSS_INFO_RLM),
+			.len = cpu_to_le16(sizeof(struct rlm_tlv)),
+			.control_channel = chandef->chan->hw_value,
+			.center_chan = ieee80211_frequency_to_channel(freq1),
+			.center_chan2 = ieee80211_frequency_to_channel(freq2),
+			.tx_streams = hweight8(phy->mt76->antenna_mask),
+			.rx_streams = phy->chainmask,
+			.short_st = true,
 		},
 	};
 	u8 idx, tx_wlan_idx = 0;
+	int err;
 
 	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
-	req.basic.hw_bss_idx = idx;
+	basic_req.basic.hw_bss_idx = idx;
 
 	switch (vif->type) {
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
-		req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_AP);
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_AP);
 		tx_wlan_idx = mvif->sta.wcid.idx;
 		break;
 	case NL80211_IFTYPE_STATION:
@@ -1314,20 +1360,59 @@ mt7615_mcu_uni_add_bss(struct mt7615_dev *dev,
 			tx_wlan_idx = msta->wcid.idx;
 			rcu_read_unlock();
 		}
-		req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_STA);
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_STA);
 		break;
 	default:
 		WARN_ON(1);
 		break;
 	}
 
-	memcpy(req.basic.bssid, vif->bss_conf.bssid, ETH_ALEN);
-	req.basic.bmc_tx_wlan_idx = cpu_to_le16(tx_wlan_idx);
-	req.basic.sta_idx = cpu_to_le16(tx_wlan_idx);
-	req.basic.conn_state = !enable;
+	memcpy(basic_req.basic.bssid, vif->bss_conf.bssid, ETH_ALEN);
+	basic_req.basic.bmc_tx_wlan_idx = cpu_to_le16(tx_wlan_idx);
+	basic_req.basic.sta_idx = cpu_to_le16(tx_wlan_idx);
+	basic_req.basic.conn_state = !enable;
+
+	err = __mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_BSS_INFO_UPDATE,
+				  &basic_req, sizeof(basic_req), true);
+	if (err < 0)
+		return err;
+
+	if (!mt7615_firmware_offload(dev))
+		return 0;
+
+	switch (chandef->width) {
+	case NL80211_CHAN_WIDTH_40:
+		rlm_req.rlm.bw = CMD_CBW_40MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		rlm_req.rlm.bw = CMD_CBW_80MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+		rlm_req.rlm.bw = CMD_CBW_8080MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		rlm_req.rlm.bw = CMD_CBW_160MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+		rlm_req.rlm.bw = CMD_CBW_5MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_10:
+		rlm_req.rlm.bw = CMD_CBW_10MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_20_NOHT:
+	case NL80211_CHAN_WIDTH_20:
+	default:
+		rlm_req.rlm.bw = CMD_CBW_20MHZ;
+		break;
+	}
+
+	if (rlm_req.rlm.control_channel < rlm_req.rlm.center_chan)
+		rlm_req.rlm.sco = 1; /* SCA */
+	else if (rlm_req.rlm.control_channel > rlm_req.rlm.center_chan)
+		rlm_req.rlm.sco = 3; /* SCB */
 
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_BSS_INFO_UPDATE,
-				   &req, sizeof(req), true);
+				   &rlm_req, sizeof(rlm_req), true);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index e6a927fd209f..43c13a47cea2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -423,6 +423,7 @@ enum {
 
 enum {
 	UNI_BSS_INFO_BASIC = 0,
+	UNI_BSS_INFO_RLM = 2,
 	UNI_BSS_INFO_BCN_CONTENT = 7,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index ab2cd23e6f70..8c3751a642af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -164,7 +164,7 @@ struct mt7615_phy {
 #define mt7615_mcu_add_rx_ba(dev, ...)	(dev)->mcu_ops->add_rx_ba((dev), __VA_ARGS__)
 #define mt7615_mcu_sta_add(dev, ...)	(dev)->mcu_ops->sta_add((dev),  __VA_ARGS__)
 #define mt7615_mcu_add_dev_info(dev, ...) (dev)->mcu_ops->add_dev_info((dev),  __VA_ARGS__)
-#define mt7615_mcu_add_bss_info(dev, ...) (dev)->mcu_ops->add_bss_info((dev),  __VA_ARGS__)
+#define mt7615_mcu_add_bss_info(phy, ...) (phy->dev)->mcu_ops->add_bss_info((phy),  __VA_ARGS__)
 #define mt7615_mcu_add_beacon(dev, ...)	(dev)->mcu_ops->add_beacon_offload((dev),  __VA_ARGS__)
 #define mt7615_mcu_set_pm(dev, ...)	(dev)->mcu_ops->set_pm_state((dev),  __VA_ARGS__)
 struct mt7615_mcu_ops {
@@ -179,7 +179,7 @@ struct mt7615_mcu_ops {
 		       struct ieee80211_sta *sta, bool enable);
 	int (*add_dev_info)(struct mt7615_dev *dev,
 			    struct ieee80211_vif *vif, bool enable);
-	int (*add_bss_info)(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+	int (*add_bss_info)(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 			    bool enable);
 	int (*add_beacon_offload)(struct mt7615_dev *dev,
 				  struct ieee80211_hw *hw,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
