From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v3 0/2] PCI: mediatek: enable whole MMIO range and
 enlarge the PCIe2AHB window size
Date: Fri, 1 Mar 2019 11:30:26 +0000
Message-ID: <20190301113026.GA17669@e107981-ln.cambridge.arm.com>
References: <1548999367-11733-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548999367-11733-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, rafael.j.wysocki@intel.com, fred@fredlawl.com, poza@codeaurora.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Fri, Feb 01, 2019 at 01:36:05PM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> Two patches:
> patch 1 enable whole MMIO range which also fix the complain of scripts/coccinelle/api/resource_size.cocci
> patch 2 enlarge the PCIe2AHB window size to support fully access of 4GB DRAM from EP DMA.
> 
> v3:
>  - update the changlog title for patch1 and update commit message following Bjorn's suggestion
>  - move the "|" into the previous line.
> 
> v2:
>  - Fix the checkpatch complains for patch 1.
>  - update the commit message and change title of patch 1 for changelog conventions.
>  - Add patch 2.
> 
> Honghui Zhang (2):
>   PCI: mediatek: Enable the whole memory mapped IO range
>   PCI: mediatek: Enlarge PCIe2AHB window size to support 4GB DRAM
> 
>  drivers/pci/controller/pcie-mediatek.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

I have basically rewritten the commit logs and applied the
patches to pci/mediatek for v5.1 (pending testing), please
have a look.

Lorenzo
