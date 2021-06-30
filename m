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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD148C11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA6661CF4
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA6661CF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCDNVhO4gWcef0Zadwy1dUmlVZ4SZfbMCNyQUqkeqBQ=; b=ADMV+jNcRO5me4
	oStZfV2iAroSpt5R7GiKym8q06NhCPRaXXyNDZpo1cfsQ9MIA7ua+XF58Nxn+KEhSGzjQn3cXxq8T
	Jmx0bQ8VbkdpaqR85WyysfBcVBQPtzWVvR9FJ/nxHbFBiEiqRBzCgN6sEtHFmW6OCabnEVT8nLMsJ
	2IGMFNohsH3L4sEoOVaBGAUcXWHg5B6rSUWHMVbJ8SwUwirkM8wpg8k1RTZ5dj9ts7Ct2fgbFiSo4
	gwRbQ19F4xFcRBbSGNEpzT+uHHarwA9Pbh5HOEGz1pssrgmRDKD+5/YudUKbMIw5uE0vb+EShp4cG
	AWA2lh4Ppq6OWPu4qkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyQDZ-00CW8m-8T; Wed, 30 Jun 2021 02:44:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyQBU-00CVGx-3Z; Wed, 30 Jun 2021 02:42:41 +0000
X-UUID: c6b3a5cf8fa045e2bd1ffb56c4f7ecc9-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Bg4k3E3HrvkWjbI7d/6jt2w9fl4XHvrnMA57HhvotJs=; 
 b=nBv1fOJvKls/knlRRaqNKaE7CBXCQYWK3A5tjjvLwg2t1MwwxRF9UC+FHomeapStJ5+imAGKWkd0x4o9JiqH+sJHhF32uTma0RSxAs3V5H4sldVFUT8H1mDzCsALUFSwUZpSt7mfML+JtEvvJFphlNePxsZbKx0KEtpTHBDwSqw=;
X-UUID: c6b3a5cf8fa045e2bd1ffb56c4f7ecc9-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1124541960; Tue, 29 Jun 2021 19:42:33 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 19:38:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:38:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:38:13 +0800
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
Subject: [PATCH 23/24] iommu/mediatek: Add multi bank support
Date: Wed, 30 Jun 2021 10:35:03 +0800
Message-ID: <20210630023504.18177-24-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630023504.18177-1-yong.wu@mediatek.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_194240_202763_8C3D53FC 
X-CRM114-Status: GOOD (  21.28  )
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

The registers for each bank of the IOMMU base are in order, delta is
0x1000. Initialise the base for each bank.

Meanwhile, Each bank has some independent registers. thus,
backup/restore them for each a bank.

For all the previous SoC, we only have bank0. thus use "do {} while()"
to allow bank0 always go.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 78 +++++++++++++++++++++++++++++----------
 drivers/iommu/mtk_iommu.h |  6 +--
 2 files changed, 61 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e297a50adced..3aaf425d5a18 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -114,6 +114,7 @@
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
 
 #define MTK_PROTECT_PA_ALIGN			256
+#define MTK_IOMMU_BANK_SZ			0x1000
 
 #define PERICFG_IOMMU_1				0x714
 
@@ -925,11 +926,11 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	struct mtk_iommu_data   *data;
 	struct device           *dev = &pdev->dev;
 	struct resource         *res;
-	resource_size_t		ioaddr;
+	resource_size_t		ioaddr, size;
 	struct component_match  *match = NULL;
 	struct regmap		*infracfg;
 	void                    *protect;
-	int                     ret;
+	int                     ret, i = 0;
 	u32			val;
 	char                    *p;
 	struct mtk_iommu_bank_data *bank;
@@ -971,19 +972,30 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	size = resource_size(res);
+	if (size < data->plat_data->bank_nr * MTK_IOMMU_BANK_SZ) {
+		dev_err(dev, "banknr %d. res %pR is not enough.\n",
+			data->plat_data->bank_nr, res);
+		return -EINVAL;
+	}
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 	ioaddr = res->start;
 
