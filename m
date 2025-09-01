Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14929CA0FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Sep 2025 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nkCIubutJycJl/A+gBZ1Ci2tKUm1/PnTAAjLguTK4SE=; b=IZjUf6DK8HO1Wl1jFqaCMRYui5
	z8yefCily+w/j6TQA9udZaFI1Ohv4DyOish6C9L3lYzhnOWAfYGLDh8YSBu58Xt7VZ7hucq0Qdome
	AHqiarcinINkeLOzAlQuwsA8B7TSyZRxE08ZDcdKAs3tjPZVitIJfCSFS4SUhEEAlyyEtJpFKXT7L
	Vfby+LQd/O6m/FzS3Y9vD4a3E5UXdB4uHRdmypSru8Ejydfiw5Eu7hZ20KnoMR2XFP4YQQjiLvDZD
	ojE7/Lh7DEFm+IYb46dec0fcaNRcK7jnPTSHg0gf3ApWob+13AKca7hWKmuAIxeZJIlLmBdtRSb13
	i6XRXN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszTo-0000000BVrg-49Sz;
	Mon, 01 Sep 2025 08:01:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz1P-0000000BRfm-1RB2
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Sep 2025 07:32:12 +0000
X-UUID: c159aee4870511f09eb0dd999d3936bf-20250901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nkCIubutJycJl/A+gBZ1Ci2tKUm1/PnTAAjLguTK4SE=;
	b=kJZFpHwNSL1B5/QKD2OtlYbTAQtZm4xNtPleXxIZQZKiAIoXtTOBF3HpVm+La74sV2H8Vsoc/PykDuVG4Whhoz7LoV5+wTpsl0RHnIiVB0Ctntgs73njffVgpqeu11ihTEuhySPkzQ0KttVqh3vV2c7tsTdWmsQghbekKDcJfR0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:e020e4ea-3e7d-4e2b-a842-e63f214cf793,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:85764d84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c159aee4870511f09eb0dd999d3936bf-20250901
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1344032670; Mon, 01 Sep 2025 00:32:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 1 Sep 2025 15:32:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 1 Sep 2025 15:32:01 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Jack Kao <jack.kao@mediatek.com>, Ming
 Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: add pci restore for hibernate
Date: Mon, 1 Sep 2025 15:32:00 +0800
Message-ID: <20250901073200.230033-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_003211_402690_E8C1816A 
X-CRM114-Status: GOOD (  12.50  )
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

From: Jack Kao <jack.kao@mediatek.com>

Due to hibernation causing a power off and power on,
this modification adds mt7925_pci_restore callback function for kernel.
When hibernation resumes, it calls mt7925_pci_restore to reset the device,
allowing it to return to the state it was in before the power off.

Signed-off-by: Jack Kao <jack.kao@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/pci.c   | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 387d56893ecb..b5a6eaa6c11a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -541,7 +541,7 @@ static int mt7925_pci_suspend(struct device *device)
 	return err;
 }
 
-static int mt7925_pci_resume(struct device *device)
+static int _mt7925_pci_resume(struct device *device, bool restore)
 {
 	struct pci_dev *pdev = to_pci_dev(device);
 	struct mt76_dev *mdev = pci_get_drvdata(pdev);
@@ -581,6 +581,9 @@ static int mt7925_pci_resume(struct device *device)
 	napi_schedule(&mdev->tx_napi);
 	local_bh_enable();
 
+	if (restore)
+		goto failed;
+
 	mt76_connac_mcu_set_hif_suspend(mdev, false, false);
 	ret = wait_event_timeout(dev->wait,
 				 dev->hif_resumed, 3 * HZ);
@@ -597,7 +600,7 @@ static int mt7925_pci_resume(struct device *device)
 failed:
 	pm->suspended = false;
 
-	if (err < 0)
+	if (err < 0 || restore)
 		mt792x_reset(&dev->mt76);
 
 	return err;
@@ -608,7 +611,24 @@ static void mt7925_pci_shutdown(struct pci_dev *pdev)
 	mt7925_pci_remove(pdev);
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(mt7925_pm_ops, mt7925_pci_suspend, mt7925_pci_resume);
+static int mt7925_pci_resume(struct device *device)
+{
+	return _mt7925_pci_resume(device, false);
+}
+
+static int mt7925_pci_restore(struct device *device)
+{
+	return _mt7925_pci_resume(device, true);
+}
+
+static const struct dev_pm_ops mt7925_pm_ops = {
+	.suspend = pm_sleep_ptr(mt7925_pci_suspend),
+	.resume  = pm_sleep_ptr(mt7925_pci_resume),
+	.freeze = pm_sleep_ptr(mt7925_pci_suspend),
+	.thaw = pm_sleep_ptr(mt7925_pci_resume),
+	.poweroff = pm_sleep_ptr(mt7925_pci_suspend),
+	.restore = pm_sleep_ptr(mt7925_pci_restore),
+};
 
 static struct pci_driver mt7925_pci_driver = {
 	.name		= KBUILD_MODNAME,
-- 
2.34.1


