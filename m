Return-Path: <SRS0=4stH=KK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA5AC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 May 2021 04:18:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7A061404
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 May 2021 04:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7A061404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X37PzRawxDvASmPi3OofiuiobuupTaFid60ikwtGN1g=; b=dFTGGvSFYQZcbxmy3+8OVIkaou
	6pwotwmXihPKbU871oQ761XqCf98fNXBlGzzQhDQLHUT5RPKrV9zmcBcXl4u2FUGLsCljev1oO/ZQ
	5dBcgedvWYdE/FAkiIPgoaBlbfzxz8Atgsj/hkzEgvsiO6BlknvvV4wCJJwKwgzP05hB/LJzsDoHU
	Fpuf97yrRW46dpeZ5toBZGzpM8C4YNmSlXPDa2vm0hR9PblSaJv1l76aqWd1Ee2nDXDyMlCHvOCQy
	oSSDESFPlTgtlcLHTEd0A5nLhuiqIzpKPA02LMO1fT/G2BXxAxm4SFb75D9JViONL0pW6U8vKnz3t
	VIW0AF8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhlkJ-009eit-PM; Sat, 15 May 2021 04:17:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhlkG-009eiK-VG
 for linux-mediatek@desiato.infradead.org; Sat, 15 May 2021 04:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=v2yZd8Ywh3kyHXLG+TcK5RLoFpJFzfEOAaEz3moImBo=; b=bBbfKkYbVKY/TFuUKp1E8X7NGj
 DhnCcNUMpMt9MCay8nI+aGWPIpMjnG3+tGFRMw+QZuZ9FXL0AO/dLfhaeX9dkV+D8Zn3TRMLhuqTq
 QslHZo4aJprnuUV0tVQyN0YqVIFRc0FQvLTnBrdSz85DWVvlKPZJEV6pSSj0V8xEsHSvwYZm0qD3e
 DhFLkoU/Rm0JWxdxkkAGzmcwG+ngoqTPT66LCMsP0tFRVD3qbJu1f2ruJSJj+rVLbEj9+a3kSqBVh
 h+xDQkVDckG+vRt5R/NcutYSfv+gqg9JpPIKmC/NWA5Yt7pHhOKBRZj8az6MwRc67aHSExezBCjqG
 ECYGZtSA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhlkC-00CNPD-Gs
 for linux-mediatek@lists.infradead.org; Sat, 15 May 2021 04:17:42 +0000
X-UUID: 1e96d4293638497a90298d0f2b9390c8-20210514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=v2yZd8Ywh3kyHXLG+TcK5RLoFpJFzfEOAaEz3moImBo=; 
 b=VwTuhAiDHcE+Je8jBjGctLdfV6UCeGGF0l+VjVSCU9s9PTI4Bi7n/0uJjGkNT9amge1qZLE5R88V387MIz/9ZEZt9DbtkxC0C/3EXhwIILeDvrjXu3zUguB2NSA2pJalwEYDnmNPR3x53PygZqSm+kaGnsg+XtDzjSMJkaVfnxM=;
X-UUID: 1e96d4293638497a90298d0f2b9390c8-20210514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 574616139; Fri, 14 May 2021 21:17:34 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 May 2021 21:17:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 15 May 2021 12:17:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 15 May 2021 12:17:31 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao
 <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: use mt7915_mcu_get_mib_info() to get survey data
Date: Sat, 15 May 2021 12:17:29 +0800
Message-ID: <ef62ca7747c88194539c9e567acb53c9c9cd729f.1621052118.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_211740_608215_36DA6DBE 
X-CRM114-Status: GOOD (  16.67  )
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

Firmware functions (SCS, MU ...) also require read-clear phy counters,
hence firmware prepares a global task to read shared fields out to a
shared pool to avoid concurrency. Switch to event format accordingly.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c  |  1 -
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 38 +++------------
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 46 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   | 14 ++++++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  | 20 +-------
 6 files changed, 69 insertions(+), 52 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index d8cc65231146..0887e165d5e4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -201,7 +201,6 @@ mt7915_mac_init_band(struct mt7915_dev *dev, u8 band)
 	      FIELD_PREP(MT_MDP_RCFR1_RX_DROPPED_MCAST, MT_MDP_TO_HIF);
 	mt76_rmw(dev, MT_MDP_BNRCFR1(band), mask, set);
 
