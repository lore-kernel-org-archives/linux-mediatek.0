Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37002C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SIJTB2iw2ZKbVZypN9eh4Lmwq+P7EW/KvxfnNL94MRc=; b=nsaYUqWUhJJZvVB518NyDns1uc
	DFYZxhePDg82U4ItqVmgDXv5zT0rsxlV+V8MKX4V5FXudLOZskmMi49yY5w84JbUodRYh3/yicb3w
	AYQcGWNVsTiaePh2V5j5HRSZsByE4zALGJUajP8mbl29sardtyNVii/6dE61Mpvpc+zntuYWCUlEe
	tT/pvqDK6yHSqypvtI1/4PdGsS0cvGKeuApYtkvReHatvTu+z7VZIL2y12G9/7n4zcGOoczhO4TGz
	DkSTtPft2m7wK/oMaEdZq8FFSqPuIUavd7ixHOkt0gICaVvlldbNIYrpfcrL3KCQZG/h7B0pDXzOb
	95szg9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckn5-00G3RW-0i;
	Thu, 16 Mar 2023 10:24:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckmz-00G3Nv-0i;
	Thu, 16 Mar 2023 10:24:56 +0000
X-UUID: c8f0f0c2c3e411ed86fbcd8805c7ac66-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SIJTB2iw2ZKbVZypN9eh4Lmwq+P7EW/KvxfnNL94MRc=;
	b=eeHeASbfC77etrde7DA+MUitBUz4AhQT+i6P4ftH6QWPOLqQ98KaNFto29qQKpP0Y8n9lxjbtDy9G/4jFPil8L4c9557MwsIJBJuwOgSBGXaqlfKAMQxWng1xN7eWy1ezguQu9bid0mLikDBdXj9Q2n7U0BKf2lVnErL50mH2nA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:b553f132-8533-4d77-9f5e-649d48af1c73,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:83295aa,CLOUDID:c3769228-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: c8f0f0c2c3e411ed86fbcd8805c7ac66-20230316
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 253913833; Thu, 16 Mar 2023 03:24:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 16 Mar 2023 18:14:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 16 Mar 2023 18:14:47 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>, Yunfei Wang
	<yf.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jianjiao.zeng@mediatek.com>,
	<chengci.xu@mediatek.com>
Subject: [PATCH v3] iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN
Date: Thu, 16 Mar 2023 18:14:45 +0800
Message-ID: <20230316101445.12443-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032453_265590_7FDA016A 
X-CRM114-Status: GOOD (  11.25  )
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

When we enable PGTABLE_PA_35_EN, the PA for pgtable may be 35bits.
Thus add dma_mask for it.

Fixes: 301c3ca12576 ("iommu/mediatek: Allow page table PA up to 35bit")
Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v3: Sorry for a typo. Change from "if (!ret)" to "if (ret)".

v2: Just move this out from mt8188 series. Nothing change.

v1: https://lore.kernel.org/linux-mediatek/20230307080555.14399-3-yong.wu@mediatek.com/
---
 drivers/iommu/mtk_iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d5a4955910ff..6a00ce208dc2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1258,6 +1258,14 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			return PTR_ERR(data->bclk);
 	}
 
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN)) {
+		ret = dma_set_mask(dev, DMA_BIT_MASK(35));
+		if (ret) {
+			dev_err(dev, "Failed to set dma_mask 35.\n");
+			return ret;
+		}
+	}
+
 	pm_runtime_enable(dev);
 
 	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
-- 
2.25.1


