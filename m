Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6596AC5DF9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYh2eyx3MQIXpn7Ochh86kWh474/apID4gTsqhPwG0Y=; b=g4mOJE/soUI8XvgxnrmL4wm04d
	1zA65t7gqiugHfCOXGLNmc1KHqo32z5sDldy9tB0PXxCgT7KifEc2oyI+fzMeO2Kf5th0xJkLlm2L
	Z2k8mcyaovseBJNSlfcjWDWgIMsgcSoeqOdB0MMFp9YN1xautxsIzqpzXijCS5Qsfv4xYdSBsjNaF
	6qnL5B8Mogk0sM2C5VN+HYpdJzT1AHmk9JAAfc8AOa7gUsDKMDh9v5KambRtxoEQoQkHIhVMKd/e3
	+PCc9jdlXFoMG5SAVS2MWRLkeqp9mxLh9CIG0vkre/Oi4Ibwom/Pzs2Oknh4wirCgNzcRa0QzF5DB
	l1mNulkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajp-0000000HKie-2dCu;
	Mon, 24 Aug 2026 19:53:45 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajk-0000000HKft-3anq
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:41 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4634d881742so2224196fac.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601220; x=1788206020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYh2eyx3MQIXpn7Ochh86kWh474/apID4gTsqhPwG0Y=;
        b=Rab6zQ42PL3ET/qLWYC7cqq79bvX2UiTzsUMHwapcu5rKWevcjaDYMp7QVm5LQ9qoP
         gwucRrgiK2a+JuNt31c4RX3y53+tVdSMVq+drLlYs9HUzGklJlJGcxBLQPnUAYW8gyt/
         3tcQNh9McbwaPOCJ2wPvuqxXovGIMp7zgl6WPU83/wdrHNcNfHOA3LuXMJj7AB0tu2YA
         13omtZmffIerQ8C6wcHSHwtsX/c1LslkMUZrPBbENMA4VdPF+pICqqdZJEnGQwNYCOc7
         i8D76uG3hy3PZ56t0UI/NrUXWHz5C1YJmljl8vUTLgqCeKV2EDmWJH6lWExiZGjRrWFf
         9+xg==
X-Forwarded-Encrypted: i=1; AHgh+Rpy39jFywMQ5Q5NgXOKFRDHT+XUPCpDSvjvJQz8pzT2GJJQ3DZmbcJ7u+unOA4Ddh1qzO/nSY+2rwyRr6dY+Q==@lists.infradead.org
X-Gm-Message-State: AFuF++lgONHW5Rv6hR5dx13q1PbOjwrSWB2UzFNLVU7e2zcIJNos6xtp
	50MGhsMooRBCZqsyJzs6fiKaMx/xHN4xbtaLiC24r3IDwjpj/DUp+02H
X-Gm-Gg: AR+sD13m2xaaijo8mDBbXu1L1ZVh6PEXKkfwv2aLBIG1viPkopnGYyY1WU1Zt5loMi8
	MNsgzNv12izPgieqJfXeni4YoejpSWWFqV2wGU0itT+Qklr84Sp5xXSP8FU8+nU4HFceZGKpxc1
	RcMIsXG1fUIfNFxhpv+McFTbvtHNS/A0pPm0loZi+d05LyCAYRd/3fojqhRk3Y35YkLf9KO+l7I
	oJ6znMgaCwfCVtiXULB+luaRWw0fyWbSEGM/y3H8Cr9boh1mEge5/9zvhuBHSY9mfj4/4Lhk7gD
	3qeOuVWBmYzCxLkO58xGO0h0e+CoRvuWC0QZPPVZbWNJwSbfOwgT3Yr3b0hl9GOJD9dPLo74Tjw
	kHj6QCb0xweyzp9MUdFKXXW+8OYROxPpaoNAMPYkEJs/bAdZ1wVKkX/ZGoovImGpcZoiExCx6Zy
	i6nL5ysARa/cUOkh35r5T42hWnoXK6jbMm+6mPReuUtn62z1GIMRyVD77KrM7A4AraGJy/h4VGt
	AJj5+SFpoMIeTDTOjFGM59v5yXCqln6txq9eNMMw4PILzmWfRQ3/rg=
