Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD7EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xM1WgSTOOKZlmNF1QN5B7mb5hvSJoWdyf47jQ/y6FvU=; b=TlCi5NPvJhxmbM
	HUBbitIKx6pzE5YkdbYQpQSrIoOgIk6KhaPrDVavdxND4DVdVMqA7ZKav2aMZCtR3ggRSlTyrnfh6
	5bK5USnwW76CMUu2Nzb/FUbpOH2JIPXlKiZj7riNG48tNS8lm/Mrx4r3Y2GACYiZU22H+6ZvUK2s4
	m1dqnDa5cuXp8E6C1OVzjBn86wzavqwwiAeEBA29HFC3kCvR1GIu7AcY+/CcUEvP+496cLz7CXjs9
	dj1IF5+FtcwFJ/LYKLadeztpoizUR1O5nNN6bGVHXHL5ZiznsdGMkaOEDWHi6zSaYYakxMtTbSw0W
	yMLOiGxRAnBIiK1ql5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTgL8-004apF-4y; Mon, 14 Mar 2022 08:46:06 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTgJU-004a28-F1; Mon, 14 Mar 2022 08:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ry68J2zPgq5F1XRK8KH8jYZ05UngqdEx6tNuXUys8kA=; b=KusczUhKtqd7HnIkHuKZGPvGCA
 QTy3T0nmpuqLyZ6NAH3EG6tdBShr+wgOYxAn13Rx8tei8Zw33TbhAW0wo+LTPa12ACEPD3ImhcqkL
 6XJp2qIyU6LHkAiiS/gTE5XIzbOWbvHz+qJn/t4PuOBMQlqn59WA2t1ocC6i8VrOrxQU=;
Received: from p200300daa7204f006c015a90d6b6c4d6.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:6c01:5a90:d6b6:c4d6] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nTgJQ-0002UN-At; Mon, 14 Mar 2022 09:44:20 +0100
From: Felix Fietkau <nbd@nbd.name>
To: soc@kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v10 2/6] clk: en7523: Add clock driver for Airoha EN7523 SoC
Date: Mon, 14 Mar 2022 09:44:04 +0100
Message-Id: <20220314084409.84394-3-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314084409.84394-1-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_014424_742668_B872E6EC 
X-CRM114-Status: GOOD (  23.93  )
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

This driver only registers fixed rate clocks, since the clocks are fully
initialized by the boot loader and should not be changed later, according
to Airoha.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/clk/Kconfig      |   9 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-en7523.c | 351 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 361 insertions(+)
 create mode 100644 drivers/clk/clk-en7523.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index ad4256d54361..4765e4c6f2a1 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -200,6 +200,15 @@ config COMMON_CLK_CS2000_CP
 	help
 	  If you say yes here you get support for the CS2000 clock multiplier.
 
+config COMMON_CLK_EN7523
+	bool "Clock driver for Airoha EN7523 SoC system clocks"
+	depends on OF
+	depends on ARCH_AIROHA || COMPILE_TEST
+	default ARCH_AIROHA
+	help
+	  This driver provides the fixed clocks and gates present on Airoha
+	  ARM silicon.
+
 config COMMON_CLK_FSL_FLEXSPI
 	tristate "Clock driver for FlexSPI on Layerscape SoCs"
 	depends on ARCH_LAYERSCAPE || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 16e588630472..da8dd3ab304f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
 obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
+obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
 obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
 obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
