From: Honghui Zhang <honghui.zhang@mediatek.com>
Subject: Re: [PATCH v3 2/2] PCI: mediatek: Enlarge PCIe2AHB window size to
 support 4GB DRAM
Date: Fri, 1 Mar 2019 09:58:26 +0800
Message-ID: <1551405506.32061.18.camel@mhfsdcap03>
References: <1548999367-11733-1-git-send-email-honghui.zhang@mediatek.com>
         <1548999367-11733-3-git-send-email-honghui.zhang@mediatek.com>
         <20190228174257.GA26501@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228174257.GA26501@e107981-ln.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, rafael.j.wysocki@intel.com, fred@fredlawl.com, poza@codeaurora.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2019-02-28 at 17:42 +0000, Lorenzo Pieralisi wrote:
> On Fri, Feb 01, 2019 at 01:36:07PM +0800, honghui.zhang@mediatek.com wrote:
> > From: Honghui Zhang <honghui.zhang@mediatek.com>
> > 
> > The PCIE_AXI_WINDOW0 defines the translate window size for the request
> > from EP side. Request outside of this window will be treated as
> > unsupported request.
> > 
> > Enlarge this window size from fls(0xffffffff) to 2^33 to support 8GB
> > translate address range then EP DMA is capable of fully access 4GB
> > DRAM range(physical DRAM is start from 0x40000000).
> 
> I have rewritten both patches logs with the aim of merging them even if
> it is quite late in the cycle, first you have to explain something to
> me.
> 

Thanks very much for this.

> fls(0xffffffff) = 0x1f, which by your logic -> 2^31
> 
> What does it mean given what you say above ? That PCI devices can't
> do _any_ DMA in the current setting (given the DRAM start address) ?
> 

I'm afraid so.
>From the HW datasheet I got from our HW designer, the description for
this pcie2axi_win_size filed is
" Possible values are 12 to 36 which means 2^12 to 2^36 bytes, leaving
this filed to 0 causes window to be disabled."

Current setting set the window size as 2^31, which means the request
from EP side could only access the address range from 0 to 0x8000_0000.
Considering the DRAM start from 0x4000_0000, that means only the first
1GB(0x4000_0000 ~ 0x8000_0000) could be accessed by EP side DMA.

This has not run into an error for our current usage, I guess because
MT2712 and MT7622 have several type boards, most of are only have 2GB
physical memory, and our test sample is not bigger enough to cover the
case that EP DMA will access fully DRAM. Or most EP device does not have
an built-in DMA engine, they may relay on the host side's MMIO(memory
mapped IO) operations.
 
Take MT2712 as example, in arch/arm64/boot/dts/mediatek/mt2712-evb.dts,
the physical memory size is defined as 0x80000000 and is described by
below node:

memory@400000000 {
	device_type = "memory";
	reg = <0 0x400000000 0 0x800000000>
}

Thanks.

> Lorenzo
> 
> > Reported-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index c42fe5c..0b6c728 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -90,6 +90,12 @@
> >  #define AHB2PCIE_SIZE(x)	((x) & GENMASK(4, 0))
> >  #define PCIE_AXI_WINDOW0	0x448
> >  #define WIN_ENABLE		BIT(7)
> > +/*
> > + * Define PCIe to AHB window size as 2^33 to support max 8GB address space
> > + * translate, support least 4GB DRAM size access from EP DMA(physical DRAM
> > + * start from 0x40000000).
> > + */
> > +#define PCIE2AHB_SIZE	0x21
> >  
> >  /* PCIe V2 configuration transaction header */
> >  #define PCIE_CFG_HEADER0	0x460
> > @@ -713,7 +719,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> >  	writel(val, port->base + PCIE_AHB_TRANS_BASE0_H);
> >  
> >  	/* Set PCIe to AXI translation memory space.*/
> > -	val = fls(0xffffffff) | WIN_ENABLE;
> > +	val = PCIE2AHB_SIZE | WIN_ENABLE;
> >  	writel(val, port->base + PCIE_AXI_WINDOW0);
> >  
> >  	return 0;
> > -- 
> > 2.6.4
> > 
