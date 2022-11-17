Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2773C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pqp/wK/+vGC4EtTGiQYRxNPcj0/vA0/E/G4HSmPoR98=; b=v1t4r0pF0T1Qq6T7HcgfChz1T6
	TppYjj5a5EUw5nSZcUd3/vNag9HYO8DLSaPScTwg9ywhgHdyFEjA8dfcoEp+Vf5ZVDmE4xQzgcG8y
	ltr2m9olYAzeyRbBj0diTyG0fBQTjN2R9FK+VnI0vLD7I/KuklR/ELJQMYbyEMKbz7L0lVGo7p1Fk
	wTuIEHvRwEsfDOa5kIQnn7lGIcpOdPrPAm2lvAz2EEvziYvjU2J+c7UMj1frCWbdHA7o8jsBUIFIS
	7Hp+qgNY2ks0RIEHI2dcjB+BI/1uAy30KhShrt1GINfnACAzeal/9TX2Gd8+B+xKwqvZRZbniKY1k
	WIA6hWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oviPP-00GITs-9p; Thu, 17 Nov 2022 17:10:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oviPL-00GITC-5k
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 17:10:38 +0000
X-UUID: e8b9d1a068884bb7aa6edf6695ee9356-20221117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Pqp/wK/+vGC4EtTGiQYRxNPcj0/vA0/E/G4HSmPoR98=;
	b=ekoe/5I1b3FL6TcM1LOh/Qd0rvLLx7ny4ijIQoMPdvjaSkXlXW5W7n7zbjJL5ec8d09dsmbY/UvQoKvmjFyzoBvy46AyJsL3OIiHHCODtUtJczt2gBwiCYY5ZKhVau8GILFEA+ZRHdmX50JadvNCLBWKUruX5jnlzmcKfR43fdw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:b91e1928-bb3f-4c74-ae35-113b0fb0bbcb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:ea7a142f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e8b9d1a068884bb7aa6edf6695ee9356-20221117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2116795674; Thu, 17 Nov 2022 10:10:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 18 Nov 2022 01:09:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 18 Nov 2022 01:09:52 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3] wifi: mt76: mt7915: add support to configure spatial reuse parameter set
Date: Fri, 18 Nov 2022 01:09:47 +0800
Message-ID: <cd9854c682abff3f3a636764e51a592ae21c775f.1668704526.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <02bd118d5ffff286c080d27fd7669095064cb75e.1668704608.git.ryder.lee@mediatek.com>
References: <02bd118d5ffff286c080d27fd7669095064cb75e.1668704608.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_091035_251406_E3DF28D3 
X-CRM114-Status: GOOD (  17.67  )
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

The SPR parameter set comprises OBSS PD threshold for SRG and
non SRG and Bitmap of BSS color and partial BSSID. This adds
support to configure fields of SPR element to firmware.

User can disable firmware SR algorithms by turning sr_scene_detect off.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v3 - add a missing MODULE_PARM_DESC.
change since v2 - update default values to align SPEC.
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   6 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 196 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  22 ++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   4 +-
 4 files changed, 207 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 3933f4f2d71d..a29cbdb47801 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -601,10 +601,8 @@ static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 		mt7915_mcu_add_sta(dev, vif, NULL, join);
 	}
 
-	if (changed & BSS_CHANGED_ASSOC) {
+	if (changed & BSS_CHANGED_ASSOC)
 		mt7915_mcu_add_bss_info(phy, vif, vif->cfg.assoc);
-		mt7915_mcu_add_obss_spr(dev, vif, info->he_obss_pd.enable);
-	}
 
 	if (changed & BSS_CHANGED_ERP_CTS_PROT)
 		mt7915_mac_enable_rtscts(dev, vif, info->use_cts_prot);
@@ -628,7 +626,7 @@ static void mt7915_bss_info_changed(struct ieee80211_hw *hw,
 		mt7915_mcu_set_tx(dev, vif);
 
 	if (changed & BSS_CHANGED_HE_OBSS_PD)
-		mt7915_mcu_add_obss_spr(dev, vif, info->he_obss_pd.enable);
+		mt7915_mcu_add_obss_spr(phy, vif, &info->he_obss_pd);
 
 	if (changed & BSS_CHANGED_HE_BSS_COLOR)
 		mt7915_update_bss_color(hw, vif, &info->he_bss_color);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 8b903a7636a8..3a0d97dad96f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -32,6 +32,10 @@
 #define HE_PHY(p, c)			u8_get_bits(c, IEEE80211_HE_PHY_##p)
 #define HE_MAC(m, c)			u8_get_bits(c, IEEE80211_HE_MAC_##m)
 
+static bool sr_scene_detect = true;
+module_param(sr_scene_detect, bool, 0644);
+MODULE_PARM_DESC(sr_scene_detect, "Enable firmware scene detection algorithm");
+
 static u8
 mt7915_mcu_get_sta_nss(u16 mcs_map)
 {
@@ -3270,31 +3274,193 @@ int mt7915_mcu_set_txbf(struct mt7915_dev *dev, u8 action)
 				 sizeof(req), true);
 }
 
