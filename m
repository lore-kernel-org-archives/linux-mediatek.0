Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8984CD4F24
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 15:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tontA9jNsY3uvleInmHjUSnhpjdidOyGIVw5ew5q9Sc=; b=1N8i4nb7U+Gwj1+A2/xVtXPVfb
	IKWesLV956L99MULcM6WfwcX/1OPzYuwqbbZs7JWM1D2VXUnWTYI97XRZOm13Zq4bCHFom5nZ+kIl
	i/6DdN5cDW9KDRLavEAOAoly8ePz/dBf3iTjDMLiWx0vgV2G1CK6tvdBKy6q7aAuv1i46hqb7XXst
	fbq2x3XYV3AqTLVuXZtHZ53uJvcriP64elgg29uJW4klS8ZKPf/LIIEPYnGix6aLHrBkrxrX8Mdq4
	uNvmze4HqYFtSnq+fJmZWHKEUd2SPJ6W6/ds7t04Qq+JzxdPHm39DUyN1jhCvIOHX6Kz5sOmIedNH
	j4QfRxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBJf-000000032pB-2yPx;
	Wed, 13 May 2026 15:16:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBJe-000000032os-0oH1
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 15:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5ACA060123;
	Wed, 13 May 2026 15:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B72CC19425;
	Wed, 13 May 2026 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778685365;
	bh=Qr59HtP9Zgp/V56Jm262L8hRrPIv+Nz+L0CNZ475ahU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mw8syf0t1LTy/rYy41FwGIkdZEqs+d3+Vq/XNIqXGctaaXb8l10cAnw9d3l0q6IeX
	 MDcJIS1lyABM9H+sfldovDr14kZZbADdcFR1+S98AIIuXjeYcSrjCCwFsmQlDh43gj
	 PLi/3VA3/mz0BJco3Zw+PXOXie1lHvpPEpbA0idJ/rN24qA3rG2pw1c0jxKWE8/zjs
	 AvjoFviUCMYz3NpIH2tEs9tyRUxGKcSHh/AZFqU0YtuIc2DS3pX+X6HdKAtKGZUrrg
	 0zIrHmT8IwUI/QkXuC2VRuleJZvXCx+9ABIRsy/W7XwkZ9vzwSrlh3FMCgbmtaET/h
	 J96zM5usGg/bw==
Date: Wed, 13 May 2026 20:45:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	naseefkm@gmail.com, ryder.lee@mediatek.com, helgaas@kernel.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <sgnuiodetvin6qw2zehgqxvv2wncjzwzu4mpccmu6yytochc3h@5akmnrqxox2k>
References: <20260413140339.16238-1-cjd@cjdns.fr>
 <20260413140339.16238-3-cjd@cjdns.fr>
 <duchbakmiuf4ffmhgkoioq3qpxaybcevtcdduwiv2gf56j5ncr@kszd5v54ph3q>
 <a4f84ba5-fe28-4674-b91b-33438f5478fb@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4f84ba5-fe28-4674-b91b-33438f5478fb@cjdns.fr>
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

