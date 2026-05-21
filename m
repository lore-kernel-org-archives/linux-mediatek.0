Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C951FCD343F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 05:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4KfFRjOYPoi5yAlTLcAC9uTr5/8FAckLXTA3F0vtgA=; b=yiczkaO0E7VenS795JH84RWG9s
	TQqU75ZdYB2f3wb7x3XnTNHtN5ll69dVisM8EONMMobnqjx8oT/oqwxIxFk3WmMUqPUccUK2vMd0Z
	qyaXWl186VMoWa6+OumX7+vIv9C1hh0I0Bteyjqjz2PnL32KonkFZ/lzcI9ZmCJGs3weVkH1+3kX3
	In0gvpxId3aA/o1xq9YluhqFejDaEHWTmbQ3/0cdozrZlvU903SASIGsF2pevT6t80kY9q10OD5y9
	09O9F9FQ33SI0CRVOFFEQVSOYNW17FVDjVApjjeKLucCSRSCJ8ozO55YpWk9JhQwvUuBLT59d+l0u
	6Z/T9kWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPvkf-00000006ie2-2ob2;
	Thu, 21 May 2026 05:15:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPvkd-00000006idR-0FIj
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 05:15:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED37342D7F;
	Thu, 21 May 2026 05:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797A91F000E9;
	Thu, 21 May 2026 05:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779340516;
	bh=z4KfFRjOYPoi5yAlTLcAC9uTr5/8FAckLXTA3F0vtgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fnIlBWIjjxk06AKwz13Ck1J7TKAPYJ+7/IibDB12moICXO+WTs37IRziBx9yI/xvk
	 hpbeggw0H+8m5OjOjqr9kak5WWOW5x/0nyZAcsvpwnlvhyDo+8IHy5vmv6RNNPr3TH
	 Kv29+KI4ZhFCpTtgLgXVSjtoF9Jvd5UPJTINWBMhv/Upmtrcd0bJeYFGKjr5szc0J6
	 POf1msKsTZ7Tz9y8bKvQnf6Bpez4m9zTUMzENBW3XS4DvLhIqvzIGtG9KGCnfQ0Fu6
	 JBudbJM4A3Q7/F9MtUQnEwEuDXU65zhNDorqJNBG63zwhlGNBQrF88jNpGniePcUY0
	 0cXSUtnw6eMcA==
Date: Thu, 21 May 2026 10:44:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-pci@vger.kernel.org, 
	linux-mips@vger.kernel.org, naseefkm@gmail.com, ryder.lee@mediatek.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] PCI: mediatek: Use actual physical address
 instead of virt_to_phys()
Message-ID: <7xfp5nbtd4qtonoqurfwoedsix7vondrnfeip53uwjintuvc6a@cg3ez6z3pii5>
References: <afd47d4b-8309-4025-a40b-29606fed3c50@cjdns.fr>
 <20260520195900.GA86018@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520195900.GA86018@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_221519_145547_54A88281 
X-CRM114-Status: GOOD (  43.96  )
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

On Wed, May 20, 2026 at 02:59:00PM -0500, Bjorn Helgaas wrote:
> On Wed, May 20, 2026 at 09:17:35PM +0200, Caleb James DeLisle wrote:
> > 
> > On 20/05/2026 20:55, Bjorn Helgaas wrote:
> > > On Wed, May 20, 2026 at 06:38:25PM +0000, Caleb James DeLisle wrote:
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > 
> > > > The driver previously used virt_to_phys() on the ioremapped register base
> > > > (port->base) to compute the MSI message address. Using virt_to_phys() on an
> > > > IO mapped address is incorrect because it expects a kernel virtual address.
> > > > 
> > > > To fix it, store the physical start of the I/O register region in
> > > > mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
> > > > the incorrect virt_to_phys() usage and ensures MSI addresses are generated
> > > > correctly.
> > > > 
> > > > Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > > > Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > > ---
> > > >   drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
> > > >   1 file changed, 13 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > > > index 75722524fe74..c503fbd774d0 100644
> > > > --- a/drivers/pci/controller/pcie-mediatek.c
> > > > +++ b/drivers/pci/controller/pcie-mediatek.c
> > > > @@ -175,6 +175,7 @@ struct mtk_pcie_soc {
> > > >   /**
> > > >    * struct mtk_pcie_port - PCIe port information
> > > >    * @base: IO mapped register base
> > > > + * @phys_base: Physical address of the I/O register base region
> > > >    * @list: port list
> > > >    * @pcie: pointer to PCIe host info
> > > >    * @reset: pointer to port reset control
> > > > @@ -196,6 +197,7 @@ struct mtk_pcie_soc {
> > > >    */
> > > >   struct mtk_pcie_port {
> > > >   	void __iomem *base;
> > > > +	phys_addr_t phys_base;
> > > >   	struct list_head list;
> > > >   	struct mtk_pcie *pcie;
> > > >   	struct reset_control *reset;
> > > > @@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
> > > >   	phys_addr_t addr;
> > > >   	/* MT2712/MT7622 only support 32-bit MSI addresses */
> > > > -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > > +	addr = port->phys_base + PCIE_MSI_VECTOR;
> > >
> > > This doesn't look right because the MSI address is a PCI bus address,
> > > and port->phys_base is a CPU physical address.  Often a PCI bus
> > > address is the same as the CPU physical address, but not always.
> > > I think the DT 'ranges' property tells you the translation.
> 
> Oops, sorry, I muddied the waters here.
> 
> 'ranges' tells you the translation applied by a bridge, e.g., when a
> CPU does a load/store, the PCI host bridge turns it into a PCI
> read/write transaction.  The bridge might add an offset to the CPU
> load/store physical address to get the PCI read/write bus address.
> 
> But that's not the issue here.  The MSI is basically a DMA write
> performed by the PCI device, not a store done by a CPU, so I don't
> think 'ranges' is the right thing to look at.
> 

Yeah, it is so easy to confuse both. To summarise, 'ranges' describes the
outbound translation and 'dma-ranges' describes the inbound translation from
host perspective.

> Based on this:
> https://elinux.org/Device_Tree_Usage#PCI_DMA_Address_Translation
> I think 'dma-ranges' is the relevant property.  I don't think your DT
> includes a 'dma-ranges' property, and in that case the default is that 
> the system bus (CPU) address is the same as the PCI address.
> 
> So I think this patch works because it assumes DMA addresses like the
> MSI address are mapped to identical system bus addresses.
> 
> It still seems to me that drivers should be prepared for the presence
> of dma-ranges and use it when computing the MSI target address.  But I
> don't think any drivers really do that, so for now I think you should
> pretend that I never responded about this patch.
> 

Your observations are correct. This driver assumes that the identical mapping
exists between CPU and PCI bus addresses. Usually, the drivers make use of
phys_to_dma() to handle the translations. This API internally makes use of the
'dma_range_map' which gets populated by the OF core based on the 'dma-ranges'
property (if present in DT).

But it makes sense to use it irrespective of whether the platform supports
non-identical DMA/inbound translation or not. Since this API behaves like a
no-op and returns the CPU physical address if there is an identical mapping,
there is literally zero overhead in using it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

