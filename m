Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58D2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 00:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQBv4A1bGVSQAw9Vy1kvdMTmYa+llPxj8rr0JfItmME=; b=NDhGjI0aHph8YJ
	bJpLIVHUq98J9CekJUaqB7KSXOapE6mDxgMshEepvJxXx8n14Iy6DHNePkcviZSvJuKplHO/N+5lq
	QP+rDLtbpBoODX3KG0VGN6NqtrAeeJCfgtKk6gmIZv3LLtx/9p+FiEFWXyiZkMMV11YgjBvxq64cp
	5rXQOwhMBLaDDgg64EHwEm78msfKDqVrB5HS9CLY0oagsYZZd1B7/ZZOVAjLdenJGc5TDT2UBnRga
	tbeLT6uKfXqeiP8Rntxv4uPFkR52kyhJ21BfPOqZkM9+LZ7oRu99K2kVBMMw1eVE2ujaqT8bpxc4K
	uJqwH25fv6cT++MLpVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSTRY-00EROY-0L; Fri, 11 Mar 2022 00:47:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSTRK-00ERNK-EF; Fri, 11 Mar 2022 00:47:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48A7861DEC;
 Fri, 11 Mar 2022 00:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F7BC340E8;
 Fri, 11 Mar 2022 00:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646959648;
 bh=SV+4IXZPAVwcqKilJcp3l84Me/Nm3Q8asnC4wjZcNvA=;
 h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
 b=ASbSj8CpUkxxlxLc+MQKVUZt2ikis2ahqq+bBsJEOr/MNHh/p7qIJ5DV1S3JusyJf
 SSV/VvvfEzqWzHuePV7DTHAKD0RB2CsJ0XlhqBfOlXnmq+ZZTNuTswLe+5W9ngYAQd
 LhNNCijpQvw1LjP7CRoPpwrRPQV0gKjzAYgZA0pvDqt1RnN6/l7blOtHTmCUeJV93+
 Ton1e8Lo0ov4986LdL7wFmhP00MgE79EQ5KVimjIZEApn225H4c6ukVLWcl9XMCDh0
 CdLqbEX1m3MhN/FZtn1HccJHUXar00rk7mgzJ5A/rQD60B/tLVCIQNelQDmuXQrLla
 bHYwSPdJoMprA==
MIME-Version: 1.0
In-Reply-To: <20220130145116.88406-7-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
 <20220130145116.88406-7-nbd@nbd.name>
Subject: Re: [PATCH v9 06/13] clk: en7523: Add clock driver for Airoha EN7523
 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 10 Mar 2022 16:47:26 -0800
User-Agent: alot/0.10
Message-Id: <20220311004728.A0F7BC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_164730_610344_45BE5F56 
X-CRM114-Status: GOOD (  22.31  )
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

