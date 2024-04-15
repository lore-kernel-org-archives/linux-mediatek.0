Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16035C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cO+Nz6pWljWFlGjF8bOfXSxVNHA9wkQKw71vbqy+eKA=; b=yVNGdP2U4+g9RDW08g/pqjwJLd
	yAow0byx4hpBtGCFXv3HfXx7nMW+pFT4smI4CdCVM5PbAIsuIvzffyIgs57Lzj5K57fO8xOEFyvKw
	pDDl6Xx4CHe/vOTT9AG0NpUhbpxWk7CfMHdEiIgH/YTixxANCjv19D/k7pS4nGbKl7X71iBg3l5SF
	+IbMWbnMA2PH13+yq9F90EnZdXNx4rwUNHX1R8z+6jYPlkhLwHG0oTmbmuwWx2IMbyXv7KoSEGe2p
	orK3kPoykAUdau746/Dsh9gdNw0w6s6Er9AGWPUJ+Gn9+ZnalozsgdvAhz8qpJTHiOSsTmrLCspYu
	CeDfRsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwM0E-00000008MVY-1a7y;
	Mon, 15 Apr 2024 13:04:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwM03-00000008MPe-1uKI
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 13:04:05 +0000
X-UUID: 983e2a54fb2811eeac1957ae9f99f617-20240415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cO+Nz6pWljWFlGjF8bOfXSxVNHA9wkQKw71vbqy+eKA=;
	b=XmQe0uas4BSjRAZFKJ647ecisdnLWWlSAjHPWxpIHQW6sIrVItmLuJd4Iv3sb3+1+R6EL5pVsgqMljVwZuPd5DeohVs1tcOTnF94iHXi2eG1FF7botXkT655DF4130ohDjit3R6h6GHEdZVVuocGL19oaSQpIBXf8Ibdc6vyLLs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:712a7415-c9c5-4c5b-85ad-bc3e3b8c15cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:c5f3b182-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 983e2a54fb2811eeac1957ae9f99f617-20240415
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1415102847; Mon, 15 Apr 2024 06:03:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 15 Apr 2024 21:03:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 Apr 2024 21:03:44 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Allan Wang <allan.wang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Quan Zhou
	<quan.zhou@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Deren Wu
	<deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: add EHT radiotap support in monitor mode
Date: Mon, 15 Apr 2024 21:03:42 +0800
Message-ID: <5553c30b820a299afce84a611562c21fbab6bb32.1713186083.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_060355_528040_26875FDC 
X-CRM114-Status: GOOD (  13.47  )
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

Add IEEE80211_RADIOTAP_EHT and IEEE80211_RADIOTAP_EHT_USIG radiotap
to fill in EHT information, such as MCS, NSS, GI and bandwidth.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  2 +
 .../wireless/mediatek/mt76/mt76_connac3_mac.c | 85 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt76_connac3_mac.h | 22 +++++
 .../net/wireless/mediatek/mt76/mt7925/mac.c   | 15 +++-
 4 files changed, 122 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 91987bdf239d..445d0f0ab779 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -451,4 +451,6 @@ void mt76_connac2_tx_token_put(struct mt76_dev *dev);
 /* connac3 */
 void mt76_connac3_mac_decode_he_radiotap(struct sk_buff *skb, __le32 *rxv,
 					 u8 mode);
+void mt76_connac3_mac_decode_eht_radiotap(struct sk_buff *skb, __le32 *rxv,
+					  u8 mode);
 #endif /* __MT76_CONNAC_H */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.c
index 73e9f283d0ae..92ad1ecf6c9d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.c
@@ -6,8 +6,11 @@
 #include "dma.h"
 
 #define HE_BITS(f)		cpu_to_le16(IEEE80211_RADIOTAP_HE_##f)
+#define EHT_BITS(f)		cpu_to_le32(IEEE80211_RADIOTAP_EHT_##f)
 #define HE_PREP(f, m, v)	le16_encode_bits(le32_get_bits(v, MT_CRXV_HE_##m),\
 						 IEEE80211_RADIOTAP_HE_##f)
+#define EHT_PREP(f, m, v)	le32_encode_bits(le32_get_bits(v, MT_CRXV_EHT_##m),\
+						 IEEE80211_RADIOTAP_EHT_##f)
 
 static void
 mt76_connac3_mac_decode_he_radiotap_ru(struct mt76_rx_status *status,
@@ -180,3 +183,85 @@ void mt76_connac3_mac_decode_he_radiotap(struct sk_buff *skb, __le32 *rxv,
 	}
 }
 EXPORT_SYMBOL_GPL(mt76_connac3_mac_decode_he_radiotap);