-	mt76_set(dev, MT_WF_RMAC_MIB_TIME0(band), MT_WF_RMAC_MIB_RXTIME_EN);
 	mt76_set(dev, MT_WF_RMAC_MIB_AIRTIME0(band), MT_WF_RMAC_MIB_RXTIME_EN);
 
 	mt76_rmw_field(dev, MT_DMA_DCR0(band), MT_DMA_DCR0_MAX_RX_LEN, 1536);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 45f9b16b7d21..92fac8383976 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1316,14 +1316,10 @@ void mt7915_mac_reset_counters(struct mt7915_phy *phy)
 	memset(&dev->mt76.aggr_stats[i], 0, sizeof(dev->mt76.aggr_stats) / 2);
 
 	/* reset airtime counters */
-	mt76_rr(dev, MT_MIB_SDR9(ext_phy));
-	mt76_rr(dev, MT_MIB_SDR36(ext_phy));
-	mt76_rr(dev, MT_MIB_SDR37(ext_phy));
-
-	mt76_set(dev, MT_WF_RMAC_MIB_TIME0(ext_phy),
-		 MT_WF_RMAC_MIB_RXTIME_CLR);
 	mt76_set(dev, MT_WF_RMAC_MIB_AIRTIME0(ext_phy),
 		 MT_WF_RMAC_MIB_RXTIME_CLR);
+
+	mt7915_mcu_get_chan_mib_info(phy, true);
 }
 
 void mt7915_mac_set_timing(struct mt7915_phy *phy)
@@ -1420,20 +1416,11 @@ mt7915_phy_get_nf(struct mt7915_phy *phy, int idx)
 static void
 mt7915_phy_update_channel(struct mt76_phy *mphy, int idx)
 {
-	struct mt7915_dev *dev = container_of(mphy->dev, struct mt7915_dev, mt76);
 	struct mt7915_phy *phy = (struct mt7915_phy *)mphy->priv;
-	struct mt76_channel_state *state;
-	u64 busy_time, tx_time, rx_time, obss_time;
+	struct mt76_channel_state *state = mphy->chan_state;
 	int nf;
 
-	busy_time = mt76_get_field(dev, MT_MIB_SDR9(idx),
-				   MT_MIB_SDR9_BUSY_MASK);
-	tx_time = mt76_get_field(dev, MT_MIB_SDR36(idx),
-				 MT_MIB_SDR36_TXTIME_MASK);
-	rx_time = mt76_get_field(dev, MT_MIB_SDR37(idx),
-				 MT_MIB_SDR37_RXTIME_MASK);
-	obss_time = mt76_get_field(dev, MT_WF_RMAC_MIB_AIRTIME14(idx),
-				   MT_MIB_OBSSTIME_MASK);
+	mt7915_mcu_get_chan_mib_info(phy, false);
 
 	nf = mt7915_phy_get_nf(phy, idx);
 	if (!phy->noise)
@@ -1441,27 +1428,14 @@ mt7915_phy_update_channel(struct mt76_phy *mphy, int idx)
 	else if (nf)
 		phy->noise += nf - (phy->noise >> 4);
 
-	state = mphy->chan_state;
-	state->cc_busy += busy_time;
-	state->cc_tx += tx_time;
-	state->cc_rx += rx_time + obss_time;
-	state->cc_bss_rx += rx_time;
 	state->noise = -(phy->noise >> 4);
 }
 
 void mt7915_update_channel(struct mt76_dev *mdev)
 {
-	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
-
 	mt7915_phy_update_channel(&mdev->phy, 0);
 	if (mdev->phy2)
 		mt7915_phy_update_channel(mdev->phy2, 1);
-
-	/* reset obss airtime */
-	mt76_set(dev, MT_WF_RMAC_MIB_TIME0(0), MT_WF_RMAC_MIB_RXTIME_CLR);
-	if (mdev->phy2)
-		mt76_set(dev, MT_WF_RMAC_MIB_TIME0(1),
-			 MT_WF_RMAC_MIB_RXTIME_CLR);
 }
 
 static bool
