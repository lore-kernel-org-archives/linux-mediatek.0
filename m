Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11770C43457
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:56:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 978CC21BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sd6G/vrH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qiMDbqnx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 978CC21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NtP/aBJlZ6oP4vcu6NHoduvgyp83mJW5JgsPJJoQO5U=; b=Sd6G/vrH8xz22dyJeOIry3Lga
	hWuY6mIAy+mh4cyDiwi8VoiFrFxMkOsmfkSI9bzIdwWNLWavKrI2Jghl9KxlBHjkzxrJ0BGJ1sP0L
	yErmxPLPNOIUBclBb+gk6cmZP7fmZhqROaCdW1UEILSIGHfg+ZSA/8T7VIi8n6QPHdp0XBnXkbLv5
	1nxWZCOzBcErtppVL7bv4RLUy+ZmRliuF5jsBsiwAG5ElvUW9+qkWNIQCIqUvNeVjHYpouVPT0i30
	ZYKfSDBqskR4s0zmuYH4oI2GCQ8RwRAyASLxyBSg2C3uOnk8TB0TpH8BpYnfO5+dXVqml9fxqlzUk
	Z9NihuTsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxNI-0000TB-UJ; Mon, 12 Oct 2020 12:56:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxN8-0000II-3B
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 12:56:19 +0000
X-UUID: 569b40b07b884f57bb53a9fdfd38bb2e-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HtPG+lg+u0TnPb4iEJYLRcPdOAgzljb2iTR7oz5/DLo=; 
 b=qiMDbqnxWRNVoJkppDnbMcX/7RTBU4OSqtQuE0HsKdfu/JI4qu859DLVpwFUdSXYjAqppZWiQI8gj5rXwnky9B+9fcUIACjKHzVSDNTVQ8o9z7V1r5R4ZmAjrRvf2pJpomB4Y8llsVe8L0u6LuUqWhQLZS1Yy/TRXKRM2kT3Tb8=;
X-UUID: 569b40b07b884f57bb53a9fdfd38bb2e-20201012
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 42958656; Mon, 12 Oct 2020 04:56:07 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 05:56:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 20:55:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 20:55:56 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v3 08/10] mt76: mt7915: implement testmode rx support
Date: Mon, 12 Oct 2020 20:54:01 +0800
Message-ID: <20201012125403.8608-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012125403.8608-1-shayne.chen@mediatek.com>
References: <20201012125403.8608-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 76F146419BF2D9F78B941CD21DB1EA2E304AB2D10C496131551B51E19DFFF3942000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_085614_351844_E63247C3 
X-CRM114-Status: GOOD (  19.08  )
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

Support testmode rx and display rx statistic by parsing RXV packet
type, which is currently only enabled in testmode.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2: change last_snr to u8
v3: use nla_put_u8 for MT76_TM_RX_ATTR_SNR
    change snr variable type to u8 in mt7915_mac_fill_rx_vector

 .../net/wireless/mediatek/mt76/mt7915/dma.c   |  3 +
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 38 ++++++++
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  5 +
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  7 ++
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 97 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/testmode.h  | 30 ++++++
 7 files changed, 181 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index cfa12c4..e14814d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -61,6 +61,9 @@ void mt7915_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 	case PKT_TYPE_RX_EVENT:
 		mt7915_mcu_rx_event(dev, skb);
 		break;
