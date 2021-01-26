Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4204BC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 07:42:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D115D22273
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 07:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D115D22273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7uHr6i4cpY04cqGXVDDv9IQqcgpJ5BIACIGJbNY79Eg=; b=H3rnoEFiYxXtzgvUtkqpvI/d3
	nDyXZlhcdfe6aweRMOreoCpWmU0MilV/obK2Uatn7JVM6hwmxmBHcQ2x9+MzR8y5UpS+tFm0m3S9j
	6HgOTyxycx7wTGseWaxQrn1gKmRATPS0yrVOG1iDBjV/aSS0WlKvXi1xzAUPwxlXx8HZe54sHWUf7
	X/GOAkteV7tFCRd7vj+NeYC8NysXDvIYzqMLLO4qU9Pa+85YonMQGb3r865XfBi7ovd5A6mb4jbw7
	wyz8wxew7E2hphUqGJEDkhJsLCT7MLYt34U7FI7Jv5F91z6fAwWMcZhPjpUh0csLfrH5qQdVJFfQT
	X2QK69Omw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4IzD-0003xR-2s; Tue, 26 Jan 2021 07:42:03 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Iz9-0003wB-0Z
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 07:42:00 +0000
Received: by mail-io1-xd36.google.com with SMTP id n2so31858277iom.7
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTEzEls579DZ3BH7hVcyPhp2fOCUcEmP44D/dLy0dWM=;
 b=lhkvH0huBJvc9H+HHJT5oD2JJfLRkNYrzMGtQpHmHbrcyuVVO75mflEeMeVGM5SLeV
 Nvz2LpNpnG4NLXQS3PzviLTmcoJ28ZzcjvSuunpWVNA8XdJ5QA/GD6hAbJMtxdnbxWmo
 TblN5TW94Rysnh9stZJyH71Ylpu5BK5dkAgLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTEzEls579DZ3BH7hVcyPhp2fOCUcEmP44D/dLy0dWM=;
 b=CL5qbgT1hChYxr6xJQGP4ILf8mpu5GNnVpheYgyFmc04D9eOxq6eyTAHisVejWLj9F
 EszkKno7vOmDMATwL893w85MU0h1TYgYqluqAityYDtZWPv0nPmw4g9mX1V7IL7e2SH9
 izzSlwq9zP+fykQ8SqHlvijas99aixCB14aBkMdUo3ly1joN7fLDDvkurncHR+w/PaQV
 3uRE+4/2/H4keX/X/TcnRtrxaudbJKpKavRIWy0op6skmuZ9OgtRpzcAxx1oNFg3SfKW
 0hvTT8GQz9LDZPXSIjjCr4a7/HCVMVSqb8Zos5V1+1cPX38ivfZ6VQjGorfynAvPEWGv
 TaNQ==
X-Gm-Message-State: AOAM532u6sVMUfmQ5WfnCylFU7JZHtSYSqwDlq9UGcHm7vJkM3evy1I1
 tjR0HrVjpFbXH2dWx7zE3KtIWfN5roHmu1YwoyypNA==
X-Google-Smtp-Source: ABdhPJwlpBCKAL7fXLH9DDApVCKASF37ZecJUvGno+yw0iUERuo8IehQdIP5bitm9orrlTzk/WX0NRpPQ8lzpIqZxIQ=
X-Received: by 2002:a05:6638:b12:: with SMTP id
 a18mr3834357jab.114.1611646915306; 
 Mon, 25 Jan 2021 23:41:55 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-6-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-6-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 26 Jan 2021 15:41:29 +0800
