Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B41CCFA1B
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 06:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1pyXI3y8UlM2LlJDo1kbV6NWLkhSbpGDadWWV7iSiA=; b=XItnjc+Ji9JkXzL28BRxcF7CiZ
	+0aHDPWgWzZpWWJWloehaFnMIsDh611EJb4zRLEoHNViZKDFVMAEUTmHBqp17HX2wvExqHV3fBx7T
	xevDa/wVToO1mVHuw+qSfA7Tm/LoK9RPmYOX76M28yPnGwRrOhKETQQ7sZFYOy2dcMhkr9BCNPtO0
	re22ESrU2Gsz6bwOfbJw9d74dvCq6nu5ECz/UWUGoY2sruRakHCW1PLNYdgAQ8OveSgw4sgIuZTrm
	efa7a7AqLpwC3ocQYqRTCY+B9wYAU1bN6fflxH+t/sRvQOf3fanacU7/qVMhNnZ6trh2xgt4WFakJ
	InvwN5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtiD-0000000ExYk-2yaA;
	Thu, 06 Nov 2025 06:43:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtiA-0000000ExTD-0fSO
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 06:43:11 +0000
X-UUID: d8da3714badb11f0a52f393f94899d25-20251105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=J1pyXI3y8UlM2LlJDo1kbV6NWLkhSbpGDadWWV7iSiA=;
	b=G/gxU3Ic1BidYtzg7UeGz6ZxJaOHhsB7PoMiB0ZcTaKCgt6cS9+VCjGUnsP+n2gBOgGTuJl2WnI+o5hgxHMcP8qhovsM/JAY4rTxuMmPtdbwe1YqG/eSGfI4FphesUBr+g8ReM2IQOVFFLqViIennXcUtWx5+etM84xWhXYwy+8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:fd6a62c6-102a-46b9-9982-296fd260a7e0,IP:0,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-20
X-CID-META: VersionHash:a9d874c,CLOUDID:63abf87c-f9d7-466d-a1f7-15b5fcad2ce6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:1|19,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d8da3714badb11f0a52f393f94899d25-20251105
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 933883307; Wed, 05 Nov 2025 23:43:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 6 Nov 2025 14:43:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 6 Nov 2025 14:43:01 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	Rex Lu <rex.lu@mediatek.com>
Subject: [PATCH mt76 v2 12/12] wifi: mt76: mt7996: fix EMI rings for RRO
Date: Thu, 6 Nov 2025 14:42:03 +0800
Message-ID: <20251106064203.1000505-12-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251106064203.1000505-1-shayne.chen@mediatek.com>
References: <20251106064203.1000505-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_224310_229127_1E6A2593 
X-CRM114-Status: GOOD (  12.90  )
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

The RRO EMI rings only need to be allocated when WED is not active.
This patch fixes command timeout issue for the setting of WED off and
RRO on.

Fixes: 3a29164425e9 ("wifi: mt76: mt7996: Add SW path for HW-RRO v3.1")
Co-developed-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 15 +++++++++------
 .../net/wireless/mediatek/mt76/mt7996/init.c  | 19 ++++++++++++++++---
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index 7ac4defca29d..274b273df1ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -515,12 +515,15 @@ int mt7996_dma_rro_init(struct mt7996_dev *dev)
 		if (ret)
 			return ret;
 
-		/* We need to set cpu idx pointer before resetting the EMI
-		 * queues.
-		 */
-		mdev->q_rx[MT_RXQ_RRO_RXDMAD_C].emi_cpu_idx =
-			&dev->wed_rro.emi_rings_cpu.ptr->ring[0].idx;
-		mt76_queue_reset(dev, &mdev->q_rx[MT_RXQ_RRO_RXDMAD_C], true);
+		if (!mtk_wed_device_active(&mdev->mmio.wed)) {
+			/* We need to set cpu idx pointer before resetting the
+			 * EMI queues.
+			 */
+			mdev->q_rx[MT_RXQ_RRO_RXDMAD_C].emi_cpu_idx =
+				&dev->wed_rro.emi_rings_cpu.ptr->ring[0].idx;
+			mt76_queue_reset(dev, &mdev->q_rx[MT_RXQ_RRO_RXDMAD_C],
+					 true);
+		}
 		goto start_hw_rro;
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index bd7b720c64c5..00a8286bd136 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -960,9 +960,10 @@ static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 		       MT7996_RRO_MSDU_PG_SIZE_PER_CR);
 	}
 
-	if (dev->mt76.hwrro_mode == MT76_HWRRO_V3_1) {
+	if (!mtk_wed_device_active(&dev->mt76.mmio.wed) &&
+	    dev->mt76.hwrro_mode == MT76_HWRRO_V3_1) {
 		ptr = dmam_alloc_coherent(dev->mt76.dma_dev,
-					  sizeof(dev->wed_rro.emi_rings_cpu.ptr),
+					  sizeof(*dev->wed_rro.emi_rings_cpu.ptr),
 					  &dev->wed_rro.emi_rings_cpu.phy_addr,
 					  GFP_KERNEL);
 		if (!ptr)
@@ -971,7 +972,7 @@ static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 		dev->wed_rro.emi_rings_cpu.ptr = ptr;
 
 		ptr = dmam_alloc_coherent(dev->mt76.dma_dev,
-					  sizeof(dev->wed_rro.emi_rings_dma.ptr),
+					  sizeof(*dev->wed_rro.emi_rings_dma.ptr),
 					  &dev->wed_rro.emi_rings_dma.phy_addr,
 					  GFP_KERNEL);
 		if (!ptr)
@@ -1037,6 +1038,18 @@ static void mt7996_wed_rro_free(struct mt7996_dev *dev)
 				   dev->wed_rro.msdu_pg[i].phy_addr);
 	}
 
+	if (dev->wed_rro.emi_rings_cpu.ptr)
+		dmam_free_coherent(dev->mt76.dma_dev,
+				   sizeof(*dev->wed_rro.emi_rings_cpu.ptr),
+				   dev->wed_rro.emi_rings_cpu.ptr,
+				   dev->wed_rro.emi_rings_cpu.phy_addr);
+
+	if (dev->wed_rro.emi_rings_dma.ptr)
+		dmam_free_coherent(dev->mt76.dma_dev,
+				   sizeof(*dev->wed_rro.emi_rings_dma.ptr),
+				   dev->wed_rro.emi_rings_dma.ptr,
+				   dev->wed_rro.emi_rings_dma.phy_addr);
+
 	if (!dev->wed_rro.session.ptr)
 		return;
 
-- 
2.51.0


