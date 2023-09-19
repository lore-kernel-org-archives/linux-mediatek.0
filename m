Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594CECD54B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb7VdLXKxwgocSA4R8WQwIWkK995dWBvRGjqX5tqvac=; b=WkwYi06zTDdsos1OtqxLF5IV05
	xlcktdPXeLE3Gq24+e3MfU2TxOQBNvSwudZjuaTtACXclKpkd4qry2dLdqWi6PHtqsq+5b45u1pEm
	ESy6XW1Aiod26j5rqmtMg9MEKj9s2qXXxLwRsbmPkZ+vgeGAt3DQhxyVRCr2RrSaQIEwrpqyjCqar
	ezqhMdA1eykEsM3JUlM61lAYB4EFFreMdwCRSPB7/tttV+2acOKaoISVvOwrfTRc0PsRumnD3l7dz
	qSGdF7tCQ0VwbRzgnWt0/uKhUErgTz2u7Gzwv96rSzOXhm/QWry3EVDSZdza/wbfhrSj5b3UuWc4P
	f/V8ny0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYQV-000Bxn-0c;
	Tue, 19 Sep 2023 10:57:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYQQ-000Btr-2y;
	Tue, 19 Sep 2023 10:57:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33CDA615BF;
	Tue, 19 Sep 2023 10:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A79C433C7;
	Tue, 19 Sep 2023 10:57:45 +0000 (UTC)
Message-ID: <929e9bf7-9b9e-4b7f-889d-b2bc144fd39a@xs4all.nl>
Date: Tue, 19 Sep 2023 12:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/49] media: verisilicon: Refactor postprocessor to
 store more buffers
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
 <20230914133323.198857-14-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-14-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_035751_047376_AF902932 
X-CRM114-Status: GOOD (  30.04  )
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

On 14/09/2023 15:32, Benjamin Gaignard wrote:
> Since vb2 queue can store than VB2_MAX_FRAME buffers postprocessor

Change to:

Since vb2 queue can store more than VB2_MAX_FRAME buffers, the postprocessor

Regards,

	Hans