-	bank = &data->bank[0];
-	bank->base = base;
-	bank->irq = platform_get_irq(pdev, 0);
-	if (bank->irq < 0)
-		return bank->irq;
-	bank->pdev = dev;
-	bank->pdata = data;
-	spin_lock_init(&bank->tlb_lock);
+	do {
+		if (!data->plat_data->bank_enable[i])
+			continue;
+		bank = &data->bank[i];
+		bank->base = base + i * MTK_IOMMU_BANK_SZ;
+
+		bank->irq = platform_get_irq(pdev, i);
+		if (bank->irq < 0)
+			return bank->irq;
+		bank->pdev = dev;
+		bank->pdata = data;
+		spin_lock_init(&bank->tlb_lock);
+	} while (++i < data->plat_data->bank_nr);
 
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_BCLK)) {
 		data->bclk = devm_clk_get(dev, "bclk");
@@ -1068,7 +1080,9 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 static int mtk_iommu_remove(struct platform_device *pdev)
 {
 	struct mtk_iommu_data *data = platform_get_drvdata(pdev);
-	struct mtk_iommu_bank_data *bank = &data->bank[0];
+	struct mtk_iommu_bank_data *bank;
+	bool bank_hwinit;
+	int i;
 
 	iommu_device_sysfs_remove(&data->iommu);
 	iommu_device_unregister(&data->iommu);
@@ -1080,7 +1094,18 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
 		device_link_remove(data->smicomm_dev, &pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	devm_free_irq(&pdev->dev, bank->irq, bank);
+	for (i = 0; i < data->plat_data->bank_nr; i++) {
+		bank = &data->bank[i];
+		/*
+		 * Use a register value to confirm if this bank HW is initialised.
+		 * If the bank has no consumer, the bank HW still won't be
+		 * initialised even though bank_enable is true.
+		 */
+		bank_hwinit = !!readl_relaxed(bank->base + REG_MMU_PT_BASE_ADDR);
+		if (!bank_hwinit)
+			continue;
+		devm_free_irq(&pdev->dev, bank->irq, bank);
+	}
 	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
 	return 0;
 }
@@ -1090,15 +1115,21 @@ static int __maybe_unused mtk_iommu_runtime_suspend(struct device *dev)
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	void __iomem *base = data->bank[0].base;
+	int i = 0;
 
 	reg->wr_len_ctrl = readl_relaxed(base + REG_MMU_WR_LEN_CTRL);
 	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
 	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
 	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
-	reg->int_control0 = readl_relaxed(base + REG_MMU_INT_CONTROL0);
-	reg->int_main_control = readl_relaxed(base + REG_MMU_INT_MAIN_CONTROL);
-	reg->ivrp_paddr = readl_relaxed(base + REG_MMU_IVRP_PADDR);
 	reg->vld_pa_rng = readl_relaxed(base + REG_MMU_VLD_PA_RNG);
+	do {
+		if (!data->plat_data->bank_enable[i])
+			continue;
+		base = data->bank[i].base;
+		reg->int_control0[i] = readl_relaxed(base + REG_MMU_INT_CONTROL0);
+		reg->int_main_control[i] = readl_relaxed(base + REG_MMU_INT_MAIN_CONTROL);
+		reg->ivrp_paddr[i] = readl_relaxed(base + REG_MMU_IVRP_PADDR);
+	} while (++i < data->plat_data->bank_nr);
 	clk_disable_unprepare(data->bclk);
 	return 0;
 }
@@ -1109,7 +1140,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	struct mtk_iommu_domain *m4u_dom = data->bank[0].m4u_dom;
 	void __iomem *base = data->bank[0].base;
-	int ret;
+	int ret, i = 0;
 
 	ret = clk_prepare_enable(data->bclk);
 	if (ret) {
@@ -1128,11 +1159,18 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
 	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
-	writel_relaxed(reg->int_control0, base + REG_MMU_INT_CONTROL0);
-	writel_relaxed(reg->int_main_control, base + REG_MMU_INT_MAIN_CONTROL);
-	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
 	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
-	writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK, base + REG_MMU_PT_BASE_ADDR);
+	do {
+		if (!data->plat_data->bank_enable[i])
+			continue;
+		base = data->bank[i].base;
+		m4u_dom = data->bank[i].m4u_dom;
+		writel_relaxed(reg->int_control0[i], base + REG_MMU_INT_CONTROL0);
+		writel_relaxed(reg->int_main_control[i], base + REG_MMU_INT_MAIN_CONTROL);
+		writel_relaxed(reg->ivrp_paddr[i], base + REG_MMU_IVRP_PADDR);
+		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
+		       base + REG_MMU_PT_BASE_ADDR);
+	} while (++i < data->plat_data->bank_nr);
 	return 0;
 }
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 8235957f1592..813e60de89d6 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -33,11 +33,11 @@ struct mtk_iommu_suspend_reg {
 	};
 	u32				dcm_dis;
 	u32				ctrl_reg;
-	u32				int_control0;
-	u32				int_main_control;
-	u32				ivrp_paddr;
 	u32				vld_pa_rng;
 	u32				wr_len_ctrl;
+	u32				int_control0[MTK_IOMMU_BANK_MAX];
+	u32				int_main_control[MTK_IOMMU_BANK_MAX];
+	u32				ivrp_paddr[MTK_IOMMU_BANK_MAX];
 };
 
 enum mtk_iommu_plat {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
