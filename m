Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C240EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 10:12:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8460A60FC3
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 10:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8460A60FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJt5+NlNTlMILu5PPAylKuhelxc3xYCmF7xgVz8DdKs=; b=qLo3rXxT8Sudgi
	kfvCfbHpmYW7/2XFMXbbrdANYyUMcCsVcjf6cereO/2oJjfE5U1GHuY8Y5awd+2CsMyNw+5gnFBjM
	F4DyZBKJMqP/RabR+0Puw95pnvtPQUD2br4FrZpRUtCDl1SPJvZSLsoNBIkRhFqSEQGsRWLXJKYEM
	tnw7BSAZ5MvoFZ7aNl0LAoVvbV+8Pgzfhd4AQq2tQr08GwBk5LsfC9xzOnrDH74VwlYcvnbQFRsDX
	CmYXWFZHpDMtXlqh+j0UnBWBnJ4xZyhTn7N52LA/kDNzb9ZeeQ/1tJr2KgT9kaskzZ9VKjZPHaKLW
	sXZgNWf1H+1nOyxglI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miwD7-00B4hP-U8; Fri, 05 Nov 2021 10:12:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miwD0-00B4ad-64
 for linux-mediatek@lists.infradead.org; Fri, 05 Nov 2021 10:12:32 +0000
X-UUID: ea58b448c7d4463fa8f4547ce656781a-20211105
X-UUID: ea58b448c7d4463fa8f4547ce656781a-20211105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1268618283; Fri, 05 Nov 2021 03:12:21 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Nov 2021 03:02:24 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 5 Nov 2021 18:02:17 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 5 Nov 2021 18:02:17 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v2 08/11] mt76: mt7915: update rx rate reporting for mt7916
Date: Fri, 5 Nov 2021 18:02:07 +0800
Message-ID: <95854df7f5be3eafe53ac02bd2eddd3a5ce8df21.1636105953.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1636105953.git.Bo.Jiao@mediatek.com>
References: <cover.1636105953.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_031230_291340_827565F3 
X-CRM114-Status: GOOD (  16.48  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

mt7916 reports rx rate from rxd group3 directly.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   3 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 199 +++++++++++-------
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |   6 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  11 +-
 4 files changed, 137 insertions(+), 82 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 86f2062..74f7174 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -411,7 +411,8 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
 	mt76_rmw(dev, MT_MDP_BNRCFR1(band), mask, set);
 
 	mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_MAX_RX_LEN, 0x680);
-	/* disable rx rate report by default due to hw issues */
+
+	/* mt7915: disable rx rate report by default due to hw issues */
 	mt76_clear(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_RXD_G5_EN);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index d2f0537..b9961b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -384,6 +384,119 @@ mt7915_mac_decode_he_radiotap(struct sk_buff *skb,
 	}
 }
 
