Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B44EECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8wsvf7XzdAL464C0rzEkWk+2PA7kypLI5OvW/jQeWU4=; b=QOx06j0d7RUwoWBxVbHvpbm90t
	y3o/E9dQTiDRSq+2NsNPHL20Ctb2lEfiSZPZHJE4JrCttRJIwDkfxJ11XbbuE8WH+DSdTKMEBcEPw
	ZtJQ2HuHBJzWFiSdc20BOSxjFHvNJ18VJx8ljze3UcVjTpfA3FLbawQHGAaMnr8k9EfD8Eo/UuOGJ
	LCkwxLyV9DF1NZAcBK2LhHspmWuR/uPt2UZkJmpWyzE2MbpnDzNaBFXk+sLzniF0P6XWedlt7h93r
	AATNlL7AdNK/4YMcs4G438pS47ySAN36zD2mjnz+cukGcE12sTlZr4FtFX7HKKMPxVlhxWyQcTX0T
	NDcH13DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlRH-005euI-St; Thu, 15 Sep 2022 09:45:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlR1-005eaF-3u
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 09:45:28 +0000
X-UUID: 3d768223a1aa4f63921a5c603b7d12f5-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8wsvf7XzdAL464C0rzEkWk+2PA7kypLI5OvW/jQeWU4=;
	b=tKSeICnehbv/LbB3MVO33w+u2dn4Pwl2TmhfLfBj1195hbU2Y/ySRYI5dM7KzOkbryCMTOLmfpAw2QF+LDLTlUtgQ0BwQfORFs+G/b18XzH7c6vQnKBB1aN20pr9z+DqsVdBLAUljLxS72rYTZ8A73O7KV+b/ZQ+LaBQZxp9szA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:be30fd47-dbe9-4f2a-803b-e7a51113ad11,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:15b882f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3d768223a1aa4f63921a5c603b7d12f5-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 214714338; Thu, 15 Sep 2022 02:36:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 16:35:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 16:35:54 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
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
Subject: [PATCH] wifi: mt76: mt7663s: Switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date: Thu, 15 Sep 2022 16:35:52 +0800
Message-ID: <0f463aaa811122387b068bac045c51a4959ef6ef.1663229534.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_024527_199191_4E982E03 
X-CRM114-Status: GOOD (  10.80  )
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

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index 49ab3a1f3b9b..401d457b7946 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -180,7 +180,6 @@ static void mt7663s_remove(struct sdio_func *func)
 	mt76_free_device(&dev->mt76);
 }
 
-#ifdef CONFIG_PM
 static int mt7663s_suspend(struct device *dev)
 {
 	struct sdio_func *func = dev_to_sdio_func(dev);
@@ -235,28 +234,20 @@ static int mt7663s_resume(struct device *dev)
 	return err;
 }
 
-static const struct dev_pm_ops mt7663s_pm_ops = {
-	.suspend = mt7663s_suspend,
-	.resume = mt7663s_resume,
-};
-#endif
-
 MODULE_DEVICE_TABLE(sdio, mt7663s_table);
 MODULE_FIRMWARE(MT7663_OFFLOAD_FIRMWARE_N9);
 MODULE_FIRMWARE(MT7663_OFFLOAD_ROM_PATCH);
 MODULE_FIRMWARE(MT7663_FIRMWARE_N9);
 MODULE_FIRMWARE(MT7663_ROM_PATCH);
 
+static DEFINE_SIMPLE_DEV_PM_OPS(mt7663s_pm_ops, mt7663s_suspend, mt7663s_resume);
+
 static struct sdio_driver mt7663s_driver = {
 	.name		= KBUILD_MODNAME,
 	.probe		= mt7663s_probe,
 	.remove		= mt7663s_remove,
 	.id_table	= mt7663s_table,
-#ifdef CONFIG_PM
-	.drv = {
-		.pm = &mt7663s_pm_ops,
-	}
-#endif
+	.drv.pm		= pm_sleep_ptr(&mt7663s_pm_ops),
 };
 module_sdio_driver(mt7663s_driver);
 
-- 
2.18.0


