Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714FAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jshfTICPmPE7ygnWmiRutJL1FY+pxxQf9dk0/UjruJU=; b=Sw4E/eOzfyDJU6
	UpVD4iKMfEu91RfUhhs/xroepYBRoS3dlZyB/hluJl1/6oiub+UIitgYaKxb4VCxs7J+fbud7lV/G
	yGqOnPk31jeCMMlOUk9FX/o40ppGQohwedwrQkH6i/u/JF6aby+6Kx1B8cWo007pWIwbU4Q6aNjRL
	ElTKWOu4iWee77E1xXF+e6jkGdVXpPSGU4fdNNKozbfX3jC0YZYKaa6prMHbpmv1RLwQBuMObjZaS
	9j1WKRxXZ+2Io1Fe0q0OUjnRXnOmwTg941HmgtqebWH7Q/zAuiPopcgpymuuSX9ald/GAYQpxGd4E
	mklnDyOKOBHRYgy323Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpQvX-001DBS-Uw; Tue, 23 Nov 2021 08:13:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpQjJ-0019o6-Aw
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 08:00:42 +0000
X-UUID: 824784afe7784e48b1c8ae33b93f80ef-20211123
X-UUID: 824784afe7784e48b1c8ae33b93f80ef-20211123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 681849786; Tue, 23 Nov 2021 01:00:38 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 23:50:39 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 23 Nov 2021 15:50:35 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 23 Nov 2021 15:50:35 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v3 11/11] mt76: mt7915: add device id for mt7916
Date: Tue, 23 Nov 2021 15:49:55 +0800
Message-ID: <156e5d70ac787efde597351b904e9b3610e01da3.1637652742.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1637652742.git.Bo.Jiao@mediatek.com>
References: <cover.1637652742.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_000041_480434_9E8C61D6 
X-CRM114-Status: GOOD (  12.15  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

Add pci_device_id to enable mt7916. Note that MT_HW_CHIPID is no
longer used for further chips, so drop it accordingly.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/pci.c  | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 7ba5b1f..d463b3c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -534,7 +534,7 @@ static int mt7915_mmio_init(struct mt76_dev *mdev,
 	bus_ops->rmw = mt7915_rmw;
 	dev->mt76.bus = bus_ops;
 
-	mdev->rev = (mt76_rr(dev, MT_HW_CHIPID) << 16) |
+	mdev->rev = (device_id << 16) |
 		    (mt76_rr(dev, MT_HW_REV) & 0xff);
 	dev_dbg(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 3134b46..8d1a811 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -18,11 +18,13 @@ static u32 hif_idx;
 
 static const struct pci_device_id mt7915_pci_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7915) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7906) },
 	{ },
 };
 
 static const struct pci_device_id mt7915_hif_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7916) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x790a) },
 	{ },
 };
 
@@ -61,7 +63,8 @@ static void mt7915_put_hif2(struct mt7915_hif *hif)
 static struct mt7915_hif *mt7915_pci_init_hif2(struct pci_dev *pdev)
 {
 	hif_idx++;
-	if (!pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x7916, NULL))
+	if (!pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x7916, NULL) &&
+	    !pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x790a, NULL))
 		return NULL;
 
 	writel(hif_idx | MT_PCIE_RECOG_ID_SEM,
@@ -112,7 +115,7 @@ static int mt7915_pci_probe(struct pci_dev *pdev,
 
 	mt76_pci_disable_aspm(pdev);
 
-	if (id->device == 0x7916)
+	if (id->device == 0x7916 || id->device == 0x790a)
 		return mt7915_pci_hif2_probe(pdev);
 
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
