Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881C8606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 05:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xZus/8/0;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=dL5gmPCq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YlwfcLsym+CQZD1WhX6r0UVcQ7dsS9QFdHx38D51eE4=; b=xZus/8/0GdtKVQ48R+ry/p7v7m
	YVsb3HuHISi9cSUIhEhJ4p+yRGCwtZj2ZQ4dJu+rkiznrsVfbjyuQolVoRkVirlNpnOPWgIPpBJ8G
	MsOXVRV+q8cwDakJbgtXJa5SbhZSyjSK7uRwH7gANitAydqHWBMKlF16+QLI5bmrsTwg1VZs9quja
	qF4aHNxs+vd/g8txFkni4jWqMsQ5RstB/JoPhXSKSpTUjOrXCemEtQlS67vib6GXS10+aFdt9OcjW
	YgQh1UrjLw8uuRurH+hzOn8krE9VQGeZ7Q/Ho48cMR/6XLk6PN2sgrOJ8LoHzW4igLBiQwYrx1gFk
	5/am8KIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1C4-00000005gQh-16Rr;
	Wed, 11 Nov 2026 05:48:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1C2-00000005gQ1-0EUt
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Nov 2026 05:48:23 +0000
X-UUID: 7e87052cdd9311f1afed4741b24580c9-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YlwfcLsym+CQZD1WhX6r0UVcQ7dsS9QFdHx38D51eE4=;
	b=dL5gmPCqVEJ2cKzRqeYNHUIXhmq1cSgEnXERgRjLI944qW03An6Rh/XpLLWrQDgFHVI2Mg/txKfDddMwRR3HaIMuuWzK9iWv/glSXE85m6Y1j2jXTFebVf0iVjOwGWtvhmc1i/fBH24poAfOylHIL90bX/LOSeFwYqzJIBSoBEM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:cd55c557-b431-44c3-aaec-1a3bb692f78f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:1f276f13-349d-41d1-8eaf-030fb9f984de,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7e87052cdd9311f1afed4741b24580c9-20261110
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1484598072; Tue, 10 Nov 2026 22:48:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 13:48:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 13:48:15 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Shengwei.Lu@mediatek.com>, <jb.tsai@mediatek.com>,
	Shengwei Lu <shengwei.lu@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7925: wire up ICS logging support for MT7925/MT7928
Date: Wed, 11 Nov 2026 13:48:11 +0800
Message-ID: <20261111054811.845536-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261111054811.845536-1-jb.tsai@mediatek.com>
References: <20261111054811.845536-1-jb.tsai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_214822_102348_BB2648BE 
X-CRM114-Status: GOOD (  17.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengwei Lu <shengwei.lu@mediatek.com>

Enable the shared ICS logging framework for the MT7925/MT7928 family:

- register the "ics" debugfs entry and set up the ics_worker in
  mt7925_register_device(), tearing it down in
  mt7925e_unregister_device();
- dispatch PKT_TYPE_ICS frames in mt7925_queue_rx_skb() to the shared
  mt792x_mcu_rx_ics();
- add the ICS RX queue id MT7928_RXQ_MCU_ICS and the rx_ics DMA ring for
  the mt7925 and mt7928 DMA layouts;
- add MT7928_INT_RX_ICS and its rx.wm4_complete_mask on the mt7928 irq
  map, and napi-disable the ICS queue on MAC reset.

Signed-off-by: Shengwei Lu <shengwei.lu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/init.c    | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h  | 1 +
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c     | 9 +++++++++
 drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7925/regs.h    | 4 +++-
 7 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
index d01ff49de47a..896cf4df21fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/debugfs.c
@@ -63,6 +63,9 @@ mt7925_fw_debug_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_fw_debug, mt7925_fw_debug_get,
 			 mt7925_fw_debug_set, "%lld\n");
 
+DEFINE_DEBUGFS_ATTRIBUTE(fops_ics, mt792x_ics_get,
+			 mt792x_ics_set, "%lld\n");
+
 DEFINE_SHOW_ATTRIBUTE(mt792x_tx_stats);
 
 static void
@@ -292,6 +295,8 @@ int mt7925_init_debugfs(struct mt792x_dev *dev)
 
 	dir = mt76_register_debugfs_fops(&dev->mphy, &fops_regval);
 
