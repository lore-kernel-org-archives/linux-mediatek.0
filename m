Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2386C6FA99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 21:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X3tu9DRcqh2D0cLK4oVHDUYxyUjFp+xzMsztOpi7iOA=; b=OlMd0AUauV8WqETGKzpgb0ewup
	V8Ove+/v6hItmvKztsz2uMnO3dTNXLU/Zge8C3JoCd+bpAzHN2KSUfBPRIDMlNLgk1JEhk01MnY6r
	N3Aato3L6XLaUCh8SJ+N1WlYh7CDS3uKm56xaiwFUV7RF36CPY43sQ0gwNDty1KnWdYuR6Y7ilhUU
	aspUcPvPNv4JUbQuigcgsv1/XsMlPUNcVr7+gyBCxNwR/xsrri+RBwr7l3CPGlV9aQNKtd5LP+so0
	AIGlFo7pUy2Q7t2lUGQduMY8it05aPSz8E6fU5J2cfV5PlpIXuwvy1skVIqDDVnU9FASFG5whEGBH
	Q6Gkt++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfDC-002XmJ-PK; Tue, 07 Mar 2023 21:51:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfD9-002Xln-WA
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 21:51:09 +0000
X-UUID: 27b0cc18bd3211eda08d4d6090ec5a5c-20230307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=X3tu9DRcqh2D0cLK4oVHDUYxyUjFp+xzMsztOpi7iOA=;
	b=UxMTx1J+9on9VgSoz2vq2n0IVN1PR/qp8inaKrBFmiN6ML5VxNrXWX0qDDRJgAVHex/BiRoehIPXoxm5PXi9TAlwG/KSyJ6MBDLcWv1hbqb8tNNp9kmv8nmEhWW8hx8uKGkqNTkQFSAW7mhgXuMRvJkzrMdsXndY64yZl1iZM80=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:2e9e3e75-4a31-4bf2-a8eb-01a2bef8e947,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:711611f5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 27b0cc18bd3211eda08d4d6090ec5a5c-20230307
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2030865357; Tue, 07 Mar 2023 14:51:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 8 Mar 2023 05:51:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 8 Mar 2023 05:51:00 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] wifi: mt76: mt7921: enable p2p support
Date: Wed, 8 Mar 2023 05:50:59 +0800
Message-ID: <acf73d3e8cb5ad91c9144d63959e84f007f9e336.1678222117.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_135108_224033_64134CA1 
X-CRM114-Status: GOOD (  16.98  )
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

From: Sean Wang <sean.wang@mediatek.com>

Introduce p2p-go/p2p-client support to mt7921 driver

CONNECTION_P2P_GC/GO is not supported with the current firmware
so we added mt76_dev to mt76_connac_mcu_sta_basic_tlv signature to
use CONNECTION_INFRA_STA/AP instead for p2p-client and p2p-go
respectively to make it work.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: fix the build error with mt7996
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c      |  3 ++-
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c |  8 ++++----
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c      |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7921/init.c     | 10 +++++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c      |  4 ++--
 6 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index eea398c79a98..195fe1094d9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -861,7 +861,8 @@ mt7615_mcu_wtbl_sta_add(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 		else
 			mvif->sta_added = true;
 	}
-	mt76_connac_mcu_sta_basic_tlv(sskb, vif, sta, enable, new_entry);
+	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, sskb, vif, sta, enable,
+				      new_entry);
 	if (enable && sta)
 		mt76_connac_mcu_sta_tlv(phy->mt76, sskb, sta, vif, 0,
 					MT76_STA_INFO_STATE_ASSOC);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index efb9bfaa187f..25b61cc469bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -363,7 +363,7 @@ void mt76_connac_mcu_bss_omac_tlv(struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_bss_omac_tlv);
 
-void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
+void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
 				   bool enable, bool newly)
