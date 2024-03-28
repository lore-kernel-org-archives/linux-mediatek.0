Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E62CD1283
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 17:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWHCqghfJDvViQtrnjDyRBjptIr10JmWbLdcHeOE900=; b=APqILa40x4m1lcYEd9lrZkNNj3
	GD6OUlFJCcMEMiv9VQL4RZyPOSJBfMC/R6ba37enGj1g/Et4f0qeqU32j+2IDVhqusJRNuf1qUZPN
	JF9z60zSWS8OdYB1y13CLYRsm/XB8tit9q9dcWwTBC4wrye+sp04E699fGwkeyEdeDFe8hDNvCpHy
	W/d4hqDKdp/wBsV18T2G7kqQAWJCuXyTbBJDmzi2Gj9PQw8QmVFpjMig5v8/hu2yOztouLueCEdDt
	If/Iqn6/hqqoQ/ib0H33wJz4DKFsE7i8mrblTgyliLmBgcUAI0g5P3GqQOLyq05ZLsCJjAFxij/WI
	5LsZob6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpttB-0000000F200-1xAl;
	Thu, 28 Mar 2024 17:50:09 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptt6-0000000F1yl-1u5t;
	Thu, 28 Mar 2024 17:50:05 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4766e56ccccso456613137.0;
        Thu, 28 Mar 2024 10:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648202; x=1712253002; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hWHCqghfJDvViQtrnjDyRBjptIr10JmWbLdcHeOE900=;
        b=UCEzolPKdefD5Zw3h7t6dpFpPu/dHT2Lc4k13lI2x5vtdnq/GF+sUVI790erzou+0u
         31e3h29QtN3fvYdjHTIxctYtctpbArd8wwECggO4sUcdPvoUaV6VLTNmhdCcHy3ng9HJ
         a9nTUKf+GsmJELS/p9+OyX2zSUk0yOpXP2SwJh5jmCemmxl3fKJDtlCCZ7DJWz1Qx88B
         ec76uLlNZUuWcPrvGEvCo9seKene/St4ur/+8BjIBHzOpDKiRM1Q33lj+j20am1TuOVh
         Jv383POS52CmguTdzEwEFHw4Rl4nJ7+dYT6QKcYGrr0QQA0GakM134eO1aHqiiq9HlHB
         ZZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648202; x=1712253002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWHCqghfJDvViQtrnjDyRBjptIr10JmWbLdcHeOE900=;
        b=XCDFhO2GGRH60QMQDxCAQxvgsDEyuYJ/SVuEgqIUMHJyGWctOO1oa6DH4MUXWw93lD
         242qGGt5Jzpji0LYaSB9wzSTHPEprwwQcZGmNsRLfY8QH0e9d/2mVBZlq9YsrpbplCFa
         lQOcZNCE5viQgBzPoJ+Yq/spzcCtAQscINXNCC41iT+5n76836q4YAuiHWSaKdK3JjVA
         nlyap5j3+QA9DfgwCHNEqeI5T2WPMrQkEiatdBl4rzLjCGz5UN+zFJTLbS3mBgNcEB5S
         /KZTTuQhNlNlj29kOvnKz5OWNEekhrb1eD04kFoqQCRE1tJCrHAYQ2JYPKUzU8ek48lA
         g2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXw6U5S4roravX4vGfIEd2yFiLUE47IZ8dZYf048NGx0iBr9gLR1+D80+G9cRJBuG7JMrHleFUunzSDZKNaLLHpONN4Yz9NtFJQks8G3o4hCk7UJantam70LZM484GjgvvtPxF4wFnZaey5WYAHGl73GyyTCQ7rXbDSM+rg/jqFKR5sDN/QE7eUz9hGJ6la+RAjn4U99f4Qo5qX4qn201pZEp2gKrv0QOGX5t3jYN/lRTTj6DiX9uFlxMTZOL9NljR1dM8SBD4G0Hya+9acN/+8E8v3g8n7vVgrkqOq0/tVFaXw
X-Gm-Message-State: AOJu0YyZY0181vKcMr630n1qpDQHySSwz6upR/2QxIGsCkeIgbN10BgT
	+1bo1KNNsTC12U3hsz0t4TKytAaQJGDA1kYfcT0jnkuKqUm8Buq8mHOMwLbCu9sqjrzX/uMPLE9
	flDOiZ/yY0dl0fG+kQVxuqb19TZQ=
