Return-Path: <SRS0=w+BI=HU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68F7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49EF261606
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49EF261606
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sNEznb/aDZ4RgH3Eb3KUfEDuuqHUjvNjKEQeD2WQ9Og=; b=rCeIp7DhjKWNscS1Nzv3wiqoS
	s/vwtxVUmjA2Y4UGlxGwow8s3e1X08r0eighskVfAvKp1MCbhMp0auwy83b6kl4zPakpaCm2cHW+j
	ofEBc6QjpI5ZjXof8OcQndujYZ1C6LzCoeciPhc1yCxijesy2dqD/iZZm9KwmbAqYE12ls+5WuBpo
	Qv7kNsFx19FqZ/063JwgViPBZRkVM4my6wRJa26btQc4kaYxBPgVrv9B1Opt83hJk5xxoxdOjJu8+
	k8/5VV0Ek3sDdtZUa/X28WdHIZAqMdGWGvQShgG89S5sqeSxVfA4gnTLKDVaAlUHYtv4LFxFTym6f
	Wr4UF7EPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCYGf-0004d6-DP; Thu, 18 Feb 2021 01:38:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCYGB-0004Pd-EQ
 for linux-mediatek@lists.infradead.org; Thu, 18 Feb 2021 01:37:42 +0000
X-UUID: 7fa34aba71844265bd23dc456bb1e66f-20210217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FpQwQYhCm3DqG6rlIiSRVSYSkow+Zif/N4m2vhW7KtY=; 
 b=PNo5X9dsuNS5CAu55tZ7pWTcZS1TjmXgPBunTLCrHcJJ7mw0fMz2gaNskW6deOef0ZyMudzcHio4ILpBCCDKPc6lz6EQvvxc+d9cGaTijk5Mik1bt5sAd9JEy6b4kTZtrMbSHhTqjAyr9nn6nXbgXJ404lHWlG1Rcg0anK5/6bY=;
X-UUID: 7fa34aba71844265bd23dc456bb1e66f-20210217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 997416594; Wed, 17 Feb 2021 17:37:35 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Feb 2021 17:34:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Feb 2021 09:34:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Feb 2021 09:34:44 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 3/3] mt76: mt7615: add support for rx decapsulation offload
Date: Thu, 18 Feb 2021 09:34:40 +0800
Message-ID: <c6ac1912b1c4844cdade7798098084e6ac26c835.1613603857.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <b7883f5ee09d13f7cbdf5ab1d5fef61ebc79dcc4.1613603857.git.ryder.lee@mediatek.com>
References: <b7883f5ee09d13f7cbdf5ab1d5fef61ebc79dcc4.1613603857.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_203739_781396_A9A7618E 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For AP and Client mode, the hardware can pass received packets
as 802.3 frames that can be passed to the network stack as-is.

Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  5 ++-
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 44 ++++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7615/mac.h   |  5 +++
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 17 +++++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 39 ++++++++++++++++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  4 ++
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  1 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 19 ++++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  6 ++-
 9 files changed, 127 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index fd38737a27bd..88a2ee7e7143 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -118,7 +118,8 @@ mt7615_mac_init(struct mt7615_dev *dev)
 
 	mt76_wr(dev, MT_DMA_DCR0,
 		FIELD_PREP(MT_DMA_DCR0_MAX_RX_LEN, 3072) |
-		MT_DMA_DCR0_RX_VEC_DROP | MT_DMA_DCR0_DAMSDU_EN);
+		MT_DMA_DCR0_RX_VEC_DROP | MT_DMA_DCR0_DAMSDU_EN |
+		MT_DMA_DCR0_RX_HDR_TRANS_EN);
 	/* disable TDLS filtering */
 	mt76_clear(dev, MT_WF_PFCR, MT_WF_PFCR_TDLS_EN);
 	mt76_set(dev, MT_WF_MIB_SCR0, MT_MIB_SCR0_AGG_CNT_RANGE_EN);
@@ -128,6 +129,7 @@ mt7615_mac_init(struct mt7615_dev *dev)
 	} else {
 		mt7615_init_mac_chain(dev, 1);
 	}
