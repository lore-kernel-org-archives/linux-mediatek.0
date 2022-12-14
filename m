Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49AFC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 02:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yD6+0YV8kKAnRu4TQIn+792RhOgKml45yCstoapdfk8=; b=Tep5+1+QrfptX7ArDE1ju8IAdS
	1mW0fkpqbMUQEWyrF1STSpU/chDmrXu/eDV0I3rT3o36y8V783N9goFCJqhqucCysOKRA9xpLfrUw
	ZADDQP+uluk82XOK0Vlhdc8i7H1J8jQ/gCuauAYmersa+0YE5BoQxN0qK1CY4fBBnhpRx9V758i6L
	OdWvf7pnNFPKX3xFh2A6OuXJ1AuUBNYNIR2sVi7zkccaLJuBaunoDYS5Pkx8dQu1OadlB22+ltof6
	WSGEsyiF5e0ZGsCwGqREsAkfMWvzRu/LisiD+gO/d1LxjilDTti7SZU1pBB1Z7zrdrbi1w6FzVu7+
	FMKTtQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5HVw-00AQXZ-Mb; Wed, 14 Dec 2022 02:28:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5HVt-00AQVS-Ck
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 02:28:55 +0000
X-UUID: b697dfa2e0d248b883d54dd5cb5e383e-20221213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yD6+0YV8kKAnRu4TQIn+792RhOgKml45yCstoapdfk8=;
	b=G8kKMDgabndTLl7IntQ04oIUa6StSUEihXCrAfzKWQS+YqTW8PEsViI2/VzjCBKsgml75H5AnKh8FwW07We+EfrksWc3a0V86u7TN5K7/HXGGE36hBwtu5sSCjlbdKbJB3LQr4TQHO7TrJAMaRFeNW0Fi9SHkL1OgCfZ4NZ1Gqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d2b323bb-3d9f-42d2-bc80-c3df46829e88,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:250c7117-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b697dfa2e0d248b883d54dd5cb5e383e-20221213
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 724650521; Tue, 13 Dec 2022 19:28:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 14 Dec 2022 10:28:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 14 Dec 2022 10:28:18 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH v3 2/4] wifi: mt76: mt7915: rework mt7915_mcu_set_thermal_throttling
Date: Wed, 14 Dec 2022 10:28:07 +0800
Message-ID: <20221214022809.32087-3-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
References: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_182853_652546_0C318C18 
X-CRM114-Status: GOOD (  15.48  )
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

This patch includes 2 changes:
1. Firmware expects to disable thermal protect first before
reconfiguring.
2. Separate setting thermal_protect and setting thermal_tx_duty into
different functions. These two firmware commands do not need to send
together.

Fixes: 34b877d972be ("mt76: mt7915: add thermal cooling device support")
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  3 --
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  5 ++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 54 +++++++++++--------
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 4 files changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 11407e18e56a..be435ae56bbf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -134,9 +134,6 @@ mt7915_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 	if (state > MT7915_CDEV_THROTTLE_MAX)
 		return -EINVAL;
 
-	if (phy->throttle_temp[0] > phy->throttle_temp[1])
-		return 0;
-
 	if (state == phy->cdev_state)
 		return 0;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 98af032eba09..7589af4b3dab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -60,6 +60,11 @@ int mt7915_run(struct ieee80211_hw *hw)
 	ret = mt7915_mcu_set_thermal_throttling(phy,
 						MT7915_THERMAL_THROTTLE_MAX);
 
+	if (ret)
+		goto out;
+
+	ret = mt7915_mcu_set_thermal_protect(phy);
+
 	if (ret)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 37a3c1f082d9..04d1da170fac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3077,6 +3077,29 @@ int mt7915_mcu_get_temperature(struct mt7915_phy *phy)
 }
 
 int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct mt7915_mcu_thermal_ctrl req = {
+		.band_idx = phy->mt76->band_idx,
+		.ctrl_id = THERMAL_PROTECT_DUTY_CONFIG,
+	};
+	int level, ret;
+
+	/* set duty cycle and level */
+	for (level = 0; level < 4; level++) {
+		req.duty.duty_level = level;
+		req.duty.duty_cycle = state;
+		state /= 2;
+
+		ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_PROT),
+					&req, sizeof(req), false);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+int mt7915_mcu_set_thermal_protect(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
 	struct {
@@ -3089,29 +3112,18 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 	} __packed req = {
 		.ctrl = {
 			.band_idx = phy->mt76->band_idx,
+			.type.protect_type = 1,
+			.type.trigger_type = 1,
 		},
 	};
-	int level;
-
-	if (!state) {
-		req.ctrl.ctrl_id = THERMAL_PROTECT_DISABLE;
-		goto out;
-	}
-
-	/* set duty cycle and level */
-	for (level = 0; level < 4; level++) {
-		int ret;
+	int ret;
 
-		req.ctrl.ctrl_id = THERMAL_PROTECT_DUTY_CONFIG;
-		req.ctrl.duty.duty_level = level;
-		req.ctrl.duty.duty_cycle = state;
-		state /= 2;
+	req.ctrl.ctrl_id = THERMAL_PROTECT_DISABLE;
+	ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_PROT),
+				&req, sizeof(req.ctrl), false);
 
-		ret = mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_PROT),
-					&req, sizeof(req.ctrl), false);
-		if (ret)
-			return ret;
-	}
+	if (ret)
+		return ret;
 
 	/* set high-temperature trigger threshold */
 	req.ctrl.ctrl_id = THERMAL_PROTECT_ENABLE;
@@ -3120,10 +3132,6 @@ int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state)
 	req.trigger_temp = cpu_to_le32(phy->throttle_temp[1]);
 	req.sustain_time = cpu_to_le16(10);
 
-out:
-	req.ctrl.type.protect_type = 1;
-	req.ctrl.type.trigger_type = 1;
-
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(THERMAL_PROT),
 				 &req, sizeof(req), false);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 6351feba6bdf..855779f86bde 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -543,6 +543,7 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy);
 int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch);
 int mt7915_mcu_get_temperature(struct mt7915_phy *phy);
 int mt7915_mcu_set_thermal_throttling(struct mt7915_phy *phy, u8 state);
+int mt7915_mcu_set_thermal_protect(struct mt7915_phy *phy);
 int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7915_mcu_rdd_background_enable(struct mt7915_phy *phy,
-- 
2.18.0