X-Google-Smtp-Source: AGHT+IG9ir7Qv5o8Rj+SB4p+I2Iv/yEJXMt0i85p6DOUBIUWCoVLWKyvCgsi6TT17MsYpR3xksNQ2srolzx+ehJ8uf4=
X-Received: by 2002:a05:6102:5e1:b0:478:2339:cef6 with SMTP id
 w1-20020a05610205e100b004782339cef6mr3607473vsf.5.1711648202174; Thu, 28 Mar
 2024 10:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-3-apais@linux.microsoft.com> <ZgUGXTKPVhrA1tam@matsya>
In-Reply-To: <ZgUGXTKPVhrA1tam@matsya>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:49:51 -0700
Message-ID: <CAOMdWSJxDAFKLVbH7wrB16m2nNXHm0b45dCRhvitVCP1Wf1aEg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_105004_527998_7054E6E3 
X-CRM114-Status: GOOD (  24.12  )
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

>
> Subsytem is dmaengine, can you rename this to dmaengine: ...

 My apologies, will have it fixed in v2.

>
> On 27-03-24, 16:03, Allen Pais wrote:
> > The only generic interface to execute asynchronously in the BH context is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > behaves similarly to regular workqueues except that the queued work items
> > are executed in the BH context.
>
> Thanks for conversion, am happy with BH alternative as it helps in
> dmaengine where we need shortest possible time between tasklet and
> interrupt handling to maximize dma performance
>
> >
> > This patch converts drivers/dma/* from tasklet to BH workqueue.
>
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/dma/altera-msgdma.c                   | 15 ++++----
> >  drivers/dma/apple-admac.c                     | 15 ++++----
> >  drivers/dma/at_hdmac.c                        |  2 +-
> >  drivers/dma/at_xdmac.c                        | 15 ++++----
> >  drivers/dma/bcm2835-dma.c                     |  2 +-
> >  drivers/dma/dma-axi-dmac.c                    |  2 +-
> >  drivers/dma/dma-jz4780.c                      |  2 +-
> >  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
> >  drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
> >  drivers/dma/dw/core.c                         | 13 +++----
> >  drivers/dma/dw/regs.h                         |  3 +-
> >  drivers/dma/ep93xx_dma.c                      | 15 ++++----
> >  drivers/dma/fsl-edma-common.c                 |  2 +-
> >  drivers/dma/fsl-qdma.c                        |  2 +-
> >  drivers/dma/fsl_raid.c                        | 11 +++---
> >  drivers/dma/fsl_raid.h                        |  2 +-
> >  drivers/dma/fsldma.c                          | 15 ++++----
> >  drivers/dma/fsldma.h                          |  3 +-
> >  drivers/dma/hisi_dma.c                        |  2 +-
> >  drivers/dma/hsu/hsu.c                         |  2 +-
> >  drivers/dma/idma64.c                          |  4 +--
> >  drivers/dma/img-mdc-dma.c                     |  2 +-
> >  drivers/dma/imx-dma.c                         | 27 +++++++-------
> >  drivers/dma/imx-sdma.c                        |  6 ++--
> >  drivers/dma/ioat/dma.c                        | 17 ++++-----
> >  drivers/dma/ioat/dma.h                        |  5 +--
> >  drivers/dma/ioat/init.c                       |  2 +-
> >  drivers/dma/k3dma.c                           | 19 +++++-----
> >  drivers/dma/mediatek/mtk-cqdma.c              | 35 ++++++++++---------
> >  drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
> >  drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +--
> >  drivers/dma/mmp_pdma.c                        | 13 +++----
> >  drivers/dma/mmp_tdma.c                        | 11 +++---
> >  drivers/dma/mpc512x_dma.c                     | 17 ++++-----
> >  drivers/dma/mv_xor.c                          | 13 +++----
> >  drivers/dma/mv_xor.h                          |  5 +--
> >  drivers/dma/mv_xor_v2.c                       | 23 ++++++------
> >  drivers/dma/mxs-dma.c                         | 13 +++----
> >  drivers/dma/nbpfaxi.c                         | 15 ++++----
> >  drivers/dma/owl-dma.c                         |  2 +-
> >  drivers/dma/pch_dma.c                         | 17 ++++-----
> >  drivers/dma/pl330.c                           | 31 ++++++++--------
> >  drivers/dma/plx_dma.c                         | 13 +++----
> >  drivers/dma/ppc4xx/adma.c                     | 17 ++++-----
> >  drivers/dma/ppc4xx/adma.h                     |  5 +--
> >  drivers/dma/pxa_dma.c                         |  2 +-
> >  drivers/dma/qcom/bam_dma.c                    | 35 ++++++++++---------
> >  drivers/dma/qcom/gpi.c                        | 18 +++++-----
> >  drivers/dma/qcom/hidma.c                      | 11 +++---
> >  drivers/dma/qcom/hidma.h                      |  5 +--
> >  drivers/dma/qcom/hidma_ll.c                   | 11 +++---
> >  drivers/dma/qcom/qcom_adm.c                   |  2 +-
> >  drivers/dma/sa11x0-dma.c                      | 27 +++++++-------
> >  drivers/dma/sf-pdma/sf-pdma.c                 | 23 ++++++------
> >  drivers/dma/sf-pdma/sf-pdma.h                 |  5 +--
> >  drivers/dma/sprd-dma.c                        |  2 +-
> >  drivers/dma/st_fdma.c                         |  2 +-
> >  drivers/dma/ste_dma40.c                       | 17 ++++-----
> >  drivers/dma/sun6i-dma.c                       | 33 ++++++++---------
> >  drivers/dma/tegra186-gpc-dma.c                |  2 +-
> >  drivers/dma/tegra20-apb-dma.c                 | 19 +++++-----
> >  drivers/dma/tegra210-adma.c                   |  2 +-
> >  drivers/dma/ti/edma.c                         |  2 +-
> >  drivers/dma/ti/k3-udma.c                      | 11 +++---
> >  drivers/dma/ti/omap-dma.c                     |  2 +-
> >  drivers/dma/timb_dma.c                        | 23 ++++++------
> >  drivers/dma/txx9dmac.c                        | 29 +++++++--------
> >  drivers/dma/txx9dmac.h                        |  5 +--
> >  drivers/dma/virt-dma.c                        |  9 ++---
> >  drivers/dma/virt-dma.h                        |  9 ++---
> >  drivers/dma/xgene-dma.c                       | 21 +++++------
> >  drivers/dma/xilinx/xilinx_dma.c               | 23 ++++++------
> >  drivers/dma/xilinx/xilinx_dpdma.c             | 21 +++++------
> >  drivers/dma/xilinx/zynqmp_dma.c               | 21 +++++------
> >  74 files changed, 442 insertions(+), 395 deletions(-)
> >
> > diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
> > index a8e3615235b8..611b5290324b 100644
> > --- a/drivers/dma/altera-msgdma.c
> > +++ b/drivers/dma/altera-msgdma.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >  #include <linux/of_dma.h>
> > +#include <linux/workqueue.h>
> >
> >  #include "dmaengine.h"
> >
> > @@ -170,7 +171,7 @@ struct msgdma_sw_desc {
> >  struct msgdma_device {
> >       spinlock_t lock;
> >       struct device *dev;
> > -     struct tasklet_struct irq_tasklet;
> > +     struct work_struct irq_work;
>
> Can we name these as bh_work to signify that we are always in bh
> context? here and everywhere please

 Sure, will address it in v2.
>
>
> >       struct list_head pending_list;
> >       struct list_head free_list;
> >       struct list_head active_list;
> > @@ -676,12 +677,12 @@ static int msgdma_alloc_chan_resources(struct dma_chan *dchan)
> >  }
> >
> >  /**
> > - * msgdma_tasklet - Schedule completion tasklet
> > + * msgdma_work - Schedule completion work
>
> ..
>
> > @@ -515,7 +516,7 @@ struct gpii {
> >       enum gpi_pm_state pm_state;
> >       rwlock_t pm_lock;
> >       struct gpi_ring ev_ring;
> > -     struct tasklet_struct ev_task; /* event processing tasklet */
> > +     struct work_struct ev_task; /* event processing work */
> >       struct completion cmd_completion;
> >       enum gpi_cmd gpi_cmd;
> >       u32 cntxt_type_irq_msk;
> > @@ -755,7 +756,7 @@ static void gpi_process_ieob(struct gpii *gpii)
> >       gpi_write_reg(gpii, gpii->ieob_clr_reg, BIT(0));
> >
> >       gpi_config_interrupts(gpii, MASK_IEOB_SETTINGS, 0);
> > -     tasklet_hi_schedule(&gpii->ev_task);
> > +     queue_work(system_bh_highpri_wq, &gpii->ev_task);
>
> This is good conversion, thanks for ensuring system_bh_highpri_wq is
> used here

 Thank you very much for the review, will have v2 sent soon.

- Allen

> --
> ~Vinod
>

