Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C7BE77350
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Sep 2023 02:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqkkSDVAPiSPjl4K8HhQ8gyzQAOOuulmJzDL/i4sv2I=; b=QtBiAMkV5CD2IA988IPKfoBgr6
	E9f/fknXLjLRDsiGUEXFq9if7cWI8Ry0sD1EZbn1uh3/g+GBGxMddKkRJXvP9n9aM9wjgxzVnzoN+
	MguLtgQvp9QBNsFEsgRYQcr9jNIhGtPbXXXr1Qj14Lio5hxLLF5QTMzk+94dRtRYQ5h5/BPHgjZHQ
	6a4uxm97oDlAuqJ8yXVP43TfLYqTm4Zfx71O0ZS3AxuDFcElVfLQNnPW+FiAMwnNJlLxWwyaQeacL
	I9BQfPZ2RaqbdYRtbY6Qsvirqz1Ckkxa8FTCW3StApII345qSp2XgOlXwXw625YpZXWVF5o2B4TVT
	mkGxJSZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmPfj-008oxJ-1j;
	Sat, 30 Sep 2023 02:25:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmPff-008ovj-0p
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Sep 2023 02:25:32 +0000
X-UUID: 9c279ca45f3811ee86758d4a7c00f3a0-20230929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oqkkSDVAPiSPjl4K8HhQ8gyzQAOOuulmJzDL/i4sv2I=;
	b=DAySN80ugsX5GZ8xq0q3M17bME+2694aLwJxTOyBN0Q/Zr6ziy6MVUBAX+q/gVrZRKNxBOLSQ0WqG6feC4bK6J8B6LsVilorabxyDKBAljEuHPSVKYsvpiDHcPGHZk4TwJjkyBB3r4IDhu7crATaLgujSHk8xAiNj4xywuF9Xu0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:75ca61d7-a287-47ec-8be2-4631072ad16b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:e57d6cbf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9c279ca45f3811ee86758d4a7c00f3a0-20230929
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1765379099; Fri, 29 Sep 2023 19:25:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 30 Sep 2023 10:25:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 30 Sep 2023 10:25:20 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v2 5/6] wifi: mt76: mt7921: update the channel usage when the regd domain changed
Date: Sat, 30 Sep 2023 10:25:09 +0800
Message-ID: <14b7b24fbe0029cac43d2c0c9e471b118419ad8e.1696039301.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1696039301.git.deren.wu@mediatek.com>
References: <cover.1696039301.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.414400-8.000000
X-TMASE-MatchedRID: UY2dYc6cHYBufzckypRuvVPjo7D4SFg4j5hUmqusTPhtw+n+iKWyyMCS
	2AMm1nQC8SXQ3wH4DTvx3J/N9EDof6NRZuU/UXSEA9lly13c/gFflOpBqBHTtzUsHjosUACSF8G
	YXulqwlpW8GYwJHfmJb1StHOhKPXDw4mZjhdFeRUMH4SsGvRsA2f6wD367VgtVo+424uIBNJQqT
	fsthoSXBK6ln2QPA181KYQd0FRUGwC2AMD5zMCJ6z+FzWjUOLz8kp9oxB/3WUkt9BigJAcVpNTR
	tQG6yy33wRvo7D+BFl0CabJqrYNnB8TzIzimOwPC24oEZ6SpSk6XEE7Yhw4FmgMXkuX9YB58BMq
	Gly5dbccgv7fKXL5VEHo49cqLjgH81wpaX+DBgtDDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.414400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 671DC97ACB4F51EFCB24F9BE8DADC605E5791F49F8B4E55131C169A049362A002000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_192531_306231_FA955CD9 
X-CRM114-Status: GOOD (  15.77  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The 5.9/6GHz channel license of a certain platform device has been
regulated in various countries. That may be difference with standard
Liunx regulatory domain settings. In this case, when .reg_notifier()
called for regulatory change, mt792x chipset should update the channel
usage based on clc or dts configurations.

Channel would be disabled by following cases.
* clc report the particular UNII-x is disabled.
* dts enabled and the channel is not configured.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c   |  7 ++-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  5 ++
 .../net/wireless/mediatek/mt76/mt7921/init.c  | 51 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  3 ++
 4 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 36564930aef1..7725dd6763ef 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -188,7 +188,7 @@ static bool mt76_string_prop_find(struct property *prop, const char *str)
 	return false;
 }
 
-static struct device_node *
+struct device_node *
 mt76_find_power_limits_node(struct mt76_dev *dev)
 {
 	struct device_node *np = dev->dev->of_node;
@@ -227,6 +227,7 @@ mt76_find_power_limits_node(struct mt76_dev *dev)
 	of_node_put(np);
 	return fallback;
 }
