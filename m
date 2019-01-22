From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: PCI: mediatek: Remove MSI inner domain
Date: Tue, 22 Jan 2019 11:35:00 +0800
Message-ID: <1548128100.11442.7.camel@mtkswgap22>
References: <1548071976-13279-1-git-send-email-jianjun.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548071976-13279-1-git-send-email-jianjun.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, matthias.bgg@gmail.com, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, honghui.zhang@mediatek.com, youlin.pei@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-01-21 at 19:59 +0800, Jianjun Wang wrote:
> There is no need to create the inner domain as a parent for MSI domian,
> some feature has been implemented by MSI framework.
> 
> Remove the inner domain and its irq chip, it will be more closer to the
> hardware implementation.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 82 +++++++++++---------------
>  1 file changed, 35 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 8d05df56158b..216e6fa8aec0 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -169,7 +169,6 @@ struct mtk_pcie_soc {
>   * @slot: port slot
>   * @irq: GIC irq
>   * @irq_domain: legacy INTx IRQ domain
> - * @inner_domain: inner IRQ domain
>   * @msi_domain: MSI IRQ domain
>   * @lock: protect the msi_irq_in_use bitmap
>   * @msi_irq_in_use: bit map for assigned MSI IRQ
> @@ -190,7 +189,6 @@ struct mtk_pcie_port {
>  	u32 slot;
>  	int irq;
>  	struct irq_domain *irq_domain;
> -	struct irq_domain *inner_domain;
>  	struct irq_domain *msi_domain;
>  	struct mutex lock;
>  	DECLARE_BITMAP(msi_irq_in_use, MTK_MSI_IRQS_NUM);
> @@ -418,22 +416,25 @@ static void mtk_msi_ack_irq(struct irq_data *data)
>  	u32 hwirq = data->hwirq;
>  
>  	writel(1 << hwirq, port->base + PCIE_IMSI_STATUS);
> +	writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
>  }
>  
> -static struct irq_chip mtk_msi_bottom_irq_chip = {
> -	.name			= "MTK MSI",
> +static struct irq_chip mtk_msi_irq_chip = {
> +	.name			= "MTK PCIe",
>  	.irq_compose_msi_msg	= mtk_compose_msi_msg,
> +	.irq_write_msi_msg	= pci_msi_domain_write_msg,
>  	.irq_set_affinity	= mtk_msi_set_affinity,
>  	.irq_ack		= mtk_msi_ack_irq,
> +	.irq_mask		= pci_msi_mask_irq,
> +	.irq_unmask		= pci_msi_unmask_irq,
>  };

(...omitted...)

To keep the patch simple, we don't need to adjust the position for
mtk_msi_irq_chip.

> -
> -static struct irq_chip mtk_msi_irq_chip = {
> -	.name		= "MTK PCIe MSI",
> -	.irq_ack	= irq_chip_ack_parent,
> -	.irq_mask	= pci_msi_mask_irq,
> -	.irq_unmask	= pci_msi_unmask_irq,
> +static struct msi_domain_ops mtk_msi_domain_ops = {
> +	.get_hwirq	= mtk_pcie_msi_get_hwirq,
> +	.msi_free	= mtk_pcie_msi_free,
>  };
>  
>  static struct msi_domain_info mtk_msi_domain_info = {
> -	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> -		   MSI_FLAG_PCI_MSIX),
> -	.chip	= &mtk_msi_irq_chip,
> +	.flags		= (MSI_FLAG_USE_DEF_DOM_OPS |
> +			   MSI_FLAG_USE_DEF_CHIP_OPS | MSI_FLAG_PCI_MSIX),
> +	.ops		= &mtk_msi_domain_ops,
> +	.chip		= &mtk_msi_irq_chip,
> +	.handler	= handle_edge_irq,
> +	.handler_name	= "MSI",
>  };
>  
