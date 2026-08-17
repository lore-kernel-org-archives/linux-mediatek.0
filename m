Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8ACC5CFC1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 05:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9BEdN+oKon82OOvmxvzkddGKzqq/p8uVD8l9wP6g04=; b=N6ivnIsSHDAUrzW3z+9K1J4mKK
	6M8S0BH6iJaU36FrJ307LWN6t6GFzT7Lcr6yWzLT4t2pONtbd9LKtuF0An9i9r3/HeeI8QT4EaTq9
	nGfHLabsTY79FTXY1wMjjCJFRnbucaEtdAMa2tAbrMM0XDJF81aoLjUgzi+12YTy8C7XjV8xiTSI0
	/hE+coGchYkBzG5c+KERlKS+BeWL3nyaYxUoRaCSpzLn6RRIa0FDia5R55kM1aqEteK47eVQ3mZXr
	iaKrCIu4QaMVsbmUgQ893A+ofUe2jTrWvfz9yBaJhvKQ/3W42fvHuYUGBRwhUE1jA506ogxCGghS1
	Cn2uLMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpq9-00000005RDX-0hld;
	Mon, 17 Aug 2026 05:24:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpq6-00000005RDC-2GF1
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 05:24:51 +0000
X-UUID: f5c3986699fb11f1afed4741b24580c9-20260816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+9BEdN+oKon82OOvmxvzkddGKzqq/p8uVD8l9wP6g04=;
	b=Gi91jdrYaKYtMyz6gtavKwOV1agQVdAufZfaEe5brs9ED1P+uAX9n4oubMRZO+U/Tkh9ffWwIefcobPn8CrhrHILV28p4Yzns/6dbi1pAGX9QzU4PxPw13pk0D05vuQo8zPWvvC2htyW12UmDekS5T6ETcJvDrKBKKFYdzvIlwo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b02ebabe-bbc1-4c7d-8d5e-49eb06ba007f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:a01df7d4-1b57-4e05-9e9d-187d09b3460c,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f5c3986699fb11f1afed4741b24580c9-20260816
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1448438766; Sun, 16 Aug 2026 22:24:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 17 Aug 2026 13:24:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 17 Aug 2026 13:24:44 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.lai@mediatek.com>, Devin Wittmayer <lucid_duck@justthetip.ca>
Subject: [PATCH v2] wifi: mt76: mt7925: Fix MCU command timeouts during module unload
Date: Mon, 17 Aug 2026 13:24:42 +0800
Message-ID: <20260817052442.98447-1-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_222450_637025_CCA0F517 
X-CRM114-Status: GOOD (  11.03  )
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

With nothing associated it still costs 9 to 10 seconds, so a bare rmmod
does reach this, just small enough there to read as normal teardown.

Fixes: 896f4dfd68e1 ("wifi: mt76: mt7925: Fix unregister deadlock")

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Signed-off-by: Eason Lai <eason.lai@mediatek.com>
---
v2: Update correct SHA in "Fixes" tag; reword commit message as
    suggested by Devin Wittmayer.
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


