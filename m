Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1A0C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 16:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F2560525
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 16:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89F2560525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEdADpHZ4ExZE/joDSsyGxqA4fyKaExbaq9XTQtfgiQ=; b=V5czTyUVbVTk0l
	fxayEBwYEBoGfbX8yaiTFi0ZxXQDIGm6nAnW17sw6NUh5N8kCKkGVmh3GHG29zw3EhiYhT9G0ReXN
	+/qexOraKBQlhXKXkGLvlhdK4Sd1THanKWd9MOPB8MSQ5LWYtngxGJPGY0Hgn9XzjLeFX0t0b+9Iw
	wJiq2Osf266lDcxpQQtDpOyWBFANsV6ifGSbuEclkUHolhFXWKxTOWCvuvQwnsNlVzMFHiImbUXSZ
	E/5lYdrLfmqnG4R9A3CAsOXbhx9DEZvfWl+2kvCO9b3XYUQvflgtT1/dg2c4WRE66eHrguAyHMqFE
	hu0wmKiKv/KdLaenES0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLTRG-006bp5-Gb; Wed, 01 Sep 2021 16:50:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLTR7-006bj0-RW
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 16:50:11 +0000
X-UUID: baf8dc115bd7449d9aefafef0572de47-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KApDg2ajzQ4tz7aA8lqEBvw3IFDiRvLLvAXxHZ1Zl2I=; 
 b=i7zpr5QkzPr3r9yHbWYvcFNEAj8TysD1uV9wpXahM9cN6O37/bEJKsF8n6GHh/bs18FDJoIgZ+qHn3pXvvRtHXwo4JyF1ge022nO10fPKlLPwSq1xeI57I3y9N7RqzW0zSv5FOqNwmi1m+eITR26XPqdvohgNZmFWv23ySnQquw=;
X-UUID: baf8dc115bd7449d9aefafef0572de47-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2042814441; Wed, 01 Sep 2021 09:50:02 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 09:50:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 00:50:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Sep 2021 00:50:00 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 3/5] mt76: mt7915: improve starec readability of txbf
Date: Thu, 2 Sep 2021 00:49:46 +0800
Message-ID: <20210901164948.28149-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210901164948.28149-1-shayne.chen@mediatek.com>
References: <20210901164948.28149-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_095007_407727_ABE80BC5 
X-CRM114-Status: GOOD (  15.74  )
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

From: Ryder Lee <ryder.lee@mediatek.com>

