Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC4CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B19ImLJwTyajh7B8RLGQgAHEq3brpxa/QL2Jv9n6RFA=; b=f0ybNKHpm6T36TH+IhJ+BH+Wz7
	88eKyylNzU8uc7EZhf+ONVK7ERn21rWoo36WAu7Q81m4ex9X7XVgg35l4Vb7BkexaIIGdCgbMWfXm
	uS+u7M/gI7RXH8xWn+syb8IxdR2GUnENTRDrMKCmIAjq9knDPLh3VQJdcACcNtaDTrUV9CyNDZAQA
	pxh4TalKKPRkOoUhHEmhgtKCy/ByUrwK38hC0Ctt/Q67oqTB4GntQZW3bSNsw5Dsh6X8/JTinwb+z
	mjo0or/WaRnjzjZigo0MHyQYWTh5t16kP9In82KdADzLSe+HTAwqfXmAY1DSRDZIK6eO+YdeCjTZh
	m9FiB5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1VqM-00FOxi-BC; Wed, 15 Jun 2022 16:26:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Vju-00FMkg-5y; Wed, 15 Jun 2022 16:19:31 +0000
X-UUID: e40ed083943d4dac8899171b4080c255-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:01a72f97-c31e-468b-9951-c520f0e14e0f,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:9a5a5bf6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e40ed083943d4dac8899171b4080c255-20220615
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2078972466; Wed, 15 Jun 2022 09:19:26 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 09:19:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 00:19:23 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 16 Jun 2022 00:19:22 +0800
From: <yf.wang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:MEDIATEK IOMMU DRIVER" <iommu@lists.linux-foundation.org>, "moderated
 list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "open
 list" <linux-kernel@vger.kernel.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
	<Yong.Wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Yunfei Wang
	<yf.wang@mediatek.com>, Ning Li <ning.li@mediatek.com>
Subject: [PATCH v9 2/3] iommu/mediatek: Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR
Date: Thu, 16 Jun 2022 00:12:22 +0800
Message-ID: <20220615161224.6923-3-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220615161224.6923-1-yf.wang@mediatek.com>
References: <20220615161224.6923-1-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_091930_324874_7A00F4D6 
X-CRM114-Status: GOOD (  10.80  )
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

From: Yunfei Wang <yf.wang@mediatek.com>

Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR, and update MTK_IOMMU_ADDR
definition for better generality.

Signed-off-by: Ning Li <ning.li@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bb9dd92c9898..3d62399e8865 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -265,8 +265,8 @@ static const struct iommu_ops mtk_iommu_ops;
 
 static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int bankid);
 
-#define MTK_IOMMU_TLB_ADDR(iova) ({					\
-	dma_addr_t _addr = iova;					\
+#define MTK_IOMMU_ADDR(addr) ({						\
+	unsigned long long _addr = addr;				\
 	((lower_32_bits(_addr) & GENMASK(31, 12)) | upper_32_bits(_addr));\
 })
 
@@ -381,8 +381,8 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 			       base + data->plat_data->inv_sel_reg);
 
-		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova), base + REG_MMU_INVLD_START_A);
-		writel_relaxed(MTK_IOMMU_TLB_ADDR(iova + size - 1),
+		writel_relaxed(MTK_IOMMU_ADDR(iova), base + REG_MMU_INVLD_START_A);
+		writel_relaxed(MTK_IOMMU_ADDR(iova + size - 1),
 			       base + REG_MMU_INVLD_END_A);
 		writel_relaxed(F_MMU_INV_RANGE, base + REG_MMU_INVALIDATE);
 
-- 
2.18.0


