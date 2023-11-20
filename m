Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D9FC5AE5C
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OV8s5wCvnPXepXNDZfhDStlrcZJfc8V8KOxPfWMOlBQ=; b=ylpceOkvcf4Fm0Dk906wITz9Ca
	KOa4DtzqNL++8b6m4+wUo5d+7zS7dHwPI3i1RGvFCYB1USW0RhsNpzlMIkM0yENhORmkQnBk04TyD
	csbQjFV8qculI1IjBgg/OR/mXbpvD8G+KifeZnUY8p4/KZM+ZTNZ3ZHskYbSPpavU5IBr0J67bndL
	rWqa77Pb6ty1YNc6xKvvIYrqpWPwNxHXIvQV/NoMTGQERAUEs8sNejdeKn/5CDjleK7+pMvWfsvFU
	O0xEjfoNK1CUrAA1UQ9rCDy+W3FgrAH6l0hemvooKoxftizrQJkOanzB2CIPGPeqFtovCFEVu/tjl
	K4TL67AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r52Ce-00Bs7h-3C;
	Mon, 20 Nov 2023 11:12:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r52CX-00Bs5d-25
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Nov 2023 11:12:30 +0000
X-UUID: aba5630c879511ee9b7791016c24628a-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OV8s5wCvnPXepXNDZfhDStlrcZJfc8V8KOxPfWMOlBQ=;
	b=h/ZU3OKUoEC8r6eZLyQdYAmyeCBSHKtZC9r8A/Ch3aXqAhF3Vmep7p+qGHc7uvPIufyZS9woqViHJCotbT2zDQRrFzAV5SObRjYSC7DMTu0XAf+rxM8SKmGiRzPgUemE3hFII5dYVUK44TiCLwGc3HphpctLO381hPXaupyhFE4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:81024a5e-7fe6-4701-a021-314d56d6b93c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:3a84db72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aba5630c879511ee9b7791016c24628a-20231120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1137985978; Mon, 20 Nov 2023 04:12:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 19:12:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 19:12:15 +0800
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
Subject: [PATCH 3/3] wifi: mt76: mt7921: fix wrong 6Ghz power type
Date: Mon, 20 Nov 2023 19:12:12 +0800
Message-ID: <20231120111212.4478-4-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231120111212.4478-1-mingyen.hsieh@mediatek.com>
References: <20231120111212.4478-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.369800-8.000000
X-TMASE-MatchedRID: wYuucKnWdZKg1DExZSWfTbMsPmSZxbpkKx5ICGp/WtEJ3+GAlbGRqAqu
	sGnv+h2ZtYR/uNxnStF+dfwnt/TnE4UAIpgcoJ8i4pdq9sdj8LVYN1akkye0qPNhzIgXtFJVgSk
	lFxt6Wp2H28JBgchGjm9GkFdCqJAxP7LjmHZ8wWoSEYfcJF0pRf+UEb65dgmQ6T1ArrMwNVo24Y
	TX/Id5m+LzNWBegCW2wgn7iDBesS3CttcwYNipX/oJlcuVXWZJ7jyjm1f34QZJ6hNgdZiMhcGwO
	w4TdvP2jibUVL84QmPfrB7j8MNpHdTADK205/2/CrWTGf5pYzFTvu037c9oG2HPe5i7P4xgdmtR
	sRmKkASJZPT2ZDPuzPD2QfzMDLjho65UufHcDvg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.369800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BF0AABC720A9DE1C6F18CD7511A24874FD237868D08DC61C8EAE41FE2093A96B2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_031225_704717_B1476FF5 
X-CRM114-Status: GOOD (  11.81  )
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


