Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38457C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 02:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VDymyQAetc3WEtO27z94FAZO4pTlwjOlBCBrAhSOXn4=; b=faDjxQyxMHY9ZNWafShEcq/VLp
	6h0GoEbmmR5ZtvQXM45aL3EIW1z6ZIoVvDH2pz4INXuJYG7E95oBlmsE1cKm39zL4Ry+zWY1/2864
	r5x40rH0jbFPgqB6me8d1jCeubUrwd6uG68uZvk3KDrLBGYtIIWE6ags8nHyBS1LVAvqnRNKO2y+F
	2Y/+SOHn0ZXRA5Jtvf1hCa3In2acR5p10Qx3s0X24KfS9n8+6HF96WxQIUjkl5l0XzrjApKUB4JGY
	A7xAaKm5GFldAEcpYb6d2KjMzMn3XBC3T93ZShQXxuNES2QckTrHzip5XasIB9s8/Upaao/0EDnGc
	xHrMPcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxJ9G-002VX5-Ri; Tue, 22 Nov 2022 02:36:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxJ9D-002VVK-TR
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 02:36:33 +0000
X-UUID: 585c18f426c24da0b0961a7547034f45-20221121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VDymyQAetc3WEtO27z94FAZO4pTlwjOlBCBrAhSOXn4=;
	b=NEcBQQVaHh/gqjO9PGuVjtNL/5Gwlfbfv/P+3CF5uuwh3xiqtej0/Zd0N/IcoRAT39vJJn3t+v/wB+vJavJEN/dOEc/NUmuBJiKaDRV2FtNtkamFNFlc7+nGu31tSCG5YUhisM+T2/GZASQsATXGO6g0yKkE4mvXjCNDZGaF2OE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:c1da231c-e38e-42db-b794-02f816000be7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:bd00ebf8-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 585c18f426c24da0b0961a7547034f45-20221121
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sujuan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 993739977; Mon, 21 Nov 2022 19:18:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 10:17:33 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 10:17:31 +0800
From: Sujuan Chen <sujuan.chen@mediatek.com>
To: <netdev@vger.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, <linux-kernel@vger.kernel.org>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Sujuan Chen
	<sujuan.chen@mediatek.com>
Subject: [PATCH,RESEND] net: ethernet: mtk_wed: add wcid overwritten support for wed v1
Date: Tue, 22 Nov 2022 10:17:29 +0800
Message-ID: <217932f091aa9d9cb5e876a2e958ca25f80f80b2.1668997816.git.sujuan.chen@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_183631_976742_BC5E67C9 
X-CRM114-Status: GOOD (  11.77  )
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
Message-ID: <20221122021729.BiH6jOLNoLaFYfWCbgvUDkHSgJCiyvyhmJgXtlap5D0@z>

All wed versions should enable wcid overwritten feature,
since the wcid size is controlled by the wlan driver.

Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c      | 9 ++++++---
 drivers/net/ethernet/mediatek/mtk_wed_regs.h | 2 ++
 include/linux/soc/mediatek/mtk_wed.h         | 3 +++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 7d8842378c2b..a20093803e04 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -526,9 +526,9 @@ mtk_wed_dma_disable(struct mtk_wed_device *dev)
 			MTK_WED_WPDMA_RX_D_RX_DRV_EN);
 		wed_clr(dev, MTK_WED_WDMA_GLO_CFG,
 			MTK_WED_WDMA_GLO_CFG_TX_DDONE_CHK);
-
-		mtk_wed_set_512_support(dev, false);
 	}
+
+	mtk_wed_set_512_support(dev, false);
 }
 
 static void
@@ -1290,9 +1290,10 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 		if (mtk_wed_rro_cfg(dev))
 			return;
 
-		mtk_wed_set_512_support(dev, dev->wlan.wcid_512);
 	}
 
+	mtk_wed_set_512_support(dev, dev->wlan.wcid_512);
+
 	mtk_wed_dma_enable(dev);
 	dev->running = true;
 }
@@ -1338,6 +1339,8 @@ mtk_wed_attach(struct mtk_wed_device *dev)
 	dev->irq = hw->irq;
 	dev->wdma_idx = hw->index;
 	dev->version = hw->version;
+	if (hw->version != 1)
+		dev->rev_id = wed_r32(dev, MTK_WED_REV_ID);
 
 	if (hw->eth->dma_dev == hw->eth->dev &&
 	    of_dma_is_coherent(hw->eth->dev->of_node))
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_regs.h b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
index 9e39dace95eb..873d50b9a6e6 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_regs.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
@@ -20,6 +20,8 @@ struct mtk_wdma_desc {
 	__le32 info;
 } __packed __aligned(4);
 
+#define MTK_WED_REV_ID					0x004
+
 #define MTK_WED_RESET					0x008
 #define MTK_WED_RESET_TX_BM				BIT(0)
 #define MTK_WED_RESET_TX_FREE_AGENT			BIT(4)
diff --git a/include/linux/soc/mediatek/mtk_wed.h b/include/linux/soc/mediatek/mtk_wed.h
index 8294978f4bca..1b1ef57609f7 100644
--- a/include/linux/soc/mediatek/mtk_wed.h
+++ b/include/linux/soc/mediatek/mtk_wed.h
@@ -85,6 +85,9 @@ struct mtk_wed_device {
 	int irq;
 	u8 version;
 
+	/* used by wlan driver */
+	u32 rev_id;
+
 	struct mtk_wed_ring tx_ring[MTK_WED_TX_QUEUES];
 	struct mtk_wed_ring rx_ring[MTK_WED_RX_QUEUES];
 	struct mtk_wed_ring txfree_ring;
-- 
2.18.0


