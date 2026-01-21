Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF4ED4695B
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jan 2026 17:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMxKVGzxdc2VWdFj61XCuGukRgUh5LERys24YGK+r1g=; b=QH5xsgFC9xiW/718/aWEGP8/TL
	zOkStmweyK4DSbPkal2CmV70s5tabMeUzDtpEAYv5gqme+0W5OIhDShd2ow6slcgts5pW9GPyRsqW
	PllOhSIYhLPLYyy3T95DlCNBpubL6UYwZWR8njj43Il8lvQz1X90IQoH5oS2OwlrKsu10tgECz+wu
	lF/TVoEGlxamC01x0bwaoqadHO7lY20/nP1XSX9ScXGN7fhL8LffdYpY/zooasIrC1OlvYd478x8R
	IZethUz32ntxYeavKoOvw6UAfPNqzdH7cLsv/Xyk+cOStywaqEdT0NzxrPxD8hVGWBRi/q0PuFVBK
	EMwSlsWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicDm-00000005sgb-0InZ;
	Wed, 21 Jan 2026 17:42:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vicDk-00000005sfl-1pKW
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Jan 2026 17:42:21 +0000
X-UUID: 87b5b772f6f011f0a16f0188aa809bee-20260121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lMxKVGzxdc2VWdFj61XCuGukRgUh5LERys24YGK+r1g=;
	b=EK9ko7J5R+w8RJJL1MvZ3R7+kud8JHqUHulQGRg1YLdMUXMRcIpnHnKFtR5iyaE+39lFIsNMRywYTaefr3/JJilL8UCGtEkTiN2gENJ8CBOW0Hkw40/KOONceHHQoaPZ+DjPKbU9NbvtVOZQh0IgspOpGoEe2vHxbkVV3jVHZmA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:b53aa242-f57a-4127-b76c-132c04592078,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:a6460e7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87b5b772f6f011f0a16f0188aa809bee-20260121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1975806715; Wed, 21 Jan 2026 10:42:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 22 Jan 2026 01:42:15 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 22 Jan 2026 01:42:14 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Ryder Lee <ryder.lee@mediatek.com>, Money Wang <money.wang@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt7996: add support for ERP CTS & HT protection
Date: Wed, 21 Jan 2026 09:41:58 -0800
Message-ID: <942ddb5777d5c201930d6609e9ba877a6ba6714a.1768879119.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <edb87088b0111b32fafc6c4179f54a5286dd37d8.1768879119.git.ryder.lee@mediatek.com>
References: <edb87088b0111b32fafc6c4179f54a5286dd37d8.1768879119.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_094220_480202_849E5EAC 
X-CRM114-Status: GOOD (  14.31  )
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

This patch adds support for handling BSS_CHANGED_ERP_CTS_PROT and
BSS_CHANGED_HT.

With this change, when the Wi-Fi driver needs to adjust its behavior for
compatibility or performance, especially concerning older 11g/n devices,
by enabling or disabling CTS protection frames, often for hidden SSIDs or
to manage legacy clients.

It also introduces debugfs options to manually control protection mode,
allowing users to select betweenno protection, RTS/CTS, and CTS-to-self.

Reviewed-by: Money Wang <money.wang@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  4 ++
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 46 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  6 +++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  2 +
 5 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 8d59cf43f..f44977f90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1363,6 +1363,7 @@ enum {
 	UNI_BSS_INFO_BASIC = 0,
 	UNI_BSS_INFO_RA = 1,
 	UNI_BSS_INFO_RLM = 2,
+	UNI_BSS_INFO_PROTECT_INFO = 3,
 	UNI_BSS_INFO_BSS_COLOR = 4,
 	UNI_BSS_INFO_HE_BASIC = 5,
 	UNI_BSS_INFO_11V_MBSSID = 6,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index beed795ed..db76f1f5d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -864,6 +864,10 @@ mt7996_link_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 				   !!(changed & BSS_CHANGED_BSSID));
 	}
 
+	if (changed & BSS_CHANGED_HT || changed & BSS_CHANGED_ERP_CTS_PROT)
+		mt7996_mcu_set_protection(phy, link, info->ht_operation_mode,
+					  info->use_cts_prot);
+
 	if (changed & BSS_CHANGED_ERP_SLOT) {
 		int slottime = info->use_short_slot ? 9 : 20;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 14a88ef79..3d103c66a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1170,6 +1170,52 @@ int mt7996_mcu_add_bss_info(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
+int mt7996_mcu_set_protection(struct mt7996_phy *phy, struct mt7996_vif_link *link,
+			      u8 ht_mode, bool use_cts_prot)
+{
+	struct mt7996_dev *dev = phy->dev;
+	struct bss_prot_tlv *prot;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+	enum {
+		PROT_NONMEMBER	 = BIT(1),
+		PROT_20MHZ	 = BIT(2),
+		PROT_NONHT_MIXED = BIT(3),
+		PROT_LEGACY_ERP	 = BIT(5),
+		PROT_NONGF_STA	 = BIT(7),
+	};
+
+	skb = __mt7996_mcu_alloc_bss_req(&dev->mt76, &link->mt76,
+					 MT7996_BSS_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_PROTECT_INFO,
+				     sizeof(*prot));
+	prot = (struct bss_prot_tlv *)tlv;
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
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_WM_UNI_CMD(BSS_INFO_UPDATE), true);
+}
+
 int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			  struct ieee80211_bss_conf *link_conf)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index e0b83ac9f..3a4a7ec3c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -474,6 +474,12 @@ struct bss_mld_tlv {
 	u8 __rsv[2];
 } __packed;
 
+struct bss_prot_tlv {
+	__le16 tag;
+	__le16 len;
+	__le32 prot_mode;
+} __packed;
+
 struct sta_rec_ht_uni {
 	__le16 tag;
 	__le16 len;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 7a8843118..d9370b56f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -719,6 +719,8 @@ int mt7996_mcu_set_radar_th(struct mt7996_dev *dev, int index,
 			    const struct mt7996_dfs_pattern *pattern);
 int mt7996_mcu_set_radio_en(struct mt7996_phy *phy, bool enable);
 int mt7996_mcu_set_rts_thresh(struct mt7996_phy *phy, u32 val);
+int mt7996_mcu_set_protection(struct mt7996_phy *phy, struct mt7996_vif_link *link,
+			      u8 ht_mode, bool use_cts_prot);
 int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			  struct ieee80211_bss_conf *link_conf);
 int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch);
-- 
2.45.2


