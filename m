Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54672606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FkS56/MR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BHNf26t7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eJ9Gs2Cy0ijKMWAvOk/47YDuthDZ9jVGTFLp96c/dkU=; b=FkS56/MR/RRq4rt79MjgEiEyGF
	UqwhO/l25GSGAFp6C/WCqObck4QReexwLPRy0WIDjvYiUPfBHG5Bx1wT9xMwH/C3yPH6EHzlJ77i8
	4Gjgsrzvj7z9urvdhQZPmZZ/ptDqRdoAlGYAIOFuZ+rYhRfTZQiJmhh5AtG2prZKEp0zRmnTKjDSq
	rN1qvq6SRmYSKZU5ZlFCFxHdPu7MYhfn4s7LvbOkl5gC0L0dMN2Ay+wTOHXnGUa1l3TGNtPLd1xtl
	6r2vhI2FlGtPFXAnZ0250Fv5xfBy4tffLg6y+SgxRW2N7Hqrt4h/qTxQKTZGaLw3mjxKposKX9poi
	wFxzrTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrRR-0000000FGdu-2CVl;
	Fri, 27 Nov 2026 08:36:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQx-0000000FGF1-0Yce;
	Fri, 27 Nov 2026 08:35:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8308C62405;
	Fri, 27 Nov 2026 08:35:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795768554;
	b=eyb601jrWUVDOOG+kLkU4kaRq1S+xbWKy/Tc/JPl5946aEvhOBhJ+HFpl8xrtMZSlFlN
	 +dfirOqRcBeT70+VYTq6v8nspAyiCkSi875UBV4I9T5iUcbUGCd+Wo/DmAOlPlV7CFcWx
	 sep54w1/VgbTSQnIVagyzJ3SQwN5gVcaWHA+Pw3nryI95Q5zavfKzkzCI4am/EijQI5vP
	 glUWt3dQ1adkY89/IGJ45ofSm0wox45RgrzD5YrVDO+82nCV7o6R6TGHdT4+YPYyrXZbj
	 QfDptp0RxtxlacmHRhBfUE5P4TwsbzClPUVIc4wIfwrp5uFdsztxEmExgQGly7muYlw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795768554;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eJ9Gs2Cy0ijKMWAvOk/47YDuthDZ9jVGTFLp96c/dkU=;
	b=HmrKwj/hJh+U46jy4UDIeAvtTGSOkRoZ+3DZtU/bLKOHMN1zyCjUDYK0LGdrYPxrrjE6
	 zAL75L98iE1j7cRVRpLny+z6M0se+dgUe7NP74uZCEKxxgRdpTMQSKQk/W2OZinV01wLp
	 rsM9AZTijOUfBve5efsjG2+vmusH9Uhd6ByRKTY3qNCS870rxG51kW/srrD/qZFByIM1K
	 bU0Evk5JHGSVkYYGKtTWGqLQxHSh8HIIu7kz9NEAAZQsPI1jvYTwxe2pe21Tz8byDs0iG
	 y2XcjpH48FH8JrddE/PT1Jgxy47500LKsgTIxBvRtCHG8f/vxKTDooRYd9c0r3JUVGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95EAD1F00899;
	Fri, 27 Nov 2026 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768554;
	bh=eJ9Gs2Cy0ijKMWAvOk/47YDuthDZ9jVGTFLp96c/dkU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BHNf26t7jJEUWyZaexZcqzmwdYzPTy/gQ99YYlDjoSO/Pw5UDHMruWjAX4oErGmM5
	 0N23f4LvMCuptYpkB0wkAVomahhqI5CWI3q4U+GHf6gvBPlivZyH4zrL2gH+4zo/JA
	 KVHcxuVc/LRxkAg6zuz+AvrUa0WjcLzl7QBZq9ATk6si+QzLJs73ISWpIEMETXl6hp
	 vZJQn6uMCK2ew6SwV9BnDwhDK7HomOdF8JTuMZAhHpNTxWnCo1SSo+RFQDmazEv8YB
	 6rvxwyl+VpA2KaxIhb5Yk9u3npajbU/RUPzS/smpvx+/1npWwI1vTCoXOTE/b8A/TZ
	 WAT2TizwXwOCw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 91F8B4B662;
	Fri, 27 Nov 2026 08:35:29 +0000 (UTC)
