Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C209EEE49AA
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Aug 2023 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ls0IdxKcV0zs2a86C/WRgplohD3oAveG5LkpKErqf4o=; b=zsKWW9U9tFlpKsbSPRiD6SgHW3
	yjRMVzTsv1vNjhG/7Ny3Xf7wOG2xzQ43vePD86pWGaxuxjfhS7L8TdvomVbid+8qlgXjkhOqw4Ljy
	yz6m/5qt8DlrM9dVJadoY0Nz1JzDbmS/cyNtRNkYr/+aNDiyE4sCZDYJP4MzKmGcGjUUsrjCgHHfR
	ictGNDyZXnBGqAFJYpmj1xoOsD7vx6iyGOEkAN8vrhTt0wRVMmJtYVWx68ak42cqURR8H1a3pCb9o
	nfHIbI+QXJCNCtuEdMVVTNQNDvKaCyYZO2/hdbVYjQ2t+3KsnzU4zcrYFZcWLHnKcktlVGFkLDyIU
	lyIBMlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXHGh-00AZhU-0T;
	Sat, 19 Aug 2023 08:25:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXHGd-00AZgp-2G;
	Sat, 19 Aug 2023 08:25:09 +0000
X-UUID: e26ee1083e6911ee912e1518a6540028-20230819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ls0IdxKcV0zs2a86C/WRgplohD3oAveG5LkpKErqf4o=;
	b=e25wXzzMCPCZMMVxd37r0srcZinKRp3OFHRaHxHKzOz8ExRI3vqn5FLGWRK0Llz4a4t0Geo/BdTFOYxABj2If6aVplRAWUtLEo85GnAgIP5dG677+haYd7Y6wc8mgtzrFwn9tzESq6ntz7IOkJFsYf9WAmaGsaqqKa43OB22dYw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:9d5e7666-fc09-4b1a-a722-f959b118c125,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:355708c2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e26ee1083e6911ee912e1518a6540028-20230819
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 684977004; Sat, 19 Aug 2023 01:24:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 19 Aug 2023 16:14:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 19 Aug 2023 16:14:55 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Laura
 Nao <laura.nao@collabora.com>
Subject: [PATCH] iommu/mediatek: Fix share pgtable for iova over 4GB
Date: Sat, 19 Aug 2023 16:14:43 +0800
Message-ID: <20230819081443.8333-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_012507_750520_E40D3FF3 
X-CRM114-Status: GOOD (  13.76  )
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

In mt8192/mt8186, there is only one MM IOMMU that supports 16GB iova
space, which is shared by display, vcodec and camera. These two SoC use
one pgtable and have not the flag SHARE_PGTABLE, we should also keep
share pgtable for this case.

In mtk_iommu_domain_finalise, MM IOMMU always share pgtable, thus remove
the flag SHARE_PGTABLE checking. Infra IOMMU always uses independent
pgtable.

Fixes: cf69ef46dbd9 ("iommu/mediatek: Fix two IOMMU share pagetable issue")
Reported-by: Laura Nao <laura.nao@collabora.com>
Closes: https://lore.kernel.org/linux-iommu/20230818154156.314742-1-laura.nao@collabora.com/
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
Base on next-20230818.
---
 drivers/iommu/mtk_iommu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b17d3e7288a7..b5fcba305d2a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -262,7 +262,7 @@ struct mtk_iommu_data {
 	struct device			*smicomm_dev;
 
 	struct mtk_iommu_bank_data	*bank;
-	struct mtk_iommu_domain		*share_dom; /* For 2 HWs share pgtable */
+	struct mtk_iommu_domain		*share_dom;
 
 	struct regmap			*pericfg;
 	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
@@ -643,8 +643,8 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	struct mtk_iommu_domain	*share_dom = data->share_dom;
 	const struct mtk_iommu_iova_region *region;
 
-	/* Always use share domain in sharing pgtable case */
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, SHARE_PGTABLE) && share_dom) {
+	/* Share pgtable when 2 MM IOMMU share the pgtable or one IOMMU use multiple iova ranges */
+	if (share_dom) {
 		dom->iop = share_dom->iop;
 		dom->cfg = share_dom->cfg;
 		dom->domain.pgsize_bitmap = share_dom->cfg.pgsize_bitmap;
@@ -677,8 +677,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = dom->cfg.pgsize_bitmap;
 
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, SHARE_PGTABLE))
-		data->share_dom = dom;
+	data->share_dom = dom;
 
 update_iova_region:
 	/* Update the iova region for this domain */
-- 
2.25.1


