Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3350FD7235E
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jan 2026 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I63zytWXS2xebVsEuvN+V7iX4l5JRzMVnP73vhaBndE=; b=b/EYsj3RG5PgVGB/NMcRQj5v88
	avysKdwp6QRkH3c0u6Ws3WZIXdSlyt8c1+nw9yVpKW1/R4cB7F8qbS15iQ2yOmCZz12eeyOVTdnyA
	jE/nJwuF59HILHnPSs+ZByPQKMH9+rPI4lGNdj9pzHhKysX7RbZWzn9DLXLVM1rluHgCtH5EOM514
	bGnHLuncz/tuRGiBFtnSJWjSb4E+cBK6jEZGmzd8IpmfEYy18D8QH/tHhNfW+kvDLscvsSpSTHTLZ
	z672465wqTjvbmVAUIp3YgwrOwtEc1jezY/UwLMTeqh2caFFM+Ski6PjJArAyPXj6UqYXr6a90tUb
	iP8vhYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDX9-00000008aps-3yz0;
	Fri, 23 Jan 2026 09:32:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDX7-00000008apX-0z7S
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Jan 2026 09:32:50 +0000
X-UUID: 78ea1f18f83e11f0ad39f32c34db0b1c-20260123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=I63zytWXS2xebVsEuvN+V7iX4l5JRzMVnP73vhaBndE=;
	b=L9rw0n4RkCgnUfKbVbubJZk/Tou3A0Wd7CtMeGd37hsQ9fGZNYE6b1Qlq/AA6LZEpODACAvIc9W1Uy0qxIZZKSklrudwEURoHaUfd1LMd6qiZ3bG928g941EM8CKpQm5aXupN108Dx1XEgfLnJpkrxuDAmXwBz/pNMuT4YlJICQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:5a55a387-a967-48ce-abae-c8dd9ee51900,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:3471dbe8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 78ea1f18f83e11f0ad39f32c34db0b1c-20260123
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 34680566; Fri, 23 Jan 2026 02:32:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 23 Jan 2026 17:32:42 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 23 Jan 2026 17:32:41 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen Ye <allen.ye@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v1] wifi: mt76: fix backoff fields and max_power calculation
Date: Fri, 23 Jan 2026 01:32:34 -0800
Message-ID: <e92213f793f9cb9f509c26205e7ecb2be6ce77aa.1769156922.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_013249_304000_65CF3C5F 
X-CRM114-Status: GOOD (  16.81  )
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
Message-ID: <20260123093234.O7IRY3lpvbqRpVWrPJiQQ2NwesYdeii9Ep9i4zg-Hsk@z>

From: Allen Ye <allen.ye@mediatek.com>

The maximum power value may exist in data or backoff field.
To reponse the correct value of txpower, mt76 should also consider
these values in sku table.

Fixes: b05ab4be9fd7 (wifi: mt76: mt7915: add bf backoff limit table support)
Signed-off-by: Allen Ye <allen.ye@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v1 - add "wifi:" prefix into subject
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 171 +++++++++++++-------
 drivers/net/wireless/mediatek/mt76/mt76.h   |   1 -
 2 files changed, 113 insertions(+), 59 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 573400d57..3e182c8e0 100644
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
+	/* 0:1T1S, 1:2T1S, ..., 14:5T5S */
+	static const u8 connac3_table[] =
+		{1, 2, 3, 4, 5, 2, 3, 4, 5, 3, 4, 5, 4, 5, 5};
+	static const u8 connac2_table[] =
+		{1, 2, 3, 4, 2, 3, 4, 3, 4, 4, 0, 0, 0, 0, 0};
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
 
