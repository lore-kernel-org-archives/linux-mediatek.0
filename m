Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B46DC11F64
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 23:06:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1F661D01
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 23:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D1F661D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J2t90Hoiyd+twdSo2/8gF9gfAAM9cuU6hXMBQZYWBb8=; b=UaDIX0IIgNZj5R
	wD5qifP9ftSOKnE1AXMJ9P+OtMYWXczfU/V5G4+Lm9UBigvy5u+trlcMlhwyYihKSRC0PsBppmeTB
	hSITGMeWgbBqItX3KpJLO8Eac/2ssO4Fg0H0ngmJUb30ncUGj8rDUIXNTjaaBMrJCW7rZd4QB6yK9
	uo9BRP9D/hiWBC18Z7/GsMbB5fOV1JtZ+BvQ/JXdTeq+9TncwbrjhAlB5P43isPwPRGyDfM1Wawu+
	9msa1kIyidpCypEIIsb912O2C2CHF5aIXoZFUAcmAyNvQJY9hRlkZugySe3iPz1wkuzunWzryeXXy
	8Hg+iVWtfDiI8tC0v6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly0KT-009KS3-96; Mon, 28 Jun 2021 23:06:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly0KO-009KRA-F1
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 23:06:11 +0000
X-UUID: c2e2ee854d924b739a6b5187e212a8a3-20210628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zX31NpaOhzM2YTFPjRMyn4YesrU3lIYeDvkq3+NXTWs=; 
 b=h8oDwsGMYbOLbi/9VUYxDc3QQgXc+Je5gL1bym/FMjmukIAlxWlfOAqhwEVycfBOSMXcwS1CtSJeGBao6bqoRoklh+eEojK74UDOjBGVt9mKc4KtMXQZqXU7OaLswpHTsx2IHD4mr6byRPHTM2ygr6hJYALHQ36o8zpVuTysJfc=;
X-UUID: c2e2ee854d924b739a6b5187e212a8a3-20210628
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 485417149; Mon, 28 Jun 2021 16:06:03 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Jun 2021 16:06:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 07:05:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Jun 2021 07:05:54 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3] mt76: mt7921: add .set_sar_specs support
Date: Tue, 29 Jun 2021 07:05:53 +0800
Message-ID: <212c2ca86c3da877bc70be8bdc9fc3f93ca4ff45.1624920521.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_160609_962328_16E7C3CA 
X-CRM114-Status: GOOD (  19.90  )
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

From: YN Chen <YN.Chen@mediatek.com>

add .set_sar_specs to allow configuring SAR power limitations on the
frequency ranges from the userland.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
---
v2: 1. loop enhancement with considering no overlapping freqs
    2. error handling for devm_kcalloc
    3. sanity check without acquire lock
v3:
    1. move cfg80211_sar_capa to mt76 core to provide a common
       ground to other mt76 station devices
    2. remove uneccessary condition check because nl80211_set_sar_specs
       already did it
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 15 ++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  8 ++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 30 ++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/init.c  | 17 ++++++++-
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 38 +++++++++++++++++++
 5 files changed, 105 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index d03aedc3286b..ee3a5b8d62d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -99,6 +99,21 @@ struct ieee80211_rate mt76_rates[] = {
 };
 EXPORT_SYMBOL_GPL(mt76_rates);
 
+static const struct cfg80211_sar_freq_ranges mt76_sar_freq_ranges[] = {
+	{ .start_freq = 2402, .end_freq = 2494, },
+	{ .start_freq = 5150, .end_freq = 5350, },
+	{ .start_freq = 5350, .end_freq = 5470, },
+	{ .start_freq = 5470, .end_freq = 5725, },
+	{ .start_freq = 5725, .end_freq = 5950, },
+};
+
+const struct cfg80211_sar_capa mt76_sar_capa = {
+	.type = NL80211_SAR_TYPE_POWER,
+	.num_freq_ranges = ARRAY_SIZE(mt76_sar_freq_ranges),
+	.freq_ranges = &mt76_sar_freq_ranges[0],
+};
+EXPORT_SYMBOL_GPL(mt76_sar_capa);
+
 static int mt76_led_init(struct mt76_dev *dev)
 {
 	struct device_node *np = dev->dev->of_node;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 25c5ceef5257..ec42b87c9779 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -545,6 +545,11 @@ struct mt76_rx_status {
 	s8 chain_signal[IEEE80211_MAX_CHAINS];
 };
 
+struct mt76_freq_range_power {
+	const struct cfg80211_sar_freq_ranges *range;
+	s8 power;
+};
+
 struct mt76_testmode_ops {
 	int (*set_state)(struct mt76_phy *phy, enum mt76_testmode_state state);
 	int (*set_params)(struct mt76_phy *phy, struct nlattr **tb,
@@ -636,6 +641,8 @@ struct mt76_phy {
 		struct sk_buff **tail;
 		u16 seqno;
 	} rx_amsdu[__MT_RXQ_MAX];
+
+	struct mt76_freq_range_power *frp;
 };
 
 struct mt76_dev {
@@ -769,6 +776,7 @@ enum mt76_phy_type {
 }
 
 extern struct ieee80211_rate mt76_rates[12];
+extern const struct cfg80211_sar_capa mt76_sar_capa;
 
 #define __mt76_rr(dev, ...)	(dev)->bus->rr((dev), __VA_ARGS__)
 #define __mt76_wr(dev, ...)	(dev)->bus->wr((dev), __VA_ARGS__)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 5c3a81e5f559..a2555dc0f003 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1749,6 +1749,30 @@ mt76_connac_mcu_build_sku(struct mt76_dev *dev, s8 *sku,
 	}
 }
 
+static s8 mt76_connac_get_sar_power(struct mt76_phy *phy,
+				    struct ieee80211_channel *chan,
+				    s8 target_power)
+{
+	const struct cfg80211_sar_capa *capa = phy->hw->wiphy->sar_capa;
+	struct mt76_freq_range_power *frp = phy->frp;
+	int freq, i;
+
+	if (!capa || !frp)
+		return target_power;
+
+	freq = ieee80211_channel_to_frequency(chan->hw_value, chan->band);
+	for (i = 0 ; i < capa->num_freq_ranges; i++) {
+		if (frp[i].range &&
+		    freq >= frp[i].range->start_freq &&
+		    freq < frp[i].range->end_freq) {
+			target_power = min_t(s8, frp[i].power, target_power);
+			break;
+		}
+	}
+
+	return target_power;
+}
+
 static int
 mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				  enum nl80211_band band)
