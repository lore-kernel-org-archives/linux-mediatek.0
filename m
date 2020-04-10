Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E13C2BB55
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 09:05:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6272C206F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 09:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aX55UyCh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Hg9pZads"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6272C206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQ5r87f8IkRosFcC6QziwnxxjCTG02ocnh8Zjoa+HeE=; b=aX55UyCh+vTzY3
	nLXr4swNIStX/XaV596SywftjtaZeAWF8vzxFA6ldLYuNjjLJsS9oPevNSjRi99iaTLFEtjN/5TyG
	N2UoA6xloUR7zxpvygNhMPhm0B3nQRG9ZbgE6Q8Syt1fNRcBJtIH56rjjif30bMtINMHZBLSuoxKm
	EE/W13fQiuYUVRmPYklyOUjSbs/ji3F8qqR95ofwGe6/ZRkYIiLqrLxt1zKAA1fcVWfy2NGEcK/0S
	nCgWNLy+jhKw8ikZY+cpQKFJJ5EF6GIFRYPMTsSlsg/TWoIpjhGtdzuAmGiwKcdolfUmJHGH31nDp
	26/Vkrjke5+jocx52fqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMpbG-0008AA-Cy; Fri, 10 Apr 2020 09:05:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMpbA-00081a-R5
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 09:05:19 +0000
X-UUID: 1b6b3e6b78eb4aa98cfd54daca3e9d80-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lcRSBm2Qn6zLQZp4CLET2NDgyS8tMHUGD+d1o/f5bOM=; 
 b=Hg9pZadsBZy85InfvVcaXKVy+zyCiA2WCO3U4IQ9N2aU+msOHdJ4i79ehuw6LZWKbSNXGQMxZJ47X/TouTu7q1o9ztLD1+eDWpjQmCEW1sQQGRuKf9vIoF8F+yaz/h1+9wMDVouUmL9sdv/zmRb/hbuTeuFrRO+1acMoe4DBfrc=;
X-UUID: 1b6b3e6b78eb4aa98cfd54daca3e9d80-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1718594927; Fri, 10 Apr 2020 01:05:06 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 01:55:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 16:54:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Apr 2020 16:54:57 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 07/16] mt76: mt7915: implement HE per-rate tx power support
Date: Fri, 10 Apr 2020 16:54:44 +0800
Message-ID: <44776fec051db7ef48785046658946eaf553cd18.1586507878.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586507878.git.ryder.lee@mediatek.com>
References: <cover.1586507878.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E21AE195C7B3B0582B79215EF17D2769D3183252E033B9999B426719721AEC0F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_020516_938508_E5D042E7 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use firmware support for applying per-rate limit and power offsets.
This can support all HE RU types.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Chih-Min Chen <chih-min.chen@mediatek.com>
Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Acked-by: Yiwei Chung <yiwei.chung@mediatek.com>
Acked-by: YF Luo <yf.luo@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |  56 +++++++++
 .../wireless/mediatek/mt76/mt7915/eeprom.c    | 111 ++++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  47 ++++++++
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   7 ++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  49 ++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   1 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   6 +
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  26 ++++
 9 files changed, 305 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 152ae0617f3d..34df2d8cdb8f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -219,6 +219,60 @@ mt7915_queues_read(struct seq_file *s, void *data)
 	return 0;
 }
 
