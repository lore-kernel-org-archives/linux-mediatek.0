Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66430C4451B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SCLhNCoAB2PalqKjb5jY9rfLDLC28fnCEChZsD820lc=; b=wl1WBH9NuGUgsVhkct1QpkHVdw
	m68wgU8l690mNV76LBydGPBgosND2wQ+ogqJHCbB398+rk++4xHJP2EBXVHzFgU9ErINRVIVFahu0
	ULihCEDv7yM9JP+F1siTZqlQykcCiNY+pnOijS2r/qkfHG20c4xlfjAoWUiDKSlOmn5Abj5YfFzom
	P/7/R3YvVLNY45czQBxb6xm0P6gHg1/opkJhrZ8DMfVyuGWwN4VjBraor4SdEIHoHiSyciG/6ysQt
	oyxjoMTVxp9IHSlb4Z6urOlzlYGxnRKNkFMWd3S2mHLlMF3R5uiZRLweh9BX3zxE7upysqHX2CC4X
	T8mEr6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljsc-00000006GKd-3PLY;
	Mon, 20 Jul 2026 09:01:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljsa-00000006GKB-0e7Y
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 09:01:41 +0000
X-UUID: 9b0f0bb4841911f1acbe4559397dec65-20260720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SCLhNCoAB2PalqKjb5jY9rfLDLC28fnCEChZsD820lc=;
	b=Z1ihBfMARzsWS32r77iXGImS+JK8ieyuJB9IJ3JZWid5YP11KIAOihegTroH8CLWemAXeg2SRK7//Wgw9eyulF9ZI/L+6bIQEx+0c5UWGCx+MOo4/p1ahg1Y7GallZTU//osiERpfO7zGoo6gA9c7pujv43V7UApnKbc5QXuiU4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:71495c58-257d-47f7-9734-e9b304086a07,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:5fa97a3f-46cf-453a-bd84-ad9fc7cb0e8c,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9b0f0bb4841911f1acbe4559397dec65-20260720
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1262020273; Mon, 20 Jul 2026 02:01:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 20 Jul 2026 17:01:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 20 Jul 2026 17:01:31 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
	<shayne.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Subject: [PATCH mt76 v2] wifi: mt76: fix handling channel context with different bands in mt76_switch_vif_chanctx()
Date: Mon, 20 Jul 2026 17:01:02 +0800
Message-ID: <20260720090102.190729-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_020140_215553_CE1BA094 
X-CRM114-Status: GOOD (  14.97  )
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

When performing channel switches on different radios within a short
timeframe, channel contexts with different bands can be carried for
each struct ieee80211_vif_chanctx_switch.

Rework mt76_switch_vif_chanctx() to properly handle this scenario.

Fixes: 82334623af0c ("wifi: mt76: add chanctx functions for multi-channel phy support")
Co-developed-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2:
  - prevent from doing duplicated works if need_update[band] is marked
