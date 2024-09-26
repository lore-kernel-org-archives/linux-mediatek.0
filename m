Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F36CCFA16
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 03:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqGshFT5iI8Rk+fOPScnbzH5Ek6qRUOHtrN6DP1SjRI=; b=sObmNSrdULAMAiHKqNOztmeJol
	vTY2TOEJIcqJQrO/5jWy7WVzX0R0CLLZHc1m7DJndS6LCVRQsSy6dbkEYGrREOgoWgnvcC+qwrLUM
	NZfEBgxxt0OxETgZ1EAFSNBhfbWqP8wGWum1WlRIzuyuQA3BUVOWiLBb4i7mdC2V4c24oBJqcnPd0
	9ccZpHnNZ7eawk4yTOC2ZuH/D4X6wRapgFRnQFsRwUj44q5sP4SG35q1UPt/A7HozmL5azqeBxicD
	sYV5VguWaDF9BCsAfskcNNXcurOhNHXWwnl9b9dEYKSkCyoApaf7W9Yf9BQsDoqP1M8XT64NUFoIe
	1zFTaIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stfBE-0000000753s-39Zp;
	Thu, 26 Sep 2024 03:28:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stf9B-000000074pn-1hVj
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 03:26:31 +0000
X-UUID: 1c3e5e5a7bb711efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eqGshFT5iI8Rk+fOPScnbzH5Ek6qRUOHtrN6DP1SjRI=;
	b=YcFHXCmxBNqTgIWdyhHbC4VTPs6X6zWHKhA3jTQQ3ZOmF9ZPdCZy71nvP5Fg0x3bp3mtFBd1xfWA281Ue3X61UISz/NlS2iSqvGv4A72RxiibWmJhbyUVIEsJ8UWqEWpyNgp4M+BM563TaWccSmIasOeW3HjM75rUvLgrmWOjX0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:68b97554-eec8-456a-a34f-b5794927386b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:5143949e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1c3e5e5a7bb711efba0aef63c0775dbf-20240925
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1788581399; Wed, 25 Sep 2024 20:26:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 11:26:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 11:26:22 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Daniel Golle <daniel@makrotopia.org>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>, Shayne Chen
	<shayne.chen@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt7996: set correct background radar capability
Date: Thu, 26 Sep 2024 11:24:40 +0800
Message-ID: <20240926032440.15978-3-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240926032440.15978-1-shayne.chen@mediatek.com>
References: <20240926032440.15978-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.116100-8.000000
X-TMASE-MatchedRID: 1K2u6wLO8jxzDgxKJu7ruq8Gc8+Dx8axMZm0+sEE9mv/mpvOG+QCxGb6
	PphVtfZg7s3FANKtoAXOzH/JrlZNlcxznKow5+zWDko+EYiDQxHt/okBLaEo+C8zQZ2rR/OpekW
	kqRyavwA0RbGKWWKZ/ytyYiRIXYR5kfRhdidsajMURSScn+QSXt0H8LFZNFG73Yq8RVaZivWfoO
	av9/8yfIAmy5FzUCe5Vx5l5w4sRKZTieVsOVPxtik7tuAJpoIR
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.116100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F91A5A24B90A6B49EFCBEFE254C9857A1297136349B04441A0DB4C4747C6FB0E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_202629_493542_A20DA76A 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Some of the variants do not support background radar, so add a helper
to report background radar capability.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  |  7 ++++---
 .../wireless/mediatek/mt76/mt7996/mt7996.h    | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index bf70799b4bc4..f6a010b61a8a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -390,9 +390,10 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_MU_MIMO_AIR_SNIFFER);
 
-	if (!mdev->dev->of_node ||
-	    !of_property_read_bool(mdev->dev->of_node,
-				   "mediatek,disable-radar-background"))
+	if (mt7996_has_background_radar(phy->dev) &&
+	    (!mdev->dev->of_node ||
+	     !of_property_read_bool(mdev->dev->of_node,
+				    "mediatek,disable-radar-background")))
 		wiphy_ext_feature_set(wiphy,
 				      NL80211_EXT_FEATURE_RADAR_BACKGROUND);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 3f3278f43c79..9aec97dd81d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -447,6 +447,25 @@ mt7996_band_valid(struct mt7996_dev *dev, u8 band)
 	return band <= MT_BAND2;
 }
 
+static inline bool
+mt7996_has_background_radar(struct mt7996_dev *dev)
+{
+	switch (mt76_chip(&dev->mt76)) {
+	case 0x7990:
+		if (dev->var.type == MT7996_VAR_TYPE_233)
+			return false;
+		break;
+	case 0x7992:
+		if (dev->var.type == MT7992_VAR_TYPE_23)
+			return false;
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
 extern const struct ieee80211_ops mt7996_ops;
 extern struct pci_driver mt7996_pci_driver;
 extern struct pci_driver mt7996_hif_driver;
-- 
2.39.2


