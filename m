Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C749FC44506
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jan 2026 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcbxGcY//RjmScQmafj01a9J13mGhcggikZW07HIDow=; b=vWbsbaHdHNVE7z3yTRYYg2MnjD
	BdrUfs0UDsTnX7XNt5m78h47jNQs25SvTlKG0ApCY33q6UNwAbRK0dwgA5TSSWZrg+So4rs8bQBwu
	nTYH44OiOe90ej+UdGGUwd3pxCD8LaiMsYG267+bjMHUFSgPpjmuKOj3DAWC30zpP+cwCL189VlDu
	WuXPVautZkvwXrzkyE2BkHjHv/hq5zXRijMEffll4RI17x+1qbeIOsjFaXA907t1eQlVgMU3gMLLW
	0ZYQgj17CI2yUfw/4LPuMsJj41KZ8dyK6ELXpA3SxyzS2sK5I8wWqUTZRRFd8RqrGnUWLSISicmC2
	wUwBlIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicDk-00000005sfe-0Fg6;
	Wed, 21 Jan 2026 17:42:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicDg-00000005sei-399C
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Jan 2026 17:42:17 +0000
X-UUID: 841d45d0f6f011f0a16f0188aa809bee-20260121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OcbxGcY//RjmScQmafj01a9J13mGhcggikZW07HIDow=;
	b=PUo7N1ixvJ1tg+d/jEPys1T2erpNZmzmBFBT9tedRhzV7Y0iXEgV76wNZ6JxykJ2/4E5I+VyHqd4S/xJqRc3oOqG5yz2sKxBQWUvjZMcYbdGlEiqr44t4YVPWFBvPZHqdDjU5ZfsXCRciSFRCsyMiRzGg3Zp6lKJYt4JuvKA+fk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:09d0a04a-0df0-429a-868f-dd4ca053d4b4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:146ec7e8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 841d45d0f6f011f0a16f0188aa809bee-20260121
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1959604264; Wed, 21 Jan 2026 10:42:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 22 Jan 2026 01:42:09 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 22 Jan 2026 01:42:08 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/3] wifi: mt76: mt7915: fix use_cts_prot support
Date: Wed, 21 Jan 2026 09:41:57 -0800
Message-ID: <eb8db4d0bf1c89b7486e89facb788ae3e510dd8b.1768879119.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <edb87088b0111b32fafc6c4179f54a5286dd37d8.1768879119.git.ryder.lee@mediatek.com>
References: <edb87088b0111b32fafc6c4179f54a5286dd37d8.1768879119.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_094216_797748_CCAB01E0 
X-CRM114-Status: GOOD (  14.22  )
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

With this fix, when driver needs to adjust its behavior for compatibility,
especially concerning older 11g/n devices, by enabling or disabling CTS
protection frames, often for hidden SSIDs or to manage legacy clients.

Fixes: 150b91419d3d ("wifi: mt76: mt7915: enable use_cts_prot support")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 13 ----
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  7 ++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 62 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 11 ++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 ++
 5 files changed, 81 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index cefe56c05..cec2c4208 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -232,19 +232,6 @@ static void mt7915_mac_sta_poll(struct mt7915_dev *dev)
 	rcu_read_unlock();
 }
 
