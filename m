Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01849C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 08:15:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B9DF60ED4
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 08:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B9DF60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAuwc7NS5+wxs8I0fYSsWdMECkG/dtaL9DjS3/kVUeQ=; b=Fnu/NuKoqK7MZ5
	r6cQaGHDEYs0HZsQDT+2dO4lVaYa5omO7ISV++ujNGTSQimmQ9OyK/EhDKgZFf6qhLfVvEAgu03cM
	MmPw85gQ2Z9GWtPIxUbtzHqkvU/ZlWCW6x+HItsF+7/6wF0x/yOKlktQH35/vH0a0pfIiHq93TD8s
	Y+8SHj/qXddaTy7ym+zani6guF4VETIt9PfzF+L1i/hJvOKNlGf2xvuNm2dJY0O6hi/IYY7ghsnyD
	kfI/T/wbvaBsESOCzkgie/uD9SkOzVO5hZxjYsPNLVi4ZF30dN6t6+Gtz08CHQJcgwNowtPWP91DX
	d2dKlJxBDQQuLzITfT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcNnL-00EbgN-IO; Mon, 18 Oct 2021 08:14:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcNnH-00Ebde-WE
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 08:14:53 +0000
X-UUID: 0d482def85a242e8ad6b298a73fe3063-20211018
X-UUID: 0d482def85a242e8ad6b298a73fe3063-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 490018018; Mon, 18 Oct 2021 01:14:49 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 01:09:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Oct 2021 16:09:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 16:09:54 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v3 2/4] mt76: mt7915: rework mt7915_mcu_sta_muru_tlv()
Date: Mon, 18 Oct 2021 16:09:39 +0800
Message-ID: <20211018080941.11443-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211018080941.11443-1-shayne.chen@mediatek.com>
References: <20211018080941.11443-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_011452_117630_70326CAA 
X-CRM114-Status: GOOD (  11.15  )
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

Re-order and modify conditions for MU DL/UL and ofdma DL fields, and
also clean up some unnecessary zero settings.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8ba60b66e4a9..4c687380120e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1520,22 +1520,37 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	struct sta_rec_muru *muru;
 	struct tlv *tlv;
 
-	if (!sta->vht_cap.vht_supported && !sta->he_cap.has_he)
+	if (vif->type != NL80211_IFTYPE_STATION &&
+	    vif->type != NL80211_IFTYPE_AP)
+		return;
+
+	if (!sta->vht_cap.vht_supported)
 		return;
 
 	tlv = mt7915_mcu_add_tlv(skb, STA_REC_MURU, sizeof(*muru));
 
 	muru = (struct sta_rec_muru *)tlv;
-	muru->cfg.ofdma_dl_en = true;
 
-	/* A non-AP HE station must support MU beamformee */
-	muru->cfg.mimo_dl_en = (vif->type == NL80211_IFTYPE_STATION &&
-				vif->bss_conf.he_support) ||
-			       mvif->cap.he_mu_ebfer ||
+	muru->cfg.mimo_dl_en = mvif->cap.he_mu_ebfer ||
 			       mvif->cap.vht_mu_ebfer ||
 			       mvif->cap.vht_mu_ebfee;
+
+	muru->mimo_dl.vht_mu_bfee =
+		!!(sta->vht_cap.cap & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE);
+
+	if (!sta->he_cap.has_he)
+		return;
+
+	muru->mimo_dl.partial_bw_dl_mimo =
+		HE_PHY(CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO, elem->phy_cap_info[6]);
+
 	muru->cfg.mimo_ul_en = true;
+	muru->mimo_ul.full_ul_mimo =
+		HE_PHY(CAP2_UL_MU_FULL_MU_MIMO, elem->phy_cap_info[2]);
+	muru->mimo_ul.partial_ul_mimo =
+		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
 
+	muru->cfg.ofdma_dl_en = true;
 	muru->ofdma_dl.punc_pream_rx =
 		HE_PHY(CAP1_PREAMBLE_PUNC_RX_MASK, elem->phy_cap_info[1]);
 	muru->ofdma_dl.he_20m_in_40m_2g =
@@ -1544,9 +1559,6 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		HE_PHY(CAP8_20MHZ_IN_160MHZ_HE_PPDU, elem->phy_cap_info[8]);
 	muru->ofdma_dl.he_80m_in_160m =
 		HE_PHY(CAP8_80MHZ_IN_160MHZ_HE_PPDU, elem->phy_cap_info[8]);
-	muru->ofdma_dl.lt16_sigb = 0;
-	muru->ofdma_dl.rx_su_comp_sigb = 0;
-	muru->ofdma_dl.rx_su_non_comp_sigb = 0;
 
 	muru->ofdma_ul.t_frame_dur =
 		HE_MAC(CAP1_TF_MAC_PAD_DUR_MASK, elem->mac_cap_info[1]);
@@ -1554,18 +1566,6 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 		HE_MAC(CAP2_MU_CASCADING, elem->mac_cap_info[2]);
 	muru->ofdma_ul.uo_ra =
 		HE_MAC(CAP3_OFDMA_RA, elem->mac_cap_info[3]);
-	muru->ofdma_ul.he_2x996_tone = 0;
-	muru->ofdma_ul.rx_t_frame_11ac = 0;
-
-	muru->mimo_dl.vht_mu_bfee =
-		!!(sta->vht_cap.cap & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE);
-	muru->mimo_dl.partial_bw_dl_mimo =
-		HE_PHY(CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO, elem->phy_cap_info[6]);
-
-	muru->mimo_ul.full_ul_mimo =
-		HE_PHY(CAP2_UL_MU_FULL_MU_MIMO, elem->phy_cap_info[2]);
-	muru->mimo_ul.partial_ul_mimo =
-		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
 }
 
 static void
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