+	debugfs_create_file("ics", 0600, dir, dev, &fops_ics);
+
 	if (mt76_is_mmio(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "xmit-queues",
 					    dir, mt792x_queues_read);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 8c3049b66a85..f619c818ac4d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -250,6 +250,11 @@ int mt7925_register_device(struct mt792x_dev *dev)
 	dev->mt76.phy.priv = &dev->phy;
 	dev->mt76.tx_worker.fn = mt792x_tx_worker;
 
+	dev->ics_worker.fn = mt792x_ics_worker;
+	WARN_ON(mt76_worker_setup(hw, &dev->ics_worker, NULL, "ics"));
+	mt76_worker_disable(&dev->ics_worker);
+	skb_queue_head_init(&dev->ics_q);
+
 	INIT_DELAYED_WORK(&dev->pm.ps_work, mt792x_pm_power_save_work);
 	INIT_DELAYED_WORK(&dev->mlo_pm_work, mt7925_mlo_pm_work);
 	INIT_WORK(&dev->pm.wake_work, mt792x_pm_wake_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 7af996abe294..62d0a3baa4ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1440,6 +1440,9 @@ void mt7925_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 		type = PKT_TYPE_NORMAL_MCU;
 
 	switch (type) {
+	case PKT_TYPE_ICS:
+		mt792x_mcu_rx_ics(dev, skb);
+		break;
 	case PKT_TYPE_TXRX_NOTIFY:
 		if (!mt76_is_mmio(mdev)) {
 			napi_consume_skb(skb, 1);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 636efe038392..d917e2c9bd02 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -150,6 +150,7 @@ enum mt7928_rxq_id {
 	MT7928_RXQ_BAND1 = 2,
 	MT7928_RXQ_MCU_WM = 3,
 	MT7928_RXQ_MCU_WM2 = 1, /* for tx done */
+	MT7928_RXQ_MCU_ICS = 4,
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 0d477dc1086c..a5bcca75bbf4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -104,6 +104,8 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
 		wiphy_rfkill_stop_polling(hw->wiphy);
 
+	mt76_worker_teardown(&dev->ics_worker);
+
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
 	set_bit(MT76_REMOVED, &dev->mphy.state);
@@ -392,6 +394,9 @@ static const struct mt792x_dma_layout mt7925_dma_layout = {
 	.rx_data = mt792x_dma_ring(MT7925_RXQ_BAND0,
 				   MT7925_RX_RING_SIZE,
 				   MT_RX_DATA_RING_BASE),
+	.rx_ics = mt792x_dma_ring(MT7925_RXQ_MCU_WM2,
+				  MT7925_RX_MCU_RING_SIZE,
+				  MT_RX_EVENT_RING_BASE),
 };
 
 static const struct mt792x_dma_layout mt7927_dma_layout = {
@@ -431,6 +436,9 @@ static const struct mt792x_dma_layout mt7928_dma_layout = {
 	.rx_data = mt792x_dma_ring(MT7928_RXQ_BAND0,
 				   MT7925_RX_RING_SIZE,
 				   MT_RX_DATA_RING_BASE),
+	.rx_ics = mt792x_dma_ring(MT7928_RXQ_MCU_ICS,
+				  MT7925_RX_MCU_RING_SIZE,
+				  MT_RX_EVENT_RING_BASE),
 };
 
 static int mt7927_dma_init(struct mt792x_dev *dev)
@@ -581,6 +589,7 @@ static const struct mt792x_irq_map mt7928_irq_map = {
 		.data_complete_mask = MT7928_INT_RX_DONE_DATA,
 		.wm_complete_mask = MT7928_INT_RX_DONE_WM,
 		.wm2_complete_mask = MT_INT_RX_DONE_WM2,
+		.wm4_complete_mask = MT7928_INT_RX_ICS,
 	},
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index bc8f741e9426..735188873463 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -99,6 +99,8 @@ int mt7925e_mac_reset(struct mt792x_dev *dev)
 		napi_disable(&dev->mt76.napi[MT_RXQ_MCU]);
 	if (irq_map->rx.wm2_complete_mask)
 		napi_disable(&dev->mt76.napi[MT_RXQ_MCU_WA]);
+	if (is_mt7928(&dev->mt76) && irq_map->rx.wm4_complete_mask)
+		napi_disable(&dev->mt76.napi[MT_RXQ_ICS]);
 	if (irq_map->tx.all_complete_mask)
 		napi_disable(&dev->mt76.tx_napi);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
index e040dff321dd..7b23ead148bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -59,9 +59,11 @@
 
 #define MT7928_INT_RX_DONE_DATA		HOST_RX_DONE_INT_ENA0
 #define MT7928_INT_RX_DONE_WM		HOST_RX_DONE_INT_ENA3
+#define MT7928_INT_RX_ICS		HOST_RX_DONE_INT_ENA4
 #define MT7928_INT_RX_DONE_ALL		(MT7928_INT_RX_DONE_DATA | \
 					 MT7928_INT_RX_DONE_WM | \
-					 MT_INT_RX_DONE_WM2)
+					 MT_INT_RX_DONE_WM2 | \
+					 MT7928_INT_RX_ICS)
 
 #define MT_INT_TX_DONE_MCU_WM		(HOST_TX_DONE_INT_ENA15 | \
 					 HOST_TX_DONE_INT_ENA17)
-- 
2.45.2


