Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AE6C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2Xp1lAHYyIT6me700oQTjguNBLDujNJsw04/30XDfM=; b=inCusn7wyHPb0MKnS9dxsoc0gX
	BZvh5fa3UxHu9aADBJC/oYydhnLpHnjHh5IrqYuwINF9xgHu/2Hh5uf/eBWgrlJtwEj3AsEWX9gUN
	LZudAYiQWPa59rG6OBOSioP2Kj58y0vCNLKautiGV0wRC0cGeoowmXAkR7ztWvrXUVghEePh3GqPh
	3xewBPfAvIkhGTSKt5jo18rdqSePKJ3K8PRvw714sOqNEoFKZs1qLNMcPzoVCPhTj5gTswFhA7Qhn
	tkO3EaiNBv/xMkQIspJBprXw/UxYDfyQMHUARj1KERcuI3z2dEKshmGmjUTGfbW0b6hcMlZLtA+RQ
	PtHkgHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oujYP-005yLe-Dp; Tue, 15 Nov 2022 00:11:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oujYL-005yJt-Iz
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 00:11:51 +0000
X-UUID: 3368ec8274714e43927d6abb2269cd4d-20221114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b2Xp1lAHYyIT6me700oQTjguNBLDujNJsw04/30XDfM=;
	b=C7qmS11EHGzt308zL5W8T0z0IRVhFy8nWPqWqxyFPp3Eo5vEgQM9+a+J6e3kOnGXniecfNv77NgO2QBj8+rQI2OTcZ1UeOqofzhWHM1nMWRDFUjVbjd0KlR/gBtUbx6RJq6bmQOum7Xiq6VXVCO8UpEQVyGLgGzpQrKIkhIQ/d8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f5fc539b-ceb9-47af-84c4-c3eb470ed303,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:9a10bcdd-c087-4fa8-aefb-7a0acf417f59,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3368ec8274714e43927d6abb2269cd4d-20221114
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 430895759; Mon, 14 Nov 2022 17:11:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 15 Nov 2022 08:11:29 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 15 Nov 2022 08:11:29 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Deren Wu" <deren.wu@mediatek.com>
Subject: [PATCH v4 2/2] wifi: mt76: mt7921: introduce chanctx support
Date: Tue, 15 Nov 2022 08:11:24 +0800
Message-ID: <594d531c07cc5023ccb62e4606acffd470d4db05.1668467719.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1668467719.git.objelf@gmail.com>
References: <cover.1668467719.git.objelf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_161149_664829_BDD6CF37 
X-CRM114-Status: GOOD (  22.07  )
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

The firmware can have the capability to manage the channel context
scheduling on multiple roles running on the device including Station,
AP and P2P GC/GO mode (will be extended based on the future patchset)
to help users sharing the network with others on a single device.

The firmware is able to support the channel chanctx up to 2 interface
simultaneously running on the different channels.

Another thing to be noted is that before the driver is going sent out the
management frames, the driver has to get the privilege from the firmware
to occupy the current channel context until the frame handshake is
completed and then get the privilege back to the firmware.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  33 +++++-
 .../net/wireless/mediatek/mt76/mt7921/mac.c   |   8 --
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 111 +++++++++++++++++-
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |   1 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   7 ++
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |   7 ++
 .../net/wireless/mediatek/mt76/mt7921/usb.c   |   7 ++
 7 files changed, 157 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index e9353e9929a9..79b8055ce4c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -26,6 +26,27 @@ static const struct ieee80211_iface_combination if_comb[] = {
 		.max_interfaces = MT7921_MAX_INTERFACES,
 		.num_different_channels = 1,
 		.beacon_int_infra_match = true,
+	},
+};
+
+static const struct ieee80211_iface_limit if_limits_chanctx[] = {
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_STATION),
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_AP),
+	}
+};
+
+static const struct ieee80211_iface_combination if_comb_chanctx[] = {
+	{
+		.limits = if_limits_chanctx,
+		.n_limits = ARRAY_SIZE(if_limits_chanctx),
+		.max_interfaces = 2,
+		.num_different_channels = 2,
+		.beacon_int_infra_match = false,
 	}
 };
 
@@ -66,17 +87,19 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	hw->sta_data_size = sizeof(struct mt7921_sta);
 	hw->vif_data_size = sizeof(struct mt7921_vif);
 
