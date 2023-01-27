Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C35AC54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44G3DuqQhZyswRQhyPnMFp0x0bt9s4dk0ntGe/REQ5Q=; b=fFfpfpkgrzYuqznxWbKjBCty6K
	1yp1yIDb0me21eBttvVJrfLyUIFkCiEz+K6IWh7gJhOA+07wkDAXowqmEaBSgnSI/W3GmisbprJWr
	eyyyFORA4CS9+XpYjFfPh93HPXZYmz2UuhHKpsFou9QbIQFpgBi9a1sFW6vFBQ9GrZHUZEprQKG/O
	DExv9BPriizEuNf36zdh2Bltjr5paHCA1+51rMTb+Z2ioce3taTYPmrEBotC5Mq0fbF8U3wPT17Vu
	nLpekiqvrrUJxfC57yzKimsVJssh85+kUptSqu4sRyUpfkF35Jk9mQrAg++BZh7KTb+i23KFTaPLh
	+CquBHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLdT-00DrGv-Bm; Fri, 27 Jan 2023 10:07:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLdB-00Dr8g-CE; Fri, 27 Jan 2023 10:06:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C57A7B81F96;
	Fri, 27 Jan 2023 10:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13075C433D2;
	Fri, 27 Jan 2023 10:06:43 +0000 (UTC)
Message-ID: <47840969-364e-e5a2-d78b-967542a78eb6@xs4all.nl>
Date: Fri, 27 Jan 2023 11:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [V4] media: mtk-jpeg: Fixes jpeghw multi-core judgement
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com
References: <20230103034213.18573-1-irui.wang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230103034213.18573-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_020649_752128_3B61F879 
X-CRM114-Status: GOOD (  26.19  )
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

Hi Irui, Kyrie,

On 03/01/2023 04:42, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> some chips have multi-hw, but others have only one,
> modify the condition of multi-hw judgement
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  4 +++-
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 969516a940ba..56b27ecd61ec 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1692,7 +1692,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	if (list_empty(&pdev->dev.devres_head)) {
> +	if (jpeg->variant->hw_arch) {
>  		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
>  				  mtk_jpeg_job_timeout_work);
>  
> @@ -1885,6 +1885,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
>  	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
>  	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
>  	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> +	.hw_arch = MTK_JPEG_HW_MULTI_CORE,
>  };
>  
>  static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
> @@ -1896,6 +1897,7 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
>  	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
>  	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>  	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
> +	.hw_arch = MTK_JPEG_HW_MULTI_CORE,
>  };

So presumably the mtk8195 is multi core and the other variants are single core, but...

>  
>  #if defined(CONFIG_OF)
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index b9126476be8f..ead47e11dd48 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -46,6 +46,16 @@ enum mtk_jpeg_ctx_state {
>  	MTK_JPEG_SOURCE_CHANGE,
>  };
>  
> +/**
> + * enum mtk_jpeg_hw_arch - arch of the jpeg hw
> + * @MTK_JPEG_HW_MULTI_CORE:	jpeg hw is mluti-core

mluti -> multi

> + * @MTK_JPEG_HW_SINGLE_CORE:	jpeg hw is single core
> + */
> +enum mtk_jpeg_hw_arch {
> +	MTK_JPEG_HW_MULTI_CORE = 0,

...this has value 0, so multi core is the default. This means that all variants are
seen as multi core.

> +	MTK_JPEG_HW_SINGLE_CORE = 1,
> +};
> +
>  /**
>   * struct mtk_jpeg_variant - mtk jpeg driver variant
>   * @clks:			clock names
> @@ -60,6 +70,7 @@ enum mtk_jpeg_ctx_state {
>   * @ioctl_ops:			the callback of jpeg v4l2_ioctl_ops
>   * @out_q_default_fourcc:	output queue default fourcc
>   * @cap_q_default_fourcc:	capture queue default fourcc
> + * @hw_arch:            mark jpeg hw arch

I think this is a poorly chosen name: wouldn't it be better
to just make this a 'bool multi_core;'?

>   */
>  struct mtk_jpeg_variant {
>  	struct clk_bulk_data *clks;
> @@ -74,6 +85,7 @@ struct mtk_jpeg_variant {
>  	const struct v4l2_ioctl_ops *ioctl_ops;
>  	u32 out_q_default_fourcc;
>  	u32 cap_q_default_fourcc;
> +	enum mtk_jpeg_hw_arch hw_arch;
>  };
>  
>  struct mtk_jpeg_src_buf {

In any case, this patch doesn't look right.

Regards,

	Hans

