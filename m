Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55719CD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NiCyq+CPffdcVtL25hX44LNm9f/t32AI0R+VbdCf4do=; b=t09Qm9qxRfqlW6Lit7fIHldaj0
	IBxSSyS7TAz02TqYRjda9g2W+CahygPX+y/JLHr1z3syC7P3BU8o0svr1ag1ZLIFBNJz7c4T0lnJF
	zLiBlya5MFEQ6i9DYiPFF2b+DjW1v/yFULCes8vraebLYNS1oOAFxvVJ4kGb5grgL1Kx5PSD8SXRX
	WGlMx6J61/HMJfXeE1IQeCjb5pgTLXhSU5aZ5LJIuZKvlvEIdH6ylZcn7/h+8dFmQ3W4ytO2fGbjh
	auD056OL/njg8Kb1KMQ94KCuhLZzc5L+J6e6Blj6KNZDnnyx+Ab7EOgS5bMkcqeJHJLpzKuYZkbJB
	jwAQ/LAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfE-0000000AUwe-3ohI;
	Fri, 12 Jun 2026 07:50:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfC-0000000AUvT-2c5C
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:50:51 +0000
X-UUID: 6b70885a663311f1acbe4559397dec65-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NiCyq+CPffdcVtL25hX44LNm9f/t32AI0R+VbdCf4do=;
	b=r8+N7NwxdYSbvj8FqQno8IWKzA/1qRahLk8lma6ajsTssX20czq8EWtrzei1RC5OIOaLRCQxC+0x7J/IlrN8UCK1hLV+B4x/IEHP6oewXtwK1xWSxisxjBnXenfhZGIImH9daaxp4JLomPZR6NMfudJ0TycUocUTyhAjSqRfXeI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:b304b432-25b4-424d-9bb0-bc9c45dd0315,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:2d46fda4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6b70885a663311f1acbe4559397dec65-20260612
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 61080044; Fri, 12 Jun 2026 00:50:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:50:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:50:43 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 01/20] wifi: mt76: mt792x: consolidate rx interrupt masks into all_complete_mask
Date: Fri, 12 Jun 2026 15:50:38 +0800
Message-ID: <20260612075042.2577193-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005050_679036_C57DBCC7 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Emery Hsin <emery.hsin@mediatek.com>

Add all_complete_mask to irq_map rx sub-struct and use it in
mt792x_irq_tasklet() and mt792x_dma_enable() to replace individual
per-ring mask OR expressions.

This is a preparation patch before enabling MT7928 PCIe support.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h     | 1 +
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c | 8 ++------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 70073b43af54..83c729f8bb76 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -200,6 +200,7 @@ struct mt792x_irq_map {
 		u32 mcu_complete_mask;
 	} tx;
 	struct {
+		u32 all_complete_mask;
 		u32 data_complete_mask;
 		u32 wm_complete_mask;
 		u32 wm2_complete_mask;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index fc326447c792..946ff6d58954 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -39,9 +39,7 @@ void mt792x_irq_tasklet(unsigned long data)
 
 	trace_dev_irq(&dev->mt76, intr, dev->mt76.mmio.irqmask);
 
-	mask |= intr & (irq_map->rx.data_complete_mask |
-			irq_map->rx.wm_complete_mask |
-			irq_map->rx.wm2_complete_mask);
+	mask |= intr & irq_map->rx.all_complete_mask;
 	if (intr & dev->irq_map->tx.mcu_complete_mask)
 		mask |= dev->irq_map->tx.mcu_complete_mask;
 
@@ -276,9 +274,7 @@ int mt792x_dma_enable(struct mt792x_dev *dev)
 	/* enable interrupts for TX/RX rings */
 	mt76_connac_irq_enable(&dev->mt76,
 			       dev->irq_map->tx.all_complete_mask |
-			       dev->irq_map->rx.data_complete_mask |
-			       dev->irq_map->rx.wm2_complete_mask |
-			       dev->irq_map->rx.wm_complete_mask |
+			       dev->irq_map->rx.all_complete_mask |
 			       MT_INT_MCU_CMD);
 	mt76_set(dev, MT_MCU2HOST_SW_INT_ENA, MT_MCU_CMD_WAKE_RX_PCIE);
 
-- 
2.45.2


