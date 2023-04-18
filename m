Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B032C77B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZDOqj1m8cIMUGwxIboTp22k5uRdEnVGcNHp6xbvz9k=; b=rLC7ZOyo7s+Ciz9pHGO5/GmDK0
	n826cOrWELuqN/qw5W1Xx4PjrJZCRsspQrZPA7O2L6hW/Gl/K5oNZhqtmeAvoIlt7YFLnemIDvWch
	5OdxX3Tcif90HbLc8TEM8jm4vmEIUjAu4cMBJeNYvqEt6d3dlB+fbOK+S41Tj9WzK4ohON3y+Su+/
	82RuVrCNIX++EKrWZOP22L4RAg0KJF2l4Z4GS6kGuCz+UBxECtCba3UaQ++FaY5p1t9P+pHxKPvr1
	7VFm+CC3ULBW9GT9UYQhHHcdqB3USrttVOA4nc2ylkRj3qoPcwDXsKdssmnVZKuj5mDRSBz4qFYNS
	GyR8ZP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pogoy-001KVb-1i;
	Tue, 18 Apr 2023 08:36:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pogos-001KSk-25;
	Tue, 18 Apr 2023 08:36:12 +0000
X-UUID: 0f665666ddc411ed8687db9d93187ff1-20230418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7ZDOqj1m8cIMUGwxIboTp22k5uRdEnVGcNHp6xbvz9k=;
	b=QBuRcI8mvfNlxgEPSI8XY6dwP11NMbPYGfDzVQwCYRUaHHy7QQlSn4kT4EZGwIm49nmpD/iTyQ2eRbBUXInnnfb1fq/xZLuYbhnabrvMCfN78nN1T40We8uhDJ7VYs4hQiLvnXEpjO1lLmI20lzQwau7zKUOnFccN38b7CFVLuU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:ca0d45d5-b213-46e5-a90d-604804664e62,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:7034b6a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 0f665666ddc411ed8687db9d93187ff1-20230418
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 790854655; Tue, 18 Apr 2023 01:36:06 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 18 Apr 2023 16:36:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 18 Apr 2023 16:36:02 +0800
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
	<chengci.xu@mediatek.com>
Subject: [PATCH v11 3/7] iommu/mediatek: Adjust mtk_iommu_config flow
Date: Tue, 18 Apr 2023 16:35:10 +0800
Message-ID: <20230418083514.4379-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230418083514.4379-1-yong.wu@mediatek.com>
References: <20230418083514.4379-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_013610_699106_6BAA2330 
X-CRM114-Status: GOOD (  17.73  )
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

If there are many ports in a infra master, current flow will update
the INFRA register many times. This patch saves all ports to portid_msk
in the front of mtk_iommu_config(), then update only once for the IOMMU
configure. After this, we could avoid send too many SMC calls to ATF in
MT8188.

Prepare for MT8188, also reduce the indention without functional change.

Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 58 +++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 4eb6742ec5f9..c7d9948a954c 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -579,41 +579,47 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
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
2.25.1


