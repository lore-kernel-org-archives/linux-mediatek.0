Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDDCC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 16:46:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E8861153
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 16:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E8861153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g939CL46FXWau7Q6Ywz6E8/uK8MAJBjIV6efzfqA4Z0=; b=Wojwc8OmHZA3RYtf9uv1wbDEbI
	6X5DA//HlVfQKklnMjX909a+HBZG7I20jszKe4jRlUa6VwB3kC7LlwLi2N0GGHe0C0qizaeGEXknR
	NDU2WUc69G5iQVtIap44bo3gAQnACeMKNgHDq9dqPJLIZh7HtkdEZx/Fq901LAbQ3oKAwMe20gpcp
	9ZgrQoSQQbiX5Wbz+BEHDaE01aRAWZdb1jMu6TuOGTNUSRbkhB7yOLhdMZiTFhEn+VBF4WdKrvDsJ
	zeQNcByG+xNXk4RlR5zoZFHOYChV5PLRmkGxYgPL5BHwJCqRARoEJmhgE1fPfekD7bJtNgWEqV1pS
	WzeiJRlA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWieX-00DBHF-Fb; Wed, 14 Apr 2021 16:46:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWieT-00DBGZ-TQ
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 16:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CC3/jHYDPlc7anqRTY6s3VZDauTEV61R2YeqLDxLD5E=; b=Z9UXH8JEAyS+oik9tmbd95ciDq
 ca9wPOWgsVUD6zN+RHCPRoldXpSqj1FYP3DRsiho6Wwk3gw90i7ErXXSlgFfU7oFZBbUiRCC5hJt7
 AK2S6kytwd/0wgYzbTiEKLT8VqLwbj052UXWwioU+gjoDEyzQkYJzCin5sDbMfa6rSrhhIeD+ydpx
 32oP4knwbWkVcjeE/StjYnqIcXwvxOF9ErtClNBjThaA9Iz6QsAIp3j7CvG+OYnnJiJLSq9Sxs1Ku
 WYP8o3KieSgWgxtN0H8SpTDgagc3SgXMbZ9X/I393H8eOJ3Hj7nRv3BEPBPb47xmaDgZEJgEk7iUz
 ZA7M9Gww==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWieQ-007x9E-C7
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 16:46:04 +0000
X-UUID: e33bf912ca074ead9c53f6607379e012-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CC3/jHYDPlc7anqRTY6s3VZDauTEV61R2YeqLDxLD5E=; 
 b=DB5Klk5EicAexjfyAq4FMNB7mymja1gA1ZaB8EI7dvjuOVz7RqMqhMUoE47eC47LJkL/31CCCPm0GjjRXFqNZGfQ9GhBJ7M9q0iF4bBm0TwDmVN63zEb4k6pqCoTf7n2M81aIF2cc1Ep/v6gnFqZKKy0F9MfxbuQruOMgYZoTOE=;
X-UUID: e33bf912ca074ead9c53f6607379e012-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1377883207; Wed, 14 Apr 2021 09:45:53 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 09:45:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 00:45:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Apr 2021 00:45:50 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2] mt76: mt7915: add support for applying pre-calibraion data
Date: Thu, 15 Apr 2021 00:45:49 +0800
Message-ID: <a0b463543e418e03c0a749be027b991f1ca8ecaa.1618418328.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_094602_458260_3826BA24 
X-CRM114-Status: GOOD (  22.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When the EEPROM data is read from flash, it can contain pre-calibration
data, which can save calibration time.

Note that group_cal can save 30% bootup calibration time, and dpd_cal can
save 75% channel switching time.

Tested-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - use min_t instead.
---
 drivers/net/wireless/mediatek/mt76/eeprom.c   |  11 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 +
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |  25 ++-
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |  11 +-
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   7 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   6 +
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 142 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |   2 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   4 +
 9 files changed, 199 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 665b54c5c8ae..3f7a5a508605 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -9,8 +9,7 @@
 #include <linux/etherdevice.h>
 #include "mt76.h"
 
-static int
-mt76_get_of_eeprom(struct mt76_dev *dev, int len)
+int mt76_get_of_eeprom(struct mt76_dev *dev, void *eep, int offset, int len)
 {
 #if defined(CONFIG_OF) && defined(CONFIG_MTD)
 	struct device_node *np = dev->dev->of_node;
@@ -18,7 +17,6 @@ mt76_get_of_eeprom(struct mt76_dev *dev, int len)
 	const __be32 *list;
 	const char *part;
 	phandle phandle;
-	int offset = 0;
 	int size;
 	size_t retlen;
 	int ret;
@@ -54,7 +52,7 @@ mt76_get_of_eeprom(struct mt76_dev *dev, int len)
 	}
 
 	offset = be32_to_cpup(list);
-	ret = mtd_read(mtd, offset, len, &retlen, dev->eeprom.data);
+	ret = mtd_read(mtd, offset, len, &retlen, eep);
 	put_mtd_device(mtd);
 	if (ret)
 		goto out_put_node;
@@ -65,7 +63,7 @@ mt76_get_of_eeprom(struct mt76_dev *dev, int len)
 	}
 
 	if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
