Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBDFC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyZCaP05X6lfIrLBmulEZEZiIx5VivBXumzXNOyHnEo=; b=1UCW6xHZ47ib1D
	VSYVNOn48hof51gXasKFygL3PauXq7XKAZ0pUgu8Q7L5CUPtU1enYiwtrFL7fhzk3fM8QFnuuD0qY
	RbMPCoWKfDBIaJZ3+UQiyuma89vk/uWyFsv11CSPp1yHGB7fT3Io9pefQ1sNHlQ0sCVq+dPMA92b3
	8bOnfCRkzGgdee+Pfl6wxCRFLTe0s8ICagqcukTlhoWmFZ+FL0/nKfMUX7Xq2TGvCbi6IESKwS390
	L2dBEAypexIBktL5ix6YToMf7gG4ESTUZRH4mIrEqberdY+cnUte4jZeJmKREEHJz4afFrujLsiTO
	ol8Z7PyWTkd6REkqvP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCHpu-0070y1-Dv; Tue, 25 Jan 2022 09:09:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHiF-006xGc-2m; Tue, 25 Jan 2022 09:02:05 +0000
X-UUID: 29e1952152d0439caeeece2b615e31fb-20220125
X-UUID: 29e1952152d0439caeeece2b615e31fb-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 411437816; Tue, 25 Jan 2022 02:01:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 01:00:46 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 25 Jan 2022 17:00:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 17:00:43 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH v4 30/35] iommu/mediatek: Initialise bank HW for each a bank
Date: Tue, 25 Jan 2022 16:56:29 +0800
Message-ID: <20220125085634.17972-31-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220125085634.17972-1-yong.wu@mediatek.com>
References: <20220125085634.17972-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_010203_181026_48A6150D 
X-CRM114-Status: GOOD (  19.35  )
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

The mt8195 IOMMU HW max support 5 banks, and regarding the banks'
registers, it looks like:

 ----------------------------------------
 |bank0  | bank1 | bank2 | bank3 | bank4|
 ----------------------------------------
 |global |
 |control|         null
 |regs   |
 -----------------------------------------
 |bank   |bank   |bank   |bank   |bank   |
 |regs   |regs   |regs   |regs   |regs   |
 |       |       |       |       |       |
 -----------------------------------------

Each bank has some special bank registers and it share bank0's global
control registers. this patch initialise the bank hw with the bankid.

In the hw_init, we always initialise bank0's control register since
we don't know if the bank0 is initialised.

Additionally, About each bank's register base, always delta 0x1000.
like bank[x + 1] = bank[x] + 0x1000.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index dc47dc0e3163..c0843c67b5a7 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -270,7 +270,7 @@ static inline void mtk_iommu_unbind(struct device *dev)
 
 static const struct iommu_ops mtk_iommu_ops;
 
-static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
+static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int bankid);
 
 #define MTK_IOMMU_TLB_ADDR(iova) ({					\
 	dma_addr_t _addr = iova;					\
@@ -653,12 +653,14 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 
 	mutex_lock(&data->mutex);
 	bank = &data->bank[bankid];
-	if (!bank->m4u_dom) { /* Initialize the M4U HW */
+	if (!bank->m4u_dom) { /* Initialize the M4U HW for each a BANK */
 		ret = pm_runtime_resume_and_get(m4udev);
-		if (ret < 0)
+		if (ret < 0) {
+			dev_err(m4udev, "pm get fail(%d) in attach.\n", ret);
 			goto data_unlock;
+		}
 
-		ret = mtk_iommu_hw_init(data);
+		ret = mtk_iommu_hw_init(data, bankid);
 		if (ret) {
 			pm_runtime_put(m4udev);
 			goto data_unlock;
@@ -871,11 +873,16 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
+static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int bankid)
 {
+	const struct mtk_iommu_bank_data *bankx = &data->bank[bankid];
 	const struct mtk_iommu_bank_data *bank0 = &data->bank[0];
 	u32 regval;
 
+	/*
+	 * Global control settings are in bank0. May re-init these global registers
+	 * since no sure if there is bank0 consumers.
+	 */
 	if (data->plat_data->m4u_plat == M4U_MT8173) {
 		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
 			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
@@ -918,13 +925,14 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(regval, bank0->base + REG_MMU_MISC_CTRL);
 
+	/* Independent settings for each bank */
 	regval = F_L2_MULIT_HIT_EN |
 		F_TABLE_WALK_FAULT_INT_EN |
 		F_PREETCH_FIFO_OVERFLOW_INT_EN |
 		F_MISS_FIFO_OVERFLOW_INT_EN |
 		F_PREFETCH_FIFO_ERR_INT_EN |
 		F_MISS_FIFO_ERR_INT_EN;
-	writel_relaxed(regval, bank0->base + REG_MMU_INT_CONTROL0);
+	writel_relaxed(regval, bankx->base + REG_MMU_INT_CONTROL0);
 
 	regval = F_INT_TRANSLATION_FAULT |
 		F_INT_MAIN_MULTI_HIT_FAULT |
@@ -933,19 +941,19 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		F_INT_TLB_MISS_FAULT |
 		F_INT_MISS_TRANSACTION_FIFO_FAULT |
 		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
-	writel_relaxed(regval, bank0->base + REG_MMU_INT_MAIN_CONTROL);
+	writel_relaxed(regval, bankx->base + REG_MMU_INT_MAIN_CONTROL);
 
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_LEGACY_IVRP_PADDR))
 		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
 	else
 		regval = lower_32_bits(data->protect_base) |
 			 upper_32_bits(data->protect_base);
-	writel_relaxed(regval, bank0->base + REG_MMU_IVRP_PADDR);
+	writel_relaxed(regval, bankx->base + REG_MMU_IVRP_PADDR);
 
-	if (devm_request_irq(bank0->parent_dev, bank0->irq, mtk_iommu_isr, 0,
-			     dev_name(bank0->parent_dev), (void *)bank0)) {
-		writel_relaxed(0, bank0->base + REG_MMU_PT_BASE_ADDR);
-		dev_err(bank0->parent_dev, "Failed @ IRQ-%d Request\n", bank0->irq);
+	if (devm_request_irq(bankx->parent_dev, bankx->irq, mtk_iommu_isr, 0,
+			     dev_name(bankx->parent_dev), (void *)bankx)) {
+		writel_relaxed(0, bankx->base + REG_MMU_PT_BASE_ADDR);
+		dev_err(bankx->parent_dev, "Failed @ IRQ-%d Request\n", bankx->irq);
 		return -ENODEV;
 	}
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
