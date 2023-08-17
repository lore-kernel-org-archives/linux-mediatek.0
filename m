Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C1DC2FC1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rD3xJ0P94qLm1F151Mrvluh9HiJKqb72Cl07WlFf+b0=; b=f4DA1uiHaRBDB4pv4e2AEITzm8
	YrBC/R6bUWcC+BOUa8AZbtzqsfkG9p2W6Z7sp1HJ4DySgi8iD2Xa8UbLyU8k7slwlMbZK4XREE2IK
	tWa18MUKauMLMww/SuhLcgudd5pM1piyxQ9RYdrChpTTXd90kFA5F7KhV5uhyxMU02yJRSiikS1Xt
	XdqGtQ++cmxHU/wTgZecUjK4BpO6flESAngo1EExydDR4lubr8gZZ5OTVjWH4OsCBc/QZ756YVq6y
	uJpZEIQeh85OVFD9FlqYG+pcYrEm4pg1T6Qb7qh7aJQzDWIzA7z17mhudRQbeWSyeczqWOmBelM0a
	MmjXE+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxd-005mLR-1A;
	Thu, 17 Aug 2023 08:02:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxW-005mHa-2h
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 08:02:25 +0000
X-UUID: 60b26e963cd411ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rD3xJ0P94qLm1F151Mrvluh9HiJKqb72Cl07WlFf+b0=;
	b=TU+/1o5rzKYJsWvxmjVFxs7RLFMpfHhbhTh/yUh9Ty79jQUuoEdXPnh0szDuThOstCrRbD2blYMVrVVyiYqvg1/PEic5UxW2IDyozNlls81mZ78GMsyPqcv82kkZNEhYhjE/3eYlxYBNv3dK5hVRrZpEwIF6MAJ9zu4wXq0QOwM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:fbda9573-fcb9-4657-b478-1ce3318e86ff,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:fbda9573-fcb9-4657-b478-1ce3318e86ff,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:e0a7a1ee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:230817160217SELY2P76,BulkQuantity:0,Recheck:0,SF:19|48|29|28|17,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 60b26e963cd411ee83ed1395ce914268-20230817
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1980001794; Thu, 17 Aug 2023 01:02:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 16:02:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 16:02:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 8/9] wifi: mt76: mt7996: support more options for mt7996_set_bitrate_mask()
Date: Thu, 17 Aug 2023 16:01:53 +0800
Message-ID: <20230817080154.16475-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817080154.16475-1-shayne.chen@mediatek.com>
References: <20230817080154.16475-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_010222_877982_FE393095 
X-CRM114-Status: GOOD (  17.49  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

Add support to configure parameters at runtime, such as mcs, gi, and
he_ltf. Note that EHT mode does not support this feature yet.

Co-developed-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 135 +++++++++++++++++-
 1 file changed, 133 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index b0e6f51041fd..3b56b90bb956 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1624,6 +1624,132 @@ int mt7996_mcu_set_fixed_rate_ctrl(struct mt7996_dev *dev,
 				     MCU_WM_UNI_CMD(RA), true);
 }
 