-		u8 *data = (u8 *)dev->eeprom.data;
+		u8 *data = (u8 *)eep;
 		int i;
 
 		/* convert eeprom data in Little Endian */
@@ -86,6 +84,7 @@ mt76_get_of_eeprom(struct mt76_dev *dev, int len)
 	return -ENOENT;
 #endif
 }
+EXPORT_SYMBOL_GPL(mt76_get_of_eeprom);
 
 void
 mt76_eeprom_override(struct mt76_phy *phy)
@@ -119,6 +118,6 @@ mt76_eeprom_init(struct mt76_dev *dev, int len)
 	if (!dev->eeprom.data)
 		return -ENOMEM;
 
-	return !mt76_get_of_eeprom(dev, len);
+	return !mt76_get_of_eeprom(dev, dev->eeprom.data, 0, len);
 }
 EXPORT_SYMBOL_GPL(mt76_eeprom_init);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index b09b0f5ffd6d..1b290d3bd7aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -828,6 +828,7 @@ void mt76_seq_puts_array(struct seq_file *file, const char *str,
 
 int mt76_eeprom_init(struct mt76_dev *dev, int len);
 void mt76_eeprom_override(struct mt76_phy *phy);
+int mt76_get_of_eeprom(struct mt76_dev *dev, void *data, int offset, int len);
 
 struct mt76_queue *
 mt76_init_queue(struct mt76_dev *dev, int qid, int idx, int n_desc,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index 738ecf8f4fa2..353f8d8497d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -14,6 +14,23 @@ static u32 mt7915_eeprom_read(struct mt7915_dev *dev, u32 offset)
 	return data[offset];
 }
 
+static int mt7915_eeprom_load_precal(struct mt7915_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	u32 val;
+
+	val = mt7915_eeprom_read(dev, MT_EE_DO_PRE_CAL);
+	if (val != (MT_EE_WIFI_CAL_DPD | MT_EE_WIFI_CAL_GROUP))
+		return 0;
+
+	val = MT_EE_CAL_GROUP_SIZE + MT_EE_CAL_DPD_SIZE;
+	dev->cal = devm_kzalloc(mdev->dev, val, GFP_KERNEL);
+	if (!dev->cal)
+		return -ENOMEM;
+
+	return mt76_get_of_eeprom(mdev, dev->cal, MT_EE_PRECAL, val);
+}
+
 static int mt7915_eeprom_load(struct mt7915_dev *dev)
 {
 	int ret;
@@ -22,12 +39,14 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
 	if (ret < 0)
 		return ret;
 
-	if (ret)
+	if (ret) {
 		dev->flash_mode = true;
-	else
+		ret = mt7915_eeprom_load_precal(dev);
+	} else {
 		memset(dev->mt76.eeprom.data, -1, MT7915_EEPROM_SIZE);
+	}
 
-	return 0;
+	return ret;
 }
 
 static int mt7915_check_eeprom(struct mt7915_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 3ee8c27bb61b..8ef5ebfad706 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -17,14 +17,23 @@ enum mt7915_eeprom_field {
 	MT_EE_MAC_ADDR =	0x004,
 	MT_EE_MAC_ADDR2 =	0x00a,
 	MT_EE_DDIE_FT_VERSION =	0x050,
+	MT_EE_DO_PRE_CAL =	0x062,
 	MT_EE_WIFI_CONF =	0x190,
 	MT_EE_TX0_POWER_2G =	0x2fc,
 	MT_EE_TX0_POWER_5G =	0x34b,
 	MT_EE_ADIE_FT_VERSION =	0x9a0,
 
-	__MT_EE_MAX =		0xe00
+	__MT_EE_MAX =		0xe00,
+	/* 0xe10 ~ 0x5780 used to save group cal data */
+	MT_EE_PRECAL =		0xe10
 };
 
+#define MT_EE_WIFI_CAL_GROUP			BIT(0)
+#define MT_EE_WIFI_CAL_DPD			GENMASK(2, 1)
+#define MT_EE_CAL_UNIT				1024
+#define MT_EE_CAL_GROUP_SIZE			(44 * MT_EE_CAL_UNIT)
+#define MT_EE_CAL_DPD_SIZE			(54 * MT_EE_CAL_UNIT)
+
 #define MT_EE_WIFI_CONF0_TX_PATH		GENMASK(2, 0)
 #define MT_EE_WIFI_CONF0_BAND_SEL		GENMASK(7, 6)
 #define MT_EE_WIFI_CONF1_BAND_SEL		GENMASK(7, 6)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 1b688bd5c52c..3f9f74aa8399 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -378,6 +378,13 @@ static int mt7915_init_hardware(struct mt7915_dev *dev)
 	if (ret < 0)
 		return ret;
 
+
+	if (dev->flash_mode) {
+		ret = mt7915_mcu_apply_group_cal(dev);
+		if (ret)
+			return ret;
+	}
+
 	/* Beacon and mgmt frames should occupy wcid 0 */
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA - 1);
 	if (idx)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 2fd87987312e..413abbca3246 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -313,6 +313,12 @@ int mt7915_set_channel(struct mt7915_phy *phy)
 	mt7915_init_dfs_state(phy);
 	mt76_set_channel(phy->mt76);
 
+	if (dev->flash_mode) {
+		ret = mt7915_mcu_apply_tx_dpd(phy);
+		if (ret)
+			goto out;
+	}
+
 	ret = mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD(CHANNEL_SWITCH));
 	if (ret)
 		goto out;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 0b739ed8ce33..bf5ea461d585 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3327,6 +3327,148 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset)
 	return 0;
 }
 
