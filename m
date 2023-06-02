Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072F5C7EE29
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyQNmdwqYsBsEdW5bNjYzy56QmNTaVNLwlbO1xDaKDo=; b=J8W0QQRBES4yNjUli39dRQEDNM
	LnrzWBOfE09LZ5U9igDl7Vw/8rCm7+VbC7i8M9aSKWlpu87y3CcNI9oEBBLJgY2ydIgDn6psROisN
	lNaPKtGQVc8Dg4tcpvJKTUzDymh0xqG75NfRUx4e/6gOBDyiPsfb7WukkV0A9P6zZJXnJmGEuJWXZ
	82vMWnD6BCwuvKD3QdN4tx/gr6l/HKskxkh3KxONFaIfNO/6953sO2yNPoqmxFQm8DiBif+NNrHHM
	IG8R+rp9Fovx7VPjo1hx7FnYo0avY7dO/COTa3kB8y9icTzYPp6YfO/WQW6zSGgk5xdHkyyMbUaHj
	KnRaN/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50r0-006Kvq-0i;
	Fri, 02 Jun 2023 09:13:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50qw-006Kv7-2B;
	Fri, 02 Jun 2023 09:13:48 +0000
X-UUID: c403433e012511ee83ed1395ce914268-20230602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wyQNmdwqYsBsEdW5bNjYzy56QmNTaVNLwlbO1xDaKDo=;
	b=TuUZ8CT/cbSxMuy/elTcxK1ScPDA5nA13QnLbitHWq8F20TnzDwHS5bwi6qkn2tL9Awx91VXbDOp/E3mslCzV+gms3lmOeNxTy6IZWdrwleaFEYeH7AGNssy2jfeuUAvefwKIfHYPOxYFLUZXUMX/LB5GQBDhno9V2s8zOOvZXQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:9c9b8ed2-680b-4283-b12d-ed6d308489fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:1e1fd46d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: c403433e012511ee83ed1395ce914268-20230602
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260692115; Fri, 02 Jun 2023 02:13:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 17:03:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 17:03:05 +0800
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
Subject: [PATCH v12 2/7] iommu/mediatek: Fix two IOMMU share pagetable issue
Date: Fri, 2 Jun 2023 17:02:22 +0800
Message-ID: <20230602090227.7264-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602090227.7264-1-yong.wu@mediatek.com>
References: <20230602090227.7264-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_021346_720377_39CD3FB9 
X-CRM114-Status: GOOD (  19.12  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index aecc7d154f28..7287be67bd1f 100644
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