From: Murad Dadashev via B4 Relay <devnull+llamapersonaltv.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 11:35:21 +0300
Subject: [PATCH 10/10] wifi: mt76: mt7603: add AP mode support for USB
 devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-mt7603u-v1-10-369bee9846f8@gmail.com>
References: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
In-Reply-To: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Murad Dadashev <llamapersonaltv@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768526; l=11243;
 i=llamapersonaltv@gmail.com; s=20261127; h=from:subject:message-id;
 bh=oIVDiznFtbEiHfDvKaI3R8UWpSS1eTZBq/2J5Ma2jH8=;
 b=9MwGLt2g//Dgqwvsj+k/fqD8Vp/Ev0YGP7n1ewGEvr16R2S9fwU0dhLqmq8xzrc4+PJLFWFTr
 YF1y0VYQtQoDaEya+hA7MFAVo4cw+g67J0RUu6ocNRYet5c4oaZ0PbD
X-Developer-Key: i=llamapersonaltv@gmail.com; a=ed25519;
 pk=CeMIX207ioWRbMAA6A2GYgT+DpeVlKHVn7I0KjfHeCg=
X-Endpoint-Received: by B4 Relay for llamapersonaltv@gmail.com/20261127
 with auth_id=1664
X-Original-From: Murad Dadashev <llamapersonaltv@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: llamapersonaltv@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Murad Dadashev <llamapersonaltv@gmail.com>

USB devices have no pre-TBTT interrupt and no beacon or CAB rings.
Instead, arm an hrtimer from the TSF ahead of each TBTT. From a work
item, flush the hardware BCN and BMC queues and queue the beacon and
buffered broadcast frames on the management endpoint, with the target
hardware queue set in the TXD.

Tested on a 0e8d:7603 dongle with hostapd and a WPA2 client at about
56 Mbit/s in each direction.

Signed-off-by: Murad Dadashev <llamapersonaltv@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c | 217 +++++++++++++++++++--
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |   3 +
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |   7 +
 drivers/net/wireless/mediatek/mt76/mt7603/usb.c    |   1 +
 4 files changed, 208 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
index acca98139f92e50caf4801ea0dc23a4407acb4e0..30509da0d41e7d02b1e98ea800fb19db00f71fe7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
@@ -26,6 +26,28 @@ mt7603_mac_stuck_beacon_recovery(struct mt7603_dev *dev)
 	mt76_clear(dev, MT_WF_CFG_OFF_WOCCR, MT_WF_CFG_OFF_WOCCR_TMAC_GC_DIS);
 }
 
+static bool
+mt7603_flush_bss_queues(struct mt7603_dev *dev, int idx)
+{
+	u32 om_idx = idx ? idx | 0x10 : 0;
+	u32 val;
+
+	val = MT_DMA_FQCR0_BUSY | MT_DMA_FQCR0_MODE |
+	      FIELD_PREP(MT_DMA_FQCR0_TARGET_BSS, om_idx) |
+	      FIELD_PREP(MT_DMA_FQCR0_DEST_PORT_ID, 3) |
+	      FIELD_PREP(MT_DMA_FQCR0_DEST_QUEUE_ID, 8);
+
+	mt76_wr(dev, MT_DMA_FQCR0, val |
+		FIELD_PREP(MT_DMA_FQCR0_TARGET_QID, MT_TX_HW_QUEUE_BCN));
+	if (!mt76_poll(dev, MT_DMA_FQCR0, MT_DMA_FQCR0_BUSY, 0, 5000))
+		return false;
+
+	mt76_wr(dev, MT_DMA_FQCR0, val |
+		FIELD_PREP(MT_DMA_FQCR0_TARGET_QID, MT_TX_HW_QUEUE_BMC));
+
+	return mt76_poll(dev, MT_DMA_FQCR0, MT_DMA_FQCR0_BUSY, 0, 5000);
+}
+
 static void
 mt7603_update_beacon_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
@@ -33,8 +55,6 @@ mt7603_update_beacon_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	struct mt76_dev *mdev = &dev->mt76;
 	struct mt7603_vif *mvif = (struct mt7603_vif *)vif->drv_priv;
 	struct sk_buff *skb = NULL;
