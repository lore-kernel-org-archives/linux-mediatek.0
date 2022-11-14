Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A96C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 02:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aRqmoYXBgTeHqrM+K2EJUB3BrOYPaN+00XY1lOs9Q/8=; b=rJySV/4J3ngrOTSA+UgrBBJcfX
	HGBiK9tZsmWnDcsAOiGY2Pq1QWp8QeW+2frXV2XmAf6j29AYreSXcHvNnuoVdT2Dsay2SZyfh68rQ
	uhFo0jVWIIbn+njWqkbUT1sbeBpGe+/YRQzC9xsy3SYLppmAV6QK740/xRV4Arf54hvAT1kJzcEXY
	/I+1XxXg7UG3td3qE7tQwLIToMrU10xgHa9ZKab7Q5h1QSKQBFA/54I729yHbigxMdeQZhPaXdhDk
	20etTfNXvrrys9FemDR55AbFqpdtL20Qv7rLfRdhzeOadTuwJ4E9fpeVFb4+dYcgn6j0I79FfOOEn
	/I18wwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouP3P-00FWtW-86; Mon, 14 Nov 2022 02:18:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouP3N-00FWt8-3b
	for linux-mediatek@lists.infradead.org; Mon, 14 Nov 2022 02:18:30 +0000
X-UUID: a4be16aaa6994d3fa8f325db2e4a92ea-20221113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aRqmoYXBgTeHqrM+K2EJUB3BrOYPaN+00XY1lOs9Q/8=;
	b=YlZDvKaZgNTsjdHUVEFKcHUvmzNsz+hI+S/NgtBNETc+Uo8lE/bOBCiM1utOzjgBvdPUi1GmQVPTnVkBpqeyuJmESwM7LCp5eZmyQHTOXe/WSUnRZBL69AMKqP0L0haDWydz40p1Hweyf+maTw1og9mxzRn4TzHzTY4VIWzDWt4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:5a8096b9-d1f1-4abc-ba4a-6264336d5f52,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:9ca02986-088c-4756-8f76-577be701e693,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a4be16aaa6994d3fa8f325db2e4a92ea-20221113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2007806189; Sun, 13 Nov 2022 19:18:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 14 Nov 2022 10:17:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 14 Nov 2022 10:17:48 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: fix uninitialized irq_mask
Date: Mon, 14 Nov 2022 10:17:47 +0800
Message-ID: <230b8d9575f905bc168155de5acd40dbd37d901e.1668391668.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_181829_216460_B97D4419 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

It should use dev->mt76.mmio.irqmask instead.

Fixes: 337acff38223 ("wifi: mt76: mt7915: enable full system reset support")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
@Felix, could you please help to fold this patch?
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index e7b1618cd3a6..117ddb00348c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1354,7 +1354,6 @@ mt7915_mac_restart(struct mt7915_dev *dev)
 	struct mt76_phy *ext_phy;
 	struct mt76_dev *mdev = &dev->mt76;
 	int i, ret;
-	u32 irq_mask;
 
 	ext_phy = dev->mt76.phys[MT_BAND1];
 	phy2 = ext_phy ? ext_phy->priv : NULL;
@@ -1412,7 +1411,7 @@ mt7915_mac_restart(struct mt7915_dev *dev)
 	mt76_wr(dev, MT_INT_SOURCE_CSR, ~0);
 
 	if (dev->hif2) {
-		mt76_wr(dev, MT_INT1_MASK_CSR, irq_mask);
+		mt76_wr(dev, MT_INT1_MASK_CSR, dev->mt76.mmio.irqmask);
 		mt76_wr(dev, MT_INT1_SOURCE_CSR, ~0);
 	}
 	if (dev_is_pci(mdev->dev)) {
-- 
2.36.1


