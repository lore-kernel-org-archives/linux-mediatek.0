Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643C2C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:24:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3512223134
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TlZZsS9g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mOuGtLMp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3512223134
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kh1gnV3xQYVpkA72UqevARt7gO7K8mQD37cAAK3geaM=; b=TlZZsS9guln6/2RzOx9oUJyql
	3VYFxk74OmeQ2Lb8WUDZ7yjb9HCtCUh388m9dxj9R8CvBNieznoAJGq2MGDEFU4v/Utki46QJ7O/1
	5rsiaU1YUULLP7f3qERDKFi6RvpJYRRjv1o854wTNFT7HCqlOwNaceZaXJ1C5nVn2aSu+HppKMook
	BZnqCzqCgV5Vamff/mRZz89LOplIf8okrJ/yHukZHvUKCU3LVTp9L4B8AMFielB1TPOWqHeMqzPfR
	W+tFgwWJRHZZWGqCGd72D5omo5NXHBNSqDGu1UoUElwMpaBFnoRR6cTDFkuuo/jGcRpQ3JM8zrI10
	qXOWK2Uag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpo9W-000205-5G; Mon, 29 Jun 2020 07:24:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpo9R-0001ys-S3; Mon, 29 Jun 2020 07:24:27 +0000
X-UUID: 5c8b8e8124374157a8967e1917f26794-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Waw4MpLzpM/zl2PaUldmCJgI6Pg/QZM8fvRDXqtPgjM=; 
 b=mOuGtLMpoSJhQsYg2SN2m53opaDfGSr4fNIvj6F93frv7KpYCqXt5jvCfvUsoGbbhK7Vpeyxf2Y232UNG/AHDnz2if+0gJs850utHvHQzlxewuBKAASdpcR08SxQQwH5e7qH9nOo9NRy7hsjsSJGp/6B7bDAT6RoukPoItMmfOc=;
X-UUID: 5c8b8e8124374157a8967e1917f26794-20200628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 254431129; Sun, 28 Jun 2020 23:24:18 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 00:14:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 15:14:14 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 15:14:14 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v5 03/10] iommu/mediatek: Modify the usage of
 mtk_iommu_plat_data structure
Date: Mon, 29 Jun 2020 15:13:03 +0800
Message-ID: <20200629071310.1557-4-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200629071310.1557-1-chao.hao@mediatek.com>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Given the fact that we are adding more and more plat_data bool values,
it would make sense to use a u32 flags register and add the appropriate
macro definitions to set and check for a flag present.
No functional change.

Suggested-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 23 ++++++++++++-----------
 drivers/iommu/mtk_iommu.h | 16 ++++++++++------
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 88d3df5b91c2..8f81df6cbe51 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -563,7 +563,8 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 			 upper_32_bits(data->protect_base);
 	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
 
-	if (data->enable_4GB && data->plat_data->has_vld_pa_rng) {
+	if (data->enable_4GB &&
+	    MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_VLD_PA_RNG)) {
 		/*
 		 * If 4GB mode is enabled, the validate PA range is from
 		 * 0x1_0000_0000 to 0x1_ffff_ffff. here record bit[32:30].
@@ -573,7 +574,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
 
-	if (data->plat_data->reset_axi) {
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, RESET_AXI)) {
 		/* The register is called STANDARD_AXI_MODE in this case */
 		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
 	}
@@ -618,7 +619,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 
 	/* Whether the current dram is over 4GB */
 	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
-	if (!data->plat_data->has_4gb_mode)
+	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
 		data->enable_4GB = false;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -631,7 +632,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (data->irq < 0)
 		return data->irq;
 
-	if (data->plat_data->has_bclk) {
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_BCLK)) {
 		data->bclk = devm_clk_get(dev, "bclk");
 		if (IS_ERR(data->bclk))
 			return PTR_ERR(data->bclk);
@@ -763,23 +764,23 @@ static const struct dev_pm_ops mtk_iommu_pm_ops = {
 
 static const struct mtk_iommu_plat_data mt2712_data = {
 	.m4u_plat     = M4U_MT2712,
-	.has_4gb_mode = true,
-	.has_bclk     = true,
-	.has_vld_pa_rng   = true,
+	.flags        = HAS_4GB_MODE |
+			HAS_BCLK |
+			HAS_VLD_PA_RNG,
 	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 };
 
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
-	.has_4gb_mode = true,
-	.has_bclk     = true,
-	.reset_axi    = true,
+	.flags	      = HAS_4GB_MODE |
+			HAS_BCLK |
+			RESET_AXI,
 	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
 };
 
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
-	.reset_axi    = true,
+	.flags        = RESET_AXI,
 	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 1b6ea839b92c..7cc39f729263 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -17,6 +17,15 @@
 #include <linux/spinlock.h>
 #include <soc/mediatek/smi.h>
 
+#define HAS_4GB_MODE			BIT(0)
+/* HW will use the EMI clock if there isn't the "bclk". */
+#define HAS_BCLK			BIT(1)
+#define HAS_VLD_PA_RNG			BIT(2)
+#define RESET_AXI			BIT(3)
+
+#define MTK_IOMMU_HAS_FLAG(pdata, _x) \
+		((((pdata)->flags) & (_x)) == (_x))
+
 struct mtk_iommu_suspend_reg {
 	u32				misc_ctrl;
 	u32				dcm_dis;
@@ -36,12 +45,7 @@ enum mtk_iommu_plat {
 
 struct mtk_iommu_plat_data {
 	enum mtk_iommu_plat m4u_plat;
-	bool                has_4gb_mode;
-
-	/* HW will use the EMI clock if there isn't the "bclk". */
-	bool                has_bclk;
-	bool                has_vld_pa_rng;
-	bool                reset_axi;
+	u32                 flags;
 	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
