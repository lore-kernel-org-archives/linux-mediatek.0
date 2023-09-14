Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD699EEAA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 20:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=MZxAht8jTLv7z6EZtI9dGFbhoaJ2efnvZP4oAznBZ4o=; b=4/+pvylqqQvvX8
	XhnI4vxO2JfN+bEYOXn29HyT47Y+fhV3z41SoVZIo5MFymmjPl0AfmM5ka8SLFQhglNurCACMGF4s
	I0zi5bw4bqBI0y6B6zFByJNs2PhyGs6+XF0v/8EY86EbWVQ4kyD6KhSYpNk1PuFmKlWSp2oYmR8p3
	kqonn84Bbe4lZ7C1M80AO/Vf1kTkXDKih+eOcSnapHHwLox6Y/77I/PLaoOlahEbsyOCXbg6TXfAq
	k+jmDlW7dFlCKugR3gRovr3U8PdxXu26rfqXEF8w+ddDglJMarN5CkB7+O3jc8LASB7FqwHwcljAF
	5XH1ndNAQ7l4oGXlaHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgt0D-009EMI-2K;
	Thu, 14 Sep 2023 20:31:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgt0A-009EJc-0W;
	Thu, 14 Sep 2023 20:31:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1050661DB4;
	Thu, 14 Sep 2023 20:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BACC433C7;
	Thu, 14 Sep 2023 20:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694723508;
	bh=89k015Gz7Ucfa7Gt/0hyjJ/9BQs4PGxPaTPa/kgHOS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=E+YofmZcXE0gNWkZ+7cHh1uL2cmTO+OXsR/gPC2Vf7IIbQ1qtlYtv65NFq+GwLfeP
	 pZtoTJ4oCVBoo4aPXjjL/2fnW4iGhh29WccaG2lGZOskJHlyJgYHvxUMq4xgZstrVp
	 xIJ9P0iTqPq+h68UbGt1YqwdWh7a7tGlgwIAx0NznoSwSHme6VKdFbtzjTZEltU8w9
	 IlL1yFx6ul2W/rI+tZyUdNLxA8FAQLd1Q9ZqFUHLasBvxuMEw4H9e277d3Q+f8PKgJ
	 EcTl7Lx1ryd6T6tr6Lo+rm7/BfMcR+lSbQubtWVL/+A8aJ8T6L6ZYgdd04OqoQbkBx
	 nledCokN4sPfQ==
Date: Thu, 14 Sep 2023 15:31:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/1] PCI: mediatek: Correct type for virt_to_phys()
Message-ID: <20230914203146.GA77870@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914192324.672997-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_133150_286978_6500B9D6 
X-CRM114-Status: GOOD (  21.07  )
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

On Thu, Sep 14, 2023 at 10:23:24PM +0300, Andy Shevchenko wrote:
> virt_to_phys() takes a regular pointer, while driver supplies __iomem
> annotated one. Force type to void to make sparse happy, otherwise
> 
>    pcie-mediatek.c:400:40: sparse:     expected void volatile *address
>    pcie-mediatek.c:400:40: sparse:     got void [noderef] __iomem *
> 
>    pcie-mediatek.c:523:44: sparse:     expected void volatile *address
>    pcie-mediatek.c:523:44: sparse:     got void [noderef] __iomem *
> 
> Reported-by: Huacai Chen <chenhuacai@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309072237.9zxMv4MZ-lkp@intel.com/
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 66a8f73296fc..5e795afd1cee 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -397,7 +397,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  	phys_addr_t addr;
>  
>  	/* MT2712/MT7622 only support 32-bit MSI addresses */
> -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> +	addr = virt_to_phys((__force void *)port->base + PCIE_MSI_VECTOR);

Lots of these drivers use either virt_to_phys() or
platform_get_resource_byname() to get a physical address that they
then use as the MSI target.

But I don't think that's quite right -- the MSI is a DMA transaction
on PCI, and in general there's no guarantee that bus addresses are
identical to CPU physical addresses, so shouldn't we use a dma_addr_t
obtained from the DMA API?

dw_pcie_msi_host_init() has a complicated version of this that uses
dmam_alloc_coherent().

>  	msg->address_hi = 0;
>  	msg->address_lo = lower_32_bits(addr);
>  
> @@ -520,7 +520,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
>  	u32 val;
>  	phys_addr_t msg_addr;
>  
> -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> +	msg_addr = virt_to_phys((__force void *)port->base + PCIE_MSI_VECTOR);
>  	val = lower_32_bits(msg_addr);
>  	writel(val, port->base + PCIE_IMSI_ADDR);
>  
> -- 
> 2.40.0.1.gaa8946217a0b
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