+static void
+mt7915_puts_rate_txpower(struct seq_file *s, s8 *delta,
+			 s8 txpower_cur, int band)
+{
+	static const char * const sku_group_name[] = {
+		"CCK", "OFDM", "HT20", "HT40",
+		"VHT20", "VHT40", "VHT80", "VHT160",
+		"RU26", "RU52", "RU106", "RU242/SU20",
+		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
+	};
+	s8 txpower[MT7915_SKU_RATE_NUM];
+	int i, idx = 0;
+
+	for (i = 0; i < MT7915_SKU_RATE_NUM; i++)
+		txpower[i] = txpower_cur + delta[i] / 2;
+
+	for (i = 0; i < MAX_SKU_RATE_GROUP_NUM; i++) {
+		const struct sku_group *sku = &mt7915_sku_groups[i];
+		u32 offset = sku->offset[band];
+
+		if (!offset) {
+			idx += sku->len;
+			continue;
+		}
+
+		mt76_seq_puts_array(s, sku_group_name[i],
+				    txpower + idx, sku->len);
+		idx += sku->len;
+	}
+}
+
+static int
+mt7915_read_rate_txpower(struct seq_file *s, void *data)
+{
+	struct mt7915_dev *dev = dev_get_drvdata(s->private);
+	struct mt76_phy *mphy = &dev->mphy;
+	enum nl80211_band band = mphy->chandef.chan->band;
+	s8 *delta = dev->rate_power[band];
+
+	seq_puts(s, "Band 0:\n");
+	mt7915_puts_rate_txpower(s, delta, mphy->txpower_cur, band);
+
+	if (dev->mt76.phy2) {
+		mphy = dev->mt76.phy2;
+		band = mphy->chandef.chan->band;
+		delta = dev->rate_power[band];
+
+		seq_puts(s, "Band 1:\n");
+		mt7915_puts_rate_txpower(s, delta, mphy->txpower_cur, band);
+	}
+
+	return 0;
+}
+
 int mt7915_init_debugfs(struct mt7915_dev *dev)
 {
 	struct dentry *dir;
@@ -240,6 +294,8 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 	debugfs_create_file("ser_trigger", 0200, dir, dev, &fops_ser_trigger);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "temperature", dir,
 				    mt7915_read_temperature);
+	debugfs_create_devm_seqfile(dev->mt76.dev, "txpower_sku", dir,
+				    mt7915_read_rate_txpower);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 2099dd40530f..52706968bf6a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -123,3 +123,114 @@ int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 
 	return mt7915_eeprom_read(dev, index);
 }