Quoting Felix Fietkau (2022-01-30 06:51:09)
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> new file mode 100644
> index 000000000000..137e13520ad9
> --- /dev/null
> +++ b/drivers/clk/clk-en7523.c
> @@ -0,0 +1,350 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/delay.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/en7523-clk.h>
> +
> +#define REG_PCI_CONTROL                        0x88
> +#define   REG_PCI_CONTROL_PERSTOUT     BIT(29)
> +#define   REG_PCI_CONTROL_PERSTOUT1    BIT(26)
> +#define   REG_PCI_CONTROL_REFCLK_EN1   BIT(22)
> +#define REG_GSW_CLK_DIV_SEL            0x1b4
> +#define REG_EMI_CLK_DIV_SEL            0x1b8
> +#define REG_BUS_CLK_DIV_SEL            0x1bc
> +#define REG_SPI_CLK_DIV_SEL            0x1c4
> +#define REG_SPI_CLK_FREQ_SEL           0x1c8
> +#define REG_NPU_CLK_DIV_SEL            0x1fc
> +#define REG_CRYPTO_CLKSRC              0x200
> +#define REG_RESET_CONTROL              0x834
> +#define   REG_RESET_CONTROL_PCIEHB     BIT(29)
> +#define   REG_RESET_CONTROL_PCIE1      BIT(27)
> +#define   REG_RESET_CONTROL_PCIE2      BIT(26)
> +
> +struct en_clk_desc {
> +       int id;
> +       const char *name;
> +       u32 base_reg;
> +       u32 base_bits;
> +       u32 base_shift;
> +       union {
> +               const u32 *base_values;
> +               u32 base_value;

Just use unsigned int?

> +       };
> +       int n_base_values;

size_t?

> +
> +       u32 div_reg;

u16?

> +       u32 div_bits;

u8?

> +       u32 div_shift;

u8?

> +       u32 div_val0;
> +       u32 div_step;

u8?

> +};
> +
> +struct en_clk_gate {
> +       void __iomem *base;
> +       struct clk_hw hw;
> +};
> +
> +static const u32 gsw_base[] = { 400000000, 500000000 };
> +static const u32 emi_base[] = { 333000000, 400000000 };
> +static const u32 bus_base[] = { 500000000, 540000000 };
> +static const u32 slic_base[] = { 100000000, 3125000 };
> +static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
> +
> +static const struct en_clk_desc en7523_base_clks[] = {
> +       {
> +               .id = EN7523_CLK_GSW,
> +               .name = "gsw",
> +
> +               .base_reg = REG_GSW_CLK_DIV_SEL,
> +               .base_bits = 1,
> +               .base_shift = 8,
> +               .base_values = gsw_base,
> +               .n_base_values = ARRAY_SIZE(gsw_base),
> +
> +               .div_bits = 3,
> +               .div_shift = 0,
> +               .div_step = 1,
> +       }, {
> +               .id = EN7523_CLK_EMI,
> +               .name = "emi",
> +
> +               .base_reg = REG_EMI_CLK_DIV_SEL,
> +               .base_bits = 1,
> +               .base_shift = 8,
> +               .base_values = emi_base,
> +               .n_base_values = ARRAY_SIZE(emi_base),
> +
> +               .div_bits = 3,
> +               .div_shift = 0,
> +               .div_step = 1,
> +       }, {
> +               .id = EN7523_CLK_BUS,
> +               .name = "bus",
> +
> +               .base_reg = REG_BUS_CLK_DIV_SEL,
> +               .base_bits = 1,
> +               .base_shift = 8,
> +               .base_values = bus_base,
> +               .n_base_values = ARRAY_SIZE(bus_base),
> +
> +               .div_bits = 3,
> +               .div_shift = 0,
> +               .div_step = 1,
> +       }, {
> +               .id = EN7523_CLK_SLIC,
> +               .name = "slic",
> +
> +               .base_reg = REG_SPI_CLK_FREQ_SEL,
> +               .base_bits = 1,
> +               .base_shift = 0,
> +               .base_values = slic_base,
> +               .n_base_values = ARRAY_SIZE(slic_base),
> +
> +               .div_reg = REG_SPI_CLK_DIV_SEL,
> +               .div_bits = 5,
> +               .div_shift = 24,
> +               .div_val0 = 20,
> +               .div_step = 2,
> +       }, {
> +               .id = EN7523_CLK_SPI,
> +               .name = "spi",
> +
> +               .base_reg = REG_SPI_CLK_DIV_SEL,
> +
> +               .base_value = 400000000,
> +
> +               .div_bits = 5,
> +               .div_shift = 8,
> +               .div_val0 = 40,
> +               .div_step = 2,
> +       }, {
> +               .id = EN7523_CLK_NPU,
> +               .name = "npu",
> +
> +               .base_reg = REG_NPU_CLK_DIV_SEL,
> +               .base_bits = 2,
> +               .base_shift = 8,
> +               .base_values = npu_base,
> +               .n_base_values = ARRAY_SIZE(npu_base),
> +
> +               .div_bits = 3,
> +               .div_shift = 0,
> +               .div_step = 1,
> +       }, {
> +               .id = EN7523_CLK_CRYPTO,
> +               .name = "crypto",
> +
> +               .base_reg = REG_CRYPTO_CLKSRC,
> +               .base_bits = 1,
> +               .base_shift = 8,
> +               .base_values = emi_base,
> +               .n_base_values = ARRAY_SIZE(emi_base),
> +       }
> +};
> +
> +static const struct of_device_id of_match_clk_en7523[] = {
> +       { .compatible = "airoha,en7523-scu", },
> +       { /* sentinel */ }
> +};
> +
> +static u32 en7523_get_base_rate(void __iomem *base, int i)

static unsigned int?
unsigned int i?