+static int
+mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
+			struct mt76_rx_status *status,
+			struct ieee80211_supported_band *sband,
+			__le32 *rxv)
+{
+	u32 v0, v1, v2;
+	u16 legacy;
+	u8 flags, stbc, gi, bw, dcm, mode, nss;
+	int i, idx;
+	bool cck = false;
+
+	v0 = le32_to_cpu(rxv[0]);
+	v1 = le32_to_cpu(rxv[1]);
+	v2 = le32_to_cpu(rxv[2]);
+
+	idx = i = FIELD_GET(MT_PRXV_TX_RATE, v0);
+	nss = FIELD_GET(MT_PRXV_NSTS, v0) + 1;
+
+	if (!is_mt7915(&dev->mt76)) {
+		stbc = FIELD_GET(MT_PRXV_HT_STBC, v0);
+		gi = FIELD_GET(MT_PRXV_HT_SHORT_GI, v0);
+		mode = FIELD_GET(MT_PRXV_TX_MODE, v0);
+		dcm = FIELD_GET(MT_PRXV_DCM, v0);
+		bw = FIELD_GET(MT_PRXV_FRAME_MODE, v0);
+	} else {
+		stbc = FIELD_GET(MT_CRXV_HT_STBC, v2);
+		gi = FIELD_GET(MT_CRXV_HT_SHORT_GI, v2);
+		mode = FIELD_GET(MT_CRXV_TX_MODE, v2);
+		dcm = !!(idx & GENMASK(3, 0) & MT_PRXV_TX_DCM);
+		bw = FIELD_GET(MT_CRXV_FRAME_MODE, v2);
+	}
+
+	switch (mode) {
+	case MT_PHY_TYPE_CCK:
+		cck = true;
+		fallthrough;
+	case MT_PHY_TYPE_OFDM:
+		i = mt76_get_rate(&dev->mt76, sband, i, cck);
+		legacy = sband->bitrates[i].bitrate;
+		break;
+	case MT_PHY_TYPE_HT_GF:
+	case MT_PHY_TYPE_HT:
+		status->encoding = RX_ENC_HT;
+		if (i > 31)
+			return -EINVAL;
+
+		flags = RATE_INFO_FLAGS_MCS;
+		if (gi)
+			flags |= RATE_INFO_FLAGS_SHORT_GI;
+		break;
+	case MT_PHY_TYPE_VHT:
+		status->nss = nss;
+		status->encoding = RX_ENC_VHT;
+		if (i > 9)
+			return -EINVAL;
+
+		flags = RATE_INFO_FLAGS_VHT_MCS;
+		if (gi)
+			flags |= RATE_INFO_FLAGS_SHORT_GI;
+		break;
+	case MT_PHY_TYPE_HE_MU:
+		status->flag |= RX_FLAG_RADIOTAP_HE_MU;
+		fallthrough;
+	case MT_PHY_TYPE_HE_SU:
+	case MT_PHY_TYPE_HE_EXT_SU:
+	case MT_PHY_TYPE_HE_TB:
+		status->nss = nss;
+		status->encoding = RX_ENC_HE;
+		status->flag |= RX_FLAG_RADIOTAP_HE;
+		i &= GENMASK(3, 0);
+
+		if (gi <= NL80211_RATE_INFO_HE_GI_3_2)
+			status->he_gi = gi;
+
+		status->he_dcm = dcm;
+		flags |= RATE_INFO_FLAGS_HE_MCS;
+		break;
+	default:
+		return -EINVAL;
+	}
+	status->rate_idx = i;
+
+	switch (bw) {
+	case IEEE80211_STA_RX_BW_20:
+		break;
+	case IEEE80211_STA_RX_BW_40:
+		if (mode & MT_PHY_TYPE_HE_EXT_SU &&
+		    (idx & MT_PRXV_TX_ER_SU_106T)) {
+			status->bw = RATE_INFO_BW_HE_RU;
+			status->he_ru =
+				NL80211_RATE_INFO_HE_RU_ALLOC_106;
+		} else {
+			status->bw = RATE_INFO_BW_40;
+		}
+		break;
+	case IEEE80211_STA_RX_BW_80:
+		status->bw = RATE_INFO_BW_80;
+		break;
+	case IEEE80211_STA_RX_BW_160:
+		status->bw = RATE_INFO_BW_160;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	status->enc_flags |= RX_ENC_FLAG_STBC_MASK * stbc;
+	if (mode < MT_PHY_TYPE_HE_SU && gi)
+		status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
+
+	return 0;
+}
+
 static int
 mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 {
@@ -541,7 +654,8 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 
 	/* RXD Group 3 - P-RXV */
 	if (rxd1 & MT_RXD1_NORMAL_GROUP_3) {
-		u32 v0, v1, v2;
+		u32 v0, v1;
+		int ret;
 
 		rxv = rxd;
 		rxd += 2;
@@ -550,7 +664,6 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 
 		v0 = le32_to_cpu(rxv[0]);
 		v1 = le32_to_cpu(rxv[1]);
-		v2 = le32_to_cpu(rxv[2]);
 
 		if (v0 & MT_PRXV_HT_AD_CODE)
 			status->enc_flags |= RX_ENC_FLAG_LDPC;
@@ -572,85 +685,17 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 
 		/* RXD Group 5 - C-RXV */
 		if (rxd1 & MT_RXD1_NORMAL_GROUP_5) {
-			u8 stbc = FIELD_GET(MT_CRXV_HT_STBC, v2);
-			u8 gi = FIELD_GET(MT_CRXV_HT_SHORT_GI, v2);
-			bool cck = false;
-
 			rxd += 18;
 			if ((u8 *)rxd - skb->data >= skb->len)
 				return -EINVAL;
+		}
 
-			idx = i = FIELD_GET(MT_PRXV_TX_RATE, v0);
-			mode = FIELD_GET(MT_CRXV_TX_MODE, v2);
-
-			switch (mode) {
-			case MT_PHY_TYPE_CCK:
-				cck = true;
-				fallthrough;
-			case MT_PHY_TYPE_OFDM:
-				i = mt76_get_rate(&dev->mt76, sband, i, cck);
-				break;
-			case MT_PHY_TYPE_HT_GF:
-			case MT_PHY_TYPE_HT:
-				status->encoding = RX_ENC_HT;
-				if (i > 31)
-					return -EINVAL;
-				break;
-			case MT_PHY_TYPE_VHT:
-				status->nss =
-					FIELD_GET(MT_PRXV_NSTS, v0) + 1;
-				status->encoding = RX_ENC_VHT;
-				if (i > 9)
-					return -EINVAL;
-				break;
-			case MT_PHY_TYPE_HE_MU:
-				status->flag |= RX_FLAG_RADIOTAP_HE_MU;
-				fallthrough;
-			case MT_PHY_TYPE_HE_SU:
-			case MT_PHY_TYPE_HE_EXT_SU:
-			case MT_PHY_TYPE_HE_TB:
-				status->nss =
-					FIELD_GET(MT_PRXV_NSTS, v0) + 1;
-				status->encoding = RX_ENC_HE;
-				status->flag |= RX_FLAG_RADIOTAP_HE;
-				i &= GENMASK(3, 0);
-
-				if (gi <= NL80211_RATE_INFO_HE_GI_3_2)
-					status->he_gi = gi;
-
-				status->he_dcm = !!(idx & MT_PRXV_TX_DCM);
-				break;
-			default:
-				return -EINVAL;
-			}
-			status->rate_idx = i;
-
-			switch (FIELD_GET(MT_CRXV_FRAME_MODE, v2)) {
-			case IEEE80211_STA_RX_BW_20:
-				break;
-			case IEEE80211_STA_RX_BW_40:
-				if (mode & MT_PHY_TYPE_HE_EXT_SU &&
-				    (idx & MT_PRXV_TX_ER_SU_106T)) {
-					status->bw = RATE_INFO_BW_HE_RU;
-					status->he_ru =
-						NL80211_RATE_INFO_HE_RU_ALLOC_106;
-				} else {
-					status->bw = RATE_INFO_BW_40;
-				}
-				break;
-			case IEEE80211_STA_RX_BW_80:
-				status->bw = RATE_INFO_BW_80;
-				break;
-			case IEEE80211_STA_RX_BW_160:
-				status->bw = RATE_INFO_BW_160;
-				break;
-			default:
-				return -EINVAL;
-			}
-
-			status->enc_flags |= RX_ENC_FLAG_STBC_MASK * stbc;
-			if (mode < MT_PHY_TYPE_HE_SU && gi)
-				status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
+		if (!is_mt7915(&dev->mt76) ||
+		    (is_mt7915(&dev->mt76) &&
+		     (rxd1 & MT_RXD1_NORMAL_GROUP_5))) {
+			ret = mt7915_mac_fill_rx_rate(dev, status, sband, rxv);
+			if (ret < 0)
+				return ret;
 		}
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 4504ebc..d79f0a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -125,6 +125,12 @@ enum rx_pkt_type {
 #define MT_PRXV_RCPI2			GENMASK(23, 16)
 #define MT_PRXV_RCPI1			GENMASK(15, 8)
 #define MT_PRXV_RCPI0			GENMASK(7, 0)
+#define MT_PRXV_HT_SHORT_GI		GENMASK(16, 15)
+#define MT_PRXV_HT_STBC			GENMASK(23, 22)
+#define MT_PRXV_TX_MODE			GENMASK(27, 24)
+#define MT_PRXV_FRAME_MODE		GENMASK(14, 12)
+#define MT_PRXV_DCM			BIT(17)
+#define MT_PRXV_NUM_RX			BIT(20, 18)
 
 /* C-RXV */
 #define MT_CRXV_HT_STBC			GENMASK(1, 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 057ab27..0650140 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -969,11 +969,14 @@ static void mt7915_sta_statistics(struct ieee80211_hw *hw,
 	struct mt7915_phy *phy = mt7915_hw_phy(hw);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct rate_info *txrate = &msta->wcid.rate;
-	struct rate_info rxrate = {};
 
-	if (!mt7915_mcu_get_rx_rate(phy, vif, sta, &rxrate)) {
-		sinfo->rxrate = rxrate;
-		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_BITRATE);
+	if (is_mt7915(&phy->dev->mt76)) {
+		struct rate_info rxrate = {};
+
+		if (!mt7915_mcu_get_rx_rate(phy, vif, sta, &rxrate)) {
+			sinfo->rxrate = rxrate;
+			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_RX_BITRATE);
+		}
 	}
 
 	if (!txrate->legacy && !txrate->flags)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
