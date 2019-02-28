From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v3 2/2] PCI: mediatek: Enlarge PCIe2AHB window size to
 support 4GB DRAM
Date: Thu, 28 Feb 2019 17:42:57 +0000
Message-ID: <20190228174257.GA26501@e107981-ln.cambridge.arm.com>
References: <1548999367-11733-1-git-send-email-honghui.zhang@mediatek.com>
 <1548999367-11733-3-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548999367-11733-3-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, rafael.j.wysocki@intel.com, fred@fredlawl.com, poza@codeaurora.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Fri, Feb 01, 2019 at 01:36:07PM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> The PCIE_AXI_WINDOW0 defines the translate window size for the request
> from EP side. Request outside of this window will be treated as
> unsupported request.
> 
> Enlarge this window size from fls(0xffffffff) to 2^33 to support 8GB
> translate address range then EP DMA is capable of fully access 4GB
> DRAM range(physical DRAM is start from 0x40000000).

I have rewritten both patches logs with the aim of merging them even if
it is quite late in the cycle, first you have to explain something to
me.

fls(0xffffffff) = 0x1f, which by your logic -> 2^31

What does it mean given what you say above ? That PCI devices can't
do _any_ DMA in the current setting (given the DRAM start address) ?

Lorenzo

> Reported-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index c42fe5c..0b6c728 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -90,6 +90,12 @@
>  #define AHB2PCIE_SIZE(x)	((x) & GENMASK(4, 0))
>  #define PCIE_AXI_WINDOW0	0x448
>  #define WIN_ENABLE		BIT(7)
> +/*
> + * Define PCIe to AHB window size as 2^33 to support max 8GB address space
> + * translate, support least 4GB DRAM size access from EP DMA(physical DRAM
> + * start from 0x40000000).
> + */
> +#define PCIE2AHB_SIZE	0x21
>  
>  /* PCIe V2 configuration transaction header */
>  #define PCIE_CFG_HEADER0	0x460
> @@ -713,7 +719,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
>  
>  	/* Set PCIe to AXI translation memory space.*/
> -	val = fls(0xffffffff) | WIN_ENABLE;
> +	val = PCIE2AHB_SIZE | WIN_ENABLE;
>  	writel(val, port->base + PCIE_AXI_WINDOW0);
>  
>  	return 0;
> -- 
> 2.6.4
> 
