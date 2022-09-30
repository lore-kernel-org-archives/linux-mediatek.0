Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vro4aNeMhnKxMo5JO2QxA75dEAUKWi1vnfiFMdsxajM=; b=msYfYry5XqxF+uoPtJYL2nXVuf
	UGiJn3lkfoUCLyAI6Ttl0RD7g4xKJYcPK9c79BUfWaLwrtQ4oRs7hPhyGLo+OifgJO75bsfRahejf
	tZRVlckBjN4M+BzPNLX1zzFHnRcK7LNF2VQnLCPkxENVBEUltmjL/FEmV7A4hSNfdbr2JBHca7+Fu
	w3AF55+v13urW3zqQYb9Uw4jnHbG8eEmghOfV8oDs+wPtT1lcab3j9BO81SzKfnuQWx7cijmtEJkx
	kpc0I5L11pDTyhW82wVf806nJ0Rdzq1tOALoGoIXUd8T7qN7baccZaw/iAA2hWmfu9Dkqb7KPOIvU
	aMa7Buxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHjA-00A5li-PR; Fri, 30 Sep 2022 15:15:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHiO-00A5LY-0H
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 15:14:14 +0000
X-UUID: 02952540df3c4706bea5a67536a6df25-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vro4aNeMhnKxMo5JO2QxA75dEAUKWi1vnfiFMdsxajM=;
	b=Ku3YdTxfx8yes2Da0gS2qBQOI8eN0Ilp5tuNfff0kZ6h9KePNS/IG8Cd4dgB4TDN2VuxIHCn8tM7htGfYABdY1TFzOvObK9tKFKynLqDbR1sfBk9jEHDs1ku2FOVqeT4va/F/j/6ZzYtaGJfLr6Rcm+f7rHB0xnFmgJBApOe2wo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e0c8590d-8ddc-4f74-95e8-7a244fce14d8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:5a7aa6a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 02952540df3c4706bea5a67536a6df25-20220930
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 985114187; Fri, 30 Sep 2022 08:14:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 30 Sep 2022 23:13:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 23:13:42 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 5/6] wifi: mt76: mt7915: add spatial extension index support
Date: Fri, 30 Sep 2022 23:13:14 +0800
Message-ID: <20220930151315.19012-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930151315.19012-1-shayne.chen@mediatek.com>
References: <20220930151315.19012-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_081412_088032_6079428C 
X-CRM114-Status: GOOD (  12.99  )
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

In previous, we only allow user to configure tx antenna mask
contiguously (e.g. 0x3, 0xf).
This patch allows user to configure tx antenna mask interleavingly
(e.g. 0x5, 0x8). By setting proper antenna mask and nss, user can
prioritized the signal of different antennas, which helps to test
their performance in normal mode.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  3 ---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 20 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7915/testmode.c  |  4 +---
 4 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 8379fbbeaaea..c5d289ac07bd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -958,9 +958,6 @@ mt7915_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	if (!tx_ant || tx_ant != rx_ant || ffs(tx_ant) > max_nss)
 		return -EINVAL;
 
-	if ((BIT(hweight8(tx_ant)) - 1) != tx_ant)
-		tx_ant = BIT(ffs(tx_ant) - 1) - 1;
-
 	mutex_lock(&dev->mt76.mutex);
 
 	phy->mt76->antenna_mask = tx_ant;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 56491364a903..6a1ef3056e22 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1306,6 +1306,9 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 	case RATE_PARAM_MMPS_UPDATE:
 		ra->mmps_mode = mt7915_mcu_get_mmps_mode(sta->deflink.smps_mode);
 		break;
+	case RATE_PARAM_SPE_UPDATE:
+		ra->spe_idx = *(u8 *)data;
+		break;
 	default:
 		break;
 	}
@@ -1348,6 +1351,18 @@ int mt7915_mcu_add_smps(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 					      RATE_PARAM_MMPS_UPDATE);
 }
 
+static int
+mt7915_mcu_set_spe_idx(struct mt7915_dev *dev, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta)
+{
+	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
+	struct mt76_phy *mphy = mvif->phy->mt76;
+	u8 spe_idx = mt76_connac_spe_idx(mphy->antenna_mask);
+
+	return mt7915_mcu_set_fixed_rate_ctrl(dev, vif, sta, &spe_idx,
+					      RATE_PARAM_SPE_UPDATE);
+}
+
 static int
 mt7915_mcu_add_rate_ctrl_fixed(struct mt7915_dev *dev,
 			       struct ieee80211_vif *vif,
@@ -1435,7 +1450,7 @@ mt7915_mcu_add_rate_ctrl_fixed(struct mt7915_dev *dev,
 			return ret;
 	}
 
-	return 0;
+	return mt7915_mcu_set_spe_idx(dev, vif, sta);
 }
 
 static void
@@ -2648,6 +2663,9 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 	}
 #endif
 
+	if (mt76_connac_spe_idx(phy->mt76->antenna_mask))
+		req.tx_streams_num = fls(phy->mt76->antenna_mask);
+
 	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
 	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index cd1edf553fc1..87cd1bfff3e6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -394,6 +394,7 @@ enum {
 	RATE_PARAM_FIXED_MCS,
 	RATE_PARAM_FIXED_GI = 11,
 	RATE_PARAM_AUTO = 20,
+	RATE_PARAM_SPE_UPDATE = 22,
 };
 
 #define RATE_CFG_MCS			GENMASK(3, 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index e1838f046568..a979460fad2d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -432,8 +432,6 @@ mt7915_tm_update_channel(struct mt7915_phy *phy)
 static void
 mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 {
-	static const u8 spe_idx_map[] = {0, 0, 1, 0, 3, 2, 4, 0,
-					 9, 8, 6, 10, 16, 12, 18, 0};
 	struct mt76_testmode_data *td = &phy->mt76->test;
 	struct mt7915_dev *dev = phy->dev;
 	struct ieee80211_tx_info *info;
@@ -450,7 +448,7 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 		if (td->tx_spe_idx)
 			phy->test.spe_idx = td->tx_spe_idx;
 		else
-			phy->test.spe_idx = spe_idx_map[td->tx_antenna_mask];
+			phy->test.spe_idx = mt76_connac_spe_idx(td->tx_antenna_mask);
 	}
 
 	mt7915_tm_set_tam_arb(phy, en,
-- 
2.25.1


