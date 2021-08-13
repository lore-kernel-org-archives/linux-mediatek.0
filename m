Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B77AC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:08:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A79E60241
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A79E60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHWfIjFJ57opSyy0ZBVzj3R9KsMpiD8MH8/wh5EyME4=; b=LxkdcNqSNvMGqB
	NkWyC2UX7iW4dpGpWLdGWtaMy45YmuGwiuxsxd7lIbmyAC20LpHBeo1No2uOnl0mB+/SlJIgndwC0
	53BxF4kRvtzWkpSsv+5tJ5kjpSZOAsQA5BDsiYuKAzQpEElppEJXte2CiaZA2g5ZqSjmde6E0etPt
	pUlJKQ24MzEE6zy6Wyk2nRJyxf0PmxONmnCWWDtgWyc9CVEk/YbcMRweCyyktIztL7OhgN6aSGGO6
	yE7ySeBnUB+CA010RdCD5BtVVZNNMhkM07mujpkXLnvN8fyghGU2Gq6Rtc138muQJ02SKNMD9h/Mx
	8jBl9K7hX8ZwT5qVZyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERIU-00C19s-Kv; Fri, 13 Aug 2021 07:08:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mER8j-00BwFV-Lv; Fri, 13 Aug 2021 06:58:03 +0000
X-UUID: a35ea6f0bd4b4fae97eb4eb66530b8a7-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=i2p7TAU51xYQJzY+u9MQrbXASVsHfGzdRJEq6g0GwZc=; 
 b=MJxOu2BmNVqVxt/nCucE4kLSzfFiTyfhhSlxT/LMgD7DK+IIWX/tGGe5Qds8CV8WtzKtXyGZEKZGZ3vn5bSOFKgyle1yYaiUo5oYNXS3MC0hcud2pW3WtPXHfuogwfr0pYDgqfxi74B8uWQFvKp8h/141f5D7qtfbGjpZLaH+a4=;
X-UUID: a35ea6f0bd4b4fae97eb4eb66530b8a7-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 922952057; Thu, 12 Aug 2021 23:57:48 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:56:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:56:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:56:47 +0800
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
Subject: [PATCH v2 23/29] iommu/mediatek: Initialise bank HW for each a bank
Date: Fri, 13 Aug 2021 14:53:18 +0800
Message-ID: <20210813065324.29220-24-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_235801_784233_944B716B 
X-CRM114-Status: GOOD (  20.07  )
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
---
 drivers/iommu/mtk_iommu.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index c69a6f6dcc5a..cd86151c5181 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -153,7 +153,7 @@ struct mtk_iommu_domain {
 
 static const struct iommu_ops mtk_iommu_ops;
 
-static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
+static int mtk_iommu_hw_init(const struct mtk_iommu_data *data, unsigned int bankid);
 
 #define MTK_IOMMU_TLB_ADDR(iova) ({					\
 	dma_addr_t _addr = iova;					\
@@ -533,12 +533,12 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		dom->bank = bank;
 	}
 
-	if (!bank->m4u_dom) { /* Initialize the M4U HW */
+	if (!bank->m4u_dom) { /* Initialize the M4U HW for each a BANK */
 		ret = pm_runtime_resume_and_get(m4udev);
 		if (ret < 0)
 			return ret;
 
-		ret = mtk_iommu_hw_init(data);
+		ret = mtk_iommu_hw_init(data, bankid);
 		if (ret) {
 			pm_runtime_put(m4udev);
 			return ret;
@@ -746,11 +746,16 @@ static const struct iommu_ops mtk_iommu_ops = {
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
@@ -793,13 +798,14 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
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
@@ -808,19 +814,19 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
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
 
-	if (devm_request_irq(bank0->pdev, bank0->irq, mtk_iommu_isr, 0,
-			     dev_name(bank0->pdev), (void *)bank0)) {
-		writel_relaxed(0, bank0->base + REG_MMU_PT_BASE_ADDR);
-		dev_err(bank0->pdev, "Failed @ IRQ-%d Request\n", bank0->irq);
+	if (devm_request_irq(bankx->pdev, bankx->irq, mtk_iommu_isr, 0,
+			     dev_name(bankx->pdev), (void *)bankx)) {
+		writel_relaxed(0, bankx->base + REG_MMU_PT_BASE_ADDR);
+		dev_err(bankx->pdev, "Failed @ IRQ-%d Request\n", bankx->irq);
 		return -ENODEV;
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
