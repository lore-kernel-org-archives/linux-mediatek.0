From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC PATCH v2] PCI/portdrv: Support for subtractive decode bridge
Date: Thu, 14 Feb 2019 17:41:42 -0600
Message-ID: <20190214234142.GP96272@google.com>
References: <1550121677-10474-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550121677-10474-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: lorenzo.pieralisi@arm.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com, youlin.pei@mediatek.com, poza@codeaurora.org, fred@fredlawl.com, rafael.j.wysocki@intel.com, jianjun.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, Feb 14, 2019 at 01:21:17PM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> The Class Code for subtractive decode PCI-to-PCI bridge is 060401h,
> add one entry to make portdrv support this type bridge.
> 
> Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>

Applied to pci/portdrv for v5.1, thanks!

> ---
>  drivers/pci/pcie/portdrv_pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pcie/portdrv_pci.c b/drivers/pci/pcie/portdrv_pci.c
> index 0acca35..c129f2f 100644
> --- a/drivers/pci/pcie/portdrv_pci.c
> +++ b/drivers/pci/pcie/portdrv_pci.c
> @@ -185,6 +185,8 @@ static void pcie_portdrv_err_resume(struct pci_dev *dev)
>  static const struct pci_device_id port_pci_ids[] = { {
>  	/* handle any PCI-Express port */
>  	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0),
> +	/* subtractive decode PCI-to-PCI bridge, class type is 060401h */
> +	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x01), ~0),
>  	}, { /* end: all zeroes */ }
>  };
>  
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