+static int
+mt7996_mcu_set_fixed_field(struct mt7996_dev *dev, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta, void *data, u32 field)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct sta_phy *phy = data;
+	struct sta_rec_ra_fixed *ra;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+
+	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mvif->mt76,
+					      &msta->wcid,
+					      MT7996_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_RA_UPDATE, sizeof(*ra));
+	ra = (struct sta_rec_ra_fixed *)tlv;
+
+	switch (field) {
+	case RATE_PARAM_AUTO:
+		break;
+	case RATE_PARAM_FIXED:
+	case RATE_PARAM_FIXED_MCS:
+	case RATE_PARAM_FIXED_GI:
+	case RATE_PARAM_FIXED_HE_LTF:
+		if (phy)
+			ra->phy = *phy;
+		break;
+	default:
+		break;
+	}
+	ra->field = cpu_to_le32(field);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
+}
+
+static int
+mt7996_mcu_add_rate_ctrl_fixed(struct mt7996_dev *dev, struct ieee80211_vif *vif,
+			       struct ieee80211_sta *sta)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct cfg80211_chan_def *chandef = &mvif->phy->mt76->chandef;
+	struct cfg80211_bitrate_mask *mask = &mvif->bitrate_mask;
+	enum nl80211_band band = chandef->chan->band;
+	struct sta_phy phy = {};
+	int ret, nrates = 0;
+
+#define __sta_phy_bitrate_mask_check(_mcs, _gi, _ht, _he)			\
+	do {									\
+		u8 i, gi = mask->control[band]._gi;				\
+		gi = (_he) ? gi : gi == NL80211_TXRATE_FORCE_SGI;		\
+		phy.sgi = gi;							\
+		phy.he_ltf = mask->control[band].he_ltf;			\
+		for (i = 0; i < ARRAY_SIZE(mask->control[band]._mcs); i++) {	\
+			if (!mask->control[band]._mcs[i])			\
+				continue;					\
+			nrates += hweight16(mask->control[band]._mcs[i]);	\
+			phy.mcs = ffs(mask->control[band]._mcs[i]) - 1;		\
+			if (_ht)						\
+				phy.mcs += 8 * i;				\
+		}								\
+	} while (0)
+
+	if (sta->deflink.he_cap.has_he) {
+		__sta_phy_bitrate_mask_check(he_mcs, he_gi, 0, 1);
+	} else if (sta->deflink.vht_cap.vht_supported) {
+		__sta_phy_bitrate_mask_check(vht_mcs, gi, 0, 0);
+	} else if (sta->deflink.ht_cap.ht_supported) {
+		__sta_phy_bitrate_mask_check(ht_mcs, gi, 1, 0);
+	} else {
+		nrates = hweight32(mask->control[band].legacy);
+		phy.mcs = ffs(mask->control[band].legacy) - 1;
+	}
+#undef __sta_phy_bitrate_mask_check
+
+	/* fall back to auto rate control */
+	if (mask->control[band].gi == NL80211_TXRATE_DEFAULT_GI &&
+	    mask->control[band].he_gi == GENMASK(7, 0) &&
+	    mask->control[band].he_ltf == GENMASK(7, 0) &&
+	    nrates != 1)
+		return 0;
+
+	/* fixed single rate */
+	if (nrates == 1) {
+		ret = mt7996_mcu_set_fixed_field(dev, vif, sta, &phy,
+						 RATE_PARAM_FIXED_MCS);
+		if (ret)
+			return ret;
+	}
+
+	/* fixed GI */
+	if (mask->control[band].gi != NL80211_TXRATE_DEFAULT_GI ||
+	    mask->control[band].he_gi != GENMASK(7, 0)) {
+		struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+		u32 addr;
+
+		/* firmware updates only TXCMD but doesn't take WTBL into
+		 * account, so driver should update here to reflect the
+		 * actual txrate hardware sends out.
+		 */
+		addr = mt7996_mac_wtbl_lmac_addr(dev, msta->wcid.idx, 7);
+		if (sta->deflink.he_cap.has_he)
+			mt76_rmw_field(dev, addr, GENMASK(31, 24), phy.sgi);
+		else
+			mt76_rmw_field(dev, addr, GENMASK(15, 12), phy.sgi);
+
+		ret = mt7996_mcu_set_fixed_field(dev, vif, sta, &phy,
+						 RATE_PARAM_FIXED_GI);
+		if (ret)
+			return ret;
+	}
+
+	/* fixed HE_LTF */
+	if (mask->control[band].he_ltf != GENMASK(7, 0)) {
+		ret = mt7996_mcu_set_fixed_field(dev, vif, sta, &phy,
+						 RATE_PARAM_FIXED_HE_LTF);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void
 mt7996_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb, struct mt7996_dev *dev,
 			     struct ieee80211_vif *vif, struct ieee80211_sta *sta)
@@ -1733,6 +1859,7 @@ int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	struct sk_buff *skb;
+	int ret;
 
 	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mvif->mt76,
 					      &msta->wcid,
@@ -1752,8 +1879,12 @@ int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	 */
 	mt7996_mcu_sta_rate_ctrl_tlv(skb, dev, vif, sta);
 
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
+	ret = mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				    MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
+	if (ret)
+		return ret;
+
+	return mt7996_mcu_add_rate_ctrl_fixed(dev, vif, sta);
 }
 
 static int
-- 
2.39.2


