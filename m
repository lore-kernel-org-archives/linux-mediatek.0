Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136C4CD5BA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 18:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=39UG6z3xSkfALd7iFK2MrFvSVeHM27TADIbMrVcBmWU=; b=ykJk4uFlWTZWsc
	LVlKm5lasNIrzPJO4IU+y8i7ZjmSwIGW8kW9ZZimBzju6kJAKNSDfdhhZtWwI4sx9fpwYqi+lJ3m/
	oAVhGFW8IjnCy9ofUjdfjnA4qcMFyh03GJvP99LROAkhsFO5Iq+sIG44IchVAcIeT88TgpewATIol
	z2EIx9guaY0N0++RhDY15RdLs8OClWFUh64ykKBBY+1HwMEc256bso9O7d/scpWRA3BAWf2hQLmAK
	DB+9HyljZ9AVrWrLtlKHpR79CaBEcAKVBryL1dz2eKZyRnTZJ3fIM6hLNqhuR53PEN0J8SppfIwFS
	3ztO9jF2IXwJTdgC7wwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPm4w-00000005Xby-1ydT;
	Wed, 20 May 2026 18:55:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPm4u-00000005Xb6-2M65
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 18:55:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E61AD4441B;
	Wed, 20 May 2026 18:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9BAF21F00894;
	Wed, 20 May 2026 18:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779303335;
	bh=39UG6z3xSkfALd7iFK2MrFvSVeHM27TADIbMrVcBmWU=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=EBYFiAXx0OCVsyM1J/eRY73szIoOfP85uCJFVPjKqdm7S5vsfcLScQOznPRxobUsW
	 7vGl9qe439P94ZDvGqu9osOzTC551N/8TGC7knUso1/HPgeIJvTj+5BJ3KZvt7TgbM
	 fbkwnHaReeN0NSWcnOddQVxkpbAzmE8LJH+iZFTO9y9JhqAg3q4rYxoUKq4wOVeztb
	 pTzB8xcNOyttKs0MpMYCGm0TM7o0uH/LgTeXFCXCad7zrhVIJfMjziIQQhPYf0wo3y
	 LwrL32e5PFnokVZoytxFkN+ht1ApxcP+nZMUSIkqYQd2b4GKg/C0JDywlr0BcHW25J
	 eCrpZw+foDy7w==
Date: Wed, 20 May 2026 13:55:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] PCI: mediatek: Use actual physical address
 instead of virt_to_phys()
Message-ID: <20260520185534.GA72799@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520183827.908243-2-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_115536_648426_1A8C9844 
X-CRM114-Status: GOOD (  25.43  )
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

On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The driver previously used virt_to_phys() on the ioremapped register base
> (port->base) to compute the MSI message address. Using virt_to_phys() on an
> IO mapped address is incorrect because it expects a kernel virtual address.
> 
> To fix it, store the physical start of the I/O register region in
> mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
> the incorrect virt_to_phys() usage and ensures MSI addresses are generated
> correctly.
> 
> Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 75722524fe74..c503fbd774d0 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
>  /**
>   * struct mtk_pcie_port - PCIe port information
>   * @base: IO mapped register base
> + * @phys_base: Physical address of the I/O register base region
>   * @list: port list
>   * @pcie: pointer to PCIe host info
>   * @reset: pointer to port reset control
> @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
>   */
>  struct mtk_pcie_port {
>  	void __iomem *base;
> +	phys_addr_t phys_base;
>  	struct list_head list;
>  	struct mtk_pcie *pcie;
>  	struct reset_control *reset;
> @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  	phys_addr_t addr;
>  
>  	/* MT2712/MT7622 only support 32-bit MSI addresses */
> -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> +	addr = port->phys_base + PCIE_MSI_VECTOR;

This doesn't look right because the MSI address is a PCI bus address,
and port->phys_base is a CPU physical address.  Often a PCI bus
address is the same as the CPU physical address, but not always.
I think the DT 'ranges' property tells you the translation.

>  	msg->address_hi = 0;
>  	msg->address_lo = lower_32_bits(addr);
>  
> @@ -520,7 +522,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
>  	u32 val;
>  	phys_addr_t msg_addr;
>  
> -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> +	msg_addr = port->phys_base + PCIE_MSI_VECTOR;
>  	val = lower_32_bits(msg_addr);
>  	writel(val, port->base + PCIE_IMSI_ADDR);
>  
> @@ -953,6 +955,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  	struct mtk_pcie_port *port;
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
> +	struct resource *res;
>  	char name[20];
>  	int err;
>  
> @@ -961,7 +964,14 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  		return -ENOMEM;
>  
>  	snprintf(name, sizeof(name), "port%d", slot);
> -	port->base = devm_platform_ioremap_resource_byname(pdev, name);
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +	if (!res) {
> +		dev_err(dev, "failed to get port%d base\n", slot);
> +		return -EINVAL;
> +	}
> +
> +	port->phys_base = res->start;
> +	port->base = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(port->base)) {
>  		dev_err(dev, "failed to map port%d base\n", slot);
>  		return PTR_ERR(port->base);
> -- 
> 2.39.5
> 

