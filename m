Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383B6C982FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 13:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EX1VzfZzdxgKhe9AzEUoAY9EzOmYKmZDACKtysZ0X0=; b=GZ3Aoz3yzDuiKJ+OLPBLcn8rb5
	ID3g/2vXNr8vuDdzjjSZrtLtPlEWHOGAjI5xDmlqvWrmfQUho62iwxMBKDfNjjNaHw/3SydK0ULyj
	+GwxrCogqVooEu6o0H7E0IM/ladLFBb5bRmOwGBhR/vm1PVilDFzTYaTcRR/7RFeRU2lNMp583lH1
	bcBWky/GO288foVpYkxbb9m/craTHAzcD9G1BRixer7VmcCT/aZpgXKtvDPnMEqCiMLks2Hl1YXto
	ciPkK6hvs1sQdrZyrq9mgwBqUCIblRX34Zn2WN9mAR3xWhKEAaRuaWXSeKbC4zTwOz3XdbMnltmPd
	F999JwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Mwa-00000008Nfc-0ND0;
	Wed, 23 Sep 2026 13:23:28 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MwX-00000008Nds-0m4z
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 13:23:26 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-78a338fe106so1839122137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169804; x=1790774604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EX1VzfZzdxgKhe9AzEUoAY9EzOmYKmZDACKtysZ0X0=;
        b=ryj68y8G9J2BlAfZAG1NkfLi3wftzHedLmKzypb7lKkc6saRILH+oxsuc2Lax4aAH1
         o7b24zKVvLmRhwMpwM7+iM3itbbCYIfFuzu34x1SQXtLTyRBoqjpkYBOBtc52lLUJlAN
         QPudvXGAJRhC4Nm5ZaDeGHHSTQdw2h6F791gCota1ojC4aNdL+bVEqHZ3Je62v//sKy6
         OHkpMc6D9bfxHIYF6r5m4WeVkPAfj75RTxu4qKgBi4TX5jOto9S8ntDqy+8E9YCL9EHX
         4/ZUMeGxCDhdPX9+wpsKlp5LaS7L5tPg1aqBW+70zuFK7zQjhAS9awJXn1LyFeYnd4bQ
         qVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169804; x=1790774604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EX1VzfZzdxgKhe9AzEUoAY9EzOmYKmZDACKtysZ0X0=;
        b=Uty+EMfwZXd5mqfYXE8J38g+AwpEIuJLVYqRB4/AriB8hhU+SmxkOz11EM4PQ8eA/S
         EN+z/mEV1T2TliG0zkj95+IuKv62t3lrCXavEge1qdfEuT8UpScwLf/840zuX6XuQKow
         axhB+ZybiE4Wa4LChYPA8QSe3otbOC2qpzsvSZ77jx5/4MwJCE3+a8RM+e+PoNjocwgU
         fofsh1cIbE+cE3vaQi6V0PZpTLBC9QSHirtPlgC7fr5JQQ6MA50mMUXJNcIBvwBY6DR+
         TwzwKzU5p4SVP/MZbyf2zNr9ObGzhjj24xz60J5lpXZ0pK2/7Ymj8kOfZb1xMIY5cU8g
         jMKQ==
X-Forwarded-Encrypted: i=1; AKwUvBza+FeSkxQ7oHDGEVbBJj9DRuAzDGbqOdqWwLJ01aMR6JG/qUHq6N9QZrqwxHQRlFVCLhm370kynbCUfDa/yA==@lists.infradead.org
X-Gm-Message-State: AFuF++k5LIclU4HfFfiNXo/fF9/tR78VIX9G2dFY7kMDU7r0dxRoeeLR
	pATHIFtKL0/JxywTAW2MZ2qXiEhtMv5F2FWrxPh9j8xUAUYSlq3+TLS7
