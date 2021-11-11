Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD86C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 19:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6186E61073
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 19:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6186E61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=47rItRlOvyRWSeTC9S75unum03xadPDb7v+oj5cndc4=; b=Xv/EFATAIYfLfU
	J46ufBB+5ZgeAKut4ZdgZVGeZbKaihSnvAbsKvKCbP5E9UVZdS/ymOrq2C9ZFvm6wNZunREOBNr3A
	fhyspfqHZ+tnJStc8OYt5wHweWi9CBG19MSgN5ULzr9XLUN+Rqm2yrDMmJLl85mSfWSYsPmks4+Xx
	cmmbodbO1N8eMArIlj49c6lyiZ/gE3zxZDhNiu7EUVBjdBV/gGwmjq6kCXikC0bWtQd/c1EA1/85X
	fIqDcWlWei2FEuxKDo1qvO0dcoPzTpUjPLzmNhi+DEqFyL9cHsO7bYKbvK3EufF3grPgcF8LztCYJ
	BxxAXp2C9yhjDi9TiMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlG0z-008eIO-9t; Thu, 11 Nov 2021 19:45:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlG0w-008eHg-Ie
 for linux-mediatek@lists.infradead.org; Thu, 11 Nov 2021 19:45:40 +0000
X-UUID: 6de56e4076d74587a25ad7f42fa7351a-20211111
X-UUID: 6de56e4076d74587a25ad7f42fa7351a-20211111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1662308151; Thu, 11 Nov 2021 12:45:35 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 11:45:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 12 Nov 2021 03:45:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Nov 2021 03:45:32 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>, Fang Zhao <fang.zhao@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: fix SMPS operation fail
Date: Fri, 12 Nov 2021 03:45:31 +0800
Message-ID: <71786d2c0201ca3304fd67c4a3ba9adb6c32bd2d.1636658341.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_114538_648764_7B9726DC 
X-CRM114-Status: GOOD (  11.50  )
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

TGn fails sending SM power save mode action frame to the AP to switch
from dynamic SMPS mode to static mode.

Reported-by: Fang Zhao <fang.zhao@mediatek.com>
Signed-off-by: Fang Zhao <fang.zhao@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2 - move RATE_PARAM_MMPS_UPDATE operation into mt7915_mcu_add_smps
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 66 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 2 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 3a496046fe21..72fffce3f24d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1753,33 +1753,6 @@ int mt7915_mcu_sta_update_hdr_trans(struct mt7915_dev *dev,
 				     true);
 }
 
-int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-			struct ieee80211_sta *sta)
-{
-	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
-	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-	struct wtbl_req_hdr *wtbl_hdr;
-	struct tlv *sta_wtbl;
-	struct sk_buff *skb;
-
-	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
-				       MT7915_STA_UPDATE_MAX_SIZE);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
-
-	sta_wtbl = mt7915_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
-
-	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_SET, sta_wtbl,
-					     &skb);
-	if (IS_ERR(wtbl_hdr))
-		return PTR_ERR(wtbl_hdr);
-
-	mt7915_mcu_wtbl_smps_tlv(skb, sta, sta_wtbl, wtbl_hdr);
-
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				     MCU_EXT_CMD(STA_REC_UPDATE), true);
-}
-
 static inline bool
 mt7915_is_ebf_supported(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta, bool bfee)
@@ -2077,7 +2050,11 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 	case RATE_PARAM_FIXED_MCS:
 	case RATE_PARAM_FIXED_GI:
 	case RATE_PARAM_FIXED_HE_LTF:
-		ra->phy = *phy;
+		if (phy)
+			ra->phy = *phy;
+		break;
+	case RATE_PARAM_MMPS_UPDATE:
+		ra->mmps_mode = (sta->smps_mode == IEEE80211_SMPS_DYNAMIC);
 		break;
 	default:
 		break;
@@ -2088,6 +2065,39 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 				     MCU_EXT_CMD(STA_REC_UPDATE), true);
 }
 
+int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+			struct ieee80211_sta *sta)
+{
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct tlv *sta_wtbl;
+	struct sk_buff *skb;
+	int ret;
+
+	skb = mt7915_mcu_alloc_sta_req(dev, mvif, msta,
+				       MT7915_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	sta_wtbl = mt7915_mcu_add_tlv(skb, STA_REC_WTBL, sizeof(struct tlv));
+
+	wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_SET, sta_wtbl,
+					     &skb);
+	if (IS_ERR(wtbl_hdr))
+		return PTR_ERR(wtbl_hdr);
+
+	mt7915_mcu_wtbl_smps_tlv(skb, sta, sta_wtbl, wtbl_hdr);
+
+	ret = mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				    MCU_EXT_CMD(STA_REC_UPDATE), true);
+	if (ret)
+		return ret;
+
+	return mt7915_mcu_set_fixed_rate_ctrl(dev, vif, sta, NULL,
+					      RATE_PARAM_MMPS_UPDATE);
+}
+
 static int
 mt7915_mcu_add_rate_ctrl_fixed(struct mt7915_dev *dev,
 			       struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index e8501234f686..11728454b92c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -960,6 +960,7 @@ struct sta_rec_ra_fixed {
 
 enum {
 	RATE_PARAM_FIXED = 3,
+	RATE_PARAM_MMPS_UPDATE = 5,
 	RATE_PARAM_FIXED_HE_LTF = 7,
 	RATE_PARAM_FIXED_MCS,
 	RATE_PARAM_FIXED_GI = 11,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
