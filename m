Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B892C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 08:23:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF51920775
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 08:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L94oPA1k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rnJH5uAt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF51920775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w52M9jfbEZxmNXv4FHhrTyx2DpbrIUIhDDNL+viqb0Y=; b=L94oPA1kzaxiqBq8G9Y1IbMZcV
	iouUeE5xbT7N6AkScy45rDTBu0WAH5xbPFchlQZ1YisvJrTv0T0l3bBVaxkRukYagsvorJZX1zTP7
	CMT4zdklQyaYJEmtn1TePdwC2lL3gbL1NFgMWKfG8vm6ZpfPADK9jp1gPDMp4g3AURbxJjTZ7zcyk
	iHa2tEjsexz1RBd35zyZ+qb6shd6tfDZDzSlYLE7Us3KfHA/DAc2C/r9Xd0+0T/cvT3Kj08oLt3FN
	rSG1P+X84Q9Cppmc+IYwfFHaoti4hRI6Dj6aMIRbWF38aIadKIbtBnH1JOWFTbTrzKTi6lOZ1iaJ3
	XBb1bJRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqY1a-0008Jl-1s; Wed, 01 Jul 2020 08:23:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqY1X-0008Ix-Hd
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 08:23:20 +0000
X-UUID: 922ce76aafa340118177eee7d522607f-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=76eqmK+mazVMja66kfghM8Lgafw11w7zHlbMjw3VfgM=; 
 b=rnJH5uAt3A8RNF0sG3ncYyVYD/8gc3jlsd9lTiKrUp5WV2YYNhhjD0uCqUTbV5PkD6Oj0BaZjcAS8YHV2WfXWwdeVivEpDiykGNzWCx0pwCLOkCrzQjktboo/iXdnRZS0JkTq0PFkGkz1iQwvSy5iJa5QuAlXw8uu0mn5qlLTBQ=;
X-UUID: 922ce76aafa340118177eee7d522607f-20200701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 668761646; Wed, 01 Jul 2020 00:23:13 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 01:13:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 16:13:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Jul 2020 16:13:06 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH] mt76: mt7915: avoid memcpy in rxv operation
Date: Wed, 1 Jul 2020 16:13:07 +0800
Message-ID: <b28636e4388942f8dc26b3a49a34c8b240af445f.1593590293.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: E725E782A65BC5D77E6D9A486DAF9AA55E111CC10A764477DFF59323A2558F572000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_042319_857093_DBF643B2 
X-CRM114-Status: GOOD (  10.71  )
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