X-Gm-Gg: AYBFou0ScvBZAfyth9DGfLGv5k0TAVFAKF2WFTlzNtHiSaUNlE0tQz+xaVd+b402Wxi
	JAczksNQ9mz806T1iAkSFc/P8J0gZLOUDJHtY8SNCJug/89GVLmjDCD0uZX3iqwJVf7ljBPSVfc
	v3d82+q512Os6LSV3fqgS9ZGyCEZg3pilN5KBkGVmdEFdKo+bGu73lJaogNUQyjasnpCnqmO5Qn
	ZkxfmXAMkHjEiqYEp3wp1eaQJ/Q4i5OmBXqv9uhYs/vySUymgD6kFFDmvM8XMFO7gTBUhqdJtu5
	W4lZzqkgGUhFM5gJo4olt8pYi7p5kx7ad4YiPBJ9FOsuQ6rbKyzz3RatKrTVUGkngXhLijFtnnD
	ilyfHZFEWHDTz0fsxrXf/HCh3o1uRbnj8f1yye0fhCoDxOoMFEWnsgANpWwcbOKPBHdTAzsy4mu
	p3knOrWjRMrjnTFlAWKErD3PQIcV85GnbhGzKm75L1mgZn8VgNC/mUW6HaroaczT7ar3DALU/XO
	VwsBEE1NXxh/fSlCcH0jtw/6NeAtPT1a0usHs+RCK4/ydW6Kg2q7QzGiw==
X-Received: by 2002:a05:6102:3a10:b0:7a1:f2b5:646d with SMTP id ada2fe7eead31-7aaa10286eamr5984965137.42.1790169803635;
        Wed, 23 Sep 2026 06:23:23 -0700 (PDT)
Received: from localhost.localdomain ([190.177.169.131])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98517a8ecaesm2910924241.12.2026.09.23.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:23:23 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 2/2] wifi: mt76: mt7603: bound the frames a station keeps in the hardware
Date: Wed, 23 Sep 2026 10:22:56 -0300
Message-ID: <20260923132257.8729-3-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923132257.8729-1-pcristian292@gmail.com>
References: <20260923132257.8729-1-pcristian292@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_062325_266390_893E4FE6 
X-CRM114-Status: GOOD (  27.53  )
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

mt7603 completes a frame to mac80211 once DMA has copied it into the
hardware, so AQL does not see the frames the hardware still holds for a
station. With one client downloading, the hardware held about 200 frames
for it, nearly the whole 256-entry tx ring, and up to about 750 under
bidirectional load, when frames also wait in the PSE.

Each time the station enters power save, the PSE loops all of them back
to the host. The PS queue keeps at most 64 of them and frees the oldest
to make room. A client that toggles PM often, like a phone with
Bluetooth coexistence, turns this into a steady loss of data frames:
with one client downloading, the frames freed per second roughly
matched its TCP retransmissions per second.

Count, per station, the frames queued to the hardware that still owe a
TX status: counted when queued, settled by the TX status or by the
loop-back return. Hold the station's tx queues with MT_WCID_FLAG_TX_HOLD
at 96 frames and release them at 48, and let the PS queue keep up to the
tx ring size minus 64 frames, so that what the hardware loops back fits
and is sent again on wake-up. Either change alone makes bursts of PM
toggling worse: without the cap, a larger queue lets the hardware loop
back hundreds of frames over and over, and with the cap, the smaller
queue still frees the frames above 64.

The marks can be changed, or the cap turned off with 0, in debugfs
(hw_cap_high, hw_cap_low); hw_cap shows the count per station.

Every frame counted ends in a TX status or a loop-back return. If a held
station sees neither for a second, reset its count and release it rather
than keep it on hold.

In a 30 minute bidirectional test that cycled through the four
combinations every minute, the cap with the larger queue freed no
frames from the PS queue (92 per second without either change), and
the downlink stalled for 10 seconds (45), with 3 TCP retransmissions per
second (15) and 0.1% of pings lost (6%).

Assisted-by: LLM
Signed-off-by: Cristian Papa <pcristian292@gmail.com>
---
 .../wireless/mediatek/mt76/mt7603/debugfs.c   | 32 ++++++++++
 .../net/wireless/mediatek/mt76/mt7603/dma.c   |  7 ++-
 .../net/wireless/mediatek/mt76/mt7603/init.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7603/mac.c   | 58 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7603/main.c  | 20 +++++--
 .../wireless/mediatek/mt76/mt7603/mt7603.h    | 51 ++++++++++++++++
 6 files changed, 164 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
