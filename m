Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F406BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHh+htqtsNuJOjxSVMNEfgbWpc83hkIhH/YZN5qclno=; b=PBppWz35Y9ZWtnLOszw3sBdAkG
	46QFQD+/BCEYZf/J/8QBMXfi5cWCGZ/+MCQEhd7otc7hViP8FVdH/ReRN16QS+QMl6Csc7EA+ZnRE
	8HnnbH9LjKSN7X0rOI/0Ao9GlwpbZFjcsCzDZ2rKRAcDbgV6nzSRTfw23/PTYWkcqN4M2eq6JmhtI
	yM3bR5/pj+z4WASA0xTk74EqedRXq/SdsxvhhykfvNxKnEjTD5uba8b4hBZ2PGNZtC7iKsc5eC3ay
	+7t/gJyARQrLFuOvV0BkeaJnNKuv3IXneLlhbFceSM5c/C419zUp2RPHG6/WWf46I+4gy0dTmxmrK
	8M8DuCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fbe-006dOJ-5U; Fri, 23 Dec 2022 10:48:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fZj-006bxP-HX; Fri, 23 Dec 2022 10:46:59 +0000
X-UUID: eeab86ab66b94db386fb2b909c1f86e5-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xHh+htqtsNuJOjxSVMNEfgbWpc83hkIhH/YZN5qclno=;
	b=Cl9oMhuIzMcEbBv3fV1SrhFLLRBMYXzAOzHzm6Ui0FQupKX4QzWYhA7mHVQO+oqUUYdfKdU70c+iIyQVM/7ZSy8pt9luTxVqE5gn9EZ5JZ+IZwsHkG9ur+74wQkleXxGLZkP6Gtyx6SUBkdYkIbr8TF8vddNScGlgz4nWiOVARE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:ccce3bed-63e2-48e3-a4f8-3804abf4d403,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:e132c8f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: eeab86ab66b94db386fb2b909c1f86e5-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1508264454; Fri, 23 Dec 2022 03:46:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 23 Dec 2022 18:16:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Dec 2022 18:16:09 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 4/4] iommu/mediatek: Add MT8188 IOMMU Support
Date: Fri, 23 Dec 2022 18:14:39 +0800
Message-ID: <20221223101439.494-5-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221223101439.494-1-chengci.xu@mediatek.com>
References: <20221223101439.494-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_024651_649538_A869BA0D 
X-CRM114-Status: UNSURE (   9.25  )
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

MT8188 has 3 IOMMU, containing 2 MM IOMMUs, one is for vdo, the other
is for vpp. and 1 INFRA IOMMU.

Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index ec81d21e33ce..9f8917378603 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -171,6 +171,7 @@ enum mtk_iommu_plat {
 	M4U_MT8173,
 	M4U_MT8183,
 	M4U_MT8186,
+	M4U_MT8188,
 	M4U_MT8192,
 	M4U_MT8195,
 	M4U_MT8365,
@@ -1533,6 +1534,51 @@ static const struct mtk_iommu_plat_data mt8186_data_mm = {
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
 };
 
+static const struct mtk_iommu_plat_data mt8188_data_infra = {
+	.m4u_plat	  = M4U_MT8188,
+	.flags            = WR_THROT_EN | DCM_DISABLE | STD_AXI_MODE | PM_CLK_AO |
+			    MTK_IOMMU_TYPE_INFRA | IFA_IOMMU_PCIE_SUPPORT |
+			    PGTABLE_PA_35_EN | CFG_IFA_MASTER_IN_ATF,
+	.inv_sel_reg      = REG_MMU_INV_SEL_GEN2,
+	.banks_num	  = 1,
+	.banks_enable     = {true},
+	.iova_region      = single_domain,
+	.iova_region_nr   = ARRAY_SIZE(single_domain),
+};
+
+static const struct mtk_iommu_plat_data mt8188_data_vdo = {
+	.m4u_plat	= M4U_MT8188,
+	.flags          = HAS_BCLK | HAS_SUB_COMM_3BITS | OUT_ORDER_WR_EN |
+			  WR_THROT_EN | IOVA_34_EN | SHARE_PGTABLE |
+			  PGTABLE_PA_35_EN | MTK_IOMMU_TYPE_MM,
+	.hw_list        = &m4ulist,
+	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
+	.banks_num      = 1,
+	.banks_enable   = {true},
+	.iova_region	= mt8192_multi_dom,
+	.iova_region_nr	= ARRAY_SIZE(mt8192_multi_dom),
+	.larbid_remap   = {{2}, {0}, {21}, {0}, {19}, {9, 10,
+			   11 /* 11a */, 25 /* 11c */},
+			   {13, 0, 29 /* 16b */, 30 /* 17b */, 0}, {5}},
+};
+
+static const struct mtk_iommu_plat_data mt8188_data_vpp = {
+	.m4u_plat	= M4U_MT8188,
+	.flags          = HAS_BCLK | HAS_SUB_COMM_3BITS | OUT_ORDER_WR_EN |
+			  WR_THROT_EN | IOVA_34_EN | SHARE_PGTABLE |
+			  PGTABLE_PA_35_EN | MTK_IOMMU_TYPE_MM,
+	.hw_list        = &m4ulist,
+	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
+	.banks_num      = 1,
+	.banks_enable   = {true},
+	.iova_region	= mt8192_multi_dom,
+	.iova_region_nr	= ARRAY_SIZE(mt8192_multi_dom),
+	.larbid_remap   = {{1}, {3}, {23}, {7}, {MTK_INVALID_LARBID},
+			   {12, 15, 24 /* 11b */}, {14, MTK_INVALID_LARBID,
+			   16 /* 16a */, 17 /* 17a */, MTK_INVALID_LARBID,
+			   27, 28 /* ccu0 */, MTK_INVALID_LARBID}, {4, 6}},
+};
+
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
@@ -1612,6 +1658,9 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{ .compatible = "mediatek,mt8186-iommu-mm",    .data = &mt8186_data_mm}, /* mm: m4u */
+	{ .compatible = "mediatek,mt8188-iommu-infra", .data = &mt8188_data_infra},
+	{ .compatible = "mediatek,mt8188-iommu-vdo",   .data = &mt8188_data_vdo},
+	{ .compatible = "mediatek,mt8188-iommu-vpp",   .data = &mt8188_data_vpp},
 	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
 	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
 	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
-- 
2.25.1