+
+static void *
+mt76_connac3_mac_radiotap_push_tlv(struct sk_buff *skb, u16 type, u16 len)
+{
+	struct ieee80211_radiotap_tlv *tlv;
+
+	tlv = skb_push(skb, sizeof(*tlv) + len);
+	tlv->type = cpu_to_le16(type);
+	tlv->len = cpu_to_le16(len);
+	memset(tlv->data, 0, len);
+
+	return tlv->data;
+}
+
+void mt76_connac3_mac_decode_eht_radiotap(struct sk_buff *skb, __le32 *rxv,
+					  u8 mode)
+{
+	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
+	struct ieee80211_radiotap_eht_usig *usig;
+	struct ieee80211_radiotap_eht *eht;
+	u32 ltf_size = le32_get_bits(rxv[4], MT_CRXV_HE_LTF_SIZE) + 1;
+	u8 bw = FIELD_GET(MT_PRXV_FRAME_MODE, le32_to_cpu(rxv[2]));
+
+	if (WARN_ONCE(skb_mac_header(skb) != skb->data,
+		      "Should push tlv at the top of mac hdr"))
+		return;
+
+	eht = mt76_connac3_mac_radiotap_push_tlv(skb, IEEE80211_RADIOTAP_EHT,
+						 sizeof(*eht) + sizeof(u32));
+	usig = mt76_connac3_mac_radiotap_push_tlv(skb, IEEE80211_RADIOTAP_EHT_USIG,
+						  sizeof(*usig));
+
+	status->flag |= RX_FLAG_RADIOTAP_TLV_AT_END;
+
+	eht->known |= EHT_BITS(KNOWN_SPATIAL_REUSE) |
+		      EHT_BITS(KNOWN_GI) |
+		      EHT_BITS(KNOWN_EHT_LTF) |
+		      EHT_BITS(KNOWN_LDPC_EXTRA_SYM_OM) |
+		      EHT_BITS(KNOWN_PE_DISAMBIGUITY_OM) |
+		      EHT_BITS(KNOWN_NSS_S);
+
+	eht->data[0] |=
+		EHT_PREP(DATA0_SPATIAL_REUSE, SR_MASK, rxv[13]) |
+		cpu_to_le32(FIELD_PREP(IEEE80211_RADIOTAP_EHT_DATA0_GI, status->eht.gi) |
+			    FIELD_PREP(IEEE80211_RADIOTAP_EHT_DATA0_LTF, ltf_size)) |
+		EHT_PREP(DATA0_PE_DISAMBIGUITY_OM, PE_DISAMBIG, rxv[5]) |
+		EHT_PREP(DATA0_LDPC_EXTRA_SYM_OM, LDPC_EXT_SYM, rxv[4]);
+
+	eht->data[7] |= le32_encode_bits(status->nss, IEEE80211_RADIOTAP_EHT_DATA7_NSS_S);
+
+	eht->user_info[0] |=
+		EHT_BITS(USER_INFO_MCS_KNOWN) |
+		EHT_BITS(USER_INFO_CODING_KNOWN) |
+		EHT_BITS(USER_INFO_NSS_KNOWN_O) |
+		EHT_BITS(USER_INFO_BEAMFORMING_KNOWN_O) |
+		EHT_BITS(USER_INFO_DATA_FOR_USER) |
+		le32_encode_bits(status->rate_idx, IEEE80211_RADIOTAP_EHT_USER_INFO_MCS) |
+		le32_encode_bits(status->nss, IEEE80211_RADIOTAP_EHT_USER_INFO_NSS_O);
+
+	if (le32_to_cpu(rxv[0]) & MT_PRXV_TXBF)
+		eht->user_info[0] |= EHT_BITS(USER_INFO_BEAMFORMING_O);
+
+	if (le32_to_cpu(rxv[0]) & MT_PRXV_HT_AD_CODE)
+		eht->user_info[0] |= EHT_BITS(USER_INFO_CODING);
+
+	if (mode == MT_PHY_TYPE_EHT_MU)
+		eht->user_info[0] |= EHT_BITS(USER_INFO_STA_ID_KNOWN) |
+				     EHT_PREP(USER_INFO_STA_ID, MU_AID, rxv[8]);
+
+	usig->common |=
+		EHT_BITS(USIG_COMMON_PHY_VER_KNOWN) |
+		EHT_BITS(USIG_COMMON_BW_KNOWN) |
+		EHT_BITS(USIG_COMMON_UL_DL_KNOWN) |
+		EHT_BITS(USIG_COMMON_BSS_COLOR_KNOWN) |
+		EHT_BITS(USIG_COMMON_TXOP_KNOWN) |
+		le32_encode_bits(0, IEEE80211_RADIOTAP_EHT_USIG_COMMON_PHY_VER) |
+		le32_encode_bits(bw, IEEE80211_RADIOTAP_EHT_USIG_COMMON_BW) |
+		EHT_PREP(USIG_COMMON_UL_DL, UPLINK, rxv[5]) |
+		EHT_PREP(USIG_COMMON_BSS_COLOR, BSS_COLOR, rxv[9]) |
+		EHT_PREP(USIG_COMMON_TXOP, TXOP_DUR, rxv[9]);
+}
+EXPORT_SYMBOL_GPL(mt76_connac3_mac_decode_eht_radiotap);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
index 83dcd964bfd0..353e66069840 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
@@ -142,6 +142,28 @@ enum {
 #define MT_CRXV_HE_RU3_L		GENMASK(31, 27)
 #define MT_CRXV_HE_RU3_H		GENMASK(3, 0)
 
+#define MT_CRXV_EHT_NUM_USER		GENMASK(26, 20)
+#define MT_CRXV_EHT_LTF_SIZE		GENMASK(28, 27)
+#define MT_CRXV_EHT_LDPC_EXT_SYM	BIT(30)
+#define MT_CRXV_EHT_PE_DISAMBIG		BIT(1)
+#define MT_CRXV_EHT_UPLINK		BIT(2)
+#define MT_CRXV_EHT_MU_AID		GENMASK(27, 17)
+#define MT_CRXV_EHT_BEAM_CHNG		BIT(29)
+#define MT_CRXV_EHT_DOPPLER		BIT(0)
+#define MT_CRXV_EHT_BSS_COLOR		GENMASK(15, 10)
+#define MT_CRXV_EHT_TXOP_DUR		GENMASK(23, 17)
+#define MT_CRXV_EHT_SR_MASK		GENMASK(11, 8)
+#define MT_CRXV_EHT_SR1_MASK		GENMASK(15, 12)
+#define MT_CRXV_EHT_SR2_MASK		GENMASK(19, 16)
+#define MT_CRXV_EHT_SR3_MASK		GENMASK(23, 20)
+#define MT_CRXV_EHT_RU0			GENMASK(8, 0)
+#define MT_CRXV_EHT_RU1			GENMASK(17, 9)
+#define MT_CRXV_EHT_RU2			GENMASK(26, 18)
+#define MT_CRXV_EHT_RU3_L		GENMASK(31, 27)
+#define MT_CRXV_EHT_RU3_H		GENMASK(3, 0)
+#define MT_CRXV_EHT_SIG_MCS		GENMASK(19, 18)
+#define MT_CRXV_EHT_LTF_SYM		GENMASK(22, 20)
+
 enum tx_header_format {
 	MT_HDR_FORMAT_802_3,
 	MT_HDR_FORMAT_CMD,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 1b9fbd9a140d..c2460ef4993d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -590,14 +590,25 @@ mt7925_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 			seq_ctrl = le16_to_cpu(hdr->seq_ctrl);
 			qos_ctl = *ieee80211_get_qos_ctl(hdr);
 		}
+		skb_set_mac_header(skb, (unsigned char *)hdr - skb->data);
 	} else {
 		status->flag |= RX_FLAG_8023;
 	}
 
 	mt792x_mac_assoc_rssi(dev, skb);
 
-	if (rxv && mode >= MT_PHY_TYPE_HE_SU && !(status->flag & RX_FLAG_8023))
-		mt76_connac3_mac_decode_he_radiotap(skb, rxv, mode);
+	if (rxv && !(status->flag & RX_FLAG_8023)) {
+		switch (status->encoding) {
+		case RX_ENC_EHT:
+			mt76_connac3_mac_decode_eht_radiotap(skb, rxv, mode);
+			break;
+		case RX_ENC_HE:
+			mt76_connac3_mac_decode_he_radiotap(skb, rxv, mode);
+			break;
+		default:
+			break;
+		}
+	}
 
 	if (!status->wcid || !ieee80211_is_data_qos(fc))
 		return 0;
-- 
2.18.0


