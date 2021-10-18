Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E859C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 23:12:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3040160C51
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 23:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3040160C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeA8Zz6a7kfMltbOwaeWT7Mz5m/67gG9dUyoX79qupM=; b=2FCqG2Ws68fC7M
	uhs8JihDUUx+mIQEQi5o4QvnWyRbL3NWKpPStZ7bqdUkX6y3UoGdEfO4d69e00EPLUKjSg0ls9M/4
	thf+z1mu7hGGhQ0M7t/qf1As/gFbFkRin2VnSsb1JnI3ih4wi+BUBXwGgHl0rDc1K3fNzDQk2Ejtl
	0pBUQxFFuzSm1OvDeUjWsbF8OuUPn120AkdDUqnk780AuiVSlgNief6fI+g5KhwEK9dO6+0PjSVq7
	Lab0jOPILoxpzuLR0bsYAJRdO7B6H0UXGmOfuV6eT6q7y9yzaqkEN4pVI07bQFIVHJ5YzmXixEPVw
	O7nX16e+wlbF17BKCgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcbnf-00HQbx-IM; Mon, 18 Oct 2021 23:12:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcbnc-00HQaY-Qa
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 23:12:10 +0000
X-UUID: d27cf5cfc78d4b2a879a93509af40766-20211018
X-UUID: d27cf5cfc78d4b2a879a93509af40766-20211018
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 413912645; Mon, 18 Oct 2021 16:12:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 16:12:04 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Oct 2021 07:12:04 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 04/17] mt76: mt7921: refactor init.c to be bus independent
Date: Tue, 19 Oct 2021 07:11:34 +0800
Message-ID: <14a5c85aa5f9ff3a5f29180e70819568e479dd3f.1634598341.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1634598341.git.objelf@gmail.com>
References: <cover.1634598341.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_161208_902033_FFA9BD62 
X-CRM114-Status: GOOD (  15.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

This is a preliminary patch to introduce mt7921s support.

Make init.c reusable between mt7921s and mt7921e

Tested-by: Deren Wu <deren.wu@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/dma.c   |  3 ++
 .../net/wireless/mediatek/mt76/mt7921/init.c  | 27 +--------------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  2 ++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 33 ++++++++++++++++++-
 4 files changed, 38 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
index d3e2036a1974..8f29d09179e4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/dma.c
@@ -343,6 +343,9 @@ int mt7921_dma_init(struct mt7921_dev *dev)
 	struct mt76_bus_ops *bus_ops;
 	int ret;
 
+	dev->phy.dev = dev;
+	dev->phy.mt76 = &dev->mt76.phy;
+	dev->mt76.phy.priv = &dev->phy;
 	dev->bus_ops = dev->mt76.bus;
 	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
 			       GFP_KERNEL);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 7956a57510c4..f0fd32c424c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -181,10 +181,6 @@ static int mt7921_init_hardware(struct mt7921_dev *dev)
 {
 	int ret, idx, i;
 
-	ret = mt7921_dma_init(dev);
-	if (ret)
-		return ret;
-
 	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
 
 	for (i = 0; i < MT7921_MCU_INIT_RETRY_COUNT; i++) {
@@ -192,7 +188,7 @@ static int mt7921_init_hardware(struct mt7921_dev *dev)
 		if (!ret)
 			break;
 
-		mt7921_wpdma_reset(dev, true);
+		mt7921_init_reset(dev);
 	}
 
 	if (i == MT7921_MCU_INIT_RETRY_COUNT) {
@@ -289,24 +285,3 @@ int mt7921_register_device(struct mt7921_dev *dev)
 
 	return 0;
 }
-
-void mt7921_unregister_device(struct mt7921_dev *dev)
-{
-	int i;
-	struct mt76_connac_pm *pm = &dev->pm;
-
-	mt76_unregister_device(&dev->mt76);
-	mt76_for_each_q_rx(&dev->mt76, i)
-		napi_disable(&dev->mt76.napi[i]);
-	cancel_delayed_work_sync(&pm->ps_work);
-	cancel_work_sync(&pm->wake_work);
-
-	mt7921_tx_token_put(dev);
-	mt7921_mcu_drv_pmctrl(dev);
-	mt7921_dma_cleanup(dev);
-	mt7921_wfsys_reset(dev);
-	mt7921_mcu_exit(dev);
-
-	tasklet_disable(&dev->irq_tasklet);
-	mt76_free_device(&dev->mt76);
-}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 9c15c9bdd41e..295f57ce7eba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -133,11 +133,13 @@ struct mt7921_phy {
 	struct delayed_work scan_work;
 };
 
+#define mt7921_init_reset(dev)		((dev)->hif_ops->init_reset(dev))
 #define mt7921_dev_reset(dev)		((dev)->hif_ops->reset(dev))
 #define mt7921_mcu_init(dev)		((dev)->hif_ops->mcu_init(dev))
 #define __mt7921_mcu_drv_pmctrl(dev)	((dev)->hif_ops->drv_own(dev))
 #define	__mt7921_mcu_fw_pmctrl(dev)	((dev)->hif_ops->fw_own(dev))
 struct mt7921_hif_ops {
+	int (*init_reset)(struct mt7921_dev *dev);
 	int (*reset)(struct mt7921_dev *dev);
 	int (*mcu_init)(struct mt7921_dev *dev);
 	int (*drv_own)(struct mt7921_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 171aa2daef4d..305b63fa1a8a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -93,6 +93,32 @@ static void mt7921_irq_tasklet(unsigned long data)
 		napi_schedule(&dev->mt76.napi[MT_RXQ_MAIN]);
 }
 
+static int mt7921e_init_reset(struct mt7921_dev *dev)
+{
+	return mt7921_wpdma_reset(dev, true);
+}
+
+static void mt7921e_unregister_device(struct mt7921_dev *dev)
+{
+	int i;
+	struct mt76_connac_pm *pm = &dev->pm;
+
+	mt76_unregister_device(&dev->mt76);
+	mt76_for_each_q_rx(&dev->mt76, i)
+		napi_disable(&dev->mt76.napi[i]);
+	cancel_delayed_work_sync(&pm->ps_work);
+	cancel_work_sync(&pm->wake_work);
+
+	mt7921_tx_token_put(dev);
+	mt7921_mcu_drv_pmctrl(dev);
+	mt7921_dma_cleanup(dev);
+	mt7921_wfsys_reset(dev);
+	mt7921_mcu_exit(dev);
+
+	tasklet_disable(&dev->irq_tasklet);
+	mt76_free_device(&dev->mt76);
+}
+
 static int mt7921_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -116,6 +142,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	};
 
 	static const struct mt7921_hif_ops mt7921_pcie_ops = {
+		.init_reset = mt7921e_init_reset,
 		.reset = mt7921e_mac_reset,
 		.mcu_init = mt7921e_mcu_init,
 		.drv_own = mt7921e_mcu_drv_pmctrl,
@@ -172,6 +199,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_dev;
 
+	ret = mt7921_dma_init(dev);
+	if (ret)
+		goto err_free_irq;
+
 	ret = mt7921_register_device(dev);
 	if (ret)
 		goto err_free_irq;
@@ -193,7 +224,7 @@ static void mt7921_pci_remove(struct pci_dev *pdev)
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
 
-	mt7921_unregister_device(dev);
+	mt7921e_unregister_device(dev);
 	devm_free_irq(&pdev->dev, pdev->irq, dev);
 	pci_free_irq_vectors(pdev);
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
