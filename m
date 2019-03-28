From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] media: mtk-vcodec: fix access to incorrect planes member
Date: Wed, 27 Mar 2019 22:37:39 -0300
Message-ID: <c01a999f47447f29537e9710f37f5a44a55ea102.camel@collabora.com>
References: <20190326074423.123864-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326074423.123864-1-acourbot@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-03-26 at 16:44 +0900, Alexandre Courbot wrote:
> Commit 0650a91499e0 ("media: mtk-vcodec: Correct return type for mem2mem
> buffer helpers") fixed the return types for mem2mem buffer helper
> functions by changing a few local variables from vb2_buffer to
> vb2_v4l2_buffer. However, it left a few accesses to vb2_buffer::planes
> as-is, accidentally turning them into accesses to
> vb2_v4l2_buffer::planes and resulting in values being read from/written
> to the wrong place.
> 
> Fix this by inserting vb2_buf into these accesses so they mimic their
> original behavior.
> 
> Fixes: 0650a91499e0 ("media: mtk-vcodec: Correct return type for mem2mem buffer helpers")
> 

Hm, having these multiple "vb2_planes planes" fields is extremely confusing!

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks for fixing this,
Eze

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  4 ++--
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 10 +++++-----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index a85c7cc8328e..e20b340855e7 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -388,7 +388,7 @@ static void mtk_vdec_worker(struct work_struct *work)
>  	}
>  	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
>  	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> -	buf.size = (size_t)src_buf->planes[0].bytesused;
> +	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
>  	if (!buf.va) {
>  		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>  		mtk_v4l2_err("[%d] id=%d src_addr is NULL!!",
> @@ -1155,7 +1155,7 @@ static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
>  
>  	src_mem.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
>  	src_mem.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> -	src_mem.size = (size_t)src_buf->planes[0].bytesused;
> +	src_mem.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
>  	mtk_v4l2_debug(2,
>  			"[%d] buf id=%d va=%p dma=%pad size=%zx",
>  			ctx->id, src_buf->vb2_buf.index,
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index c6b48b5925fb..50351adafc47 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -894,7 +894,7 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>  
>  	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>  		while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
> -			dst_buf->planes[0].bytesused = 0;
> +			dst_buf->vb2_buf.planes[0].bytesused = 0;
>  			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>  		}
>  	} else {
> @@ -947,7 +947,7 @@ static int mtk_venc_encode_header(void *priv)
>  
>  	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
>  	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> -	bs_buf.size = (size_t)dst_buf->planes[0].length;
> +	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
>  
>  	mtk_v4l2_debug(1,
>  			"[%d] buf id=%d va=0x%p dma_addr=0x%llx size=%zu",
> @@ -976,7 +976,7 @@ static int mtk_venc_encode_header(void *priv)
>  	}
>  
>  	ctx->state = MTK_STATE_HEADER;
> -	dst_buf->planes[0].bytesused = enc_result.bs_size;
> +	dst_buf->vb2_buf.planes[0].bytesused = enc_result.bs_size;
>  	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
>  
>  	return 0;
> @@ -1107,12 +1107,12 @@ static void mtk_venc_worker(struct work_struct *work)
>  
>  	if (ret) {
>  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> -		dst_buf->planes[0].bytesused = 0;
> +		dst_buf->vb2_buf.planes[0].bytesused = 0;
>  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>  		mtk_v4l2_err("venc_if_encode failed=%d", ret);
>  	} else {
>  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> -		dst_buf->planes[0].bytesused = enc_result.bs_size;
> +		dst_buf->vb2_buf.planes[0].bytesused = enc_result.bs_size;
>  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
>  		mtk_v4l2_debug(2, "venc_if_encode bs size=%d",
>  				 enc_result.bs_size);
