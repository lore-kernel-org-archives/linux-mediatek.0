Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BF0C30659
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NH13tUlBblLmsJ51/ZgvFeOfzVDEqDTmpAUbeCMCmJ4=; b=3TYskmFwV1gNO5vOILbxSAM5OG
	UGXaese10q6BDKwrQRDfpPJIVRMyv8wT8v0Y9z9lJF81ltzYw9olfxNwUnfVZEf3iSkhj9gbDNA+6
	GpnZmseMZmKI2O6QIltoeX7psRhuqEoHvir58jSIdRacBtl/yF/3nwBgojQoYNp3HLQalCRFK2nlb
	Vq7jXvskct5CJ16X4DxD1BveErpZ1VwAFEzKHuq9I+uVVjoAOZrFCj8nlVsLLMp4RwMDOu6Lu8+fW
	O1U/cO9RmMOeH8dC8dkHJXtMDJTp3ayGS2pyqpTBxnkIXvefJGRG0RwB/2QL1Nm0SmKVHk6jgXfmX
	amLVthuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYW4-0000000GU7F-10O1;
	Sat, 29 Jun 2024 13:53:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYVc-0000000GTt8-26aA;
	Sat, 29 Jun 2024 13:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74D16CE131B;
	Sat, 29 Jun 2024 13:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7CBC2BD10;
	Sat, 29 Jun 2024 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719669173;
	bh=ATnQSVSyLUQZP2TKfZFXw4EXHt1g8vtyQpeI47cw7Ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xbl30KnNPSLpCf/2/oRlj/X6cZ+lCsl65iO1DiHYBHUCq02lXCRpZQ/pjLR+JVyu2
	 5XYcQOOh1hAMWZr9tdSMsh4HDU77EWwSrwrcdNTyv48q+euK+QXy5KiXfq1irTTMez
	 SCrQv3j8akmrn7ndW8uXIBexApDb7iIdAKPs3cVED6Do9Nkov/mQOCcCzbwm+tCxTt
	 4rQ1Vv69ugSMviLdvZpnZNjAeLn0kEwJAB25uzr4WK+m+AGN0HEnRxapHBoCVG74SS
	 rKRt0hhBUSiOSKOVmrNhIWMgLfoVvn23jqVBYmKMphIR3eJC7NvIq8D57Z7wlJGyGs
	 NCNeDLvR5nu/A==
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
Subject: [PATCH v3 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Date: Sat, 29 Jun 2024 15:51:54 +0200
Message-ID: <27d28fabbf761e7a38bc6c8371234bf6a6462473.1719668763.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719668763.git.lorenzo@kernel.org>
References: <cover.1719668763.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_065256_928669_57DC803B 
X-CRM114-Status: GOOD (  16.68  )
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

Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
PCIe controller driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pci/controller/Kconfig              |   2 +-
 drivers/pci/controller/pcie-mediatek-gen3.c | 108 +++++++++++++++++++-
 2 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index e534c02ee34f..3bd6c9430010 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -196,7 +196,7 @@ config PCIE_MEDIATEK
 
 config PCIE_MEDIATEK_GEN3
 	tristate "MediaTek Gen3 PCIe controller"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on PCI_MSI
 	help
 	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 438a5222d986..f3f76d1bfd4c 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
@@ -15,6 +16,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/of_device.h>
+#include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -29,6 +32,12 @@
 #define PCI_CLASS(class)		(class << 8)
 #define PCIE_RC_MODE			BIT(0)
 
+#define PCIE_EQ_PRESET_01_REG		0x100
+#define PCIE_VAL_LN0_DOWNSTREAM		GENMASK(6, 0)
+#define PCIE_VAL_LN0_UPSTREAM		GENMASK(14, 8)
+#define PCIE_VAL_LN1_DOWNSTREAM		GENMASK(22, 16)
+#define PCIE_VAL_LN1_UPSTREAM		GENMASK(30, 24)
+
 #define PCIE_CFGNUM_REG			0x140
 #define PCIE_CFG_DEVFN(devfn)		((devfn) & GENMASK(7, 0))
 #define PCIE_CFG_BUS(bus)		(((bus) << 8) & GENMASK(15, 8))
@@ -68,6 +77,14 @@
 #define PCIE_MSI_SET_ENABLE_REG		0x190
 #define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
 
+#define PCIE_PIPE4_PIE8_REG		0x338
+#define PCIE_K_FINETUNE_MAX		GENMASK(5, 0)
+#define PCIE_K_FINETUNE_ERR		GENMASK(7, 6)
+#define PCIE_K_PRESET_TO_USE		GENMASK(18, 8)
+#define PCIE_K_PHYPARAM_QUERY		BIT(19)
+#define PCIE_K_QUERY_TIMEOUT		BIT(20)
+#define PCIE_K_PRESET_TO_USE_16G	GENMASK(31, 21)
+
 #define PCIE_MSI_SET_BASE_REG		0xc00
 #define PCIE_MSI_SET_OFFSET		0x10
 #define PCIE_MSI_SET_STATUS_OFFSET	0x04
@@ -100,7 +117,13 @@
 #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
-#define MAX_NUM_PHY_RESETS		1
+#define MAX_NUM_PHY_RESETS		3
+
+/* EN7581 */
+/* PCIe-PHY initialization delay in ms */
+#define PHY_INIT_TIME_MS		30
+/* PCIe reset line delay in ms */
+#define PCIE_RESET_TIME_MS		100
 
 struct mtk_gen3_pcie;
 
@@ -847,6 +870,78 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	return 0;
 }
 
