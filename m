Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A0C44507
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EnLepiGJu5ynM7pzYiD8KQTaUm1oFDIVTsdGhvGkps=; b=3vK5P9QaXwuqG7v1WliG0atp6/
	WbOrQFThQBwvePhiuX4qDRM84fZTGHQgt+XBXrGHgdTir+G1uxl+VtxjnULhwQsXP9IrIHXcdyT8+
	JP6njWLQCsUNS+zhjUX2EKtVAK1/3LPZqJ/acO/yhcPPA+NTfb61cY/+1tgKL4C0MtVBirBu8Uv+W
	8RYAouX9yts1MUYxUSRPxu9aeohGU8PEYg0WP2PknJ6jBerY497U71Y1gOSWtOV5ietMvRgntMdi5
	JwqeJHD5qoC5FE+GmlsPAtrBaom1pwm2gtJiY0LiOJUPfY3ZyRnZyOJExsi/qzqd0G+v3s5tA9/2r
	Bk07AXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjcR-00000001Mjw-1MVG;
	Thu, 09 Jul 2026 07:56:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjcN-00000001Mhh-1EK9
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 07:56:25 +0000
X-UUID: a98ca78e7b6b11f1afed4741b24580c9-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5EnLepiGJu5ynM7pzYiD8KQTaUm1oFDIVTsdGhvGkps=;
	b=nOfQGh/Z9MeqQp6lZwP7m5byacn21h13okEVaETjRiOtaCcPxsDCoQgXjAE1b5ST0FQ6Dg6t1Sz0MoPe59GqSNyVmg9hYRQ8jYe/WWA6cXGxuO+S5K2TxHRY+N85+ywhmKr/ZzTQV/E7RxXiru06qQhTtypIDjZykI8q8ShJEt0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:96db9698-5b74-45d8-8b25-63730f77fce8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d497b38,CLOUDID:87dea303-430e-43d5-9a6c-19a994ddbd60,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a98ca78e7b6b11f1afed4741b24580c9-20260709
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1214608962; Thu, 09 Jul 2026 00:56:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 15:56:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 15:56:13 +0800
From: Eason Lai <eason.lai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Yf.Luo@mediatek.com>, <kun.wu@mediatek.com>, <deren.wu@mediatek.com>,
	<sean.wang@mediatek.com>, <quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>,
	<leon.yen@mediatek.com>, <litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.lai@mediatek.com>, Eason Lai <Eason.Lai@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt792x: Restrict TX page pool to MT8196 platform
Date: Thu, 9 Jul 2026 15:55:58 +0800
Message-ID: <20260709075558.1654164-4-eason.lai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260709075558.1654164-1-eason.lai@mediatek.com>
References: <20260709075558.1654164-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_005623_340735_79180EB9 
X-CRM114-Status: GOOD (  11.58  )
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

From: Eason Lai <Eason.Lai@mediatek.com>

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

Signed-off-by: Eason Lai <Eason.Lai@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
index b341f1cb3ce0..6d5725a5b10f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_dma.c
@@ -307,6 +307,7 @@ int mt792x_dma_tx_page_pool_init(struct mt792x_dev *dev)
 {
 	struct mt76_dev *mdev = &dev->mt76;
 	int i, ret, pool_count = 0;
+	bool is_mt8196;
 
 	if (!iommu_get_domain_for_dev(mdev->dma_dev))
 		return 0;
@@ -314,6 +315,13 @@ int mt792x_dma_tx_page_pool_init(struct mt792x_dev *dev)
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