+EXPORT_SYMBOL_GPL(mt76_find_power_limits_node);
 
 static const __be32 *
 mt76_get_of_array(struct device_node *np, char *name, size_t *len, int min)
@@ -241,7 +242,7 @@ mt76_get_of_array(struct device_node *np, char *name, size_t *len, int min)
 	return prop->value;
 }
 
-static struct device_node *
+struct device_node *
 mt76_find_channel_node(struct device_node *np, struct ieee80211_channel *chan)
 {
 	struct device_node *cur;
@@ -265,6 +266,8 @@ mt76_find_channel_node(struct device_node *np, struct ieee80211_channel *chan)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(mt76_find_channel_node);
+
 
 static s8
 mt76_get_txs_delta(struct device_node *np, u8 nss)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index fede40cf86b7..3730c5e7d702 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1537,6 +1537,11 @@ mt76_mcu_skb_send_msg(struct mt76_dev *dev, struct sk_buff *skb, int cmd,
 
 void mt76_set_irq_mask(struct mt76_dev *dev, u32 addr, u32 clear, u32 set);
 
+struct device_node *
+mt76_find_power_limits_node(struct mt76_dev *dev);
+struct device_node *
+mt76_find_channel_node(struct device_node *np, struct ieee80211_channel *chan);
+
 s8 mt76_get_rate_power_limits(struct mt76_phy *phy,
 			      struct ieee80211_channel *chan,
 			      struct mt76_power_limits *dest,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 534c7bee5ef1..55baac70860b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -58,6 +58,55 @@ static int mt7921_thermal_init(struct mt792x_phy *phy)
 	return PTR_ERR_OR_ZERO(hwmon);
 }
 
+static void
+mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
+{
+#define IS_UNII_INVALID(idx, sfreq, efreq) \
+	(!(dev->phy.clc_chan_conf & BIT(idx)) && (cfreq) >= (sfreq) && (cfreq) <= (efreq))
+	struct ieee80211_supported_band *sband;
+	struct mt76_dev *mdev = &dev->mt76;
+	struct device_node *np, *band_np;
+	struct ieee80211_channel *ch;
+	int i, cfreq;
+
+	np = mt76_find_power_limits_node(mdev);
+
+	sband = wiphy->bands[NL80211_BAND_5GHZ];
+	band_np = np ? of_get_child_by_name(np, "txpower-5g") : NULL;
+	for (i = 0; i < sband->n_channels; i++) {
+		ch = &sband->channels[i];
+		cfreq = ch->center_freq;
+
+		if (np && (!band_np || !mt76_find_channel_node(band_np, ch))) {
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+			continue;
+		}
+
+		/* UNII-4 */
+		if (IS_UNII_INVALID(0, 5850, 5925))
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+	}
+
+	sband = wiphy->bands[NL80211_BAND_6GHZ];
+	band_np = np ? of_get_child_by_name(np, "txpower-6g") : NULL;
+	for (i = 0; i < sband->n_channels; i++) {
+		ch = &sband->channels[i];
+		cfreq = ch->center_freq;
+
+		if (np && (!band_np || !mt76_find_channel_node(band_np, ch))) {
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+			continue;
+		}
+
+		/* UNII-5/6/7/8 */
+		if (IS_UNII_INVALID(1, 5925, 6425) ||
+		    IS_UNII_INVALID(2, 6425, 6525) ||
+		    IS_UNII_INVALID(3, 6525, 6875) ||
+		    IS_UNII_INVALID(4, 6875, 7125))
+			ch->flags |= IEEE80211_CHAN_DISABLED;
+	}
+}
+
 static void
 mt7921_regd_notifier(struct wiphy *wiphy,
 		     struct regulatory_request *request)
@@ -74,6 +123,8 @@ mt7921_regd_notifier(struct wiphy *wiphy,
 	mt76_connac_mcu_set_channel_domain(hw->priv);
 	mt7921_set_tx_sar_pwr(hw, NULL);
 	mt792x_mutex_release(dev);
+
+	mt7921_regd_channel_update(wiphy, dev);
 }
 
 int mt7921_mac_init(struct mt792x_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 4f66e27aa43a..63f3d4a5c9aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1247,6 +1247,7 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 			 u8 idx)
 {
 #define CLC_CAP_EVT_EN BIT(0)
+#define CLC_CAP_DTS_EN BIT(1)
 	struct sk_buff *skb, *ret_skb = NULL;
 	struct {
 		u8 ver;
@@ -1274,6 +1275,8 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 
 	if (dev->phy.chip_cap & MT792x_CHIP_CAP_CLC_EVT_EN)
 		req.cap |= CLC_CAP_EVT_EN;
+	if (mt76_find_power_limits_node(&dev->mt76))
+		req.cap |= CLC_CAP_DTS_EN;
 
 	pos = clc->data;
 	for (i = 0; i < clc->nr_country; i++) {
-- 
2.18.0


