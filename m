Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40566C54E8E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FED220708
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 16:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YRkvlnCZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Iu/zMJnH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FED220708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDOP/6yN4OiJqoEmP20Q6kEUo1Lds4g8qo5Ye09x+SU=; b=YRkvlnCZXvJP42
	hjABl7/actYiZqB3JOnXexhihxvipK4VICEnLQ2PPkifbOfDup8XwWiaEiC7nwaeKKNromSgK4drq
	CvT0A3UohtgimB4wJ8iNi6d8mprLOzrgVbO5mq3WNnn/w5oDW4EQBqBTdZyCbSBXkbfDttuz6KW2d
	MIDOZ0BAtSA1kAJ+q/5Uop0i+YYOTL3QYwKh8JfBR9I6IemNqXnfNQk1e40eEMpPwFnotjfkzP1oK
	5I5Ge3H+MOYVgG1kyMqMHZnOSiqKipj79xmJ5QjR4eLFGnv+w1mEE8WNwPv8obYJBJNVEe7cQVgiN
	sADm4CHuCBh2ZaE6O5qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYAxG-0004v3-5v; Mon, 11 May 2020 16:06:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYAxC-0004tW-Je
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 16:06:56 +0000
X-UUID: 048636a0faa24f36a83a33ce3ee8aa73-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WX/N0Xkopkrral2X+j105oIddx7c/pPVw/iQZTrYB/Y=; 
 b=Iu/zMJnHcetSCvyQYKXGwMY+RxAWbjnzdiNJyafZ9XUmbgU9V/WosSeRyDXKHY8iSciznAMJ6dZxeu5MGr9IJ8wMHbLPaDMrXL9/awr/6000N8rwXvGUaGbh9kNrWWsMTKbgbr8uEM7vkyDC1PKiOAzxe8lVwAmbGCejRcCLc30=;
X-UUID: 048636a0faa24f36a83a33ce3ee8aa73-20200511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 571549055; Mon, 11 May 2020 08:06:21 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 09:06:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 May 2020 00:06:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 May 2020 00:06:40 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/7] mt76: mt7915: add Tx beamformer support
Date: Tue, 12 May 2020 00:06:33 +0800
Message-ID: <494848b613d37aefed86e76469c6aa12edf9fe9c.1589212457.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1589212457.git.ryder.lee@mediatek.com>
References: <cover.1589212457.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_090654_653116_D82FE440 
X-CRM114-Status: GOOD (  15.80  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable TxBF modules and trigger sounding process to support Tx beamformer.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  20 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   9 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 358 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  78 ++--
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   4 +
 5 files changed, 434 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 7d59571216e3..3721bd632b4d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -57,6 +57,25 @@ static void mt7915_mac_init(struct mt7915_dev *dev)
 	mt7915_mcu_set_rts_thresh(&dev->phy, 0x92b);
 }
 
+static int mt7915_txbf_init(struct mt7915_dev *dev)
+{
+	int ret;
+
+	/*
+	 * TODO: DBDC & check whether iBF phase calibration data has
+	 * been stored in eeprom offset 0x651~0x7b8, then write down
+	 * 0x1111 into 0x651 and 0x651 to trigger iBF.
+	 */
+
+	/* trigger sounding packets */
+	ret = mt7915_mcu_set_txbf_sounding(dev);
+	if (ret)
+		return ret;
+
+	/* enable iBF & eBF */
+	return mt7915_mcu_set_txbf_type(dev);
+}
+
 static void
 mt7915_init_txpower_band(struct mt7915_dev *dev,
 			 struct ieee80211_supported_band *sband)
@@ -97,6 +116,7 @@ static void mt7915_init_work(struct work_struct *work)
 	mt7915_mcu_set_eeprom(dev);
 	mt7915_mac_init(dev);
 	mt7915_init_txpower(dev);
+	mt7915_txbf_init(dev);
 }
 
 static int mt7915_init_hardware(struct mt7915_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 697045e65b24..f3a373fc07e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -485,7 +485,7 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	int idx;
+	int ret, idx;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA - 1);
 	if (idx < 0)
