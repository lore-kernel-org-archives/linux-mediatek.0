Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3591AC6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejA8MmGoaO1zXV3ZtAo7KOyq1qm3Qy3yMbTErqQghIs=; b=F7jJbMm7F/n3iUb6a1rEvEwIaA
	4aZ28R45kY5TPQi1ItZ7upZ7vac5WYJ/NPegXEz5zmD+NSImIhgYVYCB1Nbi2kMfEuhllpFKX9jj2
	7DBoWFgxXujiX/NkNvZwhwkKTa7A+I+HxQznvMNlwL0OYjPC05o/WAOSjAVVq7Q8d34KcuFIq/hMs
	okmUcyf1qYWw2V2YTcX1174EELSS01oxkk5VbtTNm0C7c3NtO1KDaJJK/lcORTd9IJuYZfBCc7+n7
	VhGKYj7GLJTZ1UKI/Trt444Lq06WFS5dtbh1XqeP+YFnT/fB4RyPyam+FnqTPY95oFcsvthIrxDWe
	Vx4AvHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbmhD-007GAB-R9; Mon, 13 Mar 2023 18:14:55 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbmh4-007G7w-2K; Mon, 13 Mar 2023 18:14:47 +0000
Received: from pendragon.ideasonboard.com (unknown [89.244.118.114])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D6B16FA;
	Mon, 13 Mar 2023 19:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1678731284;
	bh=ECiuzkN+DQNQmLQ9FTJM9eiXiAf3Dhfgrx4QRUBTQag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hp3tT8MEY1rg0ePG1lryXVLvQL0nDEttkrDEwbh9XQRRhQxYs/wPJoW700jfDUeCF
	 qFrwMfZYGqpNq3oN/L5IQrZVh0/Sm2OnHOfg3vg1xaZFkPfRu9dY9YGq3jw/XRu87T
	 J57mJg9x30wvyFq0EAMz4gQknKoQlaikH07FFnXs=
Date: Mon, 13 Mar 2023 20:14:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	ming.qian@nxp.com, shijie.qin@nxp.com, eagle.zhou@nxp.com,
	bin.liu@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	daniel.almeida@collabora.com, hverkuil-cisco@xs4all.nl,
	jerbel@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [RFC 3/4] media: videobuf2: Use bitmap to manage vb2 index
Message-ID: <20230313181448.GD22646@pendragon.ideasonboard.com>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
 <20230313135916.862852-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230313135916.862852-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_111446_276542_3A0E4E53 
X-CRM114-Status: GOOD (  24.38  )
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

Hi Benjamin,

Thank you for the patch.

On Mon, Mar 13, 2023 at 02:59:15PM +0100, Benjamin Gaignard wrote:
> Using a bitmap to get vb2 index will allow to avoid holes
> in the indexes when introducing DELETE_BUF ioctl.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 22 ++++++++++++++++++-
>  include/media/videobuf2-core.h                |  6 +++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 96597d339a07..3554811ec06a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -397,6 +397,22 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
>  		vb->skip_cache_sync_on_finish = 1;
>  }
>  
> +/*
> + * __vb2_get_index() - find a free index in the queue for vb2 buffer.
> + *
> + * Returns an index for vb2 buffer.
> + */
> +static int __vb2_get_index(struct vb2_queue *q)
> +{
> +	unsigned long index;
> +
> +	index = bitmap_find_next_zero_area(q->bmap, q->idx_max, 0, 1, 0);
> +	if (index > q->idx_max)
> +		dprintk(q, 1, "no index available for buffer\n");

Ignoring the error is scary. If we limited the total number of buffers
as proposed in the review of 2/4, the error wouldn't occur.

I'm also wondering if it wouldn't be better to use the IDA API to
allocate IDs, and possibly the IDR API as well to replace the list.

> +
> +	return index;
> +}
> +
>  /*
>   * __vb2_queue_alloc() - allocate vb2 buffer structures and (for MMAP type)
>   * video buffer memory for all buffers/planes on the queue and initializes the
> @@ -423,7 +439,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		vb->state = VB2_BUF_STATE_DEQUEUED;
>  		vb->vb2_queue = q;
>  		vb->num_planes = num_planes;
> -		vb->index = q->num_buffers + buffer;
> +		vb->index = __vb2_get_index(q);
>  		vb->type = q->type;
>  		vb->memory = memory;
>  		init_buffer_cache_hints(q, vb);
> @@ -2438,6 +2454,9 @@ int vb2_core_queue_init(struct vb2_queue *q)
>  	mutex_init(&q->mmap_lock);
>  	init_waitqueue_head(&q->done_wq);
>  
> +	q->idx_max = ALIGN(256, BITS_PER_LONG);
> +	q->bmap = bitmap_zalloc(q->idx_max, GFP_KERNEL);
> +
>  	q->memory = VB2_MEMORY_UNKNOWN;
>  
>  	if (q->buf_struct_size == 0)
> @@ -2465,6 +2484,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
>  	mutex_lock(&q->mmap_lock);
>  	__vb2_queue_free(q, q->num_buffers);
>  	mutex_unlock(&q->mmap_lock);
> +	bitmap_free(q->bmap);
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_queue_release);
>  
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 47f1f35eb9cb..4fddc6ae9f20 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -561,6 +561,8 @@ struct vb2_buf_ops {
>   * @dma_dir:	DMA mapping direction.
>   * @allocated_bufs: list of buffer allocated for the queue.
>   * @num_buffers: number of allocated/used buffers
> + * @bmap: Bitmap of buffers index
> + * @idx_max: number of bits in bmap
>   * @queued_list: list of buffers currently queued from userspace
>   * @queued_count: number of buffers queued and ready for streaming.
>   * @owned_by_drv_count: number of buffers owned by the driver
> @@ -624,6 +626,8 @@ struct vb2_queue {
>  	enum dma_data_direction		dma_dir;
>  	struct list_head		allocated_bufs;
>  	unsigned int			num_buffers;
> +	unsigned long			*bmap;
> +	int				idx_max;
>  
>  	struct list_head		queued_list;
>  	unsigned int			queued_count;
> @@ -1259,6 +1263,7 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
>  static inline void vb2_set_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
>  {
>  	list_add_tail(&vb->allocated_entry, &q->allocated_bufs);
> +	__set_bit(vb->index, q->bmap);
>  }
>  
>  /**
> @@ -1268,6 +1273,7 @@ static inline void vb2_set_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
>   */
>  static inline void vb2_del_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
>  {
> +	__clear_bit(vb->index, q->bmap);
>  	list_del(&vb->allocated_entry);
>  }
>  

-- 
Regards,

Laurent Pinchart

