Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F81FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 14:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6u0rUkQZBsEcHcAyvfRU8Ld8FbYjVABdgSH+wxA6vTc=; b=fJRSyQ6VfGG70j
	PQ27fv68g1SyWcyHjLzhPBPNY4omuemLLbbBnbnOPpugXs3XCu58amDoP8uXoQXp3000Z4QG+gdj9
	EBpLLJou1QTnzaoj/mApVCIZVt7Z6SbuIk1ykDLrquoe8KE61x8tGitolYJBgpvcUYqoiYafych24
	1bg9MtBuVK7MsfYZDyhg2hPj3LVUSCQdhufBdaKG68795yaDU/zegKL+ChPLklW2+nyrJdOL1AIIY
	/8lxRdcadyCsYn12nbS7wHzv60mAXFz2tr5SbnEHMCFQeSARsdoHY+68ru0rYMq4YqM5TBthlvh2w
	7f++Jtobhi67+eiY4sZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH5PS-00AYmA-L8; Mon, 07 Feb 2022 14:54:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH5Lq-00AXtJ-Ve; Mon, 07 Feb 2022 14:50:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DDCD31F444AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644245445;
 bh=oo9BNgnnpDKduv/ZsvhXMFnLyA/xKUyQDsQilHcwpJ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Vz3aQlw51IGhfTjWyXXyBB/XQMRvcU6snhOQu9q5BsgbZsF92yQHIpiUOFdhZBFW/
 a/ThD7VieW6PGSVSgJgoksysHYhfTuqAdV5YqbXQPAty5iSNB22XyJs0L8F1af5GaR
 SxwB7rd5C9NKFDeDaG/Jjpp5vhKQ11i1xC06tAdeL8yDG/oC3SBxPVR4Pp4U4zFzI1
 +pMcGmEFeJRo75SWDqKP+MpyjMx4fkAAjwD2x67EFU5vyl/eod0cvIGvyqUYtr/9ms
 qLkBVC0S40NA+3Po/vcOfm+uQuWIQvr1sXuv5Za92NrklCiKtmKjkFMPvz1biGYsAK
 BBAwF4rcfkRmA==
Message-ID: <50929bce-3706-3e7f-5320-dd2de1b68565@collabora.com>
Date: Mon, 7 Feb 2022 15:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V1, 2/6] media: mtk-jpegdec: manage jpegdec multi-hardware
Content-Language: en-US
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
 irui.wang@mediatek.com
References: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
 <1638509655-14296-3-git-send-email-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1638509655-14296-3-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_065047_352297_717862D5 
X-CRM114-Status: GOOD (  37.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/12/21 06:34, kyrie.wu ha scritto:
> manage each hardware information, including irq/clk/power.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   |  77 +++----
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  56 ++++++
>   drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c | 232 ++++++++++++++++++++++
>   3 files changed, 318 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 9e89629..f2a5e84 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -1403,6 +1403,11 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
>   	{ .id = "jpgenc" },
>   };
>   
> +static struct clk_bulk_data mtk_jpeg_dec_clocks[] = {
> +	{ .id = "jpgdec-smi" },
> +	{ .id = "jpgdec" },
> +};
> +

This is the exact same thing as "mt8173_jpeg_dec_clocks", hence it's redundant and
should not be added.
Please reuse that one instead.


