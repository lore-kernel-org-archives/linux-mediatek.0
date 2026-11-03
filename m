Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C41E606A327
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hFymBp9t;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=L4KyoAkD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IAyt+7Jp+OiNOSTQqb1S4a5PlLbQsLrrTmnRawmEWOI=; b=hFymBp9toFO40ll62y9sQbT6Os
	LApid/9OL3m/Sk3eH/AGHIWAqbF29bDm/OdFZUpQZKaVOlxZGe47Iha7FRGC0NVnILxusiGYPV6MJ
	DmpuTb2nWWNjOxAxUhpL41JGDVC9qsbsjKmMOjcbRyk0fROIvW3zv7H5F0X6TL0jUWEc+cw1UvjdH
	TSwkWhp+9+ch8vOJrNZ0VD0lTZVvljzHvERn76YLMb0C3i0ZkPddcjI39yptve2UKe+p3v3RKENWK
	Q6YM2+5tH+2sdxyoE/HvSQMwRh0rWzSYF1x8rf30ZWwHIFrFi2IcXChnRpeVQMCWn3K7LsU3z9els
	aa9JsO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAX9-00000001hgH-0R8L;
	Tue, 03 Nov 2026 09:10:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAX4-00000001heG-2rYM
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 09:10:21 +0000
X-UUID: 614609c8d76611f1acbe4559397dec65-20261103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IAyt+7Jp+OiNOSTQqb1S4a5PlLbQsLrrTmnRawmEWOI=;
	b=L4KyoAkDtpD04n3ITGXgE20PeaP8SkXCBetFFj7GQLHLT2v4pne0GTVHlQfcHDQE0PfodVFEX6vSyd1J81CN1iuDLHQ6iJaKiDD/UrWmWK+4yj9tS1KrYfKhSKHVJingKDGH7klpKvk2sDafSuYKA7AIMHTrDtcZC1F7s5zHU5o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:0cbc6aeb-996e-48c8-b96a-b9fdae5d1ab0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:55b2bcce-02bc-447e-ab88-2baec399874a,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 614609c8d76611f1acbe4559397dec65-20261103
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 921188241; Tue, 03 Nov 2026 02:10:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Nov 2026 17:10:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Nov 2026 17:10:12 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Evan-ym.Li@mediatek.com>, <jb.tsai@mediatek.com>,
	Yin-Ming Li <evan-ym.li@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/3] wifi: mt76: mt7921: drain PCIe activity before freeing queues
Date: Tue, 3 Nov 2026 17:10:09 +0800
Message-ID: <20261103091010.1148974-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261103091010.1148974-1-jb.tsai@mediatek.com>
References: <20261103091010.1148974-1-jb.tsai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_011018_733959_AE672EA3 
X-CRM114-Status: GOOD (  15.70  )
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

From: Yin-Ming Li <evan-ym.li@mediatek.com>

The PCIe remove path sets MT76_REMOVED before unregistering mac80211,
making the IRQ handler return without servicing MCU responses. It also
disables the IRQ tasklet only after DMA cleanup, so a previously scheduled
tasklet can run while queues are being torn down.

Use the common work-quiescing helper while IRQs, NAPI and the MCU command
queues remain available. Delay publishing REMOVED until mac80211
unregistration returns, so the IRQ handler remains available during
teardown even when individual MCU commands fail.

Mask both device interrupt sources and flush the write before publishing
REMOVED. Synchronize the IRQ, disable its tasklet, and disable and delete
RX NAPI before releasing TX tokens. Let common DMA cleanup skip an
already-deleted RX NAPI context to avoid disabling it twice.