@@ -316,18 +337,50 @@ mt76_apply_array_limit(s8 *pwr, size_t pwr_len, const s8 *data,
 		return;
 
 	for (i = 0; i < pwr_len; i++) {
-		pwr[i] = min_t(s8, target_power, data[i] + nss_delta);
+		s8 backoff_delta, delta = mt76_tx_power_path_delta(n_chains);
+		int backoff_n_chains = 0;
+
+		switch (type) {
+		case MT76_SKU_RATE:
+			pwr[i] = min_t(s8, target_power, data[i] + nss_delta);
+			break;
+		case MT76_SKU_BACKOFF:
+			backoff_n_chains = mt76_backoff_n_chains(dev, i);
+			backoff_delta = mt76_tx_power_path_delta(backoff_n_chains);
+			pwr[i] = min_t(s8, target_power + delta - backoff_delta,
+				       data[i] + nss_delta);
+			break;
+		case MT76_SKU_BACKOFF_BF_OFFSET:
+			backoff_n_chains = mt76_backoff_n_chains(dev, i + 1);
+			backoff_delta = mt76_tx_power_path_delta(backoff_n_chains);
+			pwr[i] = min_t(s8, target_power + delta - backoff_delta,
+				       data[i] + nss_delta);
+			break;
+		default:
+			return;
+		}
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
 	int i, cur;
-	s8 max_power = -128;
+
+#define connac2_backoff_ru_idx	2
 
 	if (!data)
 		return;
@@ -337,8 +390,13 @@ mt76_apply_multi_array_limit(s8 *pwr, size_t pwr_len, s8 pwr_num,
 		if (len < pwr_len + 1)
 			break;
 
-		mt76_apply_array_limit(pwr + pwr_len * i, pwr_len, data + 1,
-				       target_power, nss_delta, &max_power);
+		if (!is_mt799x(dev) && type == MT76_SKU_BACKOFF &&
+		    i > connac2_backoff_ru_idx)
+			type = MT76_SKU_BACKOFF_BF_OFFSET;
+
+		mt76_apply_array_limit(dev, pwr + pwr_len * i, pwr_len, data + 1,
+				       target_power, nss_delta, max_power,
+				       n_chains, type);
 		if (--cur > 0)
 			continue;
 
@@ -360,18 +418,11 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
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
@@ -408,47 +459,51 @@ s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 
 	txs_delta = mt76_get_txs_delta(np, hweight16(phy->chainmask));
 
+#define __apply_array_limit(arr, type)						\
+	mt76_apply_array_limit(dev, (arr), ARRAY_SIZE(arr), val, target_power,	\
+			       txs_delta, &max_power, n_chains, type)
+
+#define __apply_multi_array_limit(arr, type)					\
+	mt76_apply_multi_array_limit(dev, (arr)[0], ARRAY_SIZE((arr)[0]),	\
+				     ARRAY_SIZE(arr), val, len, target_power,	\
+				     txs_delta, &max_power, n_chains, type)
+
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
+	__apply_array_limit(dest->cck, MT76_SKU_RATE);
+
+	val = mt76_get_of_array_s8(np, "rates-ofdm", &len, ARRAY_SIZE(dest->ofdm));
+	__apply_array_limit(dest->ofdm, MT76_SKU_RATE);
+
+	val = mt76_get_of_array_s8(np, "rates-mcs", &len,
+				   ARRAY_SIZE(dest->mcs[0]) + 1);
+	__apply_multi_array_limit(dest->mcs, MT76_SKU_RATE);
+
+	val = mt76_get_of_array_s8(np, "rates-ru", &len,
+				   ARRAY_SIZE(dest->ru[0]) + 1);
+	__apply_multi_array_limit(dest->ru, MT76_SKU_RATE);
+
+	val = mt76_get_of_array_s8(np, "paths-cck", &len,
+				   ARRAY_SIZE(dest->path.cck));
+	__apply_array_limit(dest->path.cck, MT76_SKU_BACKOFF);
+
+	val = mt76_get_of_array_s8(np, "paths-ofdm", &len,
+				   ARRAY_SIZE(dest->path.ofdm));
+	__apply_array_limit(dest->path.ofdm, MT76_SKU_BACKOFF);
+
+	val = mt76_get_of_array_s8(np, "paths-ofdm-bf", &len,
+				   ARRAY_SIZE(dest->path.ofdm_bf));
+	__apply_array_limit(dest->path.ofdm_bf, MT76_SKU_BACKOFF_BF_OFFSET);
+
+	val = mt76_get_of_array_s8(np, "paths-ru", &len,
+				   ARRAY_SIZE(dest->path.ru[0]) + 1);
+	__apply_multi_array_limit(dest->path.ru, MT76_SKU_BACKOFF);
+
+	val = mt76_get_of_array_s8(np, "paths-ru-bf", &len,
+				   ARRAY_SIZE(dest->path.ru_bf[0]) + 1);
+	__apply_multi_array_limit(dest->path.ru_bf, MT76_SKU_BACKOFF);
+
+#undef __apply_array_limit
+#undef __apply_multi_array_limit
 
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


