Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AEAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 03:25:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97DB3206EB
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 03:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qt94qc+Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VpGR8Kz0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97DB3206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/qXuVelagmxOD3b8s1KOPdk9N1IPvNvoss8CUcalbfU=; b=Qt94qc+QpiUDDtesm9wvzb1N8
	mEdYEjEv/iPt4oTTPOHAVURu1egV37rZJJI3CO9lkY7Q7XgeoV6vliF27tb8iN7gI5LWOmMnbP716
	gurxafk9pCsLfVn43EBZHUjDDLV4fKQLfx3I8yzicVs6fZXPHXf3yBENzcruOUU6FEjZh0WuFMOGy
	zKCVam2qNq4aEnZt55k0otKoKobywqL6PGn2Mvd6zHBv+R9fozZJVlvpnlBzlLy+wscaozb13MuB/
	Kbx2AmGGT+NQaCM4ExmSX7m7cMgfxv/U5kCtfE33hG8je3ozu1pwOZPRsB0H2TeflXtt5OnOJse8i
	K2qa28ifA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqTN9-0005uF-KQ; Wed, 01 Jul 2020 03:25:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqTN6-0005th-Ar
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 03:25:17 +0000
X-UUID: 05751fced7084a3d9cb4acfc6499349b-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lWewAgoyWH52gjfStnYEildmWvO8i+GeJlHyG9T4nFo=; 
 b=VpGR8Kz0CXtbN18dWVamz4lqvscRKufQJqfKell+aLgbLgw6BMghcLo3HjH7XowBG5u+siHtOxKFDZXEsz2ZS+FTsHnJuvN776b1A/zn4DX4qZr3QlfnQVr0Wi2sGjg5IyGnefj5qS8PwDf9gYhax3D7KtuzWu9FRzeHiv7MnHw=;
X-UUID: 05751fced7084a3d9cb4acfc6499349b-20200630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1586443628; Tue, 30 Jun 2020 19:24:48 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 20:15:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 11:15:03 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 11:15:03 +0800
Message-ID: <1593573305.8209.1.camel@mtksdaap41>
Subject: Re: [PATCH v2 06/18] media: mtk-vcodec: venc: specify supported
 formats per-chip
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 1 Jul 2020 11:15:05 +0800
In-Reply-To: <20200626080442.292309-7-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-7-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FE7D4B97D12C6CD2E4411CA3D92DCAB13975B11C36C5ECD46AD7B8E92C43C9CE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_232516_632763_EC6E5394 
X-CRM114-Status: GOOD (  24.77  )
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
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Pi-Hsun
 Shih <pihsun@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-26 at 17:04 +0900, Alexandre Courbot wrote:
> Different chips have different supported bitrate ranges. Move the list
> of supported formats to the platform data, and split the output and
> capture formats into two lists to make it easier to find the default
> format for each queue.
> 
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>


> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   8 ++
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 122 +++++++-----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  40 ++++++
>  3 files changed, 95 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index b8f913de8d80..59b4b750666b 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -313,6 +313,10 @@ enum mtk_chip {
>   * @has_lt_irq: whether the encoder uses the LT irq
>   * @min_birate: minimum supported encoding bitrate
>   * @max_bitrate: maximum supported encoding bitrate
> + * @capture_formats: array of supported capture formats
> + * @num_capture_formats: number of entries in capture_formats
> + * @output_formats: array of supported output formats
> + * @num_output_formats: number of entries in output_formats
>   */
>  struct mtk_vcodec_enc_pdata {
>  	enum mtk_chip chip;
> @@ -321,6 +325,10 @@ struct mtk_vcodec_enc_pdata {
>  	bool has_lt_irq;
>  	unsigned long min_bitrate;
>  	unsigned long max_bitrate;
> +	const struct mtk_video_fmt *capture_formats;
> +	size_t num_capture_formats;
> +	const struct mtk_video_fmt *output_formats;
> +	size_t num_output_formats;
>  };
>  
>  /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 50ba9da59153..05743a745a11 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -23,47 +23,9 @@
>  #define DFT_CFG_WIDTH	MTK_VENC_MIN_W
>  #define DFT_CFG_HEIGHT	MTK_VENC_MIN_H
>  #define MTK_MAX_CTRLS_HINT	20
> -#define OUT_FMT_IDX		0
> -#define CAP_FMT_IDX		4
> -
>  
>  static void mtk_venc_worker(struct work_struct *work);
>  
> -static const struct mtk_video_fmt mtk_video_formats[] = {
> -	{
> -		.fourcc = V4L2_PIX_FMT_NV12M,
> -		.type = MTK_FMT_FRAME,
> -		.num_planes = 2,
> -	},
> -	{
> -		.fourcc = V4L2_PIX_FMT_NV21M,
> -		.type = MTK_FMT_FRAME,
> -		.num_planes = 2,
> -	},
> -	{
> -		.fourcc = V4L2_PIX_FMT_YUV420M,
> -		.type = MTK_FMT_FRAME,
> -		.num_planes = 3,
> -	},
> -	{
> -		.fourcc = V4L2_PIX_FMT_YVU420M,
> -		.type = MTK_FMT_FRAME,
> -		.num_planes = 3,
> -	},
> -	{
> -		.fourcc = V4L2_PIX_FMT_H264,
> -		.type = MTK_FMT_ENC,
> -		.num_planes = 1,
> -	},
> -	{
> -		.fourcc = V4L2_PIX_FMT_VP8,
> -		.type = MTK_FMT_ENC,
> -		.num_planes = 1,
> -	},
> -};
> -
> -#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> -
>  static const struct mtk_codec_framesizes mtk_venc_framesizes[] = {
>  	{
>  		.fourcc	= V4L2_PIX_FMT_H264,
> @@ -156,27 +118,17 @@ static const struct v4l2_ctrl_ops mtk_vcodec_enc_ctrl_ops = {
>  	.s_ctrl = vidioc_venc_s_ctrl,
>  };
>  
> -static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
> +static int vidioc_enum_fmt(struct v4l2_fmtdesc *f,
> +			   const struct mtk_video_fmt *formats,
> +			   size_t num_formats)
>  {
> -	const struct mtk_video_fmt *fmt;
> -	int i, j = 0;
> +	if (f->index >= num_formats)
> +		return -EINVAL;
>  
> -	for (i = 0; i < NUM_FORMATS; ++i) {
> -		if (output_queue && mtk_video_formats[i].type != MTK_FMT_FRAME)
> -			continue;
> -		if (!output_queue && mtk_video_formats[i].type != MTK_FMT_ENC)
> -			continue;
> +	f->pixelformat = formats[f->index].fourcc;
> +	memset(f->reserved, 0, sizeof(f->reserved));
>  
> -		if (j == f->index) {
> -			fmt = &mtk_video_formats[i];
> -			f->pixelformat = fmt->fourcc;
> -			memset(f->reserved, 0, sizeof(f->reserved));
> -			return 0;
> -		}
> -		++j;
> -	}
> -
> -	return -EINVAL;
> +	return 0;
>  }
>  
>  static int vidioc_enum_framesizes(struct file *file, void *fh,
> @@ -202,13 +154,21 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
>  static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
>  				   struct v4l2_fmtdesc *f)
>  {
> -	return vidioc_enum_fmt(f, false);
> +	const struct mtk_vcodec_enc_pdata *pdata =
> +		fh_to_ctx(priv)->dev->venc_pdata;
> +
> +	return vidioc_enum_fmt(f, pdata->capture_formats,
> +			       pdata->num_capture_formats);
>  }
>  
>  static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
>  				   struct v4l2_fmtdesc *f)
>  {
> -	return vidioc_enum_fmt(f, true);
> +	const struct mtk_vcodec_enc_pdata *pdata =
> +		fh_to_ctx(priv)->dev->venc_pdata;
> +
> +	return vidioc_enum_fmt(f, pdata->output_formats,
> +			       pdata->num_output_formats);
>  }
>  
>  static int vidioc_venc_querycap(struct file *file, void *priv,
> @@ -266,13 +226,20 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
>  	return &ctx->q_data[MTK_Q_DATA_DST];
>  }
>  
> -static const struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f)
> +static const struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f,
> +	const struct mtk_vcodec_enc_pdata *pdata)
>  {
>  	const struct mtk_video_fmt *fmt;
>  	unsigned int k;
>  
> -	for (k = 0; k < NUM_FORMATS; k++) {
> -		fmt = &mtk_video_formats[k];
> +	for (k = 0; k < pdata->num_capture_formats; k++) {
> +		fmt = &pdata->capture_formats[k];
> +		if (fmt->fourcc == f->fmt.pix.pixelformat)
> +			return fmt;
> +	}
> +
> +	for (k = 0; k < pdata->num_output_formats; k++) {
> +		fmt = &pdata->output_formats[k];
>  		if (fmt->fourcc == f->fmt.pix.pixelformat)
>  			return fmt;
>  	}
> @@ -414,6 +381,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
>  			     struct v4l2_format *f)
>  {
>  	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
>  	struct vb2_queue *vq;
>  	struct mtk_q_data *q_data;
>  	int i, ret;
> @@ -436,10 +404,10 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
>  		return -EINVAL;
>  	}
>  
> -	fmt = mtk_venc_find_format(f);
> +	fmt = mtk_venc_find_format(f, pdata);
>  	if (!fmt) {
> -		f->fmt.pix.pixelformat = mtk_video_formats[CAP_FMT_IDX].fourcc;
> -		fmt = mtk_venc_find_format(f);
> +		fmt = &ctx->dev->venc_pdata->capture_formats[0];
> +		f->fmt.pix.pixelformat = fmt->fourcc;
>  	}
>  
>  	q_data->fmt = fmt;
> @@ -476,6 +444,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>  			     struct v4l2_format *f)
>  {
>  	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
>  	struct vb2_queue *vq;
>  	struct mtk_q_data *q_data;
>  	int ret, i;
> @@ -499,10 +468,10 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>  		return -EINVAL;
>  	}
>  
> -	fmt = mtk_venc_find_format(f);
> +	fmt = mtk_venc_find_format(f, pdata);
>  	if (!fmt) {
> -		f->fmt.pix.pixelformat = mtk_video_formats[OUT_FMT_IDX].fourcc;
> -		fmt = mtk_venc_find_format(f);
> +		fmt = &ctx->dev->venc_pdata->output_formats[0];
> +		f->fmt.pix.pixelformat = fmt->fourcc;
>  	}
>  
>  	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
> @@ -580,11 +549,12 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>  {
>  	const struct mtk_video_fmt *fmt;
>  	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
>  
> -	fmt = mtk_venc_find_format(f);
> +	fmt = mtk_venc_find_format(f, pdata);
>  	if (!fmt) {
> -		f->fmt.pix.pixelformat = mtk_video_formats[CAP_FMT_IDX].fourcc;
> -		fmt = mtk_venc_find_format(f);
> +		fmt = &ctx->dev->venc_pdata->capture_formats[0];
> +		f->fmt.pix.pixelformat = fmt->fourcc;
>  	}
>  	f->fmt.pix_mp.colorspace = ctx->colorspace;
>  	f->fmt.pix_mp.ycbcr_enc = ctx->ycbcr_enc;
> @@ -598,11 +568,13 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
>  					 struct v4l2_format *f)
>  {
>  	const struct mtk_video_fmt *fmt;
> +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	const struct mtk_vcodec_enc_pdata *pdata = ctx->dev->venc_pdata;
>  
> -	fmt = mtk_venc_find_format(f);
> +	fmt = mtk_venc_find_format(f, pdata);
>  	if (!fmt) {
> -		f->fmt.pix.pixelformat = mtk_video_formats[OUT_FMT_IDX].fourcc;
> -		fmt = mtk_venc_find_format(f);
> +		fmt = &ctx->dev->venc_pdata->output_formats[0];
> +		f->fmt.pix.pixelformat = fmt->fourcc;
>  	}
>  	if (!f->fmt.pix_mp.colorspace) {
>  		f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
> @@ -1187,7 +1159,7 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
>  	q_data->coded_height = DFT_CFG_HEIGHT;
>  	q_data->field = V4L2_FIELD_NONE;
>  
> -	q_data->fmt = &mtk_video_formats[OUT_FMT_IDX];
> +	q_data->fmt = &ctx->dev->venc_pdata->output_formats[0];
>  
>  	v4l_bound_align_image(&q_data->coded_width,
>  				MTK_VENC_MIN_W,
> @@ -1216,7 +1188,7 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
>  	memset(q_data, 0, sizeof(struct mtk_q_data));
>  	q_data->coded_width = DFT_CFG_WIDTH;
>  	q_data->coded_height = DFT_CFG_HEIGHT;
> -	q_data->fmt = &mtk_video_formats[CAP_FMT_IDX];
> +	q_data->fmt = &ctx->dev->venc_pdata->capture_formats[0];
>  	q_data->field = V4L2_FIELD_NONE;
>  	ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
>  		DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 221fa0303075..c8a4b85a81c4 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -26,6 +26,42 @@
>  module_param(mtk_v4l2_dbg_level, int, S_IRUGO | S_IWUSR);
>  module_param(mtk_vcodec_dbg, bool, S_IRUGO | S_IWUSR);
>  
> +static const struct mtk_video_fmt mtk_video_formats_output_mt8173[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12M,
> +		.type = MTK_FMT_FRAME,
> +		.num_planes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV21M,
> +		.type = MTK_FMT_FRAME,
> +		.num_planes = 2,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YUV420M,
> +		.type = MTK_FMT_FRAME,
> +		.num_planes = 3,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_YVU420M,
> +		.type = MTK_FMT_FRAME,
> +		.num_planes = 3,
> +	},
> +};
> +
> +static const struct mtk_video_fmt mtk_video_formats_capture_mt8173[] =  {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264,
> +		.type = MTK_FMT_ENC,
> +		.num_planes = 1,
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_VP8,
> +		.type = MTK_FMT_ENC,
> +		.num_planes = 1,
> +	},
> +};
> +
>  /* Wake up context wait_queue */
>  static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
>  {
> @@ -380,6 +416,10 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  static const struct mtk_vcodec_enc_pdata mt8173_pdata = {
>  	.chip = MTK_MT8173,
>  	.has_lt_irq = true,
> +	.capture_formats = mtk_video_formats_capture_mt8173,
> +	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8173),
> +	.output_formats = mtk_video_formats_output_mt8173,
> +	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
>  	.min_bitrate = 1,
>  	.max_bitrate = 4000000,
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
