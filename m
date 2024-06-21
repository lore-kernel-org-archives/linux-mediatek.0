Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA03C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEWgrHE8+kkC7RaWyQH0DKc69SirXXQDH93s2tukjko=; b=TjGu+ZJ42eTVfPlqqFvDyBzfsk
	p64jwVuHuf8jFwOD5txDv+6RVWJUx46JvL23RTSMKcjmGGU9mlYN+Ug+o5rCEEQgxBQPrpgYwYgCi
	29YuiMcmSfN+WLx7BVahiDE9rVgBqBi9K40Q6xTNy4DEzkrxCy/UB8AOyhtysV3SKam6kQXNJ8ZOl
	xpaGNrpJzDOkJNz+SJyxi6Zn7wLD8Sze4FPweqgjP8n9J8V/2dEvC5BbMZEVssQRc5QS0hfMzSTWu
	LXrzB7RABx5u+Bjn2YIg3JzfE9A/XhoutKi5BwqigG8/8uVbTVwVPZjSqDCbvRDkXBUi1NrwItk7w
	vqZdnwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfa2-00000009aXZ-35YB;
	Fri, 21 Jun 2024 14:49:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfZu-00000009aQy-1mPJ;
	Fri, 21 Jun 2024 14:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C06E96178D;
	Fri, 21 Jun 2024 14:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B49C2BBFC;
	Fri, 21 Jun 2024 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718981365;
	bh=3VLI8OQdCKrhE9tY0hosw/h2d6zYp15wqf38orILu+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gf1Lt1AVeQliImIOvD9+SbH6NUZx3gtZLg0AQrcNKq/lpAHLJ4th+RX5B9U9+ChnY
	 4abQlcJcDGhNOINIxZEndckSCU001V4z33j2tqF9skMpTkrvC62AyDYIUErf6ioAt1
	 csJ7VA77Ptw5Y9yxAAoyqCP8SH6xzhGyNilDzxjKtApJanwkc0uNiD0LYdyT/AnyTO
	 LynQ4KbKpY8gvaoHz8pjxDXDkbw9JhylakSXZKvIl0KAHGl0oVKf2JdLzx8ZoS012C
	 AF+9WGM9xDjzREfE31d+/CezPMz98gRqvmQJFR4Sewh3t7PSjB/dOF7S62Lxh3eccl
	 GfP72lVnlwy1Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
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
Subject: [PATCH 3/4] PCI: mediatek-gen3: rely on reset_bulk APIs for phy reset lines
Date: Fri, 21 Jun 2024 16:48:49 +0200
Message-ID: <e8ab615a56759a4832833211257d83f56bf64303.1718980864.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718980864.git.lorenzo@kernel.org>
References: <cover.1718980864.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_074926_629931_91634534 
X-CRM114-Status: GOOD (  17.30  )
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

Use reset_bulk APIs to manage phy reset lines. This is a preliminary
patch in order to add Airoha EN7581 pcie support.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 49 ++++++++++++++++-----
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 4859bd875bc4..9842617795a9 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -100,14 +100,21 @@
 #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
+#define MAX_NUM_PHY_RSTS		1
+
 struct mtk_gen3_pcie;
 
 /**
  * struct mtk_pcie_soc - differentiate between host generations
  * @power_up: pcie power_up callback
+ * @phy_resets: phy reset lines SoC data.
  */
 struct mtk_pcie_soc {
 	int (*power_up)(struct mtk_gen3_pcie *pcie);
+	struct {
+		const char *id[MAX_NUM_PHY_RSTS];
+		int num_rsts;
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
+	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RSTS];
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -790,8 +797,8 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	int i, ret, num_rsts = pcie->soc->phy_resets.num_rsts;
 	struct resource *regs;
-	int ret;
 
 	regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pcie-mac");
 	if (!regs)
@@ -804,12 +811,13 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 
 	pcie->reg_base = regs->start;
 
-	pcie->phy_reset = devm_reset_control_get_optional_exclusive(dev, "phy");
-	if (IS_ERR(pcie->phy_reset)) {
-		ret = PTR_ERR(pcie->phy_reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get PHY reset\n");
+	for (i = 0; i < num_rsts; i++)
+		pcie->phy_resets[i].id = pcie->soc->phy_resets.id[i];
 
+	ret = devm_reset_control_bulk_get_optional_shared(dev, num_rsts,
+							  pcie->phy_resets);
+	if (ret) {
+		dev_err(dev, "failed to get PHY bulk reset\n");
 		return ret;
 	}
 
@@ -846,7 +854,12 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 	int err;
 
 	/* PHY power on and enable pipe clock */
-	reset_control_deassert(pcie->phy_reset);
+	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_rsts,
+					  pcie->phy_resets);
+	if (err) {
+		dev_err(dev, "failed to deassert PHYs\n");
+		return err;
+	}
 
 	err = phy_init(pcie->phy);
 	if (err) {
@@ -882,7 +895,8 @@ static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 err_phy_on:
 	phy_exit(pcie->phy);
 err_phy_init:
-	reset_control_assert(pcie->phy_reset);
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
+				  pcie->phy_resets);
 
 	return err;
 }
@@ -897,7 +911,8 @@ static void mtk_pcie_power_down(struct mtk_gen3_pcie *pcie)
 
 	phy_power_off(pcie->phy);
 	phy_exit(pcie->phy);
-	reset_control_assert(pcie->phy_reset);
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
+				  pcie->phy_resets);
 }
 
 static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
@@ -912,7 +927,13 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	 * The controller may have been left out of reset by the bootloader
 	 * so make sure that we get a clean start by asserting resets here.
 	 */
-	reset_control_assert(pcie->phy_reset);
+	reset_control_bulk_deassert(pcie->soc->phy_resets.num_rsts,
+				    pcie->phy_resets);
+	usleep_range(5000, 10000);
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_rsts,
+				  pcie->phy_resets);
+	msleep(100);
+
 	reset_control_assert(pcie->mac_reset);
 	usleep_range(10, 20);
 
@@ -1090,6 +1111,10 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 
 static const struct mtk_pcie_soc mtk_pcie_soc_mt8192 = {
 	.power_up = mtk_pcie_power_up,
+	.phy_resets = {
+		.id[0] = "phy",
+		.num_rsts = 1,
+	},
 };
 
 static const struct of_device_id mtk_pcie_of_match[] = {
-- 
2.45.2