@@ -1816,9 +1840,13 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				.hw_value = ch_list[idx],
 				.band = band,
 			};
+			s8 sar_power;
+
+			sar_power = mt76_connac_get_sar_power(phy, &chan,
+							      tx_power);
 
 			mt76_get_rate_power_limits(phy, &chan, &limits,
-						   tx_power);
+						   sar_power);
 
 			tx_power_tlv.last_msg = ch_list[idx] == last_ch;
 			sku_tlbv.channel = ch_list[idx];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index a9ce10b98827..865cf8192e34 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -41,7 +41,7 @@ mt7921_regd_notifier(struct wiphy *wiphy,
 	mt7921_mutex_release(dev);
 }
 
-static void
+static int
 mt7921_init_wiphy(struct ieee80211_hw *hw)
 {
 	struct mt7921_phy *phy = mt7921_hw_phy(hw);
@@ -75,6 +75,14 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->max_sched_scan_reqs = 1;
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 	wiphy->reg_notifier = mt7921_regd_notifier;
+	wiphy->sar_capa = &mt76_sar_capa;
+
+	phy->mt76->frp = devm_kcalloc(dev->mt76.dev,
+				      wiphy->sar_capa->num_freq_ranges,
+				      sizeof(struct mt76_freq_range_power),
+				      GFP_KERNEL);
+	if (!phy->mt76->frp)
+		return -ENOMEM;
 
 	wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
 			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
@@ -92,6 +100,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 		ieee80211_hw_set(hw, CONNECTION_MONITOR);
 
 	hw->max_tx_fragments = 4;
+
+	return 0;
 }
 
 static void
@@ -207,7 +217,10 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	if (ret)
 		return ret;
 
-	mt7921_init_wiphy(hw);
+	ret = mt7921_init_wiphy(hw);
+	if (ret)
+		return ret;
+
 	dev->mphy.sband_2g.sband.ht_cap.cap |=
 			IEEE80211_HT_CAP_LDPC_CODING |
 			IEEE80211_HT_CAP_MAX_AMSDU;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 7fd21049ff5a..c96a0d5408d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1171,6 +1171,43 @@ static void mt7921_sta_set_decap_offload(struct ieee80211_hw *hw,
 					     MCU_UNI_CMD_STA_REC_UPDATE);
 }
 
+static int mt7921_set_sar_specs(struct ieee80211_hw *hw,
+				const struct cfg80211_sar_specs *sar)
+{
+	const struct cfg80211_sar_capa *capa = hw->wiphy->sar_capa;
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	struct mt76_freq_range_power *data, *frp;
+	struct mt76_phy *mphy = hw->priv;
+	int err;
+	u32 i;
+
+	if (sar->type != NL80211_SAR_TYPE_POWER || !sar->num_sub_specs)
+		return -EINVAL;
+
+	mt7921_mutex_acquire(dev);
+
+	data = mphy->frp;
+
+	for (i = 0; i < sar->num_sub_specs; i++) {
+		u32 index = sar->sub_specs[i].freq_range_index;
+		/* SAR specifies power limitaton in 0.25dbm */
+		s32 power = sar->sub_specs[i].power >> 1;
+
+		if (power > 127 || power < -127)
+			power = 127;
+
+		frp = &data[index];
+		frp->range = &capa->freq_ranges[index];
+		frp->power = power;
+	}
+
+	err = mt76_connac_mcu_set_rate_txpower(mphy);
+
+	mt7921_mutex_release(dev);
+
+	return err;
+}
+
 const struct ieee80211_ops mt7921_ops = {
 	.tx = mt7921_tx,
 	.start = mt7921_start,
@@ -1209,4 +1246,5 @@ const struct ieee80211_ops mt7921_ops = {
 	.set_rekey_data = mt7921_set_rekey_data,
 #endif /* CONFIG_PM */
 	.flush = mt7921_flush,
+	.set_sar_specs = mt7921_set_sar_specs,
 };
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