Message-ID: <CAJMQK-g_+7h0vo7758aoY6304pqULJpHgSWE3HhvF8FWjkze_w@mail.gmail.com>
Subject: Re: [PATCH v3, 05/15] drm/mediatek: add component POSTMASK
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_024159_117611_A7CFC423 
X-CRM114-Status: GOOD (  29.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 3:44 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> This patch add component POSTMASK,
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile            |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 160 +++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h  |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c       |   4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   1 +
>  6 files changed, 168 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 17a08e2..ce5ad59 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -3,6 +3,7 @@
>  mediatek-drm-y := mtk_disp_color.o \
>                   mtk_disp_gamma.o \
>                   mtk_disp_ovl.o \
> +                 mtk_disp_postmask.o \
>                   mtk_disp_rdma.o \
>                   mtk_drm_crtc.o \
>                   mtk_drm_ddp.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_postmask.c b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
> new file mode 100644
> index 0000000..736224c
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
> @@ -0,0 +1,160 @@
> +/*
> + * SPDX-License-Identifier:
> + *
> + * Copyright (c) 2020 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_POSTMASK_EN                       0x0000
> +#define POSTMASK_EN                                    BIT(0)
> +#define DISP_POSTMASK_CFG                      0x0020
> +#define POSTMASK_RELAY_MODE                            BIT(0)
> +#define DISP_POSTMASK_SIZE                     0x0030
> +
> +struct mtk_disp_postmask_data {
> +       u32 reserved;
> +};
> +

Will there be more data and config for different soc in the future? If
not, it can be put in mtk_drm_ddp_comp.c and use struct
mtk_ddp_comp_dev, like ddp_dither or ddp_aal.


> +/**
> + * struct mtk_disp_postmask - DISP_postmask driver structure
> + * @ddp_comp - structure containing type enum and hardware resources
> + * @crtc - associated crtc to report irq events to
> + */
> +struct mtk_disp_postmask {
> +       struct mtk_ddp_comp                     ddp_comp;
> +       const struct mtk_disp_postmask_data     *data;
> +};
> +
> +static inline struct mtk_disp_postmask *comp_to_postmask(struct mtk_ddp_comp *comp)
> +{
> +       return container_of(comp, struct mtk_disp_postmask, ddp_comp);
> +}
> +
> +static void mtk_postmask_config(struct mtk_ddp_comp *comp, unsigned int w,
> +                             unsigned int h, unsigned int vrefresh,
> +                             unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_POSTMASK_SIZE);
> +       mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, comp, DISP_POSTMASK_CFG);
> +}
> +
> +static void mtk_postmask_start(struct mtk_ddp_comp *comp)
> +{
> +       writel(POSTMASK_EN, comp->regs + DISP_POSTMASK_EN);
> +}
> +
> +static void mtk_postmask_stop(struct mtk_ddp_comp *comp)
> +{
> +       writel_relaxed(0x0, comp->regs + DISP_POSTMASK_EN);
> +}
> +
> +static const struct mtk_ddp_comp_funcs mtk_disp_postmask_funcs = {
> +       .config = mtk_postmask_config,
> +       .start = mtk_postmask_start,
> +       .stop = mtk_postmask_stop,
> +};
> +
> +static int mtk_disp_postmask_bind(struct device *dev, struct device *master, void *data)
> +{
> +       struct mtk_disp_postmask *priv = dev_get_drvdata(dev);
> +       struct drm_device *drm_dev = data;
> +       int ret;
> +
> +       ret = mtk_ddp_comp_register(drm_dev, &priv->ddp_comp);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to register component %pOF: %d\n",
> +                       dev->of_node, ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void mtk_disp_postmask_unbind(struct device *dev, struct device *master,
> +                                 void *data)
> +{
> +       struct mtk_disp_postmask *priv = dev_get_drvdata(dev);
> +       struct drm_device *drm_dev = data;
> +
> +       mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
> +}
> +
> +static const struct component_ops mtk_disp_postmask_component_ops = {
> +       .bind   = mtk_disp_postmask_bind,
> +       .unbind = mtk_disp_postmask_unbind,
> +};
> +
> +static int mtk_disp_postmask_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct mtk_disp_postmask *priv;
> +       int comp_id;
> +       int ret;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_POSTMASK);
> +       if (comp_id < 0) {
> +               dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
> +               return comp_id;
> +       }
> +
> +       ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
> +                               &mtk_disp_postmask_funcs);
> +       if (ret) {
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "Failed to initialize component: %d\n",
> +                               ret);
> +
> +               return ret;
> +       }
> +
> +       priv->data = of_device_get_match_data(dev);
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       pm_runtime_enable(dev);
> +
> +       ret = component_add(dev, &mtk_disp_postmask_component_ops);
> +       if (ret)
> +               dev_err(dev, "Failed to add component: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int mtk_disp_postmask_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_disable(&pdev->dev);
> +
> +       component_del(&pdev->dev, &mtk_disp_postmask_component_ops);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_disp_postmask_driver_dt_match[] = {
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_disp_postmask_driver_dt_match);
> +
> +struct platform_driver mtk_disp_postmask_driver = {
> +       .probe          = mtk_disp_postmask_probe,
> +       .remove         = mtk_disp_postmask_remove,
> +       .driver         = {
> +               .name   = "mediatek-disp-postmask",
> +               .owner  = THIS_MODULE,
> +               .of_match_table = mtk_disp_postmask_driver_dt_match,
> +       },
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index a715127..bc6b10a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -354,6 +354,7 @@ static void mtk_dither_stop(struct mtk_ddp_comp *comp)
>         [MTK_DISP_MUTEX] = "mutex",
>         [MTK_DISP_OD] = "od",
>         [MTK_DISP_BLS] = "bls",
> +       [MTK_DISP_POSTMASK] = "postmask",
>  };
>
>  struct mtk_ddp_comp_match {
> @@ -384,6 +385,7 @@ struct mtk_ddp_comp_match {
>         [DDP_COMPONENT_OVL_2L0] = { MTK_DISP_OVL_2L,    0, NULL },
>         [DDP_COMPONENT_OVL_2L1] = { MTK_DISP_OVL_2L,    1, NULL },
>         [DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, NULL },
> +       [DDP_COMPONENT_POSTMASK0]       = { MTK_DISP_POSTMASK,  0, NULL },
>         [DDP_COMPONENT_PWM0]    = { MTK_DISP_PWM,       0, NULL },
>         [DDP_COMPONENT_PWM1]    = { MTK_DISP_PWM,       1, NULL },
>         [DDP_COMPONENT_PWM2]    = { MTK_DISP_PWM,       2, NULL },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 178fae9..0b23b5c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -29,6 +29,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_UFOE,
>         MTK_DSI,
>         MTK_DPI,
> +       MTK_DISP_POSTMASK,
>         MTK_DISP_PWM,
>         MTK_DISP_MUTEX,
>         MTK_DISP_OD,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b6e963e..bc205e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -533,7 +533,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>                 private->comp_node[comp_id] = of_node_get(node);
>
>                 /*
> -                * Currently only the COLOR, GAMMA, OVL, RDMA, DSI, and DPI blocks have
> +                * Currently only the COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI blocks have
>                  * separate component platform drivers and initialize their own
>                  * DDP component structure. The others are initialized here.
>                  */
> @@ -541,6 +541,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>                     comp_type == MTK_DISP_GAMMA ||
>                     comp_type == MTK_DISP_OVL ||
>                     comp_type == MTK_DISP_OVL_2L ||
> +                   comp_type == MTK_DISP_POSTMASK ||
>                     comp_type == MTK_DISP_RDMA ||
>                     comp_type == MTK_DSI ||
>                     comp_type == MTK_DPI) {
> @@ -654,6 +655,7 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
>         &mtk_disp_color_driver,
>         &mtk_disp_gamma_driver,
>         &mtk_disp_ovl_driver,
> +       &mtk_disp_postmask_driver,
>         &mtk_disp_rdma_driver,
>         &mtk_dpi_driver,
>         &mtk_drm_platform_driver,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index bbd362b..8a9544b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -50,6 +50,7 @@ struct mtk_drm_private {
>  extern struct platform_driver mtk_disp_color_driver;
>  extern struct platform_driver mtk_disp_gamma_driver;
>  extern struct platform_driver mtk_disp_ovl_driver;
> +extern struct platform_driver mtk_disp_postmask_driver;
>  extern struct platform_driver mtk_disp_rdma_driver;
>  extern struct platform_driver mtk_dpi_driver;
>  extern struct platform_driver mtk_dsi_driver;
> --
> 1.8.1.1.dirty
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
