Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DC5C43327
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0dnQUkhF2LjQWBb+flN8YyRx63my+YdvbjN3wxg/4n8=; b=Aa8HCR2z2BglS15HGqWgThaqAz
	fc34WWQOhffp1WGREOB2cUjOTd5c2WjjXBXOKKDOc8cdVRz8NH4p7CTcB36XXvlxOmDcxxmRKElWo
	uNugyK+TXCuO1BYua95KTOr52PjflFwUzdWcrhpn2+ZSfwI0UNKYn7h5v2sCea/tz0WRdfRat2PJs
	QKTSFUGKpeBWg6CT05cbn0bI0gnZkW6dEbnoRZ7UqGebH1EZuoViNwETNeTUCXykwksKew0TgnhIc
	06AHc50Zy0uBWrk99L4GSbAbrnYxIxCujGZtfxeW9dGE+oPNegQt4+OXqGVG24Gfx6DUpOsDJUGLB
	3M1//4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQA-0000000GL5f-3kth;
	Tue, 30 Jun 2026 09:06:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUQ8-0000000GL3x-10Oy
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 09:06:21 +0000
X-UUID: f224db2a746211f1acbe4559397dec65-20260630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0dnQUkhF2LjQWBb+flN8YyRx63my+YdvbjN3wxg/4n8=;
	b=izJw3li/e8gMiv1ecTchohZZfDpwVk3vcrDzPynKwkMFXxB4UX3dG33KK8GxlA5vqSrFTOSFtYs0lCBF9bTMXGnFRrhO9brBKbZrcl5GrmX+DgHr+XzPH+QrWWZ3ODEOZt8Xm7Sjv1n8wo71nLPKe4ECjDwiScJND4g9bZ/qLxo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:9b39f22f-6836-419d-9d4b-587a8662ad6f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:0a5eb036-aeca-4aec-9940-86efe258e061,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f224db2a746211f1acbe4559397dec65-20260630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 760529653; Tue, 30 Jun 2026 02:06:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Jun 2026 17:06:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 30 Jun 2026 17:06:12 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Leon.Yen@mediatek.com>, <litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	Fei Shao <fshao@google.com>
Subject: [PATCH] wifi: mt76: mt7925: Fix unregister deadlock
Date: Tue, 30 Jun 2026 17:06:10 +0800
Message-ID: <20260630090610.586954-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_020620_318631_A2455BF5 
X-CRM114-Status: GOOD (  14.09  )
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

During device shutdown or removal, a deadlock can occur between the
PCIe remove path and the driver's asynchronous reset work.

The unregistration path calls napi_disable() before cancelling the
reset work. If the reset work runs concurrently, it may re-enable NAPI
and schedule it. Because the device is being unregistered, this can
lead to NAPI state corruption where NAPI is marked as scheduled but
never polled, causing subsequent napi_disable() calls to hang forever.

Fix this by:
1. Moving cancel_work_sync(&dev->reset_work) to the very start of
   mt7925e_unregister_device(), ensuring it is stopped before NAPI
   is disabled.
2. Setting the MT76_REMOVED flag early in the PCI remove path to
   prevent new reset work from being queued.
3. Checking MT76_REMOVED in mt7925_mac_reset_work() and aborting the
   reset early if the device is being removed.

Co-developed-by: Fei Shao <fshao@google.com>
Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 7 +++++++
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 0641a7131d7c..1c6d43b162c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1319,6 +1319,9 @@ void mt7925_mac_reset_work(struct work_struct *work)
 	cancel_work_sync(&pm->wake_work);
 
 	for (i = 0; i < 10; i++) {
+		if (test_bit(MT76_REMOVED, &dev->mt76.phy.state))
+			goto out;
+
 		mutex_lock(&dev->mt76.mutex);
 		ret = mt792x_dev_reset(dev);
 		mutex_unlock(&dev->mt76.mutex);
@@ -1338,8 +1341,12 @@ void mt7925_mac_reset_work(struct work_struct *work)
 		ieee80211_scan_completed(dev->mphy.hw, &info);
 	}
 
+out:
 	dev->hw_full_reset = false;
 	pm->suspended = false;
+	if (test_bit(MT76_REMOVED, &dev->mt76.phy.state))
+		return;
+
 	ieee80211_wake_queues(hw);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index ea64303283ed..978a3f08e080 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -43,13 +43,13 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
 		wiphy_rfkill_stop_polling(hw->wiphy);
 
+	cancel_work_sync(&dev->reset_work);
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
 	mt76_for_each_q_rx(&dev->mt76, i)
 		napi_disable(&dev->mt76.napi[i]);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
-	cancel_work_sync(&dev->reset_work);
 
 	mt7925_tx_token_put(dev);
 	__mt792x_mcu_drv_pmctrl(dev);
@@ -498,8 +498,8 @@ static void mt7925_pci_remove(struct pci_dev *pdev)
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 
-	mt7925e_unregister_device(dev);
 	set_bit(MT76_REMOVED, &mdev->phy.state);
+	mt7925e_unregister_device(dev);
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
 	mt76_free_device(&dev->mt76);
 	pci_free_irq_vectors(pdev);
-- 
2.45.2