---
 drivers/net/wireless/mediatek/mt76/channel.c | 92 +++++++++++---------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 6edcb3b8f279..28ad7bcaffd4 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -186,68 +186,74 @@ int mt76_switch_vif_chanctx(struct ieee80211_hw *hw,
 			    int n_vifs,
 			    enum ieee80211_chanctx_switch_mode mode)
 {
-	struct mt76_chanctx *old_ctx = (struct mt76_chanctx *)vifs->old_ctx->drv_priv;
-	struct mt76_chanctx *new_ctx = (struct mt76_chanctx *)vifs->new_ctx->drv_priv;
-	struct ieee80211_chanctx_conf *conf = vifs->new_ctx;
-	struct mt76_phy *old_phy = old_ctx->phy;
-	struct mt76_phy *phy = hw->priv;
+	struct ieee80211_vif_chanctx_switch *v;
+	struct mt76_chanctx *old_ctx, *new_ctx;
+	struct mt76_phy *old_phy, *phy = hw->priv;
 	struct mt76_dev *dev = phy->dev;
 	struct mt76_vif_link *mlink;
-	bool update_chan;
+	bool need_update[__MT_MAX_BAND] = {};
 	int i, ret = 0;
 
-	if (mode == CHANCTX_SWMODE_SWAP_CONTEXTS)
-		phy = new_ctx->phy = dev->band_phys[conf->def.chan->band];
-	else
-		phy = new_ctx->phy;
-	if (!phy)
-		return -EINVAL;
+	for (i = 0; i < n_vifs; i++) {
+		v = &vifs[i];
+		new_ctx = (struct mt76_chanctx *)v->new_ctx->drv_priv;
+		if (mode == CHANCTX_SWMODE_SWAP_CONTEXTS)
+			phy = new_ctx->phy = dev->band_phys[v->new_ctx->def.chan->band];
+		else
+			phy = new_ctx->phy;
 
-	update_chan = phy->chanctx != new_ctx;
-	if (update_chan) {
-		if (dev->scan.phy == phy)
-			mt76_abort_scan(dev);
+		if (!phy)
+			return -EINVAL;
 
-		cancel_delayed_work_sync(&phy->mac_work);
+		if (need_update[phy->band_idx])
+			continue;
+
+		if (phy->chanctx != new_ctx) {
+			if (dev->scan.phy == phy)
+				mt76_abort_scan(dev);
+
+			cancel_delayed_work_sync(&phy->mac_work);
+			need_update[phy->band_idx] = true;
+		}
 	}
 
 	mutex_lock(&dev->mutex);
 
-	if (mode == CHANCTX_SWMODE_SWAP_CONTEXTS &&
-	    phy != old_phy && old_phy->chanctx == old_ctx)
-		old_phy->chanctx = NULL;
+	for (i = 0; i < n_vifs; i++) {
+		v = &vifs[i];
+		old_ctx = (struct mt76_chanctx *)v->old_ctx->drv_priv;
+		old_phy = old_ctx->phy;
+
+		new_ctx = (struct mt76_chanctx *)v->new_ctx->drv_priv;
+		phy = new_ctx->phy;
 
-	if (update_chan)
-		ret = mt76_phy_update_channel(phy, vifs->new_ctx);
+		if (mode == CHANCTX_SWMODE_SWAP_CONTEXTS && old_phy->chanctx &&
+		    old_phy->chanctx == old_ctx && phy != old_phy)
+			old_phy->chanctx = NULL;
 
-	if (ret)
-		goto out;
+		if (need_update[phy->band_idx]) {
+			ret = mt76_phy_update_channel(phy, v->new_ctx);
+			if (ret)
+				goto out;
 
-	if (old_phy == phy)
-		goto skip_link_replace;
+			need_update[phy->band_idx] = false;
+		}
 
-	for (i = 0; i < n_vifs; i++) {
-		mlink = mt76_vif_conf_link(dev, vifs[i].vif, vifs[i].link_conf);
+		mlink = mt76_vif_conf_link(dev, v->vif, v->link_conf);
 		if (!mlink)
 			continue;
 
-		dev->drv->vif_link_remove(old_phy, vifs[i].vif,
-					  vifs[i].link_conf, mlink);
-
-		ret = dev->drv->vif_link_add(phy, vifs[i].vif,
-					     vifs[i].link_conf, mlink);
-		if (ret)
-			goto out;
-
-	}
+		if (old_phy != phy) {
+			dev->drv->vif_link_remove(old_phy, v->vif, v->link_conf,
+						  mlink);
 
-skip_link_replace:
-	for (i = 0; i < n_vifs; i++) {
-		mlink = mt76_vif_conf_link(dev, vifs[i].vif, vifs[i].link_conf);
-		if (!mlink)
-			continue;
+			ret = dev->drv->vif_link_add(phy, v->vif, v->link_conf,
+						     mlink);
+			if (ret)
+				goto out;
+		}
 
-		mlink->ctx = vifs->new_ctx;
+		mlink->ctx = v->new_ctx;
 		if (mlink->beacon_mon_interval)
 			WRITE_ONCE(mlink->beacon_mon_last, jiffies);
 	}
-- 
2.51.0