X-Received: by 2002:a05:6870:e189:b0:440:e191:b095 with SMTP id 586e51a60fabf-46350f399a8mr29117789fac.3.1787601219876;
        Mon, 24 Aug 2026 12:53:39 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:39 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 14/15] wifi: mt76: mt7925: support deferred NAN schedule update and cluster events
Date: Mon, 24 Aug 2026 14:52:26 -0500
Message-ID: <20260824195227.12589-15-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125340_928114_DC647A71 
X-CRM114-Status: GOOD (  21.78  )
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

Send the is_deferred flag in the availability control TLV so FW
applies a deferred schedule change at the next DW boundary, and report
the NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE and STARTED_CLUSTER events to
mac80211 via ieee80211_nan_sched_update_done() and
ieee80211_nan_cluster_joined().

Both events arrive on the BH-disabled MCU RX path, where notifying
mac80211 inline is wrong: ieee80211_nan_sched_update_done() needs the
wiphy mutex and may sleep, and ieee80211_nan_cluster_joined() would
fire during NAN_START before mac80211 sets sdata->u.nan.started and
before the supplicant subscribes to NL80211_MCGRP_NAN, so the
self-anchor cluster-join is lost and a solo anchor master can never
publish a service.

Deliver both events from a shared nan_deferred_work selected by a
pending bitmap instead. The bitmap spinlock is taken with
spin_lock_bh() on the RX side, the work re-checks nan_vif under the
wiphy mutex, and the stop path clears the bitmap. STARTED_CLUSTER
signals new_cluster=true, and JOINED_CLUSTER is corrected to
new_cluster=false.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  7 ++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 85 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 11 ++-
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  8 ++
 7 files changed, 111 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index cd22fcc021b1..8c3049b66a85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -270,6 +270,8 @@ int mt7925_register_device(struct mt792x_dev *dev)
 
 	INIT_WORK(&dev->reset_work, mt7925_mac_reset_work);
 	INIT_WORK(&dev->init_work, mt7925_init_work);