+
+static const u8 sku_cck_delta_map[] = {
+	SKU_CCK_GROUP0,
+	SKU_CCK_GROUP0,
+	SKU_CCK_GROUP1,
+	SKU_CCK_GROUP1,
+};
+
+static const u8 sku_ofdm_delta_map[] = {
+	SKU_OFDM_GROUP0,
+	SKU_OFDM_GROUP0,
+	SKU_OFDM_GROUP1,
+	SKU_OFDM_GROUP1,
+	SKU_OFDM_GROUP2,
+	SKU_OFDM_GROUP2,
+	SKU_OFDM_GROUP3,
+	SKU_OFDM_GROUP4,
+};
+
+static const u8 sku_mcs_delta_map[] = {
+	SKU_MCS_GROUP0,
+	SKU_MCS_GROUP1,
+	SKU_MCS_GROUP1,
+	SKU_MCS_GROUP2,
+	SKU_MCS_GROUP2,
+	SKU_MCS_GROUP3,
+	SKU_MCS_GROUP4,
+	SKU_MCS_GROUP5,
+	SKU_MCS_GROUP6,
+	SKU_MCS_GROUP7,
+	SKU_MCS_GROUP8,
+	SKU_MCS_GROUP9,
+};
+
+#define SKU_GROUP(_mode, _len, _ofs_2g, _ofs_5g, _map)	\
+	[_mode] = {					\
+	.len = _len,					\
+	.offset = {					\
+		_ofs_2g,				\
+		_ofs_5g,				\
+	},						\
+	.delta_map = _map				\
+}
+
+const struct sku_group mt7915_sku_groups[] = {
+	SKU_GROUP(SKU_CCK, 4, 0x252, 0, sku_cck_delta_map),
+	SKU_GROUP(SKU_OFDM, 8, 0x254, 0x29d, sku_ofdm_delta_map),
+
+	SKU_GROUP(SKU_HT_BW20, 8, 0x259, 0x2a2, sku_mcs_delta_map),
+	SKU_GROUP(SKU_HT_BW40, 9, 0x262, 0x2ab, sku_mcs_delta_map),
+	SKU_GROUP(SKU_VHT_BW20, 12, 0x259, 0x2a2, sku_mcs_delta_map),
+	SKU_GROUP(SKU_VHT_BW40, 12, 0x262, 0x2ab, sku_mcs_delta_map),
+	SKU_GROUP(SKU_VHT_BW80, 12, 0, 0x2b4, sku_mcs_delta_map),
+	SKU_GROUP(SKU_VHT_BW160, 12, 0, 0, sku_mcs_delta_map),
+
+	SKU_GROUP(SKU_HE_RU26, 12, 0x27f, 0x2dd, sku_mcs_delta_map),
+	SKU_GROUP(SKU_HE_RU52, 12, 0x289, 0x2e7, sku_mcs_delta_map),
+	SKU_GROUP(SKU_HE_RU106, 12, 0x293, 0x2f1, sku_mcs_delta_map),
+	SKU_GROUP(SKU_HE_RU242, 12, 0x26b, 0x2bf, sku_mcs_delta_map),
+	SKU_GROUP(SKU_HE_RU484, 12, 0x275, 0x2c9, sku_mcs_delta_map),
+	SKU_GROUP(SKU_HE_RU996, 12, 0, 0x2d3, sku_mcs_delta_map),
+	SKU_GROUP(SKU_HE_RU2x996, 12, 0, 0, sku_mcs_delta_map),
+};
+
+static s8
+mt7915_get_sku_delta(struct mt7915_dev *dev, u32 addr)
+{
+	u32 val = mt7915_eeprom_read(dev, addr);
+	s8 delta = FIELD_GET(SKU_DELTA_VAL, val);
+
+	if (!(val & SKU_DELTA_EN))
+		return 0;
+
+	return val & SKU_DELTA_ADD ? delta : -delta;
+}
+
+static void
+mt7915_eeprom_init_sku_band(struct mt7915_dev *dev,
+			    struct ieee80211_supported_band *sband)
+{
+	int i, band = sband->band;
+	s8 *rate_power = dev->rate_power[band];
+	u8 idx = 0;
+
+	for (i = 0; i < ARRAY_SIZE(mt7915_sku_groups); i++) {
+		const struct sku_group *sku = &mt7915_sku_groups[i];
+		u32 offset = sku->offset[band];
+		int j;
+
+		if (!offset) {
+			idx += sku->len;
+			continue;
+		}
+
+		rate_power[idx++] = mt7915_get_sku_delta(dev, offset);
+		if (i == SKU_HT_BW20 || i == SKU_VHT_BW20)
+			offset += 1;
+
+		for (j = 1; j < sku->len; j++) {
+			u32 addr = offset + sku->delta_map[j];
+
+			rate_power[idx++] = mt7915_get_sku_delta(dev, addr);
+		}
+	}
+}
+
+void mt7915_eeprom_init_sku(struct mt7915_dev *dev)
+{
+	mt7915_eeprom_init_sku_band(dev, &dev->mphy.sband_2g.sband);
+	mt7915_eeprom_init_sku_band(dev, &dev->mphy.sband_5g.sband);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 30fc607e466d..4e31d6ab4fa6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -37,6 +37,51 @@ enum mt7915_eeprom_band {
 	MT_EE_DBDC,
 };
 
+#define SKU_DELTA_VAL		GENMASK(5, 0)
+#define SKU_DELTA_ADD		BIT(6)
+#define SKU_DELTA_EN		BIT(7)
+
+enum mt7915_sku_delta_group {
+	SKU_CCK_GROUP0,
+	SKU_CCK_GROUP1,
+
+	SKU_OFDM_GROUP0 = 0,
+	SKU_OFDM_GROUP1,
+	SKU_OFDM_GROUP2,
+	SKU_OFDM_GROUP3,
+	SKU_OFDM_GROUP4,
+
+	SKU_MCS_GROUP0 = 0,
+	SKU_MCS_GROUP1,
+	SKU_MCS_GROUP2,
+	SKU_MCS_GROUP3,
+	SKU_MCS_GROUP4,
+	SKU_MCS_GROUP5,
+	SKU_MCS_GROUP6,
+	SKU_MCS_GROUP7,
+	SKU_MCS_GROUP8,
+	SKU_MCS_GROUP9,
+};
+
+enum mt7915_sku_rate_group {
+	SKU_CCK,
+	SKU_OFDM,
+	SKU_HT_BW20,
+	SKU_HT_BW40,
+	SKU_VHT_BW20,
+	SKU_VHT_BW40,
+	SKU_VHT_BW80,
+	SKU_VHT_BW160,
+	SKU_HE_RU26,
+	SKU_HE_RU52,
+	SKU_HE_RU106,
+	SKU_HE_RU242,
+	SKU_HE_RU484,
+	SKU_HE_RU996,
+	SKU_HE_RU2x996,
+	MAX_SKU_RATE_GROUP_NUM,
+};
+
 struct sku_group {
 	u8 len;
 	u16 offset[2];
@@ -75,4 +120,6 @@ mt7915_tssi_enabled(struct mt7915_dev *dev, enum nl80211_band band)
 		return eep[MT_EE_WIFI_CONF + 7] & MT_EE_WIFI_CONF_TSSI0_2G;
 }
 
+extern const struct sku_group mt7915_sku_groups[];
+
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 0e3e6b1547b3..cba9dfb83e19 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -85,6 +85,8 @@ static void mt7915_init_txpower(struct mt7915_dev *dev)
 {
 	mt7915_init_txpower_band(dev, &dev->mphy.sband_2g.sband);
 	mt7915_init_txpower_band(dev, &dev->mphy.sband_5g.sband);
+
+	mt7915_eeprom_init_sku(dev);
 }
 
 static void mt7915_init_work(struct work_struct *work)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index e9e9e7e21388..7bf99e148d02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -42,6 +42,7 @@ static int mt7915_start(struct ieee80211_hw *hw)
 		mt7915_mcu_set_scs(dev, 1, true);
 	}
 