-void mt7915_mac_enable_rtscts(struct mt7915_dev *dev,
-			      struct ieee80211_vif *vif, bool enable)
-{
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	u32 addr;
-
-	addr = mt7915_mac_wtbl_lmac_addr(dev, mvif->sta.wcid.idx, 5);
-	if (enable)
-		mt76_set(dev, addr, BIT(5));
-	else
-		mt76_clear(dev, addr, BIT(5));
-}
-
 static void
 mt7915_wed_check_ppe(struct mt7915_dev *dev, struct mt76_queue *q,
 		     struct mt7915_sta *msta, struct sk_buff *skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 90d5e79fb..089229161 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -68,7 +68,7 @@ int mt7915_run(struct ieee80211_hw *hw)
 	if (ret)
 		goto out;
 
-	ret = mt76_connac_mcu_set_rts_thresh(&dev->mt76, 0x92b,
+	ret = mt76_connac_mcu_set_rts_thresh(&dev->mt76, MT7915_RTS_LEN_THRES,
 					     phy->mt76->band_idx);
 	if (ret)
 		goto out;
@@ -633,8 +633,9 @@ static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 	if (set_sta == 1)
 		mt7915_mcu_add_sta(dev, vif, NULL, CONN_STATE_PORT_SECURE, false);
 
-	if (changed & BSS_CHANGED_ERP_CTS_PROT)
-		mt7915_mac_enable_rtscts(dev, vif, info->use_cts_prot);
+	if (changed & BSS_CHANGED_HT || changed & BSS_CHANGED_ERP_CTS_PROT)
+		mt7915_mcu_set_protection(phy, vif, info->ht_operation_mode,
+					  info->use_cts_prot);
 
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = 9;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 00bff4d3a..95b8f34a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3954,6 +3954,68 @@ int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 	return ret;
 }
 
+int mt7915_mcu_set_protection(struct mt7915_phy *phy, struct ieee80211_vif *vif,
+			      u8 ht_mode, bool use_cts_prot)
+{
+	struct mt7915_dev *dev = phy->dev;
+	int len = sizeof(struct sta_req_hdr) + sizeof(struct bss_info_prot);
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct bss_info_prot *prot;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+	enum {
+		PROT_NONMEMBER	 = BIT(1),
+		PROT_20MHZ	 = BIT(2),
+		PROT_NONHT_MIXED = BIT(3),
+		PROT_LEGACY_ERP	 = BIT(5),
+		PROT_NONGF_STA	 = BIT(7),
+	};
+	u32 rts_threshold;
+
+	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mvif->mt76,
+					      NULL, len);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	tlv = mt76_connac_mcu_add_tlv(skb, BSS_INFO_PROTECT_INFO,
+				      sizeof(*prot));
+	prot = (struct bss_info_prot *)tlv;
+
+	switch (ht_mode & IEEE80211_HT_OP_MODE_PROTECTION) {
+	case IEEE80211_HT_OP_MODE_PROTECTION_NONMEMBER:
+		prot->prot_mode = cpu_to_le32(PROT_NONMEMBER);
+		break;
+	case IEEE80211_HT_OP_MODE_PROTECTION_20MHZ:
+		prot->prot_mode = cpu_to_le32(PROT_20MHZ);
+		break;
+	case IEEE80211_HT_OP_MODE_PROTECTION_NONHT_MIXED:
+		prot->prot_mode = cpu_to_le32(PROT_NONHT_MIXED);
+		break;
+	}
+
+	if (ht_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
+		prot->prot_mode |= cpu_to_le32(PROT_NONGF_STA);
+
+	if (use_cts_prot)
+		prot->prot_mode |= cpu_to_le32(PROT_LEGACY_ERP);
+
+	/* reuse current RTS setting */
+	rts_threshold = phy->mt76->hw->wiphy->rts_threshold;
+	if (rts_threshold == (u32)-1)
+		prot->rts_len_thres = cpu_to_le32(MT7915_RTS_LEN_THRES);
+	else
+		prot->rts_len_thres = cpu_to_le32(rts_threshold);
+
+	prot->rts_pkt_thres = 0x2;
+
+	prot->he_rts_thres = cpu_to_le16(vif->bss_conf.frame_time_rts_th);
+	if (!prot->he_rts_thres)
+		prot->he_rts_thres = cpu_to_le16(DEFAULT_HE_DURATION_RTS_THRES);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_EXT_CMD(BSS_INFO_UPDATE), true);
+}
+
 int mt7915_mcu_update_bss_color(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 				struct cfg80211_he_bss_color *he_bss_color)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 3af11a075..22f73a5ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -399,6 +399,17 @@ struct bss_info_inband_discovery {
 	__le16 prob_rsp_len;
 } __packed __aligned(4);
 
+struct bss_info_prot {
+	__le16 tag;
+	__le16 len;
+	__le32 prot_type;
+	__le32 prot_mode;
+	__le32 rts_len_thres;
+	__le16 he_rts_thres;
+	u8 rts_pkt_thres;
+	u8 rsv[5];
+} __packed;
+
 enum {
 	BSS_INFO_BCN_CSA,
 	BSS_INFO_BCN_BCC,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index b5c06201b..bf1d915a3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -84,6 +84,8 @@
 #define MT7915_CRIT_TEMP		110
 #define MT7915_MAX_TEMP			120
 
+#define MT7915_RTS_LEN_THRES		0x92b
+
 struct mt7915_vif;
 struct mt7915_sta;
 struct mt7915_dfs_pulse;
@@ -473,6 +475,8 @@ int mt7915_mcu_add_inband_discov(struct mt7915_dev *dev, struct ieee80211_vif *v
 				 u32 changed);
 int mt7915_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  int enable, u32 changed);
+int mt7915_mcu_set_protection(struct mt7915_phy *phy, struct ieee80211_vif *vif,
+			      u8 ht_mode, bool use_cts_prot);
 int mt7915_mcu_add_obss_spr(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			    struct ieee80211_he_obss_pd *he_obss_pd);
 int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-- 
2.45.2


