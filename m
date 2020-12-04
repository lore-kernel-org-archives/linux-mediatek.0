Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803EBC4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:42:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049CA227C3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 09:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 049CA227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nhwlNCFVjGAtu54aOMEiMU1y55UAlsSyonBxfjUOeJ0=; b=qEBA4hcHGcM/o0g6UCMFfpjVX
	dfBKdXHg/GITQMI1USAECT65zYOIdbgitc989lDcxpbdPyYKAKWATHyvpoWH1nqLjhA8/TWbS8uJ4
	TDciEhXzXRagVRqyTIHEuIa/OxttMFyuuJf6xZyUQam1PFaGHRlTt/tvVRx01o8s2D3G47Js0QvYo
	Vq1W/x0klXfdkShRSGUb5Sk7jUSvI3ykwjocTUg6RuBK8Ut/OvBcOn1ykguFQptpezAuUGYhLTJ+A
	M1bWb27Sa8glJCXyQNIPDeODfIAHMtlViTSl029zOJ3PW9lINKvUKlUbqOmhXqR21SDYBurrpHu+z
	Q0HMWwUIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl7bZ-0000hr-9O; Fri, 04 Dec 2020 09:42:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl7bR-0000aS-6H
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 09:42:17 +0000
X-UUID: 840b1ccad9ff443ba179b7a2aea05bce-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TkG+418F9culL0HWQsqm2rzjMvnS25gqyyRsTmy5J2w=; 
 b=L5kR5fXE/T+1Wi+LS7ocjMY6f4ffxxs8zfit4WOiGjXDxsZqExk+2VFrg7eYiwwyM38YdVfmp965D7zfu5H7OhIHQARI6BzRHAvYqVqqqjuAL1P6E8ZjhVbNXUVM+36CpNqMwNwQ5AsHXXH+pLipDA5zmxnzYy59HIVE7YzNl+g=;
X-UUID: 840b1ccad9ff443ba179b7a2aea05bce-20201204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1161770924; Fri, 04 Dec 2020 01:41:54 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 01:37:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Dec 2020 17:37:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Dec 2020 17:37:19 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 5/5] mt76: mt7615: move testmode data from dev to phy
Date: Fri, 4 Dec 2020 17:36:59 +0800
Message-ID: <20201204093659.20384-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201204093659.20384-1-shayne.chen@mediatek.com>
References: <20201204093659.20384-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 97721689F1F41A496701328FEA42E56069F4E91844D857AC66F55DAFAEC4AE8F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_044213_448431_9DFEC468 
X-CRM114-Status: GOOD (  14.50  )
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

Move per-chip testmode data to mt7615_phy, to properly support
reg_backup and rx status of each band in testmode.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 18 +++++++--------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    | 22 +++++++++----------
 .../wireless/mediatek/mt76/mt7615/testmode.c  | 21 +++++++++---------
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 0f360be0b885..9d8c6f34b3ae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -186,7 +186,7 @@ mt7615_get_status_freq_info(struct mt7615_dev *dev, struct mt76_phy *mphy,
 	status->freq = ieee80211_channel_to_frequency(chfreq, status->band);
 }
 
-static void mt7615_mac_fill_tm_rx(struct mt7615_dev *dev, __le32 *rxv)
+static void mt7615_mac_fill_tm_rx(struct mt7615_phy *phy, __le32 *rxv)
 {
 #ifdef CONFIG_NL80211_TESTMODE
 	u32 rxv1 = le32_to_cpu(rxv[0]);
@@ -210,13 +210,13 @@ static void mt7615_mac_fill_tm_rx(struct mt7615_dev *dev, __le32 *rxv)
 		foe = (foe * foe_const) >> 15;
 	}
 
-	dev->test.last_freq_offset = foe;
-	dev->test.last_rcpi[0] = FIELD_GET(MT_RXV4_RCPI0, rxv4);
-	dev->test.last_rcpi[1] = FIELD_GET(MT_RXV4_RCPI1, rxv4);
-	dev->test.last_rcpi[2] = FIELD_GET(MT_RXV4_RCPI2, rxv4);
-	dev->test.last_rcpi[3] = FIELD_GET(MT_RXV4_RCPI3, rxv4);
-	dev->test.last_ib_rssi[0] = FIELD_GET(MT_RXV3_IB_RSSI, rxv3);
-	dev->test.last_wb_rssi[0] = FIELD_GET(MT_RXV3_WB_RSSI, rxv3);
+	phy->test.last_freq_offset = foe;
+	phy->test.last_rcpi[0] = FIELD_GET(MT_RXV4_RCPI0, rxv4);
+	phy->test.last_rcpi[1] = FIELD_GET(MT_RXV4_RCPI1, rxv4);
+	phy->test.last_rcpi[2] = FIELD_GET(MT_RXV4_RCPI2, rxv4);
+	phy->test.last_rcpi[3] = FIELD_GET(MT_RXV4_RCPI3, rxv4);
+	phy->test.last_ib_rssi[0] = FIELD_GET(MT_RXV3_IB_RSSI, rxv3);
+	phy->test.last_wb_rssi[0] = FIELD_GET(MT_RXV3_WB_RSSI, rxv3);
 #endif
 }
 
