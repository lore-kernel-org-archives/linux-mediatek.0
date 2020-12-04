Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95ECFC4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:37:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F30D225AC
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F30D225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pwBERtj2WMveL+KAsOHuOgqraUGcv8rPDTJZItK4wDo=; b=0gOi3cTd882Bqn65x9ZbAeEkf
	zlhFXqmC6gsq3/N4HBggIFsJvI+yf0iRLibZASplmetUoJ0uTj0w9yOWPom9IfMYTQHA6hw+7+5mC
	iQ2pUdYiEXFIcAOKRIHJ/sgffnIgjM+oVqywDscPYF+K+ctQ+2UmFo2uvdpTPDhB7JZnIZRMVYJF2
	yeh0yAKay0GcgwLvAmpSkKoCrh3o313niCurDVIyXct55ixlewfE0SMkhV/IR8P36XWx5HA6+h4zu
	6o7QKJzFg0Q1Hbms4i1JMyR/v9YH31PQ1zTIcVSSQ7T7MpXY7ygcJPkG3xzebRa+nxpG75YxcVF8h
	l6I82mgyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7Wr-0007PL-CD; Fri, 04 Dec 2020 09:37:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7Wo-0007Nq-Jw
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 09:37:27 +0000
X-UUID: ab6688a3969c4a4a92be87b6e97c4868-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GpKt0WGbVA/b0JOhNyieZAONwoUWg3+XN3WUXXg3DQ0=; 
 b=ut3sJvfuY0xEWxyA48I5DYa9MOIJV2nAWcqkoiRwWeRLc1bV4QESrVO2B3CFZ8G7TMKnWpX3+19XPqglDbOhX5eMgGgqVLU0e4+a395weDuvLxt/8QmqvVUT31bj+XiRbWvzM3BnjD4KALwUpwtWnVg+4EQmX6n6VyEuKuq6CgI=;
X-UUID: ab6688a3969c4a4a92be87b6e97c4868-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1068429159; Fri, 04 Dec 2020 01:37:11 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 01:37:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 17:37:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Dec 2020 17:37:18 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 4/5] mt76: mt7915: move testmode data from dev to phy
Date: Fri, 4 Dec 2020 17:36:58 +0800
Message-ID: <20201204093659.20384-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201204093659.20384-1-shayne.chen@mediatek.com>
References: <20201204093659.20384-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_043726_820300_7ABDB34C 
X-CRM114-Status: GOOD (  16.32  )
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

Move per-chip testmode data to mt7915_phy, to properly support
reg_backup and rx status of each band in testmode.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 20 ++++++++-----
 .../net/wireless/mediatek/mt76/mt7915/mac.h   |  2 ++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    | 28 +++++++++----------
 .../wireless/mediatek/mt76/mt7915/testmode.c  | 25 ++++++++---------
 4 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index ddaaad22b308..241d89a99caf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -565,13 +565,20 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 #ifdef CONFIG_NL80211_TESTMODE
 void mt7915_mac_fill_rx_vector(struct mt7915_dev *dev, struct sk_buff *skb)
 {
+	struct mt7915_phy *phy = &dev->phy;
 	__le32 *rxd = (__le32 *)skb->data;
+	__le32 *rxv_hdr = rxd + 2;
 	__le32 *rxv = rxd + 4;
 	u32 rcpi, ib_rssi, wb_rssi, v20, v21;
+	bool ext_phy;
 	s32 foe;
 	u8 snr;
 	int i;
 
+	ext_phy = FIELD_GET(MT_RXV_HDR_BAND_IDX, le32_to_cpu(rxv_hdr[1]));
+	if (ext_phy)
+		phy = mt7915_ext_phy(dev);
+
 	rcpi = le32_to_cpu(rxv[6]);
 	ib_rssi = le32_to_cpu(rxv[7]);
 	wb_rssi = le32_to_cpu(rxv[8]) >> 5;
@@ -580,9 +587,9 @@ void mt7915_mac_fill_rx_vector(struct mt7915_dev *dev, struct sk_buff *skb)
 		if (i == 3)
 			wb_rssi = le32_to_cpu(rxv[9]);
 
-		dev->test.last_rcpi[i] = rcpi & 0xff;
-		dev->test.last_ib_rssi[i] = ib_rssi & 0xff;
-		dev->test.last_wb_rssi[i] = wb_rssi & 0xff;
+		phy->test.last_rcpi[i] = rcpi & 0xff;
+		phy->test.last_ib_rssi[i] = ib_rssi & 0xff;
+		phy->test.last_wb_rssi[i] = wb_rssi & 0xff;
 	}
 
 	v20 = le32_to_cpu(rxv[20]);