@@ -504,9 +504,11 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	mt7915_mac_wtbl_update(dev, idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
-	mt7915_mcu_add_sta(dev, vif, sta, true);
+	ret = mt7915_mcu_add_sta(dev, vif, sta, true);
+	if (ret)
+		return ret;
 
-	return 0;
+	return mt7915_mcu_add_sta_adv(dev, vif, sta, true);
 }
 
 void mt7915_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
@@ -515,6 +517,7 @@ void mt7915_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 
+	mt7915_mcu_add_sta_adv(dev, vif, sta, false);
 	mt7915_mcu_add_sta(dev, vif, sta, false);
 
 	mt7915_mac_wtbl_update(dev, msta->wcid.idx,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index c147a033250a..58d0adca8b31 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -66,6 +66,8 @@ struct mt7915_fw_region {
 
 #define MCU_PATCH_ADDRESS		0x200000
 
+#define MT_STA_BFER			BIT(0)
+
 #define FW_FEATURE_SET_ENCRYPT		BIT(0)
 #define FW_FEATURE_SET_KEY_IDX		GENMASK(2, 1)
 #define FW_FEATURE_OVERRIDE_ADDR	BIT(5)
@@ -197,6 +199,21 @@ mt7915_get_phy_mode(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	return mode;
 }
 
+static u8
+mt7915_mcu_get_sta_nss(u16 mcs_map)
+{
+	u8 nss;
+
+	for (nss = 8; nss > 0; nss--) {
+		u8 nss_mcs = (mcs_map >> (2 * (nss - 1))) & 3;
+
+		if (nss_mcs != IEEE80211_VHT_MCS_NOT_SUPPORTED)
+			break;
+	}
+
+	return nss - 1;
+}
+
 static int __mt7915_mcu_msg_send(struct mt7915_dev *dev, struct sk_buff *skb,
 				 int cmd, int *wait_seq)
 {
@@ -1561,6 +1578,279 @@ int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				       MCU_EXT_CMD_STA_REC_UPDATE, true);
 }
 
+static void
+mt7915_mcu_sta_sounding_rate(struct sta_rec_bf *bf)
+{
+	bf->sounding_phy = MT_PHY_TYPE_OFDM;
+	bf->ndp_rate = 0;				/* mcs0 */
+	bf->ndpa_rate = MT7915_CFEND_RATE_DEFAULT;	/* ofdm 24m */
+	bf->rept_poll_rate = MT7915_CFEND_RATE_DEFAULT;	/* ofdm 24m */
+}
+
+static void
+mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct sta_rec_bf *bf)
+{
+	struct ieee80211_mcs_info *mcs = &sta->ht_cap.mcs;
+	u8 n = 0;
+
+	bf->tx_mode = MT_PHY_TYPE_HT;
+	bf->bf_cap |= MT_IBF;
+
+	if (mcs->tx_params & IEEE80211_HT_MCS_TX_RX_DIFF &&
+	    (mcs->tx_params & IEEE80211_HT_MCS_TX_DEFINED))
+		n = FIELD_GET(IEEE80211_HT_MCS_TX_MAX_STREAMS_MASK,
+			      mcs->tx_params);
+	else if (mcs->rx_mask[3])
+		n = 3;
+	else if (mcs->rx_mask[2])
+		n = 2;
+	else if (mcs->rx_mask[1])
+		n = 1;
+
+	bf->nc = min_t(u8, bf->nr, n);
+	bf->ibf_ncol = bf->nc;
+
+	if (sta->bandwidth <= IEEE80211_STA_RX_BW_40 && !bf->nc)
+		bf->ibf_timeout = 0x48;
+}
+
+static void
+mt7915_mcu_sta_bfer_vht(struct ieee80211_sta *sta, struct mt7915_phy *phy,
+			struct sta_rec_bf *bf)
+{
+	struct ieee80211_sta_vht_cap *pc = &sta->vht_cap;
+	struct ieee80211_sta_vht_cap *vc = &phy->mt76->sband_5g.sband.vht_cap;
+	u8 bfee_nr, bfer_nr, n, tx_ant = hweight8(phy->chainmask) - 1;
+	u16 mcs_map;
+
+	bf->tx_mode = MT_PHY_TYPE_VHT;
+	bf->bf_cap |= MT_EBF;
+
+	mt7915_mcu_sta_sounding_rate(bf);
+
+	bfee_nr = FIELD_GET(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK,
+			    pc->cap);
+	bfer_nr = FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
+			    vc->cap);
+	mcs_map = le16_to_cpu(pc->vht_mcs.rx_mcs_map);
+
+	n = min_t(u8, bfer_nr, bfee_nr);
+	bf->nr = min_t(u8, n, tx_ant);
+	n = mt7915_mcu_get_sta_nss(mcs_map);
+
+	bf->nc = min_t(u8, n, bf->nr);
+	bf->ibf_ncol = bf->nc;
+
+	/* force nr from 4 to 2 */
+	if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
+		bf->nr = 1;
+}
+
+static void
+mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
+		       struct mt7915_phy *phy, struct sta_rec_bf *bf)
+{
+	struct ieee80211_sta_he_cap *pc = &sta->he_cap;
+	struct ieee80211_he_cap_elem *pe = &pc->he_cap_elem;
+	const struct ieee80211_he_cap_elem *ve;
+	const struct ieee80211_sta_he_cap *vc;
+	u8 bfee_nr, bfer_nr, nss_mcs;
+	u16 mcs_map;
+
+	vc = mt7915_get_he_phy_cap(phy, vif);
+	ve = &vc->he_cap_elem;
+
+	bf->tx_mode = MT_PHY_TYPE_HE_SU;
+	bf->bf_cap |= MT_EBF;
+
+	mt7915_mcu_sta_sounding_rate(bf);
+
+	bf->trigger_su = HE_PHY(CAP6_TRIG_SU_BEAMFORMER_FB,
+				pe->phy_cap_info[6]);
+	bf->trigger_mu = HE_PHY(CAP6_TRIG_MU_BEAMFORMER_FB,
+				pe->phy_cap_info[6]);
+	bfer_nr = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
+			 ve->phy_cap_info[5]);
+	bfee_nr = HE_PHY(CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK,
+			 pe->phy_cap_info[4]);
+
+	mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.tx_mcs_80);
+	nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
+
+	bf->nr = min_t(u8, bfer_nr, bfee_nr);
+	bf->nc = min_t(u8, nss_mcs, bf->nr);
+	bf->ibf_ncol = bf->nc;
+
+	if (sta->bandwidth != IEEE80211_STA_RX_BW_160)
+		return;
+
+	/* go over for 160MHz and 80p80 */
+	if (pe->phy_cap_info[0] &
+	    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G) {
+		mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_160);
+		nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
+
+		bf->nc_bw160 = nss_mcs;
+	}
+
+	if (pe->phy_cap_info[0] &
+	    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G) {
+		mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80p80);
+		nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
+
+		if (bf->nc_bw160)
+			bf->nc_bw160 = min_t(u8, bf->nc_bw160, nss_mcs);
+		else
+			bf->nc_bw160 = nss_mcs;
+	}
+
+	bfer_nr = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK,
+			 ve->phy_cap_info[5]);
+	bfee_nr = HE_PHY(CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_MASK,
+			 pe->phy_cap_info[4]);
+
+	bf->nr_bw160 = min_t(int, bfer_nr, bfee_nr);
+}
+
+static void
+mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
+			struct ieee80211_vif *vif, struct mt7915_phy *phy,
+			bool enable)
+{
+	struct sta_rec_bf *bf;
+	struct tlv *tlv;
+	int tx_ant = hweight8(phy->chainmask) - 1;
+	const u8 matrix[4][4] = {
+		{0, 0, 0, 0},
+		{1, 1, 0, 0},	/* 2x1, 2x2, 2x3, 2x4 */
+		{2, 4, 4, 0},	/* 3x1, 3x2, 3x3, 3x4 */
+		{3, 5, 6, 0}	/* 4x1, 4x2, 4x3, 4x4 */
+	};
+
+#define MT_BFER_FREE		cpu_to_le16(GENMASK(15, 0))
+
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_BF, sizeof(*bf));
+	bf = (struct sta_rec_bf *)tlv;
+
+	if (!enable) {
+		bf->pfmu = MT_BFER_FREE;
+		return;
+	}
+
+	bf->bw = sta->bandwidth;
+	bf->ibf_dbw = sta->bandwidth;
+	bf->ibf_nrow = tx_ant;
+	bf->ibf_timeout = 0x18;
+
+	if (sta->he_cap.has_he)
+		mt7915_mcu_sta_bfer_he(sta, vif, phy, bf);
+	else if (sta->vht_cap.vht_supported)
+		mt7915_mcu_sta_bfer_vht(sta, phy, bf);
+	else if (sta->ht_cap.ht_supported)
+		mt7915_mcu_sta_bfer_ht(sta, bf);
+
+	if (bf->bf_cap & MT_EBF && bf->nr != tx_ant)
+		bf->mem_20m = matrix[tx_ant][bf->nc];
+	else
+		bf->mem_20m = matrix[bf->nr][bf->nc];
+
+	switch (sta->bandwidth) {
+	case IEEE80211_STA_RX_BW_160:
+	case IEEE80211_STA_RX_BW_80:
+		bf->mem_total = bf->mem_20m * 2;
+		break;
+	case IEEE80211_STA_RX_BW_40:
+		bf->mem_total = bf->mem_20m;
+		break;
+	case IEEE80211_STA_RX_BW_20:
+	default:
+		break;
+	}
+}
+
+static u8
+mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
+			 struct ieee80211_sta *sta)
+{
+	struct mt7915_sta *msta;
+	u8 type = 0;
+
+	if (vif->type != NL80211_IFTYPE_STATION &&
+	    vif->type != NL80211_IFTYPE_AP)
+		return 0;
+
+	msta = (struct mt7915_sta *)sta->drv_priv;
+
+	if (sta->he_cap.has_he) {
+		struct ieee80211_he_cap_elem *pe;
+		const struct ieee80211_he_cap_elem *ve;
+		const struct ieee80211_sta_he_cap *vc;
+
+		pe = &sta->he_cap.he_cap_elem;
+		vc = mt7915_get_he_phy_cap(phy, vif);
+		ve = &vc->he_cap_elem;
+
+		if ((HE_PHY(CAP3_SU_BEAMFORMER, ve->phy_cap_info[3]) ||
+		     HE_PHY(CAP4_MU_BEAMFORMER, ve->phy_cap_info[4])) &&
+		    HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]))
+			type |= MT_STA_BFER;
+	} else if (sta->vht_cap.vht_supported) {
+		struct ieee80211_sta_vht_cap *pc;
+		struct ieee80211_sta_vht_cap *vc;
+		u32 cr, ce;
+
+		pc = &sta->vht_cap;
+		vc = &phy->mt76->sband_5g.sband.vht_cap;
+		cr = IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
+		     IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE;
+		ce = IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
+		     IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
+
+		if ((vc->cap & cr) && (pc->cap & ce))
+			type |= MT_STA_BFER;
+	} else if (sta->ht_cap.ht_supported) {
+		/* TODO: iBF */
+	}
+
+	return type;
+}
+
+static int
+mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		    struct ieee80211_sta *sta, bool enable)
+{
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt7915_phy *phy;
+	struct sk_buff *skb;
+	int r, len;
+	u8 type;
+
+	phy = mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
+
+	type = mt7915_mcu_sta_txbf_type(phy, vif, sta);
+
+	/* must keep each tag independent */
+
+	/* starec bf */
+	if (type & MT_STA_BFER) {
+		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bf);
+
+		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
+		if (IS_ERR(skb))
+			return PTR_ERR(skb);
+
+		mt7915_mcu_sta_bfer_tlv(skb, sta, vif, phy, enable);
+
+		r = __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+					    MCU_EXT_CMD_STA_REC_UPDATE, true);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
 static void
 mt7915_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7915_dev *dev,
 			     struct ieee80211_vif *vif,
