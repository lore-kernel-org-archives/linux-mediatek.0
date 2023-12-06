Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0457C10DC1
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iasR0ont7KEb2V+TImJNSPcGqNGPtHS1lAicrpeMhoo=; b=DvsdD8lBbkh1bDQc6LuJLpVyHL
	o5i9MJiM5sXuj61Buri+A+aiaJEEPH7xBW7NbEQFUf2Ea2rHH1fPOMaR46hOJzfAoylGO9bN42Zhx
	aCqe/4BCRvHh+qrNo9/oPsvANcWUSwn35xbidY2Zvdww329bENKBTziixFugbqoy2Hl+aHkzq7Cgg
	zDTHsedp9kNu0VFd9XJ2/wQmAjgUfMyVXXNlHge9rIo9GNrd/NTBkP1AtAwn5CYNhiYe5D/gwcngn
	A7v69r6dLkOpKYHOUJfY6uany+KBr6wxE4BhCkfKZWBF8UAEURQmqM5/Ky1dFKC4yiuJtHz+2ShEw
	cJ/f5czQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnYN-009SXX-1W;
	Wed, 06 Dec 2023 08:46:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAnYJ-009SWM-3A;
	Wed, 06 Dec 2023 08:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BF126177E;
	Wed,  6 Dec 2023 08:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F84DC433C7;
	Wed,  6 Dec 2023 08:46:36 +0000 (UTC)
Message-ID: <574bb65f-872d-4bf4-9d3d-a330133de884@xs4all.nl>
Date: Wed, 6 Dec 2023 09:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3,16/21] media: medkatek: vcodec: support one plane
 capture buffer
Content-Language: en-US, nl
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-17-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231206081538.17056-17-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_004644_124136_B61B259B 
X-CRM114-Status: GOOD (  20.29  )
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

On 06/12/2023 09:15, Yunfei Dong wrote:
> The capture buffer has two planes for format MM21, but user space only
> allocate secure memory for plane[0], and the size is Y data + uv data.
> The driver need to support one plane decoder for svp mode.

For a future v4: note the typo in the Subject line: medkatek -> mediatek.
It's present in patches 16-20.

Regards,

	Hans

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  7 ++++-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 26 ++++++++++---------
>  .../decoder/vdec/vdec_h264_req_common.c       | 11 +++-----
>  .../mediatek/vcodec/decoder/vdec_drv_if.c     |  4 +--
>  4 files changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index 604fdc8ee3ce..ab922e8d2d37 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -653,7 +653,12 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
>  		 * So we just return picinfo yet, and update picinfo in
>  		 * stop_streaming hook function
>  		 */
> -		q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
> +
> +		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
> +			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0] + ctx->picinfo.fb_sz[1];
> +		else
> +			q_data->sizeimage[0] = ctx->picinfo.fb_sz[0];
> +
>  		q_data->sizeimage[1] = ctx->picinfo.fb_sz[1];
>  		q_data->bytesperline[0] = ctx->last_decoded_picinfo.buf_w;
>  		q_data->bytesperline[1] = ctx->last_decoded_picinfo.buf_w;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> index cc42c942eb8a..707ed57a412e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> @@ -285,14 +285,14 @@ static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
>  	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
>  
>  	pfb = &framebuf->frame_buffer;
> -	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
> +	if (!ctx->is_secure_playback)
> +		pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
>  	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
>  	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
>  
> -	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
> +	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2 && !ctx->is_secure_playback) {
>  		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
> -		pfb->base_c.dma_addr =
> -			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
> +		pfb->base_c.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 1);
>  		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
>  	}
>  	mtk_v4l2_vdec_dbg(1, ctx,
> @@ -339,16 +339,18 @@ static void mtk_vdec_worker(struct work_struct *work)
>  	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) id=%d, vb=%p", ctx->id,
>  			  vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
>  
> -	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
> -	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
> -	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
> -	if (!bs_src->va) {
> -		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> -		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
> -				  vb2_src->index);
> -		return;
> +	if (!ctx->is_secure_playback) {
> +		bs_src->va = vb2_plane_vaddr(vb2_src, 0);
> +		if (!bs_src->va) {
> +			v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +			mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
> +					  vb2_src->index);
> +			return;
> +		}
>  	}
>  
> +	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
> +	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
>  	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
>  			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
>  	/* Apply request controls. */
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
> index 5ca20d75dc8e..2a57e689ec07 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.c
> @@ -79,15 +79,12 @@ void mtk_vdec_h264_fill_dpb_info(struct mtk_vcodec_dec_ctx *ctx,
>  		vb2_v4l2 = container_of(vb, struct vb2_v4l2_buffer, vb2_buf);
>  		h264_dpb_info[index].field = vb2_v4l2->field;
>  
> -		h264_dpb_info[index].y_dma_addr =
> -			vb2_dma_contig_plane_dma_addr(vb, 0);
> +		h264_dpb_info[index].y_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
>  		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
> +			h264_dpb_info[index].c_dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
> +		else if (!ctx->is_secure_playback)
>  			h264_dpb_info[index].c_dma_addr =
> -				vb2_dma_contig_plane_dma_addr(vb, 1);
> -		else
> -			h264_dpb_info[index].c_dma_addr =
> -				h264_dpb_info[index].y_dma_addr +
> -				ctx->picinfo.fb_sz[0];
> +				h264_dpb_info[index].y_dma_addr + ctx->picinfo.fb_sz[0];
>  	}
>  }
>  
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
> index d0b459b1603f..fb3e4f75ed93 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.c
> @@ -73,14 +73,14 @@ int vdec_if_decode(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *bs,
>  {
>  	int ret = 0;
>  
> -	if (bs) {
> +	if (bs && !ctx->is_secure_playback) {
>  		if ((bs->dma_addr & 63) != 0) {
>  			mtk_v4l2_vdec_err(ctx, "bs dma_addr should 64 byte align");
>  			return -EINVAL;
>  		}
>  	}
>  
> -	if (fb) {
> +	if (fb && !ctx->is_secure_playback) {
>  		if (((fb->base_y.dma_addr & 511) != 0) ||
>  		    ((fb->base_c.dma_addr & 511) != 0)) {
>  			mtk_v4l2_vdec_err(ctx, "frame buffer dma_addr should 512 byte align");


