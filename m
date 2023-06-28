Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52842EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eT+h0gobxZAxWtZtit0yrYXxG3O0OM/ESXkwv7nAg/U=; b=O9jFLeOBp952SOMSgpBKWPzrJy
	OyHdMPLFfzCdERE7MoNAbaOZ2Fq1mYUPpQJFLaevvCmJPNQNp5MGviegX7N4c2DdtViiis3pas6ma
	WUO89OCpzgkSXfVFDzjZK0QQnFnkwH/vY1RcJT/cHcF/SPcyvItafOOnhOe8BWdRu64JnDXpQdheJ
	e3plju7IJkRnNuPqtE6Cxqr1/egwpVwxsPVklFGKo4QaZ/Ssb7gKX+Irl3bKoGsT29ByjjojGiJyM
	lqqt2I+xo43BVYLAL9f1F1o1/54T7258P2fmdQBjqHisVzUTSXoVazc3lW5QPXaYDfhJ8g7iSuP7Q
	+1MujAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPKm-00F2S2-2o;
	Wed, 28 Jun 2023 07:11:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPKi-00F2Pw-0J
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 07:11:21 +0000
X-UUID: a900b73a158211ee912e1518a6540028-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eT+h0gobxZAxWtZtit0yrYXxG3O0OM/ESXkwv7nAg/U=;
	b=S7PHhqVhCNyXzvaRcN6U/2QSF9vq6CdII24HwmrBNW8Lu+kXy6EiR2LqFF+vXrW36AVsSohJkelGZuf1No4VcOgPTfKe1HtqekWSdKoYtgeKSb60sfpdZtr/NZBP9kRz4+8SltEXbMzt2+yxVhIWlbzTC2kopgF4trPP6noTB3A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:646d5f42-1b7c-4df1-81d9-2633782d74fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.27,REQID:646d5f42-1b7c-4df1-81d9-2633782d74fb,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:01c9525,CLOUDID:2f899b0d-c22b-45ab-8a43-3004e9216b56,B
	ulkID:23062815090492M46TZV,BulkQuantity:0,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_FAS
X-UUID: a900b73a158211ee912e1518a6540028-20230628
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 90204815; Wed, 28 Jun 2023 00:09:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 28 Jun 2023 15:09:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 28 Jun 2023 15:09:00 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 11/11] wifi: mt76: mt7921: move mt7921u_disconnect mt792x-lib
Date: Wed, 28 Jun 2023 15:07:24 +0800
Message-ID: <4c0ef45ef191600edde809f2233d25c6b5dbf15d.1687920269.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1687920269.git.deren.wu@mediatek.com>
References: <cover.1687920269.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_001120_142638_5F415DFB 
X-CRM114-Status: GOOD (  11.46  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

mt7921u_disconnect routine is shared between mt7921 and mt7925 so move
it in mt792x-usb module.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/usb.c   | 19 +----------------
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +-
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 21 +++++++++++++++++--
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index c3981bc893ac..59cd3d98bf90 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -254,23 +254,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	return ret;
 }
 
-static void mt7921u_disconnect(struct usb_interface *usb_intf)
-{
-	struct mt792x_dev *dev = usb_get_intfdata(usb_intf);
-
-	cancel_work_sync(&dev->init_work);
-	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state))
-		return;
-
-	mt76_unregister_device(&dev->mt76);
-	mt792xu_cleanup(dev);
-
-	usb_set_intfdata(usb_intf, NULL);
-	usb_put_dev(interface_to_usbdev(usb_intf));
-
-	mt76_free_device(&dev->mt76);
-}
-
 #ifdef CONFIG_PM
 static int mt7921u_suspend(struct usb_interface *intf, pm_message_t state)
 {
@@ -350,7 +333,7 @@ static struct usb_driver mt7921u_driver = {
 	.name		= KBUILD_MODNAME,
 	.id_table	= mt7921u_device_table,
 	.probe		= mt7921u_probe,
-	.disconnect	= mt7921u_disconnect,
+	.disconnect	= mt792xu_disconnect,
 #ifdef CONFIG_PM
 	.suspend	= mt7921u_suspend,
 	.resume		= mt7921u_resume,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index d80f80bc7656..5d5ab8630041 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -336,7 +336,7 @@ u32 mt792xu_rr(struct mt76_dev *dev, u32 addr);
 void mt792xu_wr(struct mt76_dev *dev, u32 addr, u32 val);
 u32 mt792xu_rmw(struct mt76_dev *dev, u32 addr, u32 mask, u32 val);
 void mt792xu_copy(struct mt76_dev *dev, u32 offset, const void *data, int len);
-void mt792xu_cleanup(struct mt792x_dev *dev);
+void mt792xu_disconnect(struct usb_interface *usb_intf);
 
 int __mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev);
 int mt792xe_mcu_drv_pmctrl(struct mt792x_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 97480c9c9974..20e7f9c7c88c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -91,14 +91,13 @@ int mt792xu_mcu_power_on(struct mt792x_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt792xu_mcu_power_on);
 
-void mt792xu_cleanup(struct mt792x_dev *dev)
+static void mt792xu_cleanup(struct mt792x_dev *dev)
 {
 	clear_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
 	mt792xu_wfsys_reset(dev);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
 	mt76u_queues_deinit(&dev->mt76);
 }
-EXPORT_SYMBOL_GPL(mt792xu_cleanup);
 
 static u32 mt792xu_uhw_rr(struct mt76_dev *dev, u32 addr)
 {
@@ -288,5 +287,23 @@ int mt792xu_init_reset(struct mt792x_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt792xu_init_reset);
 
+void mt792xu_disconnect(struct usb_interface *usb_intf)
+{
+	struct mt792x_dev *dev = usb_get_intfdata(usb_intf);
+
+	cancel_work_sync(&dev->init_work);
+	if (!test_bit(MT76_STATE_INITIALIZED, &dev->mphy.state))
+		return;
+
+	mt76_unregister_device(&dev->mt76);
+	mt792xu_cleanup(dev);
+
+	usb_set_intfdata(usb_intf, NULL);
+	usb_put_dev(interface_to_usbdev(usb_intf));
+
+	mt76_free_device(&dev->mt76);
+}
+EXPORT_SYMBOL_GPL(mt792xu_disconnect);
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
-- 
2.18.0


