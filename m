Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BF2D2FEF4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 23:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d4Qg30T2WxL92OCbsAOZY5mgloFYgBKd0pj24f3++Ew=; b=R+cHTY42JqfeMeV6JVPNXBwmxU
	1uYRvf/bg7MOlDtb26iVbSDIEq4oxXM46KgGPar5UpdzdG7hu0JGrfKRddTk07dpDSRLRZcPcWj1i
	ykcpTAZjbKPwbPowIyymXnb86tLcs5HNPSXFjccfVBMzsUo4vsCW7XCpaJqUX0pmhjnXwn/d2myYW
	RU9Qpf5gTBamhIKluhZZvHLwFeAzJdLDMdtmbuqb7AgK1RgqxP3Yxoevx7RSJFWkEQXeBFlBTrlMk
	5dRSPjVujN+imAPlKCUFcOt+HuaF8yNs8cCUkrGGZCyktBBxOYh0fT0cRKD3FG2qa9nuLPY1uWNbL
	s01/nfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksuq-0000000FBdr-0CGd;
	Tue, 27 Jan 2026 23:56:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksun-0000000FBdW-34vC
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 23:56:10 +0000
X-UUID: bceb0862fbdb11f0ad39f32c34db0b1c-20260127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d4Qg30T2WxL92OCbsAOZY5mgloFYgBKd0pj24f3++Ew=;
	b=dWedzItG6RZ5s7BBhcs36j/dMj0N3Yg0y2yk9kU/BnGkyLVL1J/OociFVgNSImXIScqc9asZPR2sijHl8zjm19KLPJ1+lUZ/EHk/vhJ7sexxppfageLWGF8tiaQd/clWRVyrXC1ke+MGyXqu3LtW3CffXKa23y0vM9fImuUOUZs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:1e597f01-5e99-466a-95a2-cc33e621b44e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:c4b0a15a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bceb0862fbdb11f0ad39f32c34db0b1c-20260127
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1906421775; Tue, 27 Jan 2026 16:56:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Jan 2026 07:56:00 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Jan 2026 07:56:00 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen Ye <allen.ye@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2] wifi: mt76: fix backoff fields and max_power calculation
Date: Tue, 27 Jan 2026 15:55:57 -0800
Message-ID: <54627282cfb8e5a89fe753da66552c0a084f6387.1769557863.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_155609_791912_F3BC87A0 
X-CRM114-Status: GOOD (  19.64  )
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

From: Allen Ye <allen.ye@mediatek.com>

The maximum power value may exist in either the data or backoff field.
Previously, backoff power limits were not considered in txpower reporting.
This patch ensures mt76 also considers backoff values in the SKU table.

For connac2 devices,
- paths-ru = RU26, RU52, RU106, BW20, BW40, BW80, BW160
- paths-ru-bf = RU26, RU52, RU106, BW20, BW40, BW80, BW160

Only the first three entries use 1T1S and do not need index adjustment;
the remaining four require index offset.

Fixes: b05ab4be9fd7 ("wifi: mt76: mt7915: add bf backoff limit table support")
Signed-off-by: Allen Ye <allen.ye@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v1:
- Add "wifi:" prefix to the subject.

v2:
- Fix checkpatch errors.
- Remove unnecessary style changes.
- Add explanation for connac2 index adjustment.
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 180 +++++++++++++-------
 drivers/net/wireless/mediatek/mt76/mt76.h   |   1 -
 2 files changed, 122 insertions(+), 59 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 573400d57..6ca0274b4 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -9,6 +9,13 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/etherdevice.h>
 #include "mt76.h"
+#include "mt76_connac.h"
+
+enum mt76_sku_type {
+	MT76_SKU_RATE,
+	MT76_SKU_BACKOFF,
+	MT76_SKU_BACKOFF_BF_OFFSET,
+};
 
 static int mt76_get_of_eeprom_data(struct mt76_dev *dev, void *eep, int len)
 {
@@ -292,7 +299,6 @@ mt76_find_channel_node(struct device_node *np, struct ieee80211_channel *chan)
 }
 EXPORT_SYMBOL_GPL(mt76_find_channel_node);
 
