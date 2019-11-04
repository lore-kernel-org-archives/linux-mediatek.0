Return-Path: <SRS0=WUpV=Y4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D5FCA9EA0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 11:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2860521D7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2019 11:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4tuD56O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2860521D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8X6SW0mbMh4S7tn3wSGeFWvC01Ty7pbzjrwTGxraxc0=; b=M4tuD56OwqpgPh
	Q2gda/g0GAYVMK/7qjXH5anFeqoLW4CWnz2wCIcrFEcSpT9YsEYBNQtjejeJzmNVdi0EimetdW6Ks
	JYqohnkUJh5thfY0kEEVtLME3Yjas3oly7/daSG8PXfv/XHL+C7Li1kRLTXOSUuBLQJQN4sqvr0EQ
	CUx7cCe9k61ffQeAWJK5d3U1O+nPOi5YSKyaTlPAlMInyReYjoHPmMKNS0bzoRbpCxIx4MIhDlbRp
	XBAMQB5rb0XeuoJlG/O8hhTjzBhcxjiDjAeAeSYb/kBBgpNLafnFNDTw3QbHRmZ4sGXbCUI7M7jlk
	WhlSvQHN8/OPAOv42zhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRazy-0003VL-8T; Mon, 04 Nov 2019 11:58:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRawC-0007LR-PA; Mon, 04 Nov 2019 11:54:26 +0000
X-UUID: f7f2f62218e04655876ffa067c64bd77-20191104
X-UUID: f7f2f62218e04655876ffa067c64bd77-20191104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1187970554; Mon, 04 Nov 2019 03:54:27 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 03:52:51 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 19:52:52 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 4 Nov 2019 19:52:48 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [RESEND,
 PATCH 05/13] iommu/mediatek: Remove pgtable info in mtk_iommu_domain
Date: Mon, 4 Nov 2019 19:52:30 +0800
Message-ID: <20191104115238.2394-6-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191104115238.2394-1-chao.hao@mediatek.com>
References: <20191104115238.2394-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4F9ED66731A35343C8300A3A7FFACDAA6F5CFFF43922DCCCA9CA71AF5322E28B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_035424_834180_8AA28E66 
X-CRM114-Status: GOOD (  13.89  )
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

This patch will use mtk_iommu_pgtable to replace the part
of pgtable in mtk_iommu_domain, so we can remove the information
of pgtable in mtk_iommu_domain.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 3fa09b12e9f9..f264fa8c16a0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -117,9 +117,6 @@
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
 
 struct mtk_iommu_domain {
-	struct io_pgtable_cfg		cfg;
-	struct io_pgtable_ops		*iop;
-
 	struct iommu_domain		domain;
 };
 
@@ -379,6 +376,10 @@ static int mtk_iommu_attach_pgtable(struct mtk_iommu_data *data,
 	/* binding to pgtable */
 	data->pgtable = pgtable;
 
+	/* update HW settings */
+	writel(pgtable->cfg.arm_v7s_cfg.ttbr[0] & MMU_PT_ADDR_MASK,
+	       data->base + REG_MMU_PT_BASE_ADDR);
+
 	dev_info(data->dev, "m4u%d attach_pgtable done!\n", data->m4u_id);
 
 	return 0;
@@ -404,8 +405,6 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (iommu_get_dma_cookie(&dom->domain))
 		goto  free_dom;
 
-	dom->cfg = pgtable->cfg;
-	dom->iop = pgtable->iop;
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = pgtable->cfg.pgsize_bitmap;
 
@@ -422,11 +421,12 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 
 static void mtk_iommu_domain_free(struct iommu_domain *domain)
 {
-	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
 
-	free_io_pgtable_ops(dom->iop);
 	iommu_put_dma_cookie(domain);
 	kfree(to_mtk_domain(domain));
+	free_io_pgtable_ops(pgtable->iop);
+	kfree(pgtable);
 }
 
 static int mtk_iommu_attach_device(struct iommu_domain *domain,
@@ -439,11 +439,8 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		return -ENODEV;
 
 	/* Update the pgtable base address register of the M4U HW */
-	if (!data->m4u_dom) {
+	if (!data->m4u_dom)
 		data->m4u_dom = dom;
-		writel(dom->cfg.arm_v7s_cfg.ttbr[0] & MMU_PT_ADDR_MASK,
-		       data->base + REG_MMU_PT_BASE_ADDR);
-	}
 
 	mtk_iommu_config(data, dev, true);
 	return 0;
@@ -463,7 +460,7 @@ static void mtk_iommu_detach_device(struct iommu_domain *domain,
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t paddr, size_t size, int prot)
 {
-	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 
 	/* The "4GB mode" M4U physically can not use the lower remap of Dram. */
@@ -471,16 +468,16 @@ static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 		paddr |= BIT_ULL(32);
 
 	/* Synchronize with the tlb_lock */
-	return dom->iop->map(dom->iop, iova, paddr, size, prot);
+	return pgtable->iop->map(pgtable->iop, iova, paddr, size, prot);
 }
 
 static size_t mtk_iommu_unmap(struct iommu_domain *domain,
 			      unsigned long iova, size_t size,
 			      struct iommu_iotlb_gather *gather)
 {
-	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
 
-	return dom->iop->unmap(dom->iop, iova, size, gather);
+	return pgtable->iop->unmap(pgtable->iop, iova, size, gather);
 }
 
 static void mtk_iommu_flush_iotlb_all(struct iommu_domain *domain)
@@ -504,11 +501,11 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
 static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 					  dma_addr_t iova)
 {
-	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 	phys_addr_t pa;
 
-	pa = dom->iop->iova_to_phys(dom->iop, iova);
+	pa = pgtable->iop->iova_to_phys(pgtable->iop, iova);
 	if (data->enable_4GB && pa >= MTK_IOMMU_4GB_MODE_REMAP_BASE)
 		pa &= ~BIT_ULL(32);
 
@@ -850,8 +847,8 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 static int __maybe_unused mtk_iommu_resume(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
+	struct mtk_iommu_pgtable *pgtable = data->pgtable;
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
-	struct mtk_iommu_domain *m4u_dom = data->m4u_dom;
 	void __iomem *base = data->base;
 	int ret;
 
@@ -869,8 +866,8 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 	writel_relaxed(reg->int_main_control, base + REG_MMU_INT_MAIN_CONTROL);
 	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
 	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
-	if (m4u_dom)
-		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr[0] & MMU_PT_ADDR_MASK,
+	if (pgtable)
+		writel(pgtable->cfg.arm_v7s_cfg.ttbr[0] & MMU_PT_ADDR_MASK,
 		       base + REG_MMU_PT_BASE_ADDR);
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
