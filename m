Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38886C41513
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 11:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MH6Kz0kTC3Ij/F9zYIlY7zkjiUFQcykeZ8kvq7UsVlE=; b=qfv39t50CL2lYtv3qhCKrP2fqS
	tWayHhPAd+/PzwvSA2joq9GSe0M97CbK3JKScvC0nf3VALqvgA0XZv/N5oV7OVG35sLtiQgLzRiRq
	0ECC20AtMmAmTRSICjzhMfETmCc5U0hMF4Z0p3nv5m706fiyic4IhGTAlOS8WAoxrqQVAB37CdQ+k
	ofwfXrRrbPtjF0/WMcQBy1FPqac9/ILhYMJ0I19/+8IPPbC7WITrqUrgQhEQVklhJizx/oHoF8CJD
	7IXZzZXcxApDCeBxJ3V5VOGHy+MASdIFdP4OcRpf96nTdHWqjpduREB7kiT3cFv7gxzYr2M9rJVTG
	6gpcCAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6W8-000000061Wk-2qI4;
	Thu, 23 May 2024 11:21:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6W4-000000061Tz-34r2
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 11:21:50 +0000
X-UUID: 9de0016c18f611ef82c84f6416ccf2f3-20240523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MH6Kz0kTC3Ij/F9zYIlY7zkjiUFQcykeZ8kvq7UsVlE=;
	b=BpQuPZEXuAWrEKaPZvwFWBT+dMO+BGjKRF2Wa1eDKcdM5wjXxptE3S4Go3lrXSEqylEknUSBQVo8Tu29ENcZciPcm0PTpFu1DFiGCQITog0xahRJUc+G2J5Oo3aIwX78fBk2gNwz9pnNrTjjRrJD3SzCkMhNlaY/acXqDwfQfxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:e6322992-9051-4ec0-b05d-6a6958ab0294,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:19f175fc-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9de0016c18f611ef82c84f6416ccf2f3-20240523
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1888154723; Thu, 23 May 2024 04:21:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 23 May 2024 19:21:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 23 May 2024 19:21:33 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Michael Lo <michael.lo@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt792x: fix scheduler interference in drv own process
Date: Thu, 23 May 2024 19:21:31 +0800
Message-ID: <20240523112131.31437-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_042148_981493_8235EA89 
X-CRM114-Status: GOOD (  12.12  )
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

From: Michael Lo <michael.lo@mediatek.com>

Add some time to wait for LP engine to complete its operation
before polling pmctrl register.

Signed-off-by: Michael Lo <michael.lo@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2: change funcion and variable naming.
---

 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  3 +++
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |  3 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  4 ++++
 drivers/net/wireless/mediatek/mt76/pci.c      | 23 +++++++++++++++++++
 6 files changed, 35 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 11b9f22ca7f3..4168104fa141 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1081,6 +1081,7 @@ bool ____mt76_poll_msec(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
 
 void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs);
 void mt76_pci_disable_aspm(struct pci_dev *pdev);
+bool mt76_pci_aspm_supported(struct pci_dev *pdev);
 
 static inline u16 mt76_chip(struct mt76_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index f768e9389ac6..ca54ae7deb54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -339,6 +339,9 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	bus_ops->rmw = mt7921_rmw;
 	dev->mt76.bus = bus_ops;
 
+	if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
+		dev->aspm_supported = true;
+
 	ret = mt792xe_mcu_fw_pmctrl(dev);
 	if (ret)
 		goto err_free_dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 07b74d492ce1..2449b3e6c396 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -373,6 +373,9 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	bus_ops->rmw = mt7925_rmw;
 	dev->mt76.bus = bus_ops;
 
+	if (!mt7925_disable_aspm && mt76_pci_aspm_supported(pdev))
+		dev->aspm_supported = true;
+
 	ret = __mt792x_mcu_fw_pmctrl(dev);
 	if (ret)
 		goto err_free_dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 20578497a405..c2c42e5d650a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -190,6 +190,7 @@ struct mt792x_dev {
 	bool fw_assert:1;
 	bool has_eht:1;
 	bool regd_in_progress:1;
+	bool aspm_supported:1;
 	wait_queue_head_t wait;
 
 	struct work_struct init_work;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index a405af8d9052..588b24edfdd9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -766,6 +766,10 @@ int __mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev)
 
 	for (i = 0; i < MT792x_DRV_OWN_RETRY_COUNT; i++) {
 		mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_CLR_OWN);
+
+		if (dev->aspm_supported)
+			usleep_range(2000, 3000);
+
 		if (mt76_poll_msec_tick(dev, MT_CONN_ON_LPCTL,
 					PCIE_LPCR_HOST_OWN_SYNC, 0, 50, 1))
 			break;
diff --git a/drivers/net/wireless/mediatek/mt76/pci.c b/drivers/net/wireless/mediatek/mt76/pci.c
index 4c1c159fbb62..b5031ca7f73f 100644
--- a/drivers/net/wireless/mediatek/mt76/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/pci.c
@@ -45,3 +45,26 @@ void mt76_pci_disable_aspm(struct pci_dev *pdev)
 					   aspm_conf);
 }
 EXPORT_SYMBOL_GPL(mt76_pci_disable_aspm);
+
+bool mt76_pci_aspm_supported(struct pci_dev *pdev)
+{
+	struct pci_dev *parent = pdev->bus->self;
+	u16 aspm_conf, parent_aspm_conf = 0;
+	bool result = true;
+
+	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &aspm_conf);
+	aspm_conf &= PCI_EXP_LNKCTL_ASPMC;
+	if (parent) {
+		pcie_capability_read_word(parent, PCI_EXP_LNKCTL,
+					  &parent_aspm_conf);
+		parent_aspm_conf &= PCI_EXP_LNKCTL_ASPMC;
+	}
+
+	if (!aspm_conf && (!parent || !parent_aspm_conf)) {
+		/* aspm already disabled */
+		result = false;
+	}
+
+	return result;
+}
+EXPORT_SYMBOL_GPL(mt76_pci_aspm_supported);
-- 
2.18.0