1. Drop unnecessary MT_EBF/MT_IBF enum.
2. Rename fields 'nc'/'nr' to 'ncol'/'nrow'.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 81 ++++++++++---------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 13 +--
 2 files changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index acb76872f04c..ca3523101f3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1792,7 +1792,6 @@ mt7915_is_ebf_supported(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 static void
 mt7915_mcu_sta_sounding_rate(struct sta_rec_bf *bf)
 {
-	bf->bf_cap = MT_EBF;
 	bf->sounding_phy = MT_PHY_TYPE_OFDM;
 	bf->ndp_rate = 0;				/* mcs0 */
 	bf->ndpa_rate = MT7915_CFEND_RATE_DEFAULT;	/* ofdm 24m */
@@ -1807,7 +1806,6 @@ mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct mt7915_phy *phy,
 	u8 n = 0;
 
 	bf->tx_mode = MT_PHY_TYPE_HT;
-	bf->bf_cap = MT_IBF;
 
 	if (mcs->tx_params & IEEE80211_HT_MCS_TX_RX_DIFF &&
 	    (mcs->tx_params & IEEE80211_HT_MCS_TX_DEFINED))
@@ -1820,8 +1818,8 @@ mt7915_mcu_sta_bfer_ht(struct ieee80211_sta *sta, struct mt7915_phy *phy,
 	else if (mcs->rx_mask[1])
 		n = 1;
 
-	bf->nr = hweight8(phy->mt76->chainmask) - 1;
-	bf->nc = min_t(u8, bf->nr, n);
+	bf->nrow = hweight8(phy->mt76->chainmask) - 1;
+	bf->ncol = min_t(u8, bf->nrow, n);
 	bf->ibf_ncol = n;
 }
 
@@ -1838,23 +1836,23 @@ mt7915_mcu_sta_bfer_vht(struct ieee80211_sta *sta, struct mt7915_phy *phy,
 	bf->tx_mode = MT_PHY_TYPE_VHT;
 
 	if (explicit) {
-		u8 bfee_nr, bfer_nr;
+		u8 sts, snd_dim;
 
 		mt7915_mcu_sta_sounding_rate(bf);
-		bfee_nr = FIELD_GET(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK,
-				    pc->cap);
-		bfer_nr = FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
+
+		sts = FIELD_GET(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK,
+				pc->cap);
+		snd_dim = FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
 				    vc->cap);
-		bf->nr = min_t(u8, min_t(u8, bfer_nr, bfee_nr), tx_ant);
-		bf->nc = min_t(u8, nss_mcs, bf->nr);
-		bf->ibf_ncol = bf->nc;
+		bf->nrow = min_t(u8, min_t(u8, snd_dim, sts), tx_ant);
+		bf->ncol = min_t(u8, nss_mcs, bf->nrow);
+		bf->ibf_ncol = bf->ncol;
 
 		if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
-			bf->nr = 1;
+			bf->nrow = 1;
 	} else {
-		bf->bf_cap = MT_IBF;
-		bf->nr = tx_ant;
-		bf->nc = min_t(u8, nss_mcs, bf->nr);
+		bf->nrow = tx_ant;
+		bf->ncol = min_t(u8, nss_mcs, bf->nrow);
 		bf->ibf_ncol = nss_mcs;
 
 		if (sta->bandwidth == IEEE80211_STA_RX_BW_160)
@@ -1872,21 +1870,23 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	const struct ieee80211_he_cap_elem *ve = &vc->he_cap_elem;
 	u16 mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80);
 	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
-	u8 bfee_nr, bfer_nr;
+	u8 snd_dim, sts;
 
 	bf->tx_mode = MT_PHY_TYPE_HE_SU;
+
 	mt7915_mcu_sta_sounding_rate(bf);
+
 	bf->trigger_su = HE_PHY(CAP6_TRIG_SU_BEAMFORMING_FB,
 				pe->phy_cap_info[6]);
 	bf->trigger_mu = HE_PHY(CAP6_TRIG_MU_BEAMFORMING_PARTIAL_BW_FB,
 				pe->phy_cap_info[6]);
-	bfer_nr = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
+	snd_dim = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
 			 ve->phy_cap_info[5]);
-	bfee_nr = HE_PHY(CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK,
-			 pe->phy_cap_info[4]);
-	bf->nr = min_t(u8, bfer_nr, bfee_nr);
-	bf->nc = min_t(u8, nss_mcs, bf->nr);
-	bf->ibf_ncol = bf->nc;
+	sts = HE_PHY(CAP4_BEAMFORMEE_MAX_STS_UNDER_80MHZ_MASK,
+		     pe->phy_cap_info[4]);
+	bf->nrow = min_t(u8, snd_dim, sts);
+	bf->ncol = min_t(u8, nss_mcs, bf->nrow);
+	bf->ibf_ncol = bf->ncol;
 
 	if (sta->bandwidth != IEEE80211_STA_RX_BW_160)
 		return;
@@ -1897,7 +1897,7 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 		mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_160);
 		nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
 
-		bf->nc_bw160 = nss_mcs;
+		bf->ncol_bw160 = nss_mcs;
 	}
 
 	if (pe->phy_cap_info[0] &
@@ -1905,18 +1905,18 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 		mcs_map = le16_to_cpu(pc->he_mcs_nss_supp.rx_mcs_80p80);
 		nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
 
-		if (bf->nc_bw160)
-			bf->nc_bw160 = min_t(u8, bf->nc_bw160, nss_mcs);
+		if (bf->ncol_bw160)
+			bf->ncol_bw160 = min_t(u8, bf->ncol_bw160, nss_mcs);
 		else
-			bf->nc_bw160 = nss_mcs;
+			bf->ncol_bw160 = nss_mcs;
 	}
 
-	bfer_nr = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK,
+	snd_dim = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_ABOVE_80MHZ_MASK,
 			 ve->phy_cap_info[5]);
-	bfee_nr = HE_PHY(CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_MASK,
-			 pe->phy_cap_info[4]);
+	sts = HE_PHY(CAP4_BEAMFORMEE_MAX_STS_ABOVE_80MHZ_MASK,
+		     pe->phy_cap_info[4]);
 
