Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA122CD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkUDYU1cmnTWYG5ooYSp/fdDNQR4Smcya1oOrOuUeG0=; b=t5W9CeyFObP1oUcTrkapuVL+T3
	kHiJyQGe0JvZ5y0i9TsN2yK8vhl1Cxl2ro9/f5cpZTozKCEKoGD2FJDiOFHRuOFiyU6x+kLoFcR9J
	brTDv13rWXn7zPW+wL8uvCpSBEJujEN9J+PUWqqd3KeFVYYjGoL0Jo2jcYRjN7vR5b5DruNPVt4s+
	KTSsh4hy5ZrJ7S4EnjYKHGtNPQL7W6XPWVb5/9WpZmHVO2DxNhSWcDp8Rvr96qezbCQ5/PnOgknPj
	NU7emAGk7l5zoM/1tsZKxHlB2SbjruDMpoaKkqgl9ucZFirpoekBBoAr/Eh73RrNe1OJJFKtuKGhb
	VzzT7VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlhw-0000000GcHu-2y5i;
	Tue, 12 May 2026 11:55:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlhv-0000000GcHX-2PZV
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 11:55:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAA8060123;
	Tue, 12 May 2026 11:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF4EC2BCB0;
	Tue, 12 May 2026 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778586926;
	bh=zgGM5XKZo0cNX0MEkNZl6YoD9uFB4lPKFTc1aQDdZbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWGgkzKqR2ykGBqb1lTM9qEf4mbkXXmEVIcqc+5TPsPsoDPwMW4ehXjAzs6KQErNX
	 du0F+ZEl+iD3po+G+NoMnyBEhVWxye3X6U+umFrMkuhXhIDQzKh/mi44FBR615jRbR
	 gb5mQ/A5SGrMnekY4tuTzd2Ni5PnrmViuBjjDesfdg5lIs6+7uSHAPfUEb3/Ebcka/
	 7B6lTuJToS6mpU2NrCK3+8XRd5AWXqwhC7Rmb2GVSbeLx7n3S8szIFY2XNr0JnUH8o
	 DdwN/R6N5U6KlLwMSoNrHIX5+1qMF1bwdo1rHr1fXcchPZZyUqTw3Rb0eKJEhZctO+
	 PTZXIynRpkMTQ==
Date: Tue, 12 May 2026 17:25:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	naseefkm@gmail.com, ryder.lee@mediatek.com, helgaas@kernel.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <duchbakmiuf4ffmhgkoioq3qpxaybcevtcdduwiv2gf56j5ncr@kszd5v54ph3q>
References: <20260413140339.16238-1-cjd@cjdns.fr>
 <20260413140339.16238-3-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413140339.16238-3-cjd@cjdns.fr>
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

