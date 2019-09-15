From: Satendra Singh Thakur <sst2005@gmail.com>
Subject: [PATCH 0/9] added helper macros to remove duplicate code from probe functions of the platform drivers
Date: Sun, 15 Sep 2019 12:30:03 +0530
Message-ID: <20190915070003.21260-1-sst2005@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dan.j.williams@intel.com, vkoul@kernel.org, jun.nie@linaro.org, shawnguo@kernel.org, agross@kernel.org, sean.wang@mediatek.com, matthias.bgg@gmail.com, maxime.ripard@bootlin.com, wens@csie.org, lars@metafoo.de, afaerber@suse.de, manivannan.sadhasivam@linaro.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, satendrasingh.thakur@hcl.com, Satendra Singh Thakur <sst2005@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

1. For most of the platform drivers's probe include following steps

-memory allocation for driver's private structure
-getting io resources
-io remapping resources
-getting irq number
-registering irq
-setting driver's private data
-getting clock
-preparing and enabling clock

2. We have defined a set of macros to combine some or all of
the above mentioned steps. This will remove redundant/duplicate
code in drivers' probe functions of platform drivers.

devm_platform_probe_helper(pdev, priv, clk_name);
devm_platform_probe_helper_clk(pdev, priv, clk_name);
devm_platform_probe_helper_irq(pdev, priv, clk_name,
irq_hndlr, irq_flags, irq_name, irq_devid);
devm_platform_probe_helper_all(pdev, priv, clk_name,
irq_hndlr, irq_flags, irq_name, irq_devid);
devm_platform_probe_helper_all_data(pdev, priv, clk_name,
irq_hndlr, irq_flags, irq_name, irq_devid);

3. Code is made devres compatible (wherever required)
The functions: clk_get, request_irq, kzalloc, platform_get_resource
are replaced with their devm_* counterparts.

4. Few bugs are also fixed.

Satendra Singh Thakur (9):
  probe/dma : added helper macros to remove redundant/duplicate code
    from probe functions of the dma controller drivers
  probe/dma/jz4740: removed redundant code from jz4740 dma controller's 
       probe function
  probe/dma/zx: removed redundant code from zx dma controller's probe
    function
  probe/dma/qcom-bam: removed redundant code from qcom bam dma
    controller's probe function
  probe/dma/mtk-hs: removed redundant code from mediatek hs dma
    controller's probe function
  probe/dma/sun6i: removed redundant code from sun6i dma controller's
    probe function
  probe/dma/sun4i: removed redundant code from sun4i dma controller's
    probe function
  probe/dma/axi: removed redundant code from axi dma controller's probe
    function
  probe/dma/owl: removed redundant code from owl dma controller's probe
    function

 drivers/dma/dma-axi-dmac.c       |  28 ++---
 drivers/dma/dma-jz4740.c         |  33 +++---
 drivers/dma/mediatek/mtk-hsdma.c |  38 +++----
 drivers/dma/owl-dma.c            |  29 ++---
 drivers/dma/qcom/bam_dma.c       |  71 +++++-------
 drivers/dma/sun4i-dma.c          |  30 ++----
 drivers/dma/sun6i-dma.c          |  30 ++----
 drivers/dma/zx_dma.c             |  35 ++----
 include/linux/probe-helper.h     | 179 +++++++++++++++++++++++++++++++
 9 files changed, 280 insertions(+), 193 deletions(-)
 create mode 100644 include/linux/probe-helper.h

-- 
2.17.1