-	u32 om_idx = mvif->idx;
-	u32 val;
 
 	if (!(mdev->beacon_mask & BIT(mvif->idx)))
 		return;
@@ -43,26 +63,9 @@ mt7603_update_beacon_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	if (!skb)
 		return;
 
-	if (om_idx)
-		om_idx |= 0x10;
-	val = MT_DMA_FQCR0_BUSY | MT_DMA_FQCR0_MODE |
-		FIELD_PREP(MT_DMA_FQCR0_TARGET_BSS, om_idx) |
-		FIELD_PREP(MT_DMA_FQCR0_DEST_PORT_ID, 3) |
-		FIELD_PREP(MT_DMA_FQCR0_DEST_QUEUE_ID, 8);
-
 	spin_lock_bh(&dev->ps_lock);
 
-	mt76_wr(dev, MT_DMA_FQCR0, val |
-		FIELD_PREP(MT_DMA_FQCR0_TARGET_QID, MT_TX_HW_QUEUE_BCN));
-	if (!mt76_poll(dev, MT_DMA_FQCR0, MT_DMA_FQCR0_BUSY, 0, 5000)) {
-		dev->beacon_check = MT7603_WATCHDOG_TIMEOUT;
-		dev_kfree_skb(skb);
-		goto out;
-	}
-
-	mt76_wr(dev, MT_DMA_FQCR0, val |
-		FIELD_PREP(MT_DMA_FQCR0_TARGET_QID, MT_TX_HW_QUEUE_BMC));
-	if (!mt76_poll(dev, MT_DMA_FQCR0, MT_DMA_FQCR0_BUSY, 0, 5000)) {
+	if (!mt7603_flush_bss_queues(dev, mvif->idx)) {
 		dev->beacon_check = MT7603_WATCHDOG_TIMEOUT;
 		dev_kfree_skb(skb);
 		goto out;
@@ -179,6 +182,172 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 		 ((1 << (MT7603_MAX_INTERFACES - 1)) - 1)));
 }
 
