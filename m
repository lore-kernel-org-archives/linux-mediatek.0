Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3B9C47073
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Dec 2023 04:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4y2M/bxn/FUb1H1/6pqnuKBUyHHVpd9Ga7hLziROJI=; b=iqg4zETHUEL7zLbkw7OBqS9XiS
	ApwxfOKXnJJyEsn++ELCFhVQpKIYYtFj8hD2vYvSa1bCD1aDk0mX5PZylGSlaBOtIO38v49ZQQC6D
	OREoXUZBGckYJiMF1Ewk+6QSmb2Ui16W6LBmOfaD6dLl/uJIKTzdOI3eniDpU001ulGdZO4JHsG97
	yS5b5o4bjG2dwmMZeyWrxC1iJtuhKc/olGUxIXWo2pbjLTU/ETrlLJqV5nt7OTSWckznvWBC6qJ+E
	PsW4rL7PVfw4Y+0MquQQm5Vt6hO8HlHnqsilW7sL/M7Lo5cORN/81+SxowHNKG9hMGvpDAfJ+NyQS
	x0psV7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtBc-007JXD-38;
	Sat, 23 Dec 2023 04:00:28 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtBZ-007JW8-2H
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Dec 2023 04:00:27 +0000
X-UUID: c707227ca14711ee958cff29c719f35b-20231222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=T4y2M/bxn/FUb1H1/6pqnuKBUyHHVpd9Ga7hLziROJI=;
	b=lGByIyXsfZjyhHA+NddFov4NJvk1gMAOJRcYwv+DJAJ6jWLi86AHM7vhShpgFFCt/y4oS5JZMx2lZ38JRJTVKVUUqW+DgQxD2oJoKiyWWYW0J1MsWYTMKLnQg9wm0fkXCf/pavK6S5TXlP9If2ZhOdlJDKq6qwcKPl4ePgaPeO8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ba52720e-3966-44eb-bc1f-83da45c60695,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:cd59662e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c707227ca14711ee958cff29c719f35b-20231222
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1713099140; Fri, 22 Dec 2023 21:00:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 23 Dec 2023 12:00:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 23 Dec 2023 12:00:12 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt792xu: enable dmashdl support
Date: Sat, 23 Dec 2023 11:43:08 +0800
Message-ID: <28d84bfc81e90be921c28fbda7e79e33b2b515d0.1703301666.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <3eb3a860ccdf465b77ae63d6ddcf6a584d1729ce.1703301666.git.deren.wu@mediatek.com>
References: <3eb3a860ccdf465b77ae63d6ddcf6a584d1729ce.1703301666.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_200025_748684_F892DD38 
X-CRM114-Status: GOOD (  10.57  )
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

