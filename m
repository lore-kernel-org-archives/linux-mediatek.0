Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6772C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:44:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB202065C
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DB202065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XYbr9Gk1jjA9WGePSLbfTSDyRWbgksPz89AsRdzYU/I=; b=iROl+4CH99vG6U/1KLELCst/6
	W9WIlW27LNPUiz/gSEvRYcy+wPnjMWdjiC2oG9aiG8ogdi7zljwb6VPRHGvM6bpLegbZeXLkpYn4O
	NxHGbWGtbe716692bu54SU5LJZebNz9Z1qkdb/lzeFOG/gRsVnqxauQPCYOLScPOI3jp0hQ5oh2p+
	HIVnkZSV6QmRFTh1HOcUCXJGH0hgX44f5yEsBs46aTb2DWbTfyyClSQJ3tH17jBDoyEjjnG07t4Dk
	DhTVZ9LHAKkgB3zae6fXcwQhwNBoAmMZXsvM9mwC8rAvZW/ZF8cN/xmPxkgSeSBIZm1GVDpALjn8F
	Gtcd13OXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Jxi-0005lw-HS; Tue, 26 Jan 2021 08:44:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Jxf-0005l7-Sa; Tue, 26 Jan 2021 08:44:33 +0000
X-UUID: b512d35aab184d678273322b937ea88b-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ab5V6Jg+4cCkW2NoySIkH8C7eY3leIfl1X6U8aIDygM=; 
 b=sh+wvp2tEXcDdjDyon3lDIimESxyTgzeRomUISiLgOIwDJfBxIvy52KlB1JV+SZjog5Ec+hrzxZQT9VdMdOzMz+bOL+My+KMoki/vmcFV9D0VSDEOd/g1sRW88xvTkyyVyt+uMtPBM4eQttRZmjrdslNmMDTE4ipElHOaxC/LPY=;
X-UUID: b512d35aab184d678273322b937ea88b-20210126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1038153804; Tue, 26 Jan 2021 00:44:27 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 00:44:25 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 16:44:17 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jan 2021 16:44:18 +0800
Message-ID: <1611650658.20687.3.camel@mtksdaap41>
Subject: Re: [PATCH 3/3] media: mtk-vcodec: Separating mtk encoder driver
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Irui Wang <irui.wang@mediatek.com>
Date: Tue, 26 Jan 2021 16:44:18 +0800
In-Reply-To: <20210121061804.26423-3-irui.wang@mediatek.com>
References: <20210121061804.26423-1-irui.wang@mediatek.com>
 <20210121061804.26423-3-irui.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_034432_058890_39D53BEF 
