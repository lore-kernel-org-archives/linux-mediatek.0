Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A391EC48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 05:39:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F65960FF2
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 05:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F65960FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2GA8VV7WgMuh3WBs37tzlqT85o5RWjeQNVwgW3ZUuYM=; b=PWfQRNeqh4c4My
	tIYnVUFnWptcZFyaoiOkqhMcGnA4zyVpdz5ow1FI4+LPLe2IWeijCqqqRaEyXPRlDuSEh9Vk8b1DP
	RUH6k0MaLxJTeJx8Ok2i7/TU1mXdKpd6zlTLpPv4+jT445MsxcPuWQ1b+34npsHi8YsJD0xKgUpvQ
	uRrlvrKCp+lrWhaT0S0xPITafCVLrkDPfiye2pdhta95ZuriKm6oosV84M2PjU1VpGzhkj80MI3HM
	wN/iRAhTSn7IElnIZMOjnruCadpvVRy7suGXkDSyh/JDxHDxg/XYXflQ0g2B4IXYv1iXVHS8KrErO
	i2qDJp3Om3FCdjhZtVpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luqBC-000Wpy-41; Sun, 20 Jun 2021 05:39:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luqB5-000WpU-D8
 for linux-mediatek@lists.infradead.org; Sun, 20 Jun 2021 05:39:30 +0000
X-UUID: 383be16e7d12472abc33973ed7df8ef4-20210619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jdgu1vZ5bH6dh0HCW49Di4ZZFhmgpXcACfDfmtQqkJc=; 
 b=LaOZKd9ZBjk16KLXhQ7Age3o1NelXuXclNUHAnF+vwroyEPrJ2cyzuU+89LNRe7B0Xi/rbq9ev8Wr2YMEisjT0R2coKtj5Q/bOmF9KFoW9stNGLM/OMFlI2fq7ZTekJx/Tnjl9LJQP7lYWqX9pEu7etZDQTxNlU9EQejtZebN/I=;
X-UUID: 383be16e7d12472abc33973ed7df8ef4-20210619
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1934524474; Sat, 19 Jun 2021 22:39:23 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Jun 2021 22:39:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 13:39:07 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 20 Jun 2021 13:39:07 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: add .set_sar_specs support
Date: Sun, 20 Jun 2021 13:39:06 +0800
Message-ID: <05d4551875d7ddf8de6679612ca3e650bded9926.1624167097.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_223928_910508_56689B20 
X-CRM114-Status: GOOD (  18.10  )
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
 drivers/net/wireless/mediatek/mt76/mt76.h     |  3 ++
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  5 +++
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 24 +++++++++-
 .../net/wireless/mediatek/mt76/mt7921/init.c  | 21 +++++++++
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 45 +++++++++++++++++++
 5 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 25c5ceef5257..63ce5242c4d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -636,6 +636,9 @@ struct mt76_phy {
 		struct sk_buff **tail;
 		u16 seqno;
 	} rx_amsdu[__MT_RXQ_MAX];
+
+	void *frp_data;
+	u8 num_frps;
 };
 
 struct mt76_dev {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index f49d97d0a1c5..95c7d1cac7c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -83,6 +83,11 @@ struct mt76_connac_coredump {
 	unsigned long last_activity;
 };
 
+struct mt76_connac_freq_range_power {
+	const struct cfg80211_sar_freq_ranges *range;
+	s8 power;
+};
+
 extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
 
 static inline bool is_mt7921(struct mt76_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 5c3a81e5f559..07f45cb4f500 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1749,6 +1749,24 @@ mt76_connac_mcu_build_sku(struct mt76_dev *dev, s8 *sku,
 	}
 }
 
+static s8 mt76_connac_get_sar_power(struct mt76_phy *phy,
+				    struct ieee80211_channel *chan,
+				    s8 target_power)
+{
+	struct mt76_connac_freq_range_power *frp = phy->frp_data;
+	int freq, i;
+
+	freq = ieee80211_channel_to_frequency(chan->hw_value, chan->band);
+	for (i = 0 ; i < phy->num_frps; i++) {
+		if (frp[i].range &&
+		    freq >= frp[i].range->start_freq &&
+		    freq < frp[i].range->end_freq)
+			target_power = min_t(s8, frp[i].power, target_power);
+	}
+
+	return target_power;
+}
+
 static int
 mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				  enum nl80211_band band)