+static void
+mt7603_get_beacon_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct beacon_bc_data *data = priv;
+	struct mt7603_dev *dev = data->dev;
+	struct mt7603_vif *mvif = (struct mt7603_vif *)vif->drv_priv;
+	struct sk_buff *skb;
+
+	if (!(dev->mt76.beacon_mask & BIT(mvif->idx)))
+		return;
+
+	skb = ieee80211_beacon_get(mt76_hw(dev), vif, 0);
+	if (!skb)
+		return;
+
+	IEEE80211_SKB_CB(skb)->control.vif = vif;
+	__skb_queue_tail(&data->q, skb);
+}
+
+static void
+mt7603_queue_bss_frame(struct mt7603_dev *dev, struct sk_buff *skb,
+		       enum mt76_txq_id qid)
+{
+	struct mt76_queue *q = dev->mphy.q_tx[MT_TXQ_PSD];
+	struct ieee80211_vif *vif = IEEE80211_SKB_CB(skb)->control.vif;
+	struct mt7603_vif *mvif = (struct mt7603_vif *)vif->drv_priv;
+
+	spin_lock_bh(&q->lock);
+	mt76_tx_queue_skb(dev, q, qid, skb, &mvif->sta.wcid, NULL);
+	spin_unlock_bh(&q->lock);
+}
+
+static void
+mt7603_kick_bss_queue(struct mt7603_dev *dev)
+{
+	struct mt76_queue *q = dev->mphy.q_tx[MT_TXQ_PSD];
+
+	spin_lock_bh(&q->lock);
+	mt76_queue_kick(dev, q);
+	spin_unlock_bh(&q->lock);
+}
+
+static void
+mt7603_start_pre_tbtt_timer(struct mt7603_dev *dev)
+{
+	u32 period = dev->mt76.beacon_int * 1024;
+	u32 lead = 2 * MT7603_PRE_TBTT_TIME;
+	s64 delay;
+	u64 tsf;
+	u32 rem;
+
+	if (!period)
+		return;
+
+	mt76_set(dev, MT_LPON_T0CR, MT_LPON_T0CR_MODE);
+	tsf = mt76_rr(dev, MT_LPON_UTTR0);
+	tsf |= (u64)mt76_rr(dev, MT_LPON_UTTR1) << 32;
+	rem = do_div(tsf, period);
+
+	delay = (s64)period - rem - lead;
+	if (delay < lead / 2)
+		delay += period;
+
+	hrtimer_start(&dev->pre_tbtt_timer, ns_to_ktime(delay * NSEC_PER_USEC),
+		      HRTIMER_MODE_REL);
+}
+
+void mt7603_stop_pre_tbtt_timer(struct mt7603_dev *dev)
+{
+	WRITE_ONCE(dev->pre_tbtt_enabled, false);
+	do {
+		hrtimer_cancel(&dev->pre_tbtt_timer);
+		cancel_work_sync(&dev->pre_tbtt_work);
+	} while (hrtimer_active(&dev->pre_tbtt_timer));
+}
+EXPORT_SYMBOL_GPL(mt7603_stop_pre_tbtt_timer);
+
+enum hrtimer_restart mt7603_pre_tbtt_timer(struct hrtimer *timer)
+{
+	struct mt7603_dev *dev = container_of(timer, struct mt7603_dev,
+					      pre_tbtt_timer);
+
+	queue_work(system_highpri_wq, &dev->pre_tbtt_work);
+
+	return HRTIMER_NORESTART;
+}
+
+void mt7603_pre_tbtt_work(struct work_struct *work)
+{
+	struct mt7603_dev *dev = container_of(work, struct mt7603_dev,
+					      pre_tbtt_work);
+	struct beacon_bc_data data = {};
+	struct sk_buff *skb;
+	int i, nframes;
+
+	if (!READ_ONCE(dev->pre_tbtt_enabled) || !dev->mt76.beacon_mask)
+		return;
+
+	if (dev->mphy.offchannel)
+		goto out;
+
+	data.dev = dev;
+	__skb_queue_head_init(&data.q);
+
+	mt76_wr(dev, MT_WF_ARB_CAB_FLUSH, GENMASK(30, 16) | BIT(0));
+
+	ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
+						   IEEE80211_IFACE_ITER_RESUME_ALL,
+						   mt7603_get_beacon_iter, &data);
+
+	while ((skb = __skb_dequeue(&data.q)) != NULL) {
+		struct ieee80211_vif *vif = IEEE80211_SKB_CB(skb)->control.vif;
+		struct mt7603_vif *mvif = (struct mt7603_vif *)vif->drv_priv;
+
+		if (!mt7603_flush_bss_queues(dev, mvif->idx)) {
+			dev_kfree_skb(skb);
+			continue;
+		}
+
+		mt7603_queue_bss_frame(dev, skb, MT_TXQ_BEACON);
+	}
+
+	mt76_csa_check(&dev->mt76);
+	if (dev->mt76.csa_complete) {
+		mt76_csa_finish(&dev->mt76);
+		goto kick;
+	}
+
+	do {
+		nframes = skb_queue_len(&data.q);
+		ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
+							   IEEE80211_IFACE_ITER_RESUME_ALL,
+							   mt7603_add_buffered_bc, &data);
+	} while (nframes != skb_queue_len(&data.q) &&
+		 skb_queue_len(&data.q) < 8);
+
+	if (skb_queue_empty(&data.q))
+		goto kick;
+
+	for (i = 0; i < ARRAY_SIZE(data.tail); i++) {
+		if (data.tail[i])
+			mt76_skb_set_moredata(data.tail[i], false);
+	}
+
+	while ((skb = __skb_dequeue(&data.q)) != NULL)
+		mt7603_queue_bss_frame(dev, skb, MT_TXQ_CAB);
+
+	mt7603_kick_bss_queue(dev);
+
+	for (i = 0; i < ARRAY_SIZE(data.count); i++)
+		mt76_wr(dev, MT_WF_ARB_CAB_COUNT_B0_REG(i),
+			data.count[i] << MT_WF_ARB_CAB_COUNT_B0_SHIFT(i));
+
+	mt76_wr(dev, MT_WF_ARB_CAB_START,
+		MT_WF_ARB_CAB_START_BSSn(0) |
+		(MT_WF_ARB_CAB_START_BSS0n(1) *
+		 ((1 << (MT7603_MAX_INTERFACES - 1)) - 1)));
+	goto out;
+
+kick:
+	mt7603_kick_bss_queue(dev);
+out:
+	if (READ_ONCE(dev->pre_tbtt_enabled))
+		mt7603_start_pre_tbtt_timer(dev);
+}
+
 void mt7603_beacon_set_timer(struct mt7603_dev *dev, int idx, int intval)
 {
 	u32 pre_tbtt = MT7603_PRE_TBTT_TIME / 64;
@@ -194,6 +363,8 @@ void mt7603_beacon_set_timer(struct mt7603_dev *dev, int idx, int intval)
 		mt7603_irq_disable(dev, MT_INT_MAC_IRQ3);
 		mt76_clear(dev, MT_ARB_SCR, MT_ARB_SCR_BCNQ_OPMODE_MASK);
 		mt76_wr(dev, MT_HW_INT_MASK(3), 0);
+		if (!mt76_is_mmio(&dev->mt76))
+			mt7603_stop_pre_tbtt_timer(dev);
 		return;
 	}
 
