Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2BBC77B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 04:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wQre5lq5KPulOOTISLtbugBiyYNx+lFX9Va3I8xt8is=; b=3DjhUwMym7ZpBnyyH4xTPJuKtg
	UTcwVJf6Nfy1JkxjNxHwHKLi9hSnwu8Iu5cu965xFdQSAtACG0AXVqlLji7GiRkPGWQS7i/KHhaSh
	1hOK5lB3A9szyg2AA6uQXSoh7rJGr/TndD0Ngmk6l06RJgRukXqx8n2doVZmrgJ/4TgCyN464AfgH
	MXcDOFNDrFPkEl33mTknrs/81cRsji2ZrGYmFpufrYJ1UAs0yupT95tIy1pNAsufWE+QgBc+r77aI
	5KNMA/wrM40iv9JCDUUKZRs3viHnWZiBgvZ7Ce+sFsZvIYYran7xWFE5Uo4t4dWFR8lDytbiRM1GG
	iPhfqVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pthei-0005n1-2J;
	Tue, 02 May 2023 04:30:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgdk-00HZSl-1C
	for linux-mediatek@lists.infradead.org;
	Tue, 02 May 2023 03:25:21 +0000
X-UUID: d96f19ace89611ed912e1518a6540028-20230501
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wQre5lq5KPulOOTISLtbugBiyYNx+lFX9Va3I8xt8is=;
	b=i69ilZ1tYsG8w2GQeXOAeUpV6eZuHtovG3I7lz3egamSkRw/+gFcxi+C9LEAu6dxmVEbrS0xr0822AYmHijR4gB4yFoU06CWnDM46XvZdU/8pZ8N1neIYHPXq0QMBrI+5YCrRiW34eC2UMLS+kcFko+1vM/Bpgf62tl31jekYMM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:02fc7555-4ad0-4457-a6cc-e8f4541b3f74,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:a5cd7fbf-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: d96f19ace89611ed912e1518a6540028-20230501
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 11605085; Mon, 01 May 2023 20:10:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 2 May 2023 11:10:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 2 May 2023 11:10:08 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3 1/2] wifi: mt76: mt7996: enable BSS_CHANGED_MU_GROUPS support
Date: Tue, 2 May 2023 11:10:05 +0800
Message-ID: <0a7809914a0c480ed4761158142e3c7d2f41ca76.1682971025.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_202520_422149_2072E945 
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

The Group ID Management frame is an Action frame of category VHT.
It is transmitted by the AP to assign or change the user position
of a STA for one or more group IDs.

Also, sniffer can use a given group id to monitor STA that belongs
to that group.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 23 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7996/regs.h  | 21 +++++++++++------
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index f1b48cdda58f..3569fef20cd9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -183,6 +183,7 @@ mt7996_init_wiphy(struct ieee80211_hw *hw)
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_FILS_DISCOVERY);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
+	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_MU_MIMO_AIR_SNIFFER);
 
 	if (!mdev->dev->of_node ||
 	    !of_property_read_bool(mdev->dev->of_node,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index f2d0b2982c6b..cb99932318aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -537,6 +537,26 @@ mt7996_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mvif->basic_rates_idx;
 }
 
+static void
+mt7996_update_mu_group(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		       struct ieee80211_bss_conf *info)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	u8 band = mvif->mt76.band_idx;
+	u32 *mu;
+
+	mu = (u32 *)info->mu_group.membership;
+	mt76_wr(dev, MT_WF_PHYRX_BAND_GID_TAB_VLD0(band), mu[0]);
+	mt76_wr(dev, MT_WF_PHYRX_BAND_GID_TAB_VLD1(band), mu[1]);
+
+	mu = (u32 *)info->mu_group.position;
+	mt76_wr(dev, MT_WF_PHYRX_BAND_GID_TAB_POS0(band), mu[0]);
+	mt76_wr(dev, MT_WF_PHYRX_BAND_GID_TAB_POS1(band), mu[1]);
+	mt76_wr(dev, MT_WF_PHYRX_BAND_GID_TAB_POS2(band), mu[2]);
+	mt76_wr(dev, MT_WF_PHYRX_BAND_GID_TAB_POS3(band), mu[3]);
+}
+
 static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_bss_conf *info,
