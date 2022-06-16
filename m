Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715FBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 12:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1OUAXf4ZM88bJe1RxhBUZ27jR5ev5vY37+EISbMEhs=; b=fmuC3ONGx8wKQP0Y90NKLguDqw
	sA/Nz0jEeuOlmGJHvShKGrtolDZwE2hKX4SLrC6v4LlW5AWnQbL4ZDlUsakxIYoxZqzZZhr0D+Job
	bozem/N0he/4w4Qb5tE7eXatEmCyI5Kt1LN1x2yufIFdBlco4+tFBBAe6K/DxRwse5Lss0WviMh7v
	EXSS3DssZ8k+EOuiFcT/KztZJz6o+GsX6QhyWRLw529jClw+MyaLBUkCJzOlafJySkcChLYa3gYM4
	LQ/iYfC3cLdwSpiZRtalgoHYJHzUOHBA8JewdpD9L99/9uk8ERlTA5jR3mhjN7n1KgfMpqOgrwH9Q
	tDubamqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oPD-002GmT-Gl; Thu, 16 Jun 2022 12:15:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oPA-002GkU-Fi; Thu, 16 Jun 2022 12:15:21 +0000
X-UUID: 3dc457716e3941aca8254a3fae4b34cf-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:0822fd14-b57b-4edf-9ec3-b94fc4afb911,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:a601c248-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3dc457716e3941aca8254a3fae4b34cf-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 604187202; Thu, 16 Jun 2022 05:15:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 05:14:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 20:14:43 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 20:14:41 +0800
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
Subject: [PATCH v10 2/2] iommu/mediatek: Allow page table PA up to 35bit
Date: Thu, 16 Jun 2022 20:07:12 +0800
Message-ID: <20220616120713.12728-3-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220616120713.12728-1-yf.wang@mediatek.com>
References: <20220616120713.12728-1-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_051520_561288_154DD803 
X-CRM114-Status: GOOD (  12.97  )
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

Single memory zone feature will remove ZONE_DMA32 and ZONE_DMA. So add
the quirk IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT to let level 1 and level 2
pgtable support at most 35bit PA.

Signed-off-by: Ning Li <ning.li@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bb9dd92c9898..372a15990a65 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -138,6 +138,7 @@
 /* PM and clock always on. e.g. infra iommu */
 #define PM_CLK_AO			BIT(15)
 #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
+#define PGTABLE_PA_35_EN		BIT(17)
 
 #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
 				((((pdata)->flags) & (mask)) == (_x))
@@ -240,6 +241,7 @@ struct mtk_iommu_data {
 struct mtk_iommu_domain {
 	struct io_pgtable_cfg		cfg;
 	struct io_pgtable_ops		*iop;
+	u32				ttbr;
 
 	struct mtk_iommu_bank_data	*bank;
 	struct iommu_domain		domain;
@@ -583,6 +585,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	if (m4u_dom) {
 		dom->iop = m4u_dom->iop;
 		dom->cfg = m4u_dom->cfg;
+		dom->ttbr = m4u_dom->ttbr;
 		dom->domain.pgsize_bitmap = m4u_dom->cfg.pgsize_bitmap;
 		goto update_iova_region;
 	}
@@ -596,6 +599,9 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 		.iommu_dev = data->dev,
 	};
 
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
+		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT;
+
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
 		dom->cfg.oas = data->enable_4GB ? 33 : 32;
 	else
@@ -606,6 +612,9 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 		dev_err(data->dev, "Failed to alloc io pgtable\n");
 		return -EINVAL;
 	}
+	dom->ttbr = dom->cfg.quirks & IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT ?
+		    dom->cfg.arm_v7s_cfg.ttbr :
+		    dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK;
 
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = dom->cfg.pgsize_bitmap;
@@ -684,8 +693,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 			goto err_unlock;
 		}
 		bank->m4u_dom = dom;
-		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
-		       bank->base + REG_MMU_PT_BASE_ADDR);
+		writel(bank->m4u_dom->ttbr, bank->base + REG_MMU_PT_BASE_ADDR);
 
 		pm_runtime_put(m4udev);
 	}
@@ -1366,8 +1374,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 		writel_relaxed(reg->int_control[i], base + REG_MMU_INT_CONTROL0);
 		writel_relaxed(reg->int_main_control[i], base + REG_MMU_INT_MAIN_CONTROL);
 		writel_relaxed(reg->ivrp_paddr[i], base + REG_MMU_IVRP_PADDR);
-		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
-		       base + REG_MMU_PT_BASE_ADDR);
+		writel(m4u_dom->ttbr, base + REG_MMU_PT_BASE_ADDR);
 	} while (++i < data->plat_data->banks_num);
 
 	/*
@@ -1401,7 +1408,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat      = M4U_MT6779,
 	.flags         = HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN | WR_THROT_EN |
-			 MTK_IOMMU_TYPE_MM,
+			 MTK_IOMMU_TYPE_MM | PGTABLE_PA_35_EN,
 	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
 	.banks_num    = 1,
 	.banks_enable = {true},
-- 
2.18.0