@@ -224,4 +395,10 @@ void mt7603_beacon_set_timer(struct mt7603_dev *dev, int idx, int intval)
 		mt76_set(dev, MT_LPON_SBTOR(0), MT_LPON_SBTOR_SUB_BSS_EN);
 	else
 		mt76_clear(dev, MT_LPON_SBTOR(0), MT_LPON_SBTOR_SUB_BSS_EN);
+
+	if (!mt76_is_mmio(&dev->mt76)) {
+		WRITE_ONCE(dev->pre_tbtt_enabled, true);
+		if (!hrtimer_active(&dev->pre_tbtt_timer))
+			mt7603_start_pre_tbtt_timer(dev);
+	}
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index d1db7176c0fa9ed451ed8bfa45071ace36493f67..87abbed8b2a1aa1c945e8a3f86239de758206784 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -528,6 +528,9 @@ int mt7603_register_device(struct mt7603_dev *dev)
 
 	INIT_DELAYED_WORK(&dev->mphy.mac_work, mt7603_mac_work);
 	tasklet_setup(&dev->mt76.pre_tbtt_tasklet, mt7603_pre_tbtt_tasklet);
+	INIT_WORK(&dev->pre_tbtt_work, mt7603_pre_tbtt_work);
+	hrtimer_setup(&dev->pre_tbtt_timer, mt7603_pre_tbtt_timer,
+		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 
 	dev->slottime = 9;
 	dev->sensitivity_limit = 28;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 1b50c6b4bb8faf277e126f9c18fefbaa88150d41..f30e866e5cffe5b6d5113a43a5f0649c060c8a7d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -121,6 +121,10 @@ struct mt7603_dev {
 
 	struct work_struct ps_work;
 
+	struct hrtimer pre_tbtt_timer;
+	struct work_struct pre_tbtt_work;
+	bool pre_tbtt_enabled;
+
 	u32 rxfilter;
 
 	struct mt7603_sta global_sta;
@@ -278,6 +282,9 @@ void mt7603_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta);
 
 void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t);
+void mt7603_pre_tbtt_work(struct work_struct *work);
+enum hrtimer_restart mt7603_pre_tbtt_timer(struct hrtimer *timer);
+void mt7603_stop_pre_tbtt_timer(struct mt7603_dev *dev);
 
 void mt7603_update_channel(struct mt76_phy *mphy);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/usb.c b/drivers/net/wireless/mediatek/mt76/mt7603/usb.c
index 9fbfb2a7cd00674bb1dbf9015ba22b149b73f4e9..2254de2f88c76c3bfe4a1c6d996dbe1d7ecd0730 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/usb.c
@@ -321,6 +321,7 @@ static void mt7603u_disconnect(struct usb_interface *usb_intf)
 
 	if (test_bit(MT76_STATE_REGISTERED, &dev->mphy.state)) {
 		mt76_unregister_device(&dev->mt76);
+		mt7603_stop_pre_tbtt_timer(dev);
 		cancel_work_sync(&dev->rate_work);
 		cancel_work_sync(&dev->ps_work);
 	}

-- 
2.47.3