>   static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>   {
>   	struct device_node *node;
> @@ -1460,8 +1465,6 @@ static inline void mtk_jpeg_clk_release(struct mtk_jpeg_dev *jpeg)
>   static int mtk_jpeg_probe(struct platform_device *pdev)
>   {
>   	struct mtk_jpeg_dev *jpeg;
> -	struct resource *res;
> -	int jpeg_irq;
>   	int ret;
>   
>   	jpeg = devm_kzalloc(&pdev->dev, sizeof(*jpeg), GFP_KERNEL);
> @@ -1473,40 +1476,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>   	jpeg->dev = &pdev->dev;
>   	jpeg->variant = of_device_get_match_data(jpeg->dev);
>   
> -	if (!jpeg->variant->is_encoder) {
> -		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
> -				mtk_jpeg_job_timeout_work);

You are removing this worker, so mt8173, mt8183 and the others will be broken.
Please make sure to not break older platforms.

> -
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -		jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(jpeg->reg_base)) {
> -			ret = PTR_ERR(jpeg->reg_base);
> -			return ret;
> -		}
> -
> -		jpeg_irq = platform_get_irq(pdev, 0);
> -		if (jpeg_irq < 0) {
> -			dev_err(&pdev->dev, "Failed to get jpeg_irq.\n");
> -			return jpeg_irq;
> -		}
> -
> -		ret = devm_request_irq(&pdev->dev, jpeg_irq,
> -				       jpeg->variant->irq_handler,
> -					   0, pdev->name, jpeg);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
> -				jpeg_irq, ret);
> -			goto err_req_irq;
> -		}
> -
> -		ret = mtk_jpeg_clk_init(jpeg);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init clk(%d)\n", ret);
> -			goto err_clk_init;
> -		}
> -
> -		pm_runtime_enable(&pdev->dev);
> -	} else {
> +	if (jpeg->variant->is_encoder) {
>   		init_waitqueue_head(&jpeg->enc_hw_wq);
>   		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
>   			WQ_MEM_RECLAIM | WQ_FREEZABLE);
> @@ -1561,13 +1531,11 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>   		  jpeg->variant->dev_name, jpeg->vdev->num,
>   		  VIDEO_MAJOR, jpeg->vdev->minor);
>   
> -	if (jpeg->variant->is_encoder) {
> -		ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
> -			&pdev->dev);
> -		if (ret) {
> -			v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
> -			goto err_vfd_jpeg_register;
> -		}
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
> +		&pdev->dev);
> +	if (ret) {
> +		v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
> +		goto err_vfd_jpeg_register;
>   	}
>   
>   	platform_set_drvdata(pdev, jpeg);
> @@ -1586,12 +1554,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>   err_dev_register:
>   	mtk_jpeg_clk_release(jpeg);
>   
> -err_clk_init:
> -
>   err_alloc_workqueue:
>   
> -err_req_irq:
> -
>   	return ret;
>   }
>   
> @@ -1697,6 +1661,20 @@ static const struct mtk_jpeg_variant mtk_jpegenc_drvdata = {
>   	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>   };
>   
> +static const struct mtk_jpeg_variant mtk_jpegdec_drvdata = {
> +	.is_encoder	= false,
> +	.clks = mtk_jpeg_dec_clocks,
> +	.num_clks = ARRAY_SIZE(mtk_jpeg_dec_clocks),
> +	.formats = mtk_jpeg_dec_formats,
> +	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
> +	.qops = &mtk_jpeg_dec_qops,
> +	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
> +	.dev_name = "mtk-jpeg-dec",
> +	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
> +	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
> +};
> +
>   #if defined(CONFIG_OF)
>   static const struct of_device_id mtk_jpeg_match[] = {
>   	{
> @@ -1715,6 +1693,10 @@ static const struct of_device_id mtk_jpeg_match[] = {
>   		.compatible = "mediatek,mt8195-jpgenc",
>   		.data = &mtk_jpegenc_drvdata,
>   	},
> +	{
> +		.compatible = "mediatek,mt8195-jpgdec",
> +		.data = &mtk_jpegdec_drvdata,
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
> @@ -1732,6 +1714,7 @@ static struct platform_driver mtk_jpeg_driver = {
>   
>   static struct platform_driver * const mtk_jpeg_source_drivers[] = {
>   	&mtk_jpegenc_hw_driver,
> +	&mtk_jpegdec_hw_driver,
>   	&mtk_jpeg_driver,
>   };
>   static int __init mtk_jpeg_init(void)
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index f276221..20243d4 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -102,6 +102,13 @@ enum mtk_jpegenc_hw_id {
>   	MTK_JPEGENC_HW_MAX,
>   };
>   
> +enum mtk_jpegdec_hw_id {
> +	MTK_JPEGDEC_HW0,
> +	MTK_JPEGDEC_HW1,
> +	MTK_JPEGDEC_HW2,
> +	MTK_JPEGDEC_HW_MAX,
> +};
> +
>   /**
>    * struct mtk_jpegenc_clk_info - Structure used to store clock name
>    */
> @@ -151,6 +158,51 @@ struct mtk_jpegenc_comp_dev {
>   };
>   
>   /**
> + * struct mtk_jpegdec_clk_info - Structure used to store clock name
> + */
> +struct mtk_jpegdec_clk_info {
> +	const char	*clk_name;
> +	struct clk
> +	*jpegdec_clk;
> +};
> +
> +/**
> + * struct mtk_jpegdec_clk - Structure used to
> + * store vcodec clock information
> + */
> +struct mtk_jpegdec_clk {
> +	struct mtk_jpegdec_clk_info	*clk_info;
> +	int	clk_num;
> +};
> +
> +/**
> + * struct mtk_jpegdec_pm - Power management data structure
> + */
> +struct mtk_jpegdec_pm {
> +	struct mtk_jpegdec_clk	dec_clk;
> +	struct device	*dev;
> +	struct mtk_jpegdec_comp_dev	*mtkdev;
> +};
> +
> +/**
> + * struct mtk_jpegdec_comp_dev - JPEG COREX abstraction
> + * @dev:		        JPEG device
> + * @plat_dev:		    platform device data
> + * @reg_base:		    JPEG registers mapping
> + * @master_dev:		    mtk_jpeg_dev device
> + * @pm:	                mtk_jpegdec_pm
> + * @jpegdec_irq:	    jpeg decode irq num
> + */
> +struct mtk_jpegdec_comp_dev {
> +	struct device *dev;
> +	struct platform_device *plat_dev;
> +	void __iomem *reg_base;
> +	struct mtk_jpeg_dev *master_dev;
> +	struct mtk_jpegdec_pm pm;
> +	int jpegdec_irq;
> +};
> +
> +/**
>    * struct mtk_jpeg_dev - JPEG IP abstraction
>    * @lock:		the mutex protecting this structure
>    * @hw_lock:		spinlock protecting the hw device resource
> @@ -182,6 +234,9 @@ struct mtk_jpeg_dev {
>   	void __iomem *reg_encbase[MTK_JPEGENC_HW_MAX];
>   	struct mtk_jpegenc_comp_dev *enc_hw_dev[MTK_JPEGENC_HW_MAX];
>   	wait_queue_head_t enc_hw_wq;
> +
> +	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
> +	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
>   };
>   
>   /**
> @@ -248,5 +303,6 @@ struct mtk_jpeg_ctx {
>   };
>   
>   extern struct platform_driver mtk_jpegenc_hw_driver;
> +extern struct platform_driver mtk_jpegdec_hw_driver;
>   
>   #endif /* _MTK_JPEG_CORE_H */
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> index 1e38522..86f12bd 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
> @@ -5,9 +5,24 @@
>    *         Rick Chang <rick.chang@mediatek.com>
>    */
>   
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <media/media-device.h>
>   #include <media/videobuf2-core.h>
> +#include <media/videobuf2-v4l2.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-dev.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-event.h>
>   
>   #include "mtk_jpeg_core.h"
>   #include "mtk_jpeg_dec_hw.h"
> @@ -24,6 +39,25 @@ enum mtk_jpeg_color {
>   	MTK_JPEG_COLOR_400		= 0x00110000
>   };
>   
> +#if defined(CONFIG_OF)
> +static const struct of_device_id mtk_jpegdec_hw_ids[] = {
> +	{
> +		.compatible = "mediatek,mt8195-jpgdec0",
> +		.data = (void *)MTK_JPEGDEC_HW0,
> +	},
> +	{
> +		.compatible = "mediatek,mt8195-jpgdec1",
> +		.data = (void *)MTK_JPEGDEC_HW1,
> +	},
> +	{
> +		.compatible = "mediatek,mt8195-jpgdec2",
> +		.data = (void *)MTK_JPEGDEC_HW2,
> +	},
> +	{},
> +};

Please look at the comment/proposal that I've made on the jpeg encoder
series: the same applies here to the decoder part.
So, in this case, it'd be just "mediatek,mt8195-jpgdec-hw".

> +MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
> +#endif
> +
>   static inline int mtk_jpeg_verify_align(u32 val, int align, u32 reg)
>   {
>   	if (val & (align - 1)) {
> @@ -408,3 +442,201 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>   				   config->dma_last_mcu);
>   	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
>   }
> +
> +int mtk_jpegdec_init_pm(struct mtk_jpegdec_comp_dev *mtkdev)
> +{
> +	struct mtk_jpegdec_clk_info *clk_info;
> +	struct mtk_jpegdec_clk *jpegdec_clk;
> +	struct platform_device *pdev;
> +	struct mtk_jpegdec_pm *pm;
> +	int i, ret;
> +
> +	pdev = mtkdev->plat_dev;
> +	pm = &mtkdev->pm;
> +	pm->dev = &pdev->dev;
> +	pm->mtkdev = mtkdev;
> +	jpegdec_clk = &pm->dec_clk;
> +	jpegdec_clk->clk_num =
> +		of_property_count_strings(pdev->dev.of_node, "clock-names");
> +	if (!jpegdec_clk->clk_num) {
> +		dev_err(&pdev->dev, "Failed to get jpegenc clock count\n");
> +		return -EINVAL;
> +	}
> +
> +	jpegdec_clk->clk_info = devm_kcalloc(&pdev->dev,
> +		jpegdec_clk->clk_num,
> +		sizeof(*clk_info),
> +		GFP_KERNEL);
> +	if (!jpegdec_clk->clk_info)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < jpegdec_clk->clk_num; i++) {
> +		clk_info = &jpegdec_clk->clk_info[i];
> +		ret = of_property_read_string_index(pdev->dev.of_node,
> +			"clock-names", i,
> +			&clk_info->clk_name);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to get jpegenc clock name\n");
> +			return ret;
> +		}
> +
> +		clk_info->jpegdec_clk = devm_clk_get(&pdev->dev,
> +			clk_info->clk_name);
> +		if (IS_ERR(clk_info->jpegdec_clk)) {
> +			dev_err(&pdev->dev, "devm_clk_get (%d)%s fail",
> +				i, clk_info->clk_name);
> +			return PTR_ERR(clk_info->jpegdec_clk);
> +		}
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);

To shorten the code, you should call pm_runtime_enable() at the end of the
probe function instead... check the comments below.

> +
> +	return ret;
> +}
> +
> +static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> +{
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +	struct mtk_jpeg_src_buf *jpeg_src_buf;
> +	enum vb2_buffer_state buf_state;
> +	struct mtk_jpeg_ctx *ctx;
> +	u32 dec_irq_ret;
> +	u32 irq_status;
> +	int i;
> +
> +	struct mtk_jpegdec_comp_dev *jpeg = priv;
> +	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
> +
> +	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
> +	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
> +	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
> +		mtk_jpeg_dec_reset(jpeg->reg_base);
> +	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE) {
> +		dev_err(jpeg->dev, "decode failed\n");
> +		goto dec_end;
> +	}
> +
> +	ctx = v4l2_m2m_get_curr_priv(master_jpeg->m2m_dev);
> +	if (!ctx) {
> +		dev_err(jpeg->dev, "Context is NULL\n");
> +		return IRQ_HANDLED;
> +		}
> +
> +	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +	jpeg_src_buf =
> +		container_of(src_buf, struct mtk_jpeg_src_buf, b);
> +
> +	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
> +		jpeg_src_buf->dec_param.comp_size[i]);
> +
> +	buf_state = VB2_BUF_STATE_DONE;
> +
> +dec_end:
> +	v4l2_m2m_buf_done(src_buf, buf_state);
> +	v4l2_m2m_buf_done(dst_buf, buf_state);
> +	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
> +	pm_runtime_put(ctx->jpeg->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
> +{
> +	struct platform_device *pdev = dev->plat_dev;
> +	int ret;
> +
> +	dev->jpegdec_irq = platform_get_irq(pdev, 0);
> +	if (dev->jpegdec_irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get irq resource");
> +		return dev->jpegdec_irq;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, dev->jpegdec_irq,
> +		mtk_jpegdec_hw_irq_handler, 0, pdev->name, dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to devm_request_irq %d (%d)",
> +			dev->jpegdec_irq, ret);
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +void mtk_jpegdec_release_pm(struct mtk_jpegdec_comp_dev *mtkdev)
> +{
> +	struct platform_device *pdev = mtkdev->plat_dev;
> +

You're using this function only in this file... and then, this is just one line.
This helper is not needed: please simply call pm_runtime_disable where needed.

> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
> +{
> +	struct mtk_jpeg_dev *master_dev;
> +	struct mtk_jpegdec_comp_dev *dev;
> +	const struct of_device_id *of_id;
> +	int ret, comp_idx;
> +
> +	struct device *decs = &pdev->dev;
> +
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
> +	ret = mtk_jpegdec_init_pm(dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");

	if (ret)
		return dev_err_probe(&pdev->dev, ret, ".....blurb");

That's shorter, and it is recommended to use dev_err_probe() even if the
function cannot return -EPROBE_DEFER.

> +		return ret;
> +	}
> +
> +	dev->reg_base =
> +		devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dev->reg_base)) {

By moving the pm_runtime_enable() call to the end of the probe function, you
won't need this goto, hence you'll be able to simply

		return PTR_ERR(dev->reg_base);

> +		ret = PTR_ERR(dev->reg_base);
> +		goto err;
> +	}
> +
> +	ret = mtk_jpegdec_hw_init_irq(dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register JPEGDEC irq handler.\n");

...and it's the same here, with dev_err_probe().

> +		goto err;
> +	}
> +
> +	of_id = of_match_device(mtk_jpegdec_hw_ids, decs);
> +	if (!of_id) {
> +		dev_err(&pdev->dev, "Can't get vdec comp device id.\n");

.... and here too, but if you follow what I said in the encoder review, this call
may not even be necessary, as you'd be simply checking if "mediatek,hw-leader" is
true (meaning that it's device 0), otherwise it's device number x (where x > 0).

> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	comp_idx = (enum mtk_jpegdec_hw_id)of_id->data;
> +	if (comp_idx < MTK_JPEGDEC_HW_MAX) {
> +		master_dev->dec_hw_dev[comp_idx] = dev;
> +		master_dev->reg_decbase[comp_idx] = dev->reg_base;
> +		dev->master_dev = master_dev;
> +	}
> +

	pm_runtime_enable(&pdev->dev);

> +	platform_set_drvdata(pdev, dev);
> +	return 0;
> +
> +err:
> +	mtk_jpegdec_release_pm(dev);
> +	return ret;
> +}
> +
> +struct platform_driver mtk_jpegdec_hw_driver = {
> +	.probe	= mtk_jpegdec_hw_probe,
> +	.driver	= {
> +		.name	= "mtk-jpegdec-hw",
> +		.of_match_table = mtk_jpegdec_hw_ids,
> +	},
> +};

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