On Mon, Apr 13, 2026 at 02:03:39PM +0000, Caleb James DeLisle wrote:
> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> 
> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> require re-training after startup.
> 
> Co-developed-by: Ahmed Naseef <naseefkm@gmail.com>
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/pci/controller/Kconfig         |   2 +-
>  drivers/pci/controller/pcie-mediatek.c | 133 +++++++++++++++++++++++++
>  2 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 686349e09cd3..5808d5e407fd 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -209,7 +209,7 @@ config PCI_MVEBU
>  
>  config PCIE_MEDIATEK
>  	tristate "MediaTek PCIe controller"
> -	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
> +	depends on ARCH_AIROHA || ARCH_MEDIATEK || ECONET || COMPILE_TEST
>  	depends on OF
>  	depends on PCI_MSI
>  	select IRQ_MSI_LIB
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 75722524fe74..915a35825ce1 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -7,6 +7,7 @@
>   *	   Honghui Zhang <honghui.zhang@mediatek.com>
>   */
>  
> +#include <asm-generic/errno-base.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/iopoll.h>
> @@ -14,6 +15,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqchip/irq-msi-lib.h>
>  #include <linux/irqdomain.h>
> +#include <linux/kconfig.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/msi.h>
> @@ -77,6 +79,7 @@
>  
>  #define PCIE_CONF_VEND_ID	0x100
>  #define PCIE_CONF_DEVICE_ID	0x102
> +#define PCIE_CONF_REV_CLASS	0x104
>  #define PCIE_CONF_CLASS_ID	0x106
>  
>  #define PCIE_INT_MASK		0x420
> @@ -89,6 +92,11 @@
>  #define MSI_MASK		BIT(23)
>  #define MTK_MSI_IRQS_NUM	32
>  
> +#define EN7528_HOST_MODE	0x00804201
> +#define EN7528_LINKUP_REG	0x50
> +#define EN7528_RC0_LINKUP	BIT(1)
> +#define EN7528_RC1_LINKUP	BIT(2)
> +
>  #define PCIE_AHB_TRANS_BASE0_L	0x438
>  #define PCIE_AHB_TRANS_BASE0_H	0x43c
>  #define AHB2PCIE_SIZE(x)	((x) & GENMASK(4, 0))
> @@ -148,12 +156,15 @@ struct mtk_pcie_port;
>   * @MTK_PCIE_FIX_DEVICE_ID: host's device ID needed to be fixed
>   * @MTK_PCIE_NO_MSI: Bridge has no MSI support, and relies on an external block
>   * @MTK_PCIE_SKIP_RSTB: Skip calling RSTB bits on PCIe probe
> + * @MTK_PCIE_RETRAIN: Re-train link to bridge after startup because some
> + *                    Gen2-capable devices start as Gen1.
>   */
>  enum mtk_pcie_quirks {
>  	MTK_PCIE_FIX_CLASS_ID = BIT(0),
>  	MTK_PCIE_FIX_DEVICE_ID = BIT(1),
>  	MTK_PCIE_NO_MSI = BIT(2),
>  	MTK_PCIE_SKIP_RSTB = BIT(3),
> +	MTK_PCIE_RETRAIN = BIT(4),
>  };
>  
>  /**
> @@ -753,6 +764,80 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  	return 0;
>  }
>  
> +static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
> +{
> +	struct mtk_pcie *pcie = port->pcie;
> +	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
> +	struct resource *mem = NULL;
> +	struct resource_entry *entry;
> +	u32 val, link_mask;
> +	int err;
> +
> +	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
> +	if (entry)
> +		mem = entry->res;
> +	if (!mem)
> +		return -EINVAL;
> +
> +	if (!pcie->cfg) {
> +		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Assert all reset signals */
> +	writel(0, port->base + PCIE_RST_CTRL);
> +
> +	/*
> +	 * Enable PCIe link down reset, if link status changed from link up to
> +	 * link down, this will reset MAC control registers and configuration
> +	 * space.
> +	 */
> +	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> +
> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	/* De-assert PHY, PE, PIPE, MAC and configuration reset */
> +	val = readl(port->base + PCIE_RST_CTRL);
> +	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> +	       PCIE_MAC_SRSTB | PCIE_CRSTB;
> +	writel(val, port->base + PCIE_RST_CTRL);
> +
> +	writel(PCIE_CLASS_CODE | PCIE_REVISION_ID,
> +	       port->base + PCIE_CONF_REV_CLASS);
> +	writel(EN7528_HOST_MODE, port->base);
> +
> +	link_mask = (port->slot == 0) ? EN7528_RC0_LINKUP : EN7528_RC1_LINKUP;
> +
> +	/* 100ms timeout value should be enough for Gen1/2 training */
> +	err = regmap_read_poll_timeout(pcie->cfg, EN7528_LINKUP_REG, val,
> +				       !!(val & link_mask), 20,
> +				       PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
> +	if (err) {
> +		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* Activate INTx interrupts */
> +	val = readl(port->base + PCIE_INT_MASK);
> +	val &= ~INTX_MASK;
> +	writel(val, port->base + PCIE_INT_MASK);
> +
> +	if (IS_ENABLED(CONFIG_PCI_MSI))
> +		mtk_pcie_enable_msi(port);
> +
> +	/* Set AHB to PCIe translation windows */
> +	val = lower_32_bits(mem->start) |
> +	      AHB2PCIE_SIZE(fls(resource_size(mem)));
> +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
> +
> +	val = upper_32_bits(mem->start);
> +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
> +
> +	writel(WIN_ENABLE, port->base + PCIE_AXI_WINDOW0);
> +
> +	return 0;
> +}
> +
>  static void __iomem *mtk_pcie_map_bus(struct pci_bus *bus,
>  				      unsigned int devfn, int where)
>  {
> @@ -1149,6 +1234,46 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>  	if (err)
>  		goto put_resources;
>  
> +	/* EN7528 PCIe initially comes up as Gen1 even if Gen2 is supported.
> +	 * The cannonical way to achieve Gen2 is to re-train the link
> +	 * immediately after setup. However, to save a lot of duplicated code
> +	 * we use pcie_retrain_link() which is usable once we have the pci_dev
> +	 * struct for the bridge, i.e. after pci_host_probe(). */

Use below style:

	/*
	 * ...
	 */

> +	if (pcie->soc->quirks & MTK_PCIE_RETRAIN) {
> +		int slot = of_get_pci_domain_nr(dev->of_node);

The returned value is not the slot number, but domain number. Both are different
numbering schemes.

> +		struct pci_dev *rc = NULL;
> +		int ret = -ENOENT;
> +
> +		if (slot >= 0)
> +			rc = pci_get_slot(host->bus, PCI_DEVFN(slot, 0));

This looks wrong. If your intention is to find the Root Port of the hierarchy,
then you should do:

		pci_get_slot(host->bus, PCI_DEVFN(0, 0));

- Mani

-- 
மணிவண்ணன் சதாசிவம்