+	mt7915_mcu_set_sku_en(phy, true);
 	mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
@@ -327,6 +328,12 @@ static int mt7915_config(struct ieee80211_hw *hw, u32 changed)
 		ieee80211_wake_queues(hw);
 	}
 
+	if (changed & IEEE80211_CONF_CHANGE_POWER) {
+		ret = mt7915_mcu_set_sku(phy);
+		if (ret)
+			return ret;
+	}
+
 	mutex_lock(&dev->mt76.mutex);
 
 	if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5ca6bd9f099c..59cd50db2ecf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2301,6 +2301,55 @@ int mt7915_mcu_get_rate_info(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx)
 				   sizeof(req), false);
 }
 
+int mt7915_mcu_set_sku(struct mt7915_phy *phy)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct mt76_phy *mphy = phy->mt76;
+	struct ieee80211_hw *hw = mphy->hw;
+	struct mt7915_sku_val {
+		u8 format_id;
+		u8 limit_type;
+		u8 dbdc_idx;
+		s8 val[MT7915_SKU_RATE_NUM];
+	} __packed req = {
+		.format_id = 4,
+		.dbdc_idx = phy != &dev->phy,
+	};
+	int i;
+	s8 *delta, max_power;
+
+	delta = dev->rate_power[mphy->chandef.chan->band];
+
+	for (i = 0, max_power = 0; i < MT7915_SKU_RATE_NUM; i++) {
+		req.val[i] = hw->conf.power_level * 2 + delta[i];
+		max_power = max(max_power, req.val[i]);
+	}
+	mphy->txpower_cur = max_power;
+
+	return __mt76_mcu_send_msg(&dev->mt76,
+				   MCU_EXT_CMD_TX_POWER_FEATURE_CTRL,
+				   &req, sizeof(req), true);
+}
+
+int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct mt7915_sku {
+		u8 format_id;
+		u8 sku_enable;
+		u8 dbdc_idx;
+		u8 rsv;
+	} __packed req = {
+		.format_id = 0,
+		.dbdc_idx = phy != &dev->phy,
+		.sku_enable = enable,
+	};
+
+	return __mt76_mcu_send_msg(&dev->mt76,
+				   MCU_EXT_CMD_TX_POWER_FEATURE_CTRL,
+				   &req, sizeof(req), true);
+}
+
 int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 5e4708861ede..d9c9aab7e6dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -203,6 +203,7 @@ enum {
 	MCU_EXT_CMD_MAC_INIT_CTRL = 0x46,
 	MCU_EXT_CMD_RX_HDR_TRANS = 0x47,
 	MCU_EXT_CMD_SET_RX_PATH = 0x4e,
+	MCU_EXT_CMD_TX_POWER_FEATURE_CTRL = 0x58,
 	MCU_EXT_CMD_SET_SER_TRIGGER = 0x81,
 	MCU_EXT_CMD_SCS_CTRL = 0x82,
 	MCU_EXT_CMD_RATE_CTRL = 0x87,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index f2139a5248d9..b502bcc985ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -38,6 +38,7 @@
 #define MT7915_5G_RATE_DEFAULT		0x4b	/* OFDM 6M */
 #define MT7915_2G_RATE_DEFAULT		0x0	/* CCK 1M */
 
+#define MT7915_SKU_RATE_NUM		161
 
 struct mt7915_vif;
 struct mt7915_sta;
@@ -162,6 +163,8 @@ struct mt7915_dev {
 	spinlock_t token_lock;
 	struct idr token;
 
+	s8 **rate_power; /* TODO: use mt76_rate_power */
+
 	u8 mac_work_count;
 	bool fw_debug;
 };
@@ -269,6 +272,7 @@ u32 mt7915_eeprom_read(struct mt7915_dev *dev, u32 offset);
 int mt7915_eeprom_get_target_power(struct mt7915_dev *dev,
 				   struct ieee80211_channel *chan,
 				   u8 chain_idx);
+void mt7915_eeprom_init_sku(struct mt7915_dev *dev);
 int mt7915_dma_init(struct mt7915_dev *dev);
 void mt7915_dma_prefetch(struct mt7915_dev *dev);
 void mt7915_dma_cleanup(struct mt7915_dev *dev);
@@ -304,6 +308,8 @@ int mt7915_mcu_set_scs(struct mt7915_dev *dev, u8 band, bool enable);
 int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band);
 int mt7915_mcu_set_rts_thresh(struct mt7915_phy *phy, u32 val);
 int mt7915_mcu_set_pm(struct mt7915_dev *dev, int band, int enter);
