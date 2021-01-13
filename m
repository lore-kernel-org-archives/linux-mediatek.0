Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EF6C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:10:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2CD723120
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2CD723120
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v+tAyg4s0OfuO65ACTTL8pxppVlr5r+kmPbEf9l8a0U=; b=bb9BjM4AX6454hOVUZrh70kt1
	5p1VCgPUySeU7wU8DzJJDfF8KRQzPcSS4Vfpa556KJ5M4PvxB3HyDg23V1MLqGc9epGu12vorICd0
	DhyKLkKvmvaXmv6KfTn8WIFZM6/p19gRvmqZ+KKngo+Bw//oZ15abBk2hiL+7OgShkTZyhFg3Bhd5
	BmvoZJ1vSxtCdUBqI/GCeKwuaoKHH4aObf2mB90TCNFGpcrbgNPVbf/nP+qH6N2017Ut1TORWmfxT
	iX+R8scv+LK5A7U68CfxBK6rtYyJRI5qZ+jaWuS7LyZ1lpLZwmnVsM7QpnNtsZ23JBFiLsFmBG8ox
	IeRaBx2SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzeyD-0000x1-5x; Wed, 13 Jan 2021 12:09:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzey9-0000vQ-Oa
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 12:09:47 +0000
X-UUID: 82508aaba2e648e19dbbb1791455814e-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JmW2V2zrSylRIoqJf7Zl3ZFVSyrUi8t3c4KSfMEu2G8=; 
 b=BckG4GN15TkqkIVCaVEl0CaP8+ceBRxlMtPe21MSZNhy6ZoT/BnmrhflKqaQ2S4+BUNLiNGoyO1CY2BagDcCXbE/yohGb4b/+Bde4c8yLt0iV6NGvJiwxbahso/ZoPhe7Z0U6FG0b2UlVNnYnPothr/NyQMJM18x60CB8bmXk4U=;
X-UUID: 82508aaba2e648e19dbbb1791455814e-20210113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1735787353; Wed, 13 Jan 2021 04:09:40 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 04:09:38 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 20:09:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 13 Jan 2021 20:09:36 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7915: add implicit Tx beamforming support
Date: Wed, 13 Jan 2021 20:09:33 +0800
Message-ID: <8663392490d6b0552aaf0b5b7a8eb36ff38c8bba.1610539467.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <287bbdb0193bd74069219b97199ba4ec72127bd8.1610539467.git.ryder.lee@mediatek.com>
References: <287bbdb0193bd74069219b97199ba4ec72127bd8.1610539467.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 76C99F97420F0F9FB80CCA3F3149536ECE5A865C3DBCECAEDA5D73324261A9CA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_070945_997763_F71F3C14 
X-CRM114-Status: GOOD (  16.99  )
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

Add ht/vht implicit Tx beamforming support and enable it via debugfs.

Tested-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |  28 +++++
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   8 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 104 ++++++++++--------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   1 +
 4 files changed, 89 insertions(+), 52 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 7d810fbf2862..340d489993bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -6,6 +6,32 @@
 
 /** global debugfs **/
 
+static int
+mt7915_implicit_txbf_set(void *data, u64 val)
+{
+	struct mt7915_dev *dev = data;
+
+	if (test_bit(MT76_STATE_RUNNING, &dev->mphy.state))
+		return 0;
+
+	dev->ibf = !!val;
+
+	return mt7915_mcu_set_txbf_type(dev);
+}
+
+static int
+mt7915_implicit_txbf_get(void *data, u64 *val)
+{
+	struct mt7915_dev *dev = data;
+
+	*val = dev->ibf;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_implicit_txbf, mt7915_implicit_txbf_get,
+			 mt7915_implicit_txbf_set, "%lld\n");
+
 /* test knob of system layer 1/2 error recovery */
 static int mt7915_ser_trigger_set(void *data, u64 val)
 {
@@ -355,6 +381,8 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 				    mt7915_queues_acq);
 	debugfs_create_file("tx_stats", 0400, dir, dev, &fops_tx_stats);
 	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
