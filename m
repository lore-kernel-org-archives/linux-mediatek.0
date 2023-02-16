Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE65C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 05:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3xIGt0fW/waO3hH0M9YaCdUr6JQu37ebiTFAwKMZzw=; b=E8I9e1sEgI1CXkr16wsdzTjtKI
	7XkMkjY2zDE7nGyPUvi5xv7KZLOTJwK9fxzRiIEF8/mUM25vaysIR4BJ3UNY6l1p2x46X/Ixsfaam
	lK8fRYIpv3S9RGmw/yIKIzPqSrY7qfSBdD0N7PLU23UbSQXrxdN7LW5IzfpxOGcDbUFDbMWusFjTS
	+m5esZXZj1iTky8P3n53WJiQJf/FvqCPNbK5cUuwOVxlDxlTSHo3Qx4aXuzQFoYiWoWMbV6i/800J
	SAeM6ol9PGmeG2es5IURH3oCa3usietn8e8Jy4PI285i73MA0xuUGf6a+E3wbTCwFRoIDucbX6mhz
	R6EI3Uvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSWv5-008YWJ-3d; Thu, 16 Feb 2023 05:34:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSWv1-008YTy-TQ; Thu, 16 Feb 2023 05:34:57 +0000
X-UUID: a209b32aadbb11edbbe3f76fe852e059-20230215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+3xIGt0fW/waO3hH0M9YaCdUr6JQu37ebiTFAwKMZzw=;
	b=mM2K8gyghSAevaYrx0slfCqceR/p7tvNKzofKYcYwNA+MbpqjIF+vgdcEef3Zr77R323HmiZloqeYu8adKREs14YyH69BUu0fjm6NJwXsgt88tSlwtYJ5IbtX7+x6JGINBBwPGUx6HfzoAhqlhOiPhwU3L70vUM09g57D6FGAqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:d6a8dff5-fcec-4f40-a1d5-0061bce8e34c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:3a6c29f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: a209b32aadbb11edbbe3f76fe852e059-20230215
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 364795626; Wed, 15 Feb 2023 22:34:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 16 Feb 2023 13:34:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 16 Feb 2023 13:34:14 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <jianjiao.zeng@mediatek.com>,
	<chengci.xu@mediatek.com>, <youlin.pei@mediatek.com>
Subject: [PATCH v7 3/6] iommu/mediatek: Adjust mtk_iommu_config flow
Date: Thu, 16 Feb 2023 13:33:19 +0800
Message-ID: <20230216053322.11596-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230216053322.11596-1-yong.wu@mediatek.com>
References: <20230216053322.11596-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_213456_007236_8F331B46 
X-CRM114-Status: GOOD (  15.80  )
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

From: "Chengci.Xu" <chengci.xu@mediatek.com>

For reduce indention without functional change, prepare for MT8188.
If there are many ports in a same larb, current flow will update
larb_mmu->mmu or update INFRA register for too many times.
So we save all ports to portid_msk in the front of mtk_iommu_config(),
and then update only once for IOMMU configure. By this modification,
we can prevent MT8188 from sending to many SMC calls, avoiding enter
ATF for each port.

Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 58 +++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 9802e5c1a625..7ba05fa58c20 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -583,41 +583,47 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 	unsigned int                 larbid, portid;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	const struct mtk_iommu_iova_region *region;
-	u32 peri_mmuen, peri_mmuen_msk;
+	unsigned long portid_msk = 0;
 	int i, ret = 0;
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
-		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
 		portid = MTK_M4U_TO_PORT(fwspec->ids[i]);
+		portid_msk |= BIT(portid);
+	}
 
-		if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
-			larb_mmu = &data->larb_imu[larbid];
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		/* All ports should be in the same larb. just use 0 here */
+		larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+		larb_mmu = &data->larb_imu[larbid];
+		region = data->plat_data->iova_region + regionid;
 
-			region = data->plat_data->iova_region + regionid;
+		for_each_set_bit(portid, &portid_msk, 32)
 			larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
 
-			dev_dbg(dev, "%s iommu for larb(%s) port %d region %d rgn-bank %d.\n",
-				enable ? "enable" : "disable", dev_name(larb_mmu->dev),
-				portid, regionid, larb_mmu->bank[portid]);
-
-			if (enable)
-				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
-			else
-				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
-		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
-			peri_mmuen_msk = BIT(portid);
-			/* PCI dev has only one output id, enable the next writing bit for PCIe */
-			if (dev_is_pci(dev))
-				peri_mmuen_msk |= BIT(portid + 1);
-
-			peri_mmuen = enable ? peri_mmuen_msk : 0;
-			ret = regmap_update_bits(data->pericfg, PERICFG_IOMMU_1,
-						 peri_mmuen_msk, peri_mmuen);
-			if (ret)
-				dev_err(dev, "%s iommu(%s) inframaster 0x%x fail(%d).\n",
-					enable ? "enable" : "disable",
-					dev_name(data->dev), peri_mmuen_msk, ret);
+		dev_dbg(dev, "%s iommu for larb(%s) port 0x%lx region %d rgn-bank %d.\n",
+			enable ? "enable" : "disable", dev_name(larb_mmu->dev),
+			portid_msk, regionid, upper_32_bits(region->iova_base));
+
+		if (enable)
+			larb_mmu->mmu |= portid_msk;
+		else
+			larb_mmu->mmu &= ~portid_msk;
+	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
+		/* PCI dev has only one output id, enable the next writing bit for PCIe */
+		if (dev_is_pci(dev)) {
+			if (fwspec->num_ids != 1) {
+				dev_err(dev, "PCI dev can only have one port.\n");
+				return -ENODEV;
+			}
+			portid_msk |= BIT(portid + 1);
 		}
+
+		ret = regmap_update_bits(data->pericfg, PERICFG_IOMMU_1,
+					 (u32)portid_msk, enable ? (u32)portid_msk : 0);
+		if (ret)
+			dev_err(dev, "%s iommu(%s) inframaster 0x%lx fail(%d).\n",
+				enable ? "enable" : "disable",
+				dev_name(data->dev), portid_msk, ret);
 	}
 	return ret;
 }
-- 
2.18.0


