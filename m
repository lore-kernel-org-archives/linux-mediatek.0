Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D07C77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 20:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+jYxlWLKP+6cT0NR0s1TTYwo0qhKGAmS2naxZhwJ+I=; b=G6ZDF/I1K/UAs89hZrGs9Lg/NN
	IIna/Ieekr97cYrFmZVJAT/VSqo9Vc3TLvC39g88RyjidifjZAk1WMcuRYWj/tJhafXxcqMnxIyO/
	q9QUgWVBBwVt9hEkfwxN10+cDva5j0q0R6RLmbf5VP8iDs0WSy3vuGLY0Hf8vUPWXl/D7KRqcn3as
	utDkSfirP6aeY9uueN4r4e70643oAhxzY3WcUYkzqPTexf+gygkjELCQ+KSDMmcrrs0ynWdOVSizY
	Y1wveHLGepSlEJoTvAntIWhsHj0is4N03etOpw7NBAIHBwLMtc13hEb8EYQavo6UZQSprDd/EzLjI
	jChQfI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn3Tv-0075Zd-1g;
	Thu, 13 Apr 2023 20:23:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn3Tr-0075YA-2q
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 20:23:46 +0000
X-UUID: 134da934da3911ed8687db9d93187ff1-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w+jYxlWLKP+6cT0NR0s1TTYwo0qhKGAmS2naxZhwJ+I=;
	b=MvjqyR/vejn+A6dCSon5wNbt6+at12NNMUGKLGkXd8/BfdaFE0EQOMwOkcO//RwAXLdl8LHwgPYJwWw0ITp3YOXnFp9h6uU47/ULn2vLS40Ml2H/nfuvvJ7FGM6Qm0CgXnEDD8cGriQxKg0SCDGKnvlSIjweKiHGzVOdcEJNq00=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.22,REQID:ae9553f4-5cb9-458f-a382-8d8cc3d24ec2,IP:0,U
	RL:0,TC:0,Content:32,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
	ION:quarantine,TS:127
X-CID-INFO: VERSION:1.1.22,REQID:ae9553f4-5cb9-458f-a382-8d8cc3d24ec2,IP:0,URL
	:0,TC:0,Content:32,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:127
X-CID-META: VersionHash:120426c,CLOUDID:4b8840a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:230414042339BH89FNRG,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:4,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 134da934da3911ed8687db9d93187ff1-20230413
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1963823149; Thu, 13 Apr 2023 13:23:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 14 Apr 2023 04:23:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 14 Apr 2023 04:23:36 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/5] wifi: mt76: connac: add nss calculation into mt76_connac2_mac_tx_rate_val()
Date: Fri, 14 Apr 2023 04:23:30 +0800
Message-ID: <a65dc747072bfed9004ff643c37964cc53332063.1681416097.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <f5d216bcd79cc444b7f7039dd3898e08aff70286.1681416097.git.ryder.lee@mediatek.com>
References: <f5d216bcd79cc444b7f7039dd3898e08aff70286.1681416097.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_132344_731220_30A1E197 
X-CRM114-Status: GOOD (  11.47  )
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

Take nss calculation into account since this function always wrongly
returns 0.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 43 ++++++++++++-------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 82aac0a04655..52f11a314465 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -267,11 +267,29 @@ int mt76_connac_init_tx_queues(struct mt76_phy *phy, int idx, int n_desc,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_init_tx_queues);
 
+#define __bitrate_mask_check(_mcs, _mode)				\
+({									\
+	u8 i = 0;							\
+	for (nss = 0; i < ARRAY_SIZE(mask->control[band]._mcs); i++) {	\
+		if (!mask->control[band]._mcs[i])			\
+			continue;					\
+		if (hweight16(mask->control[band]._mcs[i]) == 1) {	\
+			mode = MT_PHY_TYPE_##_mode;			\
+			rateidx = ffs(mask->control[band]._mcs[i]) - 1;	\
+			if (mode == MT_PHY_TYPE_HT)			\
+				rateidx += 8 * i;			\
+			else						\
+				nss = i + 1;				\
+			goto out;					\
+		}							\
+	}								\
+})
+
 u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
 				 struct ieee80211_vif *vif,
 				 bool beacon, bool mcast)
 {
-	u8 mode = 0, band = mphy->chandef.chan->band;
+	u8 nss = 0, mode = 0, band = mphy->chandef.chan->band;
 	int rateidx = 0, mcast_rate;
 
 	if (!vif)
@@ -286,19 +304,12 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
 		struct cfg80211_bitrate_mask *mask;
 
 		mask = &vif->bss_conf.beacon_tx_rate;
-		if (hweight16(mask->control[band].he_mcs[0]) == 1) {
-			rateidx = ffs(mask->control[band].he_mcs[0]) - 1;
-			mode = MT_PHY_TYPE_HE_SU;
-			goto out;
-		} else if (hweight16(mask->control[band].vht_mcs[0]) == 1) {
-			rateidx = ffs(mask->control[band].vht_mcs[0]) - 1;
-			mode = MT_PHY_TYPE_VHT;
-			goto out;
-		} else if (hweight8(mask->control[band].ht_mcs[0]) == 1) {
-			rateidx = ffs(mask->control[band].ht_mcs[0]) - 1;
-			mode = MT_PHY_TYPE_HT;
-			goto out;
-		} else if (hweight32(mask->control[band].legacy) == 1) {
+
+		__bitrate_mask_check(he_mcs, HE_SU);
+		__bitrate_mask_check(vht_mcs, VHT);
+		__bitrate_mask_check(ht_mcs, HT);
+
+		if (hweight32(mask->control[band].legacy) == 1) {
 			rateidx = ffs(mask->control[band].legacy) - 1;
 			goto legacy;
 		}
@@ -314,9 +325,9 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mphy,
 	rateidx = mt76_calculate_default_rate(mphy, rateidx);
 	mode = rateidx >> 8;
 	rateidx &= GENMASK(7, 0);
-
 out:
-	return FIELD_PREP(MT_TX_RATE_IDX, rateidx) |
+	return FIELD_PREP(MT_TX_RATE_NSS, nss) |
+	       FIELD_PREP(MT_TX_RATE_IDX, rateidx) |
 	       FIELD_PREP(MT_TX_RATE_MODE, mode);
 }
 EXPORT_SYMBOL_GPL(mt76_connac2_mac_tx_rate_val);
-- 
2.18.0


