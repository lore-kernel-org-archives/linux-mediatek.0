Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A378FEC10C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 19:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iWKEbRSat36IV94lLy0So9Efd8lQ9YMr7+bYVKEn3s=; b=ZRKEJK8iYAdS0y+gHr3i1JFY09
	sUhfzP1y9XjrqfGhTcZMLOJTxZc7wO3FU3CUBXKS7oCK2lK/V9yiuMJMnIUgkC+d4JE++WtfB1plb
	tFN6gW27EO2JtnZropHfB17WSZRYztmOZ/81xJPYZmS4ump78zJzX5dUNAdYyiBpNRWEjcdvMUXuU
	B98SaMHzygNMc9hIkyaNSrpxmov5CRQ3Ru1GtQSH5vKA+vS3eaFUrrSoXx7JScPPmFmjZa1dDjoT8
	bMVVIWwFL0gtf56J3T3Qmz4hgzU9kU+rP8B3B3dsOmeEZ/wdpHrfW5HVhytOp1hNQcsAuYtUEAbp3
	efByfaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pv-00000002BSb-1vUL;
	Tue, 24 Mar 2026 19:54:47 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pg-00000002BEg-3tQa
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 19:54:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B40973AA8E6;
	Tue, 24 Mar 2026 20:54:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1774382069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4iWKEbRSat36IV94lLy0So9Efd8lQ9YMr7+bYVKEn3s=;
	b=kfBdJtAyZlEcBfjeYglEZSwbElrc+UyvohpZ6uFd5LanoHHK3huog9XW3nd40ux2SAc2Qi
	/LxqbkLe0q74+0Rtg6UzmTBOlPHA75pfvWpUgxLomOV07eI+p4eF/0KYovc6G14ZhozK1w
	B/cF/waaVbM6x52hkwVTnE5P+s1oiIjnEkJBw1z6+UAcmzSwprj204OsEbOQIg45R6NLI+
	7VVlUNOk62tz+UWOU53VW7r0W90981hEyTMBtz2d5dWuLEBzsiDOoHQMZ25w3RUlAw/ybF
	0lnc6FGCtDcbbuqdndmVNpuV/PrxUBN7oJSgl44cehMSsjumEv+AWlnuBzcP5A==
Message-ID: <291d896e-838a-437e-8525-5896f3c957b6@cjdns.fr>
Date: Tue, 24 Mar 2026 20:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323213621.GA1080209@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260323213621.GA1080209@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_125433_379957_5288B692 
X-CRM114-Status: GOOD (  33.52  )
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


