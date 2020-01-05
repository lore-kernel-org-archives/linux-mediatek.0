Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA648C33C9A
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:00:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17E521582
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T0VOtJEa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dZmqvsFq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B17E521582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOvaFwSMHTQj4R8uwojEkJfLIV/HckEYdHQVA5cIg+k=; b=T0VOtJEa+7Fpfr
	zizgm741qRCF/sSxLuL1tcBBFoi02hrWB8x2s4wVSVmbFTxWdAJcez8xU2KKtyVQ4p9gKPEnvOUX2
	fPYXc6r1FTuP7AhXP62NRZqQdXQsS+7nZEfWD5ERVc4ys5WcvgTvYE5GqbUELSd4cfRoCdw8MzMB7
	JolfwxbYR/yRIfXiA+5WTdR9Id0ubu1742dKC9UDM8ZKbNIRDw+1Pna9qZhofTNNvSeAF0eysm8jU
	lLaNLWZbGrJhdZSC3nI8r2kR/QeVhOfTmek/6FgNmW6NJ50XW4Zef7RHeMCC2g6X/s2spkO5y/UGY
	/3on42Txn5FZicPGOiTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3eI-0000PH-33; Sun, 05 Jan 2020 11:00:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3aN-0003wZ-Cs; Sun, 05 Jan 2020 10:56:45 +0000
X-UUID: 6de55ab6b4d04643985ea1eae013c4ad-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BU3FHHq8lyI4GErrRVuqeiEhzwtLbu5dCFfMXEQDW1k=; 
 b=dZmqvsFqqAbaVWA9Z3Th8Pkv40jl79K/lv9nKFWDW6jSAxxXjGdEY6Xv5Tbrj0yIK1rQvSPVFtEbTvpcDmteATeF1SR2W3G5HwMcgKMKCrl4o7gGtiVY+f2R4w8uJmUlv+hQMwqotfNQW/iEFNhTRGrrjyPifR8MpQZZvVb46+0=;
X-UUID: 6de55ab6b4d04643985ea1eae013c4ad-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1098492096; Sun, 05 Jan 2020 02:56:33 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:47:38 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:44 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:40 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 14/19] iommu/mediatek: Add mtk_domain_data structure
Date: Sun, 5 Jan 2020 18:45:18 +0800
Message-ID: <20200105104523.31006-15-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_025643_548909_0A7F9899 
X-CRM114-Status: GOOD (  12.17  )
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

Add mtk_domain_data structure to describe how many iova regions
there are and the relevant the start and end address of each
iova region. The number of iova region is equal to the number
of mtk_iommu_domain. So we will use mtk_domain_data to initialize
the start and end iova of mtk_iommu_domain.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 17 +++++++++++++++--
 drivers/iommu/mtk_iommu.h | 17 +++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index f2137033ec59..b1ce0a2df583 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -122,6 +122,12 @@ struct mtk_iommu_pgtable {
 	struct io_pgtable_ops	*iop;
 	struct device		*init_dev;
 	struct list_head	m4u_dom_v2;
+	const struct mtk_domain_data	*dom_region;
+};
+
+const struct mtk_domain_data single_dom = {
+	.min_iova = 0x0,
+	.max_iova = DMA_BIT_MASK(32)
 };
 
 static struct mtk_iommu_pgtable *share_pgtable;
@@ -400,6 +406,7 @@ static struct mtk_iommu_pgtable *create_pgtable(struct mtk_iommu_data *data)
 		dev_err(data->dev, "Failed to alloc io pgtable\n");
 		return ERR_PTR(-EINVAL);
 	}
+	pgtable->dom_region = data->plat_data->dom_data;
 
 	dev_info(data->dev, "%s create pgtable done\n", __func__);
 
@@ -470,8 +477,10 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = pgtable->cfg.pgsize_bitmap;
 
-	dom->domain.geometry.aperture_start = 0;
-	dom->domain.geometry.aperture_end = DMA_BIT_MASK(32);
+	dom->domain.geometry.aperture_start =
+				pgtable->dom_region->min_iova;
+	dom->domain.geometry.aperture_end =
+				pgtable->dom_region->max_iova;
 	dom->domain.geometry.force_aperture = true;
 	list_add_tail(&dom->list, &pgtable->m4u_dom_v2);
 
@@ -953,6 +962,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.has_bclk     = true,
 	.has_vld_pa_rng   = true,
 	.dom_cnt = 1,
+	.dom_data = &single_dom,
 	.larbid_remap[0] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
@@ -960,6 +970,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat = M4U_MT6779,
 	.dom_cnt = 1,
+	.dom_data = &single_dom,
 	.larbid_remap[0] = {0, 1, 2, 3, 5, 7, 10, 9},
 	/* vp6a, vp6b, mdla/core2, mdla/edmc*/
 	.larbid_remap[1] = {2, 0, 3, 1},
@@ -976,6 +987,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.has_bclk     = true,
 	.reset_axi    = true,
 	.dom_cnt = 1,
+	.dom_data = &single_dom,
 	.larbid_remap[0] = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
@@ -984,6 +996,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.reset_axi    = true,
 	.dom_cnt = 1,
+	.dom_data = &single_dom,
 	.larbid_remap[0] = {0, 4, 5, 6, 7, 2, 3, 1},
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 3a1c79222d09..a38b26018abe 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -36,6 +36,22 @@ enum mtk_iommu_plat {
 	M4U_MT8183,
 };
 
+/*
+ * reserved IOVA Domain for IOMMU users of HW limitation.
+ */
+
+/*
+ * struct mtk_domain_data:	domain configuration
+ * @min_iova:	Start address of iova
+ * @max_iova:	End address of iova
+ * Note: one user can only belong to one domain
+ */
+
+struct mtk_domain_data {
+	dma_addr_t	min_iova;
+	dma_addr_t	max_iova;
+};
+
 struct mtk_iommu_plat_data {
 	enum mtk_iommu_plat m4u_plat;
 	bool                has_4gb_mode;
@@ -51,6 +67,7 @@ struct mtk_iommu_plat_data {
 	u32                 m4u1_mask;
 	u32                 inv_sel_reg;
 	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
+	const struct mtk_domain_data	*dom_data;
 };
 
 struct mtk_iommu_domain;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