-int mt7915_mcu_add_obss_spr(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-			    bool enable)
+static int
+mt7915_mcu_enable_obss_spr(struct mt7915_phy *phy, u8 action, u8 val)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct mt7915_mcu_sr_ctrl req = {
+		.action = action,
+		.argnum = 1,
+		.band_idx = phy != &dev->phy,
+		.val = cpu_to_le32(val),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(SET_SPR), &req,
+				 sizeof(req), true);
+}
+
+static int
+mt7915_mcu_set_obss_spr_pd(struct mt7915_phy *phy,
+			   struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct {
+		struct mt7915_mcu_sr_ctrl ctrl;
+		struct {
+			u8 pd_th_non_srg;
+			u8 pd_th_srg;
+			u8 period_offs;
+			u8 rcpi_src;
+			__le16 obss_pd_min;
+			__le16 obss_pd_min_srg;
+			u8 resp_txpwr_mode;
+			u8 txpwr_restrict_mode;
+			u8 txpwr_ref;
+			u8 rsv[3];
+		} __packed param;
+	} __packed req = {
+		.ctrl = {
+			.action = SPR_SET_PARAM,
+			.argnum = 9,
+			.band_idx = phy != &dev->phy,
+		},
+	};
+	int ret;
+	u8 max_th = 82, non_srg_max_th = 62;
+
+	/* disable firmware dynamical PD asjustment */
+	ret = mt7915_mcu_enable_obss_spr(phy, SPR_ENABLE_DPD, false);
+	if (ret)
+		return ret;
+
+	if (he_obss_pd->sr_ctrl &
+	    IEEE80211_HE_SPR_NON_SRG_OBSS_PD_SR_DISALLOWED)
+		req.param.pd_th_non_srg = max_th;
+	else if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_NON_SRG_OFFSET_PRESENT)
+		req.param.pd_th_non_srg  = max_th - he_obss_pd->non_srg_max_offset;
+	else
+		req.param.pd_th_non_srg  = non_srg_max_th;
+
+	if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_SRG_INFORMATION_PRESENT)
+		req.param.pd_th_srg = max_th - he_obss_pd->max_offset;
+
+	req.param.obss_pd_min = 82;
+	req.param.obss_pd_min_srg = 82;
+	req.param.txpwr_restrict_mode = 2;
+	req.param.txpwr_ref = 21;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(SET_SPR), &req,
+				 sizeof(req), true);
+}
+
+static int
+mt7915_mcu_set_obss_spr_siga(struct mt7915_phy *phy, struct ieee80211_vif *vif,
+			     struct ieee80211_he_obss_pd *he_obss_pd)
 {
-#define MT_SPR_ENABLE		1
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt7915_dev *dev = phy->dev;
+	u8 omac = mvif->mt76.omac_idx;
 	struct {
-		u8 action;
-		u8 arg_num;
-		u8 band_idx;
-		u8 status;
-		u8 drop_tx_idx;
-		u8 sta_idx;	/* 256 sta */
-		u8 rsv[2];
-		__le32 val;
+		struct mt7915_mcu_sr_ctrl ctrl;
+		struct {
+			u8 omac;
+			u8 rsv[3];
+			u8 flag[20];
+		} __packed siga;
+	} __packed req = {
+		.ctrl = {
+			.action = SPR_SET_SIGA,
+			.argnum = 1,
+			.band_idx = phy != &dev->phy,
+		},
+		.siga = {
+			.omac = omac > HW_BSSID_MAX ? omac - 12 : omac,
+		},
+	};
+	int ret;
+
+	if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_HESIGA_SR_VAL15_ALLOWED)
+		req.siga.flag[req.siga.omac] = 0xf;
+	else
+		return 0;
+
+	/* switch to normal AP mode */
+	ret = mt7915_mcu_enable_obss_spr(phy, SPR_ENABLE_MODE, 0);
+	if (ret)
+		return ret;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(SET_SPR), &req,
+				 sizeof(req), true);
+}
+
+static int
+mt7915_mcu_set_obss_spr_bitmap(struct mt7915_phy *phy,
+			       struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct {
+		struct mt7915_mcu_sr_ctrl ctrl;
+		struct {
+			__le32 color_l[2];
+			__le32 color_h[2];
+			__le32 bssid_l[2];
+			__le32 bssid_h[2];
+		} __packed bitmap;
 	} __packed req = {
-		.action = MT_SPR_ENABLE,
-		.arg_num = 1,
-		.band_idx = mvif->mt76.band_idx,
-		.val = cpu_to_le32(enable),
+		.ctrl = {
+			.action = SPR_SET_SRG_BITMAP,
+			.argnum = 4,
+			.band_idx = phy != &dev->phy,
+		},
 	};
+	u32 bitmap;
+
+	memcpy(&bitmap, he_obss_pd->bss_color_bitmap, sizeof(bitmap));
+	req.bitmap.color_l[req.ctrl.band_idx] = cpu_to_le32(bitmap);
+
+	memcpy(&bitmap, he_obss_pd->bss_color_bitmap + 4, sizeof(bitmap));
+	req.bitmap.color_h[req.ctrl.band_idx] = cpu_to_le32(bitmap);
+
+	memcpy(&bitmap, he_obss_pd->partial_bssid_bitmap, sizeof(bitmap));
+	req.bitmap.bssid_l[req.ctrl.band_idx] = cpu_to_le32(bitmap);
+
+	memcpy(&bitmap, he_obss_pd->partial_bssid_bitmap + 4, sizeof(bitmap));
+	req.bitmap.bssid_h[req.ctrl.band_idx] = cpu_to_le32(bitmap);
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(SET_SPR), &req,
 				 sizeof(req), true);
 }
 
