From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 1/2] PCI: mediatek: Use resource_size function on
 resource object
Date: Thu, 31 Jan 2019 15:36:48 -0600
Message-ID: <20190131213647.GP229773@google.com>
References: <1548921713-5355-1-git-send-email-honghui.zhang@mediatek.com>
 <1548921713-5355-2-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548921713-5355-2-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: lorenzo.pieralisi@arm.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, youlin.pei@mediatek.com, poza@codeaurora.org, fred@fredlawl.com, rafael.j.wysocki@intel.com, jianjun.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jan 31, 2019 at 04:01:52PM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> scripts/coccinelle/api/resource_size.cocci complain about the
> following warning:
> 
> pcie-mediatek.c:720:13-16: WARNING: Suspicious code. resource_size is maybe missing with mem
> 
> Use resource_size(mem) instead of mem->end - mem->start to eliminate the
> complain. Since the MMIO window size for both MT2712 and MT7622 are all
> 0x1000_0000, this change also fix the AHB2PCIe window size smaller than
> HW MMIO window size issue by change the values of fls(size) from
> fls(0xfff_ffff) to fls(0x1000_0000).

Good, I'm glad this actually fixes a bug.  The warning was actually
useful!

Since that's the case, the *bug* is the important thing (not the
warning), and the subject line should be about the bug fix.  The fact
that it also happens to remove a warning is really just incidental.

You say "the AHB2PCIe window size smaller than HW MMIO window size
issue" as though it should be familiar to us.  But it's not :)

So the changelog needs to start by explaining what the AHB2PCIe window
size issue is, mention what user-visible problem that causes, then
explain how you're fixing it by using resource_size().

Then you can mention that this also incidentally removes a coccinelle
warning.

Bjorn

> Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 55e471c..01126b8 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -654,7 +654,6 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  	struct resource *mem = &pcie->mem;
>  	const struct mtk_pcie_soc *soc = port->pcie->soc;
>  	u32 val;
> -	size_t size;
>  	int err;
>  
>  	/* MT7622 platforms need to enable LTSSM and ASPM from PCIe subsys */
> @@ -706,8 +705,8 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  		mtk_pcie_enable_msi(port);
>  
>  	/* Set AHB to PCIe translation windows */
> -	size = mem->end - mem->start;
> -	val = lower_32_bits(mem->start) | AHB2PCIE_SIZE(fls(size));
> +	val = lower_32_bits(mem->start)
> +	      | AHB2PCIE_SIZE(fls(resource_size(mem)));

Nit: I think it's more typical to put the "|" on the first line.

>  	writel(val, port->base + PCIE_AHB_TRANS_BASE0_L);
>  
>  	val = upper_32_bits(mem->start);
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
