Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29738C43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=teGRJgvfH/U8wtkf9vgUtG+mrCTWmY4r8TQDwB18MFo=; b=aUsGZzJlCr3SZlwTFQgDbmQTzM
	pzT12lxz39qYCZktz8UKA3c+A+/MN7TLPLHS814QLfJLRPxI2WS4mMAUeD0/YaHU3JF9WCTQEX784
	FxdEMawh7PAaAaP2/lHl1lBoNqQ+0qTu46Jmj9JJmCfKT4qmpxrjfWO/DaZrTIvK1sh4JlJagqZd3
	uzbh8eMdfmUNenJ0AV3CHNTyp1Gut6M6T7jzhniMlAlhaTXo8npIGAhQoEN8IbtLIuKz4oZNyYCWh
	PkRdjRILbqSaRwiuUehkg/rbJ8ZQlAfzPRKRIRxJLu7Mi5aJbaS+FrSmS7jmzZorOYfnM43GkK/nP
	oym3eLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hlM-0074es-HE; Thu, 01 Dec 2022 11:29:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hlK-0074dp-CO
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 11:29:55 +0000
X-UUID: b7bff47b522f4b35964288f22dce3099-20221201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=teGRJgvfH/U8wtkf9vgUtG+mrCTWmY4r8TQDwB18MFo=;
	b=gx9CNyDgbNQ0YQTpYYhFf5PQ5HRIp9ut5N1xHNMRKQLwhNKpfrNdo7FsYTXJrnFWEphJSiZS9MrOIzYuXG8DifZDjLiCRf3t7rBzrBc1MjZruMVAoAYazodAvmX7pJFLZk5IF8//66bcwoZ8Eevr0XvPtNejfK+tndrwGJDv2d4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:f1d111d6-cb71-4303-ad43-5fbc34cffa94,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:9c326330-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b7bff47b522f4b35964288f22dce3099-20221201
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 718254696; Thu, 01 Dec 2022 04:29:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 1 Dec 2022 18:39:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 18:39:10 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v3] wifi: mt76: mt7921e: add pci .shutdown() support
Date: Thu, 1 Dec 2022 18:38:42 +0800
Message-ID: <f9126324d6d047dbc39a88f98a33bfcc888596bd.1669890885.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_032954_460453_1B371824 
X-CRM114-Status: GOOD (  11.40  )
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

From: Leon Yen <Leon.Yen@mediatek.com>

Some combinations of hosts cannnot detect mt7921e after reboot. The
interoperability issue is caused by the status mismatch between host
and chip fw. In such cases, the driver should stop chip activities
and reset chip to default state before reboot.

Suggested-by: angelogioacchino.delregno@collabora.com
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
---
v3:
  - use pci .shutdown() instead of reboot notification
  - add suggested by Angelo
v2: add reboot notification block in mt76
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 28342ec940f0..cb72ded37256 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -507,6 +507,21 @@ static int mt7921_pci_resume(struct device *device)
 	return err;
 }
 
+static void mt7921_pci_shutdown(struct pci_dev *pdev)
+{
+	struct mt76_dev *mdev = pci_get_drvdata(pdev);
+	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	struct mt76_connac_pm *pm = &dev->pm;
+
+	cancel_delayed_work_sync(&pm->ps_work);
+	cancel_work_sync(&pm->wake_work);
+
+	/* chip cleanup before reboot */
+	mt7921_mcu_drv_pmctrl(dev);
+	mt7921_dma_cleanup(dev);
+	mt7921_wfsys_reset(dev);
+}
+
 static DEFINE_SIMPLE_DEV_PM_OPS(mt7921_pm_ops, mt7921_pci_suspend, mt7921_pci_resume);
 
 static struct pci_driver mt7921_pci_driver = {
@@ -514,6 +529,7 @@ static struct pci_driver mt7921_pci_driver = {
 	.id_table	= mt7921_pci_device_table,
 	.probe		= mt7921_pci_probe,
 	.remove		= mt7921_pci_remove,
+	.shutdown	= mt7921_pci_shutdown,
 	.driver.pm	= pm_sleep_ptr(&mt7921_pm_ops),
 };
 
-- 
2.18.0