+int mt7915_mcu_add_obss_spr(struct mt7915_phy *phy, struct ieee80211_vif *vif,
+			    struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	int ret;
+
+	/* enable firmware scene detection algorithms */
+	ret = mt7915_mcu_enable_obss_spr(phy, SPR_ENABLE_SD, sr_scene_detect);
+	if (ret)
+		return ret;
+
+	/* enable spatial reuse */
+	ret = mt7915_mcu_enable_obss_spr(phy, SPR_ENABLE, he_obss_pd->enable);
+	if (ret)
+		return ret;
+
+	if (!he_obss_pd->enable)
+		return 0;
+
+	ret = mt7915_mcu_enable_obss_spr(phy, SPR_ENABLE_TX, true);
+	if (ret)
+		return ret;
+
+	/* firmware dynamically adjusts PD threshold so skip manual control */
+	if (sr_scene_detect)
+		return 0;
+
+	/* set SRG/non-SRG OBSS PD threshold */
+	ret = mt7915_mcu_set_obss_spr_pd(phy, he_obss_pd);
+	if (ret)
+		return ret;
+
+	/* Set SR prohibit */
+	ret = mt7915_mcu_set_obss_spr_siga(phy, vif, he_obss_pd);
+	if (ret)
+		return ret;
+
+	/* set SRG BSS color/BSSID bitmap */
+	return mt7915_mcu_set_obss_spr_bitmap(phy, he_obss_pd);
+}
+
 int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index c19b5d66c0e1..2fc09fd53777 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -129,6 +129,17 @@ struct mt7915_mcu_background_chain_ctrl {
 	u8 rsv[2];
 } __packed;
 
+struct mt7915_mcu_sr_ctrl {
+	u8 action;
+	u8 argnum;
+	u8 band_idx;
+	u8 status;
+	u8 drop_ta_idx;
+	u8 sta_idx;	/* 256 sta */
+	u8 rsv[2];
+	__le32 val;
+} __packed;
+
 struct mt7915_mcu_eeprom {
 	u8 buffer_mode;
 	u8 format;
@@ -408,6 +419,17 @@ enum {
 #define RATE_CFG_PHY_TYPE		GENMASK(27, 24)
 #define RATE_CFG_HE_LTF			GENMASK(31, 28)
 
+enum {
+	SPR_ENABLE = 0x1,
+	SPR_ENABLE_SD = 0x3,
+	SPR_ENABLE_MODE = 0x5,
+	SPR_ENABLE_DPD = 0x23,
+	SPR_ENABLE_TX = 0x25,
+	SPR_SET_SRG_BITMAP = 0x80,
+	SPR_SET_PARAM = 0xc2,
+	SPR_SET_SIGA = 0xdc,
+};
+
 enum {
 	THERMAL_PROTECT_PARAMETER_CTRL,
 	THERMAL_PROTECT_BASIC_INFO,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 9cb680e7f223..0bad78cf32c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -501,8 +501,8 @@ int mt7915_mcu_update_bss_color(struct mt7915_dev *dev, struct ieee80211_vif *vi
 				struct cfg80211_he_bss_color *he_bss_color);
 int mt7915_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  int enable, u32 changed);
-int mt7915_mcu_add_obss_spr(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-                            bool enable);
+int mt7915_mcu_add_obss_spr(struct mt7915_phy *phy, struct ieee80211_vif *vif,
+			    struct ieee80211_he_obss_pd *he_obss_pd);
 int mt7915_mcu_add_rate_ctrl(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 			     struct ieee80211_sta *sta, bool changed);
 int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
-- 
2.36.1


