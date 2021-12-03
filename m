Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9516CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vC9hddEkIXxExvS0PLIU6hx1LsR0VPiCBNB7A17fgc=; b=vtuqZM41a076Nh
	Afs7watSHrdf0KNkz/W2QJ9xWc4/GxnTUkTpQPHsEWsihuKx7t/n5wJIaou9O8pFKsspKSZliNEPt
	RgByWtaQxuPTWgys3Ft0Ah7sUyjkQqYl+ApOMcixw9TnaarIiFOXT7Co+ATWzeBKjaRbrs6KRoEpE
	zpYsJNf6E9rLZmLiO+VgVwESfN5qFDUmf8MXkBMFkhBzf5ll9ggQeRxEtDx6tAYOymbCHYb2znGVT
	5favhzBcj2Kc1Qd1iW0AQGijajp9344+OHENjNEmRnuunP9BOuecUSfJ2XlMFny1cWT+CQfzjqWP3
	hIcAos3Lg4oIH/XWFjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtA9m-00GIu8-9S; Fri, 03 Dec 2021 15:07:26 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9xA-00GFtR-U2
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 14:54:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id e3so12669096edu.4
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Dec 2021 06:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qjJydlYYIOTga36seONGNdOw7DzQPb5VccKZCzI8w7I=;
 b=I7CwyckCjI5AAmvkhd8UbPzceEoEsr4AItlrnAU9rAmYSmYOI70R+S6ubld0tRLY6b
 l76ikcEC+MOWXVj0iZRD3IVMbYNaMnqqiIKTSpHc/W3DuzfdiEf5OR7MaqvYuJJZW7J8
 9Azliw541ct1Ol6sJ9talzbIav29EmIDTRGRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qjJydlYYIOTga36seONGNdOw7DzQPb5VccKZCzI8w7I=;
 b=zzT/V2MlOuIdI/50gtLwkxiOBwA9uC4yGcXrNtpaSbZ6MocN3oxrDe14Wrf3V/O35w
 lYtcuYdceMJh6sLGBBE3ovQTKRMep8PAIK4k/5/sqsGaGpXJyarDxfVeEZ+7FfJtZ5yN
 qyfoWaqfOToVaq7QvzpMpEfO9Y3GfVFqbEXo/VxOHL2ztBZP+yEBugD+br6U9bCkfNmY
 hQupJDexaxdVIRRljur+hWH/PglZgSVWXHF6sMI4r1BxkzbQ43nwc0DhHVXdKs8OIZJ8
 0dnp+xUPXtywicwtWT4vvSe46IwNMok9EG/0+8S6OM/gHZ84VWpmcE2iEbqS6P692XHR
 eRMQ==
X-Gm-Message-State: AOAM531rjyU6H7NAKxgaSfIjTtC7tHGyoMfvYtBCv75CpeKJrlvWLPRB
 UMOB1xbVTIKdu7YFYRDIkOfZAg==
X-Google-Smtp-Source: ABdhPJwexRKm4dY+3bZXIxs/IhwMe7z5uYtwXAW0N2NQV6KyYdCJReddYTNZ8kj/6LkmvszqmtJJwg==
X-Received: by 2002:a17:907:3ea7:: with SMTP id
 hs39mr25034284ejc.164.1638543263061; 
 Fri, 03 Dec 2021 06:54:23 -0800 (PST)
Received: from gmail.com ([100.104.168.197])
 by smtp.gmail.com with ESMTPSA id hs20sm2090290ejc.26.2021.12.03.06.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 06:54:22 -0800 (PST)
Date: Fri, 3 Dec 2021 15:54:04 +0100
From: Ricardo Ribalda <ribalda@chromium.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
 irui.wang@mediatek.com
Subject: Re: [PATCH V6,  2/5] media: mtk-jpegenc: manage jpegenc multi-hardware
Message-ID: <YaovjHw74L9hNcME@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-3-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638501230-13417-3-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_065425_067261_24D22C16 
X-CRM114-Status: GOOD (  35.38  )
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

