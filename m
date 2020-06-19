Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D118AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:05:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC27214F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 10:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UPM/sjnP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YgqgKrBh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FC27214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfhWY53ZDEe3P3vf5TjbHw9w9GJUS/XMyRqXFbJiTEs=; b=UPM/sjnPglLFd3
	ebTNncSe4bcJV010zp9EiG1JGikM6jZm463uDACIfTDf1vLTzaR+wSd2lv5NXZTO2XbC03kJd85iw
	d6hsIOdriOAHsmHZde1vtcMJry9YvdNXJmkkijxr82afRycNJYrSNVqGq8vMLm5eEyNDGdw9Jd4l/
	79xQ3QeAbLfR/PEKVJerN0zPHmtdydIuE51s8ANhjdF+n81gLBp3pGVN35Iicw9qJEU89nCCa4LwV
	dE2u/JLAIGVU4bUoUgG37UyJ+zys1U6UJ4hcPztDwUpEs92mbs13GZjQZoitGiN0dYhfcivp0M+T7
	YMAJTyq7FjGm619IxY3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmDtH-0005EU-5Y; Fri, 19 Jun 2020 10:04:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmDtC-0005CB-BU
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 10:04:52 +0000
X-UUID: 9a3ec11614bf4f67a7c380e21fb05a46-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RWMBjLTAHogLmaYom2+5yuOBVTftf0/SlrT9D9BDL1k=; 
 b=YgqgKrBhPLYJYzWXQKYVhYi7NvrMgzXqNLNwR2v1E89sO7Qzov3cxGzIu1Oj8ZXoMgd7c+IGm+c1ZKajFVhbiE5WGPtGwyY7Nm7xM8wv/eVqH062vxdFZB6nk3PSUenSpvKoxtfKuHI/r+IchAvQcu7zfQWMRexug9gkCNHym7I=;
X-UUID: 9a3ec11614bf4f67a7c380e21fb05a46-20200619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1036992362; Fri, 19 Jun 2020 02:04:37 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 03:04:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 18:04:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Jun 2020 18:04:34 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v3 2/3] mt76: mt7915: rework the flow of txpower setting
Date: Fri, 19 Jun 2020 18:04:24 +0800
Message-ID: <20200619100425.26351-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200619100425.26351-1-shayne.chen@mediatek.com>
References: <20200619100425.26351-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C0511DB765AEC55301A45F043D1B27EB85494AB8F95EC0A6E9B9CDB0897A245C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_030450_403323_CDFDBD16 
X-CRM114-Status: GOOD (  11.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Clean up the flow of per-rate txpower limit setting to get rid of
dulplicate work since it has already been handled by firmware, and set
proper max_power based on different channels and regdomains.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |  34 ++---
 .../wireless/mediatek/mt76/mt7915/eeprom.c    | 138 ++++--------------
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  40 +----
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  32 ++--
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   2 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  29 ++--
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  10 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  25 ----
 8 files changed, 79 insertions(+), 231 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 5278bee..73a48c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -300,8 +300,7 @@ mt7915_queues_read(struct seq_file *s, void *data)
 }
 
 static void