+	mt7615_mcu_set_rx_hdr_trans_blacklist(dev);
 }
 
 static void
@@ -360,6 +362,7 @@ mt7615_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
 	ieee80211_hw_set(hw, TX_STATUS_NO_AMPDU_LEN);
 	ieee80211_hw_set(hw, WANT_MONITOR_VIF);
+	ieee80211_hw_set(hw, SUPPORTS_RX_DECAP_OFFLOAD);
 
 	if (is_mt7615(&phy->dev->mt76))
 		hw->max_tx_fragments = MT_TXP_MAX_BUF_NUM;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 340beff0e121..f2dd56674acb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -236,10 +236,12 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	u32 rxd2 = le32_to_cpu(rxd[2]);
 	u32 csum_mask = MT_RXD0_NORMAL_IP_SUM | MT_RXD0_NORMAL_UDP_TCP_SUM;
 	__le32 rxd12 = rxd[12];
-	bool unicast, remove_pad, insert_ccmp_hdr = false;
+	bool unicast, hdr_trans, remove_pad, insert_ccmp_hdr = false;
 	int phy_idx;
 	int i, idx;
-	u8 chfreq, amsdu_info;
+	u8 chfreq, amsdu_info, qos_ctl = 0;
+	u16 seq_ctrl = 0;
+	__le16 fc = 0;
 
 	memset(status, 0, sizeof(*status));
 
@@ -260,6 +262,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 
 	unicast = (rxd1 & MT_RXD1_NORMAL_ADDR_TYPE) == MT_RXD1_NORMAL_U2M;
 	idx = FIELD_GET(MT_RXD2_NORMAL_WLAN_IDX, rxd2);
