Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB63C4320A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 06:59:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BE360FC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 06:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4BE360FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKsqiLPQuRZ9Gvd3Ik9kBEDBigmSFLoG77LLKcsRVg8=; b=RSjeCMbAIarXNJ
	T20+CcNGiNYt7Tw9vJaDxEgaKLBC5niIcDHGTpEoJBQlEIe/FLRrjG4e6zdc7BlOwRus9KaCUCXZS
	qB5CLC2GrGRJjvR/OWS9mQt2gOHQGNsBvCxVVZzGZOLxDqCToSxlipseLnjO9kl5j1Zwp2OhjfuK5
	KBYndQKIWlY9ryQSLgvzTW4NndchsJ9XyNA8wWN93ZQcqR/GwvG40m3yQY2G7/ZCwUqWuQF4lvBgG
	tB6oxfl1aZx9vv2vRGVneUvmupGN7VaSvuGyeHZwvFZ5zhnl3GV6k284l0EjHZRSO8rk2Z+aAWjKK
	zWo6uLK7LYWdK2QBxZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERAM-00BxBZ-6A; Fri, 13 Aug 2021 06:59:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mER7m-00Bvm8-PK; Fri, 13 Aug 2021 06:57:06 +0000
X-UUID: 6b374b1377fa401695002762ce5dae1f-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AFeTB7qdFzP/X9QFLe6HNGlCoVYZIvc4f9aDsKmMqYo=; 
 b=hWPFHa6TyfOVNaX0WLT84g1g9+nuc2yqkVAxEKSHiUyCB4NMdaYtkJ4XbW5YLhFUT5b8EfIl1CyFnqajpO7Q9CZSRLKnc0Sb0LZzgScwbe1a9imNRjCqZrr+rHc8olgxYVKznYHHAG3mMpKVoFOzeCFc1TxtXYPWTYoFbsWfs6k=;
X-UUID: 6b374b1377fa401695002762ce5dae1f-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 310132943; Thu, 12 Aug 2021 23:56:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:55:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:55:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:55:34 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH v2 15/29] iommu/mediatek: Contain MM IOMMU flow with the MM
 TYPE
Date: Fri, 13 Aug 2021 14:53:10 +0800
Message-ID: <20210813065324.29220-16-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_235702_920211_09C9CE8C 
X-CRM114-Status: GOOD (  25.10  )
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

Prepare for supporting INFRA_IOMMU, and APU_IOMMU later.

For Infra IOMMU/APU IOMMU, it doesn't have the "larb""port". thus, Use
the MM flag contain the MM_IOMMU special flow, Also, it moves a big
chunk code about parsing the mediatek,larbs into a function, this is
only needed for MM IOMMU. and all the current SoC are MM_IOMMU.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 190 +++++++++++++++++++++-----------------
 1 file changed, 107 insertions(+), 83 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 20d15f80dd6e..a4479916ad33 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -288,7 +288,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 {
 	struct mtk_iommu_data *data = dev_id;
 	struct mtk_iommu_domain *dom = data->m4u_dom;
-	unsigned int fault_larb, fault_port, sub_comm = 0;
+	unsigned int fault_larb = 0, fault_port = 0, sub_comm = 0;
 	u32 int_state, regval, va34_32, pa34_32;
 	u64 fault_iova, fault_pa;
 	bool layer, write;
@@ -314,17 +314,19 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	pa34_32 = FIELD_GET(F_MMU_INVAL_PA_34_32_MASK, fault_iova);
 	fault_pa |= (u64)pa34_32 << 32;
 
-	fault_port = F_MMU_INT_ID_PORT_ID(regval);
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_2BITS)) {
-		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
-		sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
-	} else if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_3BITS)) {
-		fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
-		sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
-	} else {
-		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		fault_port = F_MMU_INT_ID_PORT_ID(regval);
+		if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_2BITS)) {
+			fault_larb = F_MMU_INT_ID_COMM_ID(regval);
+			sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
+		} else if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_3BITS)) {
+			fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
+			sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
+		} else {
+			fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+		}
+		fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 	}
-	fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 
 	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