+static int mt7915_mcu_set_pre_cal(struct mt7915_dev *dev, u8 idx,
+				  u8 *data, u32 len, int cmd)
+{
+	struct {
+		u8 dir;
+		u8 valid;
+		__le16 bitmap;
+		s8 precal;
+		u8 action;
+		u8 band;
+		u8 idx;
+		u8 rsv[4];
+		__le32 len;
+	} req;
+	struct sk_buff *skb;
+
+	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL, sizeof(req) + len);
+	if (!skb)
+		return -ENOMEM;
+
+	req.idx = idx;
+	req.len = cpu_to_le32(len);
+	skb_put_data(skb, &req, sizeof(req));
+	skb_put_data(skb, data, len);
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb, cmd, false);
+}
+
+int mt7915_mcu_apply_group_cal(struct mt7915_dev *dev)
+{
+	u8 idx = 0, *cal = dev->cal, *eep = dev->mt76.eeprom.data;
+	u32 total = MT_EE_CAL_GROUP_SIZE;
+
+	if (!(eep[MT_EE_DO_PRE_CAL] & MT_EE_WIFI_CAL_GROUP))
+		return 0;
+
+	/*
+	 * Items: Rx DCOC, RSSI DCOC, Tx TSSI DCOC, Tx LPFG
+	 * Tx FDIQ, Tx DCIQ, Rx FDIQ, Rx FIIQ, ADCDCOC
+	 */
+	while (total > 0) {
+		int ret, len;
+
+		len = min_t(u32, total, MT_EE_CAL_UNIT);
+
+		ret = mt7915_mcu_set_pre_cal(dev, idx, cal, len,
+					     MCU_EXT_CMD(GROUP_PRE_CAL_INFO));
+		if (ret)
+			return ret;
+
+		total -= len;
+		cal += len;
+		idx++;
+	}
+
+	return 0;
+}
+
+static int mt7915_find_freq_idx(const u16 *freqs, int n_freqs, u16 cur)
+{
+	int i;
+
+	for (i = 0; i < n_freqs; i++)
+		if (cur == freqs[i])
+			return i;
+
+	return -1;
+}
+
+static int mt7915_dpd_freq_idx(u16 freq, u8 bw)
+{
+	static const u16 freq_list[] = {
+		5180, 5200, 5220, 5240,
+		5260, 5280, 5300, 5320,
+		5500, 5520, 5540, 5560,
+		5580, 5600, 5620, 5640,
+		5660, 5680, 5700, 5745,
+		5765, 5785, 5805, 5825
+	};
+	int offset_2g = ARRAY_SIZE(freq_list);
+	int idx;
+
+	if (freq < 4000) {
+		if (freq < 2432)
+			return offset_2g;
+		if (freq < 2457)
+			return offset_2g + 1;
+
+		return offset_2g + 2;
+	}
+
+	if (bw == NL80211_CHAN_WIDTH_80P80 || bw == NL80211_CHAN_WIDTH_160)
+		return -1;
+
+	if (bw != NL80211_CHAN_WIDTH_20) {
+		idx = mt7915_find_freq_idx(freq_list, ARRAY_SIZE(freq_list),
+					   freq + 10);
+		if (idx >= 0)
+			return idx;
+
+		idx = mt7915_find_freq_idx(freq_list, ARRAY_SIZE(freq_list),
+					   freq - 10);
+		if (idx >= 0)
+			return idx;
+	}
+
+	return mt7915_find_freq_idx(freq_list, ARRAY_SIZE(freq_list), freq);
+}
+
+int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
+{
+	struct mt7915_dev *dev = phy->dev;
+	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
+	u16 total = 2, idx, center_freq = chandef->center_freq1;
+	u8 *cal = dev->cal, *eep = dev->mt76.eeprom.data;
+
+	if (!(eep[MT_EE_DO_PRE_CAL] & MT_EE_WIFI_CAL_DPD))
+		return 0;
+
+	idx = mt7915_dpd_freq_idx(center_freq, chandef->width);
+	if (idx < 0)
+		return -EINVAL;
+
+	/* Items: Tx DPD, Tx Flatness */
+	idx = idx * 2;
+	cal += MT_EE_CAL_GROUP_SIZE;
+
+	while (total--) {
+		int ret;
+
+		cal += (idx * MT_EE_CAL_UNIT);
+		ret = mt7915_mcu_set_pre_cal(dev, idx, cal, MT_EE_CAL_UNIT,
+					     MCU_EXT_CMD(DPD_PRE_CAL_INFO));
+		if (ret)
+			return ret;
+
+		idx++;
+	}
+
+	return 0;
+}
+
 int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 4a932140a7c3..42582a66e42d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -284,6 +284,8 @@ enum {
 	MCU_EXT_CMD_FW_DBG_CTRL = 0x95,
 	MCU_EXT_CMD_SET_RDD_TH = 0x9d,
 	MCU_EXT_CMD_SET_SPR = 0xa8,
+	MCU_EXT_CMD_GROUP_PRE_CAL_INFO = 0xab,
+	MCU_EXT_CMD_DPD_PRE_CAL_INFO = 0xac,
 	MCU_EXT_CMD_PHY_STAT_INFO = 0xad,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 3df1d3e95b25..15e88179ab62 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -201,6 +201,8 @@ struct mt7915_dev {
 	bool flash_mode;
 	bool fw_debug;
 	bool ibf;
+
+	void *cal;
 };
 
 enum {
@@ -359,6 +361,8 @@ int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
 			    const struct mt7915_dfs_pulse *pulse);
 int mt7915_mcu_set_radar_th(struct mt7915_dev *dev, int index,
 			    const struct mt7915_dfs_pattern *pattern);
+int mt7915_mcu_apply_group_cal(struct mt7915_dev *dev);
+int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy);
 int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index);
 int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
 int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
