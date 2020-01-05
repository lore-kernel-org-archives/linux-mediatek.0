Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC60C33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:02:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D87621582
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:02:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FS2P7wAc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rEVwK7lx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D87621582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzZZH47wjwv1OfZcZW/aRNDJHbVjTnqJnb+AXdKNMLY=; b=FS2P7wAc1cn/GV
	Ly2DLv3zqlYiMEajLTG1SKRKa+OU/nLBAPZRd9ALjcPAmuyrPaAg59czyGfIYGeEDfTr9xxP6fZsd
	dm5Ld1q5jHBbldq4dbPzII1mucclG6+izJ97iGlfQ5Pp3vcNDAvoDnida90nIU3PWVipOcHx5B4r+
	289PWPT8JxxZWwdO/B2UQjHg5+o9yIHflHOn9NQKuHgEL/JbA7ZqW2RwoCpxtBKYIWoYtpEQllQ3x
	YS6GQeqaZMGFGXqrKjf7UBsKH6/Tf8rkbsRJmFTbaThwDbKDBwVhYvX+LrCauRITWBJMZCXILtz/C
	rEVXx04sZDEZbHggfBnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3fb-0001gw-0p; Sun, 05 Jan 2020 11:02:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3ag-0004Ib-PP; Sun, 05 Jan 2020 10:57:07 +0000
X-UUID: ab5518e7b0d442b98f109e015cfd3998-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IlvKanJ6MAk5SW9e36EIA3d9uB9VjVnU0JMaBdRz1og=; 
 b=rEVwK7lxh8o5PDB5PDNUrAqBhzxV0OUhSas9OHF9UUTsqpR961VYaDMN2CW50NLRo0UTAVGWfnpkwn/D0lQOQNEKiVWqBNhWqxDAPKDxcVEve7teUrxPgKLZAAkbj8e1weJ9f2kjXxVl+4EOGSjUEECCVfHBtarlC3U62b5RvaM=;
X-UUID: ab5518e7b0d442b98f109e015cfd3998-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 633364222; Sun, 05 Jan 2020 02:56:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:47:20 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:54 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:49 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 18/19] iommu/mediatek: Change single domain to multiple
 domains
Date: Sun, 5 Jan 2020 18:45:22 +0800
Message-ID: <20200105104523.31006-19-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_025702_841515_6EE738E8 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Cui Zhang <zhang.cui@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Based on one mtk_iommu_domain, this patch supports multiple
mtk_iommu_domains to realize different iova regions.

Every module has one smi_larb port, so we can create different
mtk_iommu_domains by smi_larb port define. So we will add port_mask
variable to mtk_domain_data, if some modules need special iova regions,
they can write smi_larb port which corresponding to themselves to
post_mask variable and specify the start and end address of iova region.
The form of port_mask can use "MTK_M4U_ID(larb, port)", larb and port can
refer to "mtxxxx-larb-port.h(ex: mt6779-larb-port.h)" file.

The architecture diagram is as below:

				mtk_iommu_pgtable
					|
				mtk_domain_data
					|
		-------------------------------------------------
		|			|			|
	mtk_iommu_domain1	mtk_iommu_domain2	mtk_iommu_domain3

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 48 +++++++++++++++++++++++++++++++++------
 drivers/iommu/mtk_iommu.h | 11 ++++++++-
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index ac658fa16136..ab09f435d437 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -124,6 +124,8 @@ struct mtk_iommu_pgtable {
 	struct io_pgtable_ops	*iop;
 	struct device		*init_dev;
 	struct list_head	m4u_dom_v2;
+	spinlock_t		domain_lock; /* lock for domain count */
+	u32			domain_count;
 	const struct mtk_domain_data	*dom_region;
 };
 
@@ -166,11 +168,15 @@ static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 static u32 get_domain_id(struct mtk_iommu_data *data, u32 portid)
 {
 	u32 dom_id = 0;
-	int i;
+	const struct mtk_domain_data *mtk_dom_array = data->plat_data->dom_data;
+	int i, j;
 
-	/* only support one mtk_iommu_domain currently(dom_cnt = 1) */
-	for (i = 0; i < data->plat_data->dom_cnt; i++)
-		return i;
+	for (i = 0; i < data->plat_data->dom_cnt; i++) {
+		for (j = 0; j < MTK_MAX_PORT_NUM; j++) {
+			if (portid == mtk_dom_array[i].port_mask[j])
+				return i;
+		}
+	}
 
 	return dom_id;
 }
@@ -410,6 +416,8 @@ static struct mtk_iommu_pgtable *create_pgtable(struct mtk_iommu_data *data)
 	if (!pgtable)
 		return ERR_PTR(-ENOMEM);
 
