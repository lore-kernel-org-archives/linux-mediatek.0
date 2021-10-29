Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D2CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 03:06:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E18B8610CF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 03:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E18B8610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0pfXxgD0sYbeuIoQ8TLWavexIWX6xVkoxbN2Lv4wZg=; b=aaszkA06y9LjCf
	JctwuDzra8ZQU/jctuhD06HvdcLPnShYhOm5lZ9gbjtPytvHYqaIEmtf3wytjZFfb2nOUKroNZVTv
	9fLAzK4WOX+hnxPZ5KZzwQL/R5YMw08c6woIsbUH4jGgVbK4melAXNwR7VAJULzgGeyZAOXdJXOTe
	aaUUEeJSXK1u9NDBt2tm37AzK91904Juze6zepVy6SDuzNNLxeK8CJsXwc8MFWzC6LxD+SXyAbagN
	4AvWXtWN5LXIQxF1Ejh9udc7MRHMC0uvh/LUmRrh4DfSBphvjNLlQFgus0lyapSwfy+MUJ4Rj8lBz
	SjTeERgW1MchLoZqGKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgIDD-009cST-3F; Fri, 29 Oct 2021 03:05:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgID7-009cQx-PY; Fri, 29 Oct 2021 03:05:46 +0000
X-UUID: 169cb47899cf43debc90a1fc935bf361-20211028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WOXyq4Aq/DsPtG9q0clsLuOVE2aY54HhzRPEBz4YOxM=; 
 b=UaHZhqFUpTvyGkDc7mxRKNzM8VEeS8jDj8743W8mYRf1AJZ4aueaXPzrsMxHvFnoJ43FyjSc+8pL6xDPWy/93mkqV7Wr2FSX8y+LsmriXC5yiotkk4kI4hfOYSEitQiV1hc2vUxxpMfKvgYJO8Tqhm+TZuUVcZT5HVgRAFiuzk0=;
X-UUID: 169cb47899cf43debc90a1fc935bf361-20211028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 202741808; Thu, 28 Oct 2021 20:05:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 20:05:35 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 11:05:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Oct 2021 11:05:32 +0800
Message-ID: <75c159449a8c07b8b94fed080a691c187ecf43df.camel@mediatek.com>
Subject: Re: [PATCH v7, 04/15] media: mtk-vcodec: Manage multi hardware
 information
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 29 Oct 2021 11:05:32 +0800
In-Reply-To: <93a98b65-ada9-437c-6916-27fe1214cdaf@somainline.org>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-5-yunfei.dong@mediatek.com>
 <93a98b65-ada9-437c-6916-27fe1214cdaf@somainline.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_200542_830035_983EFA07 
