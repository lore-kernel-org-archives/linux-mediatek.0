Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BABD5B172
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 06:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S14FgoBDQrftYs+PhqprfZVLFD1dRiFBQ0vXnY3TjyM=; b=bYkeuTor+y9uD2UiHaU1wL2FFo
	5SoFoHvDyDpsAYvAUKpfV9NSVQcUUslcXg8in/IlmENRHnrLEltq67au39gGAqW7d4GwFBWZqF7ae
	h4pCAUztDdFtNq7AZRpRrIQVrnhNw9gqeWZx0jpnRxLAif7uHrCrYi9NxD3ZehmW2FPZKaIFXZHVC
	+x42NLyUiKb85eNEJW7uO/0nSZBSdX2hQJJquM8kD/wJcZY9HEtdqd57Tb9IJXrYu2kmaSEDnwEIq
	IRWoPMpNsdU++BzBm+GQ8f8IApWAtGxQj7EBb+7YPxmcNyxFu4WJEpMVaPWieGo4aigG+G2DOMjAo
	4AnYpXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2Dv-000000039r8-3mZr;
	Mon, 15 Dec 2025 06:38:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV2Dg-000000039l1-3nVt
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Dec 2025 06:38:14 +0000
X-UUID: 9acf2bfad98011f0a52f393f94899d25-20251214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=S14FgoBDQrftYs+PhqprfZVLFD1dRiFBQ0vXnY3TjyM=;
	b=Mt/CLhJdXN1BilbU7Oa9MFbhZCwSkqXO28kLDg6JbSv7XGOqq0JnCjgDx9cd0PLHjQn0Zz4V35nwO7YzYp3SnxHiS2LZEBL+ZKR55j08Nl6fa9KRl4I1KBzbyZbXG7drDPFkFd3Z1qYSfm7lglST8OaB/MbrJnVYTGBUFaLtF+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6401e177-6577-4aa3-ac77-db2440b4567d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:c61672c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9acf2bfad98011f0a52f393f94899d25-20251214
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 861180071; Sun, 14 Dec 2025 23:38:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 14:37:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 14:37:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76 v2 5/7] wifi: mt76: mt7996: offload radar threshold initialization
Date: Mon, 15 Dec 2025 14:37:26 +0800
Message-ID: <20251215063728.3013365-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215063728.3013365-1-shayne.chen@mediatek.com>
References: <20251215063728.3013365-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_223809_198282_6ECAB96D 
X-CRM114-Status: GOOD (  12.32  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Since some radar specifications maintained by the driver are incorrect
and are now also maintained by the firmware, offload the initialization
procedure to the firmware.
This fixes issues for radar detection rate testings.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 77 -------------------
 .../net/wireless/mediatek/mt76/mt7996/mac.h   |  5 --
 2 files changed, 82 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index ce85d8f1bde6..98abaa51cf00 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -13,45 +13,6 @@
 
 #define to_rssi(field, rcpi)	((FIELD_GET(field, rcpi) - 220) / 2)
 
-static const struct mt7996_dfs_radar_spec etsi_radar_specs = {
-	.pulse_th = { 110, -10, -80, 40, 5200, 128, 5200 },
-	.radar_pattern = {
-		[5] =  { 1, 0,  6, 32, 28, 0,  990, 5010, 17, 1, 1 },
-		[6] =  { 1, 0,  9, 32, 28, 0,  615, 5010, 27, 1, 1 },
-		[7] =  { 1, 0, 15, 32, 28, 0,  240,  445, 27, 1, 1 },
-		[8] =  { 1, 0, 12, 32, 28, 0,  240,  510, 42, 1, 1 },
-		[9] =  { 1, 1,  0,  0,  0, 0, 2490, 3343, 14, 0, 0, 12, 32, 28, { }, 126 },
-		[10] = { 1, 1,  0,  0,  0, 0, 2490, 3343, 14, 0, 0, 15, 32, 24, { }, 126 },
-		[11] = { 1, 1,  0,  0,  0, 0,  823, 2510, 14, 0, 0, 18, 32, 28, { },  54 },
-		[12] = { 1, 1,  0,  0,  0, 0,  823, 2510, 14, 0, 0, 27, 32, 24, { },  54 },
-	},
-};
-
-static const struct mt7996_dfs_radar_spec fcc_radar_specs = {
-	.pulse_th = { 110, -10, -80, 40, 5200, 128, 5200 },
-	.radar_pattern = {
-		[0] = { 1, 0,  8,  32, 28, 0, 508, 3076, 13, 1,  1 },
-		[1] = { 1, 0, 12,  32, 28, 0, 140,  240, 17, 1,  1 },
-		[2] = { 1, 0,  8,  32, 28, 0, 190,  510, 22, 1,  1 },
-		[3] = { 1, 0,  6,  32, 28, 0, 190,  510, 32, 1,  1 },
-		[4] = { 1, 0,  9, 255, 28, 0, 323,  343, 13, 1, 32 },
-	},
-};
-
-static const struct mt7996_dfs_radar_spec jp_radar_specs = {
-	.pulse_th = { 110, -10, -80, 40, 5200, 128, 5200 },
-	.radar_pattern = {
-		[0] =  { 1, 0,  8,  32, 28, 0,  508, 3076,  13, 1,  1 },
-		[1] =  { 1, 0, 12,  32, 28, 0,  140,  240,  17, 1,  1 },
-		[2] =  { 1, 0,  8,  32, 28, 0,  190,  510,  22, 1,  1 },
-		[3] =  { 1, 0,  6,  32, 28, 0,  190,  510,  32, 1,  1 },
-		[4] =  { 1, 0,  9, 255, 28, 0,  323,  343,  13, 1, 32 },
-		[13] = { 1, 0,  7,  32, 28, 0, 3836, 3856,  14, 1,  1 },
-		[14] = { 1, 0,  6,  32, 28, 0,  615, 5010, 110, 1,  1 },
-		[15] = { 1, 1,  0,   0,  0, 0,   15, 5010, 110, 0,  0, 12, 32, 28 },
-	},
-};
-
 static struct mt76_wcid *mt7996_rx_get_wcid(struct mt7996_dev *dev,
 					    u16 idx, u8 band_idx)
 {
@@ -3010,40 +2971,6 @@ static int mt7996_dfs_start_radar_detector(struct mt7996_phy *phy)
 	return err;
 }
 
-static int
-mt7996_dfs_init_radar_specs(struct mt7996_phy *phy)
-{
-	const struct mt7996_dfs_radar_spec *radar_specs;
-	struct mt7996_dev *dev = phy->dev;
-	int err, i;
-
-	switch (dev->mt76.region) {
-	case NL80211_DFS_FCC:
-		radar_specs = &fcc_radar_specs;
-		err = mt7996_mcu_set_fcc5_lpn(dev, 8);
-		if (err < 0)
-			return err;
-		break;
-	case NL80211_DFS_ETSI:
-		radar_specs = &etsi_radar_specs;
-		break;
-	case NL80211_DFS_JP:
-		radar_specs = &jp_radar_specs;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(radar_specs->radar_pattern); i++) {
-		err = mt7996_mcu_set_radar_th(dev, i,
-					      &radar_specs->radar_pattern[i]);
-		if (err < 0)
-			return err;
-	}
-
-	return mt7996_mcu_set_pulse_th(dev, &radar_specs->pulse_th);
-}
-
 int mt7996_dfs_init_radar_detector(struct mt7996_phy *phy)
 {
 	struct mt7996_dev *dev = phy->dev;
@@ -3063,10 +2990,6 @@ int mt7996_dfs_init_radar_detector(struct mt7996_phy *phy)
 		goto stop;
 
 	if (prev_state <= MT_DFS_STATE_DISABLED) {
-		err = mt7996_dfs_init_radar_specs(phy);
-		if (err < 0)
-			return err;
-
 		err = mt7996_dfs_start_radar_detector(phy);
 		if (err < 0)
 			return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.h b/drivers/net/wireless/mediatek/mt76/mt7996/mac.h
index 4eca37b013fc..70ee30f32f88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.h
@@ -37,9 +37,4 @@ struct mt7996_dfs_pattern {
 	u32 min_stgpr_diff;
 } __packed;
 
-struct mt7996_dfs_radar_spec {
-	struct mt7996_dfs_pulse pulse_th;
-	struct mt7996_dfs_pattern radar_pattern[16];
-};
-
 #endif
-- 
2.51.0