-
 static s8
 mt76_get_txs_delta(struct device_node *np, u8 nss)
 {
@@ -306,9 +312,24 @@ mt76_get_txs_delta(struct device_node *np, u8 nss)
 	return be32_to_cpu(val[nss - 1]);
 }
 
+static inline u8 mt76_backoff_n_chains(struct mt76_dev *dev, u8 idx)
+{
+	/* 0:1T1ss, 1:2T1ss, ..., 14:5T5ss */
+	static const u8 connac3_table[] = {
+		1, 2, 3, 4, 5, 2, 3, 4, 5, 3, 4, 5, 4, 5, 5};
+	static const u8 connac2_table[] = {
+		1, 2, 3, 4, 2, 3, 4, 3, 4, 4, 0, 0, 0, 0, 0};
+
+	if (idx < 0 || idx >= ARRAY_SIZE(connac3_table))
+		return 0;
+
+	return is_mt799x(dev) ? connac3_table[idx] : connac2_table[idx];
+}
+
 static void
-mt76_apply_array_limit(s8 *pwr, size_t pwr_len, const s8 *data,
-		       s8 target_power, s8 nss_delta, s8 *max_power)
+mt76_apply_array_limit(struct mt76_dev *dev, s8 *pwr, size_t pwr_len,
+		       const s8 *data, s8 target_power, s8 nss_delta,
+		       s8 *max_power, int n_chains, enum mt76_sku_type type)
 {
 	int i;
 
@@ -316,18 +337,51 @@ mt76_apply_array_limit(s8 *pwr, size_t pwr_len, const s8 *data,
 		return;
 
 	for (i = 0; i < pwr_len; i++) {
-		pwr[i] = min_t(s8, target_power, data[i] + nss_delta);
+		u8 backoff_chain_idx = i;
+		int backoff_n_chains;
+		s8 backoff_delta;
+		s8 delta;
+
+		switch (type) {
+		case MT76_SKU_RATE:
+			delta = 0;
+			backoff_delta = 0;
+			backoff_n_chains = 0;
+			break;
+		case MT76_SKU_BACKOFF:
+			backoff_chain_idx += 1;
+			fallthrough;
+		case MT76_SKU_BACKOFF_BF_OFFSET:
+			delta = mt76_tx_power_path_delta(n_chains);
+			backoff_n_chains = mt76_backoff_n_chains(dev, backoff_chain_idx);
+			backoff_delta = mt76_tx_power_path_delta(backoff_n_chains);
+			break;
+		default:
+			return;
+		}
+
+		pwr[i] = min_t(s8, target_power + delta - backoff_delta, data[i] + nss_delta);
+
+		/* used for padding, doesn't need to be considered */
+		if (data[i] >= S8_MAX - 1)
+			continue;
+
+		/* only consider backoff value for the configured chain number */
+		if (type != MT76_SKU_RATE && n_chains != backoff_n_chains)
+			continue;
+
 		*max_power = max(*max_power, pwr[i]);
 	}
 }
 
 static void
-mt76_apply_multi_array_limit(s8 *pwr, size_t pwr_len, s8 pwr_num,
-			     const s8 *data, size_t len, s8 target_power,
-			     s8 nss_delta)
+mt76_apply_multi_array_limit(struct mt76_dev *dev, s8 *pwr, size_t pwr_len,
+			     s8 pwr_num, const s8 *data, size_t len,
+			     s8 target_power, s8 nss_delta, s8 *max_power,
+			     int n_chains, enum mt76_sku_type type)
 {
+	static const int connac2_backoff_ru_idx = 2;
 	int i, cur;
-	s8 max_power = -128;
 
 	if (!data)
 		return;
@@ -337,8 +391,19 @@ mt76_apply_multi_array_limit(s8 *pwr, size_t pwr_len, s8 pwr_num,
 		if (len < pwr_len + 1)
 			break;
 
-		mt76_apply_array_limit(pwr + pwr_len * i, pwr_len, data + 1,
-				       target_power, nss_delta, &max_power);
+		/* For connac2 devices,
+		 * - paths-ru = RU26, RU52, RU106, BW20, BW40, BW80, BW160
+		 * - paths-ru-bf = RU26, RU52, RU106, BW20, BW40, BW80, BW160
+		 * Only the first three entries use 1T1ss and do not need index
+		 * adjustment; the remaining four require index offset.
+		 */
+		if (!is_mt799x(dev) && type == MT76_SKU_BACKOFF &&
+		    i > connac2_backoff_ru_idx)
+			type = MT76_SKU_BACKOFF_BF_OFFSET;
+
+		mt76_apply_array_limit(dev, pwr + pwr_len * i, pwr_len, data + 1,
+				       target_power, nss_delta, max_power,
+				       n_chains, type);
 		if (--cur > 0)
 			continue;
 
@@ -360,18 +425,11 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 	struct device_node *np;
 	const s8 *val;
 	char name[16];
-	u32 mcs_rates = dev->drv->mcs_rates;
-	u32 ru_rates = ARRAY_SIZE(dest->ru[0]);
 	char band;
 	size_t len;
-	s8 max_power = 0;
-	s8 max_power_backoff = -127;
+	s8 max_power = -127;
 	s8 txs_delta;
 	int n_chains = hweight16(phy->chainmask);
-	s8 target_power_combine = target_power + mt76_tx_power_path_delta(n_chains);
-
-	if (!mcs_rates)
-		mcs_rates = 10;
 
 	memset(dest, target_power, sizeof(*dest) - sizeof(dest->path));
 	memset(&dest->path, 0, sizeof(dest->path));
@@ -409,46 +467,52 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 	txs_delta = mt76_get_txs_delta(np, hweight16(phy->chainmask));
 
 	val = mt76_get_of_array_s8(np, "rates-cck", &len, ARRAY_SIZE(dest->cck));
-	mt76_apply_array_limit(dest->cck, ARRAY_SIZE(dest->cck), val,
-			       target_power, txs_delta, &max_power);
-
-	val = mt76_get_of_array_s8(np, "rates-ofdm",
-				   &len, ARRAY_SIZE(dest->ofdm));
-	mt76_apply_array_limit(dest->ofdm, ARRAY_SIZE(dest->ofdm), val,
-			       target_power, txs_delta, &max_power);
-
-	val = mt76_get_of_array_s8(np, "rates-mcs", &len, mcs_rates + 1);
-	mt76_apply_multi_array_limit(dest->mcs[0], ARRAY_SIZE(dest->mcs[0]),
-				     ARRAY_SIZE(dest->mcs), val, len,
-				     target_power, txs_delta);
-
-	val = mt76_get_of_array_s8(np, "rates-ru", &len, ru_rates + 1);
-	mt76_apply_multi_array_limit(dest->ru[0], ARRAY_SIZE(dest->ru[0]),
-				     ARRAY_SIZE(dest->ru), val, len,
-				     target_power, txs_delta);
-
-	max_power_backoff = max_power;
-	val = mt76_get_of_array_s8(np, "paths-cck", &len, ARRAY_SIZE(dest->path.cck));
-	mt76_apply_array_limit(dest->path.cck, ARRAY_SIZE(dest->path.cck), val,
-			       target_power_combine, txs_delta, &max_power_backoff);
-
-	val = mt76_get_of_array_s8(np, "paths-ofdm", &len, ARRAY_SIZE(dest->path.ofdm));
-	mt76_apply_array_limit(dest->path.ofdm, ARRAY_SIZE(dest->path.ofdm), val,
-			       target_power_combine, txs_delta, &max_power_backoff);
-
-	val = mt76_get_of_array_s8(np, "paths-ofdm-bf", &len, ARRAY_SIZE(dest->path.ofdm_bf));
-	mt76_apply_array_limit(dest->path.ofdm_bf, ARRAY_SIZE(dest->path.ofdm_bf), val,
-			       target_power_combine, txs_delta, &max_power_backoff);
-
-	val = mt76_get_of_array_s8(np, "paths-ru", &len, ARRAY_SIZE(dest->path.ru[0]) + 1);
-	mt76_apply_multi_array_limit(dest->path.ru[0], ARRAY_SIZE(dest->path.ru[0]),
-				     ARRAY_SIZE(dest->path.ru), val, len,
-				     target_power_combine, txs_delta);
-
-	val = mt76_get_of_array_s8(np, "paths-ru-bf", &len, ARRAY_SIZE(dest->path.ru_bf[0]) + 1);
-	mt76_apply_multi_array_limit(dest->path.ru_bf[0], ARRAY_SIZE(dest->path.ru_bf[0]),
-				     ARRAY_SIZE(dest->path.ru_bf), val, len,
-				     target_power_combine, txs_delta);
+	mt76_apply_array_limit(dev, dest->cck, ARRAY_SIZE(dest->cck), val,
+			       target_power, txs_delta, &max_power, n_chains, MT76_SKU_RATE);
+
+	val = mt76_get_of_array_s8(np, "rates-ofdm", &len, ARRAY_SIZE(dest->ofdm));
+	mt76_apply_array_limit(dev, dest->ofdm, ARRAY_SIZE(dest->ofdm), val,
+			       target_power, txs_delta, &max_power, n_chains, MT76_SKU_RATE);
+
+	val = mt76_get_of_array_s8(np, "rates-mcs", &len,
+				   ARRAY_SIZE(dest->mcs[0]) + 1);
+	mt76_apply_multi_array_limit(dev, dest->mcs[0], ARRAY_SIZE(dest->mcs[0]),
+				     ARRAY_SIZE(dest->mcs), val, len, target_power,
+				     txs_delta, &max_power, n_chains, MT76_SKU_RATE);
+
+	val = mt76_get_of_array_s8(np, "rates-ru", &len,
+				   ARRAY_SIZE(dest->ru[0]) + 1);
+	mt76_apply_multi_array_limit(dev, dest->ru[0], ARRAY_SIZE(dest->ru[0]),
+				     ARRAY_SIZE(dest->ru), val, len, target_power,
+				     txs_delta, &max_power, n_chains, MT76_SKU_RATE);
+
+	val = mt76_get_of_array_s8(np, "paths-cck", &len,
+				   ARRAY_SIZE(dest->path.cck));
+	mt76_apply_array_limit(dev, dest->path.cck, ARRAY_SIZE(dest->path.cck), val,
+			       target_power, txs_delta, &max_power, n_chains, MT76_SKU_BACKOFF);
+
+	val = mt76_get_of_array_s8(np, "paths-ofdm", &len,
+				   ARRAY_SIZE(dest->path.ofdm));
+	mt76_apply_array_limit(dev, dest->path.ofdm, ARRAY_SIZE(dest->path.ofdm), val,
+			       target_power, txs_delta, &max_power, n_chains, MT76_SKU_BACKOFF);
+
+	val = mt76_get_of_array_s8(np, "paths-ofdm-bf", &len,
+				   ARRAY_SIZE(dest->path.ofdm_bf));
+	mt76_apply_array_limit(dev, dest->path.ofdm_bf, ARRAY_SIZE(dest->path.ofdm_bf), val,
+			       target_power, txs_delta, &max_power, n_chains,
+			       MT76_SKU_BACKOFF_BF_OFFSET);
+
+	val = mt76_get_of_array_s8(np, "paths-ru", &len,
+				   ARRAY_SIZE(dest->path.ru[0]) + 1);
+	mt76_apply_multi_array_limit(dev, dest->path.ru[0], ARRAY_SIZE(dest->path.ru[0]),
+				     ARRAY_SIZE(dest->path.ru), val, len, target_power,
+				     txs_delta, &max_power, n_chains, MT76_SKU_BACKOFF);
+
+	val = mt76_get_of_array_s8(np, "paths-ru-bf", &len,
+				   ARRAY_SIZE(dest->path.ru_bf[0]) + 1);
+	mt76_apply_multi_array_limit(dev, dest->path.ru_bf[0], ARRAY_SIZE(dest->path.ru_bf[0]),
+				     ARRAY_SIZE(dest->path.ru_bf), val, len, target_power,
+				     txs_delta, &max_power, n_chains, MT76_SKU_BACKOFF);
 
 	return max_power;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d05e83ea1..32876eab2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -540,7 +540,6 @@ struct mt76_driver_ops {
 	u32 survey_flags;
 	u16 txwi_size;
 	u16 token_size;
-	u8 mcs_rates;
 
 	unsigned int link_data_size;
 
-- 
2.45.2