index c891ad549..7e61a2b53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/debugfs.c
@@ -93,6 +93,34 @@ mt7603_ampdu_stat_show(struct seq_file *file, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(mt7603_ampdu_stat);
 
+static int
+mt7603_hw_cap_read(struct seq_file *s, void *data)
+{
+	struct mt7603_dev *dev = dev_get_drvdata(s->private);
+	int i;
+
+	seq_printf(s, "high %u low %u resync %u\n",
+		   READ_ONCE(dev->hw_cap_high), READ_ONCE(dev->hw_cap_low),
+		   READ_ONCE(dev->hw_cap_resync));
+
+	rcu_read_lock();
+	for (i = 0; i < MT7603_WTBL_STA; i++) {
+		struct mt76_wcid *wcid = mt76_wcid_ptr(dev, i);
+		struct mt7603_sta *msta;
+
+		if (!wcid || !wcid->sta)
+			continue;
+
+		msta = container_of(wcid, struct mt7603_sta, wcid);
+		seq_printf(s, "wcid %d pending %d hold %d\n", i,
+			   atomic_read(&msta->hw_pending),
+			   test_bit(MT_WCID_FLAG_TX_HOLD, &wcid->flags));
+	}
+	rcu_read_unlock();
+
+	return 0;
+}
+
 void mt7603_init_debugfs(struct mt7603_dev *dev)
 {
 	struct dentry *dir;
@@ -115,4 +143,8 @@ void mt7603_init_debugfs(struct mt7603_dev *dev)
 			    &dev->sensitivity_limit);
 	debugfs_create_bool("dynamic_sensitivity", 0600, dir,
 			    &dev->dynamic_sensitivity);
+	debugfs_create_u32("hw_cap_high", 0600, dir, &dev->hw_cap_high);
+	debugfs_create_u32("hw_cap_low", 0600, dir, &dev->hw_cap_low);
+	debugfs_create_devm_seqfile(dev->mt76.dev, "hw_cap", dir,
+				    mt7603_hw_cap_read);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
index 491c8c937..b5ae68d29 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
@@ -49,6 +49,11 @@ mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 
 	priv = msta = container_of(wcid, struct mt7603_sta, wcid);
 
+	/* The frame left the hardware: its TX status will not arrive. */
+	if (wcid->sta &&
+	    FIELD_GET(MT_TXD5_PID, le32_to_cpu(txd[5])) != MT_PACKET_ID_NO_ACK)
+		mt7603_hw_pending_dec(dev, msta);
+
 	sta = container_of(priv, struct ieee80211_sta, drv_priv);
 	hdr = (struct ieee80211_hdr *)&skb->data[MT_TXD_SIZE];
 
@@ -97,7 +102,7 @@ mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 
 	spin_lock_bh(&dev->ps_lock);
 	__skb_queue_tail(&msta->psq, skb);
-	if (skb_queue_len(&msta->psq) >= 64) {
+	if (skb_queue_len(&msta->psq) >= MT7603_PSQ_MAX) {
 		skb = __skb_dequeue(&msta->psq);
 		dev_kfree_skb(skb);
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index 10f2ec70c..900dda2ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -518,6 +518,8 @@ int mt7603_register_device(struct mt7603_dev *dev)
 	dev->slottime = 9;
 	dev->sensitivity_limit = 28;
 	dev->dynamic_sensitivity = true;
+	dev->hw_cap_high = MT7603_HW_CAP_HIGH;
+	dev->hw_cap_low = MT7603_HW_CAP_LOW;
 
 	ret = mt7603_init_hardware(dev);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index fa0bf9a20..6d8026abc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -1095,6 +1095,10 @@ int mt7603_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 
 	pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
 
+	/* Owed until its TX status arrives or a loop-back returns it. */
+	if (sta && pid != MT_PACKET_ID_NO_ACK)
+		mt7603_hw_pending_inc(dev, msta);
+
 	if (info->flags & IEEE80211_TX_CTL_RATE_CTRL_PROBE) {
 		spin_lock_bh(&dev->mt76.lock);
 		mt7603_wtbl_set_rates(dev, msta, &info->control.rates[0],
@@ -1300,6 +1304,9 @@ void mt7603_mac_add_txs(struct mt7603_dev *dev, void *data)
 	sta = wcid_to_sta(wcid);
 	mt76_wcid_add_poll(&dev->mt76, &msta->wcid);
 
+	if (wcid->sta)
+		mt7603_hw_pending_dec(dev, msta);
+
 	if (mt7603_mac_add_txs_skb(dev, msta, pid, txs_data))
 		goto out;
 
@@ -1876,6 +1883,56 @@ mt7603_mac_ps_check(struct mt7603_dev *dev)
 	rcu_read_unlock();
 }
 
+/* Lift the hold on a station's tx queues and get the scheduler going. */
+void mt7603_hw_release(struct mt7603_dev *dev, struct mt7603_sta *msta)
+{
+	struct ieee80211_sta *sta;
+	int i;
+
+	if (!test_and_clear_bit(MT_WCID_FLAG_TX_HOLD, &msta->wcid.flags))
+		return;
+
+	sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
+	for (i = 0; i < ARRAY_SIZE(sta->txq); i++)
+		if (sta->txq[i])
+			ieee80211_schedule_txq(mt76_hw(dev), sta->txq[i]);
+	mt76_worker_schedule(&dev->mt76.tx_worker);
+}
+
+/*
+ * Every frame counted ends in a TX status or a loop-back return. If a held
+ * station saw neither for a second, its count is off: start over instead
+ * of keeping it on hold. Turning the cap off releases every hold.
+ */
+static void
+mt7603_hw_cap_check(struct mt7603_dev *dev)
+{
+	bool enabled = READ_ONCE(dev->hw_cap_high);
+	int i;
+
+	rcu_read_lock();
+	for (i = 0; i < MT7603_WTBL_STA; i++) {
+		struct mt76_wcid *wcid = mt76_wcid_ptr(dev, i);
+		struct mt7603_sta *msta;
+
+		if (!wcid || !wcid->sta ||
+		    !test_bit(MT_WCID_FLAG_TX_HOLD, &wcid->flags))
+			continue;
+
+		msta = container_of(wcid, struct mt7603_sta, wcid);
+		if (enabled &&
+		    time_before(jiffies, READ_ONCE(msta->hw_settled) + HZ))
+			continue;
+
+		if (enabled) {
+			atomic_set(&msta->hw_pending, 0);
+			dev->hw_cap_resync++;
+		}
+		mt7603_hw_release(dev, msta);
+	}
+	rcu_read_unlock();
+}
+
 void mt7603_mac_work(struct work_struct *work)
 {
 	struct mt7603_dev *dev = container_of(work, struct mt7603_dev,
@@ -1891,6 +1948,7 @@ void mt7603_mac_work(struct work_struct *work)
 	mt76_update_survey(&dev->mphy);
 	mt7603_edcca_check(dev);
 	mt7603_mac_ps_check(dev);
+	mt7603_hw_cap_check(dev);
 
 	for (i = 0, idx = 0; i < 2; i++) {
 		u32 val = mt76_rr(dev, MT_TX_AGG_CNT(i));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/main.c b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
index 757664e9e..6a18f4013 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
@@ -339,6 +339,8 @@ mt7603_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 
 	INIT_LIST_HEAD(&msta->wcid.poll_list);
 	__skb_queue_head_init(&msta->psq);
+	atomic_set(&msta->hw_pending, 0);
+	msta->hw_settled = jiffies;
 	msta->ps = ~0;
 	msta->smps = ~0;
 	msta->wcid.sta = 1;
@@ -391,14 +393,22 @@ mt7603_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 }
 
 static void
-mt7603_ps_tx_list(struct mt7603_dev *dev, struct sk_buff_head *list)
+mt7603_ps_tx_list(struct mt7603_dev *dev, struct mt7603_sta *msta,
+		  struct sk_buff_head *list)
 {
 	struct sk_buff *skb;
 
 	while ((skb = __skb_dequeue(list)) != NULL) {
 		int qid = skb_get_queue_mapping(skb);
-
-		mt76_tx_queue_skb_raw(dev, dev->mphy.q_tx[qid], skb, 0);
+		bool txs = le32_get_bits(((__le32 *)skb->data)[5],
+					 MT_TXD5_PID) != MT_PACKET_ID_NO_ACK;
+
+		/* Count it before the TX status can arrive. */
+		if (txs)
+			mt7603_hw_pending_inc(dev, msta);
+		if (mt76_tx_queue_skb_raw(dev, dev->mphy.q_tx[qid], skb, 0) &&
+		    txs)
+			mt7603_hw_pending_dec(dev, msta);
 	}
 }
 
@@ -420,7 +430,7 @@ mt7603_sta_ps(struct mt76_dev *mdev, struct ieee80211_sta *sta, bool ps)
 	skb_queue_splice_tail_init(&msta->psq, &list);
 	spin_unlock_bh(&dev->ps_lock);
 
-	mt7603_ps_tx_list(dev, &list);
+	mt7603_ps_tx_list(dev, msta, &list);
 }
 
 static struct ieee80211_hdr *
@@ -529,7 +539,7 @@ mt7603_release_buffered_frames(struct ieee80211_hw *hw,
 		    !ieee80211_is_data_qos(mt7603_ps_skb_hdr(last)->frame_control);
 	last_tid = __fls(tids);
 
-	mt7603_ps_tx_list(dev, &list);
+	mt7603_ps_tx_list(dev, msta, &list);
 
 	if (eosp_null)
 		ieee80211_send_eosp_nullfunc(sta, last_tid);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 5b0ecd01a..b7b222534 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -20,6 +20,19 @@
 #define MT7603_TX_RING_SIZE	256
 #define MT7603_PSD_RING_SIZE	128
 
+/*
+ * Frames a station may have in the hardware (tx ring and PSE) before its
+ * tx queues are held, and the count at which they are released.
+ */
+#define MT7603_HW_CAP_HIGH	96
+#define MT7603_HW_CAP_LOW	48
+
+/*
+ * Frames looped back by the PSE for a sleeping station. They are sent again
+ * on wake-up, so leave room in the tx ring for other traffic.
+ */
+#define MT7603_PSQ_MAX		(MT7603_TX_RING_SIZE - 64)
+
 #define MT7603_FIRMWARE_E1	"mt7603_e1.bin"
 #define MT7603_FIRMWARE_E2	"mt7603_e2.bin"
 #define MT7628_FIRMWARE_E1	"mt7628_e1.bin"
@@ -81,6 +94,14 @@ struct mt7603_sta {
 
 	u8 ps;
 	u8 ps_sleeping;
+
+	/*
+	 * Frames queued to the hardware that still owe a TX status. The
+	 * hardware completes frames to mac80211 once DMA has copied them, so
+	 * AQL cannot bound how many it holds for the station.
+	 */
+	atomic_t hw_pending;
+	unsigned long hw_settled;
 };
 
 struct mt7603_vif {
@@ -156,8 +177,38 @@ struct mt7603_dev {
 	u32 reset_test;
 
 	unsigned int reset_cause[__RESET_CAUSE_MAX];
+
+	/* per-station cap on frames in the hardware, 0 = off (debugfs) */
+	u32 hw_cap_high;
+	u32 hw_cap_low;
+	u32 hw_cap_resync;
 };
 
+void mt7603_hw_release(struct mt7603_dev *dev, struct mt7603_sta *msta);
+
+static inline void
+mt7603_hw_pending_inc(struct mt7603_dev *dev, struct mt7603_sta *msta)
+{
+	int pending = atomic_inc_return(&msta->hw_pending);
+	u32 high = READ_ONCE(dev->hw_cap_high);
+
+	if (high && pending >= high &&
+	    !test_and_set_bit(MT_WCID_FLAG_TX_HOLD, &msta->wcid.flags))
+		WRITE_ONCE(msta->hw_settled, jiffies);
+}
+
+static inline void
+mt7603_hw_pending_dec(struct mt7603_dev *dev, struct mt7603_sta *msta)
+{
+	WRITE_ONCE(msta->hw_settled, jiffies);
+	if (!atomic_add_unless(&msta->hw_pending, -1, 0))
+		return;
+
+	if (test_bit(MT_WCID_FLAG_TX_HOLD, &msta->wcid.flags) &&
+	    atomic_read(&msta->hw_pending) <= READ_ONCE(dev->hw_cap_low))
+		mt7603_hw_release(dev, msta);
+}
+
 extern const struct mt76_driver_ops mt7603_drv_ops;
 extern const struct ieee80211_ops mt7603_ops;
 extern struct pci_driver mt7603_pci_driver;
-- 
2.47.3


