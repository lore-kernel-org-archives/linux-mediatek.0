Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EFFCD4F5E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cBYu2GQc6MoTLCxtxKTqbYy4E2npoA7fcMHsRIGQpuM=; b=H1SkAA44+V7f68xzltmLy5Ozph
	puX6QcGLQIHFwNlzkKpaHF1+0iw4GNdsGNY5gaOb+nBnboaszD6FGH8HY4s1Pxk8afDGsNAFwJeFS
	HO+OiZyihrF68hB4Cscfmz+QkkkvEYzJvwcytCdOCQrimJuhyC5e/mS2dyq8Noyk3QTTzYuYo9YAQ
	asjo9HIGQAe9mnoMpjagw4kYlw2q15eKrVYd4mrDQrEmsVHgnzexip/PsPxLGDp6FbKasv+WwJKV5
	iInS9qlZp7sm/zReLa3IsmsDBFeILADNAPK7wvZGy2G3hfm/j2Id1AnDdbRS3wAmTWMu4SSXPxpw0
	tS9o4wbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPn4K-00000005gEi-1vjO;
	Wed, 20 May 2026 19:59:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPn4I-00000005gEO-2gt0
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 19:59:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id BE5E2601E8;
	Wed, 20 May 2026 19:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 47DCB1F00893;
	Wed, 20 May 2026 19:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779307141;
	bh=cBYu2GQc6MoTLCxtxKTqbYy4E2npoA7fcMHsRIGQpuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=KkG0h3HZCk2u4rbRBRv1CRod6SfsAyCcBeaNM8cXJDiOoqTVrKR15PLdmEaPWSnNl
	 pxPerPBzkwH1UCir9Njn+6W9nb5LQP/AZ7ySB5sXMV/LDLVfjYjyTUZy2ilvSocas8
	 IQjfxSBYl31SiQ4AKTPF/MweXa5NRZpbOQhaF0knIXM2IXpJ7nFVh9qMppxMCP25mP
	 xWzwu8YiYpH39K8q5reCKndbBuvClS30jWNCOKawY0diQkct9rl3NlbRtwfzmreS9V
	 nrKAcd0S1yjwPdZolN+5R7KHUrhT73680UQIEiOfBBcDozpi7OE+vxVN625y0knHD1
	 BzVOFOEIe1Y/g==
Date: Wed, 20 May 2026 14:59:00 -0500
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
Message-ID: <20260520195900.GA86018@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afd47d4b-8309-4025-a40b-29606fed3c50@cjdns.fr>
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

On Wed, May 20, 2026 at 09:17:35PM +0200, Caleb James DeLisle wrote:
> 
> On 20/05/2026 20:55, Bjorn Helgaas wrote:
> > On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > 
> > > The driver previously used virt_to_phys() on the ioremapped register base
> > > (port->base) to compute the MSI message address. Using virt_to_phys() on an
> > > IO mapped address is incorrect because it expects a kernel virtual address.
> > > 
> > > To fix it, store the physical start of the I/O register region in
> > > mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
> > > the incorrect virt_to_phys() usage and ensures MSI addresses are generated
> > > correctly.
> > > 
> > > Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > ---
> > >   drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
> > >   1 file changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > > index 75722524fe74..c503fbd774d0 100644
> > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
> > >   /**
> > >    * struct mtk_pcie_port - PCIe port information
> > >    * @base: IO mapped register base
> > > + * @phys_base: Physical address of the I/O register base region
> > >    * @list: port list
> > >    * @pcie: pointer to PCIe host info
> > >    * @reset: pointer to port reset control
> > > @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
> > >    */
> > >   struct mtk_pcie_port {
> > >   	void __iomem *base;
> > > +	phys_addr_t phys_base;
> > >   	struct list_head list;
> > >   	struct mtk_pcie *pcie;
> > >   	struct reset_control *reset;
> > > @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> > >   	phys_addr_t addr;
> > >   	/* MT2712/MT7622 only support 32-bit MSI addresses */
> > > -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > +	addr = port->phys_base + PCIE_MSI_VECTOR;
> >
> > This doesn't look right because the MSI address is a PCI bus address,
> > and port->phys_base is a CPU physical address.  Often a PCI bus
> > address is the same as the CPU physical address, but not always.
> > I think the DT 'ranges' property tells you the translation.

Oops, sorry, I muddied the waters here.

'ranges' tells you the translation applied by a bridge, e.g., when a
CPU does a load/store, the PCI host bridge turns it into a PCI
read/write transaction.  The bridge might add an offset to the CPU
load/store physical address to get the PCI read/write bus address.

But that's not the issue here.  The MSI is basically a DMA write
performed by the PCI device, not a store done by a CPU, so I don't
think 'ranges' is the right thing to look at.

Based on this:
https://elinux.org/Device_Tree_Usage#PCI_DMA_Address_Translation
I think 'dma-ranges' is the relevant property.  I don't think your DT
includes a 'dma-ranges' property, and in that case the default is that 
the system bus (CPU) address is the same as the PCI address.

So I think this patch works because it assumes DMA addresses like the
MSI address are mapped to identical system bus addresses.

It still seems to me that drivers should be prepared for the presence
of dma-ranges and use it when computing the MSI target address.  But I
don't think any drivers really do that, so for now I think you should
pretend that I never responded about this patch.

> This is all still a little over my head here, but my understanding was that
> this is in the middle of the device's register map because the DT has the
> following:
> 
> reg = <0x1fb83000 0x1000>;
> reg-names = "port1";
> 
> Per the manual, that offset (base + 0xc0) is in undocumented area but it's
> in the registers.
> 
> The PCI memory is 0x20000000 - 0x2fffffff and we split it between the two
> devices. Here's the one using the upper half:
> 
>         ranges = <0x81000000 0 0x00000000 0x1f608000 0 0x00008000>,  (IO)
> 
>              <0x82000000 0 0x28000000 0x28000000 0 0x08000000>;      (MEM)
> 
> Hope I'm adding something useful here... Let me know if you want me to get
> or test anything else.

Obviously it's over my head too, so I'm sorry I confused the
situation.

> > >   	msg->address_hi = 0;
> > >   	msg->address_lo = lower_32_bits(addr);
> > > @@ -520,7 +522,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
> > >   	u32 val;
> > >   	phys_addr_t msg_addr;
> > > -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > +	msg_addr = port->phys_base + PCIE_MSI_VECTOR;
> > >   	val = lower_32_bits(msg_addr);
> > >   	writel(val, port->base + PCIE_IMSI_ADDR);
> > > @@ -953,6 +955,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
> > >   	struct mtk_pcie_port *port;
> > >   	struct device *dev = pcie->dev;
> > >   	struct platform_device *pdev = to_platform_device(dev);
> > > +	struct resource *res;
> > >   	char name[20];
> > >   	int err;
> > > @@ -961,7 +964,14 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
> > >   		return -ENOMEM;
> > >   	snprintf(name, sizeof(name), "port%d", slot);
> > > -	port->base = devm_platform_ioremap_resource_byname(pdev, name);
> > > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> > > +	if (!res) {
> > > +		dev_err(dev, "failed to get port%d base\n", slot);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	port->phys_base = res->start;
> > > +	port->base = devm_ioremap_resource(&pdev->dev, res);
> > >   	if (IS_ERR(port->base)) {
> > >   		dev_err(dev, "failed to map port%d base\n", slot);
> > >   		return PTR_ERR(port->base);
> > > -- 
> > > 2.39.5
> > > 

