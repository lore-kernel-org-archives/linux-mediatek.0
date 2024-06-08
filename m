Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CEEC27C55
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jun 2024 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgOr5dEBzKrib0eh6/febDpvDs2TElOegd1LgxAM4fs=; b=hOj9+nUsjRaLkwfTRajt9Z+DxI
	APer7JKCxIsDhrn76LjZkMSjdeHxtGM+5qUbhdFNRbLUQsC9Nnlo9mFLmZcOfbxsLU49dVi6BMgb2
	F/zwzQ+GcPOGLb7nnK39b/+KhEAp9/09HZcuY6LBdbAB/nJelg/ovNbxPWd8fKh5EImLNwZhgbWZH
	b2iDC4oBVp2xr+4MEkQid/cSm5hHybTJ23rWGzGmXYXww5V+izaucwS06EX0BdVPn7ggjWNmr0WoA
	glk5ALDtpv4EGeb4c7iUNwsbq3i6wRR7YZc8H7c4Vm+xoa3R6L24CRR8B9ditIgSON72mSbrcowZm
	6GscVbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFrxt-0000000H2L8-1I8i;
	Sat, 08 Jun 2024 09:02:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFrxp-0000000H2JW-0bt9;
	Sat, 08 Jun 2024 09:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D10AACE1E73;
	Sat,  8 Jun 2024 09:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA99C3277B;
	Sat,  8 Jun 2024 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717837331;
	bh=pn6sRt29wjeooIZHAWfVIge2Odfg9sfeFnnF7t2PQuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fw+w9GB1UmC8TQLf64V1fuur1RM2TjOW/V8lr4NXyEn6EUHIfKYiNfhRMmFPDKmP+
	 dVge0rIhzSrAw6QofLByJrE/cNLWbUXA32ccna84Yq6XMoIKpkSLMFm/FRRCRLL5xt
	 BI0LQixNhmeqlU2UP/zxrcwYi2RRk9AUZ3wuLPbwKSa6NPQi/j+zSMcvtUrrZq7o4Y
	 gW1dHg41ja/7I0eG0rBvW9kIV8U7WVUYdLs5wjOTxY4C6AnJxY/jt43JknorAADdj3
	 DkzGwbkBRu+j3P0B8NQCLODsqiMLaQ75cXph3YBq9OzU+RXsunrCiKLVIVnXZutifq
	 H4Sav7rFkWzTg==
Date: Sat, 8 Jun 2024 14:31:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Marc Zyngier <maz@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
	qizhong.cheng@mediatek.com, jian.yang@mediatek.com,
	jianguo.zhang@mediatek.com
Subject: Re: [PATCH v2 1/3] PCI: mediatek: Allocate MSI address with
 dmam_alloc_coherent()
Message-ID: <20240608090152.GB3282@thinkpad>
References: <20231211085256.31292-1-jianjun.wang@mediatek.com>
 <20231211085256.31292-2-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211085256.31292-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_020217_570841_AD6E2080 
X-CRM114-Status: GOOD (  20.89  )
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

On Mon, Dec 11, 2023 at 04:52:54PM +0800, Jianjun Wang wrote:
> Use dmam_alloc_coherent() to allocate the MSI address, instead of using
> virt_to_phys().
> 

What is the reason for this change? So now PCIE_MSI_VECTOR becomes unused?

- Mani

> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 66a8f73296fc..2fb9e44369f8 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -178,6 +178,7 @@ struct mtk_pcie_soc {
>   * @phy: pointer to PHY control block
>   * @slot: port slot
>   * @irq: GIC irq
> + * @msg_addr: MSI message address
>   * @irq_domain: legacy INTx IRQ domain
>   * @inner_domain: inner IRQ domain
>   * @msi_domain: MSI IRQ domain
> @@ -198,6 +199,7 @@ struct mtk_pcie_port {
>  	struct phy *phy;
>  	u32 slot;
>  	int irq;
> +	dma_addr_t msg_addr;
>  	struct irq_domain *irq_domain;
>  	struct irq_domain *inner_domain;
>  	struct irq_domain *msi_domain;
> @@ -394,12 +396,10 @@ static struct pci_ops mtk_pcie_ops_v2 = {
>  static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  {
>  	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> -	phys_addr_t addr;
>  
>  	/* MT2712/MT7622 only support 32-bit MSI addresses */
> -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
>  	msg->address_hi = 0;
> -	msg->address_lo = lower_32_bits(addr);
> +	msg->address_lo = lower_32_bits(port->msg_addr);
>  
>  	msg->data = data->hwirq;
>  
> @@ -494,6 +494,14 @@ static struct msi_domain_info mtk_msi_domain_info = {
>  static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
>  {
>  	struct fwnode_handle *fwnode = of_node_to_fwnode(port->pcie->dev->of_node);
> +	void *msi_vaddr;
> +
> +	msi_vaddr = dmam_alloc_coherent(port->pcie->dev, sizeof(dma_addr_t), &port->msg_addr,
> +					GFP_KERNEL);
> +	if (!msi_vaddr) {
> +		dev_err(port->pcie->dev, "failed to alloc and map MSI address\n");
> +		return -ENOMEM;
> +	}
>  
>  	mutex_init(&port->lock);
>  
> @@ -501,6 +509,7 @@ static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
>  						      &msi_domain_ops, port);
>  	if (!port->inner_domain) {
>  		dev_err(port->pcie->dev, "failed to create IRQ domain\n");
> +		dmam_free_coherent(port->pcie->dev, sizeof(dma_addr_t), msi_vaddr, port->msg_addr);
>  		return -ENOMEM;
>  	}
>  
> @@ -508,6 +517,7 @@ static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
>  						     port->inner_domain);
>  	if (!port->msi_domain) {
>  		dev_err(port->pcie->dev, "failed to create MSI domain\n");
> +		dmam_free_coherent(port->pcie->dev, sizeof(dma_addr_t), msi_vaddr, port->msg_addr);
>  		irq_domain_remove(port->inner_domain);
>  		return -ENOMEM;
>  	}
> @@ -518,10 +528,8 @@ static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
>  static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
>  {
>  	u32 val;
> -	phys_addr_t msg_addr;
>  
> -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> -	val = lower_32_bits(msg_addr);
> +	val = lower_32_bits(port->msg_addr);
>  	writel(val, port->base + PCIE_IMSI_ADDR);
>  
>  	val = readl(port->base + PCIE_INT_MASK);
> @@ -588,7 +596,7 @@ static int mtk_pcie_init_irq_domain(struct mtk_pcie_port *port,
>  	if (IS_ENABLED(CONFIG_PCI_MSI)) {
>  		ret = mtk_pcie_allocate_msi_domains(port);
>  		if (ret)
> -			return ret;
> +			dev_warn(dev, "no MSI supported, only INTx available\n");
>  	}
>  
>  	return 0;
> @@ -732,7 +740,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  	val &= ~INTX_MASK;
>  	writel(val, port->base + PCIE_INT_MASK);
>  
> -	if (IS_ENABLED(CONFIG_PCI_MSI))
> +	if (IS_ENABLED(CONFIG_PCI_MSI) && port->msi_domain)
>  		mtk_pcie_enable_msi(port);
>  
>  	/* Set AHB to PCIe translation windows */
> -- 
> 2.18.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

