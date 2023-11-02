Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2417C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Nov 2023 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ey04DTD8TNvRtrQywYBWBaM9HwX78xk+E5TzYTg8j4A=; b=jZaSeg5beg4MXYX/RTsVVlDECn
	exfPKKF3rsUz5bR6NcrjqIScPOoKkkvBVTZAPhiXxfWDDkwqJM4kAlmasSswAuDjAtg9Kc5cCApGm
	8KmHRAUv7xJJ1duvp44/4jjym9+UKkjpGlB7uC7wJZVOf8jKd+R4Lt9gEXGqPmtpN3YfuCHCIfY6u
	EAvfiFJZ8z/eqh+b4QgQywjW38a99pdaR/k43GzuC2To4G2A+58oKdJzODVZE9RrU2BmE5V063lLm
	cfmrjAu36c6GvSiSJUe/ty3EtAXRWx1saMLhsUOUOrUdshde2lBV4XTSnkdrC2+Zdzob42Gwpri88
	Xe72FGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUYn-0095Pe-35;
	Thu, 02 Nov 2023 10:04:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUYj-0095P8-0H
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Nov 2023 10:04:20 +0000
X-UUID: 2cd04344796711ee9b7791016c24628a-20231102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ey04DTD8TNvRtrQywYBWBaM9HwX78xk+E5TzYTg8j4A=;
	b=hWho3LuLa5D1Xd1P5YBxK3u/uzFyZUDN7dXkvkpxTdnhrNiSMyj0fgah0ab8v73E3ZZaeLpDxhsyMs8ZeViZw7zmjHwzfNp05qqlMiFY2i9/CZ+ob4vvhVfUFTQwoKzHqaQi/e869c8tOxE+kcR/0rDKLkDFaGVD9gNMok/3euU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:4e4a1661-4e76-498a-bc54-516923c61527,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:8fc23172-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2cd04344796711ee9b7791016c24628a-20231102
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 268464262; Thu, 02 Nov 2023 03:04:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 Nov 2023 18:04:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 Nov 2023 18:04:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Allen Ye <allen.ye@mediatek.com>, Rudra
 Shahi <rudra.shahi@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 7/8] wifi: mt76: connac: add beacon protection support for mt7996
Date: Thu, 2 Nov 2023 18:03:01 +0800
Message-ID: <20231102100302.22160-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231102100302.22160-1-shayne.chen@mediatek.com>
References: <20231102100302.22160-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_030417_133263_6B86E9A7 
X-CRM114-Status: GOOD (  19.09  )
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

From: Allen Ye <allen.ye@mediatek.com>

Implement beacon protection feature for mt7996 chipsets, and also do
some cleanup on the set key routine.

Co-developed-by: Rudra Shahi <rudra.shahi@mediatek.com>
Signed-off-by: Rudra Shahi <rudra.shahi@mediatek.com>
Signed-off-by: Allen Ye <allen.ye@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  24 +++
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  12 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 139 +++++++++++++-----
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |  17 +++
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |   3 +-
 5 files changed, 153 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 0185804d8ce3..ae6d0179727d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -416,6 +416,14 @@ struct sta_rec_he_6g_capa {
 	u8 rsv[2];
 } __packed;
 
