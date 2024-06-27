Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E4FC3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 08:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vd35nelk95ZQID3lz3O8zEG2xoX9mGJmCnZv2gHUda4=; b=OyZb73rFwBOFYbSj6M4GNPwN9f
	hBlVnVTwRUzDRPz1TBsReVe2oKOkPr/nL3B7+8fzFiBsjlO44GpHo9kBjhI2JEQJS5jEqu+kkZCJN
	MvkbGN8AH4BC4LkDPBYgCkY38Pf03LRgTOfMxYqObI3Mx2QcPAZihi7DiAzKatzdItpg8/BFoIFzX
	HPQ9m3+qRQCj07bqN+N3SbkuFvetzjqVPA0wKJs/B6lnCOwpTI+celfyVbJGPt1tpRPCbPzO6LgF7
	XvrWfr2ogZnlYV0t6VJb1AuLWEULpqdg0HdSoIPJIxowTVYxsc/ZraH0kXIGSxqPjw01Pt8I+gksr
	cCVd1tXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkGC-00000009hNF-27kk;
	Thu, 27 Jun 2024 08:13:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkFh-00000009h5f-1X9e;
	Thu, 27 Jun 2024 08:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4C7A60C3A;
	Thu, 27 Jun 2024 08:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5D7C2BBFC;
	Thu, 27 Jun 2024 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719475988;
	bh=go47Cz4xvzcztS7P5hMqG62JmV9O+KvOCs7Pbj0m8tQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SfSUpG2N1khjOVgxRsjnJHtms3JPgPnNlmcFYf+o+Bn+dDLTSZUdhBkFlheotz797
	 8hwBlpsTLOpKF2eEpkYt76iVuiSAihDe+3Oqho0gZ4wJ43EnZzdnUFtRPtQ9AgC4i8
	 TURdfOqhN4NjZZY1czKqAOMI0HCvS10wJN/yMmqdRdvmwCMqVGp1845+nZErS0cWh8
	 RnB7CWddzHsHBnMKDsy4PVKf70Oqrr4L8lgXnN900Do5XIYXoU6D+M8qtvvFuhlRyi
	 IdL/5PYEv47yqOi95W53tyazYgOKOsXINH7CiF8shFOgzQYRobKkaSCpQbY5sED/ga
	 L/NitiTPxGpgw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	dd@embedd.com,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v2 3/4] PCI: mediatek-gen3: Rely on reset_bulk APIs for PHY reset lines
Date: Thu, 27 Jun 2024 10:12:13 +0200
Message-ID: <b4603cb7c259d94de5a69508dd2aea46b25e385b.1719475568.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719475568.git.lorenzo@kernel.org>
References: <cover.1719475568.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_011309_591539_5F764669 
X-CRM114-Status: GOOD (  18.09  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use reset_bulk APIs to manage PHY reset lines. This is a preliminary
patch in order to add Airoha EN7581 PCIe support.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 45 +++++++++++++++------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index db0210803731..438a5222d986 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -100,14 +100,21 @@
 #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
+#define MAX_NUM_PHY_RESETS		1
+
 struct mtk_gen3_pcie;
 
 /**
  * struct mtk_gen3_pcie_pdata - differentiate between host generations
  * @power_up: pcie power_up callback
+ * @phy_resets: phy reset lines SoC data.
  */
 struct mtk_gen3_pcie_pdata {
 	int (*power_up)(struct mtk_gen3_pcie *pcie);
+	struct {
+		const char *id[MAX_NUM_PHY_RESETS];
+		int num_resets;
+	} phy_resets;
 };
 
 /**
@@ -128,7 +135,7 @@ struct mtk_msi_set {
  * @base: IO mapped register base
  * @reg_base: physical register base
  * @mac_reset: MAC reset control
- * @phy_reset: PHY reset control
+ * @phy_resets: PHY reset controllers
  * @phy: PHY controller block
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
@@ -148,7 +155,7 @@ struct mtk_gen3_pcie {
 	void __iomem *base;
 	phys_addr_t reg_base;
 	struct reset_control *mac_reset;
-	struct reset_control *phy_reset;
+	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -788,10 +795,10 @@ static int mtk_pcie_setup_irq(struct mtk_gen3_pcie *pcie)
 
 static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 {
+	int i, ret, num_resets = pcie->soc->phy_resets.num_resets;
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *regs;
-	int ret;
 
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
 	if (!regs)
@@ -804,12 +811,12 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 
 	pcie->reg_base = regs->start;
 
-	pcie->phy_reset = devm_reset_control_get_optional_exclusive(dev, "phy");
-	if (IS_ERR(pcie->phy_reset)) {
-		ret = PTR_ERR(pcie->phy_reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get PHY reset\n");
+	for (i = 0; i < num_resets; i++)
+		pcie->phy_resets[i].id = pcie->soc->phy_resets.id[i];
 
+	ret = devm_reset_control_bulk_get_optional_shared(dev, num_resets, pcie->phy_resets);
+	if (ret) {
+		dev_err(dev, "failed to get PHY bulk reset\n");
 		return ret;
 	}
 
@@ -846,7 +853,11 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 	int err;
 
 	/* PHY power on and enable pipe clock */
-	reset_control_deassert(pcie->phy_reset);
+	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
+	if (err) {
+		dev_err(dev, "failed to deassert PHYs\n");
+		return err;
+	}
 
 	err = phy_init(pcie->phy);
 	if (err) {
@@ -882,7 +893,7 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 err_phy_on:
 	phy_exit(pcie->phy);
 err_phy_init:
-	reset_control_assert(pcie->phy_reset);
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 
 	return err;
 }
@@ -897,7 +908,7 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
-	reset_control_assert(pcie->phy_reset);
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 }
 
 static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
@@ -908,11 +919,17 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	if (err)
 		return err;
 
+	/*
+	 * Deassert the line in order to avoid unbalance in deassert_count
+	 * counter since the bulk is shared.
+	 */
+	reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
 	/*
 	 * The controller may have been left out of reset by the bootloader
 	 * so make sure that we get a clean start by asserting resets here.
 	 */
-	reset_control_assert(pcie->phy_reset);
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
+
 	reset_control_assert(pcie->mac_reset);
 	usleep_range(10, 20);
 
@@ -1090,6 +1107,10 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 
 static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
 	.power_up = mtk_pcie_power_up,
+	.phy_resets = {
+		.id[0] = "phy",
+		.num_resets = 1,
+	},
 };
 
 static const struct of_device_id mtk_pcie_of_match[] = {
-- 
2.45.2