On 23/03/2026 22:36, Bjorn Helgaas wrote:
> On Fri, Mar 20, 2026 at 09:42:12AM +0000, Caleb James DeLisle wrote:
>> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
>>
>> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
>> require re-training after startup.
>> ...
>> +static int mtk_pcie_startup_port_en7528(struct mtk_pcie_port *port)
>> +{
>> +	struct mtk_pcie *pcie = port->pcie;
>> +	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
>> +	struct resource *mem = NULL;
>> +	struct resource_entry *entry;
>> +	u32 val, link_mask;
>> +	int err;
>> +
>> +	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
>> +	if (entry)
>> +		mem = entry->res;
>> +	if (!mem)
>> +		return -EINVAL;
>> +
>> +	if (!pcie->cfg) {
>> +		dev_err(pcie->dev, "EN7528: pciecfg syscon not available\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Assert all reset signals */
>> +	writel(0, port->base + PCIE_RST_CTRL);
>> +
>> +	/*
>> +	 * Enable PCIe link down reset, if link status changed from link up to
>> +	 * link down, this will reset MAC control registers and configuration
>> +	 * space.
>> +	 */
>> +	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
>> +
>> +	/*
>> +	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
>> +	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST#
> Include spec rev; the section numbers are typically specific to a spec
> revision.  E.g., CEM r1.0, sec 2.2, 2.2.1.
>
>> +	 * should be delayed 100ms (TPVPERL) for the power and clock to become
>> +	 * stable.
>> +	 */
>> +	msleep(100);
> Isn't there a #define for this in drivers/pci/pci.h?

Indeed, and it has the proper reference to the spec revision. This hard 
coded 100 and the spec comment trickled down from vendor code. Will 
replace with the symbol.

>> +	/* De-assert PHY, PE, PIPE, MAC and configuration reset */
>> +	val = readl(port->base + PCIE_RST_CTRL);
>> +	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
>> +	       PCIE_MAC_SRSTB | PCIE_CRSTB;
>> +	writel(val, port->base + PCIE_RST_CTRL);
>> +
>> +	writel(PCIE_CLASS_CODE | PCIE_REVISION_ID,
>> +	       port->base + PCIE_CONF_REV_CLASS);
>> +	writel(EN7528_HOST_MODE, port->base);
>> +
>> +	link_mask = (port->slot == 0) ? EN7528_RC0_LINKUP : EN7528_RC1_LINKUP;
>> +
>> +	/* 100ms timeout value should be enough for Gen1/2 training */
>> +	err = regmap_read_poll_timeout(pcie->cfg, EN7528_LINKUP_REG, val,
>> +				       !!(val & link_mask), 20,
>> +				       100 * USEC_PER_MSEC);
> Ditto.  Also take a look and see if this is relevant:
> https://lore.kernel.org/all/20260320224821.2571373-1-thierry.reding@kernel.org
Okay, the hardcoded 100ms follows what is done in pcie-mediatek.c but 
from pcie-mediatek-gen3.c it appears the appropriate symbol is 
PCI_PM_D3COLD_WAIT so I'll substitute this.
>
>> +	if (err) {
>> +		dev_err(pcie->dev, "EN7528: port%d link timeout\n", port->slot);
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	/* Set INTx mask */
> Looks like this *clears* an INTx mask.  But the comment is probably
> superfluous anyway.
Indeed. "clear" -> "unmask" -> "activate" -> "set", I'll use the word 
"activate" since that's what we're doing.
>> +	val = readl(port->base + PCIE_INT_MASK);
>> +	val &= ~INTX_MASK;
>> +	writel(val, port->base + PCIE_INT_MASK);
>> +
>> +	if (IS_ENABLED(CONFIG_PCI_MSI))
>> +		mtk_pcie_enable_msi(port);
>> +
>> +	/* Set AHB to PCIe translation windows */
>> +	val = lower_32_bits(mem->start) |
>> +	      AHB2PCIE_SIZE(fls(resource_size(mem)));
>> +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
>> +
>> +	val = upper_32_bits(mem->start);
>> +	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
>> +
>> +	writel(WIN_ENABLE, port->base + PCIE_AXI_WINDOW0);
>> +
>> +	return 0;
>> +}
>> +
>>   static void __iomem *mtk_pcie_map_bus(struct pci_bus *bus,
>>   				      unsigned int devfn, int where)
>>   {
>> @@ -1149,6 +1236,30 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>>   	if (err)
>>   		goto put_resources;
>>   
>> +	/* Retrain Gen1 links to reach Gen2 where supported */
>> +	if (pcie->soc->startup == mtk_pcie_startup_port_en7528) {
> This looks like an ugly hack when placed here in mtk_pcie_probe(),
> especially since it's after pci_host_probe() has already enumerated
> the hierarchy.  Why can't this be inside
> mtk_pcie_startup_port_en7528() itself?

This is indeed frustrating. This little ritual has trickled down through 
2 or 3 generations of rewritten vendor code. What we know is that the 
Gen2 links come up as Gen1 on startup, but if you retrain them they 
upgrade to Gen2. Technically this could be done in 
mtk_pcie_startup_port_en7528(), but it won't be using 
pcie_retrain_link() because we don't yet have the pci_dev struct. Doing 
it manually is kind of ugly because we have to get the config offset of 
the bridge device which we're retraining - vendor code for this is a bit 
of a mess.

I think probably the least bad solution here is to stick with this, 
perhaps with a more descriptive / apologetic comment. WDYT?

>> +		struct pci_bus *bus = host->bus;
>> +		struct pci_dev *rc = NULL;
>> +
>> +		while ((rc = pci_get_class(PCI_CLASS_BRIDGE_PCI << 8, rc))) {
>> +			int ret = -EOPNOTSUPP;
> I don't get this.  pci_get_class() looks through the entire hierarchy,
> but this driver should only care about the links directly attached to
> Root Ports.
Good point, I'll switch this out for something more specific.
>> +			if (rc->bus != bus)
>> +				continue;
>> +
>> +			#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
>> +			ret = pcie_retrain_link(rc, true);
>> +			#endif
> Why is this specific to being builtin?  No other PCI controller
> drivers do this.  Needs a comment about why this is special.
> Typically such an #ifdef would be at the left margin.

Okay yes, good point. The reason for this is because pcie_retrain_link() 
is not exported and trying to re-implement the logic is the mess I 
alluded to earlier. Since this driver supports multiple devices and 
allows being compiled as a module, I opted to soft-fail in this case and 
it will log that it didn't retrain with reason -EOPNOTSUPP. In that case 
it would continue to run as a Gen1, and since this is an embedded 
application, I think we can rely on the integrator to make it a builtin 
if they're targeting the EN7528. But I can re-send with nicer 
documentation around this.

>
>> +			if (!ret)
> Prefer the positive test ("if (ret)").

Okay.


Thank you very much for the review.

Caleb


>
>> +				dev_info(dev, "port%d link retrained\n",
>> +					 PCI_SLOT(rc->devfn));
>> +			else
>> +				dev_info(dev, "port%d failed to retrain %pe\n",
>> +					 PCI_SLOT(rc->devfn), ERR_PTR(ret));
>> +		}
>> +	}
>> +
>>   	return 0;
>>   
>>   put_resources:
>> @@ -1264,8 +1375,15 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
>>   	.quirks = MTK_PCIE_FIX_CLASS_ID | MTK_PCIE_FIX_DEVICE_ID,
>>   };
>>   
>> +static const struct mtk_pcie_soc mtk_pcie_soc_en7528 = {
>> +	.ops = &mtk_pcie_ops_v2,
>> +	.startup = mtk_pcie_startup_port_en7528,
>> +	.setup_irq = mtk_pcie_setup_irq,
>> +};
>> +
>>   static const struct of_device_id mtk_pcie_ids[] = {
>>   	{ .compatible = "airoha,an7583-pcie", .data = &mtk_pcie_soc_an7583 },
>> +	{ .compatible = "econet,en7528-pcie", .data = &mtk_pcie_soc_en7528 },
>>   	{ .compatible = "mediatek,mt2701-pcie", .data = &mtk_pcie_soc_v1 },
>>   	{ .compatible = "mediatek,mt7623-pcie", .data = &mtk_pcie_soc_v1 },
>>   	{ .compatible = "mediatek,mt2712-pcie", .data = &mtk_pcie_soc_mt2712 },
>> -- 
>> 2.39.5
>>

