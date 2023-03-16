Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E769C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NtK/AMh/RAbTlyDMNdLBC7ow1fYH1iS/gmQ15B+V07o=; b=LQkdy+raPuZjvJXUoUT3BnfMUt
	a9rh82pT3ICHRyd1wmAJzyq4XtEVULCC3k/MNGBy9kINTyZjmeSluqvjdUwoP1frZZnnE9wuHKdl3
	bPz2mbMdhOhrmUF+IaRLibJkO3lEXd/7HpEGgeBbzcFg3uovqrKKdYxovVAW0kDb8KtIjmWpx8z2i
	MCkzaaWSVzCY041qWNFFhMmOAhgzsKmSJvlR0qzhz1BZRxy87vmOQShfz+qJOUbdBH7h090oCiJPJ
	KUX3CLhNNwSZWvqEVIYaZjo1wIpqs/iax4TyXgH3xnjYgh+IZ7KsuzUV9HteTiPQIBMBC6gTtoQn9
	OQFP0U8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pchL0-00FOIX-33;
	Thu, 16 Mar 2023 06:43:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pchKw-00FOHs-36;
	Thu, 16 Mar 2023 06:43:44 +0000
X-UUID: e0d82eb8c3c511ed86fbcd8805c7ac66-20230315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NtK/AMh/RAbTlyDMNdLBC7ow1fYH1iS/gmQ15B+V07o=;
	b=aIZaeKwd9+0DkZ3KF1dRKN4tJPkEy+SowwOBOd28Z7BLs9lLaB2Otuwm19/PIi2W/ZNoNrKkskcDCHhcSszcfJf7uW0bFPKvmYji5NE5aorTptHmEm09Zoirl/qkRHSlAySlloaADF7Ccljwx9Gu+fiT5M+f7UYBhgX+bKT8CTo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:8fdf7350-8137-432d-8238-9793bedc84ec,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:83295aa,CLOUDID:1e3c6cb3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: e0d82eb8c3c511ed86fbcd8805c7ac66-20230315
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1947201351; Wed, 15 Mar 2023 23:43:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 16 Mar 2023 14:42:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 16 Mar 2023 14:42:58 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>, Yunfei Wang
	<yf.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jianjiao.zeng@mediatek.com>,
	<chengci.xu@mediatek.com>
Subject: [PATCH v2] iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN
Date: Thu, 16 Mar 2023 14:42:51 +0800
Message-ID: <20230316064251.7346-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_234343_006895_54A20C39 
X-CRM114-Status: GOOD (  11.02  )
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
v2: Just move this out from mt8188 series. Nothing change.

v1: https://lore.kernel.org/linux-mediatek/20230307080555.14399-3-yong.wu@mediatek.com/
---
 drivers/iommu/mtk_iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d5a4955910ff..1a75b4382a92 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1258,6 +1258,14 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			return PTR_ERR(data->bclk);
 	}
 
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN)) {
+		ret = dma_set_mask(dev, DMA_BIT_MASK(35));
+		if (!ret) {
+			dev_err(dev, "Failed to set dma_mask 35.\n");
+			return ret;
+		}
+	}
+
 	pm_runtime_enable(dev);
 
 	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
-- 
2.25.1


