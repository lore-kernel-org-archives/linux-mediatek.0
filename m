Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3B6C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IM7igWeD6xOoQVwnJH4xdIXjIjqFkhYrDNgYDdIHBvs=; b=uxGzV6xqFQEiOU
	N6lKoDnnNhz4YYVIu10+oXJpS5jFYfPFwIhZGCVLII1a0ohpzIe6gSTDZZbn6q33CGYtOJAf/4BAt
	oPDxErC9A7iGJ5UsX+dydYJDPPwdbx74qbSqUnBxuq3BFZUNYgO2pgh57bUQETdCZqXJTojAakpCA
	n300Ee5g0MA2R5ydTrmVfOdNy6O7uGviYOwUAr3kJMZXIEv7J9xkBjb8n1ECR26R6MWKnQY1QUGc0
	j4vGtdUiZlg41tymQfpDKYIb7CozPEDa3ZgmcZXqFoQ2+HB1BKk3aZIxENkBGeOwW1RjUn/XtCH2R
	okRMoD6CIwwMb92hdnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzybD-00CYdw-1j; Sat, 11 Jun 2022 10:44:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzyb9-00CYc0-B6; Sat, 11 Jun 2022 10:44:08 +0000
X-UUID: 2007cf44ffa54e019282280c7cc6d5d4-20220611
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:37dfa060-4480-454c-aa68-591a95ac855e,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:a23d85e7-1f03-4449-90ad-e6cb8f3d1399,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 2007cf44ffa54e019282280c7cc6d5d4-20220611
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 694065624; Sat, 11 Jun 2022 03:44:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jun 2022 03:33:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sat, 11 Jun 2022 18:33:58 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jun 2022 18:33:57 +0800
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
Subject: [PATCH v8 3/3] iommu/mediatek: Allow page table PA up to 35bit
Date: Sat, 11 Jun 2022 18:26:55 +0800
Message-ID: <20220611102656.10954-4-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220611102656.10954-1-yf.wang@mediatek.com>
References: <20220611102656.10954-1-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_034407_431957_0993A0BB 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yunfei Wang <yf.wang@mediatek.com>

Single memory zone feature will remove ZONE_DMA32 and ZONE_DMA. So add
the quirk IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT to let level 1 and level 2
pgtable support at most 35bit PA.

Signed-off-by: Ning Li <ning.li@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 3d62399e8865..4dbc33758711 100644
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
@@ -596,6 +598,9 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 		.iommu_dev = data->dev,
 	};
 
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
+		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT;
+
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
 		dom->cfg.oas = data->enable_4GB ? 33 : 32;
 	else
@@ -684,8 +689,8 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 			goto err_unlock;
 		}
 		bank->m4u_dom = dom;
-		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
-		       bank->base + REG_MMU_PT_BASE_ADDR);
+		bank->m4u_dom->ttbr = MTK_IOMMU_ADDR(dom->cfg.arm_v7s_cfg.ttbr);
+		writel(bank->m4u_dom->ttbr, data->base + REG_MMU_PT_BASE_ADDR);
 
 		pm_runtime_put(m4udev);
 	}
@@ -1366,8 +1371,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 		writel_relaxed(reg->int_control[i], base + REG_MMU_INT_CONTROL0);
 		writel_relaxed(reg->int_main_control[i], base + REG_MMU_INT_MAIN_CONTROL);
 		writel_relaxed(reg->ivrp_paddr[i], base + REG_MMU_IVRP_PADDR);
-		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
-		       base + REG_MMU_PT_BASE_ADDR);
+		writel(m4u_dom->ttbr, base + REG_MMU_PT_BASE_ADDR);
 	} while (++i < data->plat_data->banks_num);
 
 	/*
@@ -1401,7 +1405,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
