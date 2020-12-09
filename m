Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F6DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:14:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4E5023B99
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4E5023B99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k2b7G8KN+i1fEDC26zRq3RibOEXQlNtsp841GtzH+6g=; b=lifXY4TGDrh0OifeOqWfiP/ab
	Uw0C1Rwec2Cj3LiaL5as8fLn5zbV/oJsMPFCQKWp1UJOYcXVzSs7h/bJpfrfC8sDNXUlKr1Xwk16P
	kZRh7tDMlnzl3ER9R8sFZ/rP80dldvzt6yRtXh1gF4DDwUilzv7bRsI8LdPt90mJEtd2v8ZDkwaxU
	RLI+GTYLxZqtXJmpCZzhkHHb6INUmrYe6R0gmXmBc/ToyxwVrhMHSul4NXR3LbqFIbP2w9XGEgb9p
	Hy561uIALZBTGlkrlJHexg8FmrlZNt15vCK2id4pZYvWL96V6I6pre4SeF2gXvhPgy8ufYFql69uk
	DbcFzn7SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmubr-0007ff-3D; Wed, 09 Dec 2020 08:14:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuam-0006tv-9r; Wed, 09 Dec 2020 08:12:59 +0000
X-UUID: fcd0689cd4934613ac7a79c986a734a0-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Tlk0Jsq0+sIkkmXIZEMw8F4Cue/+/eR5tAYG2+pYSvg=; 
 b=nBU/uMu8rfX2NZx0wFeKPNsdJ8LV1Z1tCFyqCwBpb3/wLrdskmGKJCvE3wLq7Vha3IHZmJInOmvF/Xt+xfY7V1WNgvsDarGl3XzQOXo6SlGpfYslnoHBFV3k82LuLyQGRvpmvRIbfpreT/yD7oD5GPGlKhR9LqNpbpCxuccnD/s=;
X-UUID: fcd0689cd4934613ac7a79c986a734a0-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 114472002; Wed, 09 Dec 2020 00:12:46 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:05:04 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:04:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:05:02 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 24/27] iommu/mediatek: Add support for multi domain
Date: Wed, 9 Dec 2020 16:00:59 +0800
Message-ID: <20201209080102.26626-25-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_031256_673499_5DD01354 
X-CRM114-Status: GOOD (  24.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some HW IP(ex: CCU) require the special iova range. That means the
iova got from dma_alloc_attrs for that devices must locate in his
special range. In this patch, we allocate a special iova_range for
each a special requirement and create each a iommu domain for each
a iova_range.

meanwhile we still use one pagetable which support 16GB iova.

After this patch, If the iova range of a master is over 4G, the master
should:
a) Declare its special dma_ranges in its dtsi node. For example, If we
   preassign the iova 4G-8G for vcodec, then the vcodec dtsi node should
   add this:
   /*
    * iova start at 0x1_0000_0000, pa still start at 0x4000_0000
    * size is 0x1_0000_0000.
    */
   dma-ranges = <0x1 0x0 0x0 0x40000000 0x1 0x0>;  /* 4G ~ 8G */
 Note: we don't have a actual bus concept here. the master doesn't have its
 special parent node, thus this dma-ranges can only be put in the master's
 node.

b) Update the dma_mask:
  dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 47 +++++++++++++++++++++++++++++++--------
 drivers/iommu/mtk_iommu.h |  3 ++-
 2 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index ed771133643d..160690d56bd2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -355,6 +355,14 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 {
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 
+	/* Use the exist domain as there is only one m4u pgtable here. */
+	if (data->m4u_dom) {
+		dom->iop = data->m4u_dom->iop;
+		dom->cfg = data->m4u_dom->cfg;
+		dom->domain.pgsize_bitmap = data->m4u_dom->cfg.pgsize_bitmap;
+		return 0;
+	}
+
 	dom->cfg = (struct io_pgtable_cfg) {
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
 			IO_PGTABLE_QUIRK_NO_PERMS |
@@ -380,6 +388,8 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 
 static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 {
+	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	const struct mtk_iommu_iova_region *region;
 	struct mtk_iommu_domain *dom;
 
 	if (type != IOMMU_DOMAIN_DMA)
@@ -395,8 +405,9 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (mtk_iommu_domain_finalise(dom))
 		goto  put_dma_cookie;
 
-	dom->domain.geometry.aperture_start = 0;
-	dom->domain.geometry.aperture_end = DMA_BIT_MASK(32);
+	region = data->plat_data->iova_region + data->cur_domid;
+	dom->domain.geometry.aperture_start = region->iova_base;
+	dom->domain.geometry.aperture_end = region->iova_base + region->size - 1;
 	dom->domain.geometry.force_aperture = true;
 
 	return &dom->domain;
@@ -548,19 +559,31 @@ static void mtk_iommu_release_device(struct device *dev)
 static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 {
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct iommu_group *group;
+	int domid;
 
 	if (!data)
 		return ERR_PTR(-ENODEV);
 
-	/* All the client devices are in the same m4u iommu-group */
-	if (!data->m4u_group) {
-		data->m4u_group = iommu_group_alloc();
-		if (IS_ERR(data->m4u_group))
+	domid = MTK_M4U_TO_DOM(fwspec->ids[0]);
+	if (domid >= data->plat_data->iova_region_nr) {
+		dev_err(dev, "iommu domain id(%d/%d) is error.\n", domid,
+			data->plat_data->iova_region_nr);
+		return ERR_PTR(-EINVAL);
+	}
+
+	group = data->m4u_group[domid];
+	if (!group) {
+		group = iommu_group_alloc();
+		if (IS_ERR(group))
 			dev_err(dev, "Failed to allocate M4U IOMMU group\n");
+		data->m4u_group[domid] = group;
 	} else {
-		iommu_group_ref_get(data->m4u_group);
+		iommu_group_ref_get(group);
 	}
-	return data->m4u_group;
+	data->cur_domid = domid;
+	return group;
 }
 
 static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
@@ -589,14 +612,20 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 				       struct list_head *head)
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
-	const struct mtk_iommu_iova_region *resv;
+	const struct mtk_iommu_iova_region *resv, *curdom;
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_READ;
 	unsigned int i;
 
+	curdom = data->plat_data->iova_region + data->cur_domid;
 	for (i = 0; i < data->plat_data->iova_region_nr; i++) {
 		resv = data->plat_data->iova_region + i;
 
+		/* Only reserve when the region is in the current domain */
+		if (resv->iova_base <= curdom->iova_base ||
+		    resv->iova_base + resv->size >= curdom->iova_base + curdom->size)
+			continue;
+
 		region = iommu_alloc_resv_region(resv->iova_base, resv->size,
 						 prot, IOMMU_RESV_RESERVED);
 		if (!region)
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index e867cd3aeeac..b54862307128 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -67,7 +67,7 @@ struct mtk_iommu_data {
 	phys_addr_t			protect_base; /* protect memory base */
 	struct mtk_iommu_suspend_reg	reg;
 	struct mtk_iommu_domain		*m4u_dom;
-	struct iommu_group		*m4u_group;
+	struct iommu_group		*m4u_group[MTK_M4U_DOM_NR_MAX];
 	bool                            enable_4GB;
 	spinlock_t			tlb_lock; /* lock for tlb range flush */
 
@@ -77,6 +77,7 @@ struct mtk_iommu_data {
 
 	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
 
+	unsigned int			cur_domid;
 	struct list_head		list;
 	struct mtk_smi_larb_iommu	larb_imu[MTK_LARB_NR_MAX];
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
