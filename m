Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296B5C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPcoXCoNcP+b2FdYzMchlIGbMO6MtADMk5DJwKWIjDU=; b=l1BhREaD/52bhw1II7TV0k1iYY
	HaFqXE39NJMpJqR3vjWcj7p20cpqTHfUjLq2Z99ey0sKJ8MZStNvi1beqvYOfjKjOTivul/0wH+eX
	NKmLInAaoedQqB923VF4PMGeExuj6bk5c379+IwNAuyq8HNT1nadj60vZ4giqnyeS/hK/xrhwM/G3
	1r6t14fkZu4jB91EnjLRd7/cSjLUup9AbaIFv0g+f54M6FFR4hItU0aqgv9tW3RQsiJsW5FLndrxQ
	pIpp61i9O/Gs5jmbhbJgYTZWkR8iAPMrYVvxfFDBUFO/1oVlUI9fDkthpQmosVXBgv6uyna0MnlF8
	GIEKw9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJQU-00FCT0-2u;
	Mon, 17 Apr 2023 07:37:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poJQS-00FCPe-0R;
	Mon, 17 Apr 2023 07:37:25 +0000
X-UUID: acad9b0adcf211ed8687db9d93187ff1-20230417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FPcoXCoNcP+b2FdYzMchlIGbMO6MtADMk5DJwKWIjDU=;
	b=U3UDT7O6SaxNkWt4S5Yy2fWUsXfc4oYhT7UvMZAXYMwDUC+//R3c4NQbsl8rFoGi9NODCGNdFRW3ykLlly15zsLEbtgdbdxr97tb1osg2sDaa8xex1f05WowGkc7o2JY8vlfl24h5QYRuQeh7eaex50AIpa7hWL2TwVwbWvdtg0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:55478a21-f5b9-41bf-bd30-6b5f98eab042,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:55478a21-f5b9-41bf-bd30-6b5f98eab042,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:718291a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:230417153653CPHI4FVC,BulkQuantity:2,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: acad9b0adcf211ed8687db9d93187ff1-20230417
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 819874094; Mon, 17 Apr 2023 00:37:15 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 15:36:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 15:36:51 +0800
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
Subject: [PATCH v10 2/7] iommu/mediatek: Fix two IOMMU share pagetable issue
Date: Mon, 17 Apr 2023 15:36:01 +0800
Message-ID: <20230417073606.25729-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417073606.25729-1-yong.wu@mediatek.com>
References: <20230417073606.25729-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_003724_184608_7000FE8D 
X-CRM114-Status: GOOD (  18.39  )
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

Prepare for mt8188 to fix a two IOMMU HWs share pagetable issue.

We have two MM IOMMU HWs in mt8188, one is VPP-IOMMU, the other is
VDO-IOMMU. The 2 MM IOMMU HWs share pagetable don't work in this case:
 a) VPP-IOMMU probe firstly.
 b) VDO-IOMMU probe.
 c) The master for VDO-IOMMU probe (means frstdata is vpp-iommu).
 d) The master in another domain probe. No matter it is vdo or vpp.
Then it still create a new pagetable in step d). The problem is
"frstdata->bank[0]->m4u_dom" was not initialized. Then when d) enter, it
still create a new one.

In this patch, we create a new variable "share_dom" for this share
pgtable case, it should be helpful for readable. and put all the share
pgtable logic in the mtk_iommu_domain_finalise.

In mt8195, the master of VPP-IOMMU probes before than VDO-IOMMU
from its dtsi node sequence, we don't see this issue in it. Prepare for
mt8188.

Fixes: 645b87c190c9 ("iommu/mediatek: Fix 2 HW sharing pgtable issue")
Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index f58b970dccf2..4eb6742ec5f9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -258,6 +258,8 @@ struct mtk_iommu_data {
 	struct device			*smicomm_dev;
 
 	struct mtk_iommu_bank_data	*bank;
+	struct mtk_iommu_domain		*share_dom; /* For 2 HWs share pgtable */
+
 	struct regmap			*pericfg;
 	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
 
@@ -620,15 +622,14 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 				     struct mtk_iommu_data *data,
 				     unsigned int region_id)
 {
+	struct mtk_iommu_domain	*share_dom = data->share_dom;
 	const struct mtk_iommu_iova_region *region;
-	struct mtk_iommu_domain	*m4u_dom;
-
-	/* Always use bank0 in sharing pgtable case */
-	m4u_dom = data->bank[0].m4u_dom;
-	if (m4u_dom) {
-		dom->iop = m4u_dom->iop;
-		dom->cfg = m4u_dom->cfg;
-		dom->domain.pgsize_bitmap = m4u_dom->cfg.pgsize_bitmap;
+
+	/* Always use share domain in sharing pgtable case */
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, SHARE_PGTABLE) && share_dom) {
+		dom->iop = share_dom->iop;
+		dom->cfg = share_dom->cfg;
+		dom->domain.pgsize_bitmap = share_dom->cfg.pgsize_bitmap;
 		goto update_iova_region;
 	}
 
@@ -658,6 +659,9 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = dom->cfg.pgsize_bitmap;
 
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, SHARE_PGTABLE))
+		data->share_dom = dom;
+
 update_iova_region:
 	/* Update the iova region for this domain */
 	region = data->plat_data->iova_region + region_id;
@@ -708,7 +712,9 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		/* Data is in the frstdata in sharing pgtable case. */
 		frstdata = mtk_iommu_get_frst_data(hw_list);
 
+		mutex_lock(&frstdata->mutex);
 		ret = mtk_iommu_domain_finalise(dom, frstdata, region_id);
+		mutex_unlock(&frstdata->mutex);
 		if (ret) {
 			mutex_unlock(&dom->mutex);
 			return ret;
-- 
2.25.1