+int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
+int mt7915_mcu_set_sku(struct mt7915_phy *phy);
 int mt7915_mcu_set_fcc5_lpn(struct mt7915_dev *dev, int val);
 int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
 			    const struct mt7915_dfs_pulse *pulse);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 12a562d3aa3d..d349561e4598 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -74,6 +74,29 @@ static irqreturn_t mt7915_irq_handler(int irq, void *dev_instance)
 	return IRQ_HANDLED;
 }
 
+static int
+mt7915_alloc_device(struct pci_dev *pdev, struct mt7915_dev *dev)
+{
+#define NUM_BANDS	2
+	int i;
+	s8 **sku;
+
+	sku = devm_kzalloc(&pdev->dev, NUM_BANDS * sizeof(*sku), GFP_KERNEL);
+	if (!sku)
+		return -ENOMEM;
+
+	for (i = 0; i < NUM_BANDS; i++) {
+		sku[i] = devm_kzalloc(&pdev->dev, MT7915_SKU_RATE_NUM *
+				      sizeof(**sku), GFP_KERNEL);
+		if (!sku[i])
+			return -ENOMEM;
+	}
+	dev->rate_power = sku;
+
+
+	return 0;
+}
+
 static int mt7915_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -117,6 +140,9 @@ static int mt7915_pci_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	dev = container_of(mdev, struct mt7915_dev, mt76);
+	ret = mt7915_alloc_device(pdev, dev);
+	if (ret)
+		return ret;
 
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	mdev->rev = (mt7915_l1_rr(dev, MT_HW_CHIPID) << 16) |
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