-	if (dev->fw_features & MT7921_FW_CAP_CNM)
+	if (dev->fw_features & MT7921_FW_CAP_CNM) {
 		wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
-	else
+		wiphy->iface_combinations = if_comb_chanctx;
+		wiphy->n_iface_combinations = ARRAY_SIZE(if_comb_chanctx);
+	} else {
 		wiphy->flags &= ~WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
-
-	wiphy->iface_combinations = if_comb;
+		wiphy->iface_combinations = if_comb;
+		wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
+	}
 	wiphy->flags &= ~(WIPHY_FLAG_IBSS_RSN | WIPHY_FLAG_4ADDR_AP |
 			  WIPHY_FLAG_4ADDR_STATION);
 	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
 				 BIT(NL80211_IFTYPE_AP);
-	wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
 	wiphy->max_remain_on_channel_duration = 5000;
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index eeab756240a2..443a4a49bc9e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -168,14 +168,6 @@ static void
 mt7921_get_status_freq_info(struct mt7921_dev *dev, struct mt76_phy *mphy,
 			    struct mt76_rx_status *status, u8 chfreq)
 {
-	if (!test_bit(MT76_HW_SCANNING, &mphy->state) &&
-	    !test_bit(MT76_HW_SCHED_SCANNING, &mphy->state) &&
-	    !test_bit(MT76_STATE_ROC, &mphy->state)) {
-		status->freq = mphy->chandef.chan->center_freq;
-		status->band = mphy->chandef.chan->band;
-		return;
-	}
-
 	if (chfreq > 180) {
 		status->band = NL80211_BAND_6GHZ;
 		chfreq = (chfreq - 181) * 4 + 1;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 012c92d49f49..41df17efdb3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -858,7 +858,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
 		mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
-					    true, NULL);
+					    true, mvif->ctx);
 
 	mt7921_mac_wtbl_update(dev, msta->wcid.idx,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
@@ -891,7 +891,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		if (!sta->tdls)
 			mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
 						    &mvif->sta.wcid, false,
-						    NULL);
+						    mvif->ctx);
 	}
 
 	spin_lock_bh(&dev->sta_poll_lock);
@@ -1645,7 +1645,7 @@ mt7921_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mt7921_mutex_acquire(dev);
 
 	err = mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid,
-					  true, NULL);
+					  true, mvif->ctx);
 	if (err)
 		goto out;
 
@@ -1677,12 +1677,108 @@ mt7921_stop_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		goto out;
 
 	mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid, false,
-				    NULL);
+				    mvif->ctx);
 
 out:
 	mt7921_mutex_release(dev);
 }
 
