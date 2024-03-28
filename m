Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26267C54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gne0HV3Jz0fVuEZ1BjGvShampv22Q1HcgC9Vd49YqHI=; b=Q8lR3nyxJQx0vtXqbKEN532KFh
	gE8H402iQjBRPy3HAhyT0ZZ7ezGiMH8ZUXrTWeRJ8/hEJ1uUqSL/AUsRx5/XidGN8pBM73/j36Yq9
	mhXUik9huY62aG9EzkBxnPRDuSTmB8YAxp5U/UZORykah2vjVwz3f07qBZ8qpLX6PW7Htmh+lu6w8
	Yk4zzxqPBHdUbewGt1EYh4jsKKxYdvLZkG2u1XHWAGB0FlWWP+olhBKCJIjTElwUUthkH7N9srs7g
	m8F38f9rrpnd5XWmGvPkpuIsPUkm92hbJxAUsHFKiRoNCGmSfoTpZa3fhesOPyt8aD8jHMctQj+px
	MCOExy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpik1-0000000Cd1N-1Q6E;
	Thu, 28 Mar 2024 05:55:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpijt-0000000CcyG-0oSk;
	Thu, 28 Mar 2024 05:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DB667CE2942;
	Thu, 28 Mar 2024 05:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E6DC433F1;
	Thu, 28 Mar 2024 05:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711605346;
	bh=C6skgkr2NMPDni3brGoFkl+5/I4LRqRBMa9zmdDL9uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hysjLZhkEnvXnxd+HtHwjnxShxKJsdr7YRORWMMbG9CAv2Wo4v/3W17f+9SmlwjYP
	 AyxLZuXRv9YJGW7TBEhuFvjqai5JqAqlAjT7kP1ISp5EH8RS9fJ2YPnuq82HTriscX
	 k3oc9NY2bXpiP0jGnfR7dbOxiqpXyBbLE3Kr+zaoP4w8AQS+EkbA1t2gSCobYQ2KlV
	 32f78em/AA4bHgFdo/ljQvmpapnRbgSvmNw6bLqNSxN3FzIz/Su4hMEut3jzJjbgI6
	 ErlOb5+1jhqeBVqohmzPhEaaC6pQ2kHQXfpk3998EVOS2mUbOgGjtxbSO/uM8abY2C
	 N/IIGvRGfpoEA==
Date: Thu, 28 Mar 2024 11:25:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org,
	marcan@marcan.st, sven@svenpeter.dev, florian.fainelli@broadcom.com,
	rjui@broadcom.com, sbranden@broadcom.com, paul@crapouillou.net,
	Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
	vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
	zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	andersson@kernel.org, konrad.dybcio@linaro.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	patrice.chotard@foss.st.com, linus.walleij@linaro.org,
	wens@csie.org, jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, jassisinghbrar@gmail.com, mchehab@kernel.org,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	ulf.hansson@linaro.org, manuel.lauss@gmail.com,
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
	duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
