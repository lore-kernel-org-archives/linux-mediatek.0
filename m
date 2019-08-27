From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: mediatek: Remove surplus return from a void function
Date: Tue, 27 Aug 2019 18:11:33 -0500
Message-ID: <20190827231133.GG9987@google.com>
References: <20190825221039.6977-1-kw@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190825221039.6977-1-kw@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Aug 26, 2019 at 12:10:39AM +0200, Krzysztof Wilczynski wrote:
> Remove unnecessary empty return statement at the
> end of a void function mtk_pcie_intr_handler() in
> the drivers/pci/controller/pcie-mediatek.c.
> 
> The surplus return statement was added as part of
> the work in commit 42fe2f91b4eb ("PCI: mediatek:
> Implement chained IRQ handling setup").
> 
> Signed-off-by: Krzysztof Wilczynski <kw@linux.com>

I squashed this together with the other patch doing the same thing.
If it causes any conflict with Lorenzo's branches, I'll resolve it
when merging.

> ---
>  drivers/pci/controller/pcie-mediatek.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 3eaa7081ab2a..626a7c352dfd 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -635,8 +635,6 @@ static void mtk_pcie_intr_handler(struct irq_desc *desc)
>  	}
>  
>  	chained_irq_exit(irqchip, desc);
> -
> -	return;
>  }
>  
>  static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
> -- 
> 2.22.1
> 