+static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	int err;
+	u32 val;
+
+	/* Wait for bulk assert completion in mtk_pcie_setup */
+	mdelay(PCIE_RESET_TIME_MS);
+
+	err = phy_init(pcie->phy);
+	if (err) {
+		dev_err(dev, "failed to initialize PHY\n");
+		return err;
+	}
+	mdelay(PHY_INIT_TIME_MS);
+
+	err = phy_power_on(pcie->phy);
+	if (err) {
+		dev_err(dev, "failed to power on PHY\n");
+		goto err_phy_on;
+	}
+
+	err = reset_control_bulk_deassert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
+	if (err) {
+		dev_err(dev, "failed to deassert PHYs\n");
+		goto err_phy_deassert;
+	}
+	mdelay(PCIE_RESET_TIME_MS);
+
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	err = clk_bulk_prepare(pcie->num_clks, pcie->clks);
+	if (err) {
+		dev_err(dev, "failed to prepare clock\n");
+		goto err_clk_prepare;
+	}
+
+	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
+	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
+	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
+	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
+	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
+
+	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
+	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
+	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
+	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
+	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
+
+	err = clk_bulk_enable(pcie->num_clks, pcie->clks);
+	if (err) {
+		dev_err(dev, "failed to prepare clock\n");
+		goto err_clk_enable;
+	}
+
+	return 0;
+
+err_clk_enable:
+	clk_bulk_unprepare(pcie->num_clks, pcie->clks);
+err_clk_prepare:
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets, pcie->phy_resets);
+err_phy_deassert:
+	phy_power_off(pcie->phy);
+err_phy_on:
+	phy_exit(pcie->phy);
+
+	return err;
+}
+
 static int mtk_pcie_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
@@ -1113,7 +1208,18 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
 	},
 };
 
+static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_en7581 = {
+	.power_up = mtk_pcie_en7581_power_up,
+	.phy_resets = {
+		.id[0] = "phy-lane0",
+		.id[1] = "phy-lane1",
+		.id[2] = "phy-lane2",
+		.num_resets = 3,
+	},
+};
+
 static const struct of_device_id mtk_pcie_of_match[] = {
+	{ .compatible = "airoha,en7581-pcie", .data = &mtk_pcie_soc_en7581 },
 	{ .compatible = "mediatek,mt8192-pcie", .data = &mtk_pcie_soc_mt8192 },
 	{},
 };
-- 
2.45.2


