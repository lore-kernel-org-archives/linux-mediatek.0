Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA4AC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXYO7ayGG/6xC6dWMK7By1P0VDtkTVcAXGN6vTg+cLQ=; b=StUOToKq0Qi5kNT3YKzqMBksQm
	AMQyPg9TwjDBf3lx+qIuorWHr2Yq2NPYMcvY9l0Tyf5qyplUW29zRINvPa6p8Ixi8PZx6KemgJYLO
	rGv8ecW9CcfLCo17g0HSAixrpqwhLJx172ISryFbC1bzsgCH+RbOMrKJb+gRNG3Ua/u9FE/GW0zcn
	zFlQKtcghSgDvFaH8/wniMV8og37ThNo12bKuxnEvBZ8//Kb7UsD26CPNp0X+Zjp5r8+NQdheeCxp
	9GoU591EjGC6Dh/nNJVQYSY4OYY9a8baNmvFtt7htzvX2L0zSA/Tl1y/8AYc+RRe3LYA85DpgasFP
	nA7EwbRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0eYO-005iW1-Gf; Thu, 01 Dec 2022 08:04:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0eYK-005iTV-OK
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 08:04:19 +0000
X-UUID: a09b60e07ae942719cb534a214a6f8c7-20221201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NXYO7ayGG/6xC6dWMK7By1P0VDtkTVcAXGN6vTg+cLQ=;
	b=Hm6PA5CvP/8kCUwvKHH/w8+ruHMSZpGF/XenNFSN+mhpA7jL4bTRRdd5v4YU9WvG3toSdVsLwh0HqoCF8qEGASlZOFMEXrwcbfwooxQkBXBAxQszSNCp1gM3GqzMcRwx9Ek1jsJHB1dpIuTDwH1Vrj5O4Vd83LDe/HgpK5ESiuo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:181087e0-2841-457e-9655-932b42ad6039,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:25bd3f6c-41fe-47b6-8eb4-ec192dedaf7d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a09b60e07ae942719cb534a214a6f8c7-20221201
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1483019758; Thu, 01 Dec 2022 01:04:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Dec 2022 16:03:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 16:03:34 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 5/5] wifi: mt76: mt7996: add support to configure spatial reuse parameter set
Date: Thu, 1 Dec 2022 16:03:32 +0800
Message-ID: <863efa2bf5a96ad1dd68e0740805d587914cfc66.1669879226.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <d1c11adff6b57c9104bb16df19f62700e2505473.1669879226.git.ryder.lee@mediatek.com>
References: <d1c11adff6b57c9104bb16df19f62700e2505473.1669879226.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_000417_048640_181EB4B8 
X-CRM114-Status: GOOD (  16.11  )
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
change since v2 - mark mt7996_mcu_enable_obss_spr()
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  |   6 +-
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 192 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7996/mcu.h   |   7 +
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |   4 +-
 4 files changed, 196 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index f2129be25d99..4421cd54311b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -518,10 +518,8 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 		mt7996_mcu_add_sta(dev, vif, NULL, join);
 	}
 
-	if (changed & BSS_CHANGED_ASSOC) {
+	if (changed & BSS_CHANGED_ASSOC)
 		mt7996_mcu_add_bss_info(phy, vif, vif->cfg.assoc);
-		mt7996_mcu_add_obss_spr(dev, vif, info->he_obss_pd.enable);
-	}
 
 	if (changed & BSS_CHANGED_ERP_CTS_PROT)
 		mt7996_mac_enable_rtscts(dev, vif, info->use_cts_prot);
@@ -545,7 +543,7 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 		mt7996_mcu_set_tx(dev, vif);
 
 	if (changed & BSS_CHANGED_HE_OBSS_PD)
-		mt7996_mcu_add_obss_spr(dev, vif, info->he_obss_pd.enable);
+		mt7996_mcu_add_obss_spr(phy, vif, &info->he_obss_pd);
 
 	if (changed & BSS_CHANGED_HE_BSS_COLOR)
 		mt7996_update_bss_color(hw, vif, &info->he_bss_color);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 8193af0982f7..e0d95a4aad7a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -71,6 +71,10 @@ struct mt7996_fw_region {
 #define HE_PHY(p, c)			u8_get_bits(c, IEEE80211_HE_PHY_##p)
 #define HE_MAC(m, c)			u8_get_bits(c, IEEE80211_HE_MAC_##m)
 
+static bool sr_scene_detect = true;
+module_param(sr_scene_detect, bool, 0644);
+MODULE_PARM_DESC(sr_scene_detect, "Enable firmware scene detection algorithm");
+
 static u8
 mt7996_mcu_get_sta_nss(u16 mcs_map)
 {
@@ -3123,29 +3127,203 @@ int mt7996_mcu_set_txbf(struct mt7996_dev *dev, u8 action)
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_WM_UNI_CMD(BF), true);
 }
 