X-CRM114-Status: GOOD (  43.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi AngeloGioacchino,

Thanks for your suggestion.

On Thu, 2021-10-14 at 11:20 +0200, AngeloGioacchino Del Regno wrote:
> > Manage each hardware information which includes irq/power/clk.
> > The hardware includes LAT0, LAT1 and CORE.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> > v7: Using of_platform_populate not component framework to manage
> > multi hardware.
> > ---
> >   drivers/media/platform/mtk-vcodec/Makefile    |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 151 ++++++++++++-
> > ---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 165
> > ++++++++++++++++++
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  49 ++++++
> >   .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
> >   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  23 +++
> >   8 files changed, 359 insertions(+), 33 deletions(-)
> >   create mode 100644 drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_hw.c
> >   create mode 100644 drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_hw.h
> > 
> 
> 
> 
> Hello Yunfei,
> 
> thanks for this great series! However, there are a few things to
> improve...
> 
> > diff --git a/drivers/media/platform/mtk-vcodec/Makefile
> > b/drivers/media/platform/mtk-vcodec/Makefile
> > index ca8e9e7a9c4e..edeb3b66e9e9 100644
> > --- a/drivers/media/platform/mtk-vcodec/Makefile
> > +++ b/drivers/media/platform/mtk-vcodec/Makefile
> > @@ -15,6 +15,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
> >   		mtk_vcodec_dec_stateful.o \
> >   		mtk_vcodec_dec_stateless.o \
> >   		mtk_vcodec_dec_pm.o \
> > +		mtk_vcodec_dec_hw.o \
> >   
> >   mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> >   		venc/venc_h264_if.o \
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > index 9fbd24186c1a..c509224cbff4 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> > @@ -66,6 +66,7 @@ extern const struct v4l2_ioctl_ops
> > mtk_vdec_ioctl_ops;
> >   extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
> >   extern const struct media_device_ops mtk_vcodec_media_ops;
> >   
> > +extern struct platform_driver mtk_vdec_comp_driver;
> 
> This may be useless... more on that later in this review.
> 
Remove in patch v8.
> >   
> >   /*
> >    * mtk_vdec_lock/mtk_vdec_unlock are for ctx instance to
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index dd749d41c75a..17cb3e3519eb 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -18,19 +18,61 @@
> >   
> >   #include "mtk_vcodec_drv.h"
> >   #include "mtk_vcodec_dec.h"
> > +#include "mtk_vcodec_dec_hw.h"
> >   #include "mtk_vcodec_dec_pm.h"
> >   #include "mtk_vcodec_intr.h"
> > -#include "mtk_vcodec_util.h"
> >   #include "mtk_vcodec_fw.h"
> >   
> > -#define VDEC_HW_ACTIVE	0x10
> > -#define VDEC_IRQ_CFG	0x11
> > -#define VDEC_IRQ_CLR	0x10
> > -#define VDEC_IRQ_CFG_REG	0xa4
> > -
> >   module_param(mtk_v4l2_dbg_level, int, 0644);
> >   module_param(mtk_vcodec_dbg, bool, 0644);
> >   
> > +static struct of_device_id mtk_vdec_drv_ids[] = {
> > +	{
> > +		.compatible = "mediatek,mtk-vcodec-lat",
> > +		.data = (void *)MTK_VDEC_LAT0,
> > +	},
> > +	{
> > +		.compatible = "mediatek,mtk-vcodec-core",
> > +		.data = (void *)MTK_VDEC_CORE,
> > +	},
> > +	{},
> > +};
> 
> Is this a duplicate of "mtk_vdec_comp_ids", found in
> mtk_vcodec_dec_hw.c?!
> 
Will change it.
> > +
> > +static int mtk_vcodec_comp_device_check(struct mtk_vcodec_ctx
> > *ctx)
> > + {
> > +	struct mtk_vcodec_dev *vdec_dev = ctx->dev;
> > +	struct platform_device *pdev = vdec_dev->plat_dev;
> > +	struct device_node *comp_node;
> > +	enum mtk_vdec_hw_id comp_idx;
> > +	const struct of_device_id *of_id;
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(mtk_vdec_drv_ids); i++) {
> > +		of_id = &mtk_vdec_drv_ids[i];
> > +		comp_node = of_find_compatible_node(NULL, NULL,
> > +			of_id->compatible);
> > +		if (!comp_node)
> > +			continue;
> > +
> > +		if (!of_device_is_available(comp_node)) {
> > +			of_node_put(comp_node);
> > +			dev_err(&pdev->dev, "Fail to get MMSYS
> > node\n");
> > +			continue;
> > +		}
> > +
> > +		comp_idx = (enum mtk_vdec_hw_id)of_id->data;
> > +		vdec_dev->component_node[comp_idx] = comp_node;
> > +
> > +		if (!test_bit(comp_idx, vdec_dev->hardware_bitmap)) {
> > +			dev_err(&pdev->dev, "Vdec comp_idx is not ready
> > %d.",
> > +				comp_idx);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void
> > *priv)
> >   {
> >   	struct mtk_vcodec_dev *dev = priv;
> > @@ -95,6 +137,41 @@ static int mtk_vcodec_get_reg_bases(struct
> > mtk_vcodec_dev *dev)
> >   	return 0;
> >   }
> >   
> > +static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
> > +{
> > +	struct platform_device *pdev = dev->plat_dev;
> > +	int ret;
> > +
> > +	ret = mtk_vcodec_get_reg_bases(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!dev->vdec_pdata->is_comp_supported) {
> 
> component is never supported (is_comp_supported is always false), so
> this check
> is useless.
8192 need to support new architecture, but 8183 still use the older
one.
> 
> > +		dev->dec_irq = platform_get_irq(pdev, 0);
> > +		if (dev->dec_irq < 0) {
> > +			dev_err(&pdev->dev, "failed to get irq
> > number");
> > +			return dev->dec_irq;
> > +		}
> > +
> > +		irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> > +		ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> > +			mtk_vcodec_dec_irq_handler, 0, pdev->name,
> > dev);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "failed to install dev-
> > >dec_irq %d (%d)",
> > +				dev->dec_irq, ret);
> > +			return ret;
> > +		}
> > +
> > +		ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
> > +		if (ret < 0) {
> > +			dev_err(&pdev->dev, "failed to get mt vcodec
> > clock source");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static int fops_vcodec_open(struct file *file)
> >   {
> >   	struct mtk_vcodec_dev *dev = video_drvdata(file);
> > @@ -116,6 +193,12 @@ static int fops_vcodec_open(struct file *file)
> >   	init_waitqueue_head(&ctx->queue);
> >   	mutex_init(&ctx->lock);
> >   
> > +	ret = mtk_vcodec_comp_device_check(ctx);
> 
> Are you checking available devices outside of a probe function?
>  From what I can see, you require that the MMSYS device is available
> at this
> time, but that's something that should be granted if we reach this
> point.
> 
> I would say that this driver probe should be deferred until the MMSYS
> device
> becomes available, since it's required for this to work and since,
> once that
> device gets registered and probed successfully, it'll never go away
> (unless
> module unloaded, but you can't unload module A if module B is using
> it, or
> depends on it, unless you also unload module B): like this, you will
> avoid
> performing N useless checks, everytime the userspace opens the vdec
> device.
> 
The master device(parent node) is available, but the component(child
node) device is also ready? Need to register irq, open/close power and
clock using component device. This function just used to check whether
the component device is ready to use.
> > +	if (ret) {
> > +		mtk_v4l2_err("Failed to check vdec comp device.");
> > +		goto err_ctrls_setup;
> > +	}
> > +
> >   	ctx->type = MTK_INST_DECODER;
> >   	ret = dev->vdec_pdata->ctrls_setup(ctx);
> >   	if (ret) {
> > @@ -220,7 +303,6 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >   {
> >   	struct mtk_vcodec_dev *dev;
> >   	struct video_device *vfd_dec;
> > -	struct resource *res;
> >   	phandle rproc_phandle;
> >   	enum mtk_vcodec_fw_type fw_type;
> >   	int ret;
> > @@ -249,32 +331,10 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >   	if (IS_ERR(dev->fw_handler))
> >   		return PTR_ERR(dev->fw_handler);
> >   
> > -	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
> > -	if (ret < 0) {
> > -		dev_err(&pdev->dev, "Failed to get mt vcodec clock
> > source");
> > -		goto err_dec_pm;
> > -	}
> > -
> > -	ret = mtk_vcodec_get_reg_bases(dev);
> > -	if (ret)
> > -		goto err_res;
> > -
> > -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > -	if (res == NULL) {
> > -		dev_err(&pdev->dev, "failed to get irq resource");
> > -		ret = -ENOENT;
> > -		goto err_res;
> > -	}
> > -
> > -	dev->dec_irq = platform_get_irq(pdev, 0);
> > -	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> > -	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> > -			mtk_vcodec_dec_irq_handler, 0, pdev->name,
> > dev);
> > +	ret = mtk_vcodec_init_dec_params(dev);
> >   	if (ret) {
> > -		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d
> > (%d)",
> > -			dev->dec_irq,
> > -			ret);
> > -		goto err_res;
> > +		dev_err(&pdev->dev, "Failed to init pm and registers");
> > +		goto err_dec_pm;
> >   	}
> >   
> >   	mutex_init(&dev->dec_mutex);
> > @@ -329,6 +389,13 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >   		goto err_event_workq;
> >   	}
> >   
> > +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
> > +		&pdev->dev);
> > +	if (ret) {
> > +		mtk_v4l2_err("Master device of_platform_populate
> > failed.");
> > +		goto err_event_workq;
> > +	}
> > +
> >   	if (dev->vdec_pdata->uses_stateless_api) {
> >   		dev->mdev_dec.dev = &pdev->dev;
> >   		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
> > @@ -436,7 +503,25 @@ static struct platform_driver
> > mtk_vcodec_dec_driver = {
> >   	},
> >   };
> >   
> > -module_platform_driver(mtk_vcodec_dec_driver);
> > +static struct platform_driver * const mtk_vdec_drivers[] = {
> > +	&mtk_vdec_comp_driver,
> > +	&mtk_vcodec_dec_driver,
> > +};
> 
> I would say that this is not a good idea, since you can simply
> register
> your mtk_vdec_comp_driver in mtk_vcodec_dec_hw.c.
> 
Change it.
> > +
> > +static int __init mtk_vdec_init(void)
> > +{
> > +	return platform_register_drivers(mtk_vdec_drivers,
> > +					 ARRAY_SIZE(mtk_vdec_drivers));
> > +}
> > +
> > +static void __exit mtk_vdec_exit(void)
> > +{
> > +	platform_unregister_drivers(mtk_vdec_drivers,
> > +				    ARRAY_SIZE(mtk_vdec_drivers));
> > +}
> > +
> > +module_init(mtk_vdec_init);
> > +module_exit(mtk_vdec_exit);
> >   
> >   MODULE_LICENSE("GPL v2");
> >   MODULE_DESCRIPTION("Mediatek video codec V4L2 decoder driver");
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > new file mode 100644
> > index 000000000000..3752ccaea284
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > @@ -0,0 +1,165 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> > + */
> > +
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/slab.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_dec.h"
> > +#include "mtk_vcodec_dec_hw.h"
> > +#include "mtk_vcodec_dec_pm.h"
> > +#include "mtk_vcodec_intr.h"
> > +#include "mtk_vcodec_util.h"
> > +
> > +static const struct of_device_id mtk_vdec_comp_ids[] = {
> > +	{
> > +		.compatible = "mediatek,mtk-vcodec-lat",
> > +	},
> > +	{
> > +		.compatible = "mediatek,mtk-vcodec-core",
> > +	},
> > +	{},
> > +};
> 
> I think that you forgot some ".data = " here...
> 
Yes, forget to add, thanks.
> > +
> > +static irqreturn_t mtk_vdec_comp_irq_handler(int irq, void *priv)
> > +{
> > +	struct mtk_vdec_comp_dev *dev = priv;
> > +	struct mtk_vcodec_ctx *ctx;
> > +	u32 cg_status;
> > +	unsigned int dec_done_status;
> > +	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_COMP_MISC] +
> > +					VDEC_IRQ_CFG_REG;
> > +
> > +	ctx = mtk_vcodec_get_curr_ctx(dev->master_dev);
> > +
> > +	/* check if HW active or not */
> > +	cg_status = readl(dev->reg_base[VDEC_COMP_SYS]);
> > +	if ((cg_status & VDEC_HW_ACTIVE) != 0) {
> 
> The "!= 0" can be dropped here, since cg_status is unsigned.
> 
Fix
> > +		mtk_v4l2_err("vdec active is not 0x0 (0x%08x)",
> > +			cg_status);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	dec_done_status = readl(vdec_misc_addr);
> > +	if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
> > +		MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
> 
> I suggest to fix the indentation here to increase human readability,
> like so:
> 
Will Fix.
> 	if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
> 
> 	    MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
> 
> 
> > +		return IRQ_HANDLED;
> > +
> > +	/* clear interrupt */
> > +	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
> > +	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
> > +
> > +	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> > +
> > +	mtk_v4l2_debug(3, "wake up ctx %d, dec_done_status=%x",
> > +		ctx->id, dec_done_status);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int mtk_vdec_comp_init_irq(struct mtk_vdec_comp_dev *dev)
> > +{
> > +	struct platform_device *pdev = dev->plat_dev;
> > +	int ret;
> > +
> > +	dev->dec_irq = platform_get_irq(pdev, 0);
> > +	if (dev->dec_irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get irq resource");
> > +		return dev->dec_irq;
> > +	}
> > +
> > +	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> > +	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> > +				mtk_vdec_comp_irq_handler, 0, pdev-
> > >name, dev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to install dev->dec_irq %d
> > (%d)",
> > +			dev->dec_irq, ret);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_vdec_comp_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct mtk_vdec_comp_dev *comp_dev;
> > +	struct mtk_vcodec_dev *master_dev;
> > +	const struct of_device_id *of_id;
> > +	int comp_idx;
> > +	int ret;
> > +
> > +	if (!dev->parent) {
> > +		dev_err(dev, "Vdec parent prob is not ready.");
> 
> This is not an error, since it's not a "critical" error, until it
> becomes one (so,
> after max deferral count has been reached).
> I would remove this message entirely, however, if you really want
> this message to
> be here, you should use dev_dbg.
> 
Remove error log.
> > +		return -EPROBE_DEFER;
> > +	}
> > +
> > +	master_dev = dev_get_drvdata(dev->parent);
> > +	if (!master_dev) {
> > +		dev_err(dev, "Failed to get master device.");
> 
> Same here.
> 
Will remove error log
> > +		return -EPROBE_DEFER;
> > +	}
> > +
> > +	comp_dev = devm_kzalloc(dev, sizeof(*comp_dev), GFP_KERNEL);
> > +	if (!comp_dev)
> > +		return -ENOMEM;
> > +
> > +	comp_dev->plat_dev = pdev;
> > +	ret = mtk_vcodec_init_dec_pm(pdev, &comp_dev->pm);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to get mt vcodec clock source.");
> 
> As far as I can see, you have failure prints all over in function 
> mtk_vcodec_init_dec_pm, so there's no need to add another print here:
> you can simply return the error value here.
> 
Will fix.
> > +		return ret;
> > +	}
> > +
> > +	comp_dev->reg_base[VDEC_COMP_MISC] =
> > +		devm_platform_ioremap_resource_byname(pdev, "reg-
> > misc");
> > +	if (IS_ERR((__force void *)comp_dev->reg_base[VDEC_COMP_MISC])) 
> > {
> > +		ret = PTR_ERR((__force void *)comp_dev-
> > >reg_base[VDEC_COMP_MISC]);
> > +		goto err;
> > +	}
> > +
> > +	ret = mtk_vdec_comp_init_irq(comp_dev);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to register irq handler.\n");
> > +		goto err;
> > +	}
> 
> ...and the same applies here: mtk_vdec_comp_init_irq already prints
> on its own.
> 
Will fix
> > +
> > +	of_id = of_match_device(mtk_vdec_comp_ids, dev);
> > +	if (!of_id) {
> > +		dev_err(dev, "Can't get vdec comp device id.\n");
> > +		ret = -EINVAL;
> > +		goto err;
> > +	}
> > +
> > +	comp_idx = (enum mtk_vdec_hw_id)of_id->data;
> 
> Are you sure that this one is working as expected?
> The only driver that registers compatibles mediatek,mtk-vcodec-lat
> and
> mediatek,mtk-vcodec-core is exactly this one, but there's no .data
> assigned
> to any of the of_device_id entries... and this means that your of_id-
> >data
> will not contain the expected value of type enum mtk_vdec_hw_id.
> 
Will fix
> > +	if (comp_idx < MTK_VDEC_HW_MAX) {
> > +		master_dev->comp_dev[comp_idx] = comp_dev;
> > +		comp_dev->comp_idx = comp_idx;
> > +		comp_dev->master_dev = master_dev;
> > +		comp_dev->reg_base[VDEC_COMP_SYS] =
> > +			master_dev->reg_base[VDEC_COMP_SYS];
> > +		set_bit(comp_dev->comp_idx, master_dev-
> > >hardware_bitmap);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, comp_dev);
> > +	return 0;
> > +err:
> > +	mtk_vcodec_release_dec_pm(&comp_dev->pm);
> > +	return ret;
> > +}
> > +
> > +MODULE_DEVICE_TABLE(of, mtk_vdec_comp_ids);
> > +struct platform_driver mtk_vdec_comp_driver = {
> 
> The `_comp` here is a name that's making a logical reference to that:
> in this case,
> 
> that may confuse developers around. Can you please drop that `_comp`?
> 
> That would become `mtk_vdec_driver` instead.
> 
Rename the parameters.
> 
> Logically, the same applies for the rest - always assuming that it's
> referencing to
> the Linux component API.
> 
> > +	.probe	= mtk_vdec_comp_probe,
> > +	.driver	= {
> > +		.name	= "mtk-vdec-comp",
> > +		.of_match_table = mtk_vdec_comp_ids,
> > +	},
> > +};
> 
> Since you're using of_platform_populate, there is no need to register
> this driver
> externally: you can simply register it here (module_platform_driver)
> and it will
> be probed at of_platform_populate time in your parent.
> 
Fix to use module_platform_driver.
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> > new file mode 100644
> > index 000000000000..8d6e818a3474
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> > @@ -0,0 +1,49 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> > + */
> > +
> > +#ifndef _MTK_VCODEC_DEC_HW_H_
> > +#define _MTK_VCODEC_DEC_HW_H_
> > +
> > +#include <linux/io.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +
> > +#define VDEC_HW_ACTIVE	0x10
> > +#define VDEC_IRQ_CFG	0x11
> > +#define VDEC_IRQ_CLR	0x10
> > +#define VDEC_IRQ_CFG_REG	0xa4
> 
> Cosmetic nitpick: either all values in the same column, or simply use
> a space
> instead of tabulations.
> 
Will fix using a space.
> > +
> > +/**
> > + * enum mtk_comp_hw_reg_idx - component register base index
> > + */
> > +enum mtk_comp_hw_reg_idx {
> > +	VDEC_COMP_SYS,
> > +	VDEC_COMP_MISC,
> > +	VDEC_COMP_MAX
> > +};
> > +
> > +/**
> > + * struct mtk_vdec_comp_dev - component framwork driver data
> 
> You've switched away from the component framework... so this
> structure's
> description seems to be a bit misleading now...
> 
Will fix.
> > + * @plat_dev: platform device
> > + * @master_dev: master device
> > + * @reg_base: Mapped address of MTK Vcodec registers.
> > + *
> > + * @dec_irq: decoder irq resource
> > + * @pm: power management control
> > + * @comp_idx: component index
> > + */
> > +struct mtk_vdec_comp_dev {
> > +	struct platform_device *plat_dev;
> > +	struct mtk_vcodec_dev *master_dev;
> > +	void __iomem *reg_base[VDEC_COMP_MAX];
> > +
> > +	int dec_irq;
> > +	struct mtk_vcodec_pm pm;
> > +	int comp_idx;
> > +};
> > +
> > +#endif /* _MTK_VCODEC_DEC_HW_H_ */
> > diff --git a/drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_stateful.c
> > index 59c24b22ab6d..4f9a80ce15d8 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> > @@ -623,4 +623,5 @@ const struct mtk_vcodec_dec_pdata
> > mtk_vdec_8173_pdata = {
> >   	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
> >   	.worker = mtk_vdec_worker,
> >   	.flush_decoder = mtk_vdec_flush_decoder,
> > +	.is_comp_supported = false,
> >   };
> > diff --git a/drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-
> > vcodec/mtk_vcodec_dec_stateless.c
> > index 8f4a1f0a0769..762633572b49 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> > @@ -357,4 +357,5 @@ const struct mtk_vcodec_dec_pdata
> > mtk_vdec_8183_pdata = {
> >   	.uses_stateless_api = true,
> >   	.worker = mtk_vdec_worker,
> >   	.flush_decoder = mtk_vdec_flush_decoder,
> > +	.is_comp_supported = false,
> 
> component is not supported anywhere, since you've switched away from
> it?!
> 
Still need to use, add patch 5 to use it.
> >   };
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 973b0b3649c6..ec3850b4c638 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -93,6 +93,17 @@ enum mtk_fmt_type {
> >   	MTK_FMT_FRAME = 2,
> >   };
> >   
> > +/**
> > + * struct mtk_vdec_hw_id - Hardware index used to separate
> > + *                         different hardware
> > + */
> > +enum mtk_vdec_hw_id {
> > +	MTK_VDEC_CORE,
> > +	MTK_VDEC_LAT0,
> > +	MTK_VDEC_LAT1,
> > +	MTK_VDEC_HW_MAX,
> > +};
> > +
> >   /*
> >    * struct mtk_video_fmt - Structure used to store information
> > about pixelformats
> >    */
> > @@ -331,6 +342,7 @@ enum mtk_chip {
> >    *
> >    * @chip: chip this decoder is compatible with
> >    *
> > + * @is_comp_supported: true: using compoent framework, false: not
> > support
> >    * @uses_stateless_api: whether the decoder uses the stateless
> > API with requests
> >    */
> >   
> > @@ -352,6 +364,7 @@ struct mtk_vcodec_dec_pdata {
> >   
> >   	enum mtk_chip chip;
> >   
> > +	bool is_comp_supported;
> 
> Adding this member looks useless: there's nothing declaring
> is_comp_supported as
> true... not here, not in any other patch of this entire series!
> 
Rename is_comp_supported to is_subdev_supported and add patch 5 to use
it.
> 
> Regards,
> - Angelo
> 
Thanks,
Yunfei Dong
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