On Wed, May 13, 2026 at 04:31:32PM +0200, Caleb James DeLisle wrote:
> 
> On 12/05/2026 13:55, Manivannan Sadhasivam wrote:
> > On Mon, Apr 13, 2026 at 02:03:39PM +0000, Caleb James DeLisle wrote:
> > > Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> > > 
> > > These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> > > require re-training after startup.
> > > 
> > > Co-developed-by: Ahmed Naseef <naseefkm@gmail.com>
> > > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > ---
> > >   drivers/pci/controller/Kconfig         |   2 +-
> > >   drivers/pci/controller/pcie-mediatek.c | 133 +++++++++++++++++++++++++
> > >   2 files changed, 134 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > > index 686349e09cd3..5808d5e407fd 100644
> > > --- a/drivers/pci/controller/Kconfig
> > > +++ b/drivers/pci/controller/Kconfig
> > > @@ -209,7 +209,7 @@ config PCI_MVEBU
> > >   config PCIE_MEDIATEK
> > >   	tristate "MediaTek PCIe controller"
> > > -	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
> > > +	depends on ARCH_AIROHA || ARCH_MEDIATEK || ECONET || COMPILE_TEST
> > >   	depends on OF
> > >   	depends on PCI_MSI
> > >   	select IRQ_MSI_LIB
> > > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > > index 75722524fe74..915a35825ce1 100644
> > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > @@ -7,6 +7,7 @@
> > >    *	   Honghui Zhang <honghui.zhang@mediatek.com>
> > >    */
> > > +#include <asm-generic/errno-base.h>
> > >   #include <linux/clk.h>
> > >   #include <linux/delay.h>
> > >   #include <linux/iopoll.h>
> > > @@ -14,6 +15,7 @@
> > >   #include <linux/irqchip/chained_irq.h>
> > >   #include <linux/irqchip/irq-msi-lib.h>
> > >   #include <linux/irqdomain.h>
> > > +#include <linux/kconfig.h>
> > >   #include <linux/kernel.h>
> > >   #include <linux/mfd/syscon.h>
> > >   #include <linux/msi.h>
> > > @@ -77,6 +79,7 @@
> > >   #define PCIE_CONF_VEND_ID	0x100
> > >   #define PCIE_CONF_DEVICE_ID	0x102
> > > +#define PCIE_CONF_REV_CLASS	0x104
> > >   #define PCIE_CONF_CLASS_ID	0x106
> > >   #define PCIE_INT_MASK		0x420
> > > @@ -89,6 +92,11 @@
> > >   #define MSI_MASK		BIT(23)
> > >   #define MTK_MSI_IRQS_NUM	32
> > > +#define EN7528_HOST_MODE	0x00804201
> > > +#define EN7528_LINKUP_REG	0x50
> > > +#define EN7528_RC0_LINKUP	BIT(1)
> > > +#define EN7528_RC1_LINKUP	BIT(2)
> > > +
> > >   #define PCIE_AHB_TRANS_BASE0_L	0x438
> > >   #define PCIE_AHB_TRANS_BASE0_H	0x43c
> > >   #define AHB2PCIE_SIZE(x)	((x) & GENMASK(4, 0))
> > > @@ -148,12 +156,15 @@ struct mtk_pcie_port;
> > >    * @MTK_PCIE_FIX_DEVICE_ID: host's device ID needed to be fixed
> > >    * @MTK_PCIE_NO_MSI: Bridge has no MSI support, and relies on an external block
> > >    * @MTK_PCIE_SKIP_RSTB: Skip calling RSTB bits on PCIe probe
> > > + * @MTK_PCIE_RETRAIN: Re-train link to bridge after startup because some
> > > + *                    Gen2-capable devices start as Gen1.
> > >    */
> > >   enum mtk_pcie_quirks {
> > >   	MTK_PCIE_FIX_CLASS_ID = BIT(0),
> > >   	MTK_PCIE_FIX_DEVICE_ID = BIT(1),
> > >   	MTK_PCIE_NO_MSI = BIT(2),
> > >   	MTK_PCIE_SKIP_RSTB = BIT(3),
> > > +	MTK_PCIE_RETRAIN = BIT(4),
> > >   };
> > >   /**
> > > @@ -753,6 +764,80 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> > >   	return 0;
> > >   }
> > > +static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
> > > +{
> > > +	struct mtk_pcie *pcie = port->pcie;
> > > +	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
> > > +	struct resource *mem = NULL;
> > > +	struct resource_entry *entry;
> > > +	u32 val, link_mask;
> > > +	int err;
> > > +
> > > +	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
> > > +	if (entry)
> > > +		mem = entry->res;
> > > +	if (!mem)
> > > +		return -EINVAL;
> > > +
> > > +	if (!pcie->cfg) {
> > > +		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/* Assert all reset signals */
> > > +	writel(0, port->base + PCIE_RST_CTRL);
> > > +
> > > +	/*
> > > +	 * Enable PCIe link down reset, if link status changed from link up to
> > > +	 * link down, this will reset MAC control registers and configuration
> > > +	 * space.
> > > +	 */
> > > +	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> > > +
> > > +	msleep(PCIE_T_PVPERL_MS);
> > > +
> > > +	/* De-assert PHY, PE, PIPE, MAC and configuration reset */
> > > +	val = readl(port->base + PCIE_RST_CTRL);
> > > +	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> > > +	       PCIE_MAC_SRSTB | PCIE_CRSTB;
> > > +	writel(val, port->base + PCIE_RST_CTRL);
> > > +
> > > +	writel(PCIE_CLASS_CODE | PCIE_REVISION_ID,
> > > +	       port->base + PCIE_CONF_REV_CLASS);
> > > +	writel(EN7528_HOST_MODE, port->base);
> > > +
> > > +	link_mask = (port->slot == 0) ? EN7528_RC0_LINKUP : EN7528_RC1_LINKUP;
> > > +
> > > +	/* 100ms timeout value should be enough for Gen1/2 training */
> > > +	err = regmap_read_poll_timeout(pcie->cfg, EN7528_LINKUP_REG, val,
> > > +				       !!(val & link_mask), 20,
> > > +				       PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
> > > +	if (err) {
> > > +		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
> > > +		return -ETIMEDOUT;
> > > +	}
> > > +
> > > +	/* Activate INTx interrupts */
> > > +	val = readl(port->base + PCIE_INT_MASK);
> > > +	val &= ~INTX_MASK;
> > > +	writel(val, port->base + PCIE_INT_MASK);
> > > +
> > > +	if (IS_ENABLED(CONFIG_PCI_MSI))
> > > +		mtk_pcie_enable_msi(port);
> > > +
> > > +	/* Set AHB to PCIe translation windows */
> > > +	val = lower_32_bits(mem->start) |
> > > +	      AHB2PCIE_SIZE(fls(resource_size(mem)));
> > > +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
> > > +
> > > +	val = upper_32_bits(mem->start);
> > > +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
> > > +
> > > +	writel(WIN_ENABLE, port->base + PCIE_AXI_WINDOW0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static void __iomem *mtk_pcie_map_bus(struct pci_bus *bus,
> > >   				      unsigned int devfn, int where)
> > >   {
> > > @@ -1149,6 +1234,46 @@ static int mtk_pcie_probe(struct platform_device *pdev)
> > >   	if (err)
> > >   		goto put_resources;
> > > +	/* EN7528 PCIe initially comes up as Gen1 even if Gen2 is supported.
> > > +	 * The cannonical way to achieve Gen2 is to re-train the link
> > > +	 * immediately after setup. However, to save a lot of duplicated code
> > > +	 * we use pcie_retrain_link() which is usable once we have the pci_dev
> > > +	 * struct for the bridge, i.e. after pci_host_probe(). */
> > Use below style:
> > 
> > 	/*
> > 	 * ...
> > 	 */
> 
> 
> Right, sorry, thanks.
> 
> 
> > > +	if (pcie->soc->quirks & MTK_PCIE_RETRAIN) {
> > > +		int slot = of_get_pci_domain_nr(dev->of_node);
> > The returned value is not the slot number, but domain number. Both are different
> > numbering schemes.
> > 
> > > +		struct pci_dev *rc = NULL;
> > > +		int ret = -ENOENT;
> > > +
> > > +		if (slot >= 0)
> > > +			rc = pci_get_slot(host->bus, PCI_DEVFN(slot, 0));
> > This looks wrong. If your intention is to find the Root Port of the hierarchy,
> > then you should do:
> > 
> > 		pci_get_slot(host->bus, PCI_DEVFN(0, 0));
> 
> 
> Thank you for your review. What's happening here is the hardware exposes two
> sets of registers for the two devices, but it expects that they might all be
> controlled by one driver instance - so they hard-wired the second root hub
> to slot 1. The Mediatek driver here wants to be instantiated twice, so we
> end up with something like this:
> 
> 
> 0000:00:00.0 PCI bridge: MEDIATEK Corp. Device 0810 (rev 03)
> 0000:01:00.0 Network controller: MEDIATEK Corp. MT7662E 802.11ac PCI Express
> Wireless Network Adapter
> 0001:00:01.0 PCI bridge: MEDIATEK Corp. Device 0811 (rev 02)
> 0001:01:00.0 Network controller: MEDIATEK Corp. MT7603E 802.11bgn PCI
> Express Wireless Network Adapter
> 
> So when it's domain 1, it's also slot 1 (unless the DT is written
> backwards).
> 

Oops! Thanks for the explanation.

> 
> The original code from Ahmed Naseef used a loop with pci_get_class() to get
> all of the bridges that were on the right bus, but it was pointed out in an
> earlier review that this would also re-train any hypothetical bridge
> downstream of the root. So the current code specifically re-trains the right
> bridge.
> 
> I can re-send with this explanation wrapped up in the comment, or I guess I
> could write a loop that tries slot 0 and 1 to find the bridge, but I feel
> like the loop is a bit hair-splitting so I think my preference would be to
> just explain it better.
> 
> WDYT?
> 

Adding comments with the above info would suffice.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