Avoid memcpy in Rx hot path to slightly improve performance.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 78 +++++++++----------
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  7 --
 2 files changed, 37 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 822540e5df6b..6825afca1efb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -178,14 +178,14 @@ void mt7915_mac_sta_poll(struct mt7915_dev *dev)
 
 static void
 mt7915_mac_decode_he_radiotap_ru(struct mt76_rx_status *status,
-				 struct mt7915_rxv *rxv,
-				 struct ieee80211_radiotap_he *he)
+				 struct ieee80211_radiotap_he *he,
+				 __le32 *rxv)
 {
 	u32 ru_h, ru_l;
 	u8 ru, offs = 0;
 
-	ru_l = FIELD_GET(MT_PRXV_HE_RU_ALLOC_L, le32_to_cpu(rxv->v[0]));
-	ru_h = FIELD_GET(MT_PRXV_HE_RU_ALLOC_H, le32_to_cpu(rxv->v[1]));
+	ru_l = FIELD_GET(MT_PRXV_HE_RU_ALLOC_L, le32_to_cpu(rxv[0]));
+	ru_h = FIELD_GET(MT_PRXV_HE_RU_ALLOC_H, le32_to_cpu(rxv[1]));
 	ru = (u8)(ru_l | ru_h << 4);
 
 	status->bw = RATE_INFO_BW_HE_RU;
@@ -228,7 +228,7 @@ mt7915_mac_decode_he_radiotap_ru(struct mt76_rx_status *status,
 static void
 mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 			      struct mt76_rx_status *status,
-			      struct mt7915_rxv *rxv)
+			      __le32 *rxv, u32 phy)
 {
 	/* TODO: struct ieee80211_radiotap_he_mu */
 	static const struct ieee80211_radiotap_he known = {
@@ -245,48 +245,45 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 			 HE_BITS(DATA2_TXOP_KNOWN),
 	};
 	struct ieee80211_radiotap_he *he = NULL;
-	__le32 v2 = rxv->v[2];
-	__le32 v11 = rxv->v[11];
-	__le32 v14 = rxv->v[14];
-	u32 ltf_size = le32_get_bits(v2, MT_CRXV_HE_LTF_SIZE) + 1;
+	u32 ltf_size = le32_get_bits(rxv[2], MT_CRXV_HE_LTF_SIZE) + 1;
 
 	he = skb_push(skb, sizeof(known));
 	memcpy(he, &known, sizeof(known));
 
-	he->data3 = HE_PREP(DATA3_BSS_COLOR, BSS_COLOR, v14) |
-		    HE_PREP(DATA3_LDPC_XSYMSEG, LDPC_EXT_SYM, v2);
-	he->data5 = HE_PREP(DATA5_PE_DISAMBIG, PE_DISAMBIG, v2) |
+	he->data3 = HE_PREP(DATA3_BSS_COLOR, BSS_COLOR, rxv[14]) |
+		    HE_PREP(DATA3_LDPC_XSYMSEG, LDPC_EXT_SYM, rxv[2]);
+	he->data5 = HE_PREP(DATA5_PE_DISAMBIG, PE_DISAMBIG, rxv[2]) |
 		    le16_encode_bits(ltf_size,
 				     IEEE80211_RADIOTAP_HE_DATA5_LTF_SIZE);
-	he->data6 = HE_PREP(DATA6_TXOP, TXOP_DUR, v14) |
-		    HE_PREP(DATA6_DOPPLER, DOPPLER, v14);
+	he->data6 = HE_PREP(DATA6_TXOP, TXOP_DUR, rxv[14]) |
+		    HE_PREP(DATA6_DOPPLER, DOPPLER, rxv[14]);
 
-	switch (rxv->phy) {
+	switch (phy) {
 	case MT_PHY_TYPE_HE_SU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_SU) |
 			     HE_BITS(DATA1_UL_DL_KNOWN) |
 			     HE_BITS(DATA1_BEAM_CHANGE_KNOWN) |
 			     HE_BITS(DATA1_SPTL_REUSE_KNOWN);
 
-		he->data3 |= HE_PREP(DATA3_BEAM_CHANGE, BEAM_CHNG, v14) |
-			     HE_PREP(DATA3_UL_DL, UPLINK, v2);
-		he->data4 |= HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, v11);
+		he->data3 |= HE_PREP(DATA3_BEAM_CHANGE, BEAM_CHNG, rxv[14]) |
+			     HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
+		he->data4 |= HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, rxv[11]);
 		break;
 	case MT_PHY_TYPE_HE_EXT_SU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_EXT_SU) |
 			     HE_BITS(DATA1_UL_DL_KNOWN);
 
-		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, v2);
+		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
 		break;
 	case MT_PHY_TYPE_HE_MU:
 		he->data1 |= HE_BITS(DATA1_FORMAT_MU) |
 			     HE_BITS(DATA1_UL_DL_KNOWN) |
 			     HE_BITS(DATA1_SPTL_REUSE_KNOWN);
 
-		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, v2);
-		he->data4 |= HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, v11);
+		he->data3 |= HE_PREP(DATA3_UL_DL, UPLINK, rxv[2]);
+		he->data4 |= HE_PREP(DATA4_SU_MU_SPTL_REUSE, SR_MASK, rxv[11]);
 
-		mt7915_mac_decode_he_radiotap_ru(status, rxv, he);
+		mt7915_mac_decode_he_radiotap_ru(status, he, rxv);
 		break;
 	case MT_PHY_TYPE_HE_TB:
 		he->data1 |= HE_BITS(DATA1_FORMAT_TRIG) |
@@ -295,12 +292,12 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 			     HE_BITS(DATA1_SPTL_REUSE3_KNOWN) |
 			     HE_BITS(DATA1_SPTL_REUSE4_KNOWN);
 
-		he->data4 |= HE_PREP(DATA4_TB_SPTL_REUSE1, SR_MASK, v11) |
-			     HE_PREP(DATA4_TB_SPTL_REUSE2, SR1_MASK, v11) |
-			     HE_PREP(DATA4_TB_SPTL_REUSE3, SR2_MASK, v11) |
-			     HE_PREP(DATA4_TB_SPTL_REUSE4, SR3_MASK, v11);
+		he->data4 |= HE_PREP(DATA4_TB_SPTL_REUSE1, SR_MASK, rxv[11]) |
+			     HE_PREP(DATA4_TB_SPTL_REUSE2, SR1_MASK, rxv[11]) |
+			     HE_PREP(DATA4_TB_SPTL_REUSE3, SR2_MASK, rxv[11]) |
+			     HE_PREP(DATA4_TB_SPTL_REUSE4, SR3_MASK, rxv[11]);
 
