Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB88C636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IyCEBDYX76aYk2yRW5lF1MmaueH2bNdB8Ayjh3jOrPk=; b=fFE2SNK6em0J/E89DhKphNsAj4
	gYaAG6FXaWQTk0dOnAPCeSF7v8AmtTRn7fPaTR6DKAQJ9RhV2x1XnEio++5BRYUlsbMX/tRGcnkVF
	qpQfC4oA98WuHTxPXjfbdc6yg2bhFoSgGeu196WRHW3fE5q1zGB6pj3mJurB/2sR9tH0aDrVU0N7j
	B2FE4ZPLfLp0pBIbRognEWEWP3ocvZfaLI63W6V7Xv5N1kC+yaM+hNVcTH0gx3l6CO1N0uJF4b1xo
	P4yHMJnh/wnqte/FlUFn/0dLXB97mxMFZeqG1Br1WMwQb5T6wY9oLvHVis/rb8LELf2ykdgB95tl1
	zmS47IAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXsE-00Ecg9-TM; Mon, 13 Feb 2023 12:23:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXsC-00Ecdz-Mh
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 12:23:58 +0000
X-UUID: 3e14c5d6ab9911edbbe3f76fe852e059-20230213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IyCEBDYX76aYk2yRW5lF1MmaueH2bNdB8Ayjh3jOrPk=;
	b=RYS0mlcc4iMWIkA7xSxkrra+8EqTHt0khGkdFa/fmmuwqcAGSrW/A7A5AxjrO4muE0NlDDUIREOZ1Gr93IwXvUvFn1GRb+NUc9CxjeuJCfzXwoRwg/bCeFWC0OtSY7CarTY/xq6j6u+VJTBNP2q1UFuyGymoeo9XP2s5mML4evY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:3a965f05-f056-4ddb-a675-c4bdf676361b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:885ddb2,CLOUDID:d28fbe8e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 3e14c5d6ab9911edbbe3f76fe852e059-20230213
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1456993385; Mon, 13 Feb 2023 05:23:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 13 Feb 2023 20:23:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 13 Feb 2023 20:23:00 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, Eric-SY
 Chang <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder
 Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: fix PCI DMA hang after reboot
Date: Mon, 13 Feb 2023 20:22:40 +0800
Message-ID: <a416aae35ea1a77dd0da3922de3dd295000be4ed.1676290076.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_042356_790767_1167782D 
X-CRM114-Status: GOOD (  10.28  )
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

mt7921 just stop some workers and clean up chip status before reboot.
In stress test, there are working activities still running at the period
of .shutdown callback and that would cause some hosts cannot recover
DMA after reboot. To avoid the floating state in reboot, we use
mt7921_pci_remove() to fully deinit all resources.

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index cb72ded37256..1a8a54a46dcc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -509,17 +509,7 @@ static int mt7921_pci_resume(struct device *device)
 
 static void mt7921_pci_shutdown(struct pci_dev *pdev)
 {
-	struct mt76_dev *mdev = pci_get_drvdata(pdev);
-	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
-	struct mt76_connac_pm *pm = &dev->pm;
-
-	cancel_delayed_work_sync(&pm->ps_work);
-	cancel_work_sync(&pm->wake_work);
-
-	/* chip cleanup before reboot */
-	mt7921_mcu_drv_pmctrl(dev);
-	mt7921_dma_cleanup(dev);
-	mt7921_wfsys_reset(dev);
+	mt7921_pci_remove(pdev);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt7921_pm_ops, mt7921_pci_suspend, mt7921_pci_resume);
-- 
2.18.0


