Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99315C55822
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 07:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jb9IMGHKa0qKlFCrdN1lAvSnRHELMc3mbyx/KloVe8U=; b=QSBC6RXIZqzk/WrLtQF2gVwhz1
	G/yoQHNImYDsq6iPF7l9KphmjXZyLQKE64o9x8T/RX+FZ4jlNqyp5k/0ZzlFIVG/VdhN+5r9J27KV
	No2sk4qBj6L/rsAPTl8XmAgmcVKgwE/labhTkgWx/M7EhSLSVhFOKKZDZGLME1qJXqVZs2U12Tr2d
	VeWrEaZj5DN8NpMDmpqi1jVOqC/lTpgAkfl+7gUdbZNIaUNYOc17JTVcJ7/yyUVzf5QN2C/mQJL1+
	VIlti7w0kDkEBQH5QsgMTMKtdKVN38mak4FDM6yh4Dtn3H+KKsTSNjodHVIUUCgQwEVSGB768QHh7
	J3QBe24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrW3e-00000003PIq-1Krk;
	Wed, 05 Aug 2026 07:28:58 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrW3b-00000003PIM-3siY
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 07:28:56 +0000
X-UUID: 4d405b4e909f11f1acbe4559397dec65-20260805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jb9IMGHKa0qKlFCrdN1lAvSnRHELMc3mbyx/KloVe8U=;
	b=C8Kvc85AVFFrcIlWmYdBXHgM7HX3Gm3SfhpdEh1maiC5sRop12T+ZC17vNTFaupE7gsWcSHbUz2T3rxqA3kK41osk6S87G3MGULJ0bgcTsH/kI8msr6OL9honDKRb2uHhz0InjaHXbb+FI4dPxKcdhjA+F7/6UFTIc+BZnNI7HE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fb611cf0-c326-4693-a298-a786510ca10f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:716226e2-71f1-405e-92eb-6802d6af74fd,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4d405b4e909f11f1acbe4559397dec65-20260805
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1517496638; Wed, 05 Aug 2026 00:28:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 5 Aug 2026 15:28:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 5 Aug 2026 15:28:47 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <eason.lai@mediatek.com>
Subject: [PATCH v1] wifi: mt76: mt7925: Fix MCU command timeouts during module unload
Date: Wed, 5 Aug 2026 15:28:45 +0800
Message-ID: <20260805072846.1428148-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_002855_975250_D2B31AF2 
X-CRM114-Status: GOOD (  12.00  )
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

Move MT76_REMOVED flag setting from mt7925_pci_remove() to after
mt76_unregister_device() completes. Setting it too early causes
mt792x_irq_handler() to drop MCU completion interrupts, timing out
teardown commands (scan abort, BSS_INFO_UPDATE, etc).

The flag must still be set before napi_disable() to prevent reset_work
from re-enabling NAPI and causing deadlock. Also guard mt792x_reset()
to skip queuing work when device is removed.

Fixes: 896f4dfd68e1 ("wifi: mt76: mt7925: Fix unregister deadlock")

Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt792x_mac.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 02ef09dd797d..93c823eb7501 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -47,9 +47,10 @@ static void mt7925e_unregister_device(struct mt792x_dev *dev)
 	if (dev->phy.chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
 		wiphy_rfkill_stop_polling(hw->wiphy);
 
-	cancel_work_sync(&dev->reset_work);
 	cancel_work_sync(&dev->init_work);
 	mt76_unregister_device(&dev->mt76);
+	set_bit(MT76_REMOVED, &dev->mphy.state);
+	cancel_work_sync(&dev->reset_work);
 	mt76_for_each_q_rx(&dev->mt76, i)
 		napi_disable(&dev->mt76.napi[i]);
 	cancel_delayed_work_sync(&pm->ps_work);
@@ -725,7 +726,6 @@ static void mt7925_pci_remove(struct pci_dev *pdev)
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 
-	set_bit(MT76_REMOVED, &mdev->phy.state);
 	mt7925e_unregister_device(dev);
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
 	mt76_free_device(&dev->mt76);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
index 888e5a505673..1e20b333cc61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
@@ -278,6 +278,9 @@ void mt792x_reset(struct mt76_dev *mdev)
 	if (pm->suspended)
 		return;
 
+	if (test_bit(MT76_REMOVED, &mdev->phy.state))
+		return;
+
 	queue_work(dev->mt76.wq, &dev->reset_work);
 }
 EXPORT_SYMBOL_GPL(mt792x_reset);
-- 
2.45.2


