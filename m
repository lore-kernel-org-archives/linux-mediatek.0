Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9924BC48BE0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 18:52:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ECB4613E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 18:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ECB4613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cU8CVCflhqCP1xhAJrNvStAECqeGSCs/34AlvOq3oM=; b=p4ls+GyvNdz+A7
	z6JcWANNbyth4SaekeaGukVws+BQDtz6G7tMShvTpF+9OX5+Iv8AFfPBDxrOJsUJstCNCg02ZMlHZ
	XuVX2zbzoElXsrXWUeLD2dUGJZ41irGlFn/9n71RgSSbpzdE40+47VLbpyeyfwrBwXxEoIGiLqYEB
	9I1v5dvq5MFJRibkfeEle82qvFBsDfG+sGuFqLbFdf30HOZ5D27sZQKjbENPM8xRCmtPdOuQT1PtG
	OZPCD+h2REUf8ZN897c8CYsLxQwObGQ3oEomxO1M18lXe69viINvIyv5nrB3vKzFJhkaINhRhRKeB
	TrX5uyM9iEnx/cHt1+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrPnF-002CmA-Eh; Thu, 10 Jun 2021 18:52:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrPnC-002CkU-BP
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 18:52:40 +0000
X-UUID: 8da3b322784245adbe55f814c68831b5-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OQTAq4JHHbjmxhyPJfnB1fh5K2VkiC5R2PHpSWJKprY=; 
 b=UwABRhqZagG0nQgB5Ak9HT6VtbX+92/0w8RP1sURWGPVk9lo37E1SCIG6ab0x9qFr7/hj+SJ7iQ/bxAiMP6oIgSswMpaqFDLp2f3OnAIOcU63lTEnm0HVUXT/r/gvOssDMS7w228kuG1Q2r+VtyIJnSzZ3lbT/NlamLkpkhB6oo=;
X-UUID: 8da3b322784245adbe55f814c68831b5-20210610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 593537615; Thu, 10 Jun 2021 11:52:30 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 11:43:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 02:43:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Jun 2021 02:43:53 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 4/4] mt76: mt7915: improve MU stability
Date: Fri, 11 Jun 2021 02:43:47 +0800
Message-ID: <61c73b3c279e10ee848d74611631282b43039671.1623347029.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <245a3745aea487793e40fbf82172c5367649bab3.1623347029.git.ryder.lee@mediatek.com>
References: <245a3745aea487793e40fbf82172c5367649bab3.1623347029.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_115238_430071_6393C460 
X-CRM114-Status: GOOD (  15.67  )
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

- Adjust starec flow since VHT MU group is only updated by starec_vht
  follows starec_bf settings.
