Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FBBECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HkUAny1cuMgRvcA8UKJ+awhAgM2NFuESRyFNqyD49QY=; b=cZoZXQz6NJn5KVa/pj+trS6T6+
	MwtlDQCCWPzh+rpEurUbFqPbr57JTHgP/VZWN3i4g/weC0nzgN8K9ea132/LsCJgHdOOfMwLS6WNq
	osMNdRRaMyWn5r91NnGJiiwNWU0R3ZSavCkIVAMkmy+JH6nJnaj+Yryd+eOTqKRAi5SzhO4TieUsf
	jp1zuAEMN6w4XKGwi288ctN3TzysQ1wk2DxGPJ4poRW0QI7OugT/evljMFhg4/oLPN65Z4LHDeAsz
	yFpsWqFHnbxHPYRq+UK0AEEaOTZFS1++D1/TdE/sw3zmL3v/QCb4nwu8tNhyI51j90cJCbGSRw6si
	xXM0ZfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkOg-0047Lq-U3; Thu, 15 Sep 2022 08:38:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkOe-0047H3-2s
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 08:38:57 +0000
X-UUID: 3f0eb534c1044539bfe69fa1c7244392-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HkUAny1cuMgRvcA8UKJ+awhAgM2NFuESRyFNqyD49QY=;
	b=UmwQa+bGw2aW5EF1hH+b2fPakU+xSY8WNcd2G/IwcCGLM6uqgzz850oBCaSrNDh67BRxFr5ySFytG1CxYOoH1xWDcQpY1W1VCy9iQ6bJ7ONFNiRGhuOkXBPhNUsolNwiqxDWxhvIXFmCCY73FP+lKu3jydfD/iLvK1JLIQ+PPts=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2b96d54a-0f7f-45a9-8ff9-07aa00cbd4fc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:e50fbb7b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3f0eb534c1044539bfe69fa1c7244392-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 762155856; Thu, 15 Sep 2022 01:36:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 16:36:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 16:36:14 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
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
Subject: [PATCH] wifi: mt76: mt7921s: Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date: Thu, 15 Sep 2022 16:36:04 +0800
Message-ID: <e5478408c98e51e6903892cf128acdc103a09535.1663229480.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_013856_188967_C660D07E 
X-CRM114-Status: GOOD (  10.60  )
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

From: Deren Wu <deren.wu@mediatek.com>

Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
handle the .suspend/.resume callbacks. The new macros allow suspend
and resume functions to be automatically dropped without any #ifdef
guards.

Tested-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 487acd6e2be8..545577eff8ae 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -194,7 +194,6 @@ static void mt7921s_remove(struct sdio_func *func)
 	mt7921s_unregister_device(dev);
 }
 
-#ifdef CONFIG_PM
 static int mt7921s_suspend(struct device *__dev)
 {
 	struct sdio_func *func = dev_to_sdio_func(__dev);
@@ -296,26 +295,18 @@ static int mt7921s_resume(struct device *__dev)
 	return err;
 }
 
-static const struct dev_pm_ops mt7921s_pm_ops = {
-	.suspend = mt7921s_suspend,
-	.resume = mt7921s_resume,
-};
-#endif
-
 MODULE_DEVICE_TABLE(sdio, mt7921s_table);
 MODULE_FIRMWARE(MT7921_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7921_ROM_PATCH);
 
+static DEFINE_SIMPLE_DEV_PM_OPS(mt7921s_pm_ops, mt7921s_suspend, mt7921s_resume);
+
 static struct sdio_driver mt7921s_driver = {
 	.name		= KBUILD_MODNAME,
 	.probe		= mt7921s_probe,
 	.remove		= mt7921s_remove,
 	.id_table	= mt7921s_table,
-#ifdef CONFIG_PM
-	.drv = {
-		.pm = &mt7921s_pm_ops,
-	}
-#endif
+	.drv.pm		= pm_sleep_ptr(&mt7921s_pm_ops),
 };
 module_sdio_driver(mt7921s_driver);
 MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
-- 
2.18.0