> buffer storage must be capable to store more buffers too.
> Change static dec_q array to allocated array to be capable to store
> up to queue 'max_allowed_buffers'.
> Keep allocating queue 'num_buffers' at queue setup time but also allows
> to allocate postprocessors buffers on the fly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/platform/verisilicon/hantro.h   |  7 +-
>  .../media/platform/verisilicon/hantro_drv.c   |  4 +-
>  .../media/platform/verisilicon/hantro_hw.h    |  4 +-
>  .../platform/verisilicon/hantro_postproc.c    | 93 +++++++++++++++----
>  .../media/platform/verisilicon/hantro_v4l2.c  |  2 +-
>  5 files changed, 85 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
> index 77aee9489516..0948b04a9f8d 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -469,11 +469,14 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
>  bool hantro_needs_postproc(const struct hantro_ctx *ctx,
>  			   const struct hantro_fmt *fmt);
>  
> +dma_addr_t
> +hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index);
> +
>  static inline dma_addr_t
>  hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
>  {
>  	if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
> -		return ctx->postproc.dec_q[vb->index].dma;
> +		return hantro_postproc_get_dec_buf_addr(ctx, vb->index);
>  	return vb2_dma_contig_plane_dma_addr(vb, 0);
>  }
>  
> @@ -485,8 +488,8 @@ vb2_to_hantro_decoded_buf(struct vb2_buffer *buf)
>  
>  void hantro_postproc_disable(struct hantro_ctx *ctx);
>  void hantro_postproc_enable(struct hantro_ctx *ctx);
> +int hantro_postproc_init(struct hantro_ctx *ctx);
>  void hantro_postproc_free(struct hantro_ctx *ctx);
> -int hantro_postproc_alloc(struct hantro_ctx *ctx);
>  int hanto_postproc_enum_framesizes(struct hantro_ctx *ctx,
>  				   struct v4l2_frmsizeenum *fsize);
>  
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 423fc85d79ee..18f56edee3fc 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -234,8 +234,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>  	 * The Kernel needs access to the JPEG destination buffer for the
>  	 * JPEG encoder to fill in the JPEG headers.
>  	 */
> -	if (!ctx->is_encoder)
> +	if (!ctx->is_encoder) {
>  		dst_vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
> +		dst_vq->max_allowed_buffers = MAX_POSTPROC_BUFFERS;
> +	}
>  
>  	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
> index 7f33f7b07ce4..292a76ef643e 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -40,6 +40,8 @@
>  
>  #define AV1_MAX_FRAME_BUF_COUNT	(V4L2_AV1_TOTAL_REFS_PER_FRAME + 1)
>  
> +#define MAX_POSTPROC_BUFFERS	64
> +
>  struct hantro_dev;
>  struct hantro_ctx;
>  struct hantro_buf;
> @@ -336,7 +338,7 @@ struct hantro_av1_dec_hw_ctx {
>   * @dec_q:		References buffers, in decoder format.
>   */
>  struct hantro_postproc_ctx {
> -	struct hantro_aux_buf dec_q[VB2_MAX_FRAME];
> +	struct hantro_aux_buf dec_q[MAX_POSTPROC_BUFFERS];
>  };
>  
>  /**
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
> index 0224ff68ab3f..e624cd98f41b 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -177,9 +177,11 @@ static int hantro_postproc_g2_enum_framesizes(struct hantro_ctx *ctx,
>  void hantro_postproc_free(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu = ctx->dev;
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	struct vb2_queue *queue = &m2m_ctx->cap_q_ctx.q;
>  	unsigned int i;
>  
> -	for (i = 0; i < VB2_MAX_FRAME; ++i) {
> +	for (i = 0; i < queue->max_allowed_buffers; ++i) {
>  		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
>  
>  		if (priv->cpu) {
> @@ -190,20 +192,17 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
>  	}
>  }
>  
> -int hantro_postproc_alloc(struct hantro_ctx *ctx)
> +static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
>  {
> -	struct hantro_dev *vpu = ctx->dev;
> -	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> -	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
> -	unsigned int num_buffers = cap_queue->num_buffers;
>  	struct v4l2_pix_format_mplane pix_mp;
>  	const struct hantro_fmt *fmt;
> -	unsigned int i, buf_size;
> +	unsigned int buf_size;
>  
>  	/* this should always pick native format */
>  	fmt = hantro_get_default_fmt(ctx, false, ctx->bit_depth, HANTRO_AUTO_POSTPROC);
>  	if (!fmt)
> -		return -EINVAL;
> +		return 0;
> +
>  	v4l2_fill_pixfmt_mp(&pix_mp, fmt->fourcc, ctx->src_fmt.width,
>  			    ctx->src_fmt.height);
>  
> @@ -221,23 +220,77 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>  		buf_size += hantro_av1_mv_size(pix_mp.width,
>  					       pix_mp.height);
>  
> -	for (i = 0; i < num_buffers; ++i) {
> -		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
> +	return buf_size;
> +}
> +
> +static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
> +{
> +	struct hantro_dev *vpu = ctx->dev;
> +	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
> +	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
> +
> +	if (!buf_size)
> +		return -EINVAL;
> +
> +	/*
> +	 * The buffers on this queue are meant as intermediate
> +	 * buffers for the decoder, so no mapping is needed.
> +	 */
> +	priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> +	priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
> +				    GFP_KERNEL, priv->attrs);
> +	if (!priv->cpu)
> +		return -ENOMEM;
> +	priv->size = buf_size;
> +
> +	return 0;
> +}
>  
> -		/*
> -		 * The buffers on this queue are meant as intermediate
> -		 * buffers for the decoder, so no mapping is needed.
> -		 */
> -		priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
> -		priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
> -					    GFP_KERNEL, priv->attrs);
> -		if (!priv->cpu)
> -			return -ENOMEM;
> -		priv->size = buf_size;
> +int hantro_postproc_init(struct hantro_ctx *ctx)
> +{
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
> +	unsigned int num_buffers = cap_queue->num_buffers;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < num_buffers; i++) {
> +		ret = hantro_postproc_alloc(ctx, i);
> +		if (ret)
> +			return ret;
>  	}
> +
>  	return 0;
>  }
>  
> +dma_addr_t
> +hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index)
> +{
> +	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
> +	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
> +	struct hantro_dev *vpu = ctx->dev;
> +	int ret;
> +
> +	if (priv->size < buf_size && priv->cpu) {
> +		/* buffer is too small, release it */
> +		dma_free_attrs(vpu->dev, priv->size, priv->cpu,
> +			       priv->dma, priv->attrs);
> +		priv->cpu = NULL;
> +	}
> +
> +	if (!priv->cpu) {
> +		/* buffer not already allocated, try getting a new one */
> +		ret = hantro_postproc_alloc(ctx, index);
> +		if (ret)
> +			return 0;
> +	}
> +
> +	if (!priv->cpu)
> +		return 0;
> +
> +	return priv->dma;
> +}
> +
>  static void hantro_postproc_g1_disable(struct hantro_ctx *ctx)
>  {
>  	struct hantro_dev *vpu = ctx->dev;
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index b3ae037a50f6..f0d8b165abcd 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -933,7 +933,7 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
>  		}
>  
>  		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt)) {
> -			ret = hantro_postproc_alloc(ctx);
> +			ret = hantro_postproc_init(ctx);
>  			if (ret)
>  				goto err_codec_exit;
>  		}