X-CRM114-Status: GOOD (  29.82  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>, Tomasz Figa <tfiga@google.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-21 at 14:18 +0800, Irui Wang wrote:
> MTK H264 Encoder(VENC_SYS) and VP8 Encoder(VENC_LT_SYS) are two
> independent hardware instance. They have their owner interrupt,
> register mapping, and special clocks.
> 
> This patch seperates them into two drivers:
> User Call "VIDIOC_QUERYCAP":
> H264 Encoder return driver name "mtk-vcodec-enc";
> VP8 Encoder return driver name "mtk-venc-vp8.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> 
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  10 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  23 +++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 121 +++++++-----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  40 +-----
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   4 +-
>  5 files changed, 82 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 3dd010cba23e..1594edcc706d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -19,6 +19,7 @@
>  #define MTK_VCODEC_DRV_NAME	"mtk_vcodec_drv"
>  #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
>  #define MTK_VCODEC_ENC_NAME	"mtk-vcodec-enc"
> +#define MTK_VENC_VP8_NAME	"mtk-venc-vp8"
>  #define MTK_PLATFORM_STR	"platform:mt8173"
>  
>  #define MTK_VCODEC_MAX_PLANES	3
> @@ -193,7 +194,6 @@ struct mtk_vcodec_pm {
>  
>  	struct mtk_vcodec_clk	venc_clk;
>  	struct device	*larbvenc;
> -	struct device	*larbvenclt;
>  	struct device	*dev;
>  	struct mtk_vcodec_dev	*mtkdev;
>  };
> @@ -311,25 +311,27 @@ enum mtk_chip {
>   * @chip: chip this encoder is compatible with
>   *
>   * @uses_ext: whether the encoder uses the extended firmware messaging format
> - * @has_lt_irq: whether the encoder uses the LT irq
> + * @name: whether the encoder core is vp8
>   * @min_birate: minimum supported encoding bitrate
>   * @max_bitrate: maximum supported encoding bitrate
>   * @capture_formats: array of supported capture formats
>   * @num_capture_formats: number of entries in capture_formats
>   * @output_formats: array of supported output formats
>   * @num_output_formats: number of entries in output_formats
> + * @core_id: stand for h264 or vp8 encode index
>   */
>  struct mtk_vcodec_enc_pdata {
>  	enum mtk_chip chip;
>  
>  	bool uses_ext;
> -	bool has_lt_irq;
> +	const char *name;
>  	unsigned long min_bitrate;
>  	unsigned long max_bitrate;
>  	const struct mtk_video_fmt *capture_formats;
>  	size_t num_capture_formats;
>  	const struct mtk_video_fmt *output_formats;
>  	size_t num_output_formats;
> +	int core_id;
>  };
>  
>  #define MTK_ENC_CTX_IS_EXT(ctx) ((ctx)->dev->venc_pdata->uses_ext)
> @@ -361,7 +363,6 @@ struct mtk_vcodec_enc_pdata {
>   *
>   * @dec_irq: decoder irq resource
>   * @enc_irq: h264 encoder irq resource
> - * @enc_lt_irq: vp8 encoder irq resource
>   *
>   * @dec_mutex: decoder hardware lock
>   * @enc_mutex: encoder hardware lock.
> @@ -397,7 +398,6 @@ struct mtk_vcodec_dev {
>  
>  	int dec_irq;
>  	int enc_irq;
> -	int enc_lt_irq;
>  
>  	struct mutex dec_mutex;
>  	struct mutex enc_mutex;
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 21de1431cfcb..0da6871b4b39 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -9,6 +9,7 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
>  #include <soc/mediatek/smi.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "mtk_vcodec_drv.h"
>  #include "mtk_vcodec_enc.h"
> @@ -189,7 +190,10 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
>  static int vidioc_venc_querycap(struct file *file, void *priv,
>  				struct v4l2_capability *cap)
>  {
> -	strscpy(cap->driver, MTK_VCODEC_ENC_NAME, sizeof(cap->driver));
> +	const struct mtk_vcodec_enc_pdata *pdata =
> +		fh_to_ctx(priv)->dev->venc_pdata;
> +
> +	strscpy(cap->driver, pdata->name, sizeof(cap->driver));
>  	strscpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap->bus_info));
>  	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
>  
> @@ -797,7 +801,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  	  */
>  	if ((ctx->state == MTK_STATE_ABORT) || (ctx->state == MTK_STATE_FREE)) {
>  		ret = -EIO;
> -		goto err_set_param;
> +		goto err_start_stream;
>  	}
>  
>  	/* Do the initialization when both start_streaming have been called */
> @@ -809,6 +813,12 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  			return 0;
>  	}
>  
> +	ret = pm_runtime_get_sync(&ctx->dev->plat_dev->dev);
> +	if (ret < 0) {
> +		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
> +		goto err_start_stream;
> +	}
> +
>  	mtk_venc_set_param(ctx, &param);
>  	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
>  	if (ret) {
> @@ -835,6 +845,11 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>  	return 0;
>  
>  err_set_param:
> +	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
> +	if (ret < 0)
> +		mtk_v4l2_err("pm_runtime_put fail %d", ret);
> +
> +err_start_stream:
>  	for (i = 0; i < q->num_buffers; ++i) {
>  		struct vb2_buffer *buf = vb2_get_buffer(q, i);
>  
> @@ -888,6 +903,10 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>  	if (ret)
>  		mtk_v4l2_err("venc_if_deinit failed=%d", ret);
>  
> +	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
> +	if (ret < 0)
> +		mtk_v4l2_err("pm_runtime_put fail %d", ret);
> +
>  	ctx->state = MTK_STATE_FREE;
>  }
>  
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index dfb42e19bf81..4bee42454253 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -49,12 +49,15 @@ static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
>  	},
>  };
>  
> -static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
> +static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_h264[] =  {
>  	{
>  		.fourcc = V4L2_PIX_FMT_H264,
>  		.type = MTK_FMT_ENC,
>  		.num_planes = 1,
>  	},
> +};
> +
> +static const struct mtk_video_fmt mtk_video_formats_capture_mt8173_vp8[] =  {
>  	{
>  		.fourcc = V4L2_PIX_FMT_VP8,
>  		.type = MTK_FMT_ENC,
> @@ -110,35 +113,13 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
>  	ctx = dev->curr_ctx;
>  	spin_unlock_irqrestore(&dev->irqlock, flags);
>  
> -	mtk_v4l2_debug(1, "id=%d", ctx->id);
> -	addr = dev->reg_base[VENC_SYS] + MTK_VENC_IRQ_ACK_OFFSET;
> -
> -	ctx->irq_status = readl(dev->reg_base[VENC_SYS] +
> -				(MTK_VENC_IRQ_STATUS_OFFSET));
> -
> -	clean_irq_status(ctx->irq_status, addr);
> -
> -	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> -	return IRQ_HANDLED;
> -}
> -
> -static irqreturn_t mtk_vcodec_enc_lt_irq_handler(int irq, void *priv)
> -{
> -	struct mtk_vcodec_dev *dev = priv;
> -	struct mtk_vcodec_ctx *ctx;
> -	unsigned long flags;
> -	void __iomem *addr;
> -
> -	spin_lock_irqsave(&dev->irqlock, flags);
> -	ctx = dev->curr_ctx;
> -	spin_unlock_irqrestore(&dev->irqlock, flags);
> +	mtk_v4l2_debug(1, "id=%d coreid:%d", ctx->id, dev->venc_pdata->core_id);
> +	addr = dev->reg_base[dev->venc_pdata->core_id] +
> +				MTK_VENC_IRQ_ACK_OFFSET;
>  
> -	mtk_v4l2_debug(1, "id=%d", ctx->id);
> -	ctx->irq_status = readl(dev->reg_base[VENC_LT_SYS] +
> +	ctx->irq_status = readl(dev->reg_base[dev->venc_pdata->core_id] +
>  				(MTK_VENC_IRQ_STATUS_OFFSET));
>  
> -	addr = dev->reg_base[VENC_LT_SYS] + MTK_VENC_IRQ_ACK_OFFSET;
> -
>  	clean_irq_status(ctx->irq_status, addr);
>  
>  	wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
> @@ -293,17 +274,21 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	dev->venc_pdata = of_device_get_match_data(&pdev->dev);
>  	ret = mtk_vcodec_init_enc_pm(dev);
>  	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to get mt vcodec clock source!");
> +		dev_err(&pdev->dev, "Failed to get mtk vcodec clock source!");
>  		goto err_enc_pm;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	dev->reg_base[VENC_SYS] = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR((__force void *)dev->reg_base[VENC_SYS])) {
> -		ret = PTR_ERR((__force void *)dev->reg_base[VENC_SYS]);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
> +		 dev->venc_pdata->name);
> +
> +	dev->reg_base[dev->venc_pdata->core_id] =
> +		devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dev->reg_base[dev->venc_pdata->core_id])) {
> +		ret = PTR_ERR(dev->reg_base[dev->venc_pdata->core_id]);
>  		goto err_res;
>  	}
> -	mtk_v4l2_debug(2, "reg[%d] base=0x%p", i, dev->reg_base[VENC_SYS]);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>  	if (res == NULL) {
> @@ -318,44 +303,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  			       mtk_vcodec_enc_irq_handler,
>  			       0, pdev->name, dev);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Failed to install dev->enc_irq %d (%d)",
> -			dev->enc_irq,
> -			ret);
> +		dev_err(&pdev->dev,
> +			"Failed to install dev->enc_irq %d (%d) core_id:%d",
> +			dev->enc_irq, ret, dev->venc_pdata->core_id);
>  		ret = -EINVAL;
>  		goto err_res;
>  	}
>  
> -	if (dev->venc_pdata->has_lt_irq) {
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -		dev->reg_base[VENC_LT_SYS] = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR((__force void *)dev->reg_base[VENC_LT_SYS])) {
> -			ret = PTR_ERR((__force void *)dev->reg_base[VENC_LT_SYS]);
> -			goto err_res;
> -		}
> -		mtk_v4l2_debug(2, "reg[%d] base=0x%p", i, dev->reg_base[VENC_LT_SYS]);
> -
> -		dev->enc_lt_irq = platform_get_irq(pdev, 1);
> -		irq_set_status_flags(dev->enc_lt_irq, IRQ_NOAUTOEN);
> -		ret = devm_request_irq(&pdev->dev,
> -				       dev->enc_lt_irq,
> -				       mtk_vcodec_enc_lt_irq_handler,
> -				       0, pdev->name, dev);
> -		if (ret) {
> -			dev_err(&pdev->dev,
> -				"Failed to install dev->enc_lt_irq %d (%d)",
> -				dev->enc_lt_irq, ret);
> -			ret = -EINVAL;
> -			goto err_res;
> -		}
> -	}
> -
>  	mutex_init(&dev->enc_mutex);
>  	mutex_init(&dev->dev_mutex);
>  	spin_lock_init(&dev->irqlock);
>  
> -	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
> -		 "[MTK_V4L2_VENC]");
> -
>  	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret) {
>  		mtk_v4l2_err("v4l2_device_register err=%d", ret);
> @@ -381,7 +339,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  					V4L2_CAP_STREAMING;
>  
>  	snprintf(vfd_enc->name, sizeof(vfd_enc->name), "%s",
> -		 MTK_VCODEC_ENC_NAME);
> +			dev->venc_pdata->name);
>  	video_set_drvdata(vfd_enc, dev);
>  	dev->vfd_enc = vfd_enc;
>  	platform_set_drvdata(pdev, dev);
> @@ -409,8 +367,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		goto err_enc_reg;
>  	}
>  
> -	mtk_v4l2_debug(0, "encoder registered as /dev/video%d",
> -			vfd_enc->num);
> +	mtk_v4l2_debug(0, "encoder %d registered as /dev/video%d",
> +		       dev->venc_pdata->core_id, vfd_enc->num);
>  
>  	return 0;
>  
> @@ -429,20 +387,33 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
> +static const struct mtk_vcodec_enc_pdata mt8173_avc_pdata = {
>  	.chip = MTK_MT8173,
> -	.has_lt_irq = true,
> -	.capture_formats = mtk_video_formats_capture_mt8173,
> -	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173),
> +	.name = MTK_VCODEC_ENC_NAME,
> +	.capture_formats = mtk_video_formats_capture_mt8173_h264,
> +	.num_capture_formats = 1,
>  	.output_formats = mtk_video_formats_output_mt8173,
>  	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
> -	.min_bitrate = 1,
> +	.min_bitrate = 64,
> +	.max_bitrate = 4000000,
> +	.core_id = VENC_SYS,
> +};
> +
> +static const struct mtk_vcodec_enc_pdata mt8173_vp8_pdata = {
> +	.chip = MTK_MT8173,
> +	.name = MTK_VENC_VP8_NAME,
> +	.capture_formats = mtk_video_formats_capture_mt8173_vp8,
> +	.num_capture_formats = 1,
> +	.output_formats = mtk_video_formats_output_mt8173,
> +	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
> +	.min_bitrate = 64,
>  	.max_bitrate = 4000000,
> +	.core_id = VENC_LT_SYS,
>  };
>  
>  static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
>  	.chip = MTK_MT8183,
> -	.has_lt_irq = false,
> +	.name = MTK_VCODEC_ENC_NAME,
>  	.uses_ext = true,
>  	.capture_formats = mtk_video_formats_capture_mt8183,
>  	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
> @@ -451,10 +422,14 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
>  	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
>  	.min_bitrate = 64,
>  	.max_bitrate = 40000000,
> +	.core_id = VENC_SYS,
>  };
>  
>  static const struct of_device_id mtk_vcodec_enc_match[] = {
> -	{.compatible = "mediatek,mt8173-vcodec-enc", .data = &mt8173_pdata},
> +	{.compatible = "mediatek,mt8173-vcodec-avc-enc",
> +			.data = &mt8173_avc_pdata},
> +	{.compatible = "mediatek,mt8173-vcodec-vp8-enc",
> +			.data = &mt8173_vp8_pdata},
>  	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
>  	{},
>  };
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 3b7c54d6aa8f..1b2e4930ed27 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -43,23 +43,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  		return -ENODEV;
>  	}
>  	pm->larbvenc = &pdev->dev;
> -
> -	node = of_parse_phandle(dev->of_node, "mediatek,larb", 1);
> -	if (!node) {
> -		mtk_v4l2_err("no mediatek,larb found");
> -		ret = -ENODEV;
> -		goto put_larbvenc;
> -	}
> -
> -	pdev = of_find_device_by_node(node);
> -	of_node_put(node);
> -	if (!pdev) {
> -		mtk_v4l2_err("no mediatek,larb device found");
> -		ret = -ENODEV;
> -		goto put_larbvenc;
> -	}
> -
> -	pm->larbvenclt = &pdev->dev;
>  	pdev = mtkdev->plat_dev;
>  	pm->dev = &pdev->dev;
>  
> @@ -71,12 +54,12 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  			GFP_KERNEL);
>  		if (!enc_clk->clk_info) {
>  			ret = -ENOMEM;
> -			goto put_larbvenclt;
> +			goto put_larbvenc;
>  		}
>  	} else {
>  		mtk_v4l2_err("Failed to get venc clock count");
>  		ret = -EINVAL;
> -		goto put_larbvenclt;
> +		goto put_larbvenc;
>  	}
>  
>  	for (i = 0; i < enc_clk->clk_num; i++) {
> @@ -85,7 +68,7 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  			"clock-names", i, &clk_info->clk_name);
>  		if (ret) {
>  			mtk_v4l2_err("venc failed to get clk name %d", i);
> -			goto put_larbvenclt;
> +			goto put_larbvenc;
>  		}
>  		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>  			clk_info->clk_name);
> @@ -93,14 +76,12 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  			mtk_v4l2_err("venc devm_clk_get (%d)%s fail", i,
>  				clk_info->clk_name);
>  			ret = PTR_ERR(clk_info->vcodec_clk);
> -			goto put_larbvenclt;
> +			goto put_larbvenc;
>  		}
>  	}
>  
>  	return 0;
>  
> -put_larbvenclt:
> -	put_device(pm->larbvenclt);
>  put_larbvenc:
>  	put_device(pm->larbvenc);
>  	return ret;
> @@ -108,7 +89,7 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  
>  void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  {
> -	put_device(mtkdev->pm.larbvenclt);
> +	pm_runtime_disable(mtkdev->pm.dev);
>  	put_device(mtkdev->pm.larbvenc);
>  }
>  
> @@ -130,18 +111,10 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>  	ret = mtk_smi_larb_get(pm->larbvenc);
>  	if (ret) {
>  		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> -		goto larbvencerr;
> -	}
> -	ret = mtk_smi_larb_get(pm->larbvenclt);
> -	if (ret) {
> -		mtk_v4l2_err("mtk_smi_larb_get larb4 fail %d", ret);
> -		goto larbvenclterr;
> +		goto clkerr;
>  	}
>  	return;
>  
> -larbvenclterr:
> -	mtk_smi_larb_put(pm->larbvenc);
> -larbvencerr:
>  clkerr:
>  	for (i -= 1; i >= 0; i--)
>  		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> @@ -153,7 +126,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
>  	int i = 0;
>  
>  	mtk_smi_larb_put(pm->larbvenc);
> -	mtk_smi_larb_put(pm->larbvenclt);
>  	for (i = enc_clk->clk_num - 1; i >= 0; i--)
>  		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
>  }
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index 11abb191ada5..8267a9c4fd25 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -367,7 +367,7 @@ static int vp8_enc_encode(void *handle,
>  
>  	mtk_vcodec_debug_enter(inst);
>  
> -	enable_irq(ctx->dev->enc_lt_irq);
> +	enable_irq(ctx->dev->enc_irq);
>  
>  	switch (opt) {
>  	case VENC_START_OPT_ENCODE_FRAME:
> @@ -386,7 +386,7 @@ static int vp8_enc_encode(void *handle,
>  
>  encode_err:
>  
> -	disable_irq(ctx->dev->enc_lt_irq);
> +	disable_irq(ctx->dev->enc_irq);
>  	mtk_vcodec_debug_leave(inst);
>  
>  	return ret;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