+	spin_lock_init(&pgtable->domain_lock);
+	pgtable->domain_count = 0;
 	INIT_LIST_HEAD(&pgtable->m4u_dom_v2);
 
 	pgtable->cfg = (struct io_pgtable_cfg) {
@@ -470,6 +478,7 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	struct mtk_iommu_data *data;
 	struct mtk_iommu_domain *dom;
 	struct device *dev;
+	unsigned long flags;
 
 	if (type != IOMMU_DOMAIN_DMA)
 		return NULL;
@@ -497,18 +506,34 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (dom->id >= data->plat_data->dom_cnt)
 		goto  put_dma_cookie;
 
+	spin_lock_irqsave(&pgtable->domain_lock, flags);
+	if (pgtable->domain_count >= data->plat_data->dom_cnt) {
+		spin_unlock_irqrestore(&pgtable->domain_lock, flags);
+		dev_err(dev, "%s, too many domain, count=%u\n",
+			__func__, pgtable->domain_count);
+		goto  put_dma_cookie;
+	}
+	pgtable->domain_count++;
+	spin_unlock_irqrestore(&pgtable->domain_lock, flags);
 	dom->data = data;
 	dom->group = data->m4u_group;
+
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = pgtable->cfg.pgsize_bitmap;
 
 	dom->domain.geometry.aperture_start =
-				pgtable->dom_region->min_iova;
+				pgtable->dom_region[dom->id].min_iova;
 	dom->domain.geometry.aperture_end =
-				pgtable->dom_region->max_iova;
+				pgtable->dom_region[dom->id].max_iova;
 	dom->domain.geometry.force_aperture = true;
 	list_add_tail(&dom->list, &pgtable->m4u_dom_v2);
 
+	dev_info(dev, "%s: dom_id:%u, start:%pa, end:%pa, dom_cnt:%u\n",
+		 __func__, dom->id,
+		 &dom->domain.geometry.aperture_start,
+		 &dom->domain.geometry.aperture_end,
+		 pgtable->domain_count);
+
 	return &dom->domain;
 
 put_dma_cookie:
@@ -521,9 +546,17 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 static void mtk_iommu_domain_free(struct iommu_domain *domain)
 {
 	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
+	unsigned long flags;
 
 	iommu_put_dma_cookie(domain);
 	kfree(to_mtk_domain(domain));
+	spin_lock_irqsave(&pgtable->domain_lock, flags);
+	pgtable->domain_count--;
+	if (pgtable->domain_count > 0) {
+		spin_unlock_irqrestore(&pgtable->domain_lock, flags);
+		return;
+	}
+	spin_unlock_irqrestore(&pgtable->domain_lock, flags);
 	free_io_pgtable_ops(pgtable->iop);
 	kfree(pgtable);
 }
@@ -697,6 +730,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 {
 	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
 	unsigned int i, total_cnt = data->plat_data->resv_cnt;
+	u32 dom_id = mtk_iommu_get_domain_id(dev);
 	const struct mtk_iommu_resv_iova_region *resv_data;
 	struct iommu_resv_region *region;
 	unsigned long base = 0;
@@ -711,7 +745,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 			base = (unsigned long)resv_data[i].iova_base;
 			size = resv_data[i].iova_size;
 		}
-		if (!size)
+		if (!size || resv_data[i].dom_id != dom_id)
 			continue;
 
 		region = iommu_alloc_resv_region(base, size, prot,
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 7f4d498ec5f6..3f6236c0416e 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -37,6 +37,7 @@ enum mtk_iommu_plat {
 };
 
 struct mtk_iommu_resv_iova_region {
+	u32			dom_id;
 	dma_addr_t		iova_base;
 	size_t			iova_size;
 	enum iommu_resv_type	type;
@@ -50,12 +51,20 @@ struct mtk_iommu_resv_iova_region {
  * struct mtk_domain_data:	domain configuration
  * @min_iova:	Start address of iova
  * @max_iova:	End address of iova
- * Note: one user can only belong to one domain
+ * @port_mask:	User can specify mtk_iommu_domain by smi larb and port.
+ *		Different mtk_iommu_domain have different iova space,
+ *		port_mask is made up of larb_id and port_id.
+ *		The format of larb and port can refer to mtxxxx-larb-port.h.
+ *		bit[4:0] = port_id  bit[11:5] = larb_id.
+ * Note: one user can only belong to one domain,
+ * the port mask is in unit of SMI larb.
  */
+#define MTK_MAX_PORT_NUM	5
 
 struct mtk_domain_data {
 	dma_addr_t	min_iova;
 	dma_addr_t	max_iova;
+	u32		port_mask[MTK_MAX_PORT_NUM];
 };
 
 struct mtk_iommu_plat_data {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