+static int
+mt7921_add_chanctx(struct ieee80211_hw *hw,
+		   struct ieee80211_chanctx_conf *ctx)
+{
+	return 0;
+}
+
+static void
+mt7921_remove_chanctx(struct ieee80211_hw *hw,
+		      struct ieee80211_chanctx_conf *ctx)
+{
+}
+
+static void mt7921_ctx_iter(void *priv, u8 *mac,
+			    struct ieee80211_vif *vif)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct ieee80211_chanctx_conf *ctx = priv;
+
+	if (ctx != mvif->ctx)
+		return;
+
+	mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->mt76, ctx);
+}
+
+static void
+mt7921_change_chanctx(struct ieee80211_hw *hw,
+		      struct ieee80211_chanctx_conf *ctx,
+		      u32 changed)
+{
+	struct mt7921_phy *phy = mt7921_hw_phy(hw);
+
+	mt7921_mutex_acquire(phy->dev);
+	ieee80211_iterate_active_interfaces(phy->mt76->hw,
+					    IEEE80211_IFACE_ITER_ACTIVE,
+					    mt7921_ctx_iter, ctx);
+	mt7921_mutex_release(phy->dev);
+}
+
+static int
+mt7921_assign_vif_chanctx(struct ieee80211_hw *hw,
+			  struct ieee80211_vif *vif,
+			  struct ieee80211_bss_conf *link_conf,
+			  struct ieee80211_chanctx_conf *ctx)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+
+	mutex_lock(&dev->mt76.mutex);
+	mvif->ctx = ctx;
+	mutex_unlock(&dev->mt76.mutex);
+
+	return 0;
+}
+
+static void
+mt7921_unassign_vif_chanctx(struct ieee80211_hw *hw,
+			    struct ieee80211_vif *vif,
+			    struct ieee80211_bss_conf *link_conf,
+			    struct ieee80211_chanctx_conf *ctx)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+
+	mutex_lock(&dev->mt76.mutex);
+	mvif->ctx = NULL;
+	mutex_unlock(&dev->mt76.mutex);
+}
+
+static void mt7921_mgd_prepare_tx(struct ieee80211_hw *hw,
+				  struct ieee80211_vif *vif,
+				  struct ieee80211_prep_tx_info *info)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	u16 duration = info->duration ? info->duration :
+		       jiffies_to_msecs(HZ);
+
+	mt7921_mutex_acquire(dev);
+	mt7921_set_roc(mvif->phy, mvif, mvif->ctx->def.chan, duration,
+		       MT7921_ROC_REQ_JOIN);
+	mt7921_mutex_release(dev);
+}
+
+static void mt7921_mgd_complete_tx(struct ieee80211_hw *hw,
+				   struct ieee80211_vif *vif,
+				   struct ieee80211_prep_tx_info *info)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+
+	mt7921_mutex_acquire(dev);
+	mt7921_abort_roc(mvif->phy, mvif);
+	mt7921_mutex_release(dev);
+}
+
 const struct ieee80211_ops mt7921_ops = {
 	.tx = mt7921_tx,
 	.start = mt7921_start,
@@ -1735,6 +1831,13 @@ const struct ieee80211_ops mt7921_ops = {
 	.set_sar_specs = mt7921_set_sar_specs,
 	.remain_on_channel = mt7921_remain_on_channel,
 	.cancel_remain_on_channel = mt7921_cancel_remain_on_channel,
+	.add_chanctx = mt7921_add_chanctx,
+	.remove_chanctx = mt7921_remove_chanctx,
+	.change_chanctx = mt7921_change_chanctx,
+	.assign_vif_chanctx = mt7921_assign_vif_chanctx,
+	.unassign_vif_chanctx = mt7921_unassign_vif_chanctx,
+	.mgd_prepare_tx = mt7921_mgd_prepare_tx,
+	.mgd_complete_tx = mt7921_mgd_complete_tx,
 };
 EXPORT_SYMBOL_GPL(mt7921_ops);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 4f0147e40bc3..ac70a978dbed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -171,6 +171,7 @@ struct mt7921_vif {
 	struct ewma_rssi rssi;
 
 	struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];
+	struct ieee80211_chanctx_conf *ctx;
 };
 
 struct mib_stats {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 32ad26ef3a68..28342ec940f0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -297,6 +297,13 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (!(features & MT7921_FW_CAP_CNM)) {
 		ops->remain_on_channel = NULL;
 		ops->cancel_remain_on_channel = NULL;
+		ops->add_chanctx = NULL;
+		ops->remove_chanctx = NULL;
+		ops->change_chanctx = NULL;
+		ops->assign_vif_chanctx = NULL;
+		ops->unassign_vif_chanctx = NULL;
+		ops->mgd_prepare_tx = NULL;
+		ops->mgd_complete_tx = NULL;
 	}
 
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), ops, &drv_ops);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index e07a8fb87421..8ce4252b8ae7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -140,6 +140,13 @@ static int mt7921s_probe(struct sdio_func *func,
 	if (!(features & MT7921_FW_CAP_CNM)) {
 		ops->remain_on_channel = NULL;
 		ops->cancel_remain_on_channel = NULL;
+		ops->add_chanctx = NULL;
+		ops->remove_chanctx = NULL;
+		ops->change_chanctx = NULL;
+		ops->assign_vif_chanctx = NULL;
+		ops->unassign_vif_chanctx = NULL;
+		ops->mgd_prepare_tx = NULL;
+		ops->mgd_complete_tx = NULL;
 	}
 
 	mdev = mt76_alloc_device(&func->dev, sizeof(*dev), ops, &drv_ops);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 3e4ddc6715f0..d0caf4a1b21c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -219,6 +219,13 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	if (!(features & MT7921_FW_CAP_CNM)) {
 		ops->remain_on_channel = NULL;
 		ops->cancel_remain_on_channel = NULL;
+		ops->add_chanctx = NULL;
+		ops->remove_chanctx = NULL;
+		ops->change_chanctx = NULL;
+		ops->assign_vif_chanctx = NULL;
+		ops->unassign_vif_chanctx = NULL;
+		ops->mgd_prepare_tx = NULL;
+		ops->mgd_complete_tx = NULL;
 	}
 
 	ops->stop = mt7921u_stop;
-- 
2.25.1