+struct sta_rec_pn_info {
+	__le16 tag;
+	__le16 len;
+	u8 pn[6];
+	u8 tsc_type;
+	u8 rsv;
+} __packed;
+
 struct sec_key {
 	u8 cipher_id;
 	u8 cipher_len;
@@ -768,6 +776,7 @@ struct wtbl_raw {
 					 sizeof(struct sta_rec_sec) +	\
 					 sizeof(struct sta_rec_ra_fixed) + \
 					 sizeof(struct sta_rec_he_6g_capa) + \
+					 sizeof(struct sta_rec_pn_info) + \
 					 sizeof(struct tlv) +		\
 					 MT76_CONNAC_WTBL_UPDATE_MAX_SIZE)
 
@@ -798,6 +807,7 @@ enum {
 	STA_REC_HE_V2 = 0x19,
 	STA_REC_MLD = 0x20,
 	STA_REC_EHT = 0x22,
+	STA_REC_PN_INFO = 0x26,
 	STA_REC_HDRT = 0x28,
 	STA_REC_HDR_TRANS = 0x2B,
 	STA_REC_MAX_NUM
@@ -1090,6 +1100,13 @@ enum mcu_cipher_type {
 	MCU_CIPHER_GCMP_256,
 	MCU_CIPHER_WAPI,
 	MCU_CIPHER_BIP_CMAC_128,
+	MCU_CIPHER_BIP_CMAC_256,
+	MCU_CIPHER_BCN_PROT_CMAC_128,
+	MCU_CIPHER_BCN_PROT_CMAC_256,
+	MCU_CIPHER_BCN_PROT_GMAC_128,
+	MCU_CIPHER_BCN_PROT_GMAC_256,
+	MCU_CIPHER_BIP_GMAC_128,
+	MCU_CIPHER_BIP_GMAC_256,
 };
 
 enum {
@@ -1310,6 +1327,7 @@ enum {
 	UNI_BSS_INFO_RATE = 11,
 	UNI_BSS_INFO_QBSS = 15,
 	UNI_BSS_INFO_SEC = 16,
+	UNI_BSS_INFO_BCN_PROT = 17,
 	UNI_BSS_INFO_TXCMD = 18,
 	UNI_BSS_INFO_UAPSD = 19,
 	UNI_BSS_INFO_PS = 21,
@@ -1771,6 +1789,12 @@ mt76_connac_mcu_get_cipher(int cipher)
 		return MCU_CIPHER_GCMP;
 	case WLAN_CIPHER_SUITE_GCMP_256:
 		return MCU_CIPHER_GCMP_256;
+	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
+		return MCU_CIPHER_BIP_GMAC_128;
+	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
+		return MCU_CIPHER_BIP_GMAC_256;
+	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
+		return MCU_CIPHER_BIP_CMAC_256;
 	case WLAN_CIPHER_SUITE_SMS4:
 		return MCU_CIPHER_WAPI;
 	default:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index d9ba57ae9fdc..51deea84b642 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -350,6 +350,8 @@ static int mt7996_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	case WLAN_CIPHER_SUITE_GCMP:
 	case WLAN_CIPHER_SUITE_GCMP_256:
 	case WLAN_CIPHER_SUITE_SMS4:
+	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
+	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
 		break;
 	case WLAN_CIPHER_SUITE_WEP40:
 	case WLAN_CIPHER_SUITE_WEP104:
@@ -373,9 +375,13 @@ static int mt7996_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	}
 
 	mt76_wcid_key_setup(&dev->mt76, wcid, key);
-	err = mt7996_mcu_add_key(&dev->mt76, vif, &msta->bip,
-				 key, MCU_WMWA_UNI_CMD(STA_REC_UPDATE),
-				 &msta->wcid, cmd);
+
+	if (key->keyidx == 6 || key->keyidx == 7)
+		err = mt7996_mcu_bcn_prot_enable(dev, vif, key);
+	else
+		err = mt7996_mcu_add_key(&dev->mt76, vif, key,
+					 MCU_WMWA_UNI_CMD(STA_REC_UPDATE),
+					 &msta->wcid, cmd);
 out:
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 1afcc96a0a52..ea2f08614ba3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2171,7 +2171,6 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 static int
 mt7996_mcu_sta_key_tlv(struct mt76_wcid *wcid,
-		       struct mt76_connac_sta_key_conf *sta_key_conf,
 		       struct sk_buff *skb,
 		       struct ieee80211_key_conf *key,
 		       enum set_key_cmd cmd)
@@ -2192,43 +2191,22 @@ mt7996_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 			return -EOPNOTSUPP;
 
 		sec_key = &sec->key[0];
+		sec_key->wlan_idx = cpu_to_le16(wcid->idx);
+		sec_key->mgmt_prot = 0;
+		sec_key->cipher_id = cipher;
 		sec_key->cipher_len = sizeof(*sec_key);
-
-		if (cipher == MCU_CIPHER_BIP_CMAC_128) {
-			sec_key->wlan_idx = cpu_to_le16(wcid->idx);
-			sec_key->cipher_id = MCU_CIPHER_AES_CCMP;
-			sec_key->key_id = sta_key_conf->keyidx;
-			sec_key->key_len = 16;
-			memcpy(sec_key->key, sta_key_conf->key, 16);
-
-			sec_key = &sec->key[1];
-			sec_key->wlan_idx = cpu_to_le16(wcid->idx);
-			sec_key->cipher_id = MCU_CIPHER_BIP_CMAC_128;
-			sec_key->cipher_len = sizeof(*sec_key);
-			sec_key->key_len = 16;
-			memcpy(sec_key->key, key->key, 16);
-			sec->n_cipher = 2;
-		} else {
-			sec_key->wlan_idx = cpu_to_le16(wcid->idx);
-			sec_key->cipher_id = cipher;
-			sec_key->key_id = key->keyidx;
-			sec_key->key_len = key->keylen;
-			memcpy(sec_key->key, key->key, key->keylen);
-
-			if (cipher == MCU_CIPHER_TKIP) {
-				/* Rx/Tx MIC keys are swapped */
-				memcpy(sec_key->key + 16, key->key + 24, 8);
-				memcpy(sec_key->key + 24, key->key + 16, 8);
-			}
-
-			/* store key_conf for BIP batch update */
-			if (cipher == MCU_CIPHER_AES_CCMP) {
-				memcpy(sta_key_conf->key, key->key, key->keylen);
-				sta_key_conf->keyidx = key->keyidx;
-			}
-
-			sec->n_cipher = 1;
+		sec_key->key_id = key->keyidx;
+		sec_key->key_len = key->keylen;
+		sec_key->need_resp = 0;
+		memcpy(sec_key->key, key->key, key->keylen);
+
+		if (cipher == MCU_CIPHER_TKIP) {
+			/* Rx/Tx MIC keys are swapped */
+			memcpy(sec_key->key + 16, key->key + 24, 8);
+			memcpy(sec_key->key + 24, key->key + 16, 8);
 		}
+
+		sec->n_cipher = 1;
 	} else {
 		sec->n_cipher = 0;
 	}
@@ -2237,7 +2215,6 @@ mt7996_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 }
 
 int mt7996_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
-		       struct mt76_connac_sta_key_conf *sta_key_conf,
 		       struct ieee80211_key_conf *key, int mcu_cmd,
 		       struct mt76_wcid *wcid, enum set_key_cmd cmd)
 {
@@ -2250,13 +2227,99 @@ int mt7996_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	ret = mt7996_mcu_sta_key_tlv(wcid, sta_key_conf, skb, key, cmd);
+	ret = mt7996_mcu_sta_key_tlv(wcid, skb, key, cmd);
 	if (ret)
 		return ret;
 
 	return mt76_mcu_skb_send_msg(dev, skb, mcu_cmd, true);
 }
 
+static int mt7996_mcu_get_pn(struct mt7996_dev *dev, struct ieee80211_vif *vif,
+			     u8 *pn)
+{
+#define TSC_TYPE_BIGTK_PN 2
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct sta_rec_pn_info *pn_info;
+	struct sk_buff *skb, *rskb;
+	struct tlv *tlv;
+	int ret;
+
+	skb = mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mvif->mt76, &mvif->sta.wcid);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_PN_INFO, sizeof(*pn_info));
+	pn_info = (struct sta_rec_pn_info *)tlv;
+
+	pn_info->tsc_type = TSC_TYPE_BIGTK_PN;
+	ret = mt76_mcu_skb_send_and_get_msg(&dev->mt76, skb,
+					    MCU_WM_UNI_CMD_QUERY(STA_REC_UPDATE),
+					    true, &rskb);
+	if (ret)
+		return ret;
+
+	skb_pull(rskb, 4);
+
+	pn_info = (struct sta_rec_pn_info *)rskb->data;
+	if (le16_to_cpu(pn_info->tag) == STA_REC_PN_INFO)
+		memcpy(pn, pn_info->pn, 6);
+
+	dev_kfree_skb(rskb);
+	return 0;
+}
+
+int mt7996_mcu_bcn_prot_enable(struct mt7996_dev *dev, struct ieee80211_vif *vif,
+			       struct ieee80211_key_conf *key)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_mcu_bcn_prot_tlv *bcn_prot;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+	u8 pn[6] = {};
+	int len = sizeof(struct bss_req_hdr) +
+		  sizeof(struct mt7996_mcu_bcn_prot_tlv);
+	int ret;
+
+	skb = __mt7996_mcu_alloc_bss_req(&dev->mt76, &mvif->mt76, len);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_BCN_PROT, sizeof(*bcn_prot));
+
+	bcn_prot = (struct mt7996_mcu_bcn_prot_tlv *)tlv;
+
+	ret = mt7996_mcu_get_pn(dev, vif, pn);
+	if (ret) {
+		dev_kfree_skb(skb);
+		return ret;
+	}
+
+	switch (key->cipher) {
+	case WLAN_CIPHER_SUITE_AES_CMAC:
+		bcn_prot->cipher_id = MCU_CIPHER_BCN_PROT_CMAC_128;
+		break;
+	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
+		bcn_prot->cipher_id = MCU_CIPHER_BCN_PROT_GMAC_128;
+		break;
+	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
+		bcn_prot->cipher_id = MCU_CIPHER_BCN_PROT_GMAC_256;
+		break;
+	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
+	default:
+		dev_err(dev->mt76.dev, "Not supported Bigtk Cipher\n");
+		dev_kfree_skb(skb);
+		return -EOPNOTSUPP;
+	}
+
+	pn[0]++;
+	memcpy(bcn_prot->pn, pn, 6);
+	bcn_prot->enable = BP_SW_MODE;
+	memcpy(bcn_prot->key, key->key, WLAN_MAX_KEY_LEN);
+	bcn_prot->key_id = key->keyidx;
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
+}
 int mt7996_mcu_add_dev_info(struct mt7996_phy *phy,
 			    struct ieee80211_vif *vif, bool enable)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 1851528d10ca..10a1b09ff2fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -345,6 +345,23 @@ struct bss_rate_tlv {
 	u8 __rsv2[9];
 } __packed;
 
