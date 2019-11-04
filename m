Return-Path: <SRS0=WUpV=Y4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F84CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 12:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D6CA217F4
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 12:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tozNi6n8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D6CA217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAtz8R2xvHK5NF65RMaDwL3ZpdgcBqIowhNgemK4mL8=; b=tozNi6n8rxf0/W
	a7nFei4lujn/Wc14qTGHnlOBMYMmFwNaDCi0DKIgCj9vl9SKWYQxHKy1RvcOlHoM2JyIlLQiFKng0
	dy2WEZpoy8ELQARzd8Du2jnxuIrS2uwhu2fUZ5lo4Yp0KR95LHqUOqevM1PqcOT19xGb9aa6r4jT1
	ZI6R140u9pICE5HTtAK7l4qV4yr21HwU1mH9TbNmaU1fpxuFmq9Pk+N5xNhc3Gyj73f4bEUtljyNJ
	1W+aa1eRHZMDk3knzmuYKOjorCb92f9MC8bIxuuWr6HfeLtOM/lujcePdShNb7Z9J7Fz/IiTAKKUz
	U/5k1gXMuPu+7O3zL4IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRb6D-00089d-O0; Mon, 04 Nov 2019 12:04:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRb4X-0006Li-In; Mon, 04 Nov 2019 12:03:03 +0000
X-UUID: 8b86280209e144d1a7d13195648ba119-20191104
X-UUID: 8b86280209e144d1a7d13195648ba119-20191104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 368606721; Mon, 04 Nov 2019 04:03:07 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 03:52:54 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 19:52:55 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 4 Nov 2019 19:52:51 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [RESEND,PATCH 06/13] iommu/mediatek: Change get the way of m4u_group
Date: Mon, 4 Nov 2019 19:52:31 +0800
Message-ID: <20191104115238.2394-7-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191104115238.2394-1-chao.hao@mediatek.com>
References: <20191104115238.2394-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_040301_641325_A791343C 
X-CRM114-Status: GOOD (  13.37  )
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
 Cui Zhang <cui.zhang@mediatek.com>, Jun Yan <jun.yan@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Guangming Cao <guangming.cao@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. Redefine mtk_iommu_domain structure, it will include iommu_group
and iommu_domain. Different mtk_iommu_domains can be distinguished by
ID. When we realize multiple mtk_iommu_domains, every mtk_iommu_domain
can describe one iova region.
2. In theory, every device has one iommu_group, so this patch will
get iommu_group by checking device. All the devices belong to the same
m4u_group currently, so they also use the same mtk_iommu_domain(id=0).

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index f264fa8c16a0..27995b2b29a6 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -117,12 +117,16 @@
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
 
 struct mtk_iommu_domain {
+	u32				id;
 	struct iommu_domain		domain;
+	struct iommu_group		*group;
+	struct list_head		list;
 };
 
 struct mtk_iommu_pgtable {
 	struct io_pgtable_cfg	cfg;
 	struct io_pgtable_ops	*iop;
+	struct list_head	m4u_dom_v2;
 };
 
 static struct mtk_iommu_pgtable *share_pgtable;
@@ -173,6 +177,41 @@ static struct mtk_iommu_data *mtk_iommu_get_m4u_data(void)
 	return NULL;
 }
 
+static u32 get_domain_id(void)
+{
+	/* only support one mtk_iommu_domain currently */
+	return 0;
+}
+
+static u32 mtk_iommu_get_domain_id(void)
+{
+	return get_domain_id();
+}
+
+static struct mtk_iommu_domain *get_mtk_domain(struct device *dev)
+{
+	struct mtk_iommu_data *data = dev->iommu_fwspec->iommu_priv;
+	struct mtk_iommu_domain *dom;
+	u32 domain_id = mtk_iommu_get_domain_id();
+
+	list_for_each_entry(dom, &data->pgtable->m4u_dom_v2, list) {
+		if (dom->id == domain_id)
+			return dom;
+	}
+	return NULL;
+}
+
+static struct iommu_group *mtk_iommu_get_group(struct device *dev)
+{
+	struct mtk_iommu_domain *dom;
+
+	dom = get_mtk_domain(dev);
+	if (dom)
+		return dom->group;
+
+	return NULL;
+}
+
 static struct mtk_iommu_pgtable *mtk_iommu_get_pgtable(void)
 {
 	return share_pgtable;
@@ -334,6 +373,8 @@ static struct mtk_iommu_pgtable *create_pgtable(struct mtk_iommu_data *data)
 	if (!pgtable)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_LIST_HEAD(&pgtable->m4u_dom_v2);
+
 	pgtable->cfg = (struct io_pgtable_cfg) {
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
 			IO_PGTABLE_QUIRK_NO_PERMS |
@@ -388,6 +429,7 @@ static int mtk_iommu_attach_pgtable(struct mtk_iommu_data *data,
 static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 {
 	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
+	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 	struct mtk_iommu_domain *dom;
 
 	if (type != IOMMU_DOMAIN_DMA)
@@ -405,12 +447,15 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (iommu_get_dma_cookie(&dom->domain))
 		goto  free_dom;
 
+	dom->group = data->m4u_group;
+	dom->id = mtk_iommu_get_domain_id();
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = pgtable->cfg.pgsize_bitmap;
 
 	dom->domain.geometry.aperture_start = 0;
 	dom->domain.geometry.aperture_end = DMA_BIT_MASK(32);
 	dom->domain.geometry.force_aperture = true;
+	list_add_tail(&dom->list, &pgtable->m4u_dom_v2);
 
 	return &dom->domain;
 
@@ -566,6 +611,7 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	}
 
 	/* All the client devices are in the same m4u iommu-group */
+	data->m4u_group = mtk_iommu_get_group(dev);
 	if (!data->m4u_group) {
 		data->m4u_group = iommu_group_alloc();
 		if (IS_ERR(data->m4u_group))
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