-int mt7996_mcu_add_obss_spr(struct mt7996_dev *dev, struct ieee80211_vif *vif,
-			    bool enable)
+static int
+mt7996_mcu_enable_obss_spr(struct mt7996_phy *phy, u16 action, u8 val)
 {
-#define MT_SPR_ENABLE		1
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_dev *dev = phy->dev;
 	struct {
 		u8 band_idx;
 		u8 __rsv[3];
 
 		__le16 tag;
 		__le16 len;
+
 		__le32 val;
 	} __packed req = {
-		.band_idx = mvif->mt76.band_idx,
-		.tag = cpu_to_le16(UNI_CMD_SR_ENABLE),
+		.band_idx = phy->mt76->band_idx,
+		.tag = cpu_to_le16(action),
+		.len = cpu_to_le16(sizeof(req) - 4),
+		.val = cpu_to_le32(val),
+	};
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(SR),
+				 &req, sizeof(req), true);
+}
+
+static int
+mt7996_mcu_set_obss_spr_pd(struct mt7996_phy *phy,
+			   struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	struct mt7996_dev *dev = phy->dev;
+	u8 max_th = 82, non_srg_max_th = 62;
+	struct {
+		u8 band_idx;
+		u8 __rsv[3];
+
+		__le16 tag;
+		__le16 len;
+
+		u8 pd_th_non_srg;
+		u8 pd_th_srg;
+		u8 period_offs;
+		u8 rcpi_src;
+		__le16 obss_pd_min;
+		__le16 obss_pd_min_srg;
+		u8 resp_txpwr_mode;
+		u8 txpwr_restrict_mode;
+		u8 txpwr_ref;
+		u8 __rsv2[3];
+	} __packed req = {
+		.band_idx = phy->mt76->band_idx,
+		.tag = cpu_to_le16(UNI_CMD_SR_SET_PARAM),
+		.len = cpu_to_le16(sizeof(req) - 4),
+		.obss_pd_min = cpu_to_le16(max_th),
+		.obss_pd_min_srg = cpu_to_le16(max_th),
+		.txpwr_restrict_mode = 2,
+		.txpwr_ref = 21
+	};
+	int ret;
+
+	/* disable firmware dynamical PD asjustment */
+	ret = mt7996_mcu_enable_obss_spr(phy, UNI_CMD_SR_ENABLE_DPD, false);
+	if (ret)
+		return ret;
+
+	if (he_obss_pd->sr_ctrl &
+	    IEEE80211_HE_SPR_NON_SRG_OBSS_PD_SR_DISALLOWED)
+		req.pd_th_non_srg = max_th;
+	else if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_NON_SRG_OFFSET_PRESENT)
+		req.pd_th_non_srg  = max_th - he_obss_pd->non_srg_max_offset;
+	else
+		req.pd_th_non_srg  = non_srg_max_th;
+
+	if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_SRG_INFORMATION_PRESENT)
+		req.pd_th_srg = max_th - he_obss_pd->max_offset;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(SR),
+				 &req, sizeof(req), true);
+}
+
+static int
+mt7996_mcu_set_obss_spr_siga(struct mt7996_phy *phy, struct ieee80211_vif *vif,
+			     struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
+	struct mt7996_dev *dev = phy->dev;
+	u8 omac = mvif->mt76.omac_idx;
+	struct {
+		u8 band_idx;
+		u8 __rsv[3];
+
+		__le16 tag;
+		__le16 len;
+
+		u8 omac;
+		u8 __rsv2[3];
+		u8 flag[20];
+	} __packed req = {
+		.band_idx = phy->mt76->band_idx,
+		.tag = cpu_to_le16(UNI_CMD_SR_SET_SIGA),
 		.len = cpu_to_le16(sizeof(req) - 4),
-		.val = cpu_to_le32(enable),
+		.omac = omac > HW_BSSID_MAX ? omac - 12 : omac,
 	};
+	int ret;
+
+	if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_HESIGA_SR_VAL15_ALLOWED)
+		req.flag[req.omac] = 0xf;
+	else
+		return 0;
+
+	/* switch to normal AP mode */
+	ret = mt7996_mcu_enable_obss_spr(phy, UNI_CMD_SR_ENABLE_MODE, 0);
+	if (ret)
+		return ret;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(SR),
 				 &req, sizeof(req), true);
 }
 