@@ -1724,6 +2014,25 @@ int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				       MCU_EXT_CMD_STA_REC_UPDATE, true);
 }
 
+int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta, bool enable)
+{
+	int ret;
+
+	if (!sta)
+		return 0;
+
+	/* must keep the order */
+	ret = mt7915_mcu_add_txbf(dev, vif, sta, enable);
+	if (ret)
+		return ret;
+
+	if (enable)
+		return mt7915_mcu_add_rate_ctrl(dev, vif, sta);
+
+	return 0;
+}
+
 int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta, bool enable)
 {
@@ -1732,7 +2041,6 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	struct mt7915_sta *msta;
 	struct tlv *sta_wtbl;
 	struct sk_buff *skb;
-	int ret;
 
 	msta = sta ? (struct mt7915_sta *)sta->drv_priv : &mvif->sta;
 
@@ -1755,15 +2063,8 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			mt7915_mcu_wtbl_ht_tlv(skb, sta, sta_wtbl, wtbl_hdr);
 	}
 
-	ret = __mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				      MCU_EXT_CMD_STA_REC_UPDATE, true);
-	if (ret)
-		return ret;
-
-	if (enable && sta)
-		return mt7915_mcu_add_rate_ctrl(dev, vif, sta);
-
-	return 0;
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_EXT_CMD_STA_REC_UPDATE, true);
 }
 
 int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
