Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73E3C11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8DC61CF4
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F8DC61CF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ezc/dwy4rn9bwqrFrsBf1BcMdk8g6VEZOmgPrORUmY=; b=sobkn4+0s9pZ9S
	R+7uWoTCuZU76+wmvFEuM4nUZ5Oahuv1qz8dyWXgJx5n9JUBDOSpRZZAFENi7o0OlPXezvuxfP81p
	XM4VinH31lnBR4TPg05GGgZHqdZW9ARc/nZAaa8Jzj6c4pXvoEOv288x50DsTQUN9Oc2PG7U02vCc
	YYHGo7ZylfnKE6ASkxeu6GtY4J5KVUwWMIdl7mqqYngTtHWRDH7A/kVklJ0ft/5eMLIMFJFMzueAu
	5Qmeuo8uoXsv6r4yPN/dyfU8iGzJaQ5cMRGvcZ1cmtIjSxCkdW/jev+fuMKVOJaS2w9P+qE76jbkR
	A5v3IDL8OlyPOwWxAWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyQHF-00CXxW-D1; Wed, 30 Jun 2021 02:48:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyQEG-00CWWp-Ej; Wed, 30 Jun 2021 02:45:34 +0000
X-UUID: 3fa757eb05d4461189168e4fb5e805f5-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XtC/7Z7gRUwoMHEhbPwrSFlKGH76Qa3yXGzgvt+DnsM=; 
 b=B8giW6YY6k1Ym/kYh0vthpDON3J2bHvVYpscbuj3Pp4rX9IhwKmok6f5Z5G3qZfgBoXZ47WDoAsvEPSJqIhmZ4C25Ei4e6oYDhVsJxUTuvi711ywelXqL7wLGJrwFUMP+cAcs1JvmMAsLhEOM6itWl6u83hGzucEkwgWbzU35jI=;
X-UUID: 3fa757eb05d4461189168e4fb5e805f5-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 222042534; Tue, 29 Jun 2021 19:45:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 19:38:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:38:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:38:03 +0800
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
Subject: [PATCH 21/24] iommu/mediatek: Change the domid to iova_region_id
Date: Wed, 30 Jun 2021 10:35:01 +0800
Message-ID: <20210630023504.18177-22-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630023504.18177-1-yong.wu@mediatek.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_194532_587736_F3612551 
X-CRM114-Status: GOOD (  21.60  )
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

This patch also have no functional change.

In the previous SoC, each a iova_region is a domain; In the multi-banks
case, each a bank is a domain; then the original function name
"mtk_iommu_get_domain_id" is not proper. the name "iova_region_id"
should be proper. this patch only rename the domid to iova_region_id.
This is preparing for adding bankid.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 46 +++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 042489b8e402..8137cfc9c8b9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -344,8 +344,8 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int mtk_iommu_get_domain_id(struct device *dev,
-				   const struct mtk_iommu_plat_data *plat_data)
+static int mtk_iommu_get_iova_region_id(struct device *dev,
+					const struct mtk_iommu_plat_data *plat_data)
 {
 	const struct mtk_iommu_iova_region *rgn = plat_data->iova_region;
 	const struct bus_dma_region *dma_rgn = dev->dma_range_map;
@@ -375,7 +375,7 @@ static int mtk_iommu_get_domain_id(struct device *dev,
 }
 
 static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
-			    bool enable, unsigned int domid)
+			    bool enable, unsigned int regionid)
 {
 	struct mtk_smi_larb_iommu    *larb_mmu;
 	unsigned int                 larbid, portid;
@@ -391,12 +391,12 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 		if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
 			larb_mmu = &data->larb_imu[larbid];
 
-			region = data->plat_data->iova_region + domid;
+			region = data->plat_data->iova_region + regionid;
 			larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
 
-			dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
+			dev_dbg(dev, "%s iommu for larb(%s) port %d region %d bank %d.\n",
 				enable ? "enable" : "disable", dev_name(larb_mmu->dev),
-				portid, domid, larb_mmu->bank[portid]);
+				portid, regionid, larb_mmu->bank[portid]);
 
 			if (enable)
 				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
@@ -423,7 +423,7 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 
 static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 				     struct mtk_iommu_data *data,
-				     unsigned int domid)
+				     unsigned int region_id)
 {
 	const struct mtk_iommu_iova_region *region;
 	struct list_head *head = data->hw_list;
@@ -470,7 +470,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 
 update_iova_region:
 	/* Update the iova region for this domain */
-	region = data->plat_data->iova_region + domid;
+	region = data->plat_data->iova_region + region_id;
 	dom->domain.geometry.aperture_start = region->iova_base;
 	dom->domain.geometry.aperture_end = region->iova_base + region->size - 1;
 	dom->domain.geometry.force_aperture = true;
@@ -510,15 +510,15 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	struct mtk_iommu_bank_data *bank;
 	struct device *m4udev = data->dev;
 	unsigned int bankid = 0;
-	int ret, domid;
+	int ret, region_id;
 
-	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
-	if (domid < 0)
-		return domid;
+	region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
+	if (region_id < 0)
+		return region_id;
 
 	bank = &data->bank[bankid];
 	if (!dom->bank) {
-		if (mtk_iommu_domain_finalise(dom, data, domid))
+		if (mtk_iommu_domain_finalise(dom, data, region_id))
 			return -ENODEV;
 		dom->bank = bank;
 	}
@@ -540,7 +540,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		pm_runtime_put(m4udev);
 	}
 
-	return mtk_iommu_config(data, dev, true, domid);
+	return mtk_iommu_config(data, dev, true, region_id);
 }
 
 static void mtk_iommu_detach_device(struct iommu_domain *domain,
@@ -644,21 +644,21 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
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
@@ -691,14 +691,14 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
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