@@ -435,7 +435,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 					     status->chain_signal[i]);
 		}
 
-		mt7615_mac_fill_tm_rx(dev, rxd);
+		mt7615_mac_fill_tm_rx(mphy->priv, rxd);
 
 		rxd += 6;
 		if ((u8 *)rxd - skb->data >= skb->len)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 99b8abdbb08f..50e732bcb0d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -195,6 +195,17 @@ struct mt7615_phy {
 	struct timer_list roc_timer;
 	wait_queue_head_t roc_wait;
 	bool roc_grant;
+
+#ifdef CONFIG_NL80211_TESTMODE
+	struct {
+		u32 *reg_backup;
+
+		s16 last_freq_offset;
+		u8 last_rcpi[4];
+		s8 last_ib_rssi[4];
+		s8 last_wb_rssi[4];
+	} test;
+#endif
 };
 
 #define mt7615_mcu_add_tx_ba(dev, ...)	(dev)->mcu_ops->add_tx_ba((dev), __VA_ARGS__)
@@ -281,17 +292,6 @@ struct mt7615_dev {
 
 	u32 muar_mask;
 
-#ifdef CONFIG_NL80211_TESTMODE
-	struct {
-		u32 *reg_backup;
-
-		s16 last_freq_offset;
-		u8 last_rcpi[4];
-		s8 last_ib_rssi[4];
-		s8 last_wb_rssi[4];
-	} test;
-#endif
-
 	struct {
 		bool enable;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
index f70367d2d317..b82915445d0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
@@ -98,12 +98,12 @@ static void
 mt7615_tm_reg_backup_restore(struct mt7615_phy *phy)
 {
 	struct mt7615_dev *dev = phy->dev;
-	u32 *b = dev->test.reg_backup;
+	u32 *b = phy->test.reg_backup;
 	int n_regs = ARRAY_SIZE(reg_backup_list);
 	int n_rf_regs = ARRAY_SIZE(rf_backup_list);
 	int i;
 
-	if (dev->mphy.test.state == MT76_TM_STATE_OFF) {
+	if (phy->mt76->test.state == MT76_TM_STATE_OFF) {
 		for (i = 0; i < n_regs; i++)
 			mt76_wr(dev, reg_backup_list[i], b[i]);
 
@@ -121,7 +121,7 @@ mt7615_tm_reg_backup_restore(struct mt7615_phy *phy)
 	if (!b)
 		return;
 
-	dev->test.reg_backup = b;
+	phy->test.reg_backup = b;
 	for (i = 0; i < n_regs; i++)
 		b[i] = mt76_rr(dev, reg_backup_list[i]);
 	for (i = 0; i < n_rf_regs; i++)
@@ -323,7 +323,6 @@ static int
 mt7615_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 {
 	struct mt7615_phy *phy = mphy->priv;
-	struct mt7615_dev *dev = phy->dev;
 	void *rx, *rssi;
 	int i;
 
@@ -331,15 +330,15 @@ mt7615_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
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
@@ -348,8 +347,8 @@ mt7615_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 	if (!rssi)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(dev->test.last_ib_rssi); i++)
-		if (nla_put_s8(msg, i, dev->test.last_ib_rssi[i]))
+	for (i = 0; i < ARRAY_SIZE(phy->test.last_ib_rssi); i++)
+		if (nla_put_s8(msg, i, phy->test.last_ib_rssi[i]))
 			return -ENOMEM;
 
 	nla_nest_end(msg, rssi);
@@ -358,8 +357,8 @@ mt7615_tm_dump_stats(struct mt76_phy *mphy, struct sk_buff *msg)
 	if (!rssi)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(dev->test.last_wb_rssi); i++)
-		if (nla_put_s8(msg, i, dev->test.last_wb_rssi[i]))
+	for (i = 0; i < ARRAY_SIZE(phy->test.last_wb_rssi); i++)
+		if (nla_put_s8(msg, i, phy->test.last_wb_rssi[i]))
 			return -ENOMEM;
 
 	nla_nest_end(msg, rssi);
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