+static int
+mt7996_mcu_set_obss_spr_bitmap(struct mt7996_phy *phy,
+			       struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	struct mt7996_dev *dev = phy->dev;
+	struct {
+		u8 band_idx;
+		u8 __rsv[3];
+
+		__le16 tag;
+		__le16 len;
+
+		__le32 color_l[2];
+		__le32 color_h[2];
+		__le32 bssid_l[2];
+		__le32 bssid_h[2];
+	} __packed req = {
+		.band_idx = phy->mt76->band_idx,
+		.tag = cpu_to_le16(UNI_CMD_SR_SET_SRG_BITMAP),
+		.len = cpu_to_le16(sizeof(req) - 4),
+	};
+	u32 bitmap;
+
+	memcpy(&bitmap, he_obss_pd->bss_color_bitmap, sizeof(bitmap));
+	req.color_l[req.band_idx] = cpu_to_le32(bitmap);
+
+	memcpy(&bitmap, he_obss_pd->bss_color_bitmap + 4, sizeof(bitmap));
+	req.color_h[req.band_idx] = cpu_to_le32(bitmap);
+
+	memcpy(&bitmap, he_obss_pd->partial_bssid_bitmap, sizeof(bitmap));
+	req.bssid_l[req.band_idx] = cpu_to_le32(bitmap);
+
+	memcpy(&bitmap, he_obss_pd->partial_bssid_bitmap + 4, sizeof(bitmap));
+	req.bssid_h[req.band_idx] = cpu_to_le32(bitmap);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(SR), &req,
+				 sizeof(req), true);
+}
+
+int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy, struct ieee80211_vif *vif,
+			    struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	int ret;
+
+	/* enable firmware scene detection algorithms */
+	ret = mt7996_mcu_enable_obss_spr(phy, UNI_CMD_SR_ENABLE_SD,
+					 sr_scene_detect);
+	if (ret)
+		return ret;
+
+	/* firmware dynamically adjusts PD threshold so skip manual control */
+	if (sr_scene_detect && !he_obss_pd->enable)
+		return 0;
+
+	/* enable spatial reuse */
+	ret = mt7996_mcu_enable_obss_spr(phy, UNI_CMD_SR_ENABLE,
+					 he_obss_pd->enable);
+	if (ret)
+		return ret;
+
+	if (sr_scene_detect || !he_obss_pd->enable)
+		return 0;
+
+	ret = mt7996_mcu_enable_obss_spr(phy, UNI_CMD_SR_ENABLE_TX, true);
+	if (ret)
+		return ret;
+
+	/* set SRG/non-SRG OBSS PD threshold */
+	ret = mt7996_mcu_set_obss_spr_pd(phy, he_obss_pd);
+	if (ret)
+		return ret;
+
+	/* Set SR prohibit */
+	ret = mt7996_mcu_set_obss_spr_siga(phy, vif, he_obss_pd);
+	if (ret)
+		return ret;
+
+	/* set SRG BSS color/BSSID bitmap */
+	return mt7996_mcu_set_obss_spr_bitmap(phy, he_obss_pd);
+}
+
 int mt7996_mcu_update_bss_color(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 				struct cfg80211_he_bss_color *he_bss_color)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index ff12a7168bd8..6084b2337598 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -617,6 +617,13 @@ enum {
 
 enum{
 	UNI_CMD_SR_ENABLE = 0x1,
+	UNI_CMD_SR_ENABLE_SD,
+	UNI_CMD_SR_ENABLE_MODE,
+	UNI_CMD_SR_ENABLE_DPD = 0x12,
+	UNI_CMD_SR_ENABLE_TX,
+	UNI_CMD_SR_SET_SRG_BITMAP = 0x80,
+	UNI_CMD_SR_SET_PARAM = 0xc1,
+	UNI_CMD_SR_SET_SIGA = 0xd0,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 17dcd05d3459..725344791b4c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -407,8 +407,8 @@ int mt7996_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  int enable);
 int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 				    struct ieee80211_vif *vif, u32 changed);
-int mt7996_mcu_add_obss_spr(struct mt7996_dev *dev, struct ieee80211_vif *vif,
-			    bool enable);
+int mt7996_mcu_add_obss_spr(struct mt7996_phy *phy, struct ieee80211_vif *vif,
+			    struct ieee80211_he_obss_pd *he_obss_pd);
 int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			     struct ieee80211_sta *sta, bool changed);
 int mt7996_set_channel(struct mt7996_phy *phy);
-- 
2.18.0


