Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499A7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyzLJI8Dezv5xZ0d7+QcXI+oPK+rbLBUaDa2sW0h/iQ=; b=MT8t6rvNuhlnyM
	1dR6QW07KVQjlqk6FcbN5QYcZFAZQuwhmw4/ABwjEi5b+Ba9jJPRJyrxvc365OC9JSatmuvI0at5z
	RzOFU7u2iZNl6eGzRpZ5pBRgWPe48Gg+bx8Jxl2rG+3JYdXUVcS/HqH9F96grxP6GRd2nk9OKx96q
	TUYU0o9D/4q/YHFd93xuTIDSl1FxvaA6Oi9d6hc1abE7yuhE8PJ12EXe1V1XDX2crGnkAOHDloHxX
	bxwltgCxDylwWrxIPm1EFONy+bxqkB201Mju+GRWe3cEcYr1F8Wfd/4WjAzmQ8w7wcgPdBr76yzVu
	RAexq3swj+tAtg95xBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlmwx-004Grq-GM; Tue, 03 May 2022 07:27:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlmuP-004FhO-6R; Tue, 03 May 2022 07:25:26 +0000
X-UUID: 2b6cd95dc2d6499ba04876bf69b86dea-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9b1686d7-c82d-435b-b82a-d17a4dcb1b58, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:6a084bc7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2b6cd95dc2d6499ba04876bf69b86dea-20220503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 418715505; Tue, 03 May 2022 00:25:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 00:18:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 15:18:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 15:18:46 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH v7 31/36] iommu/mediatek: Change the domid to iova_region_id
Date: Tue, 3 May 2022 15:14:22 +0800
Message-ID: <20220503071427.2285-32-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503071427.2285-1-yong.wu@mediatek.com>
References: <20220503071427.2285-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_002521_268221_F2770A6B 
X-CRM114-Status: GOOD (  21.05  )
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

Prepare for adding bankid, also no functional change.

In the previous SoC, each a iova_region is a domain; In the multi-banks
case, each a bank is a domain, then the original function name
"mtk_iommu_get_domain_id" is not proper. Use "iova_region_id" instead of
"domain_id".

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 46 +++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5f298cf6aac3..023bb7d3ffb2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -467,8 +467,8 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int mtk_iommu_get_domain_id(struct device *dev,
-				   const struct mtk_iommu_plat_data *plat_data)
+static int mtk_iommu_get_iova_region_id(struct device *dev,
+					const struct mtk_iommu_plat_data *plat_data)
 {
 	const struct mtk_iommu_iova_region *rgn = plat_data->iova_region;
 	const struct bus_dma_region *dma_rgn = dev->dma_range_map;
@@ -498,7 +498,7 @@ static int mtk_iommu_get_domain_id(struct device *dev,
 }
 
 static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
-			    bool enable, unsigned int domid)
+			    bool enable, unsigned int regionid)
 {
 	struct mtk_smi_larb_iommu    *larb_mmu;
 	unsigned int                 larbid, portid;
@@ -514,12 +514,12 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 		if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
 			larb_mmu = &data->larb_imu[larbid];
 
-			region = data->plat_data->iova_region + domid;
+			region = data->plat_data->iova_region + regionid;
 			larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
 
-			dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
+			dev_dbg(dev, "%s iommu for larb(%s) port %d region %d rgn-bank %d.\n",
 				enable ? "enable" : "disable", dev_name(larb_mmu->dev),
-				portid, domid, larb_mmu->bank[portid]);
+				portid, regionid, larb_mmu->bank[portid]);
 
 			if (enable)
 				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
@@ -545,7 +545,7 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 
 static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 				     struct mtk_iommu_data *data,
-				     unsigned int domid)
+				     unsigned int region_id)
 {
 	const struct mtk_iommu_iova_region *region;
 	struct mtk_iommu_domain	*m4u_dom;
@@ -584,7 +584,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 
 update_iova_region:
 	/* Update the iova region for this domain */
-	region = data->plat_data->iova_region + domid;
+	region = data->plat_data->iova_region + region_id;
 	dom->domain.geometry.aperture_start = region->iova_base;
 	dom->domain.geometry.aperture_end = region->iova_base + region->size - 1;
 	dom->domain.geometry.force_aperture = true;
@@ -620,18 +620,18 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	struct device *m4udev = data->dev;
 	struct mtk_iommu_bank_data *bank;
 	unsigned int bankid = 0;
-	int ret, domid;
+	int ret, region_id;
 
-	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
-	if (domid < 0)
-		return domid;
+	region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
+	if (region_id < 0)
+		return region_id;
 
 	mutex_lock(&dom->mutex);
 	if (!dom->bank) {
 		/* Data is in the frstdata in sharing pgtable case. */
 		frstdata = mtk_iommu_get_frst_data(hw_list);
 
-		ret = mtk_iommu_domain_finalise(dom, frstdata, domid);
+		ret = mtk_iommu_domain_finalise(dom, frstdata, region_id);
 		if (ret) {
 			mutex_unlock(&dom->mutex);
 			return -ENODEV;
@@ -662,7 +662,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	}
 	mutex_unlock(&data->mutex);
 
-	return mtk_iommu_config(data, dev, true, domid);
+	return mtk_iommu_config(data, dev, true, region_id);
 
 err_unlock:
 	mutex_unlock(&data->mutex);
@@ -802,22 +802,22 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	struct mtk_iommu_data *c_data = dev_iommu_priv_get(dev), *data;
 	struct list_head *hw_list = c_data->hw_list;
 	struct iommu_group *group;
-	int domid;
+	int regionid;
 
 	data = mtk_iommu_get_frst_data(hw_list);
 	if (!data)
 		return ERR_PTR(-ENODEV);
 
-	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
-	if (domid < 0)
-		return ERR_PTR(domid);
+	regionid = mtk_iommu_get_iova_region_id(dev, data->plat_data);
+	if (regionid < 0)
+		return ERR_PTR(regionid);
 
 	mutex_lock(&data->mutex);
-	group = data->m4u_group[domid];
+	group = data->m4u_group[regionid];
 	if (!group) {
 		group = iommu_group_alloc();
 		if (!IS_ERR(group))
-			data->m4u_group[domid] = group;
+			data->m4u_group[regionid] = group;
 	} else {
 		iommu_group_ref_get(group);
 	}
@@ -851,14 +851,14 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 				       struct list_head *head)
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
-	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
+	unsigned int regionid = mtk_iommu_get_iova_region_id(dev, data->plat_data), i;
 	const struct mtk_iommu_iova_region *resv, *curdom;
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_READ;
 
-	if ((int)domid < 0)
+	if ((int)regionid < 0)
 		return;
-	curdom = data->plat_data->iova_region + domid;
+	curdom = data->plat_data->iova_region + regionid;
 	for (i = 0; i < data->plat_data->iova_region_nr; i++) {
 		resv = data->plat_data->iova_region + i;
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