+	INIT_WORK(&dev->nan_deferred_work, mt7925_nan_deferred_work);
+	spin_lock_init(&dev->nan_deferred_lock);
 
 	INIT_WORK(&dev->phy.roc_work, mt7925_roc_work);
 	timer_setup(&dev->phy.roc_timer, mt792x_roc_timer, 0);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 93de42c2bfd9..e1c688af7c59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2613,6 +2613,13 @@ static int mt7925_stop_nan(struct ieee80211_hw *hw,
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	int err, ret;
 
+	/* Drop a deferred event queued just before stop so a stale cluster_id
+	 * cannot leak into a restart; the work re-checks liveness anyway.
+	 */
+	spin_lock_bh(&dev->nan_deferred_lock);
+	dev->nan_deferred_pending = 0;
+	spin_unlock_bh(&dev->nan_deferred_lock);
+
 	mt792x_mutex_acquire(dev);
 
 	err = mt7925_nan_disable(vif, dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 321e732347f2..33782d9ba9ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -361,6 +361,7 @@ void mt7925_mcu_set_suspend_iter(void *priv, u8 *mac,
 void mt7925_connac_mcu_set_suspend_iter(void *priv, u8 *mac,
 					struct ieee80211_vif *vif);
 void mt7925_set_ipv6_ns_work(struct work_struct *work);
+void mt7925_nan_deferred_work(struct work_struct *work);
 
 int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 			   bool enable);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 1f695f0c4473..4b479edab018 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -454,9 +454,27 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
 	dev_dbg(dev->mt76.dev, "nan: evt=%u cluster=%pM\n",
 		de_evt->event_type, de_evt->cluster_id);
 
-	if (de_evt->event_type != NAN_EVENT_ID_JOINED_CLUSTER)
+	if (de_evt->event_type != NAN_EVENT_ID_JOINED_CLUSTER &&
+	    de_evt->event_type != NAN_EVENT_ID_STARTED_CLUSTER)
 		return;
 
+	/* STARTED_CLUSTER fires during NAN_START, before nan.started is set and
+	 * before the supplicant subscribes - defer past NAN_START via the work
+	 * so ieee80211_nan_cluster_joined() actually reaches userspace.
+	 */
+	if (de_evt->event_type == NAN_EVENT_ID_STARTED_CLUSTER) {
+		dev_dbg(dev->mt76.dev,
+			"nan: deferring STARTED_CLUSTER cluster=%pM\n",
+			cluster_id);
+		spin_lock_bh(&dev->nan_deferred_lock);
+		memcpy(dev->nan_started_cluster_id, cluster_id, ETH_ALEN);
+		set_bit(MT7925_NAN_DEFERRED_STARTED_CLUSTER,
+			&dev->nan_deferred_pending);
+		spin_unlock_bh(&dev->nan_deferred_lock);
+		ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
+		return;
+	}
+
 	if (!dev->nan_vif || !ieee80211_vif_nan_started(dev->nan_vif)) {
 		dev_warn(dev->mt76.dev, "nan: joined-cluster event but NAN not started\n");
 		return;
@@ -468,7 +486,43 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
 	dev_dbg(dev->mt76.dev, "nan: own_nmi=%pM master_nmi=%pM\n",
 		de_evt->own_nmi, de_evt->master_nmi);
 
-	ieee80211_nan_cluster_joined(dev->nan_vif, cluster_id, true, GFP_KERNEL);
+	/* joined an existing cluster, not a self-anchored new one */
+	ieee80211_nan_cluster_joined(dev->nan_vif, cluster_id, false, GFP_KERNEL);
+}
+
+/* Runs the deferred NAN MCU events in process context; takes wiphy_lock
+ * before nan_vif, which the NAN stop path frees under that mutex.
+ */
+void
+mt7925_nan_deferred_work(struct work_struct *work)
+{
+	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
+					      nan_deferred_work);
+	struct ieee80211_vif *vif;
+	unsigned long pending;
+	u8 cluster_id[ETH_ALEN];
+
+	spin_lock_bh(&dev->nan_deferred_lock);
+	pending = dev->nan_deferred_pending;
+	dev->nan_deferred_pending = 0;
+	memcpy(cluster_id, dev->nan_started_cluster_id, ETH_ALEN);
+	spin_unlock_bh(&dev->nan_deferred_lock);
+
+	if (!pending)
+		return;
+
+	wiphy_lock(dev->mt76.hw->wiphy);
+	vif = dev->nan_vif;
+	if (!vif || !ieee80211_vif_nan_started(vif))
+		goto out;
+
+	if (test_bit(MT7925_NAN_DEFERRED_STARTED_CLUSTER, &pending))
+		ieee80211_nan_cluster_joined(vif, cluster_id, true, GFP_KERNEL);
+
+	if (test_bit(MT7925_NAN_DEFERRED_SCHED_UPDATE_DONE, &pending))
+		ieee80211_nan_sched_update_done(vif);
+out:
+	wiphy_unlock(dev->mt76.hw->wiphy);
 }
 
 static void
@@ -517,6 +571,27 @@ mt7925_nan_handle_ulw_update(struct mt792x_dev *dev, struct tlv *tlv)
 				GFP_KERNEL);
 }
 
+static void
+mt7925_nan_handle_sched_update_done(struct mt792x_dev *dev, struct tlv *tlv)
+{
+	struct ieee80211_vif *vif;
+
+	if (!dev || !tlv)
+		return;
+
+	vif = dev->nan_vif;
+	if (!vif || !ieee80211_vif_nan_started(vif))
+		return;
+
+	/* Runs in the BH-disabled MCU-event RX path; the mac80211 helper needs
+	 * the wiphy mutex and may sleep, so hand it to the work instead.
+	 */
+	spin_lock_bh(&dev->nan_deferred_lock);
+	set_bit(MT7925_NAN_DEFERRED_SCHED_UPDATE_DONE, &dev->nan_deferred_pending);
+	spin_unlock_bh(&dev->nan_deferred_lock);
+	ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
+}
+
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
 	struct tlv *tlv;
