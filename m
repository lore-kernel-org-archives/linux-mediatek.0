Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9C9C54FB9
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OV8s5wCvnPXepXNDZfhDStlrcZJfc8V8KOxPfWMOlBQ=; b=gchnQoptljCpddDXyheZlC1Im1
	G+TK96RRqPOjXdEFbXrlL15mJFhidsxQvqN1Jbic7r0e2MO1bgnGtoJ8WnY1NQ+dVppr3MZDoq41S
	F9stdSoyW7R9niTVIQtiKxw5iAzmu8I2bczlypdG14FUoN0yg7oRSHjBeGWbDk8Adme3jhKgKdzxY
	zM+YscEkMNDMCJU5+3vHnSgMLtfgG4XUbyZm3/jqjBU3oEyN4PDwBt/BI8Iar+vtwDiuM9ArnwQB7
	/O/jJA3dntiIDBPEKuWfmpw+pYZA9n+hL9R05LHixVIZwqZviw+OvJ8OqUo5yXzE4YdJT41lqVdyI
	m5Q8BS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r53a3-00C1y4-11;
	Mon, 20 Nov 2023 12:40:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r53ZD-00C1UM-1X
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 12:40:35 +0000
X-UUID: e4d7841487a111ee86758d4a7c00f3a0-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OV8s5wCvnPXepXNDZfhDStlrcZJfc8V8KOxPfWMOlBQ=;
	b=KLLW2sPWQeM7LfJZIVDVn85gyD6tEgj9VOLy4xiEbY4agLhx5kpT0c/Io/dDdlPLMFTStPz6UvQiE+2DDRIozSZDsSvqOU3tjLJYGnn5ayCFOcUHu9Fqf0tY05p5+RGCEuU2YupTSIBM5QKkJ2hicrgGW2AnBwuprkHO8oEAwwg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:424eab87-6482-409d-8326-1105dbd815f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:ea15bdfc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e4d7841487a111ee86758d4a7c00f3a0-20231120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2106362153; Mon, 20 Nov 2023 05:39:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 20:39:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 20:39:46 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH v3 3/3] wifi: mt76: mt7921: fix wrong 6Ghz power type
Date: Mon, 20 Nov 2023 20:39:40 +0800
Message-ID: <20231120123940.5788-4-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231120123940.5788-1-mingyen.hsieh@mediatek.com>
References: <20231120123940.5788-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_043955_654258_CF8590F0 
X-CRM114-Status: GOOD (  12.73  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

To avoid using incorrect 6g power settings after disconnection,
it should to update back to the default state when disconnected.

Fixes: 51ba0e3a15eb ("wifi: mt76: mt7921: add 6GHz power type support for clc")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 510a575a973b..0645417e0582 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -683,17 +683,45 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 }
 
 static void
-mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif)
+mt7921_calc_vif_num(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	u32 *num = priv;
+
+	if (!priv)
+		return;
+
+	switch (vif->type) {
+	case NL80211_IFTYPE_STATION:
+	case NL80211_IFTYPE_P2P_CLIENT:
+	case NL80211_IFTYPE_AP:
+	case NL80211_IFTYPE_P2P_GO:
+		*num += 1;
+		break;
+	default:
+		break;
+	}
+}
+
+static void
+mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_phy *phy = mvif->phy;
 	struct mt792x_dev *dev = phy->dev;
+	u32 valid_vif_num = 0;
+
+	ieee80211_iterate_active_interfaces(mt76_hw(dev),
+					    IEEE80211_IFACE_ITER_RESUME_ALL,
+					    mt7921_calc_vif_num, &valid_vif_num);
 
-	if (hweight64(dev->mt76.vif_mask) > 1) {
+	if (valid_vif_num > 1) {
 		phy->power_type = MT_AP_DEFAULT;
 		goto out;
 	}
 
+	if (!is_add)
+		vif->bss_conf.power_type = IEEE80211_REG_UNSET_AP;
+
 	switch (vif->bss_conf.power_type) {
 	case IEEE80211_REG_SP_AP:
 		phy->power_type = MT_AP_SP;
@@ -705,6 +733,8 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif)
 		phy->power_type = MT_AP_LPI;
 		break;
 	case IEEE80211_REG_UNSET_AP:
+		phy->power_type = MT_AP_UNSET;
+		break;
 	default:
 		phy->power_type = MT_AP_DEFAULT;
 		break;
@@ -749,7 +779,7 @@ int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (ret)
 		return ret;
 
-	mt7921_regd_set_6ghz_power_type(vif);
+	mt7921_regd_set_6ghz_power_type(vif, true);
 
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
@@ -811,6 +841,8 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		list_del_init(&msta->wcid.poll_list);
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
 
+	mt7921_regd_set_6ghz_power_type(vif, false);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 EXPORT_SYMBOL_GPL(mt7921_mac_sta_remove);
-- 
2.18.0