@@ -2767,3 +3068,40 @@ int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band)
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_SET_SER_TRIGGER,
 				   &req, sizeof(req), false);
 }
+
+int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev)
+{
+#define MT_BF_TYPE_UPDATE		20
+	struct {
+		u8 action;
+		bool ebf;
+		bool ibf;
+		u8 rsv;
+	} __packed req = {
+		.action = MT_BF_TYPE_UPDATE,
+		.ebf = true,
+		.ibf = false,
+	};
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_TXBF_ACTION,
+				   &req, sizeof(req), true);
+}
+
+int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev)
+{
+#define MT_BF_PROCESSING		4
+	struct {
+		u8 action;
+		u8 snd_mode;
+		u8 sta_num;
+		u8 rsv;
+		u8 wlan_idx[4];
+		__le32 snd_period;	/* ms */
+	} __packed req = {
+		.action = true,
+		.snd_mode = MT_BF_PROCESSING,
+	};
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_TXBF_ACTION,
+				   &req, sizeof(req), true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index f68d2094ac6f..53d1e1f0cea9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -194,6 +194,7 @@ enum {
 	MCU_EXT_CMD_PM_STATE_CTRL = 0x07,
 	MCU_EXT_CMD_CHANNEL_SWITCH = 0x08,
 	MCU_EXT_CMD_FW_LOG_2_HOST = 0x13,
+	MCU_EXT_CMD_TXBF_ACTION = 0x1e,
 	MCU_EXT_CMD_EFUSE_BUFFER_MODE = 0x21,
 	MCU_EXT_CMD_STA_REC_UPDATE = 0x25,
 	MCU_EXT_CMD_BSS_INFO_UPDATE = 0x26,
@@ -571,18 +572,6 @@ struct wtbl_ba {
 	u8 rsv1[4];
 } __packed;
 
-struct wtbl_bf {
-	__le16 tag;
-	__le16 len;
-	u8 ibf;
-	u8 ebf;
-	u8 ibf_vht;
-	u8 ebf_vht;
-	u8 gid;
-	u8 pfmu_idx;
-	u8 rsv[2];
-} __packed;
-
 struct wtbl_smps {
 	__le16 tag;
 	__le16 len;
@@ -590,13 +579,6 @@ struct wtbl_smps {
 	u8 rsv[3];
 } __packed;
 
-struct wtbl_spe {
-	__le16 tag;
-	__le16 len;
-	u8 spe_idx;
-	u8 rsv[3];
-} __packed;
-
 enum {
 	WTBL_GENERIC,
 	WTBL_RX,
@@ -834,6 +816,55 @@ struct sta_rec_ra_fixed {
 #define RATE_CFG_LDPC			GENMASK(23, 20)
 #define RATE_CFG_PHY_TYPE		GENMASK(27, 24)
 
+struct sta_rec_bf {
+	__le16 tag;
+	__le16 len;
+
+	__le16 pfmu;		/* 0xffff: no access right for PFMU */
+	bool su_mu;		/* 0: SU, 1: MU */
+	u8 bf_cap;		/* 0: iBF, 1: eBF */
+	u8 sounding_phy;	/* 0: legacy, 1: OFDM, 2: HT, 4: VHT */
+	u8 ndpa_rate;
+	u8 ndp_rate;
+	u8 rept_poll_rate;
+	u8 tx_mode;		/* 0: legacy, 1: OFDM, 2: HT, 4: VHT ... */
+	u8 nc;
+	u8 nr;
+	u8 bw;			/* 0: 20M, 1: 40M, 2: 80M, 3: 160M */
+
+	u8 mem_total;
+	u8 mem_20m;
+	struct {
+		u8 row;
+		u8 col: 6, row_msb: 2;
+	} mem[4];
+
+	__le16 smart_ant;
+	u8 se_idx;
+	u8 auto_sounding;	/* b7: low traffic indicator
+				 * b6: Stop sounding for this entry
+				 * b5 ~ b0: postpone sounding
+				 */
+	u8 ibf_timeout;
+	u8 ibf_dbw;
+	u8 ibf_ncol;
+	u8 ibf_nrow;
+	u8 nr_bw160;
+	u8 nc_bw160;
+	u8 ru_start_idx;
+	u8 ru_end_idx;
+
+	bool trigger_su;
+	bool trigger_mu;
+	bool ng16_su;
+	bool ng16_mu;
+	bool codebook42_su;
+	bool codebook75_mu;
+
+	u8 he_ltf;
+	u8 rsv[2];
+} __packed;
+
 enum {
 	STA_REC_BASIC,
 	STA_REC_RA,
@@ -890,15 +921,18 @@ enum {
 	THERMAL_SENSOR_TASK_CTRL,
 };
 
+enum {
+	MT_EBF = BIT(0),	/* explicit beamforming */
+	MT_IBF = BIT(1)		/* implicit beamforming */
+};
+
 #define MT7915_WTBL_UPDATE_MAX_SIZE	(sizeof(struct wtbl_req_hdr) +	\
 					 sizeof(struct wtbl_generic) +	\
 					 sizeof(struct wtbl_rx) +	\
 					 sizeof(struct wtbl_ht) +	\
 					 sizeof(struct wtbl_vht) +	\
 					 sizeof(struct wtbl_ba) +	\
-					 sizeof(struct wtbl_bf) +	\
-					 sizeof(struct wtbl_smps) +	\
-					 sizeof(struct wtbl_spe))
+					 sizeof(struct wtbl_smps))
 
 #define MT7915_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +	\
 					 sizeof(struct sta_rec_basic) +	\
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 43c956bc09f5..0d5b448292b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -286,6 +286,8 @@ int mt7915_mcu_add_bss_info(struct mt7915_phy *phy,
 			    struct ieee80211_vif *vif, int enable);
 int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta, bool enable);
+int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta, bool enable);
 int mt7915_mcu_add_tx_ba(struct mt7915_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool add);
@@ -315,6 +317,8 @@ int mt7915_mcu_set_rts_thresh(struct mt7915_phy *phy, u32 val);
 int mt7915_mcu_set_pm(struct mt7915_dev *dev, int band, int enter);
 int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
 int mt7915_mcu_set_sku(struct mt7915_phy *phy);
+int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev);
+int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev);
 int mt7915_mcu_set_fcc5_lpn(struct mt7915_dev *dev, int val);
 int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
 			    const struct mt7915_dfs_pulse *pulse);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