+	hdr_trans = rxd1 & MT_RXD1_NORMAL_HDR_TRANS;
 	status->wcid = mt7615_rx_get_wcid(dev, idx, unicast);
 
 	if (status->wcid) {
@@ -295,6 +298,13 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 
 	rxd += 4;
 	if (rxd0 & MT_RXD0_NORMAL_GROUP_4) {
+		u32 v0 = le32_to_cpu(rxd[0]);
+		u32 v2 = le32_to_cpu(rxd[2]);
+
+		fc = cpu_to_le16(FIELD_GET(MT_RXD4_FRAME_CONTROL, v0));
+		qos_ctl = FIELD_GET(MT_RXD6_QOS_CTL, v2);
+		seq_ctrl = FIELD_GET(MT_RXD6_SEQ_CTRL, v2);
+
 		rxd += 4;
 		if ((u8 *)rxd - skb->data >= skb->len)
 			return -EINVAL;
@@ -458,25 +468,37 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	if (status->amsdu) {
 		status->first_amsdu = amsdu_info == MT_RXD1_FIRST_AMSDU_FRAME;
 		status->last_amsdu = amsdu_info == MT_RXD1_LAST_AMSDU_FRAME;
-		memmove(skb->data + 2, skb->data,
-			ieee80211_get_hdrlen_from_skb(skb));
-		skb_pull(skb, 2);
+		if (!hdr_trans) {
+			memmove(skb->data + 2, skb->data,
+				ieee80211_get_hdrlen_from_skb(skb));
+			skb_pull(skb, 2);
+		}
 	}
 
-	if (insert_ccmp_hdr) {
+	if (insert_ccmp_hdr && !hdr_trans) {
 		u8 key_id = FIELD_GET(MT_RXD1_NORMAL_KEY_ID, rxd1);
 
 		mt76_insert_ccmp_hdr(skb, key_id);
 	}
 
-	hdr = (struct ieee80211_hdr *)skb->data;
-	if (!status->wcid || !ieee80211_is_data_qos(hdr->frame_control))
+	if (!hdr_trans) {
+		hdr = (struct ieee80211_hdr *)skb->data;
+		fc = hdr->frame_control;
+		if (ieee80211_is_data_qos(fc)) {
+			seq_ctrl = le16_to_cpu(hdr->seq_ctrl);
+			qos_ctl = *ieee80211_get_qos_ctl(hdr);
+		}
+	} else {
+		status->flag |= RX_FLAG_8023;
+	}
+
+	if (!status->wcid || !ieee80211_is_data_qos(fc))
 		return 0;
 
 	status->aggr = unicast &&
-		       !ieee80211_is_qos_nullfunc(hdr->frame_control);
-	status->qos_ctl = *ieee80211_get_qos_ctl(hdr);
-	status->seqno = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
+		       !ieee80211_is_qos_nullfunc(fc);
+	status->qos_ctl = qos_ctl;
+	status->seqno = IEEE80211_SEQ_TO_SN(seq_ctrl);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
index ed009d085a53..6bf9da040196 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
@@ -81,6 +81,11 @@ enum rx_pkt_type {
 #define MT_RXD3_NORMAL_TSF_COMPARE_LOSS	BIT(8)
 #define MT_RXD3_NORMAL_RXV_SEQ		GENMASK(7, 0)
 
+#define MT_RXD4_FRAME_CONTROL		GENMASK(15, 0)
+
+#define MT_RXD6_SEQ_CTRL		GENMASK(15, 0)
+#define MT_RXD6_QOS_CTL			GENMASK(31, 16)
+
 #define MT_RXV1_ACID_DET_H		BIT(31)
 #define MT_RXV1_ACID_DET_L		BIT(30)
 #define MT_RXV1_VHTA2_B8_B3		GENMASK(29, 24)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 1aa6928f88fc..1cf40f85eb55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -1087,6 +1087,22 @@ static int mt7615_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	return 0;
 }
 
+static void mt7615_sta_set_decap_offload(struct ieee80211_hw *hw,
+				 struct ieee80211_vif *vif,
+				 struct ieee80211_sta *sta,
+				 bool enabled)
+{
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
+
+	if (enabled)
+		set_bit(MT_WCID_FLAG_HDR_TRANS, &msta->wcid.flags);
+	else
+		clear_bit(MT_WCID_FLAG_HDR_TRANS, &msta->wcid.flags);
+
+	mt7615_mcu_sta_update_hdr_trans(dev, vif, sta);
+}
+
 #ifdef CONFIG_PM
 static int mt7615_suspend(struct ieee80211_hw *hw,
 			  struct cfg80211_wowlan *wowlan)
@@ -1187,6 +1203,7 @@ const struct ieee80211_ops mt7615_ops = {
 	.sta_remove = mt7615_sta_remove,
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
 	.set_key = mt7615_set_key,
+	.sta_set_decap_offload = mt7615_sta_set_decap_offload,
 	.ampdu_action = mt7615_ampdu_action,
 	.set_rts_threshold = mt7615_set_rts_threshold,
 	.wake_tx_queue = mt7615_wake_tx_queue,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 4ecbd5406e2a..393ce09d3956 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1097,6 +1097,25 @@ static const struct mt7615_mcu_ops sta_update_ops = {
 	.set_fw_ctrl = mt7615_mcu_fw_pmctrl,
 };
 
+int mt7615_mcu_sta_update_hdr_trans(struct mt7615_dev *dev,
+				    struct ieee80211_vif *vif,
+				    struct ieee80211_sta *sta)
+{
+	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct sk_buff *skb = NULL;
+
+	wtbl_hdr = mt76_connac_mcu_alloc_wtbl_req(&dev->mt76, &msta->wcid,
+						  WTBL_SET, NULL, &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
+	mt76_connac_mcu_wtbl_hdr_trans_tlv(skb, vif, sta, NULL, wtbl_hdr);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_EXT_CMD_WTBL_UPDATE,
+				     true);
+}
+
 static int
 mt7615_mcu_uni_ctrl_pm_state(struct mt7615_dev *dev, int band, int state)
 {
@@ -2500,6 +2519,26 @@ int mt7615_mcu_apply_tx_dpd(struct mt7615_phy *phy)
 	return ret;
 }
 
+int mt7615_mcu_set_rx_hdr_trans_blacklist(struct mt7615_dev *dev)
+{
+	struct {
+		u8 operation;
+		u8 count;
+		u8 _rsv[2];
+		u8 index;
+		u8 enable;
+		__le16 etype;
+	} req = {
+		.operation = 1,
+		.count = 1,
+		.enable = 1,
+		.etype = cpu_to_le16(ETH_P_PAE),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_RX_HDR_TRANS,
+				 &req, sizeof(req), false);
+}
+
 int mt7615_mcu_set_bss_pm(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			  bool enable)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 491841bc6291..3c509b9a2cae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -524,6 +524,10 @@ void mt7615_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 void mt7615_mac_work(struct work_struct *work);
 void mt7615_txp_skb_unmap(struct mt76_dev *dev,
 			  struct mt76_txwi_cache *txwi);
+int mt7615_mcu_sta_update_hdr_trans(struct mt7615_dev *dev,
+				    struct ieee80211_vif *vif,
+				    struct ieee80211_sta *sta);
+int mt7615_mcu_set_rx_hdr_trans_blacklist(struct mt7615_dev *dev);
 int mt7615_mcu_set_fcc5_lpn(struct mt7615_dev *dev, int val);
 int mt7615_mcu_set_pulse_th(struct mt7615_dev *dev,
 			    const struct mt7615_dfs_pulse *pulse);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index 4ebffe52cb8e..1fd7f183629e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -370,6 +370,7 @@ enum mt7615_reg_base {
 #define MT_DMA_DCR0_MAX_RX_LEN		GENMASK(15, 2)
 #define MT_DMA_DCR0_DAMSDU_EN		BIT(16)
 #define MT_DMA_DCR0_RX_VEC_DROP		BIT(17)
+#define MT_DMA_DCR0_RX_HDR_TRANS_EN	BIT(19)
 
 #define MT_DMA_RCFR0(_band)		MT_WF_DMA(0x070 + (_band) * 0x40)
 #define MT_DMA_RCFR0_MCU_RX_MGMT	BIT(2)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index ac8d6ad76054..2127ef39072d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -392,6 +392,25 @@ mt76_connac_mcu_sta_uapsd(struct sk_buff *skb, struct ieee80211_vif *vif,
 	uapsd->max_sp = sta->max_sp;
 }
 
+void mt76_connac_mcu_wtbl_hdr_trans_tlv(struct sk_buff *skb,
+					struct ieee80211_vif *vif,
+					struct ieee80211_sta *sta,
+					void *sta_wtbl, void *wtbl_tlv)
+{
+	struct mt76_wcid *wcid;
+	struct wtbl_hdr_trans *htr;
+	struct tlv *tlv;
+
+	tlv = mt76_connac_mcu_add_nested_tlv(skb, WTBL_HDR_TRANS,
+					     sizeof(*htr),
+					     wtbl_tlv, sta_wtbl);
+	htr = (struct wtbl_hdr_trans *)tlv;
+
+	wcid = (struct mt76_wcid *)sta->drv_priv;
+	htr->no_rx_trans = !test_bit(MT_WCID_FLAG_HDR_TRANS, &wcid->flags);
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_wtbl_hdr_trans_tlv);
+
 void mt76_connac_mcu_wtbl_generic_tlv(struct mt76_dev *dev,
 				      struct sk_buff *skb,
 				      struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 9c26b90655a7..2a48c477aba1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -210,7 +210,7 @@ struct wtbl_hdr_trans {
 	__le16 len;
 	u8 to_ds;
 	u8 from_ds;
-	u8 disable_rx_trans;
+	u8 no_rx_trans;
 	u8 rsv;
 } __packed;
 
@@ -914,6 +914,10 @@ void mt76_connac_mcu_wtbl_generic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				      struct ieee80211_vif *vif,
 				      struct ieee80211_sta *sta, void *sta_wtbl,
 				      void *wtbl_tlv);
+void mt76_connac_mcu_wtbl_hdr_trans_tlv(struct sk_buff *skb,
+					struct ieee80211_vif *vif,
+					struct ieee80211_sta *sta,
+					void *sta_wtbl, void *wtbl_tlv);
 void mt76_connac_mcu_sta_tlv(struct mt76_phy *mphy, struct sk_buff *skb,
 			     struct ieee80211_sta *sta,
 			     struct ieee80211_vif *vif);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