@@ -394,7 +394,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
 	switch (vif->type) {
 	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_AP:
-		if (vif->p2p)
+		if (vif->p2p && !is_mt7921(dev))
 			conn_type = CONNECTION_P2P_GC;
 		else
 			conn_type = CONNECTION_INFRA_STA;
@@ -402,7 +402,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
 		basic->aid = cpu_to_le16(sta->aid);
 		break;
 	case NL80211_IFTYPE_STATION:
-		if (vif->p2p)
+		if (vif->p2p && !is_mt7921(dev))
 			conn_type = CONNECTION_P2P_GO;
 		else
 			conn_type = CONNECTION_INFRA_AP;
@@ -1029,7 +1029,7 @@ int mt76_connac_mcu_sta_cmd(struct mt76_phy *phy,
 		return PTR_ERR(skb);
 
 	if (info->sta || !info->offload_fw)
-		mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta,
+		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif, info->sta,
 					      info->enable, info->newly);
 	if (info->sta && info->enable)
 		mt76_connac_mcu_sta_tlv(phy, skb, info->sta,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 40a99e0caded..345e34cdeff3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1776,7 +1776,7 @@ mt76_connac_mcu_add_tlv(struct sk_buff *skb, int tag, int len)
 
 int mt76_connac_mcu_set_channel_domain(struct mt76_phy *phy);
 int mt76_connac_mcu_set_vif_ps(struct mt76_dev *dev, struct ieee80211_vif *vif);
-void mt76_connac_mcu_sta_basic_tlv(struct sk_buff *skb,
+void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta, bool enable,
 				   bool newly);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 16f09ead307d..f9c34eb268f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1657,8 +1657,8 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 		return PTR_ERR(skb);
 
 	/* starec basic */
-	mt76_connac_mcu_sta_basic_tlv(skb, vif, sta, enable,
-			!rcu_access_pointer(dev->mt76.wcid[msta->wcid.idx]));
+	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, skb, vif, sta, enable,
+				      !rcu_access_pointer(dev->mt76.wcid[msta->wcid.idx]));
 	if (!enable)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 80c71acfe159..124405cc50a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -32,11 +32,13 @@ static const struct ieee80211_iface_combination if_comb[] = {
 static const struct ieee80211_iface_limit if_limits_chanctx[] = {
 	{
 		.max = 2,
-		.types = BIT(NL80211_IFTYPE_STATION),
+		.types = BIT(NL80211_IFTYPE_STATION) |
+			 BIT(NL80211_IFTYPE_P2P_CLIENT)
 	},
 	{
 		.max = 1,
-		.types = BIT(NL80211_IFTYPE_AP),
+		.types = BIT(NL80211_IFTYPE_AP) |
+			 BIT(NL80211_IFTYPE_P2P_GO)
 	}
 };
 
@@ -100,7 +102,9 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->flags &= ~(WIPHY_FLAG_IBSS_RSN | WIPHY_FLAG_4ADDR_AP |
 			  WIPHY_FLAG_4ADDR_STATION);
 	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
-				 BIT(NL80211_IFTYPE_AP);
+				 BIT(NL80211_IFTYPE_AP) |
+				 BIT(NL80211_IFTYPE_P2P_CLIENT) |
+				 BIT(NL80211_IFTYPE_P2P_GO);
 	wiphy->max_remain_on_channel_duration = 5000;
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 8ad51cbfdbe8..eb29231f844d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1694,8 +1694,8 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		return PTR_ERR(skb);
 
 	/* starec basic */
-	mt76_connac_mcu_sta_basic_tlv(skb, vif, sta, enable,
-			!rcu_access_pointer(dev->mt76.wcid[msta->wcid.idx]));
+	mt76_connac_mcu_sta_basic_tlv(&dev->mt76, skb, vif, sta, enable,
+				      !rcu_access_pointer(dev->mt76.wcid[msta->wcid.idx]));
 	if (!enable)
 		goto out;
 
-- 
2.25.1