@@ -548,6 +623,9 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		case NAN_UNI_EVENT_ID_ULW_UPDATE:
 			mt7925_nan_handle_ulw_update(dev, tlv);
 			break;
+		case NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE:
+			mt7925_nan_handle_sched_update_done(dev, tlv);
+			break;
 		default:
 			break;
 		}
@@ -585,6 +663,7 @@ static int mt7925_nan_avail_ctrl_tlv(struct sk_buff *skb,
 	avail_ctrl_tlv->avail_ctrl =
 		cpu_to_le16(ctrl & NAN_AVAIL_CTRL_CHECK_FOR_CHANGED);
 	avail_ctrl_tlv->seq_id = seq_id;
+	avail_ctrl_tlv->is_deferred = sched->deferred ? 1 : 0;
 
 	return 0;
 }
@@ -710,7 +789,7 @@ void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 		goto out;
 	}
 
-	mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
+	mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), false);
 out:
 	mt792x_mutex_release(dev);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 1e8f5b76fc3d..c78a1350c456 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -96,15 +96,24 @@ enum nan_uni_cmd_tag {
 enum nan_uni_event_tag {
 	NAN_UNI_EVENT_ID_DE_EVENT_IND		= 19,
 	NAN_UNI_EVENT_ID_ULW_UPDATE		= 39,
+	NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE	= 43,
 	NAN_UNI_EVENT_REPORT_DW_START		= 59,
 	NAN_UNI_EVENT_REPORT_DW_END		= 60,
 };
 
 enum nan_disc_event_type {
 	NAN_EVENT_ID_DISC_MAC_ADDR		= 0,
+	NAN_EVENT_ID_STARTED_CLUSTER		= 1,
 	NAN_EVENT_ID_JOINED_CLUSTER		= 2,
 };
 
+/* bit indices into mt792x_dev->nan_deferred_pending, set from the atomic
+ * MCU-event RX path and consumed by mt7925_nan_deferred_work()
+ */
+enum mt7925_nan_deferred_event {
+	MT7925_NAN_DEFERRED_STARTED_CLUSTER,
+	MT7925_NAN_DEFERRED_SCHED_UPDATE_DONE,
+};
 /* NAN 4.0 Table 79. Device Capability attribute format, Supported Bands */
 enum nan_supported_bands {
 	NAN_SUPPORTED_BAND_ID_2P4G = 2,
@@ -344,7 +353,7 @@ struct mt7925_nan_avail_ctrl_tlv {
 	__le16 len;
 	__le16 avail_ctrl;
 	u8 seq_id;
-	u8 reserved[1];
+	u8 is_deferred;
 } __packed __aligned(4);
 
 struct mt7925_nan_ch_timeline {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 02ef09dd797d..24585c992ff5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -55,6 +55,7 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_delayed_work_sync(&dev->mlo_pm_work);
 	cancel_work_sync(&pm->wake_work);
+	cancel_work_sync(&dev->nan_deferred_work);
 
 	mt7925_tx_token_put(dev);
 	__mt792x_mcu_drv_pmctrl(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 9efc251cb745..9722d840c1af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -342,6 +342,14 @@ struct mt792x_dev {
 	struct ieee80211_vif *nan_vif;
 	const struct ieee80211_iface_combination *iface_combinations;
 	int n_iface_combinations;
+	/* deferred NAN MCU events run out of the atomic RX path on one shared
+	 * work; see mt7925_nan_deferred_work() and enum mt7925_nan_deferred_event
+	 */
+	struct work_struct nan_deferred_work;
+	/* protects @nan_deferred_pending */
+	spinlock_t nan_deferred_lock;
+	unsigned long nan_deferred_pending;
+	u8 nan_started_cluster_id[ETH_ALEN];
 };
 
 static inline struct mt792x_bss_conf *
-- 
2.43.0


