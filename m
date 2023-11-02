Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AD3C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZU+ZPjFtkWwISzW8Fu6y0RqHflhLxqSXzNlG3qEqz0=; b=pI4mKM5L0K05adSM1zxtXF8Ts7
	fJdyy94qeAJIDCvPXKy5xO4KEemSZMYdJZRD8MdTPQAA5ASpPFE924Dqg5hvoyTi2HGW+BnOnKgrE
	5RVYGq6ruycfomEYNIbdzzJS6igGRy/YCBirVVLB2nLkxNwBZqf9BoS5KPB2Oc7aypQb2ANXlUaRC
	0aNG87liocRZtxYhZ+ac/7eIiQ1A063LQ8BRXG0Oo/PV6SM8IcaW4SNDapUTblw9V67cokYdGuvVj
	Utb43UYj2ryHqfjc3MvPpw00R4moowgzz0sllVAzHujDVWY62OZH2bVrou4ix9QxtLG4oPyJK2LoX
	jQeK89Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUYe-0095OH-1D;
	Thu, 02 Nov 2023 10:04:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUYY-0095NL-2l
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 10:04:10 +0000
X-UUID: 2564d390796711ee86758d4a7c00f3a0-20231102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JZU+ZPjFtkWwISzW8Fu6y0RqHflhLxqSXzNlG3qEqz0=;
	b=TFknKp2rVZKDg03oAXGkirbaOE2srVcH2iRUsfZbOyMab0Rn7l6K3JsnHrfrNcoCQ+znlJ5k6tCFSP/MpNDj534Yfd4TFFFOMzRTXc0SC7+Zy9S302pfLSuQAlnoP0P5Teo2NPQkFFgwKTh6+8D4G9PARNjkMRatI4Lrqi9raHM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:34e749ec-6fc1-4c4e-b17c-cb00b6edc577,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:739012fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2564d390796711ee86758d4a7c00f3a0-20231102
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1092808310; Thu, 02 Nov 2023 03:04:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 Nov 2023 18:03:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 Nov 2023 18:03:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 6/8] wifi: mt76: mt7996: rework ampdu params setting
Date: Thu, 2 Nov 2023 18:03:00 +0800
Message-ID: <20231102100302.22160-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231102100302.22160-1-shayne.chen@mediatek.com>
References: <20231102100302.22160-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_030406_894518_C86A3368 
X-CRM114-Status: GOOD (  14.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Add sta_rec_ht_uni struct to pass HT ampdu params to firmware. For VHT,
HE, and EHT mode, firmware will get the ampdu params by parsing the
corresponding capability.

Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 48 +++----------------
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   | 12 ++++-
 2 files changed, 16 insertions(+), 44 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index b8d0b52be1e7..1afcc96a0a52 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1255,7 +1255,7 @@ mt7996_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 static void
 mt7996_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 {
-	struct sta_rec_ht *ht;
+	struct sta_rec_ht_uni *ht;
 	struct tlv *tlv;
 
 	if (!sta->deflink.ht_cap.ht_supported)
@@ -1263,8 +1263,12 @@ mt7996_mcu_sta_ht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HT, sizeof(*ht));
 
-	ht = (struct sta_rec_ht *)tlv;
+	ht = (struct sta_rec_ht_uni *)tlv;
 	ht->ht_cap = cpu_to_le16(sta->deflink.ht_cap.cap);
+	ht->ampdu_param = u8_encode_bits(sta->deflink.ht_cap.ampdu_factor,
+					 IEEE80211_HT_AMPDU_PARM_FACTOR) |
+			  u8_encode_bits(sta->deflink.ht_cap.ampdu_density,
+					 IEEE80211_HT_AMPDU_PARM_DENSITY);
 }
 
 static void
@@ -1721,44 +1725,6 @@ mt7996_mcu_sta_bfee_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 	bfee->fb_identity_matrix = (nrow == 1 && tx_ant == 2);
 }
 
-static void
-mt7996_mcu_sta_phy_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
-		       struct ieee80211_vif *vif, struct ieee80211_sta *sta)
-{
-	struct sta_rec_phy *phy;
-	struct tlv *tlv;
-	u8 af = 0, mm = 0;
-
-	if (!sta->deflink.ht_cap.ht_supported && !sta->deflink.he_6ghz_capa.capa)
-		return;
-
-	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_PHY, sizeof(*phy));
-
-	phy = (struct sta_rec_phy *)tlv;
-	if (sta->deflink.ht_cap.ht_supported) {
-		af = sta->deflink.ht_cap.ampdu_factor;
-		mm = sta->deflink.ht_cap.ampdu_density;
-	}
-
-	if (sta->deflink.vht_cap.vht_supported) {
-		u8 vht_af = FIELD_GET(IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK,
-				      sta->deflink.vht_cap.cap);
-
-		af = max_t(u8, af, vht_af);
-	}
-
-	if (sta->deflink.he_6ghz_capa.capa) {
-		af = le16_get_bits(sta->deflink.he_6ghz_capa.capa,
-				   IEEE80211_HE_6GHZ_CAP_MAX_AMPDU_LEN_EXP);
-		mm = le16_get_bits(sta->deflink.he_6ghz_capa.capa,
-				   IEEE80211_HE_6GHZ_CAP_MIN_MPDU_START);
-	}
-
-	phy->ampdu = FIELD_PREP(IEEE80211_HT_AMPDU_PARM_FACTOR, af) |
-		     FIELD_PREP(IEEE80211_HT_AMPDU_PARM_DENSITY, mm);
-	phy->max_ampdu_len = af;
-}
-
 static void
 mt7996_mcu_sta_hdrt_tlv(struct mt7996_dev *dev, struct sk_buff *skb)
 {
@@ -2167,8 +2133,6 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 	/* tag order is in accordance with firmware dependency. */
 	if (sta) {
-		/* starec phy */
-		mt7996_mcu_sta_phy_tlv(dev, skb, vif, sta);
 		/* starec hdrt mode */
 		mt7996_mcu_sta_hdrt_tlv(dev, skb);
 		/* starec bfer */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index e23cc96c4dbc..1851528d10ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -467,6 +467,15 @@ struct bss_mld_tlv {
 	u8 __rsv[3];
 } __packed;
 
+struct sta_rec_ht_uni {
+	__le16 tag;
+	__le16 len;
+	__le16 ht_cap;
+	__le16 ht_cap_ext;
+	u8 ampdu_param;
+	u8 _rsv[3];
+} __packed;
+
 struct sta_rec_ba_uni {
 	__le16 tag;
 	__le16 len;
@@ -758,14 +767,13 @@ enum {
 #define MT7996_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +		\
 					 sizeof(struct sta_rec_basic) +		\
 					 sizeof(struct sta_rec_bf) +		\
-					 sizeof(struct sta_rec_ht) +		\
+					 sizeof(struct sta_rec_ht_uni) +	\
 					 sizeof(struct sta_rec_he_v2) +		\
 					 sizeof(struct sta_rec_ba_uni) +	\
 					 sizeof(struct sta_rec_vht) +		\
 					 sizeof(struct sta_rec_uapsd) + 	\
 					 sizeof(struct sta_rec_amsdu) +		\
 					 sizeof(struct sta_rec_bfee) +		\
-					 sizeof(struct sta_rec_phy) +		\
 					 sizeof(struct sta_rec_ra_uni) +	\
 					 sizeof(struct sta_rec_sec) +		\
 					 sizeof(struct sta_rec_ra_fixed_uni) +	\
-- 
2.39.2