@@ -388,19 +390,21 @@ static void mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
 		portid = MTK_M4U_TO_PORT(fwspec->ids[i]);
 
-		larb_mmu = &data->larb_imu[larbid];
+		if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+			larb_mmu = &data->larb_imu[larbid];
 
-		region = data->plat_data->iova_region + domid;
-		larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
+			region = data->plat_data->iova_region + domid;
+			larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
 
-		dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
-			enable ? "enable" : "disable", dev_name(larb_mmu->dev),
-			portid, domid, larb_mmu->bank[portid]);
+			dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
+				enable ? "enable" : "disable", dev_name(larb_mmu->dev),
+				portid, domid, larb_mmu->bank[portid]);
 
-		if (enable)
-			larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
-		else
-			larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
+			if (enable)
+				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
+			else
+				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
+		}
 	}
 }
 
@@ -796,19 +800,75 @@ static const struct component_master_ops mtk_iommu_com_ops = {
 	.unbind		= mtk_iommu_unbind,
 };
 
+static int mtk_iommu_mm_dts_parse(struct device *dev,
+				  struct component_match **match,
+				  struct mtk_iommu_data *data)
+{
+	struct platform_device	*plarbdev;
+	struct device_link	*link;
+	struct device_node *larbnode, *smicomm_node;
+	int i, larb_nr, ret;
+
+	larb_nr = of_count_phandle_with_args(dev->of_node, "mediatek,larbs", NULL);
+	if (larb_nr < 0)
+		return larb_nr;
+
+	for (i = 0; i < larb_nr; i++) {
+		u32 id;
+
+		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
+		if (!larbnode)
+			return -EINVAL;
+
+		if (!of_device_is_available(larbnode)) {
+			of_node_put(larbnode);
+			continue;
+		}
+
+		ret = of_property_read_u32(larbnode, "mediatek,larb-id", &id);
+		if (ret)/* The id is consecutive if there is no this property */
+			id = i;
+
+		plarbdev = of_find_device_by_node(larbnode);
+		if (!plarbdev) {
+			of_node_put(larbnode);
+			return -EPROBE_DEFER;
+		}
+		data->larb_imu[id].dev = &plarbdev->dev;
+
+		component_match_add_release(dev, match, release_of,
+					    compare_of, larbnode);
+	}
+
+	/* Get smi-common dev from the last larb. */
+	smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
+	if (!smicomm_node)
+		return -EINVAL;
+
+	plarbdev = of_find_device_by_node(smicomm_node);
+	of_node_put(smicomm_node);
+	data->smicomm_dev = &plarbdev->dev;
+
+	link = device_link_add(data->smicomm_dev, dev,
+			       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+
+	if (!link) {
+		dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
+		return PTR_ERR(link);
+	}
+	return 0;
+}
+
 static int mtk_iommu_probe(struct platform_device *pdev)
 {
 	struct mtk_iommu_data   *data;
 	struct device           *dev = &pdev->dev;
-	struct device_node	*larbnode, *smicomm_node;
-	struct platform_device	*plarbdev;
-	struct device_link	*link;
 	struct resource         *res;
 	resource_size_t		ioaddr;
 	struct component_match  *match = NULL;
 	struct regmap		*infracfg;
 	void                    *protect;
-	int                     i, larb_nr, ret;
+	int                     ret;
 	u32			val;
 	char                    *p;
 
@@ -863,55 +923,12 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			return PTR_ERR(data->bclk);
 	}
 
-	larb_nr = of_count_phandle_with_args(dev->of_node,
-					     "mediatek,larbs", NULL);
-	if (larb_nr < 0)
-		return larb_nr;
-
-	for (i = 0; i < larb_nr; i++) {
-		u32 id;
-
-		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
-		if (!larbnode)
-			return -EINVAL;
-
-		if (!of_device_is_available(larbnode)) {
-			of_node_put(larbnode);
-			continue;
-		}
-
-		ret = of_property_read_u32(larbnode, "mediatek,larb-id", &id);
-		if (ret)/* The id is consecutive if there is no this property */
-			id = i;
-
-		plarbdev = of_find_device_by_node(larbnode);
-		if (!plarbdev) {
-			of_node_put(larbnode);
-			return -EPROBE_DEFER;
-		}
-		data->larb_imu[id].dev = &plarbdev->dev;
-
-		component_match_add_release(dev, &match, release_of,
-					    compare_of, larbnode);
-	}
-
-	/* Get smi-common dev from the last larb. */
-	smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
-	if (!smicomm_node)
-		return -EINVAL;
-
-	plarbdev = of_find_device_by_node(smicomm_node);
-	of_node_put(smicomm_node);
-	data->smicomm_dev = &plarbdev->dev;
-
 	pm_runtime_enable(dev);
 
-	link = device_link_add(data->smicomm_dev, dev,
-			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
-	if (!link) {
-		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
-		ret = -EINVAL;
-		goto out_runtime_disable;
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		ret = mtk_iommu_mm_dts_parse(dev, &match, data);
+		if (ret)
+			goto out_runtime_disable;
 	}
 
 	platform_set_drvdata(pdev, data);
@@ -942,9 +959,11 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			goto out_list_del;
 	}
 
-	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
-	if (ret)
-		goto out_bus_set_null;
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+		if (ret)
+			goto out_bus_set_null;
+	}
 	return ret;
 
 out_bus_set_null:
@@ -955,7 +974,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 out_sysfs_remove:
 	iommu_device_sysfs_remove(&data->iommu);
 out_link_remove:
-	device_link_remove(data->smicomm_dev, dev);
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
+		device_link_remove(data->smicomm_dev, dev);
 out_runtime_disable:
 	pm_runtime_disable(dev);
 	return ret;
@@ -972,7 +992,8 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 		bus_set_iommu(&platform_bus_type, NULL);
 
 	clk_disable_unprepare(data->bclk);
-	device_link_remove(data->smicomm_dev, &pdev->dev);
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
+		device_link_remove(data->smicomm_dev, &pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	devm_free_irq(&pdev->dev, data->irq, data);
 	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
@@ -1039,7 +1060,7 @@ static const struct dev_pm_ops mtk_iommu_pm_ops = {
 static const struct mtk_iommu_plat_data mt2712_data = {
 	.m4u_plat     = M4U_MT2712,
 	.flags        = HAS_4GB_MODE | HAS_BCLK | HAS_VLD_PA_RNG | SHARE_PGTABLE |
-			NOT_STD_AXI_MODE,
+			NOT_STD_AXI_MODE | MTK_IOMMU_TYPE_MM,
 	.hw_list      = &m4ulist,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.iova_region  = single_domain,
@@ -1050,7 +1071,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat      = M4U_MT6779,
 	.flags         = HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN | WR_THROT_EN |
-			 NOT_STD_AXI_MODE,
+			 NOT_STD_AXI_MODE | MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
 	.iova_region   = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
@@ -1059,7 +1080,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
 
 static const struct mtk_iommu_plat_data mt8167_data = {
 	.m4u_plat     = M4U_MT8167,
-	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR | NOT_STD_AXI_MODE,
+	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR | NOT_STD_AXI_MODE |
+			MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
@@ -1069,7 +1091,8 @@ static const struct mtk_iommu_plat_data mt8167_data = {
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
 	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
-			HAS_LEGACY_IVRP_PADDR | NOT_STD_AXI_MODE,
+			HAS_LEGACY_IVRP_PADDR | NOT_STD_AXI_MODE |
+			MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
@@ -1078,7 +1101,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
-	.flags        = RESET_AXI,
+	.flags        = RESET_AXI | MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
@@ -1088,7 +1111,8 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
-			  WR_THROT_EN | IOVA_34_EN | NOT_STD_AXI_MODE,
+			  WR_THROT_EN | IOVA_34_EN | NOT_STD_AXI_MODE |
+			  MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
 	.iova_region    = mt8192_multi_dom,
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
