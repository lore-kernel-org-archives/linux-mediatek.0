From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: mediatek: Remove unnecessary PCI_REASSIGN_* flags
Date: Mon, 3 Jul 2017 08:07:39 -0500
Message-ID: <20170703130739.GD13824@bhelgaas-glaptop.roam.corp.google.com>
References: <1499061300-55951-1-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499061300-55951-1-git-send-email-ryder.lee@mediatek.com>
Sender: linux-pci-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Jul 03, 2017 at 01:55:00PM +0800, Ryder Lee wrote:
> The PCI_REASSIGN_ALL_RSRC and PCI_REASSIGN_ALL_BUS flags are not needed,
> since we should automatically assign resources if the firmware hasn't done it.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Folded into pci/host-mediatek, thanks!

> ---
>  drivers/pci/host/pcie-mediatek.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/host/pcie-mediatek.c b/drivers/pci/host/pcie-mediatek.c
> index 51c6118..5a9d858 100644
> --- a/drivers/pci/host/pcie-mediatek.c
> +++ b/drivers/pci/host/pcie-mediatek.c
> @@ -478,7 +478,6 @@ static int mtk_pcie_register_host(struct pci_host_bridge *host)
>  	struct pci_bus *child;
>  	int err;
>  
> -	pci_add_flags(PCI_REASSIGN_ALL_RSRC | PCI_REASSIGN_ALL_BUS);
>  	host->busnr = pcie->busn.start;
>  	host->dev.parent = pcie->dev;
>  	host->ops = &mtk_pcie_ops;
> -- 
> 1.9.1
> 
