From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC PATCH] PCI/portdrv: Support for subtractive decode bridge
Date: Thu, 7 Feb 2019 09:18:16 -0600
Message-ID: <20190207151816.GI7268@google.com>
References: <1544758829-10327-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544758829-10327-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: lorenzo.pieralisi@arm.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com, youlin.pei@mediatek.com, poza@codeaurora.org, fred@fredlawl.com, rafael.j.wysocki@intel.com, jianjun.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi Honghui,

On Fri, Dec 14, 2018 at 11:40:29AM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> The Class Code for subtractive decode PCI-to-PCI bridge is 060401h,
> change the class_mask values to make portdrv support this type bridge.

I assume you have a Root Port or Switch Port that supports subtractive
decode?  I'm trying to understand how such a device would work.

Out of curiosity, can you show the "lspci -vv" output for the device
and the downstream devices of interest?

Do you happen to know whether this functionality is configurable,
e.g., is there some way software can enable or disable subtractive
decode?  I assume this would be some device-specific thing, because I
can't find anything in the Bridge Control register or similar.  The
PCIe spec doesn't even contain the word "subtractive".

The "PCI Express to PCI/PCI-X Bridge Specification", r1.0, says a PCI
Express bridge (which would include Root Ports and Switch Ports) has a
Class Code of 0x060400 (Non-Subtractive PCI-PCI Bridge) (sec 1.1).

Sec 1.3.4 says subtractive decode on the primary interface is "not
applicable or outside the scope of this spec".

Bjorn

> Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> ---
>  drivers/pci/pcie/portdrv_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/portdrv_pci.c b/drivers/pci/pcie/portdrv_pci.c
> index eef22dc..86926ea 100644
> --- a/drivers/pci/pcie/portdrv_pci.c
> +++ b/drivers/pci/pcie/portdrv_pci.c
> @@ -179,7 +179,7 @@ static void pcie_portdrv_err_resume(struct pci_dev *dev)
>   */
>  static const struct pci_device_id port_pci_ids[] = { {
>  	/* handle any PCI-Express port */
> -	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0),
> +	PCI_DEVICE_CLASS(((PCI_CLASS_BRIDGE_PCI << 8) | 0x00), ~0x01),
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