- Drop unnecessary MU BF checks.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 12 ++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 98 +++++++++----------
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 +
 3 files changed, 64 insertions(+), 51 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index c6e9a7038311..64048243e34b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -148,6 +148,9 @@ mt7915_txbf_stat_read_phy(struct mt7915_phy *phy, struct seq_file *s)
 {
 	struct mt7915_dev *dev = s->private;
 	bool ext_phy = phy != &dev->phy;
+	static const char * const bw[] = {
+		"BW20", "BW40", "BW80", "BW160"
+	};
 	int cnt;
 
 	if (!phy)
@@ -165,11 +168,16 @@ mt7915_txbf_stat_read_phy(struct mt7915_phy *phy, struct seq_file *s)
 	seq_puts(s, "Tx Beamformer Rx feedback statistics: ");
 
 	cnt = mt76_rr(dev, MT_ETBF_RX_FB_CNT(ext_phy));
-	seq_printf(s, "All: %ld, HE: %ld, VHT: %ld, HT: %ld\n",
+	seq_printf(s, "All: %ld, HE: %ld, VHT: %ld, HT: %ld, ",
 		   FIELD_GET(MT_ETBF_RX_FB_ALL, cnt),
 		   FIELD_GET(MT_ETBF_RX_FB_HE, cnt),
 		   FIELD_GET(MT_ETBF_RX_FB_VHT, cnt),
 		   FIELD_GET(MT_ETBF_RX_FB_HT, cnt));
+	cnt = mt76_rr(dev, MT_ETBF_RX_FB_CONT(ext_phy));
+	seq_printf(s, "%s, NC: %ld, NR: %ld\n",
+		   bw[FIELD_GET(MT_ETBF_RX_FB_BW, cnt)],
+		   FIELD_GET(MT_ETBF_RX_FB_NC, cnt),
+		   FIELD_GET(MT_ETBF_RX_FB_NR, cnt));
 
 	/* Tx Beamformee Rx NDPA & Tx feedback report */
 	cnt = mt76_rr(dev, MT_ETBF_TX_NDP_BFRP(ext_phy));
@@ -205,7 +213,7 @@ mt7915_tx_stats_show(struct seq_file *file, void *data)
 	mt7915_txbf_stat_read_phy(mt7915_ext_phy(dev), file);
 
 	/* Tx amsdu info */
-	seq_puts(file, "Tx MSDU stat:\n");
+	seq_puts(file, "Tx MSDU statistics:\n");
 	for (i = 0, n = 0; i < ARRAY_SIZE(stat); i++) {
 		stat[i] = mt76_rr(dev,  MT_PLE_AMSDU_PACK_MSDU_CNT(i));
 		n += stat[i];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index ca633c1bb8c7..b565024404cf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1685,27 +1685,18 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
 }
 
-static int
-mt7915_mcu_add_mu(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		  struct ieee80211_sta *sta)
+static void
+mt7915_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 {
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct sk_buff *skb;
-	int len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_muru);
-
-	if (!sta->vht_cap.vht_supported && !sta->he_cap.has_he)
-		return 0;
+	struct sta_rec_vht *vht;
+	struct tlv *tlv;
 
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
+	tlv = mt7915_mcu_add_tlv(skb, STA_REC_VHT, sizeof(*vht));
 
-	/* starec muru */
-	mt7915_mcu_sta_muru_tlv(skb, sta);
-
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				     MCU_EXT_CMD(STA_REC_UPDATE), true);
+	vht = (struct sta_rec_vht *)tlv;
+	vht->vht_cap = cpu_to_le32(sta->vht_cap.cap);
+	vht->vht_rx_mcs_map = sta->vht_cap.vht_mcs.rx_mcs_map;
+	vht->vht_tx_mcs_map = sta->vht_cap.vht_mcs.tx_mcs_map;
 }
 
 static void
@@ -1757,17 +1748,6 @@ mt7915_mcu_sta_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 			mt7915_mcu_sta_amsdu_tlv(skb, sta);
 	}
 
-	/* starec vht */
-	if (sta->vht_cap.vht_supported) {
-		struct sta_rec_vht *vht;
-
-		tlv = mt7915_mcu_add_tlv(skb, STA_REC_VHT, sizeof(*vht));
-		vht = (struct sta_rec_vht *)tlv;
-		vht->vht_cap = cpu_to_le32(sta->vht_cap.cap);
-		vht->vht_rx_mcs_map = sta->vht_cap.vht_mcs.rx_mcs_map;
-		vht->vht_tx_mcs_map = sta->vht_cap.vht_mcs.tx_mcs_map;
-	}
-
 	/* starec he */
 	if (sta->he_cap.has_he)
 		mt7915_mcu_sta_he_tlv(skb, sta);
@@ -2157,26 +2137,21 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		vc = mt7915_get_he_phy_cap(phy, vif);
 		ve = &vc->he_cap_elem;
 
-		ebfee = !!((HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]) ||
-			    HE_PHY(CAP4_MU_BEAMFORMER, pe->phy_cap_info[4])) &&
+		ebfee = !!(HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]) &&
 			   HE_PHY(CAP4_SU_BEAMFORMEE, ve->phy_cap_info[4]));