-	bf->nr_bw160 = min_t(int, bfer_nr, bfee_nr);
+	bf->nrow_bw160 = min_t(int, snd_dim, sts);
 }
 
 static void
@@ -1957,19 +1957,20 @@ mt7915_mcu_sta_bfer_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	else
 		return;
 
+	bf->bf_cap = ebf ? ebf : dev->ibf << 1;
 	bf->bw = sta->bandwidth;
 	bf->ibf_dbw = sta->bandwidth;
 	bf->ibf_nrow = tx_ant;
 
-	if (!ebf && sta->bandwidth <= IEEE80211_STA_RX_BW_40 && !bf->nc)
+	if (!ebf && sta->bandwidth <= IEEE80211_STA_RX_BW_40 && !bf->ncol)
 		bf->ibf_timeout = 0x48;
 	else
 		bf->ibf_timeout = 0x18;
 
-	if (ebf && bf->nr != tx_ant)
-		bf->mem_20m = matrix[tx_ant][bf->nc];
+	if (ebf && bf->nrow != tx_ant)
+		bf->mem_20m = matrix[tx_ant][bf->ncol];
 	else
-		bf->mem_20m = matrix[bf->nr][bf->nc];
+		bf->mem_20m = matrix[bf->nrow][bf->ncol];
 
 	switch (sta->bandwidth) {
 	case IEEE80211_STA_RX_BW_160:
@@ -1995,7 +1996,7 @@ mt7915_mcu_sta_bfee_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	int tx_ant = hweight8(phy->mt76->chainmask) - 1;
 	struct sta_rec_bfee *bfee;
 	struct tlv *tlv;
-	u8 nr = 0;
+	u8 nrow = 0;
 
 	if (!mt7915_is_ebf_supported(phy, vif, sta, true))
 		return;
@@ -2006,17 +2007,17 @@ mt7915_mcu_sta_bfee_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
 	if (sta->he_cap.has_he) {
 		struct ieee80211_he_cap_elem *pe = &sta->he_cap.he_cap_elem;
 
-		nr = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
-			    pe->phy_cap_info[5]);
+		nrow = HE_PHY(CAP5_BEAMFORMEE_NUM_SND_DIM_UNDER_80MHZ_MASK,
+			      pe->phy_cap_info[5]);
 	} else if (sta->vht_cap.vht_supported) {
 		struct ieee80211_sta_vht_cap *pc = &sta->vht_cap;
 
-		nr = FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
-			       pc->cap);
+		nrow = FIELD_GET(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK,
+				 pc->cap);
 	}
 
 	/* reply with identity matrix to avoid 2x2 BF negative gain */
-	bfee->fb_identity_matrix = !!(nr == 1 && tx_ant == 2);
+	bfee->fb_identity_matrix = (nrow == 1 && tx_ant == 2);
 }
 
 static int
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 158c8e68c59e..d604a39f8413 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -967,8 +967,8 @@ struct sta_rec_bf {
 	u8 ndp_rate;
 	u8 rept_poll_rate;
 	u8 tx_mode;		/* 0: legacy, 1: OFDM, 2: HT, 4: VHT ... */
-	u8 nc;
-	u8 nr;
+	u8 ncol;
+	u8 nrow;
 	u8 bw;			/* 0: 20M, 1: 40M, 2: 80M, 3: 160M */
 
 	u8 mem_total;
@@ -988,8 +988,8 @@ struct sta_rec_bf {
 	u8 ibf_dbw;
 	u8 ibf_ncol;
 	u8 ibf_nrow;
-	u8 nr_bw160;
-	u8 nc_bw160;
+	u8 nrow_bw160;
+	u8 ncol_bw160;
 	u8 ru_start_idx;
 	u8 ru_end_idx;
 
@@ -1080,11 +1080,6 @@ enum {
 	THERMAL_PROTECT_STATE_ACT,
 };
 
-enum {
-	MT_EBF = BIT(0),	/* explicit beamforming */
-	MT_IBF = BIT(1)		/* implicit beamforming */
-};
-
 enum {
 	MT_BF_SOUNDING_ON = 1,
 	MT_BF_TYPE_UPDATE = 20,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
