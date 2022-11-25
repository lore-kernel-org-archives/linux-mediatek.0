Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC04C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7OfNukSIJCfSvdmDLdM4fonmtezX9J+mk1ntbpFnZ7M=; b=KOLnMIb2qRQv59u0dnMkd77Dzc
	SEvsJ+EnJQqWY5JpylMc1T+FEeUZIRG7zsBWQFTC18EtRnSM6A4pXtgNEEKDZVmrLxlonNtqZkUL2
	6oQiGQOeRBqo/I+CPV5NLyTDMqXGCrcVLVDyo/5R9a4cssnIihr9mCrZLLL8wvA9prg70tzE5MAEE
	EoE+l0qki7tS3iuF0F0e4ZvnomPEQumrh2erdDTtDjMpz4m8jCGVfbMBE8b5gQeHqjblMhaBbbKHH
	f8PA7GMSAxkfEr2KfI5+qqYnI/Bya4ksmxbl8BYBbWqEimhXZp7mTxGhkK2r1Mv6khzTz3NuJTp9Y
	xG/zvnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTGb-00E7Sw-Fi; Fri, 25 Nov 2022 07:36:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTGY-00E7O0-96
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 07:36:56 +0000
X-UUID: 63a4a42183a94643ac570416f250e264-20221125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7OfNukSIJCfSvdmDLdM4fonmtezX9J+mk1ntbpFnZ7M=;
	b=DcTOISLexRWAtT4I8V/oIPsa1AW2kvH8Ts91KtuDL7PSHtXH+WZuEH732wZBU/Typ5oen+gxxSZyxhCzqKER6zM2QWTETu3o8LhaWnHBSG0qRn6P66ONzc0ncJOZ4/uytZ61OKHmt2IKxWrO7AFMLZoJn5Jic6IKijGC3fh13GI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:0866f6fd-cfee-41bb-815b-681c767124d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.14,REQID:0866f6fd-cfee-41bb-815b-681c767124d0,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:dcaaed0,CLOUDID:6c6d39dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:221125153644SR3VSP6A,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 63a4a42183a94643ac570416f250e264-20221125
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2104140112; Fri, 25 Nov 2022 00:36:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 25 Nov 2022 15:36:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 25 Nov 2022 15:36:40 +0800
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
Subject: [PATCH] wifi: mt76: mt7921e: introduce reboot notifier support
Date: Fri, 25 Nov 2022 15:36:00 +0800
Message-ID: <28482de35c4f1589dcf96b662a48bc558fe46e8f.1669361180.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_233654_387255_2B35D939 
X-CRM114-Status: GOOD (  13.30  )
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

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 6fc04ed34ec3..64156d32b62d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -306,6 +306,7 @@ struct mt7921_dev {
 	struct sk_buff_head ipv6_ns_list;
 
 	enum environment_cap country_ie_env;
+	struct notifier_block reboot_nb;
 };
 
 enum {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 28342ec940f0..6d20b3ed5db1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/reboot.h>
 
 #include "mt7921.h"
 #include "mac.h"
@@ -110,6 +111,7 @@ static void mt7921e_unregister_device(struct mt7921_dev *dev)
 	struct mt76_connac_pm *pm = &dev->pm;
 
 	cancel_work_sync(&dev->init_work);
+	unregister_reboot_notifier(&dev->reboot_nb);
 	mt76_unregister_device(&dev->mt76);
 	mt76_for_each_q_rx(&dev->mt76, i)
 		napi_disable(&dev->mt76.napi[i]);
@@ -226,6 +228,24 @@ static u32 mt7921_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
 	return dev->bus_ops->rmw(mdev, addr, mask, val);
 }
 
+static int mt7921e_reboot_notifier(struct notifier_block *nb,
+				   unsigned long code, void *unused)
+{
+	struct mt7921_dev *dev = container_of(nb, struct mt7921_dev,
+					      reboot_nb);
+	struct mt76_connac_pm *pm = &dev->pm;
+
+	cancel_delayed_work_sync(&pm->ps_work);
+	cancel_work_sync(&pm->wake_work);
+
+	/* chip cleanup before reboot */
+	mt7921_mcu_drv_pmctrl(dev);
+	mt7921_dma_cleanup(dev);
+	mt7921_wfsys_reset(dev);
+
+	return NOTIFY_DONE;
+}
+
 static int mt7921_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -361,6 +381,11 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_irq;
 
+	dev->reboot_nb.notifier_call = mt7921e_reboot_notifier;
+	ret = register_reboot_notifier(&dev->reboot_nb);
+	if (ret)
+		goto err_free_irq;
+
 	return 0;
 
 err_free_irq:
-- 
2.18.0


