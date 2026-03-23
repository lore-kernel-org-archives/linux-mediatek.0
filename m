Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0905EF4613C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=n0TSdEBhxZf8K1f+2MnDsEl1wdg1VcA6AkL70t7JbA8=; b=tnLgRcb46kXdqE
	KYjsJwNIuVVF5tgcQPR+65k/EuBsPxHsJAJ+q0T30PbBQuZbLxe/3sO+qdCLQTPfGoEpE6vpVTUz/
	BOvgB8ypFFebjw78rOgTfkNOHb69ENKnEUo+Fx8oEmVfjJxAsi8VPcCrgJEOcLbyTZq2Ww1DnYI60
	9mAUu85i9vXFCNrIqxeemw0+Ro0S26t1F3R1xULXCndEdlR8d7+8L+LgG795LCazfn4hS2xtUC5NX
	K7+D9MkuIj+7inli2Eq0tCwXuptaEKgzvfJ8+cXDpMLQ56LR5hRvoFykw6KWiqECCH1Yk2RuK8Sm1
	b6JcUhWT0Al+zc96NXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mwk-000000001Zd-1r5J;
	Mon, 23 Mar 2026 21:36:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4mwh-000000001ZH-1u9P
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 21:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20D0C40587;
	Mon, 23 Mar 2026 21:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6622C4CEF7;
	Mon, 23 Mar 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774301783;
	bh=zJW8qy4WDz++YCo6QnKVYHEEygm4tZDVxXYzQ6hrIdg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ePRlnjLy47oFFjgPkO3vOeJITxqsJ+vT1hVfmBsWYPfQJy8PrknO8qDDvgcT5piDc
	 aNqVXQViT6YRaXcgU5v1MMTaZIrRncuqTXLN6+M2mbeoY3os+LhYbMd56YYEK/hXu3
	 kkpJ5tC72y+1A/qOczgdrM5tpw6JdyF85fCV652o9xcGwJyW9fA/YjYu7VpFl4S9Wk
	 5FWhoWOy4TVWHY/4ZKI99jY9Oic8bZDCUtD4tKz+Ymm5sXRR56ZXlM2n+hleYiGD1u
	 xKtmXwX76iokwc15GDsyRffVlGY5f2ezlshEsNc69qFLtp0ofn2plHSzf3rErvWwbO
	 Fv4MvvTYFmsvw==
Date: Mon, 23 Mar 2026 16:36:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <20260323213621.GA1080209@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320094212.696671-3-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_143623_570718_EC8946F5 
X-CRM114-Status: GOOD (  26.12  )
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

On Fri, Mar 20, 2026 at 09:42:12AM +0000, Caleb James DeLisle wrote:
> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> 
> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> require re-training after startup.
> ...

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
> +	/*
> +	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> +	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST#

Include spec rev; the section numbers are typically specific to a spec
revision.  E.g., CEM r1.0, sec 2.2, 2.2.1.

> +	 * should be delayed 100ms (TPVPERL) for the power and clock to become
> +	 * stable.
> +	 */
> +	msleep(100);

Isn't there a #define for this in drivers/pci/pci.h?

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
> +				       100 * USEC_PER_MSEC);

Ditto.  Also take a look and see if this is relevant:
https://lore.kernel.org/all/20260320224821.2571373-1-thierry.reding@kernel.org

> +	if (err) {
> +		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* Set INTx mask */

Looks like this *clears* an INTx mask.  But the comment is probably
superfluous anyway.

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
> @@ -1149,6 +1236,30 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>  	if (err)
>  		goto put_resources;
>  
> +	/* Retrain Gen1 links to reach Gen2 where supported */
> +	if (pcie->soc->startup == mtk_pcie_startup_port_en7528) {

This looks like an ugly hack when placed here in mtk_pcie_probe(),
especially since it's after pci_host_probe() has already enumerated
the hierarchy.  Why can't this be inside
mtk_pcie_startup_port_en7528() itself?

> +		struct pci_bus *bus = host->bus;
> +		struct pci_dev *rc = NULL;
> +
> +		while ((rc = pci_get_class(PCI_CLASS_BRIDGE_PCI << 8, rc))) {
> +			int ret = -EOPNOTSUPP;

I don't get this.  pci_get_class() looks through the entire hierarchy,
but this driver should only care about the links directly attached to
Root Ports.

> +			if (rc->bus != bus)
> +				continue;
> +
> +			#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
> +			ret = pcie_retrain_link(rc, true);
> +			#endif

Why is this specific to being builtin?  No other PCI controller
drivers do this.  Needs a comment about why this is special.
Typically such an #ifdef would be at the left margin.

> +			if (!ret)

Prefer the positive test ("if (ret)").

> +				dev_info(dev, "port%d link retrained\n",
> +					 PCI_SLOT(rc->devfn));
> +			else
> +				dev_info(dev, "port%d failed to retrain %pe\n",
> +					 PCI_SLOT(rc->devfn), ERR_PTR(ret));
> +		}
> +	}
> +
>  	return 0;
>  
>  put_resources:
> @@ -1264,8 +1375,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
>  	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
>  };
>  
> +static const struct mtk_pcie_soc mtk_pcie_soc_en7528 = {
> +	.ops = &mtk_pcie_ops_v2,
> +	.startup = mtk_pcie_startup_port_en7528,
> +	.setup_irq = mtk_pcie_setup_irq,
> +};
> +
>  static const struct of_device_id mtk_pcie_ids[] = {
>  	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
> +	{ .compatible = "econet,en7528-pcie", .data = &mtk_pcie_soc_en7528 },
>  	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
>  	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
>  	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
> -- 
> 2.39.5
> 