@@ -593,8 +600,8 @@ void mt7915_mac_fill_rx_vector(struct mt7915_dev *dev, struct sk_buff *skb)
 
 	snr = FIELD_GET(MT_CRXV_SNR, v20) - 16;
 
-	dev->test.last_freq_offset = foe;
-	dev->test.last_snr = snr;
+	phy->test.last_freq_offset = foe;
+	phy->test.last_snr = snr;
 
 	dev_kfree_skb(skb);
 }
@@ -606,7 +613,6 @@ mt7915_mac_write_txwi_tm(struct mt7915_phy *phy, __le32 *txwi,
 {
 #ifdef CONFIG_NL80211_TESTMODE
 	struct mt76_testmode_data *td = &phy->mt76->test;
-	struct mt7915_dev *dev = phy->dev;
 	u8 rate_idx = td->tx_rate_idx;
 	u8 nss = td->tx_rate_nss;
 	u8 bw, mode;
@@ -699,7 +705,7 @@ mt7915_mac_write_txwi_tm(struct mt7915_phy *phy, __le32 *txwi,
 
 	txwi[6] |= cpu_to_le32(val);
 	txwi[7] |= cpu_to_le32(FIELD_PREP(MT_TXD7_SPE_IDX,
-					  dev->test.spe_idx));
+					  phy->test.spe_idx));
 #endif
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index d420392b952d..96ff3fb0d1f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -95,6 +95,8 @@ enum rx_pkt_type {
 #define MT_RXD3_NORMAL_PF_MODE		BIT(29)
 #define MT_RXD3_NORMAL_PF_STS		GENMASK(31, 30)
 
+#define MT_RXV_HDR_BAND_IDX		BIT(24)
+
 /* P-RXV */
 #define MT_PRXV_TX_RATE			GENMASK(6, 0)
 #define MT_PRXV_TX_DCM			BIT(4)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 30e53a0f01fb..b9279fd17b3f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -135,6 +135,20 @@ struct mt7915_phy {
 	struct delayed_work mac_work;
 	u8 mac_work_count;
 	u8 sta_work_count;
+
+#ifdef CONFIG_NL80211_TESTMODE
+	struct {
+		u32 *reg_backup;
+
+		s32 last_freq_offset;
+		u8 last_rcpi[4];
+		s8 last_ib_rssi[4];
+		s8 last_wb_rssi[4];
+		u8 last_snr;
+
+		u8 spe_idx;
+	} test;
+#endif
 };
 
 struct mt7915_dev {
@@ -167,20 +181,6 @@ struct mt7915_dev {
 
 	bool dbdc_support;
 	bool fw_debug;
-
-#ifdef CONFIG_NL80211_TESTMODE
-	struct {
-		u32 *reg_backup;
-
-		s32 last_freq_offset;
-		u8 last_rcpi[4];
-		s8 last_ib_rssi[4];
-		s8 last_wb_rssi[4];
-		u8 last_snr;
-
-		u8 spe_idx;
-	} test;
-#endif
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index e648f718adb8..b58c91ea3fa5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -138,10 +138,10 @@ mt7915_tm_reg_backup_restore(struct mt7915_phy *phy)
 	int n_regs = ARRAY_SIZE(reg_backup_list);
 	struct mt7915_dev *dev = phy->dev;
 	bool ext_phy = phy != &dev->phy;
-	u32 *b = dev->test.reg_backup;
+	u32 *b = phy->test.reg_backup;
 	int i;
 
-	if (dev->mphy.test.state == MT76_TM_STATE_OFF) {
+	if (phy->mt76->test.state == MT76_TM_STATE_OFF) {
 		for (i = 0; i < n_regs; i++)
 			mt76_wr(dev, reg_backup_list[i].band[ext_phy], b[i]);
 		return;
@@ -154,7 +154,7 @@ mt7915_tm_reg_backup_restore(struct mt7915_phy *phy)
 	if (!b)
 		return;
 
-	dev->test.reg_backup = b;
+	phy->test.reg_backup = b;
 	for (i = 0; i < n_regs; i++)
 		b[i] = mt76_rr(dev, reg_backup_list[i].band[ext_phy]);
 
@@ -222,7 +222,7 @@ mt7915_tm_set_tx_frames(struct mt7915_phy *phy, bool en)
 
 		if (phy != &dev->phy)
 			tx_ant >>= 2;
-		dev->test.spe_idx = spe_idx_map[tx_ant];
+		phy->test.spe_idx = spe_idx_map[tx_ant];
 	}
 
 	mt7915_tm_set_trx(phy, TM_MAC_TX, en);
@@ -333,7 +333,6 @@ static int
 mt7915_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 {
 	struct mt7915_phy *phy = mphy->priv;
-	struct mt7915_dev *dev = phy->dev;
 	void *rx, *rssi;
 	int i;
 
@@ -341,15 +340,15 @@ mt7915_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 	if (!rx)
 		return -ENOMEM;
 
-	if (nla_put_s32(msg, MT76_TM_RX_ATTR_FREQ_OFFSET, dev->test.last_freq_offset))
+	if (nla_put_s32(msg, MT76_TM_RX_ATTR_FREQ_OFFSET, phy->test.last_freq_offset))
 		return -ENOMEM;
 
 	rssi = nla_nest_start(msg, MT76_TM_RX_ATTR_RCPI);
 	if (!rssi)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(dev->test.last_rcpi); i++)
-		if (nla_put_u8(msg, i, dev->test.last_rcpi[i]))
+	for (i = 0; i < ARRAY_SIZE(phy->test.last_rcpi); i++)
+		if (nla_put_u8(msg, i, phy->test.last_rcpi[i]))
 			return -ENOMEM;
 
 	nla_nest_end(msg, rssi);
@@ -358,8 +357,8 @@ mt7915_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 	if (!rssi)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(dev->test.last_ib_rssi); i++)
-		if (nla_put_s8(msg, i, dev->test.last_ib_rssi[i]))
+	for (i = 0; i < ARRAY_SIZE(phy->test.last_ib_rssi); i++)
+		if (nla_put_s8(msg, i, phy->test.last_ib_rssi[i]))
 			return -ENOMEM;
 
 	nla_nest_end(msg, rssi);
@@ -368,13 +367,13 @@ mt7915_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 	if (!rssi)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(dev->test.last_wb_rssi); i++)
-		if (nla_put_s8(msg, i, dev->test.last_wb_rssi[i]))
+	for (i = 0; i < ARRAY_SIZE(phy->test.last_wb_rssi); i++)
+		if (nla_put_s8(msg, i, phy->test.last_wb_rssi[i]))
 			return -ENOMEM;
 
 	nla_nest_end(msg, rssi);
 
-	if (nla_put_u8(msg, MT76_TM_RX_ATTR_SNR, dev->test.last_snr))
+	if (nla_put_u8(msg, MT76_TM_RX_ATTR_SNR, phy->test.last_snr))
 		return -ENOMEM;
 
 	nla_nest_end(msg, rx);
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