Message-ID: <ZgUGXTKPVhrA1tam@matsya>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-3-apais@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_225549_614190_0E09B239 
X-CRM114-Status: GOOD (  19.19  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

Subsytem is dmaengine, can you rename this to dmaengine: ...

On 27-03-24, 16:03, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.

Thanks for conversion, am happy with BH alternative as it helps in
dmaengine where we need shortest possible time between tasklet and
interrupt handling to maximize dma performance

> 
> This patch converts drivers/dma/* from tasklet to BH workqueue.

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/dma/altera-msgdma.c                   | 15 ++++----
>  drivers/dma/apple-admac.c                     | 15 ++++----
>  drivers/dma/at_hdmac.c                        |  2 +-
>  drivers/dma/at_xdmac.c                        | 15 ++++----
>  drivers/dma/bcm2835-dma.c                     |  2 +-
>  drivers/dma/dma-axi-dmac.c                    |  2 +-
>  drivers/dma/dma-jz4780.c                      |  2 +-
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
>  drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
>  drivers/dma/dw/core.c                         | 13 +++----
>  drivers/dma/dw/regs.h                         |  3 +-
>  drivers/dma/ep93xx_dma.c                      | 15 ++++----
>  drivers/dma/fsl-edma-common.c                 |  2 +-
>  drivers/dma/fsl-qdma.c                        |  2 +-
>  drivers/dma/fsl_raid.c                        | 11 +++---
>  drivers/dma/fsl_raid.h                        |  2 +-
>  drivers/dma/fsldma.c                          | 15 ++++----
>  drivers/dma/fsldma.h                          |  3 +-
>  drivers/dma/hisi_dma.c                        |  2 +-
>  drivers/dma/hsu/hsu.c                         |  2 +-
>  drivers/dma/idma64.c                          |  4 +--
>  drivers/dma/img-mdc-dma.c                     |  2 +-
>  drivers/dma/imx-dma.c                         | 27 +++++++-------
>  drivers/dma/imx-sdma.c                        |  6 ++--
>  drivers/dma/ioat/dma.c                        | 17 ++++-----
>  drivers/dma/ioat/dma.h                        |  5 +--
>  drivers/dma/ioat/init.c                       |  2 +-
>  drivers/dma/k3dma.c                           | 19 +++++-----
>  drivers/dma/mediatek/mtk-cqdma.c              | 35 ++++++++++---------
>  drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
>  drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +--
>  drivers/dma/mmp_pdma.c                        | 13 +++----
>  drivers/dma/mmp_tdma.c                        | 11 +++---
>  drivers/dma/mpc512x_dma.c                     | 17 ++++-----
>  drivers/dma/mv_xor.c                          | 13 +++----
>  drivers/dma/mv_xor.h                          |  5 +--
>  drivers/dma/mv_xor_v2.c                       | 23 ++++++------
>  drivers/dma/mxs-dma.c                         | 13 +++----
>  drivers/dma/nbpfaxi.c                         | 15 ++++----
>  drivers/dma/owl-dma.c                         |  2 +-
>  drivers/dma/pch_dma.c                         | 17 ++++-----
>  drivers/dma/pl330.c                           | 31 ++++++++--------
>  drivers/dma/plx_dma.c                         | 13 +++----
>  drivers/dma/ppc4xx/adma.c                     | 17 ++++-----
>  drivers/dma/ppc4xx/adma.h                     |  5 +--
>  drivers/dma/pxa_dma.c                         |  2 +-
>  drivers/dma/qcom/bam_dma.c                    | 35 ++++++++++---------
>  drivers/dma/qcom/gpi.c                        | 18 +++++-----
>  drivers/dma/qcom/hidma.c                      | 11 +++---
>  drivers/dma/qcom/hidma.h                      |  5 +--
>  drivers/dma/qcom/hidma_ll.c                   | 11 +++---
>  drivers/dma/qcom/qcom_adm.c                   |  2 +-
>  drivers/dma/sa11x0-dma.c                      | 27 +++++++-------
>  drivers/dma/sf-pdma/sf-pdma.c                 | 23 ++++++------
>  drivers/dma/sf-pdma/sf-pdma.h                 |  5 +--
>  drivers/dma/sprd-dma.c                        |  2 +-
>  drivers/dma/st_fdma.c                         |  2 +-
>  drivers/dma/ste_dma40.c                       | 17 ++++-----
>  drivers/dma/sun6i-dma.c                       | 33 ++++++++---------
>  drivers/dma/tegra186-gpc-dma.c                |  2 +-
>  drivers/dma/tegra20-apb-dma.c                 | 19 +++++-----
>  drivers/dma/tegra210-adma.c                   |  2 +-
>  drivers/dma/ti/edma.c                         |  2 +-
>  drivers/dma/ti/k3-udma.c                      | 11 +++---
>  drivers/dma/ti/omap-dma.c                     |  2 +-
>  drivers/dma/timb_dma.c                        | 23 ++++++------
>  drivers/dma/txx9dmac.c                        | 29 +++++++--------
>  drivers/dma/txx9dmac.h                        |  5 +--
>  drivers/dma/virt-dma.c                        |  9 ++---
>  drivers/dma/virt-dma.h                        |  9 ++---
>  drivers/dma/xgene-dma.c                       | 21 +++++------
>  drivers/dma/xilinx/xilinx_dma.c               | 23 ++++++------
>  drivers/dma/xilinx/xilinx_dpdma.c             | 21 +++++------
>  drivers/dma/xilinx/zynqmp_dma.c               | 21 +++++------
>  74 files changed, 442 insertions(+), 395 deletions(-)
> 
> diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> index a8e3615235b8..611b5290324b 100644
> --- a/drivers/dma/altera-msgdma.c
> +++ b/drivers/dma/altera-msgdma.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/of_dma.h>
> +#include <linux/workqueue.h>
>  
>  #include "dmaengine.h"
>  
> @@ -170,7 +171,7 @@ struct msgdma_sw_desc {
>  struct msgdma_device {
>  	spinlock_t lock;
>  	struct device *dev;
> -	struct tasklet_struct irq_tasklet;
> +	struct work_struct irq_work;

Can we name these as bh_work to signify that we are always in bh
context? here and everywhere please


>  	struct list_head pending_list;
>  	struct list_head free_list;
>  	struct list_head active_list;
> @@ -676,12 +677,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
>  }
>  
>  /**
> - * msgdma_tasklet - Schedule completion tasklet
> + * msgdma_work - Schedule completion work

...

> @@ -515,7 +516,7 @@ struct gpii {
>  	enum gpi_pm_state pm_state;
>  	rwlock_t pm_lock;
>  	struct gpi_ring ev_ring;
> -	struct tasklet_struct ev_task; /* event processing tasklet */
> +	struct work_struct ev_task; /* event processing work */
>  	struct completion cmd_completion;
>  	enum gpi_cmd gpi_cmd;
>  	u32 cntxt_type_irq_msk;
> @@ -755,7 +756,7 @@ static void gpi_process_ieob(struct gpii *gpii)
>  	gpi_write_reg(gpii, gpii->ieob_clr_reg, BIT(0));
>  
>  	gpi_config_interrupts(gpii, MASK_IEOB_SETTINGS, 0);
> -	tasklet_hi_schedule(&gpii->ev_task);
> +	queue_work(system_bh_highpri_wq, &gpii->ev_task);

This is good conversion, thanks for ensuring system_bh_highpri_wq is
used here
-- 
~Vinod

