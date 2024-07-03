Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ADAC2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGouFPeokm8+pruSXYjHRRldr4br6ATwtmSfdylgByQ=; b=EjBysom0k8HdMtsth1f5zMQrvh
	E5yq0OE52Hnalk2r77z6NDxGds2KK/w210OXBOX4dx9QCHg1JVgWBHulEhLR1kEenjH4TX/Ouf/eg
	Kjra5Ug21umKmXyFyqGTWYu9+vA37y7spk6izPwSqV3DYg9+UCzrt4m42EDyvKVhLp+vB8L8SCFX7
	9x4soObVhJzROpytDJerTUvJk9ZDZrzRAgY9NYjmgGy39EkC96WaCP6pTYpFuN5E+FHae2ep76WtM
	KEoYDMiCJlGtqJ7BW1eN+lY0gjn2LmSZAeZe/YRtit04Q8nvQJ5ug6DGG/4D2c5MrG7H93kJ5UuGU
	GGvC1+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2cR-0000000Aos8-1ikX;
	Wed, 03 Jul 2024 16:14:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2bo-0000000AoZd-2OmH;
	Wed, 03 Jul 2024 16:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EB4A6231E;
	Wed,  3 Jul 2024 16:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3CCC2BD10;
	Wed,  3 Jul 2024 16:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720023207;
	bh=2kv4sb7mNBQhVZyOzBgcNlJaBqyayPbSv5J7reIf1LM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sdHCiaJ1F4Hmys8ywmKLipZkVKixxTiRlGeJphw5xkn/zz36QzNllSNoWiQbNAn+3
	 t7Cc8cUUt2TmaW9Ud9kX21HJsEb/nBsdDNjLJPDdar80eosU0EXoCm1EU5g/mMalHI
	 3oN51v4mkbk7oUvs2fQkxIkvDJSpW7AnH4BhcGRQeKEjNyFWdbU5COolSQQMUoo32R
	 Bfd1j6nvSUMHaDGJSe5AOHhhWsN94GSJA5kSWn3hXxqJS3I3YYaAG2sz7KYIe+plKX
	 XoPBO0M2tmnttoQSIq3Q/LMfAf97WzQCKapiD0DEjn3+YCG6xFsyvnU0HXZD9xcLcv
	 d6gcgwau9QJ4w==
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
Subject: [PATCH v4 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Date: Wed,  3 Jul 2024 18:12:44 +0200
Message-ID: <aca00bd672ee576ad96d279414fc0835ff31f637.1720022580.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720022580.git.lorenzo@kernel.org>
References: <cover.1720022580.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_091328_768917_5184AAB1 
X-CRM114-Status: GOOD (  18.51  )
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
 drivers/pci/controller/pcie-mediatek-gen3.c | 113 +++++++++++++++++++-
 2 files changed, 113 insertions(+), 2 deletions(-)

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
index 438a5222d986..e064f467ced6 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -6,7 +6,9 @@
  * Author: Jianjun Wang <jianjun.wang@mediatek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
@@ -15,6 +17,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/of_device.h>
+#include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -29,6 +33,12 @@
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
@@ -68,6 +78,14 @@
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
@@ -100,7 +118,10 @@
 #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
-#define MAX_NUM_PHY_RESETS		1
+#define MAX_NUM_PHY_RESETS		3
+
+/* Time in ms needed to complete PCIe reset on EN7581 SoC */
+#define PCIE_EN7581_RESET_TIME_MS	100
 
 struct mtk_gen3_pcie;
 
@@ -847,6 +868,85 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	return 0;
 }
 
+static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	int err;
+	u32 val;
+
+	/*
+	 * Wait for the time needed to complete the bulk assert in
+	 * mtk_pcie_setup for EN7581 SoC.
+	 */
+	mdelay(PCIE_EN7581_RESET_TIME_MS);
+
+	err = phy_init(pcie->phy);
+	if (err) {
+		dev_err(dev, "failed to initialize PHY\n");
+		return err;
+	}
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
+
+	/*
+	 * Wait for the time needed to complete the bulk de-assert above.
+	 * This time is specific for EN7581 SoC.
+	 */
+	mdelay(PCIE_EN7581_RESET_TIME_MS);
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
@@ -1113,7 +1213,18 @@ static const struct mtk_gen3_pcie_pdata mtk_pcie_soc_mt8192 = {
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


