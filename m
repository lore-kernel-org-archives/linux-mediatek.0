Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C27C53219
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 02:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DcD0sSPnp2SiyVg9MsYURsrC7AZd441q9aFWnz0NNY=; b=ke5uLK4kccwAolfiU1LzkT4RKk
	K6S1Nh6daGvjxDt71xlwnPrTX2rkBcBMlDQm6Ld9pH1HqUxH89Y3upCN73xXJqNAte/az2T1rENH+
	tNfNKCZWYWIz9+3W08yFzxx+8/iGDdfFcnbPLA/7zAXZ35b+aKn6MHRqrnEDgvv5yVjAPmerYuaj5
	MtnlPPImj4JZkWaYNUdxq6t2/wFvhQdQ7mkxhsJXcIG5VN0rzRXn+JB/hdCW3aYCrfR2gvmXdxR34
	PDI1QXiOUwLEf+HhQNDGp+Xqqw/z5VvBjuJnK4/Hys/Tx1vmjA6m0qia5bAyf2qZlaknsRBVTSP7o
	Bkf3n5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wou8M-00000006i9y-1G7y;
	Wed, 29 Jul 2026 02:35:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wou8H-00000006i35-2Upd
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 02:34:58 +0000
X-UUID: 0bdb0d388af611f1acbe4559397dec65-20260728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9DcD0sSPnp2SiyVg9MsYURsrC7AZd441q9aFWnz0NNY=;
	b=dIhUUKPS7DG/tvCo/0OR0hKr8AFdgbrqfdNh4c9EmdBGjYyhwHYPX1IhnH2naIgxm5otW41eYVmx23hbwhy+J+/dns68v5/20f090ECIpjh0ZNCrkZzE1juwwGvZcB5KQj3b4A7wEVqB+nRcDK3eDT1udXhAOClBaUahXWpDHj8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:dc798b54-6241-4bf8-913c-6601341296bd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:8a735a6,CLOUDID:011c8fa9-cb7c-4e20-9880-6cc7cfd6c326,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0bdb0d388af611f1acbe4559397dec65-20260728
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 970160870; Tue, 28 Jul 2026 19:34:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 29 Jul 2026 10:34:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 29 Jul 2026 10:34:36 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, <eason.lai@mediatek.com>
Subject: [PATCH v2 3/3] wifi: mt76: mt792x: Restrict TX page pool to MT8196  platform
Date: Wed, 29 Jul 2026 10:34:34 +0800
Message-ID: <20260729023434.1105517-4-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260729023434.1105517-1-eason.lai@mediatek.com>
References: <20260709075558.1654164-1-eason.lai@mediatek.com>
 <20260729023434.1105517-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_193457_649775_56A55498 
X-CRM114-Status: GOOD (  12.53  )
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

The TX page pool optimization significantly improves performance on
MT8196 when IOMMU is enabled, but this benefit is platform-specific.
Restrict this feature to MT8196 where it has been tested and validated.

On MT8196 with IOMMU enabled, DMA mapping overhead increases
dramatically compared to IOMMU-disabled configurations:

dma_unmap_single() in mt76_connac_txp_skb_unmap_hw() (NAPI context):
- IOMMU disabled: 181.25 ns (avg over 20,000 calls)
- IOMMU enabled:  5216.19 ns (avg over 21,000 calls)

dma_map_single() in mt76_dma_tx_queue_skb() (workqueue context):
- IOMMU disabled: 880.20 ns (avg over 20,000 calls)
- IOMMU enabled:  2106.65 ns (avg over 20,000 calls)

The TX page pool mitigates this overhead by reusing DMA mappings,
but should only be enabled on platforms where it has been verified
to work correctly.

Signed-off-by: Eason Lai <eason.lai@mediatek.com>
--
v2: no change
---
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index 9f052c56d1b2..833298b5d497 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -478,6 +478,7 @@ int mt792x_dma_tx_page_pool_init(struct mt792x_dev *dev)
 {
 	struct mt76_dev *mdev = &dev->mt76;
 	int i, ret, pool_count = 0;
+	bool is_mt8196;
 
 	if (!iommu_get_domain_for_dev(mdev->dma_dev))
 		return 0;
@@ -485,6 +486,13 @@ int mt792x_dma_tx_page_pool_init(struct mt792x_dev *dev)
 	if (!mt76_is_mmio(mdev))
 		return 0;
 
+	is_mt8196 = of_machine_is_compatible("mediatek,mt8196");
+	if (!is_mt8196) {
+		dev_info(mdev->dev, "Not MT8196 platform, TX page pool optimization disabled\n");
+		return 0;
+	}
+
+	dev_info(mdev->dev, "MT8196 platform detected, enabling TX page pool optimization\n");
 	mdev->tx_prealloc_enabled = true;
 
 	for (i = 0; i < ARRAY_SIZE(mdev->phy.q_tx); i++) {
-- 
2.45.2