+	case PKT_TYPE_TXRXV:
+		mt7915_mac_fill_rx_vector(dev, skb);
+		break;
 	case PKT_TYPE_NORMAL:
 		if (!mt7915_mac_fill_rx(dev, skb)) {
 			mt76_rx(&dev->mt76, q, skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index e03e12f..7bfdf54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -562,6 +562,44 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	return 0;
 }
 
+void mt7915_mac_fill_rx_vector(struct mt7915_dev *dev, struct sk_buff *skb)
+{
+#ifdef CONFIG_NL80211_TESTMODE
+	__le32 *rxd = (__le32 *)skb->data;
+	__le32 *rxv = rxd + 4;
+	u32 rcpi, ib_rssi, wb_rssi, v20, v21;
+	s32 foe;
+	u8 snr;
+	int i;
+
+	rcpi = le32_to_cpu(rxv[6]);
+	ib_rssi = le32_to_cpu(rxv[7]);
+	wb_rssi = le32_to_cpu(rxv[8]) >> 5;
+
+	for (i = 0; i < 4; i++, rcpi >>= 8, ib_rssi >>= 8, wb_rssi >>= 9) {
+		if (i == 3)
+			wb_rssi = le32_to_cpu(rxv[9]);
+
+		dev->test.last_rcpi[i] = rcpi & 0xff;
+		dev->test.last_ib_rssi[i] = ib_rssi & 0xff;
+		dev->test.last_wb_rssi[i] = wb_rssi & 0xff;
+	}
+
+	v20 = le32_to_cpu(rxv[20]);
+	v21 = le32_to_cpu(rxv[21]);
+
+	foe = FIELD_GET(MT_CRXV_FOE_LO, v20) |
+	      (FIELD_GET(MT_CRXV_FOE_HI, v21) << MT_CRXV_FOE_SHIFT);
+
+	snr = FIELD_GET(MT_CRXV_SNR, v20) - 16;
+
+	dev->test.last_freq_offset = foe;
+	dev->test.last_snr = snr;
+
+	dev_kfree_skb(skb);
+#endif
+}
+
 static u16
 mt7915_mac_tx_rate_val(struct mt76_phy *mphy, u8 mode, u8 rate_idx,
 		       u8 nss, u8 stbc, u8 *bw)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 0921b6f..d420392 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -128,6 +128,11 @@ enum rx_pkt_type {
 #define MT_CRXV_HE_BEAM_CHNG		BIT(13)
 #define MT_CRXV_HE_DOPPLER		BIT(16)
 
+#define MT_CRXV_SNR		GENMASK(18, 13)
+#define MT_CRXV_FOE_LO		GENMASK(31, 19)
+#define MT_CRXV_FOE_HI		GENMASK(6, 0)
+#define MT_CRXV_FOE_SHIFT	13
+
 enum tx_header_format {
 	MT_HDR_FORMAT_802_3,
 	MT_HDR_FORMAT_CMD,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 0a7e9d2..89453a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -48,6 +48,7 @@ enum {
 
 enum {
 	MCU_ATE_SET_TRX = 0x1,
+	MCU_ATE_SET_RX_FILTER = 0x3,
 };
 
 struct mt7915_mcu_rxd {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 6735915..fd7de79 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -165,6 +165,12 @@ struct mt7915_dev {
 	struct {
 		u32 *reg_backup;
 
+		s32 last_freq_offset;
+		u8 last_rcpi[4];
+		s8 last_ib_rssi[4];
+		s8 last_wb_rssi[4];
+		u8 last_snr;
+
 		u8 spe_idx;
 	} test;
 #endif
@@ -436,6 +442,7 @@ void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 			   struct ieee80211_key_conf *key, bool beacon);
 void mt7915_mac_set_timing(struct mt7915_phy *phy);
 int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb);
+void mt7915_mac_fill_rx_vector(struct mt7915_dev *dev, struct sk_buff *skb);
 void mt7915_mac_tx_free(struct mt7915_dev *dev, struct sk_buff *skb);
 int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 5d95766..acab268 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -113,6 +113,31 @@ mt7915_tm_reg_backup_restore(struct mt7915_dev *dev, struct mt7915_phy *phy)
 	mt76_clear(dev, MT_TMAC_TCR0(0), MT_TMAC_TCR0_TBTT_STOP_CTRL);
 }
 
+static int
+mt7915_tm_config_rx_filter(struct mt7915_dev *dev, bool en)
+{
+	struct mt7915_tm_cmd req = {
+		.testmode_en = 1,
+		.param_idx = MCU_ATE_SET_RX_FILTER,
+		.param.filter.report_en = en,
+		.param.filter.band = 0,	/* TODO: support dbdc */
+	};
+	__le32 mask = RX_FILTER_NOT_OWN_BTIM |
+		      RX_FILTER_NOT_OWN_UCAST |
+		      RX_FILTER_RTS | RX_FILTER_CTS |
+		      RX_FILTER_CTRL_RSV |
+		      RX_FILTER_BC_MC_BSSID_A2 |
+		      RX_FILTER_BC_MC_BSSID_A3 |
+		      RX_FILTER_BC_MC_OMAC_A3 |
+		      RX_FILTER_PROTOCOL_VERSION |
+		      RX_FILTER_FCS_ERR;
+
+	req.param.filter.mask = cpu_to_le32(mask);
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_ATE_CTRL, &req,
+				 sizeof(req), false);
+}
+
 static void
 mt7915_tm_init(struct mt7915_dev *dev)
 {
@@ -124,6 +149,7 @@ mt7915_tm_init(struct mt7915_dev *dev)
 	mt7915_tm_mode_ctrl(dev, en);
 	mt7915_tm_reg_backup_restore(dev, &dev->phy);
 	mt7915_tm_set_trx(dev, &dev->phy, TM_MAC_TXRX, !en);
+	mt7915_tm_config_rx_filter(dev, en);
 }
 
 static void
@@ -156,6 +182,20 @@ mt7915_tm_set_tx_frames(struct mt7915_dev *dev, bool en)
 	info->control.vif = dev->phy.monitor_vif;
 }
 
+static void
+mt7915_tm_set_rx_frames(struct mt7915_dev *dev, bool en)
+{
+	if (en) {
+		mutex_unlock(&dev->mt76.mutex);
+		mt7915_set_channel(&dev->phy);
+		mutex_lock(&dev->mt76.mutex);
+
+		mt7915_mcu_set_chan_info(&dev->phy, MCU_EXT_CMD_SET_RX_PATH);
+	}
+
+	mt7915_tm_set_trx(dev, &dev->phy, TM_MAC_RX_RXV, en);
+}
+
 static int
 mt7915_tm_set_state(struct mt76_dev *mdev, enum mt76_testmode_state state)
 {
@@ -169,12 +209,69 @@ mt7915_tm_set_state(struct mt76_dev *mdev, enum mt76_testmode_state state)
 		mt7915_tm_set_tx_frames(dev, false);
 	else if (state == MT76_TM_STATE_TX_FRAMES)
 		mt7915_tm_set_tx_frames(dev, true);
+	else if (prev_state == MT76_TM_STATE_RX_FRAMES)
+		mt7915_tm_set_rx_frames(dev, false);
+	else if (state == MT76_TM_STATE_RX_FRAMES)
+		mt7915_tm_set_rx_frames(dev, true);
 	else if (prev_state == MT76_TM_STATE_OFF || state == MT76_TM_STATE_OFF)
 		mt7915_tm_init(dev);
 
 	return 0;
 }
 
+static int
+mt7915_tm_dump_stats(struct mt76_dev *mdev, struct sk_buff *msg)
+{
+	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
+	void *rx, *rssi;
+	int i;
+
+	rx = nla_nest_start(msg, MT76_TM_STATS_ATTR_LAST_RX);
+	if (!rx)
+		return -ENOMEM;
+
+	if (nla_put_s32(msg, MT76_TM_RX_ATTR_FREQ_OFFSET, dev->test.last_freq_offset))
+		return -ENOMEM;
+
+	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_RCPI);
+	if (!rssi)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(dev->test.last_rcpi); i++)
+		if (nla_put_u8(msg, i, dev->test.last_rcpi[i]))
+			return -ENOMEM;
+
+	nla_nest_end(msg, rssi);
+
+	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_IB_RSSI);
+	if (!rssi)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(dev->test.last_ib_rssi); i++)
+		if (nla_put_s8(msg, i, dev->test.last_ib_rssi[i]))
+			return -ENOMEM;
+
+	nla_nest_end(msg, rssi);
+
+	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_WB_RSSI);
+	if (!rssi)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(dev->test.last_wb_rssi); i++)
+		if (nla_put_s8(msg, i, dev->test.last_wb_rssi[i]))
+			return -ENOMEM;
+
+	nla_nest_end(msg, rssi);
+
+	if (nla_put_u8(msg, MT76_TM_RX_ATTR_SNR, dev->test.last_snr))
+		return -ENOMEM;
+
+	nla_nest_end(msg, rx);
+
+	return 0;
+}
+
 const struct mt76_testmode_ops mt7915_testmode_ops = {
 	.set_state = mt7915_tm_set_state,
+	.dump_stats = mt7915_tm_dump_stats,
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 04f4a2c..b344a64 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -11,6 +11,15 @@ struct mt7915_tm_trx {
 	u8 rsv;
 };
 
+struct mt7915_tm_rx_filter {
+	u8 promiscuous;
+	u8 report_en;
+	u8 band;
+	u8 _rsv;
+	__le32 mask;
+	u8 _rsv1[4];
+};
+
 struct mt7915_tm_cmd {
 	u8 testmode_en;
 	u8 param_idx;
@@ -18,6 +27,7 @@ struct mt7915_tm_cmd {
 	union {
 		__le32 data;
 		struct mt7915_tm_trx trx;
+		struct mt7915_tm_rx_filter filter;
 		u8 test[72];
 	} param;
 } __packed;
@@ -31,4 +41,24 @@ enum {
 	TM_MAC_RX_RXV,
 };
 
+#define RX_FILTER_STBC_BCN_BC_MC	BIT(0)
+#define RX_FILTER_FCS_ERR		BIT(1)
+#define RX_FILTER_PROTOCOL_VERSION	BIT(2)
+#define RX_FILTER_PROB_REQ		BIT(3)
+#define RX_FILTER_MCAST			BIT(4)
+#define RX_FILTER_BCAST			BIT(5)
+#define RX_FILTER_MCAST_TABLE		BIT(6)
+#define RX_FILTER_BC_MC_OMAC_A3		BIT(7)
+#define RX_FILTER_BC_MC_BSSID_A3	BIT(8)
+#define RX_FILTER_BC_MC_BSSID_A2	BIT(9)
+#define RX_FILTER_BCN_BSSID		BIT(10)
+#define RX_FILTER_CTRL_RSV		BIT(11)
+#define RX_FILTER_CTS			BIT(12)
+#define RX_FILTER_RTS			BIT(13)
+#define RX_FILTER_DUPLICATE		BIT(14)
+#define RX_FILTER_NOT_OWN_BSSID		BIT(15)
+#define RX_FILTER_NOT_OWN_UCAST		BIT(16)
+#define RX_FILTER_NOT_OWN_BTIM		BIT(17)
+#define RX_FILTER_NDPA			BIT(18)
+
 #endif
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