@@ -1671,7 +1645,7 @@ void mt7915_mac_reset_work(struct work_struct *work)
 }
 
 static void
-mt7915_mac_update_mib_stats(struct mt7915_phy *phy)
+mt7915_mac_update_stats(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
 	struct mib_stats *mib = &phy->mib;
@@ -1780,7 +1754,7 @@ void mt7915_mac_work(struct work_struct *work)
 	if (++mphy->mac_work_count == 5) {
 		mphy->mac_work_count = 0;
 
-		mt7915_mac_update_mib_stats(phy);
+		mt7915_mac_update_stats(phy);
 	}
 
 	if (++phy->sta_work_count == 10) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index b3f14ff67c5a..85e399550ee4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -3469,6 +3469,52 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
 	return 0;
 }
 
+int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
+{
+	/* strict order */
+	static const enum mt7915_chan_mib_offs offs[] = {
+		MIB_BUSY_TIME, MIB_TX_TIME, MIB_RX_TIME, MIB_OBSS_AIRTIME
+	};
+	struct mt76_channel_state *state = phy->mt76->chan_state;
+	struct mt76_channel_state *state_ts = &phy->state_ts;
+	struct mt7915_dev *dev = phy->dev;
+	struct mt7915_mcu_mib *res, req[4];
+	struct sk_buff *skb;
+	int i, ret;
+
+	for (i = 0; i < 4; i++) {
+		req[i].band = cpu_to_le32(phy != &dev->phy);
+		req[i].offs = cpu_to_le32(offs[i]);
+	}
+
+	ret = mt76_mcu_send_and_get_msg(&dev->mt76, MCU_EXT_CMD(GET_MIB_INFO),
+					req, sizeof(req), true, &skb);
+	if (ret)
+		return ret;
+
+	res = (struct mt7915_mcu_mib *)(skb->data + 20);
+
+	if (chan_switch)
+		goto out;
+
+#define __res_u64(s) le64_to_cpu(res[s].data)
+	state->cc_busy += __res_u64(0) - state_ts->cc_busy;
+	state->cc_tx += __res_u64(1) - state_ts->cc_tx;
+	state->cc_bss_rx += __res_u64(2) - state_ts->cc_bss_rx;
+	state->cc_rx += __res_u64(2) + __res_u64(3) - state_ts->cc_rx;
+
+out:
+	state_ts->cc_busy = __res_u64(0);
+	state_ts->cc_tx = __res_u64(1);
+	state_ts->cc_bss_rx = __res_u64(2);
+	state_ts->cc_rx = __res_u64(2) + __res_u64(3);
+#undef __res_u64
+
+	dev_kfree_skb(skb);
+
+	return 0;
+}
+
 int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 42582a66e42d..04ae9ce3315c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -193,6 +193,19 @@ struct mt7915_mcu_phy_rx_info {
 #define MT_RA_RATE_DCM_EN		BIT(4)
 #define MT_RA_RATE_BW			GENMASK(14, 13)
 
+struct mt7915_mcu_mib {
+	__le32 band;
+	__le32 offs;
+	__le64 data;
+} __packed;
+
+enum mt7915_chan_mib_offs {
+	MIB_BUSY_TIME = 14,
+	MIB_TX_TIME = 81,
+	MIB_RX_TIME,
+	MIB_OBSS_AIRTIME = 86
+};
+
 struct edca {
 	u8 queue;
 	u8 set;
@@ -277,6 +290,7 @@ enum {
 	MCU_EXT_CMD_MUAR_UPDATE = 0x48,
 	MCU_EXT_CMD_SET_RX_PATH = 0x4e,
 	MCU_EXT_CMD_TX_POWER_FEATURE_CTRL = 0x58,
+	MCU_EXT_CMD_GET_MIB_INFO = 0x5a,
 	MCU_EXT_CMD_MWDS_SUPPORT = 0x80,
 	MCU_EXT_CMD_SET_SER_TRIGGER = 0x81,
 	MCU_EXT_CMD_SCS_CTRL = 0x82,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 4ea8972d4e2f..d41a344575b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -141,6 +141,7 @@ struct mt7915_phy {
 	u32 ampdu_ref;
 
 	struct mib_stats mib;
+	struct mt76_channel_state state_ts;
 	struct list_head stats_list;
 
 	u8 sta_work_count;
@@ -352,6 +353,7 @@ int mt7915_mcu_set_radar_th(struct mt7915_dev *dev, int index,
 			    const struct mt7915_dfs_pattern *pattern);
 int mt7915_mcu_apply_group_cal(struct mt7915_dev *dev);
 int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy);
+int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch);
 int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index);
 int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
 int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index f039806f9d9b..4436b98196be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -132,20 +132,9 @@
 #define MT_MIB_SDR3(_band)		MT_WF_MIB(_band, 0x014)
 #define MT_MIB_SDR3_FCS_ERR_MASK	GENMASK(15, 0)
 
-#define MT_MIB_SDR9(_band)		MT_WF_MIB(_band, 0x02c)
-#define MT_MIB_SDR9_BUSY_MASK		GENMASK(23, 0)
-
-#define MT_MIB_SDR16(_band)		MT_WF_MIB(_band, 0x048)
-#define MT_MIB_SDR16_BUSY_MASK		GENMASK(23, 0)
-
 #define MT_MIB_SDR34(_band)		MT_WF_MIB(_band, 0x090)
 #define MT_MIB_MU_BF_TX_CNT		GENMASK(15, 0)
 
-#define MT_MIB_SDR36(_band)		MT_WF_MIB(_band, 0x098)
-#define MT_MIB_SDR36_TXTIME_MASK	GENMASK(23, 0)
-#define MT_MIB_SDR37(_band)		MT_WF_MIB(_band, 0x09c)
-#define MT_MIB_SDR37_RXTIME_MASK	GENMASK(23, 0)
-
 #define MT_MIB_DR8(_band)		MT_WF_MIB(_band, 0x0c0)
 #define MT_MIB_DR9(_band)		MT_WF_MIB(_band, 0x0c4)
 #define MT_MIB_DR11(_band)		MT_WF_MIB(_band, 0x0cc)
@@ -158,9 +147,6 @@
 #define MT_MIB_BA_MISS_COUNT_MASK	GENMASK(15, 0)
 #define MT_MIB_ACK_FAIL_COUNT_MASK	GENMASK(31, 16)
 
-#define MT_MIB_MB_SDR2(_band, n)	MT_WF_MIB(_band, 0x108 + ((n) << 4))
-#define MT_MIB_FRAME_RETRIES_COUNT_MASK	GENMASK(15, 0)
-
 #define MT_TX_AGG_CNT(_band, n)		MT_WF_MIB(_band, 0x0a8 + ((n) << 2))
 #define MT_TX_AGG_CNT2(_band, n)	MT_WF_MIB(_band, 0x164 + ((n) << 2))
 #define MT_MIB_ARNG(_band, n)		MT_WF_MIB(_band, 0x4b8 + ((n) << 2))
@@ -263,14 +249,10 @@
 #define MT_WF_RFCR1_DROP_CFEND		BIT(7)
 #define MT_WF_RFCR1_DROP_CFACK		BIT(8)
 
-#define MT_WF_RMAC_MIB_TIME0(_band)	MT_WF_RMAC(_band, 0x03c4)
+#define MT_WF_RMAC_MIB_AIRTIME0(_band)	MT_WF_RMAC(_band, 0x0380)
 #define MT_WF_RMAC_MIB_RXTIME_CLR	BIT(31)
 #define MT_WF_RMAC_MIB_RXTIME_EN	BIT(30)
 
-#define MT_WF_RMAC_MIB_AIRTIME14(_band)	MT_WF_RMAC(_band, 0x03b8)
-#define MT_MIB_OBSSTIME_MASK		GENMASK(23, 0)
-#define MT_WF_RMAC_MIB_AIRTIME0(_band)	MT_WF_RMAC(_band, 0x0380)
-
 /* WFDMA0 */
 #define MT_WFDMA0_BASE			0xd4000
 #define MT_WFDMA0(ofs)			(MT_WFDMA0_BASE + (ofs))
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