dmashdl(DMA scheduler) was disable and may cause packets corruption
without propoer resource handling. Enable this to control resources
between usb-bus/pse/hardware-ac-queue.

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 74 +++++++++----------
 1 file changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 2dd283caed36..fbf49da16b92 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -121,44 +121,25 @@ static void mt792xu_uhw_wr(struct mt76_dev *dev, u32 addr, u32 val)
 
 static void mt792xu_dma_prefetch(struct mt792x_dev *dev)
 {
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(0),
-		 MT_WPDMA0_MAX_CNT_MASK, 4);
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(0),
-		 MT_WPDMA0_BASE_PTR_MASK, 0x80);
-
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(1),
-		 MT_WPDMA0_MAX_CNT_MASK, 4);
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(1),
-		 MT_WPDMA0_BASE_PTR_MASK, 0xc0);
-
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(2),
-		 MT_WPDMA0_MAX_CNT_MASK, 4);
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(2),
-		 MT_WPDMA0_BASE_PTR_MASK, 0x100);
-
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(3),
-		 MT_WPDMA0_MAX_CNT_MASK, 4);
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(3),
-		 MT_WPDMA0_BASE_PTR_MASK, 0x140);
-
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(4),
-		 MT_WPDMA0_MAX_CNT_MASK, 4);
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(4),
-		 MT_WPDMA0_BASE_PTR_MASK, 0x180);
-
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(16),
-		 MT_WPDMA0_MAX_CNT_MASK, 4);
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(16),
-		 MT_WPDMA0_BASE_PTR_MASK, 0x280);
-
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(17),
-		 MT_WPDMA0_MAX_CNT_MASK, 4);
-	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL(17),
-		 MT_WPDMA0_BASE_PTR_MASK,  0x2c0);
+#define DMA_PREFETCH_CONF(_idx_, _cnt_, _base_) \
+	mt76_rmw(dev, MT_UWFDMA0_TX_RING_EXT_CTRL((_idx_)), \
+		 MT_WPDMA0_MAX_CNT_MASK | MT_WPDMA0_BASE_PTR_MASK, \
+		 FIELD_PREP(MT_WPDMA0_MAX_CNT_MASK, (_cnt_)) | \
+		 FIELD_PREP(MT_WPDMA0_BASE_PTR_MASK, (_base_)))
+
+	DMA_PREFETCH_CONF(0, 4, 0x080);
+	DMA_PREFETCH_CONF(1, 4, 0x0c0);
+	DMA_PREFETCH_CONF(2, 4, 0x100);
+	DMA_PREFETCH_CONF(3, 4, 0x140);
+	DMA_PREFETCH_CONF(4, 4, 0x180);
+	DMA_PREFETCH_CONF(16, 4, 0x280);
+	DMA_PREFETCH_CONF(17, 4, 0x2c0);
 }
 
 static void mt792xu_wfdma_init(struct mt792x_dev *dev)
 {
+	int i;
+
 	mt792xu_dma_prefetch(dev);
 
 	mt76_clear(dev, MT_UWFDMA0_GLO_CFG, MT_WFDMA0_GLO_CFG_OMIT_RX_INFO);
@@ -169,10 +150,27 @@ static void mt792xu_wfdma_init(struct mt792x_dev *dev)
 		 MT_WFDMA0_GLO_CFG_TX_DMA_EN |
 		 MT_WFDMA0_GLO_CFG_RX_DMA_EN);
 
-	/* disable dmashdl */
-	mt76_clear(dev, MT_UWFDMA0_GLO_CFG_EXT0,
-		   MT_WFDMA0_CSR_TX_DMASHDL_ENABLE);
-	mt76_set(dev, MT_DMASHDL_SW_CONTROL, MT_DMASHDL_DMASHDL_BYPASS);
+	mt76_rmw(dev, MT_DMASHDL_REFILL, MT_DMASHDL_REFILL_MASK, 0xffe00000);
+	mt76_clear(dev, MT_DMASHDL_PAGE, MT_DMASHDL_GROUP_SEQ_ORDER);
+	mt76_rmw(dev, MT_DMASHDL_PKT_MAX_SIZE,
+		 MT_DMASHDL_PKT_MAX_SIZE_PLE | MT_DMASHDL_PKT_MAX_SIZE_PSE,
+		 FIELD_PREP(MT_DMASHDL_PKT_MAX_SIZE_PLE, 1) |
+		 FIELD_PREP(MT_DMASHDL_PKT_MAX_SIZE_PSE, 0));
+	for (i = 0; i < 5; i++)
+		mt76_wr(dev, MT_DMASHDL_GROUP_QUOTA(i),
+			FIELD_PREP(MT_DMASHDL_GROUP_QUOTA_MIN, 0x3) |
+			FIELD_PREP(MT_DMASHDL_GROUP_QUOTA_MAX, 0xfff));
+	for (i = 5; i < 16; i++)
+		mt76_wr(dev, MT_DMASHDL_GROUP_QUOTA(i),
+			FIELD_PREP(MT_DMASHDL_GROUP_QUOTA_MIN, 0x0) |
+			FIELD_PREP(MT_DMASHDL_GROUP_QUOTA_MAX, 0x0));
+	mt76_wr(dev, MT_DMASHDL_Q_MAP(0), 0x32013201);
+	mt76_wr(dev, MT_DMASHDL_Q_MAP(1), 0x32013201);
+	mt76_wr(dev, MT_DMASHDL_Q_MAP(2), 0x55555444);
+	mt76_wr(dev, MT_DMASHDL_Q_MAP(3), 0x55555444);
+
+	mt76_wr(dev, MT_DMASHDL_SCHED_SET(0), 0x76540132);
+	mt76_wr(dev, MT_DMASHDL_SCHED_SET(1), 0xFEDCBA98);
 
 	mt76_set(dev, MT_WFDMA_DUMMY_CR, MT_WFDMA_NEED_REINIT);
 }
-- 
2.18.0


