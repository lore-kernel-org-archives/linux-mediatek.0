From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH 00/11] PCI dma-ranges parsing consolidation
Date: Thu, 26 Sep 2019 09:49:00 +0100
Message-ID: <20190926084859.GB9720@e119886-lin.cambridge.arm.com>
References: <20190924214630.12817-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190924214630.12817-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Simon Horman <horms@verge.net.au>, linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, rfi@lists.rocketboards.orgl
List-Id: linux-mediatek@lists.infradead.org

On Tue, Sep 24, 2019 at 04:46:19PM -0500, Rob Herring wrote:
> This series moves the DT 'dma-ranges' parsing into common helpers
> utilizing a resource list. In the process of doing this, I noticed
> several cases where pci_parse_request_of_pci_ranges() could be used so
> I converted those drivers first. The last 5 patches make the actual
> change to use the common 'dma_ranges' resource list. There's no
> (intended) functional change in this series though I'm also working on
> a separate series to improve the handling of 'dma-ranges' and dma
> masks.
> 
> pci-rcar-gen2 is the only remaining driver doing its own dma-ranges
> handling as it is still using the old ARM PCI functions. Looks like it
> is the last one (in drivers/pci/).

It also seems that pcie-tango is using of_pci_dma_range_parser_init
and so parsing dma-ranges. Though it's using the dma_ranges for a
slightly different purpose.

Thanks,

Andrew Murray

> 
> Compile tested only.
> 
> Rob
> 
> Rob Herring (11):
>   PCI: aardvark: Use pci_parse_request_of_pci_ranges()
>   PCI: altera: Use pci_parse_request_of_pci_ranges()
>   PCI: mediatek: Use pci_parse_request_of_pci_ranges()
>   PCI: versatile: Enable COMPILE_TEST
>   PCI: versatile: Use pci_parse_request_of_pci_ranges()
>   PCI: of: Add inbound resource parsing to helpers
>   PCI: ftpci100: Use inbound resources for setup
>   PCI: v3-semi: Use inbound resources for setup
>   PCI: xgene: Use inbound resources for setup
>   PCI: iproc: Use inbound resources for setup
>   PCI: rcar: Use inbound resources for setup
> 
>  drivers/pci/controller/Kconfig                |  2 +-
>  .../pci/controller/dwc/pcie-designware-host.c |  3 +-
>  drivers/pci/controller/pci-aardvark.c         | 58 ++---------------
>  drivers/pci/controller/pci-ftpci100.c         | 29 ++++-----
>  drivers/pci/controller/pci-host-common.c      |  2 +-
>  drivers/pci/controller/pci-v3-semi.c          | 40 +++++-------
>  drivers/pci/controller/pci-versatile.c        | 62 ++++--------------
>  drivers/pci/controller/pci-xgene.c            | 33 ++++------
>  drivers/pci/controller/pcie-altera.c          | 38 +----------
>  drivers/pci/controller/pcie-cadence-host.c    |  2 +-
>  drivers/pci/controller/pcie-iproc-platform.c  |  1 +
>  drivers/pci/controller/pcie-iproc.c           | 63 +++----------------
>  drivers/pci/controller/pcie-mediatek.c        | 47 +++++---------
>  drivers/pci/controller/pcie-mobiveil.c        |  4 +-
>  drivers/pci/controller/pcie-rcar.c            | 48 ++++++--------
>  drivers/pci/controller/pcie-rockchip-host.c   |  3 +-
>  drivers/pci/controller/pcie-xilinx-nwl.c      |  2 +-
>  drivers/pci/controller/pcie-xilinx.c          |  2 +-
>  drivers/pci/of.c                              | 44 ++++++++++++-
>  drivers/pci/pci.h                             |  8 ++-
>  include/linux/pci.h                           |  2 +
>  21 files changed, 162 insertions(+), 331 deletions(-)
> 
> --
> 2.20.1
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
