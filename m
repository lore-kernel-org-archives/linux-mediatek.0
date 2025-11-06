Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3C2CCFA1E
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 06:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTM5sJcnWgrKJa4d+ArLPo+006TulmyFMo7E8jCLQDk=; b=pHDZgphB++V41Sz9Z+IZTCyuh+
	z1lOwmDYmDW3jcslSC+2XQDQB3AWrsKBJjg9q3CnVQNrcytmd1/dku+6gPNBIV5C9ch/6xDRx0xxg
	GF9kSgA5h9vyIlUwWt70vdUg7Kb0r+N2XQtuJJPtJOq08/pXeT339yHJ3fAgn5436lHtCltksnrAs
	ntyk6WDuv4Q3A+33KPyVztd5crh0Vrjhy1T+kdgrUyIdHnqMRDq4ZAMJkKfOe5KQvStH8QSqTLTlh
	9kzjC0vzk7N5KHvcaISCxtZA1kE1K8cVEuQXrjdPcaOKytwv2cLqb3MwPFzv4HQ8l5HhFkqqVosky
	q9pDh4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtiF-0000000Exar-0H7f;
	Thu, 06 Nov 2025 06:43:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtiA-0000000ExVB-3XXK
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 06:43:12 +0000
X-UUID: d7ae61c6badb11f09f706fa2197c6ceb-20251105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uTM5sJcnWgrKJa4d+ArLPo+006TulmyFMo7E8jCLQDk=;
	b=e078yIsFxNSN6ZC1W68QAVsSbAFzTtTgZnGv3AR+40iwEPxwu/14KAUoxfjjpmHcNRD2bdqGJ9Qhz4hOP0K//9EvLIy7UxRzGeKHShtNQNE1kmKSw2VqczM7mrw2ghRQkDGUQz+yq23unOBTFSbDlk8TD1auXAnFJOtwbpUjhMw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3c470b27-833e-4773-b6d4-1695c8a1e444,IP:0,UR
	L:0,TC:0,Content:36,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:36
X-CID-META: VersionHash:a9d874c,CLOUDID:bbc9196b-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d7ae61c6badb11f09f706fa2197c6ceb-20251105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1789697536; Wed, 05 Nov 2025 23:43:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 14:43:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 14:43:00 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 v2 09/12] wifi: mt76: mt7996: fix MLD group index assignment
Date: Thu, 6 Nov 2025 14:42:00 +0800
Message-ID: <20251106064203.1000505-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251106064203.1000505-1-shayne.chen@mediatek.com>
References: <20251106064203.1000505-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_224310_886985_A8AC1D76 
X-CRM114-Status: GOOD (  14.15  )
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

Fix extender mode and MBSS issues caused by incorrect assignment of the
MLD group and remap indices.

Fixes: ed01c310eca9 ("wifi: mt76: mt7996: Fix mt7996_mcu_bss_mld_tlv routine")
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 58 +++++++++++++------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index ef605e81cba9..66e22f5576f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -90,9 +90,11 @@ static void mt7996_stop(struct ieee80211_hw *hw, bool suspend)
 {
 }
 
-static inline int get_free_idx(u32 mask, u8 start, u8 end)
+static inline int get_free_idx(u64 mask, u8 start, u8 end)
 {
-	return ffs(~mask & GENMASK(end, start));
+	if (~mask & GENMASK_ULL(end, start))
+		return __ffs64(~mask & GENMASK_ULL(end, start)) + 1;
+	return 0;
 }
 
 static int get_omac_idx(enum nl80211_iftype type, u64 mask)
@@ -308,12 +310,6 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	if (idx < 0)
 		return -ENOSPC;
 
-	if (!dev->mld_idx_mask) { /* first link in the group */
-		mvif->mld_group_idx = get_own_mld_idx(dev->mld_idx_mask, true);
-		mvif->mld_remap_idx = get_free_idx(dev->mld_remap_idx_mask,
-						   0, 15);
-	}
-
 	mld_idx = get_own_mld_idx(dev->mld_idx_mask, false);
 	if (mld_idx < 0)
 		return -ENOSPC;
@@ -331,10 +327,6 @@ int mt7996_vif_link_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		return ret;
 
 	dev->mt76.vif_mask |= BIT_ULL(mlink->idx);
-	if (!dev->mld_idx_mask) {
-		dev->mld_idx_mask |= BIT_ULL(mvif->mld_group_idx);
-		dev->mld_remap_idx_mask |= BIT_ULL(mvif->mld_remap_idx);
-	}
 	dev->mld_idx_mask |= BIT_ULL(link->mld_idx);
 	phy->omac_mask |= BIT_ULL(mlink->omac_idx);
 
@@ -424,11 +416,6 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	dev->mt76.vif_mask &= ~BIT_ULL(mlink->idx);
 	dev->mld_idx_mask &= ~BIT_ULL(link->mld_idx);
 	phy->omac_mask &= ~BIT_ULL(mlink->omac_idx);
-	if (!(dev->mld_idx_mask & ~BIT_ULL(mvif->mld_group_idx))) {
-		/* last link */
-		dev->mld_idx_mask &= ~BIT_ULL(mvif->mld_group_idx);
-		dev->mld_remap_idx_mask &= ~BIT_ULL(mvif->mld_remap_idx);
-	}
 
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 	if (!list_empty(&msta_link->wcid.poll_list))
@@ -2228,7 +2215,42 @@ mt7996_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			u16 old_links, u16 new_links,
 			struct ieee80211_bss_conf *old[IEEE80211_MLD_MAX_NUM_LINKS])
 {
-	return 0;
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	int ret = 0;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	if (!old_links) {
+		int idx;
+
+		idx = get_own_mld_idx(dev->mld_idx_mask, true);
+		if (idx < 0) {
+			ret = -ENOSPC;
+			goto out;
+		}
+		mvif->mld_group_idx = idx;
+		dev->mld_idx_mask |= BIT_ULL(mvif->mld_group_idx);
+
+		idx = get_free_idx(dev->mld_remap_idx_mask, 0, 15) - 1;
+		if (idx < 0) {
+			ret = -ENOSPC;
+			goto out;
+		}
+		mvif->mld_remap_idx = idx;
+		dev->mld_remap_idx_mask |= BIT_ULL(mvif->mld_remap_idx);
+	}
+
+	if (new_links)
+		goto out;
+
+	dev->mld_idx_mask &= ~BIT_ULL(mvif->mld_group_idx);
+	dev->mld_remap_idx_mask &= ~BIT_ULL(mvif->mld_remap_idx);
+
+out:
+	mutex_unlock(&dev->mt76.mutex);
+
+	return ret;
 }
 
 static void
-- 
2.51.0