-		ebf = !!((HE_PHY(CAP3_SU_BEAMFORMER, ve->phy_cap_info[3]) ||
-			  HE_PHY(CAP4_MU_BEAMFORMER, ve->phy_cap_info[4])) &&
+		ebf = !!(HE_PHY(CAP3_SU_BEAMFORMER, ve->phy_cap_info[3]) &&
 			 HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]));
 	} else if (sta->vht_cap.vht_supported) {
 		struct ieee80211_sta_vht_cap *pc;
 		struct ieee80211_sta_vht_cap *vc;
-		u32 cr, ce;
 
 		pc = &sta->vht_cap;
 		vc = &phy->mt76->sband_5g.sband.vht_cap;
-		cr = IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
-		     IEEE80211_VHT_CAP_MU_BEAMFORMER_CAPABLE;
-		ce = IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
-		     IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
-		ebfee = !!((pc->cap & cr) && (vc->cap & ce));
-		ebf = !!((vc->cap & cr) && (pc->cap & ce));
+		ebfee = !!((pc->cap & IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE) &&
+			   (vc->cap & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE));
+		ebf = !!((vc->cap & IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE) &&
+			 (pc->cap & IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE));
 	}
 
 	/* must keep each tag independent */
@@ -2379,31 +2354,56 @@ mt7915_mcu_add_group(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				 sizeof(req), true);
 }
 
-int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-			   struct ieee80211_sta *sta, bool enable)
+static int
+mt7915_mcu_add_mu(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		  struct ieee80211_sta *sta)
 {
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct sk_buff *skb;
 	int ret;
 
-	if (!sta)
+	if (!sta->vht_cap.vht_supported && !sta->he_cap.has_he)
 		return 0;
 
-	/* must keep the order */
 	ret = mt7915_mcu_add_group(dev, vif, sta);
 	if (ret)
 		return ret;
 
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
+				       MT7915_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	/* wait until TxBF and MU ready to update stare vht */
+
+	/* starec muru */
+	mt7915_mcu_sta_muru_tlv(skb, sta);
+	/* starec vht */
+	mt7915_mcu_sta_vht_tlv(skb, sta);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_EXT_CMD(STA_REC_UPDATE), true);
+}
+
+int mt7915_mcu_add_sta_adv(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta, bool enable)
+{
+	int ret;
+
+	if (!sta)
+		return 0;
+
+	/* must keep the order */
 	ret = mt7915_mcu_add_txbf(dev, vif, sta, enable);
-	if (ret)
+	if (ret || !enable)
 		return ret;
 
 	ret = mt7915_mcu_add_mu(dev, vif, sta);
 	if (ret)
 		return ret;
 
-	if (enable)
-		return mt7915_mcu_add_rate_ctrl(dev, vif, sta);
-
-	return 0;
+	return mt7915_mcu_add_rate_ctrl(dev, vif, sta);
 }
 
 int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 56c33eaa9d79..a213b5cb82f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -99,6 +99,11 @@
 #define MT_ETBF_TX_FB_CPL		GENMASK(31, 16)
 #define MT_ETBF_TX_FB_TRI		GENMASK(15, 0)
 
+#define MT_ETBF_RX_FB_CONT(_band)	MT_WF_ETBF(_band, 0x068)
+#define MT_ETBF_RX_FB_BW		GENMASK(7, 6)
+#define MT_ETBF_RX_FB_NC		GENMASK(5, 3)
+#define MT_ETBF_RX_FB_NR		GENMASK(2, 0)
+
 #define MT_ETBF_TX_APP_CNT(_band)	MT_WF_ETBF(_band, 0x0f0)
 #define MT_ETBF_TX_IBF_CNT		GENMASK(31, 16)
 #define MT_ETBF_TX_EBF_CNT		GENMASK(15, 0)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