-		mt7915_mac_decode_he_radiotap_ru(status, rxv, he);
+		mt7915_mac_decode_he_radiotap_ru(status, he, rxv);
 		break;
 	default:
 		break;
@@ -314,8 +311,9 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	struct mt7915_phy *phy = &dev->phy;
 	struct ieee80211_supported_band *sband;
 	struct ieee80211_hdr *hdr;
-	struct mt7915_rxv rxv = {};
 	__le32 *rxd = (__le32 *)skb->data;
+	__le32 *rxv = NULL;
+	u32 mode = 0;
 	u32 rxd1 = le32_to_cpu(rxd[1]);
 	u32 rxd2 = le32_to_cpu(rxd[2]);
 	u32 rxd3 = le32_to_cpu(rxd[3]);
@@ -427,15 +425,14 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	if (rxd1 & MT_RXD1_NORMAL_GROUP_3) {
 		u32 v0, v1, v2;
 
-		memcpy(rxv.v, rxd, sizeof(rxv.v));
-
+		rxv = rxd;
 		rxd += 2;
 		if ((u8 *)rxd - skb->data >= skb->len)
 			return -EINVAL;
 
-		v0 = le32_to_cpu(rxv.v[0]);
-		v1 = le32_to_cpu(rxv.v[1]);
-		v2 = le32_to_cpu(rxv.v[2]);
+		v0 = le32_to_cpu(rxv[0]);
+		v1 = le32_to_cpu(rxv[1]);
+		v2 = le32_to_cpu(rxv[2]);
 
 		if (v0 & MT_PRXV_HT_AD_CODE)
 			status->enc_flags |= RX_ENC_FLAG_LDPC;
@@ -466,9 +463,9 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 				return -EINVAL;
 
 			idx = i = FIELD_GET(MT_PRXV_TX_RATE, v0);
-			rxv.phy = FIELD_GET(MT_CRXV_TX_MODE, v2);
+			mode = FIELD_GET(MT_CRXV_TX_MODE, v2);
 
-			switch (rxv.phy) {
+			switch (mode) {
 			case MT_PHY_TYPE_CCK:
 				cck = true;
 				/* fall through */
@@ -503,8 +500,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 				if (gi <= NL80211_RATE_INFO_HE_GI_3_2)
 					status->he_gi = gi;
 
-				if (idx & MT_PRXV_TX_DCM)
-					status->he_dcm = true;
+				status->he_dcm = !!(idx & MT_PRXV_TX_DCM);
 				break;
 			default:
 				return -EINVAL;
@@ -515,7 +511,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 			case IEEE80211_STA_RX_BW_20:
 				break;
 			case IEEE80211_STA_RX_BW_40:
-				if (rxv.phy & MT_PHY_TYPE_HE_EXT_SU &&
+				if (mode & MT_PHY_TYPE_HE_EXT_SU &&
 				    (idx & MT_PRXV_TX_ER_SU_106T)) {
 					status->bw = RATE_INFO_BW_HE_RU;
 					status->he_ru =
@@ -535,7 +531,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 			}
 
 			status->enc_flags |= RX_ENC_FLAG_STBC_MASK * stbc;
-			if (rxv.phy < MT_PHY_TYPE_HE_SU && gi)
+			if (mode < MT_PHY_TYPE_HE_SU && gi)
 				status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
 		}
 	}
@@ -548,8 +544,8 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 		mt76_insert_ccmp_hdr(skb, key_id);
 	}
 
-	if (status->flag & RX_FLAG_RADIOTAP_HE)
-		mt7915_mac_decode_he_radiotap(skb, status, &rxv);
+	if (rxv && status->flag & RX_FLAG_RADIOTAP_HE)
+		mt7915_mac_decode_he_radiotap(skb, status, rxv, mode);
 
 	hdr = mt76_skb_get_hdr(skb);
 	if (!status->wcid || !ieee80211_is_data_qos(hdr->frame_control))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 4b0871ab2414..c8bb5ea96c60 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -128,13 +128,6 @@ enum rx_pkt_type {
 #define MT_CRXV_HE_BEAM_CHNG		BIT(13)
 #define MT_CRXV_HE_DOPPLER		BIT(16)
 
-struct mt7915_rxv {
-	u32 phy;
-
-	/* P-RXV: bit 0~1, C-RXV: bit 2~19 */
-	__le32 v[20];
-};
-
 enum tx_header_format {
 	MT_HDR_FORMAT_802_3,
 	MT_HDR_FORMAT_CMD,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