After DMA cleanup has also stopped TX NAPI, drain the tasklet that its
last poll might have scheduled. Add a REMOVED guard so this final tasklet
cannot access freed queues. Purge scan and coredump state after stopping
their producers and before freeing the device.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yin-Ming Li <evan-ym.li@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/dma.c        |  4 ++-
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 40 ++++++++++++++++++-------
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c |  3 ++
 3 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f695a14596062c4cd5445913f014907a421b2c22..25d4640f09eea7335c422b36b9c3ef52fe388830 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -1217,7 +1217,9 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
 	mt76_for_each_q_rx(dev, i) {
 		struct mt76_queue *q = &dev->q_rx[i];
 
-		if (!mt76_queue_is_wed_rro(q)) {
+		/* A driver may have removed RX NAPI before releasing TX tokens. */
+		if (!mt76_queue_is_wed_rro(q) &&
+		    test_bit(NAPI_STATE_LISTED, &dev->napi[i].state)) {
 			napi_disable(&dev->napi[i]);
 			netif_napi_del(&dev->napi[i]);
 		}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 5180597aed757777dc3d5c287f2bbdee39ce243d..2e05dbaf8b2805522410609e90f422b348826e43 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -43,28 +43,47 @@ static int mt7921e_init_reset(struct mt792x_dev *dev)
 
 static void mt7921e_unregister_device(struct mt792x_dev *dev)
 {
 	int i;
-	struct mt76_connac_pm *pm = &dev->pm;
+	struct pci_dev *pdev = to_pci_dev(dev->mt76.dev);
 	struct ieee80211_hw *hw = mt76_hw(dev);
 
 	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
 		wiphy_rfkill_stop_polling(hw->wiphy);
 
-	cancel_work_sync(&dev->init_work);
-	mt76_unregister_device(&dev->mt76);
-	mt76_for_each_q_rx(&dev->mt76, i)
+	mt7921_unregister_device(dev);
+
+	/*
+	 * Mask device interrupts before MT76_REMOVED makes the handler return
+	 * IRQ_NONE. Drain the IRQ and tasklet before tearing down the queues.
+	 */
+	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
+	mt76_wr(dev, dev->pcie_reg->imask, 0);
+	mt76_rr(dev, dev->pcie_reg->imask);
+	set_bit(MT76_REMOVED, &dev->mphy.state);
+	synchronize_irq(pdev->irq);
+	tasklet_disable(&dev->mt76.irq_tasklet);
+
+	mt76_for_each_q_rx(&dev->mt76, i) {
 		napi_disable(&dev->mt76.napi[i]);
-	cancel_delayed_work_sync(&pm->ps_work);
-	cancel_work_sync(&pm->wake_work);
-	cancel_work_sync(&dev->reset_work);
+		netif_napi_del(&dev->mt76.napi[i]);
+	}
+	skb_queue_purge(&dev->phy.scan_event_list);
+	cancel_delayed_work_sync(&dev->coredump.work);
+	skb_queue_purge(&dev->coredump.msg_list);
 
 	mt76_connac2_tx_token_put(&dev->mt76);
-	__mt792x_mcu_drv_pmctrl(dev);
 	mt792x_dma_cleanup(dev);
+
+	/*
+	 * TX NAPI is now disabled too; drain a tasklet queued by its last poll.
+	 * MT76_REMOVED makes that tasklet return without touching freed queues.
+	 */
+	tasklet_enable(&dev->mt76.irq_tasklet);
+	tasklet_kill(&dev->mt76.irq_tasklet);
+	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
+
 	mt792x_wfsys_reset(dev);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
-
-	tasklet_disable(&dev->mt76.irq_tasklet);
 }
 
 static u32 __mt7921_reg_addr(struct mt792x_dev *dev, u32 addr)
@@ -458,7 +477,6 @@ static void mt7921_pci_remove(struct pci_dev *pdev)
 	if (of_property_read_bool(dev->mt76.dev->of_node, "wakeup-source"))
 		device_init_wakeup(dev->mt76.dev, false);
 
-	set_bit(MT76_REMOVED, &mdev->phy.state);
 	mt7921e_unregister_device(dev);
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
 	mt76_free_device(&dev->mt76);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 8ad94fa583405d561429a1c5d212e9f83d616328..06877816640f51829b50205ab93126385d26f16a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -31,6 +31,9 @@ void mt792x_irq_tasklet(unsigned long data)
 	const struct mt792x_irq_map *irq_map = dev->irq_map;
 	u32 intr, mask = 0;
 
+	if (test_bit(MT76_REMOVED, &dev->mphy.state))
+		return;
+
 	mt76_wr(dev, irq_map->host_irq_enable, 0);
 
 	intr = mt76_rr(dev, MT_WFDMA0_HOST_INT_STA);
-- 
2.43.0