@@ -609,6 +629,9 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 	    changed & BSS_CHANGED_FILS_DISCOVERY)
 		mt7996_mcu_beacon_inband_discov(dev, vif, changed);
 
+	if (changed & BSS_CHANGED_MU_GROUPS)
+		mt7996_update_mu_group(hw, vif, info);
+
 	mutex_unlock(&dev->mt76.mutex);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index df871361a7e1..43285328ce47 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -559,22 +559,29 @@ enum base_rev {
 
 #define MT_PCIE1_MAC_INT_ENABLE			MT_PCIE1_MAC(0x188)
 
+/* PHYRX CSD */
+#define MT_WF_PHYRX_CSD_BASE			0x83000000
+#define MT_WF_PHYRX_CSD(_band, _wf, ofs)	(MT_WF_PHYRX_CSD_BASE + \
+						 ((_band) << 20) + \
+						 ((_wf) << 16) + (ofs))
+#define MT_WF_PHYRX_CSD_IRPI(_band, _wf)	MT_WF_PHYRX_CSD(_band, _wf, 0x1000)
+
 /* PHYRX CTRL */
 #define MT_WF_PHYRX_BAND_BASE			0x83080000
 #define MT_WF_PHYRX_BAND(_band, ofs)		(MT_WF_PHYRX_BAND_BASE + \
 						 ((_band) << 20) + (ofs))
 
+#define MT_WF_PHYRX_BAND_GID_TAB_VLD0(_band)	MT_WF_PHYRX_BAND(_band, 0x1054)
+#define MT_WF_PHYRX_BAND_GID_TAB_VLD1(_band)	MT_WF_PHYRX_BAND(_band, 0x1058)
+#define MT_WF_PHYRX_BAND_GID_TAB_POS0(_band)	MT_WF_PHYRX_BAND(_band, 0x105c)
+#define MT_WF_PHYRX_BAND_GID_TAB_POS1(_band)	MT_WF_PHYRX_BAND(_band, 0x1060)
+#define MT_WF_PHYRX_BAND_GID_TAB_POS2(_band)	MT_WF_PHYRX_BAND(_band, 0x1064)
+#define MT_WF_PHYRX_BAND_GID_TAB_POS3(_band)	MT_WF_PHYRX_BAND(_band, 0x1068)
+
 #define MT_WF_PHYRX_BAND_RX_CTRL1(_band)	MT_WF_PHYRX_BAND(_band, 0x2004)
 #define MT_WF_PHYRX_BAND_RX_CTRL1_IPI_EN	GENMASK(2, 0)
 #define MT_WF_PHYRX_BAND_RX_CTRL1_STSCNT_EN	GENMASK(11, 9)
 
-/* PHYRX CSD */
-#define MT_WF_PHYRX_CSD_BASE			0x83000000
-#define MT_WF_PHYRX_CSD(_band, _wf, ofs)	(MT_WF_PHYRX_CSD_BASE + \
-						 ((_band) << 20) + \
-						 ((_wf) << 16) + (ofs))
-#define MT_WF_PHYRX_CSD_IRPI(_band, _wf)	MT_WF_PHYRX_CSD(_band, _wf, 0x1000)
-
 /* PHYRX CSD BAND */
 #define MT_WF_PHYRX_CSD_BAND_RXTD12(_band)		MT_WF_PHYRX_BAND(_band, 0x8230)
 #define MT_WF_PHYRX_CSD_BAND_RXTD12_IRPI_SW_CLR_ONLY	BIT(18)
-- 
2.18.0