-mt7915_puts_rate_txpower(struct seq_file *s, s8 *delta,
-			 s8 txpower_cur, int band)
+mt7915_puts_rate_txpower(struct seq_file *s, s8 txpower_cur, int band)
 {
 	static const char * const sku_group_name[] = {
 		"CCK", "OFDM", "HT20", "HT40",
@@ -309,24 +308,18 @@ mt7915_puts_rate_txpower(struct seq_file *s, s8 *delta,
 		"RU26", "RU52", "RU106", "RU242/SU20",
 		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
 	};
-	s8 txpower[MT7915_SKU_RATE_NUM];
+	s8 txpower[161];
 	int i, idx = 0;
 
-	for (i = 0; i < MT7915_SKU_RATE_NUM; i++)
-		txpower[i] = DIV_ROUND_UP(txpower_cur + delta[i], 2);
+	for (i = 0; i < ARRAY_SIZE(txpower); i++)
+		txpower[i] = DIV_ROUND_UP(txpower_cur, 2);
 
-	for (i = 0; i < MAX_SKU_RATE_GROUP_NUM; i++) {
-		const struct sku_group *sku = &mt7915_sku_groups[i];
-		u32 offset = sku->offset[band];
-
-		if (!offset) {
-			idx += sku->len;
-			continue;
-		}
+	for (i = 0; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
+		u8 len = mt7915_sku_group_len[i];
 
 		mt76_seq_puts_array(s, sku_group_name[i],
-				    txpower + idx, sku->len);
-		idx += sku->len;
+				    txpower + idx, len);
+		idx += len;
 	}
 }
 
@@ -336,21 +329,18 @@ mt7915_read_rate_txpower(struct seq_file *s, void *data)
 	struct mt7915_dev *dev = dev_get_drvdata(s->private);
 	struct mt76_phy *mphy = &dev->mphy;
 	enum nl80211_band band = mphy->chandef.chan->band;
-	s8 *delta = dev->rate_power[band];
-	s8 txpower_base = mphy->txpower_cur - delta[MT7915_SKU_MAX_DELTA_IDX];
+	s8 txpower = mphy->txpower_cur;
 
 	seq_puts(s, "Band 0:\n");
-	mt7915_puts_rate_txpower(s, delta, txpower_base, band);
+	mt7915_puts_rate_txpower(s, txpower, band);
 
 	if (dev->mt76.phy2) {
 		mphy = dev->mt76.phy2;
 		band = mphy->chandef.chan->band;
-		delta = dev->rate_power[band];
-		txpower_base = mphy->txpower_cur -
-			       delta[MT7915_SKU_MAX_DELTA_IDX];
+		txpower = mphy->txpower_cur;
 
 		seq_puts(s, "Band 1:\n");
-		mt7915_puts_rate_txpower(s, delta, txpower_base, band);
+		mt7915_puts_rate_txpower(s, txpower, band);
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 7deba7e..debacfd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -124,120 +124,38 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 	return mt7915_eeprom_read(dev, index);
 }
 
-static const u8 sku_cck_delta_map[] = {
-	SKU_CCK_GROUP0,
-	SKU_CCK_GROUP0,
-	SKU_CCK_GROUP1,
-	SKU_CCK_GROUP1,
-};
-
-static const u8 sku_ofdm_delta_map[] = {
-	SKU_OFDM_GROUP0,
-	SKU_OFDM_GROUP0,
-	SKU_OFDM_GROUP1,
-	SKU_OFDM_GROUP1,
-	SKU_OFDM_GROUP2,
-	SKU_OFDM_GROUP2,
-	SKU_OFDM_GROUP3,
-	SKU_OFDM_GROUP4,
-};
-
-static const u8 sku_mcs_delta_map[] = {
-	SKU_MCS_GROUP0,
-	SKU_MCS_GROUP1,
-	SKU_MCS_GROUP1,
-	SKU_MCS_GROUP2,
-	SKU_MCS_GROUP2,
-	SKU_MCS_GROUP3,
-	SKU_MCS_GROUP4,
-	SKU_MCS_GROUP5,
-	SKU_MCS_GROUP6,
-	SKU_MCS_GROUP7,
-	SKU_MCS_GROUP8,
-	SKU_MCS_GROUP9,
-};
-
-#define SKU_GROUP(_mode, _len, _ofs_2g, _ofs_5g, _map)	\
-	[_mode] = {					\
-	.len = _len,					\
-	.offset = {					\
-		_ofs_2g,				\
-		_ofs_5g,				\
-	},						\
-	.delta_map = _map				\
-}
-
-const struct sku_group mt7915_sku_groups[] = {
-	SKU_GROUP(SKU_CCK, 4, 0x252, 0, sku_cck_delta_map),
-	SKU_GROUP(SKU_OFDM, 8, 0x254, 0x29d, sku_ofdm_delta_map),
-
-	SKU_GROUP(SKU_HT_BW20, 8, 0x259, 0x2a2, sku_mcs_delta_map),
-	SKU_GROUP(SKU_HT_BW40, 9, 0x262, 0x2ab, sku_mcs_delta_map),
-	SKU_GROUP(SKU_VHT_BW20, 12, 0x259, 0x2a2, sku_mcs_delta_map),
-	SKU_GROUP(SKU_VHT_BW40, 12, 0x262, 0x2ab, sku_mcs_delta_map),
-	SKU_GROUP(SKU_VHT_BW80, 12, 0, 0x2b4, sku_mcs_delta_map),
-	SKU_GROUP(SKU_VHT_BW160, 12, 0, 0, sku_mcs_delta_map),
-
-	SKU_GROUP(SKU_HE_RU26, 12, 0x27f, 0x2dd, sku_mcs_delta_map),
-	SKU_GROUP(SKU_HE_RU52, 12, 0x289, 0x2e7, sku_mcs_delta_map),
-	SKU_GROUP(SKU_HE_RU106, 12, 0x293, 0x2f1, sku_mcs_delta_map),
-	SKU_GROUP(SKU_HE_RU242, 12, 0x26b, 0x2bf, sku_mcs_delta_map),
-	SKU_GROUP(SKU_HE_RU484, 12, 0x275, 0x2c9, sku_mcs_delta_map),
-	SKU_GROUP(SKU_HE_RU996, 12, 0, 0x2d3, sku_mcs_delta_map),
-	SKU_GROUP(SKU_HE_RU2x996, 12, 0, 0, sku_mcs_delta_map),
-};
-
-static s8
-mt7915_get_sku_delta(struct mt7915_dev *dev, u32 addr)
+s8 mt7915_eeprom_get_power_delta(struct mt7915_dev *dev, int band)
 {
-	u32 val = mt7915_eeprom_read(dev, addr);
-	s8 delta = FIELD_GET(SKU_DELTA_VAL, val);
+	u32 val;
+	s8 delta;
+
+	if (band == NL80211_BAND_2GHZ)
+		val = mt7915_eeprom_read(dev, MT_EE_RATE_DELTA_2G);
+	else
+		val = mt7915_eeprom_read(dev, MT_EE_RATE_DELTA_5G);
 
-	if (!(val & SKU_DELTA_EN))
+	if (!(val & MT_EE_RATE_DELTA_EN))
 		return 0;
 
-	return val & SKU_DELTA_ADD ? delta : -delta;
-}
+	delta = FIELD_GET(MT_EE_RATE_DELTA_MASK, val);
 
-static void
-mt7915_eeprom_init_sku_band(struct mt7915_dev *dev,
-			    struct ieee80211_supported_band *sband)
-{
-	int i, band = sband->band;
-	s8 *rate_power = dev->rate_power[band], max_delta = 0;
-	u8 idx = 0;
-
-	for (i = 0; i < ARRAY_SIZE(mt7915_sku_groups); i++) {
-		const struct sku_group *sku = &mt7915_sku_groups[i];
-		u32 offset = sku->offset[band];
-		int j;
-
-		if (!offset) {
-			idx += sku->len;
-			continue;
-		}
-
-		rate_power[idx++] = mt7915_get_sku_delta(dev, offset);
-		if (rate_power[idx - 1] > max_delta)
-			max_delta = rate_power[idx - 1];
-
-		if (i == SKU_HT_BW20 || i == SKU_VHT_BW20)
-			offset += 1;
-
-		for (j = 1; j < sku->len; j++) {
-			u32 addr = offset + sku->delta_map[j];
-
-			rate_power[idx++] = mt7915_get_sku_delta(dev, addr);
-			if (rate_power[idx - 1] > max_delta)
-				max_delta = rate_power[idx - 1];
-		}
-	}
-
-	rate_power[idx] = max_delta;
+	return val & MT_EE_RATE_DELTA_SIGN ? delta : -delta;
 }
 
-void mt7915_eeprom_init_sku(struct mt7915_dev *dev)
-{
-	mt7915_eeprom_init_sku_band(dev, &dev->mphy.sband_2g.sband);
-	mt7915_eeprom_init_sku_band(dev, &dev->mphy.sband_5g.sband);
-}
+const u8 mt7915_sku_group_len[] = {
+	[SKU_CCK] = 4,
+	[SKU_OFDM] = 8,
+	[SKU_HT_BW20] = 8,
+	[SKU_HT_BW40] = 9,
+	[SKU_VHT_BW20] = 12,
+	[SKU_VHT_BW40] = 12,
+	[SKU_VHT_BW80] = 12,
+	[SKU_VHT_BW160] = 12,
+	[SKU_HE_RU26] = 12,
+	[SKU_HE_RU52] = 12,
+	[SKU_HE_RU106] = 12,
+	[SKU_HE_RU242] = 12,
+	[SKU_HE_RU484] = 12,
+	[SKU_HE_RU996] = 12,
+	[SKU_HE_RU2x996] = 12
+};
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 4e31d6a..77cec51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -17,6 +17,8 @@ enum mt7915_eeprom_field {
 	MT_EE_MAC_ADDR =	0x004,
 	MT_EE_DDIE_FT_VERSION =	0x050,
 	MT_EE_WIFI_CONF =	0x190,
+	MT_EE_RATE_DELTA_2G =	0x252,
+	MT_EE_RATE_DELTA_5G =	0x29d,
 	MT_EE_TX0_POWER_2G =	0x2fc,
 	MT_EE_TX0_POWER_5G =	0x34b,
 	MT_EE_ADIE_FT_VERSION =	0x9a0,
@@ -30,6 +32,10 @@ enum mt7915_eeprom_field {
 #define MT_EE_WIFI_CONF_TSSI0_5G		BIT(2)
 #define MT_EE_WIFI_CONF_TSSI1_5G		BIT(4)
 
+#define MT_EE_RATE_DELTA_MASK			GENMASK(5, 0)
+#define MT_EE_RATE_DELTA_SIGN			BIT(6)
+#define MT_EE_RATE_DELTA_EN			BIT(7)
+
 enum mt7915_eeprom_band {
 	MT_EE_DUAL_BAND,
 	MT_EE_5GHZ,
@@ -37,32 +43,6 @@ enum mt7915_eeprom_band {
 	MT_EE_DBDC,
 };
 
-#define SKU_DELTA_VAL		GENMASK(5, 0)
-#define SKU_DELTA_ADD		BIT(6)
-#define SKU_DELTA_EN		BIT(7)
-
-enum mt7915_sku_delta_group {
-	SKU_CCK_GROUP0,
-	SKU_CCK_GROUP1,
-
-	SKU_OFDM_GROUP0 = 0,
-	SKU_OFDM_GROUP1,
-	SKU_OFDM_GROUP2,
-	SKU_OFDM_GROUP3,
-	SKU_OFDM_GROUP4,
-
-	SKU_MCS_GROUP0 = 0,
-	SKU_MCS_GROUP1,
-	SKU_MCS_GROUP2,
-	SKU_MCS_GROUP3,
-	SKU_MCS_GROUP4,
-	SKU_MCS_GROUP5,
-	SKU_MCS_GROUP6,
-	SKU_MCS_GROUP7,
-	SKU_MCS_GROUP8,
-	SKU_MCS_GROUP9,
-};
-
 enum mt7915_sku_rate_group {
 	SKU_CCK,
 	SKU_OFDM,
@@ -82,12 +62,6 @@ enum mt7915_sku_rate_group {
 	MAX_SKU_RATE_GROUP_NUM,
 };
 
-struct sku_group {
-	u8 len;
-	u16 offset[2];
-	const u8 *delta_map;
-};
-
 static inline int
 mt7915_get_channel_group(int channel)
 {
@@ -120,6 +94,6 @@ mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
 		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF_TSSI0_2G;
 }
 
-extern const struct sku_group mt7915_sku_groups[];
+extern const u8 mt7915_sku_group_len[MAX_SKU_RATE_GROUP_NUM];
 
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index aadf56e..50763ab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -77,10 +77,13 @@ static int mt7915_txbf_init(struct mt7915_dev *dev)
 }
 
 static void
-mt7915_init_txpower_band(struct mt7915_dev *dev,
-			 struct ieee80211_supported_band *sband)
+mt7915_init_txpower(struct mt7915_dev *dev,
+		    struct ieee80211_supported_band *sband)
 {
 	int i, n_chains = hweight8(dev->mphy.antenna_mask);
+	int nss_delta = mt76_tx_power_nss_delta(n_chains);
+	int pwr_delta = mt7915_eeprom_get_power_delta(dev, sband->band);
+	struct mt76_power_limits limits;
 
 	for (i = 0; i < sband->n_channels; i++) {
 		struct ieee80211_channel *chan = &sband->channels[i];
@@ -94,20 +97,18 @@ mt7915_init_txpower_band(struct mt7915_dev *dev,
 			target_power = max(target_power, val);
 		}
 
+		target_power += pwr_delta;
+		target_power = mt76_get_rate_power_limits(&dev->mphy, chan,
+							  &limits,
+							  target_power);
+		target_power += nss_delta;
+		target_power = DIV_ROUND_UP(target_power, 2);
 		chan->max_power = min_t(int, chan->max_reg_power,
-					target_power / 2);
-		chan->orig_mpwr = target_power / 2;
+					target_power);
+		chan->orig_mpwr = target_power;
 	}
 }
 
-static void mt7915_init_txpower(struct mt7915_dev *dev)
-{
-	mt7915_init_txpower_band(dev, &dev->mphy.sband_2g.sband);
-	mt7915_init_txpower_band(dev, &dev->mphy.sband_5g.sband);
-
-	mt7915_eeprom_init_sku(dev);
-}
-
 static void mt7915_init_work(struct work_struct *work)
 {
 	struct mt7915_dev *dev = container_of(work, struct mt7915_dev,
@@ -115,7 +116,8 @@ static void mt7915_init_work(struct work_struct *work)
 
 	mt7915_mcu_set_eeprom(dev);
 	mt7915_mac_init(dev);
-	mt7915_init_txpower(dev);
+	mt7915_init_txpower(dev, &dev->mphy.sband_2g.sband);
+	mt7915_init_txpower(dev, &dev->mphy.sband_5g.sband);
 	mt7915_txbf_init(dev);
 }
 
@@ -224,8 +226,12 @@ mt7915_regd_notifier(struct wiphy *wiphy,
 	struct mt7915_phy *phy = mphy->priv;
 	struct cfg80211_chan_def *chandef = &mphy->chandef;
 
+	memcpy(dev->mt76.alpha2, request->alpha2, sizeof(dev->mt76.alpha2));
 	dev->mt76.region = request->dfs_region;
 
+	mt7915_init_txpower(dev, &mphy->sband_2g.sband);
+	mt7915_init_txpower(dev, &mphy->sband_5g.sband);
+
 	if (!(chandef->chan->flags & IEEE80211_CHAN_RADAR))
 		return;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 05b5650..1780df1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -325,7 +325,7 @@ static int mt7915_config(struct ieee80211_hw *hw, u32 changed)
 	}
 
 	if (changed & IEEE80211_CONF_CHANGE_POWER) {
-		ret = mt7915_mcu_set_sku(phy);
+		ret = mt7915_mcu_set_txpower_sku(phy);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 98de2f6..08004a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3054,8 +3054,9 @@ int mt7915_mcu_get_rate_info(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx)
 				   sizeof(req), false);
 }
 
-int mt7915_mcu_set_sku(struct mt7915_phy *phy)
+int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy)
 {
+#define MT7915_SKU_RATE_NUM		161
 	struct mt7915_dev *dev = phy->dev;
 	struct mt76_phy *mphy = phy->mt76;
 	struct ieee80211_hw *hw = mphy->hw;
@@ -3069,11 +3070,10 @@ int mt7915_mcu_set_sku(struct mt7915_phy *phy)
 		.dbdc_idx = phy != &dev->phy,
 	};
 	struct mt76_power_limits limits_array;
-	s8 *delta, *la = (s8 *)&limits_array;
+	s8 *la = (s8 *)&limits_array;
 	int i, idx, n_chains = hweight8(mphy->antenna_mask);
 	int tx_power;
 
-	delta = dev->rate_power[mphy->chandef.chan->band];
 	tx_power = hw->conf.power_level * 2 -
 		   mt76_tx_power_nss_delta(n_chains);
 
@@ -3081,10 +3081,8 @@ int mt7915_mcu_set_sku(struct mt7915_phy *phy)
 					      &limits_array, tx_power);
 	mphy->txpower_cur = tx_power;
 
-	for (i = 0, idx = 0; i < MAX_SKU_RATE_GROUP_NUM; i++) {
-		const struct sku_group *sku = &mt7915_sku_groups[i];
-		u32 offset = sku->offset[mphy->chandef.chan->band];
-		u8 mcs_num = sku->len;
+	for (i = 0, idx = 0; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
+		u8 mcs_num, len = mt7915_sku_group_len[i];
 		int j;
 
 		if (i >= SKU_HT_BW20 && i <= SKU_VHT_BW160) {
@@ -3092,22 +3090,15 @@ int mt7915_mcu_set_sku(struct mt7915_phy *phy)
 
 			if (i == SKU_HT_BW20 || i == SKU_VHT_BW20)
 				la = (s8 *)&limits_array + 12;
+		} else {
+			mcs_num = len;
 		}
 
-		if (!offset) {
-			idx += sku->len;
-			la += mcs_num;
-			continue;
-		}
-
-		for (j = 0; j < min_t(u8, mcs_num, sku->len); j++) {
-			s8 rate_power;
+		for (j = 0; j < min_t(u8, mcs_num, len); j++)
+			req.val[idx + j] = la[j];
 
-			rate_power = hw->conf.power_level * 2 + delta[idx + j];
-			req.val[idx + j] = min_t(s8, la[j], rate_power);
-		}
 		la += mcs_num;
-		idx += sku->len;
+		idx += len;
 	}
 
 	return __mt76_mcu_send_msg(&dev->mt76,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 85d74ec..851e9bf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -38,10 +38,6 @@
 #define MT7915_5G_RATE_DEFAULT		0x4b	/* OFDM 6M */
 #define MT7915_2G_RATE_DEFAULT		0x0	/* CCK 1M */
 
-#define MT7915_SKU_RATE_NUM		161
-#define MT7915_SKU_MAX_DELTA_IDX	MT7915_SKU_RATE_NUM
-#define MT7915_SKU_TABLE_SIZE		(MT7915_SKU_RATE_NUM + 1)
-
 struct mt7915_vif;
 struct mt7915_sta;
 struct mt7915_dfs_pulse;
@@ -169,8 +165,6 @@ struct mt7915_dev {
 	spinlock_t token_lock;
 	struct idr token;
 
-	s8 **rate_power; /* TODO: use mt76_rate_power */
-
 	bool fw_debug;
 };
 
@@ -277,7 +271,7 @@ u32 mt7915_eeprom_read(struct mt7915_dev *dev, u32 offset);
 int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 				   struct ieee80211_channel *chan,
 				   u8 chain_idx);
-void mt7915_eeprom_init_sku(struct mt7915_dev *dev);
+s8 mt7915_eeprom_get_power_delta(struct mt7915_dev *dev, int band);
 int mt7915_dma_init(struct mt7915_dev *dev);
 void mt7915_dma_prefetch(struct mt7915_dev *dev);
 void mt7915_dma_cleanup(struct mt7915_dev *dev);
@@ -320,7 +314,7 @@ int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band);
 int mt7915_mcu_set_rts_thresh(struct mt7915_phy *phy, u32 val);
 int mt7915_mcu_set_pm(struct mt7915_dev *dev, int band, int enter);
 int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
-int mt7915_mcu_set_sku(struct mt7915_phy *phy);
+int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy);
 int mt7915_mcu_set_txbf_type(struct mt7915_dev *dev);
 int mt7915_mcu_set_txbf_sounding(struct mt7915_dev *dev);
 int mt7915_mcu_set_fcc5_lpn(struct mt7915_dev *dev, int val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 7937c69..b79b506 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -75,28 +75,6 @@ static irqreturn_t mt7915_irq_handler(int irq, void *dev_instance)
 	return IRQ_HANDLED;
 }
 
-static int
-mt7915_alloc_device(struct pci_dev *pdev, struct mt7915_dev *dev)
-{
-#define NUM_BANDS	2
-	int i;
-	s8 **sku;
-
-	sku = devm_kzalloc(&pdev->dev, NUM_BANDS * sizeof(*sku), GFP_KERNEL);
-	if (!sku)
-		return -ENOMEM;
-
-	for (i = 0; i < NUM_BANDS; i++) {
-		sku[i] = devm_kzalloc(&pdev->dev, MT7915_SKU_TABLE_SIZE *
-				      sizeof(**sku), GFP_KERNEL);
-		if (!sku[i])
-			return -ENOMEM;
-	}
-	dev->rate_power = sku;
-
-	return 0;
-}
-
 static int mt7915_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -140,9 +118,6 @@ static int mt7915_pci_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	dev = container_of(mdev, struct mt7915_dev, mt76);
-	ret = mt7915_alloc_device(pdev, dev);
-	if (ret)
-		return ret;
 
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	mdev->rev = (mt7915_l1_rr(dev, MT_HW_CHIPID) << 16) |
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