+enum {
+	BP_DISABLE,
+	BP_SW_MODE,
+	BP_HW_MODE,
+};
+
+struct mt7996_mcu_bcn_prot_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 pn[6];
+	u8 enable;
+	u8 cipher_id;
+	u8 key[WLAN_MAX_KEY_LEN];
+	u8 key_id;
+	u8 __rsv[3];
+} __packed;
+
 struct bss_ra_tlv {
 	__le16 tag;
 	__le16 len;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index c62a42512bd6..0ba00e4166d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -584,9 +584,10 @@ int mt7996_init_debugfs(struct mt7996_phy *phy);
 void mt7996_debugfs_rx_fw_monitor(struct mt7996_dev *dev, const void *data, int len);
 bool mt7996_debugfs_rx_log(struct mt7996_dev *dev, const void *data, int len);
 int mt7996_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
-		       struct mt76_connac_sta_key_conf *sta_key_conf,
 		       struct ieee80211_key_conf *key, int mcu_cmd,
 		       struct mt76_wcid *wcid, enum set_key_cmd cmd);
+int mt7996_mcu_bcn_prot_enable(struct mt7996_dev *dev, struct ieee80211_vif *vif,
+			       struct ieee80211_key_conf *key);
 int mt7996_mcu_wtbl_update_hdr_trans(struct mt7996_dev *dev,
 				     struct ieee80211_vif *vif,
 				     struct ieee80211_sta *sta);
-- 
2.39.2