+	debugfs_create_file("implicit_txbf", 0600, dir, dev,
+			    &fops_implicit_txbf);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
 	/* test knobs */
 	debugfs_create_file("radar_trigger", 0200, dir, dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 255ccd7e3d27..cb501c5dc1cc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -169,18 +169,12 @@ static int mt7915_txbf_init(struct mt7915_dev *dev)
 {
 	int ret;
 
-	/*
-	 * TODO: DBDC & check whether iBF phase calibration data has
-	 * been stored in eeprom offset 0x651~0x7b8, then write down
-	 * 0x1111 into 0x651 and 0x651 to trigger iBF.
-	 */
-
 	/* trigger sounding packets */
 	ret = mt7915_mcu_set_txbf_sounding(dev);
 	if (ret)
 		return ret;
 
-	/* enable iBF & eBF */
+	/* enable eBF */
 	return mt7915_mcu_set_txbf_type(dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f38bc421ea8e..2ac780bc2696 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1736,13 +1736,14 @@ mt7915_mcu_sta_sounding_rate(struct sta_rec_bf *bf)
 }
 
 static void
-mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct sta_rec_bf *bf)
+mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct mt7915_phy *phy,
+		       struct sta_rec_bf *bf)
 {
 	struct ieee80211_mcs_info *mcs = &sta->ht_cap.mcs;
 	u8 n = 0;
 
 	bf->tx_mode = MT_PHY_TYPE_HT;
-	bf->bf_cap |= MT_IBF;
+	bf->bf_cap = MT_IBF;
 
 	if (mcs->tx_params & IEEE80211_HT_MCS_TX_RX_DIFF &&
 	    (mcs->tx_params & IEEE80211_HT_MCS_TX_DEFINED))
@@ -1755,8 +1756,9 @@ mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct sta_rec_bf *bf)
 	else if (mcs->rx_mask[1])
 		n = 1;
 
+	bf->nr = hweight8(phy->chainmask) - 1;
 	bf->nc = min_t(u8, bf->nr, n);
-	bf->ibf_ncol = bf->nc;
+	bf->ibf_ncol = n;
 
 	if (sta->bandwidth <= IEEE80211_STA_RX_BW_40 && !bf->nc)
 		bf->ibf_timeout = 0x48;
@@ -1764,34 +1766,46 @@ mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct sta_rec_bf *bf)
 
 static void
 mt7915_mcu_sta_bfer_vht(struct ieee80211_sta *sta, struct mt7915_phy *phy,
-			struct sta_rec_bf *bf)
+			struct sta_rec_bf *bf, bool explicit)
 {
 	struct ieee80211_sta_vht_cap *pc = &sta->vht_cap;
 	struct ieee80211_sta_vht_cap *vc = &phy->mt76->sband_5g.sband.vht_cap;
-	u8 bfee_nr, bfer_nr, n, tx_ant = hweight8(phy->chainmask) - 1;
-	u16 mcs_map;
+	u16 mcs_map = le16_to_cpu(pc->vht_mcs.rx_mcs_map);
+	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
+	u8 tx_ant = hweight8(phy->chainmask) - 1;
 
 	bf->tx_mode = MT_PHY_TYPE_VHT;
-	bf->bf_cap |= MT_EBF;
 
-	mt7915_mcu_sta_sounding_rate(bf);
+	if (explicit) {
+		u8 n, bfee_nr, bfer_nr;
 
-	bfee_nr = FIELD_GET(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK,
-			    pc->cap);
-	bfer_nr = FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
-			    vc->cap);
-	mcs_map = le16_to_cpu(pc->vht_mcs.rx_mcs_map);
+		bf->bf_cap = MT_EBF;
 
-	n = min_t(u8, bfer_nr, bfee_nr);
-	bf->nr = min_t(u8, n, tx_ant);
-	n = mt7915_mcu_get_sta_nss(mcs_map);
+		mt7915_mcu_sta_sounding_rate(bf);
 
-	bf->nc = min_t(u8, n, bf->nr);
-	bf->ibf_ncol = bf->nc;
+		bfee_nr = FIELD_GET(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK,
+				    pc->cap);
+		bfer_nr = FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
+				    vc->cap);
+		n = min_t(u8, bfer_nr, bfee_nr);
+		bf->nr = min_t(u8, n, tx_ant);
+		bf->nc = min_t(u8, nss_mcs, bf->nr);
+		bf->ibf_ncol = bf->nc;
+
+		if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
+			bf->nr = 1;
+	} else {
+		bf->bf_cap = MT_IBF;
+		bf->nr = tx_ant;
+		bf->nc = min_t(u8, nss_mcs, bf->nr);
+		bf->ibf_ncol = nss_mcs;
+
+		if (sta->bandwidth <= IEEE80211_STA_RX_BW_40 && !bf->nc)
+			bf->ibf_timeout = 0x48;
 
-	/* force nr from 4 to 2 */
-	if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
-		bf->nr = 1;
+		if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
+			bf->ibf_nrow = 1;
+	}
 }
 
 static void