> +{
> +       const struct en_clk_desc *desc = &en7523_base_clks[i];
> +       u32 val;
> +
> +       if (!desc->base_bits)
> +               return desc->base_value;
> +
> +       val = readl(base + desc->base_reg);
> +       val >>= desc->base_shift;
> +       val &= (1 << desc->base_bits) - 1;
> +
> +       if (val >= desc->n_base_values)
> +               return 0;
> +
> +       return desc->base_values[val];
> +}
> +
> +static u32 en7523_get_div(void __iomem *base, int i)
> +{
> +       const struct en_clk_desc *desc = &en7523_base_clks[i];
> +       u32 reg, val;
> +
> +       if (!desc->div_bits)
> +               return 1;
> +
> +       reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> +       val = readl(base + reg);
> +       val >>= desc->div_shift;
> +       val &= (1 << desc->div_bits) - 1;
> +
> +       if (!val && desc->div_val0)
> +               return desc->div_val0;
> +
> +       return (val + 1) * desc->div_step;
> +}
> +
> +static int en7523_pci_is_enabled(struct clk_hw *hw)
> +{
> +       struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +
> +       return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REFCLK_EN1);
> +}
> +
> +static int en7523_pci_prepare(struct clk_hw *hw)
> +{
> +       struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +       void __iomem *np_base = cg->base;
> +       u32 val, mask;
> +
> +       /* Need to pull device low before reset */
> +       val = readl(np_base + REG_PCI_CONTROL);
> +       val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
> +       writel(val, np_base + REG_PCI_CONTROL);
> +       usleep_range(1000, 2000);
> +
> +       /* Enable PCIe port 1 */
> +       val |= REG_PCI_CONTROL_REFCLK_EN1;
> +       writel(val, np_base + REG_PCI_CONTROL);
> +       usleep_range(1000, 2000);
> +
> +       /* Reset to default */
> +       val = readl(np_base + REG_RESET_CONTROL);
> +       mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> +              REG_RESET_CONTROL_PCIEHB;
> +       writel(val & ~mask, np_base + REG_RESET_CONTROL);
> +       usleep_range(1000, 2000);
> +       writel(val | mask, np_base + REG_RESET_CONTROL);
> +       msleep(100);
> +       writel(val & ~mask, np_base + REG_RESET_CONTROL);
> +       usleep_range(5000, 10000);
> +
> +       /* Release device */
> +       mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
> +       val = readl(np_base + REG_PCI_CONTROL);
> +       writel(val & ~mask, np_base + REG_PCI_CONTROL);
> +       usleep_range(1000, 2000);
> +       writel(val | mask, np_base + REG_PCI_CONTROL);
> +       msleep(250);
> +
> +       return 0;
> +}
> +
> +static void en7523_pci_unprepare(struct clk_hw *hw)
> +{
> +       struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> +       void __iomem *np_base = cg->base;
> +       u32 val;
> +
> +       val = readl(np_base + REG_PCI_CONTROL);
> +       val &= ~REG_PCI_CONTROL_REFCLK_EN1;
> +       writel(val, np_base + REG_PCI_CONTROL);
> +}
> +
> +static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
> +                                              void __iomem *np_base)
> +{
> +       static const struct clk_ops pcie_gate_ops = {
> +               .is_enabled = en7523_pci_is_enabled,
> +               .prepare = en7523_pci_prepare,
> +               .unprepare = en7523_pci_unprepare,
> +       };
> +       struct clk_init_data init = {
> +               .name = "pcie",
> +               .ops = &pcie_gate_ops,
> +       };
> +       struct en_clk_gate *cg;
> +
> +       cg = devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
> +       if (!cg)
> +               return NULL;
> +
> +       cg->base = np_base;
> +       cg->hw.init = &init;
> +       en7523_pci_unprepare(&cg->hw);
> +
> +       if (clk_hw_register(NULL, &cg->hw))

pass dev?

> +               return NULL;
> +
> +       return &cg->hw;
> +}
> +
> +static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> +                                  void __iomem *base, void __iomem *np_base)
> +{
> +       struct clk_hw *hw;
> +       u32 rate;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
> +               const struct en_clk_desc *desc = &en7523_base_clks[i];
> +
> +               rate = en7523_get_base_rate(base, i);
> +               rate /= en7523_get_div(base, i);
> +
> +               hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
> +               if (IS_ERR(hw)) {
> +                       pr_err("Failed to register clk %s: %ld\n",
> +                              desc->name, PTR_ERR(hw));
> +                       continue;
> +               }
> +
> +               clk_data->hws[desc->id] = hw;
> +       }
> +
> +       hw = en7523_register_pcie_clk(dev, np_base);
> +       clk_data->hws[EN7523_CLK_PCIE] = hw;
> +
> +       clk_data->num = EN7523_NUM_CLOCKS;
> +}
> +
> +static int en7523_clk_probe(struct platform_device *pdev)
> +{
> +       struct device_node *node = pdev->dev.of_node;
> +       struct clk_hw_onecell_data *clk_data;
> +       void __iomem *base, *np_base;
> +       int r;
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       np_base = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(base))
> +               return PTR_ERR(np_base);
> +
> +       clk_data = devm_kzalloc(&pdev->dev,
> +                               struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
> +                               GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
> +
> +       r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +       if (r)
> +               dev_err(&pdev->dev,
> +                       "could not register clock provider: %s: %d\n",
> +                       pdev->name, r);
> +
> +       return r;
> +}
> +
> +static struct platform_driver clk_en7523_drv = {
> +       .probe = en7523_clk_probe,
> +       .driver = {
> +               .name = "clk-en7523",
> +               .of_match_table = of_match_clk_en7523,

suppress_bind_attrs?

> +       },
> +};

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