kyrie.wu wrote:

> manage each hardware information, including irq/clk/power.
> the hardware includes HW0 and HW1.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
> V6: use of_platform_populate to replace component framework
> to manage multi-hardware
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 103 +++++++---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  55 +++++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 232 +++++++++++++++++++++-
>  3 files changed, 362 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index a89c7b2..da7eb84 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1353,33 +1353,40 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	spin_lock_init(&jpeg->hw_lock);
>  	jpeg->dev = &pdev->dev;
>  	jpeg->variant = of_device_get_match_data(jpeg->dev);
> -	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(jpeg->reg_base)) {
> -		ret = PTR_ERR(jpeg->reg_base);
> -		return ret;
> -	}
> +	if (!jpeg->variant->is_encoder) {
> +		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
> +				mtk_jpeg_job_timeout_work);
>  
> -	jpeg_irq = platform_get_irq(pdev, 0);
> -	if (jpeg_irq < 0) {
> -		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
> -		return jpeg_irq;
> -	}
Maybe better use  devm_platform_ioremap_resource()
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(jpeg->reg_base)) {
> +			ret = PTR_ERR(jpeg->reg_base);
> +			return ret;
> +		}
>  
> -	ret = devm_request_irq(&pdev->dev, jpeg_irq,
> -			       jpeg->variant->irq_handler, 0, pdev->name, jpeg);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
> -			jpeg_irq, ret);
> -		goto err_req_irq;
> -	}
> +		jpeg_irq = platform_get_irq(pdev, 0);

> +		if (jpeg_irq < 0) {
> +			dev_err(&pdev->dev, "Failed to get jpeg_irq.\n");
> +			return jpeg_irq;
> +		}
>  
> -	ret = mtk_jpeg_clk_init(jpeg);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to init clk, err %d\n", ret);
> -		goto err_clk_init;
> +		ret = devm_request_irq(&pdev->dev, jpeg_irq,
> +				       jpeg->variant->irq_handler,
> +					   0, pdev->name, jpeg);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
> +				jpeg_irq, ret);
> +			goto err_req_irq;
> +		}
> +
> +		ret = mtk_jpeg_clk_init(jpeg);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to init clk(%d)\n", ret);
> +			goto err_clk_init;
> +		}
> +
> +		pm_runtime_enable(&pdev->dev);
>  	}
>  
>  	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
> @@ -1426,9 +1433,16 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  		  jpeg->variant->dev_name, jpeg->vdev->num,
>  		  VIDEO_MAJOR, jpeg->vdev->minor);
>  
> -	platform_set_drvdata(pdev, jpeg);
> +	if (jpeg->variant->is_encoder) {
Can you share a device tree that uses this? 

You can't you have all the device in same level, instead of making them
childs of this device?
> +		ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
> +			&pdev->dev);
Maybe you want devm_of_platform_populate()?
> +		if (ret) {
> +			v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
> +			goto err_vfd_jpeg_register;
> +		}
> +	}
>  
> -	pm_runtime_enable(&pdev->dev);
> +	platform_set_drvdata(pdev, jpeg);
>  
>  	return 0;
>  
> @@ -1539,6 +1553,19 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
>  	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>  };
>  
> +static const struct mtk_jpeg_variant mtk_jpegenc_drvdata = {
> +	.is_encoder = true,
> +	.formats = mtk_jpeg_enc_formats,
> +	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
> +	.qops = &mtk_jpeg_enc_qops,
> +	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
> +	.dev_name = "mtk-jpeg-enc",
> +	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
> +	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
> +	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +};
> +
> +#if defined(CONFIG_OF)
>  static const struct of_device_id mtk_jpeg_match[] = {
>  	{
>  		.compatible = "mediatek,mt8173-jpgdec",
> @@ -1552,10 +1579,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
>  		.compatible = "mediatek,mtk-jpgenc",
>  		.data = &mtk_jpeg_drvdata,
>  	},
> +	{
> +		.compatible = "mediatek,mt8195-jpgenc",
> +		.data = &mtk_jpegenc_drvdata,
> +	},
>  	{},
>  };
> -
>  MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
> +#endif
>  
>  static struct platform_driver mtk_jpeg_driver = {
>  	.probe = mtk_jpeg_probe,
> @@ -1567,7 +1598,25 @@ static struct platform_driver mtk_jpeg_driver = {
>  	},
>  };