@@ -1800,16 +1814,14 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 {
 	struct ieee80211_sta_he_cap *pc = &sta->he_cap;
 	struct ieee80211_he_cap_elem *pe = &pc->he_cap_elem;
-	const struct ieee80211_he_cap_elem *ve;
-	const struct ieee80211_sta_he_cap *vc;
-	u8 bfee_nr, bfer_nr, nss_mcs;
-	u16 mcs_map;
-
-	vc = mt7915_get_he_phy_cap(phy, vif);
-	ve = &vc->he_cap_elem;
+	const struct ieee80211_sta_he_cap *vc = mt7915_get_he_phy_cap(phy, vif);
+	const struct ieee80211_he_cap_elem *ve = &vc->he_cap_elem;
+	u16 mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80);
+	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
+	u8 bfee_nr, bfer_nr;
 
 	bf->tx_mode = MT_PHY_TYPE_HE_SU;
-	bf->bf_cap |= MT_EBF;
+	bf->bf_cap = MT_EBF;
 
 	mt7915_mcu_sta_sounding_rate(bf);
 
@@ -1821,10 +1833,6 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 			 ve->phy_cap_info[5]);
 	bfee_nr = HE_PHY(CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK,
 			 pe->phy_cap_info[4]);
-
-	mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.tx_mcs_80);
-	nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
-
 	bf->nr = min_t(u8, bfer_nr, bfee_nr);
 	bf->nc = min_t(u8, nss_mcs, bf->nr);
 	bf->ibf_ncol = bf->nc;
@@ -1863,7 +1871,7 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 static void
 mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 			struct ieee80211_vif *vif, struct mt7915_phy *phy,
-			bool enable)
+			bool enable, bool explicit)
 {
 	struct sta_rec_bf *bf;
 	struct tlv *tlv;
@@ -1885,19 +1893,25 @@ mt7915_mcu_sta_bfer_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		return;
 	}
 
-	bf->bw = sta->bandwidth;
-	bf->ibf_dbw = sta->bandwidth;
-	bf->ibf_nrow = tx_ant;
-	bf->ibf_timeout = 0x18;
-
+	/* he: eBF only, in accordance with spec
+	 * vht: support eBF and iBF
+	 * ht: iBF only, since mac80211 lacks of eBF support
+	 */
 	if (sta->he_cap.has_he)
 		mt7915_mcu_sta_bfer_he(sta, vif, phy, bf);
 	else if (sta->vht_cap.vht_supported)
-		mt7915_mcu_sta_bfer_vht(sta, phy, bf);
+		mt7915_mcu_sta_bfer_vht(sta, phy, bf, explicit);
 	else if (sta->ht_cap.ht_supported)
-		mt7915_mcu_sta_bfer_ht(sta, bf);
+		mt7915_mcu_sta_bfer_ht(sta, phy, bf);
+	else
+		return;
+
+	bf->bw = sta->bandwidth;
+	bf->ibf_dbw = sta->bandwidth;
+	bf->ibf_nrow = tx_ant;
+	bf->ibf_timeout = 0x18;
 
-	if (bf->bf_cap & MT_EBF && bf->nr != tx_ant)
+	if (explicit && bf->nr != tx_ant)
 		bf->mem_20m = matrix[tx_ant][bf->nc];
 	else
 		bf->mem_20m = matrix[bf->nr][bf->nc];
@@ -2002,14 +2016,14 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	/* must keep each tag independent */
 
 	/* starec bf */
-	if (ebf) {
+	if (ebf || dev->ibf) {
 		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bf);
 
 		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
 		if (IS_ERR(skb))
 			return PTR_ERR(skb);
 
-		mt7915_mcu_sta_bfer_tlv(skb, sta, vif, phy, enable);
+		mt7915_mcu_sta_bfer_tlv(skb, sta, vif, phy, enable, ebf);
 
 		r = mt76_mcu_skb_send_msg(&dev->mt76, skb,
 					  MCU_EXT_CMD_STA_REC_UPDATE, true);
@@ -3442,7 +3456,7 @@ int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev)
 	} __packed req = {
 		.action = MT_BF_TYPE_UPDATE,
 		.ebf = true,
-		.ibf = false,
+		.ibf = dev->ibf,
 	};
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_TXBF_ACTION, &req,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index df7ac2cf052f..63ad1f8199f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -191,6 +191,7 @@ struct mt7915_dev {
 	bool dbdc_support;
 	bool flash_mode;
 	bool fw_debug;
+	bool ibf;
 };
 
 enum {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