@@ -1816,9 +1834,13 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
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
index a9ce10b98827..e7f66d988a49 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -24,6 +24,20 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	}
 };
 
+const struct cfg80211_sar_freq_ranges mt7921_sar_freq_ranges[] = {
+	{ .start_freq = 2402, .end_freq = 2494, },
+	{ .start_freq = 5150, .end_freq = 5350, },
+	{ .start_freq = 5350, .end_freq = 5470, },
+	{ .start_freq = 5470, .end_freq = 5725, },
+	{ .start_freq = 5725, .end_freq = 5950, },
+};
+
+static const struct cfg80211_sar_capa mt7921_sar_capa = {
+	.type = NL80211_SAR_TYPE_POWER,
+	.num_freq_ranges = ARRAY_SIZE(mt7921_sar_freq_ranges),
+	.freq_ranges = &mt7921_sar_freq_ranges[0],
+};
+
 static void
 mt7921_regd_notifier(struct wiphy *wiphy,
 		     struct regulatory_request *request)
@@ -75,6 +89,13 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->max_sched_scan_reqs = 1;
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 	wiphy->reg_notifier = mt7921_regd_notifier;
+	wiphy->sar_capa = &mt7921_sar_capa;
+
+	phy->mt76->frp_data = devm_kcalloc(dev->mt76.dev,
+					   wiphy->sar_capa->num_freq_ranges,
+					   sizeof(struct mt76_connac_freq_range_power),
+					   GFP_KERNEL);
+	phy->mt76->num_frps = wiphy->sar_capa->num_freq_ranges;
 
 	wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
 			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 7fd21049ff5a..e9b5d79e139f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1171,6 +1171,50 @@ static void mt7921_sta_set_decap_offload(struct ieee80211_hw *hw,
 					     MCU_UNI_CMD_STA_REC_UPDATE);
 }
 
+static int mt7921_set_sar_specs(struct ieee80211_hw *hw,
+				const struct cfg80211_sar_specs *sar)
+{
+	const struct cfg80211_sar_capa *capa = hw->wiphy->sar_capa;
+	struct mt76_connac_freq_range_power *frp_data, *frp;
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	struct mt76_phy *mphy = hw->priv;
+	int err;
+	u32 i;
+
+	mt7921_mutex_acquire(dev);
+
+	if (!sar || sar->type != NL80211_SAR_TYPE_POWER ||
+	    sar->num_sub_specs == 0) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	frp_data = mphy->frp_data;
+
+	for (i = 0; i < sar->num_sub_specs; i++) {
+		u32 index = sar->sub_specs[i].freq_range_index;
+		/* SAR specifies power limitaton in 0.25dbm */
+		s32 power = sar->sub_specs[i].power >> 1;
+
+		if (power > 127 || power < -127)
+			power = 127;
+
+		if (index >= mphy->num_frps)
+			continue;
+
+		frp = &frp_data[index];
+		frp->range = &capa->freq_ranges[index];
+		frp->power = power;
+	}
+
+	err = mt76_connac_mcu_set_rate_txpower(mphy);
+
+out:
+	mt7921_mutex_release(dev);
+
+	return err;
+}
+
 const struct ieee80211_ops mt7921_ops = {
 	.tx = mt7921_tx,
 	.start = mt7921_start,
@@ -1209,4 +1253,5 @@ const struct ieee80211_ops mt7921_ops = {
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
