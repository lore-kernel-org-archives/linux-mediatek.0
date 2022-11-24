Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221CEC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 04:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u5+pFYua6/l1kuQGRysiQMlUlfivreEacbkKmrw9oA4=; b=lugUUFMfBOkKmD2oMv71JDRWiI
	ZQimjM4Mqgjy6RZHpSx4c97KPPhhZqYqPh/4x1tQq+behoz/wvGgbRMsKXUbW7qzwyo8hPmAJdAyi
	nR6BYkDLJyCFH7lNwyTbWRkWCKGCy+zfxyOblcO8K8GKqklO6Kvv67DPLtRc3BkMuCTaktoEtPv5Q
	vU0Ihdw6GZypwalqnYdoxwu9mgWWtIL7WBULSmBjYvZYJGApbn1nHagCVPtvSpLNv0a3ReYcFE78b
	OhxVBc06sZhE0ni7CamGVWYVE+9urfDgqZG5eoO6VFbxboEVoxr0T6DNNwb7smcp5PEn+B9q7ma06
	btwCvHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy3sY-004kt1-PN; Thu, 24 Nov 2022 04:30:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy3sV-004kq0-Qa
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 04:30:25 +0000
X-UUID: c7873fd6e33e46dc97868b460c7f91fc-20221123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=u5+pFYua6/l1kuQGRysiQMlUlfivreEacbkKmrw9oA4=;
	b=lL37L19ishtpHa1/javh0ehkX4mte53sVDScT12cq5UzUP8WALtEmGtuJdgo3Id/QyyHO/4/mdGj6Hj1vQArbIHsUzYC8Wa0poaBmZ1BAPDqF4mTvBnSaZUNsQloiz09KR3tsjA8/rewWx21piTRBdifs3sVEmvJec7NjdzyrbE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:73f7afb6-a3dd-4b6c-a72c-919647267851,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:325cad2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c7873fd6e33e46dc97868b460c7f91fc-20221123
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sujuan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1352056563; Wed, 23 Nov 2022 21:08:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 24 Nov 2022 11:18:17 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 24 Nov 2022 11:18:16 +0800
From: Sujuan Chen <sujuan.chen@mediatek.com>
To: <netdev@vger.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, <linux-kernel@vger.kernel.org>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Sujuan Chen
	<sujuan.chen@mediatek.com>
Subject: [PATCH,v2] net: ethernet: mtk_wed: add wcid overwritten support for wed v1
Date: Thu, 24 Nov 2022 11:18:14 +0800
Message-ID: <36d6cf34361ba648ad307affb0371d94663c108d.1669259807.git.sujuan.chen@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_203023_896712_1DD445D7 
X-CRM114-Status: GOOD (  12.76  )
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

All wed versions should enable the wcid overwritten feature,
since the wcid size is controlled by the wlan driver.

Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
---
v2: get rid of the unnecessary if condition
---
 drivers/net/ethernet/mediatek/mtk_wed.c      | 13 ++++++++-----
 drivers/net/ethernet/mediatek/mtk_wed_regs.h |  2 ++
 include/linux/soc/mediatek/mtk_wed.h         |  3 +++
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 7d8842378c2b..16d7af88bbac 100644
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
@@ -1358,11 +1359,13 @@ mtk_wed_attach(struct mtk_wed_device *dev)
 	}
 
 	mtk_wed_hw_init_early(dev);
-	if (hw->version == 1)
+	if (hw->version == 1) {
 		regmap_update_bits(hw->hifsys, HIFSYS_DMA_AG_MAP,
 				   BIT(hw->index), 0);
-	else
+	} else {
+		dev->rev_id = wed_r32(dev, MTK_WED_REV_ID);
 		ret = mtk_wed_wo_init(hw);
+	}
 out:
 	if (ret)
 		mtk_wed_detach(dev);
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


