Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3EAC021A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2025 08:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9fPO9d8tYshbXLSHxcUn0DWQk7YnJL564Z+u2kxwoI0=; b=kJz7Nml0AHGFvaOz92R8/tRD7M
	5uTLrcTaHb39OwJqOtAmjole923fOkoi3cHCpS6mgU896pwRUDYGvnrjQJ/3ua6UAHDro2o4qE33v
	RpsUtpFoPW0Zk8HD+Ecip48AT3B9SJnL4I5IaBR3K8E80SaMHWM6qhBtJdHexg7A3DKz+I3DrLpOs
	7oVPbvhIrJ6N4IzkBth8tSTRlHl7/S22JqqSVzrzXYwke38UuA6eT2w3GLC0btpkUt/zNy8xUGfRI
	B28QZm3XR4ul8wEen5l3y6riGKhlw+erqJVs3BXTiFU1T2cskgnPL2m1RJVj71Q854C95mDVoKJSf
	wgjoNRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwJy-00000003jcG-1etp;
	Mon, 17 Feb 2025 08:17:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwJw-00000003jbg-0BLg
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Feb 2025 08:17:41 +0000
X-UUID: a3963ec4ed0711ef83f2a1c9db70dae0-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9fPO9d8tYshbXLSHxcUn0DWQk7YnJL564Z+u2kxwoI0=;
	b=CKcLsElRYJ9hxawIgWdhOUnsWm/tR5ytxi6+mpsTZWbpvYMzz+vW6cQLkQRAImEMDJfpNK8SSr8JxNqvD6IYXCXNmuObTHzjLhN3zj84ps82ObyZuho2KYL5Ou1OL/Rc+Sc9BGrHuuNxTB1HuoHLkmWFxY8OPtvPVsUU8c1a8pk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5f66a717-58d9-4f47-97bd-1118c922200c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:2f0478fc-7800-43c5-b97b-ddbe32561a5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a3963ec4ed0711ef83f2a1c9db70dae0-20250217
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2085996108; Mon, 17 Feb 2025 01:17:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 16:17:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 16:17:31 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: introduce MLO capability control
Date: Mon, 17 Feb 2025 16:17:29 +0800
Message-ID: <20250217081729.1840930-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_001740_090021_ADBBE24D 
X-CRM114-Status: GOOD (  11.23  )
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

This patch introduces MLO capability control for the MT792x Wi-Fi driver.
It removes the unused `MT792x_CHIP_CAP_MLO_EVT_EN` flag and introduces new
capability flags `MT792x_CHIP_CAP_MLO_EN` and `MT792x_CHIP_CAP_MLO_EML_EN`
to enable MLO and EML features based on firmware capabilities.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 10 ++++++++--
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  3 ++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 98daf80ac131..ad47a4b153da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -251,7 +251,7 @@ int mt7925_init_mlo_caps(struct mt792x_phy *phy)
 		},
 	};
 
-	if (!(phy->chip_cap & MT792x_CHIP_CAP_MLO_EVT_EN))
+	if (!(phy->chip_cap & MT792x_CHIP_CAP_MLO_EN))
 		return 0;
 
 	ext_capab[0].eml_capabilities = phy->eml_cap;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 15815ad84713..5f40c3c1ffa1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2559,6 +2559,7 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	struct ieee80211_vif *vif = link_conf->vif;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
+	struct mt792x_phy *phy = mvif->phy;
 	struct bss_mld_tlv *mld;
 	struct tlv *tlv;
 	bool is_mld;
@@ -2574,8 +2575,13 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	mld->group_mld_id = is_mld ? mvif->bss_conf.mt76.idx : 0xff;
 	mld->own_mld_id = mconf->mt76.idx + 32;
 	mld->remap_idx = 0xff;
-	mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
-			     IEEE80211_EML_CAP_EMLSR_SUPP);
+
+	if (phy->chip_cap & MT792x_CHIP_CAP_MLO_EML_EN) {
+		mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
+				     IEEE80211_EML_CAP_EMLSR_SUPP);
+	} else {
+		mld->eml_enable = 0;
+	}
 
 	memcpy(mld->mac_addr, vif->addr, ETH_ALEN);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 32ed01a96bf7..454c6f523cc2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -27,8 +27,9 @@
 
 #define MT792x_CHIP_CAP_CLC_EVT_EN BIT(0)
 #define MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN BIT(1)
-#define MT792x_CHIP_CAP_MLO_EVT_EN BIT(2)
 #define MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN BIT(3)
+#define MT792x_CHIP_CAP_MLO_EN BIT(8)
+#define MT792x_CHIP_CAP_MLO_EML_EN BIT(9)
 
 /* NOTE: used to map mt76_rates. idx may change if firmware expands table */
 #define MT792x_BASIC_RATES_TBL	11
-- 
2.45.2