new file mode 100644
index 000000000000..076a70c2e173
--- /dev/null
+++ b/drivers/clk/clk-en7523.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/delay.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/en7523-clk.h>
+
+#define REG_PCI_CONTROL			0x88
+#define   REG_PCI_CONTROL_PERSTOUT	BIT(29)
+#define   REG_PCI_CONTROL_PERSTOUT1	BIT(26)
+#define   REG_PCI_CONTROL_REFCLK_EN1	BIT(22)
+#define REG_GSW_CLK_DIV_SEL		0x1b4
+#define REG_EMI_CLK_DIV_SEL		0x1b8
+#define REG_BUS_CLK_DIV_SEL		0x1bc
+#define REG_SPI_CLK_DIV_SEL		0x1c4
+#define REG_SPI_CLK_FREQ_SEL		0x1c8
+#define REG_NPU_CLK_DIV_SEL		0x1fc
+#define REG_CRYPTO_CLKSRC		0x200
+#define REG_RESET_CONTROL		0x834
+#define   REG_RESET_CONTROL_PCIEHB	BIT(29)
+#define   REG_RESET_CONTROL_PCIE1	BIT(27)
+#define   REG_RESET_CONTROL_PCIE2	BIT(26)
+
+struct en_clk_desc {
+	int id;
+	const char *name;
+	u32 base_reg;
+	u8 base_bits;
+	u8 base_shift;
+	union {
+		const unsigned int *base_values;
+		unsigned int base_value;
+	};
+	size_t n_base_values;
+
+	u16 div_reg;
+	u8 div_bits;
+	u8 div_shift;
+	u16 div_val0;
+	u8 div_step;
+};
+
+struct en_clk_gate {
+	void __iomem *base;
+	struct clk_hw hw;
+};
+
+static const u32 gsw_base[] = { 400000000, 500000000 };
+static const u32 emi_base[] = { 333000000, 400000000 };
+static const u32 bus_base[] = { 500000000, 540000000 };
+static const u32 slic_base[] = { 100000000, 3125000 };
+static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
+
+static const struct en_clk_desc en7523_base_clks[] = {
+	{
+		.id = EN7523_CLK_GSW,
+		.name = "gsw",
+
+		.base_reg = REG_GSW_CLK_DIV_SEL,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = gsw_base,
+		.n_base_values = ARRAY_SIZE(gsw_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+	}, {
+		.id = EN7523_CLK_EMI,
+		.name = "emi",
+
+		.base_reg = REG_EMI_CLK_DIV_SEL,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = emi_base,
+		.n_base_values = ARRAY_SIZE(emi_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+	}, {
+		.id = EN7523_CLK_BUS,
+		.name = "bus",
+
+		.base_reg = REG_BUS_CLK_DIV_SEL,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = bus_base,
+		.n_base_values = ARRAY_SIZE(bus_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+	}, {
+		.id = EN7523_CLK_SLIC,
+		.name = "slic",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = slic_base,
+		.n_base_values = ARRAY_SIZE(slic_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 24,
+		.div_val0 = 20,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_SPI,
+		.name = "spi",
+
+		.base_reg = REG_SPI_CLK_DIV_SEL,
+
+		.base_value = 400000000,
+
+		.div_bits = 5,
+		.div_shift = 8,
+		.div_val0 = 40,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_NPU,
+		.name = "npu",
+
+		.base_reg = REG_NPU_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = npu_base,
+		.n_base_values = ARRAY_SIZE(npu_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+	}, {
+		.id = EN7523_CLK_CRYPTO,
+		.name = "crypto",
+
+		.base_reg = REG_CRYPTO_CLKSRC,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = emi_base,
+		.n_base_values = ARRAY_SIZE(emi_base),
+	}
+};
+
+static const struct of_device_id of_match_clk_en7523[] = {
+	{ .compatible = "airoha,en7523-scu", },
+	{ /* sentinel */ }
+};
+
+static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
+{
+	const struct en_clk_desc *desc = &en7523_base_clks[i];
+	u32 val;
+
+	if (!desc->base_bits)
+		return desc->base_value;
+
+	val = readl(base + desc->base_reg);
+	val >>= desc->base_shift;
+	val &= (1 << desc->base_bits) - 1;
+
+	if (val >= desc->n_base_values)
+		return 0;
+
+	return desc->base_values[val];
+}
+
+static u32 en7523_get_div(void __iomem *base, int i)
+{
+	const struct en_clk_desc *desc = &en7523_base_clks[i];
+	u32 reg, val;
+
+	if (!desc->div_bits)
+		return 1;
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	val = readl(base + reg);
+	val >>= desc->div_shift;
+	val &= (1 << desc->div_bits) - 1;
+
+	if (!val && desc->div_val0)
+		return desc->div_val0;
+
+	return (val + 1) * desc->div_step;
+}
+
+static int en7523_pci_is_enabled(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+
+	return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REFCLK_EN1);
+}
+
+static int en7523_pci_prepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	void __iomem *np_base = cg->base;
+	u32 val, mask;
+
+	/* Need to pull device low before reset */
+	val = readl(np_base + REG_PCI_CONTROL);
+	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
+	writel(val, np_base + REG_PCI_CONTROL);
+	usleep_range(1000, 2000);
+
+	/* Enable PCIe port 1 */
+	val |= REG_PCI_CONTROL_REFCLK_EN1;
+	writel(val, np_base + REG_PCI_CONTROL);
+	usleep_range(1000, 2000);
+
+	/* Reset to default */
+	val = readl(np_base + REG_RESET_CONTROL);
+	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
+	       REG_RESET_CONTROL_PCIEHB;
+	writel(val & ~mask, np_base + REG_RESET_CONTROL);
+	usleep_range(1000, 2000);
+	writel(val | mask, np_base + REG_RESET_CONTROL);
+	msleep(100);
+	writel(val & ~mask, np_base + REG_RESET_CONTROL);
+	usleep_range(5000, 10000);
+
+	/* Release device */
+	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
+	val = readl(np_base + REG_PCI_CONTROL);
+	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	usleep_range(1000, 2000);
+	writel(val | mask, np_base + REG_PCI_CONTROL);
+	msleep(250);
+
+	return 0;
+}
+
+static void en7523_pci_unprepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	void __iomem *np_base = cg->base;
+	u32 val;
+
+	val = readl(np_base + REG_PCI_CONTROL);
+	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
+	writel(val, np_base + REG_PCI_CONTROL);
+}
+
+static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
+					       void __iomem *np_base)
+{
+	static const struct clk_ops pcie_gate_ops = {
+		.is_enabled = en7523_pci_is_enabled,
+		.prepare = en7523_pci_prepare,
+		.unprepare = en7523_pci_unprepare,
+	};
+	struct clk_init_data init = {
+		.name = "pcie",
+		.ops = &pcie_gate_ops,
+	};
+	struct en_clk_gate *cg;
+
+	cg = devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
+	if (!cg)
+		return NULL;
+
+	cg->base = np_base;
+	cg->hw.init = &init;
+	en7523_pci_unprepare(&cg->hw);
+
+	if (clk_hw_register(dev, &cg->hw))
+		return NULL;
+
+	return &cg->hw;
+}
+
+static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
+				   void __iomem *base, void __iomem *np_base)
+{
+	struct clk_hw *hw;
+	u32 rate;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
+		const struct en_clk_desc *desc = &en7523_base_clks[i];
+
+		rate = en7523_get_base_rate(base, i);
+		rate /= en7523_get_div(base, i);
+
+		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			continue;
+		}
+
+		clk_data->hws[desc->id] = hw;
+	}
+
+	hw = en7523_register_pcie_clk(dev, np_base);
+	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	clk_data->num = EN7523_NUM_CLOCKS;
+}
+
+static int en7523_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data;
+	void __iomem *base, *np_base;
+	int r;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	np_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(base))
+		return PTR_ERR(np_base);
+
+	clk_data = devm_kzalloc(&pdev->dev,
+				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r)
+		dev_err(&pdev->dev,
+			"could not register clock provider: %s: %d\n",
+			pdev->name, r);
+
+	return r;
+}
+
+static struct platform_driver clk_en7523_drv = {
+	.probe = en7523_clk_probe,
+	.driver = {
+		.name = "clk-en7523",
+		.of_match_table = of_match_clk_en7523,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init clk_en7523_init(void)
+{
+	return platform_driver_register(&clk_en7523_drv);
+}
+
+arch_initcall(clk_en7523_init);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
