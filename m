Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCD5C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 05:21:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F739238E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 05:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F739238E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4TOFKnkH17pM+hvQqn0hWiOXoS8qV9dYsvc3P4Dx/hw=; b=YOdOYd6hRlOyM4hxjyYrYTO+Qq
	VUxLo1oncAH/o8SIZQ3p1zhpSudGNhyvGJ6Ol5zKvfTiBR587pjq1szvFLfzXyBv1fHvIro4sL15K
	Ev79asSmbMZUrWqwLiKO+vak7TRtYDh2ykFb/nySNyefOSRm9BXT0PsVc0nx/WaIdtP9kcVKSw+8k
	7zn1qMVyA7G6eR+4WNNGptOR+K07s48/VfjoeRR7NCmX/3eTMFOwv+bkb+JpKuP6m5aRJ656tT6if
	LIcNWMBgG97TZKvyx95Mw30kJmLuOW6n2yklVtKhn4+a2qF6bsVIRTLGhFPg+UoS2Om3xHDFekrw5
	sJhrtVIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzv4P-0003pp-Cj; Thu, 14 Jan 2021 05:21:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzv4M-0003pI-HK
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 05:21:15 +0000
X-UUID: 856e6d2e68e64a71b5bef17c9ad1a657-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=j2mMO6Hqn0t9r4XHecYTEglkL8dlgpE0WLQeuLJkr0A=; 
 b=BADh/a9b8auGq1M6M0sjBoYxC/twmcIN40ctr31No5/QucPybqqdUQVlToZMdLNejeKIPC4XKpDBYBEJtbfH6HBU30jUFyD9uqui3qX5ipiiWGzPQUtUkUpFwp34uB7LUgMByFwWy+AAnz8dst9I4OQ/N4EY8hKSLYRQmeZtKzo=;
X-UUID: 856e6d2e68e64a71b5bef17c9ad1a657-20210113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1602980305; Wed, 13 Jan 2021 21:21:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 21:15:47 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Jan 2021 13:15:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Jan 2021 13:15:32 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 1/2] mt76: mt7915: simplify peer's TxBF capability check
Date: Thu, 14 Jan 2021 13:15:30 +0800
Message-ID: <b72ecf59938ed6adce6b49239e4e9d3658ca49d4.1610594238.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2510BC6834DDE253C9E3BB23986E2357DD0FE36B45062CFC3C31B538F29CCAB12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_002114_726368_F28DFC32 
X-CRM114-Status: GOOD (  12.41  )
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

This is a preliminary patch for implicit beamforming support.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
changes since v2: get condition directly from statement
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 67 ++++++-------------
 1 file changed, 22 insertions(+), 45 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 0baef70fc522..c79f3937f6ae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -66,9 +66,6 @@ struct mt7915_fw_region {
 
 #define MCU_PATCH_ADDRESS		0x200000
 
-#define MT_STA_BFER			BIT(0)
-#define MT_STA_BFEE			BIT(1)
-
 #define FW_FEATURE_SET_ENCRYPT		BIT(0)
 #define FW_FEATURE_SET_KEY_IDX		GENMASK(2, 1)
 #define FW_FEATURE_OVERRIDE_ADDR	BIT(5)
@@ -1944,20 +1941,26 @@ mt7915_mcu_sta_bfee_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	}
 
 	/* reply with identity matrix to avoid 2x2 BF negative gain */
-	if (nr == 1 && tx_ant == 2)
-		bfee->fb_identity_matrix = true;
+	bfee->fb_identity_matrix = !!(nr == 1 && tx_ant == 2);
 }
 
-static u8
-mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
-			 struct ieee80211_sta *sta)
+static int
+mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		    struct ieee80211_sta *sta, bool enable)
 {
-	u8 type = 0;
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt7915_phy *phy;
+	struct sk_buff *skb;
+	int r, len;
+	bool ebfee = 0, ebf = 0;
 
 	if (vif->type != NL80211_IFTYPE_STATION &&
 	    vif->type != NL80211_IFTYPE_AP)
 		return 0;
 
+	phy = mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
+
 	if (sta->he_cap.has_he) {
 		struct ieee80211_he_cap_elem *pe;
 		const struct ieee80211_he_cap_elem *ve;
@@ -1967,15 +1970,12 @@ mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 		vc = mt7915_get_he_phy_cap(phy, vif);
 		ve = &vc->he_cap_elem;
 
-		if ((HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]) ||
-		     HE_PHY(CAP4_MU_BEAMFORMER, pe->phy_cap_info[4])) &&
-		    HE_PHY(CAP4_SU_BEAMFORMEE, ve->phy_cap_info[4]))
-			type |= MT_STA_BFEE;
-
-		if ((HE_PHY(CAP3_SU_BEAMFORMER, ve->phy_cap_info[3]) ||
-		     HE_PHY(CAP4_MU_BEAMFORMER, ve->phy_cap_info[4])) &&
-		    HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]))
-			type |= MT_STA_BFER;
+		ebfee = !!((HE_PHY(CAP3_SU_BEAMFORMER, pe->phy_cap_info[3]) ||
+			    HE_PHY(CAP4_MU_BEAMFORMER, pe->phy_cap_info[4])) &&
+			   HE_PHY(CAP4_SU_BEAMFORMEE, ve->phy_cap_info[4]));
+		ebf = !!((HE_PHY(CAP3_SU_BEAMFORMER, ve->phy_cap_info[3]) ||
+			  HE_PHY(CAP4_MU_BEAMFORMER, ve->phy_cap_info[4])) &&
+			 HE_PHY(CAP4_SU_BEAMFORMEE, pe->phy_cap_info[4]));
 	} else if (sta->vht_cap.vht_supported) {
 		struct ieee80211_sta_vht_cap *pc;
 		struct ieee80211_sta_vht_cap *vc;
@@ -1988,37 +1988,14 @@ mt7915_mcu_sta_txbf_type(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 		ce = IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
 		     IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
-		if ((pc->cap & cr) && (vc->cap & ce))
-			type |= MT_STA_BFEE;
-
-		if ((vc->cap & cr) && (pc->cap & ce))
-			type |= MT_STA_BFER;
-	} else if (sta->ht_cap.ht_supported) {
-		/* TODO: iBF */
+		ebfee = !!((pc->cap & cr) && (vc->cap & ce));
+		ebf = !!((vc->cap & cr) && (pc->cap & ce));
 	}
 
-	return type;
-}
-
-static int
-mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-		    struct ieee80211_sta *sta, bool enable)
-{
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct mt7915_phy *phy;
-	struct sk_buff *skb;
-	int r, len;
-	u8 type;
-
-	phy = mvif->band_idx ? mt7915_ext_phy(dev) : &dev->phy;
-
-	type = mt7915_mcu_sta_txbf_type(phy, vif, sta);
-
 	/* must keep each tag independent */
 
 	/* starec bf */
-	if (type & MT_STA_BFER) {
+	if (ebf) {
 		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bf);
 
 		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
@@ -2034,7 +2011,7 @@ mt7915_mcu_add_txbf(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 	}
 
 	/* starec bfee */
-	if (type & MT_STA_BFEE) {
+	if (ebfee) {
 		len = sizeof(struct sta_req_hdr) + sizeof(struct sta_rec_bfee);
 
 		skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta, len);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