This is not very clear. It would be better to refactor the change and
have a module_platform_driver() macro for jpegenc_hw_driver, where its
probe and remove exists.
> 
> -module_platform_driver(mtk_jpeg_driver);
> +static struct platform_driver * const mtk_jpeg_source_drivers[] = {
> +	&mtk_jpegenc_hw_driver,
> +	&mtk_jpeg_driver,
> +};
> +static int __init mtk_jpeg_init(void)
> +{
> +	return platform_register_drivers(mtk_jpeg_source_drivers,
> +		ARRAY_SIZE(mtk_jpeg_source_drivers));
> +}
> +
> +static void __exit mtk_jpeg_exit(void)
> +{
> +	platform_unregister_drivers(mtk_jpeg_source_drivers,
> +		ARRAY_SIZE(mtk_jpeg_source_drivers));
> +}
> +
> +module_init(mtk_jpeg_init);
> +module_exit(mtk_jpeg_exit);
> +
>  
>  MODULE_DESCRIPTION("MediaTek JPEG codec driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 595f7f1..7d013de 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -60,6 +60,7 @@ enum mtk_jpeg_ctx_state {
>   * @cap_q_default_fourcc:	capture queue default fourcc
>   */
>  struct mtk_jpeg_variant {
> +	bool is_encoder;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
>  	struct mtk_jpeg_fmt *formats;
> @@ -74,6 +75,55 @@ struct mtk_jpeg_variant {
>  	u32 cap_q_default_fourcc;
>  };
>  
> +enum mtk_jpegenc_hw_id {
> +	MTK_JPEGENC_HW0,
> +	MTK_JPEGENC_HW1,
> +	MTK_JPEGENC_HW_MAX,
> +};
> +
> +/**
> + * struct mtk_jpegenc_clk_info - Structure used to store clock name
> + */
> +struct mtk_jpegenc_clk_info {
> +	const char	*clk_name;
> +	struct clk	*jpegenc_clk;
> +};
> +
> +/**
> + * struct mtk_vcodec_clk - Structure used to store vcodec clock information
> + */
> +struct mtk_jpegenc_clk {
> +	struct mtk_jpegenc_clk_info	*clk_info;
> +	int	clk_num;
> +};
> +
> +/**
> + * struct mtk_vcodec_pm - Power management data structure
> + */
> +struct mtk_jpegenc_pm {
> +	struct mtk_jpegenc_clk	venc_clk;
> +	struct device	*dev;
> +	struct mtk_jpegenc_comp_dev	*mtkdev;
> +};
> +
> +/**
> + * struct mtk_jpegenc_comp_dev - JPEG COREX abstraction
> + * @dev:		        JPEG device
> + * @plat_dev:		    platform device data
> + * @reg_base:		    JPEG registers mapping
> + * @master_dev:		    mtk_jpeg_dev device
> + * @pm:	                mtk_jpegenc_pm
> + * @jpegenc_irq:	    jpeg encode irq num
> + */
> +struct mtk_jpegenc_comp_dev {
> +	struct device		*dev;
> +	struct platform_device *plat_dev;
> +	void __iomem		*reg_base;
> +	struct mtk_jpeg_dev *master_dev;
> +	struct mtk_jpegenc_pm pm;
> +	int jpegenc_irq;
> +};
> +
>  /**
>   * struct mtk_jpeg_dev - JPEG IP abstraction
>   * @lock:		the mutex protecting this structure
> @@ -102,6 +152,9 @@ struct mtk_jpeg_dev {
>  	struct device		*larb;
>  	struct delayed_work job_timeout_work;
>  	const struct mtk_jpeg_variant *variant;
> +
> +	void __iomem *reg_encbase[MTK_JPEGENC_HW_MAX];
> +	struct mtk_jpegenc_comp_dev *enc_hw_dev[MTK_JPEGENC_HW_MAX];
>  };
>  
>  /**
> @@ -162,4 +215,6 @@ struct mtk_jpeg_ctx {
>  	struct v4l2_ctrl_handler ctrl_hdl;
>  };
> 
Please no extern here:
> +extern struct platform_driver mtk_jpegenc_hw_driver;
> +
>  #endif /* _MTK_JPEG_CORE_H */
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> index 1cf037b..4ccda1d 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> @@ -4,12 +4,27 @@
>   * Author: Xia Jiang <xia.jiang@mediatek.com>
>   *
>   */
> -
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <media/media-device.h>
>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-event.h>
>  
> +#include "mtk_jpeg_core.h"
>  #include "mtk_jpeg_enc_hw.h"
>  
>  static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
> @@ -30,6 +45,21 @@ static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
>  	{.quality_param = 97, .hardware_value = JPEG_ENC_QUALITY_Q97},
>  };
>  
> +#if defined(CONFIG_OF)
> +static const struct of_device_id mtk_jpegenc_drv_ids[] = {
> +	{
> +		.compatible = "mediatek,mt8195-jpgenc0",
> +		.data = (void *)MTK_JPEGENC_HW0,
> +	},
> +	{
> +		.compatible = "mediatek,mt8195-jpgenc1",
> +		.data = (void *)MTK_JPEGENC_HW1,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);
> +#endif
> +
>  void mtk_jpeg_enc_reset(void __iomem *base)
>  {
>  	writel(0, base + JPEG_ENC_RSTB);
> @@ -152,3 +182,203 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
>  
>  	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
>  }
> +
> +static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> +{
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	enum vb2_buffer_state buf_state;
> +	struct mtk_jpeg_ctx *ctx;
> +	u32 result_size;
> +	u32 irq_status;
> +
> +	struct mtk_jpegenc_comp_dev *jpeg = priv;
> +	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
> +
> +	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
> +		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
> +	if (irq_status)
> +		writel(0, jpeg->reg_base + JPEG_ENC_INT_STS);
> +	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
> +		return IRQ_NONE;
> +
> +	ctx = v4l2_m2m_get_curr_priv(master_jpeg->m2m_dev);
> +	if (!ctx) {
> +		v4l2_err(&master_jpeg->v4l2_dev, "Context is NULL\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
> +	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
> +	buf_state = VB2_BUF_STATE_DONE;
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +	v4l2_m2m_buf_done(dst_buf, buf_state);
> +	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	pm_runtime_put(ctx->jpeg->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
> +{
> +	struct platform_device *pdev = dev->plat_dev;
> +	int ret;
> +
> +	dev->jpegenc_irq = platform_get_irq(pdev, 0);
> +	if (dev->jpegenc_irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get irq resource");
> +		return dev->jpegenc_irq;
> +	}
> +
Have you tried with a threaded_irq?
> +	ret = devm_request_irq(&pdev->dev, dev->jpegenc_irq,
> +		mtk_jpegenc_hw_irq_handler, 0, pdev->name, dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to devm_request_irq %d (%d)",
> +			dev->jpegenc_irq, ret);
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +int mtk_jpegenc_init_pm(struct mtk_jpegenc_comp_dev *mtkdev)
> +{
> +	struct mtk_jpegenc_clk_info *clk_info;
> +	struct mtk_jpegenc_clk *jpegenc_clk;
> +	struct platform_device *pdev;
> +	struct mtk_jpegenc_pm *pm;
> +	int i, ret;
> +
> +	pdev = mtkdev->plat_dev;
> +	pm = &mtkdev->pm;
> +	pm->dev = &pdev->dev;
> +	pm->mtkdev = mtkdev;

Can't you simplify with devm_clk_bulk_get_all
> +	jpegenc_clk = &pm->venc_clk;
> +	jpegenc_clk->clk_num =
> +		of_property_count_strings(pdev->dev.of_node, "clock-names");
> +	if (!jpegenc_clk->clk_num) {
> +		dev_err(&pdev->dev, "Failed to get jpegenc clock count\n");
> +		return -EINVAL;
> +	}
> +
> +	jpegenc_clk->clk_info = devm_kcalloc(&pdev->dev,
> +		jpegenc_clk->clk_num,
> +		sizeof(*clk_info),
> +		GFP_KERNEL);
> +	if (!jpegenc_clk->clk_info)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < jpegenc_clk->clk_num; i++) {
> +		clk_info = &jpegenc_clk->clk_info[i];
> +		ret = of_property_read_string_index(pdev->dev.of_node,
> +			"clock-names", i,
> +			&clk_info->clk_name);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to get jpegenc clock name\n");
> +			return ret;
> +		}
> +
> +		clk_info->jpegenc_clk = devm_clk_get(&pdev->dev,
> +			clk_info->clk_name);
> +		if (IS_ERR(clk_info->jpegenc_clk)) {
> +			dev_err(&pdev->dev, "devm_clk_get (%d)%s fail",
> +				i, clk_info->clk_name);
> +			return PTR_ERR(clk_info->jpegenc_clk);
> +		}
> +	}
> +
Can't you enable the pm after all the probing is completed to simplify
the error handling?
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +void mtk_jpegenc_release_pm(struct mtk_jpegenc_comp_dev *mtkdev)
> +{
> +	struct platform_device *pdev = mtkdev->plat_dev;
> +
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
> +{
> +	struct mtk_jpeg_dev *master_dev;
> +	const struct of_device_id *of_id;
> +	struct mtk_jpegenc_comp_dev *dev;
> +	int ret, comp_idx;
> +
> +	struct device *decs = &pdev->dev;
> +
When is the parent NULL?
> +	if (!decs->parent)
> +		return -EPROBE_DEFER;
> +
> +	master_dev = dev_get_drvdata(decs->parent);
> +	if (!master_dev)
> +		return -EPROBE_DEFER;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->plat_dev = pdev;
> +
> +	ret = mtk_jpegenc_init_pm(dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");
> +		return ret;
> +	}
> +
> +	dev->reg_base =
> +		devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dev->reg_base)) {
> +		ret = PTR_ERR(dev->reg_base);
> +		goto err;
> +	}
> +
> +	ret = mtk_jpegenc_hw_init_irq(dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register JPEGENC irq handler.\n");
> +		goto err;
> +	}
> +
please use of_device_get_match_data()
> +	of_id = of_match_device(mtk_jpegenc_drv_ids, decs);
> +	if (!of_id) {
> +		dev_err(&pdev->dev, "Can't get vdec comp device id.\n");
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
What if the drvdata is freed before you set it?
> +	comp_idx = (enum mtk_jpegenc_hw_id)of_id->data;
> +	if (comp_idx < MTK_JPEGENC_HW_MAX) {
> +		master_dev->enc_hw_dev[comp_idx] = dev;
> +		master_dev->reg_encbase[comp_idx] = dev->reg_base;
> +		dev->master_dev = master_dev;
> +	}
> +
> +	platform_set_drvdata(pdev, dev);
> +
> +	return 0;
> +
> +err:
> +	mtk_jpegenc_release_pm(dev);
> +	return ret;
> +}
> +
> +
> +static int mtk_jpegenc_remove(struct platform_device *pdev)
> +{
> +	struct mtk_jpegenc_comp_dev *dev = platform_get_drvdata(pdev);
> +
> +	mtk_jpegenc_release_pm(dev);
> +
> +	return 0;
> +}
> +
> +struct platform_driver mtk_jpegenc_hw_driver = {
> +	.probe = mtk_jpegenc_hw_probe,
> +	.remove = mtk_jpegenc_remove,
> +	.driver = {
> +		.name = "mtk-jpegenc-hw",
> +		.of_match_table = of_match_ptr(mtk_jpegenc_drv_ids),
> +	},
> +};
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
