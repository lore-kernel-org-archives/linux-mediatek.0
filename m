Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5A8C44516
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pkNNPMc+4Y/lU1Tqxe5npoC2NL+iAxIPrmi/UsZfjSo=; b=SRZcxQ/JZsgAa4ENvBx8IWXz+T
	VRkYE/J2iGeNjEyv4TtZ5T/gvJOPwnicpeVbqF+V9qAqxL2uYLYsfILpUgrt9Oa4rD9kXoJGngOwy
	lHCBC8YVUKoY6HoO3KHpMS/caeB4JSG7ZEfFu8TvibanJ07DWA7LHcF15korSQhvMMIwfXAFijnxU
	6Xp+NvDaQ9/+gxAQy7VnK2FjU8OUoffjXFUfHTUWET7W9HXqoVtl7vdQCSfpSMLa3fMxFJBYwBHqu
	K/SQxN1ZsAvOIfluP34D001+qZ9Qu4mpqumwZD4UsBYxWLLWqumkZgwhpFFYcTLjNf+3jgDlaYOjR
	qDkMiRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgEh-0000000248W-02vk;
	Fri, 17 Jul 2026 10:56:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgEd-0000000240x-3AFE
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 10:56:05 +0000
X-UUID: 15af5e3a81ce11f1acbe4559397dec65-20260717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pkNNPMc+4Y/lU1Tqxe5npoC2NL+iAxIPrmi/UsZfjSo=;
	b=M5vN/rBiIkC5EzRrLaCRvgmT1T96atFqks3vMFppCQfJ5HdBdHALV3fY7dxPRDKaFjha7SdKyktgj29MwpPrXrG3o+X8VkevSrgmi2tMQBAE/HY9VXXvoX11MKTx+hwxG68JYS/3zUqEvejwTWtXnw3ddqDV0UAIHJZCHCFbSps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:65e07ea9-da57-488a-bae6-5cf99d22c8ee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:8a735a6,CLOUDID:ce3d613f-46cf-453a-bd84-ad9fc7cb0e8c,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 15af5e3a81ce11f1acbe4559397dec65-20260717
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 67837553; Fri, 17 Jul 2026 03:55:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Jul 2026 18:55:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Jul 2026 18:55:52 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Shayne Chen
	<shayne.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Subject: [PATCH mt76] wifi: mt76: fix handling channel context with different bands in mt76_switch_vif_chanctx()
Date: Fri, 17 Jul 2026 18:54:58 +0800
Message-ID: <20260717105458.3005812-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_035603_850508_BFA5C2C4 
X-CRM114-Status: GOOD (  14.14  )
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
 drivers/net/wireless/mediatek/mt76/channel.c | 93 ++++++++++----------
 1 file changed, 48 insertions(+), 45 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index 6edcb3b8f279..37894b78fd08 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -186,68 +186,71 @@ int mt76_switch_vif_chanctx(struct ieee80211_hw *hw,
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
-
-	update_chan = phy->chanctx != new_ctx;
-	if (update_chan) {
-		if (dev->scan.phy == phy)
-			mt76_abort_scan(dev);
-
-		cancel_delayed_work_sync(&phy->mac_work);
+	for (i = 0; i < n_vifs; i++) {
+		v = &vifs[i];
+		new_ctx = (struct mt76_chanctx *)v->new_ctx->drv_priv;
+		if (mode == CHANCTX_SWMODE_SWAP_CONTEXTS)
+			phy = new_ctx->phy = dev->band_phys[v->new_ctx->def.chan->band];
+		else
+			phy = new_ctx->phy;
+
+		if (!phy)
+			return -EINVAL;
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
 
-	if (update_chan)
-		ret = mt76_phy_update_channel(phy, vifs->new_ctx);
+		new_ctx = (struct mt76_chanctx *)v->new_ctx->drv_priv;
+		phy = new_ctx->phy;
 
-	if (ret)
-		goto out;
+		if (mode == CHANCTX_SWMODE_SWAP_CONTEXTS && old_phy->chanctx &&
+		    old_phy->chanctx == old_ctx && phy != old_phy)
+			old_phy->chanctx = NULL;
 
-	if (old_phy == phy)
-		goto skip_link_replace;
+		if (need_update[phy->band_idx]) {
+			ret = mt76_phy_update_channel(phy, v->new_ctx);
+			if (ret)
+				goto out;
 
-	for (i = 0; i < n_vifs; i++) {
-		mlink = mt76_vif_conf_link(dev, vifs[i].vif, vifs[i].link_conf);
+			need_update[phy->band_idx] = false;
+		}
+
+		mlink = mt76_vif_conf_link(dev, v->vif, v->link_conf);
 		if (!mlink)
 			continue;
 
-		dev->drv->vif_link_remove(old_phy, vifs[i].vif,
-					  vifs[i].link_conf, mlink);
+		if (old_phy != phy) {
+			dev->drv->vif_link_remove(old_phy, v->vif, v->link_conf,
+						  mlink);
 
-		ret = dev->drv->vif_link_add(phy, vifs[i].vif,
-					     vifs[i].link_conf, mlink);
-		if (ret)
-			goto out;
-
-	}
-
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


