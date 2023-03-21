Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5FFC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS7ikpLo8MFCdlJeU/PbWeIEEgPV5xwKINtINSD0g0A=; b=GRbszt45jIlEHBskaTobi3hTB1
	DCOrIMPIpaP12ZtL21xL6cObCi17bIT+5LYVK20S5iGCqOma38oUsxVK6OrCKoQXb8IScYcLg7x/0
	7DFw/lB613BjvW8kht9VGWLLQOAguwucramTIWrSPJuTD32fgkkg511KH8hID3c9LKYgSugUpk4nv
	rhQQMjaPlZSVu3EDRgTBXcJRzoTJef+gFN42YPHY55LMGjSFQasby/mWntTCnZkgD6TAAm3gm9mpK
	dSEL4A6zAm2LsPkaYGXnd+BxFjrVHBiYlNZKBEAHCO+o2eBCDg0vUxKuN5Sg83K1A3WORzagjSSLJ
	MNIk2ZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pegWt-00DKCc-2B;
	Tue, 21 Mar 2023 18:16:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pegWo-00DKAo-1F;
	Tue, 21 Mar 2023 18:16:12 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 460FAFB;
	Tue, 21 Mar 2023 19:16:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1679422564;
	bh=YYbBI+yZSSJbYGhSeo7clHqjJfv86VCoUJSEWpYXO+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=et96KRBewPZzizQfexOFCLJXkqb5wSeGgSv6hB9T2tVkzio8N0HVTy7cx7cQxPgeJ
	 xkoMRqVvU70aL6Gb9D3BeLPHdljMgL/LuwnNWcLW5bf0+XFhvoWCKgy4EI5/1+occk
	 4d/lA/Yw7mIY0BWH9k+99HYvgqDCoH4KUE2+nYE4=
Date: Tue, 21 Mar 2023 20:16:10 +0200
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
	jernel@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/8] media: videobuf2: Make bufs array dynamic
 allocated
Message-ID: <20230321181610.GE20234@pendragon.ideasonboard.com>
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-3-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230321102855.346732-3-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_111610_592703_CEA08384 
X-CRM114-Status: GOOD (  23.54  )
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

On Tue, Mar 21, 2023 at 11:28:49AM +0100, Benjamin Gaignard wrote:
> Instead of a static array change bufs to a dynamically allocated array.
> This will allow to store more video buffer if needed.
> Protect the array with a spinlock.

I think I asked in the review of v1 why we couldn't use the kernel
IDA/IDR APIs to allocate buffer IDs and register buffers, but I don't
think I've received a reply. Wouldn't it be better than rolling out our
own mechanism ?

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   |  8 +++
>  include/media/videobuf2-core.h                | 49 ++++++++++++++++---
>  2 files changed, 49 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 79e90e338846..ae9d72f4d181 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2452,6 +2452,13 @@ int vb2_core_queue_init(struct vb2_queue *q)
>  	mutex_init(&q->mmap_lock);
>  	init_waitqueue_head(&q->done_wq);
>  
> +	q->max_num_bufs = 32;
> +	q->bufs = kmalloc_array(q->max_num_bufs, sizeof(*q->bufs), GFP_KERNEL | __GFP_ZERO);
> +	if (!q->bufs)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&q->bufs_lock);
> +
>  	q->memory = VB2_MEMORY_UNKNOWN;
>  
>  	if (q->buf_struct_size == 0)
> @@ -2479,6 +2486,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
>  	mutex_lock(&q->mmap_lock);
>  	__vb2_queue_free(q, q->num_buffers);
>  	mutex_unlock(&q->mmap_lock);
> +	kfree(q->bufs);
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_queue_release);
>  
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 5b1e3d801546..397dbf6e61e1 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -558,6 +558,8 @@ struct vb2_buf_ops {
>   * @dma_dir:	DMA mapping direction.
>   * @bufs:	videobuf2 buffer structures
>   * @num_buffers: number of allocated/used buffers
> + * @bufs_lock: lock to protect bufs access
> + * @max_num_bufs: max number of buffers storable in bufs
>   * @queued_list: list of buffers currently queued from userspace
>   * @queued_count: number of buffers queued and ready for streaming.
>   * @owned_by_drv_count: number of buffers owned by the driver
> @@ -619,8 +621,10 @@ struct vb2_queue {
>  	struct mutex			mmap_lock;
>  	unsigned int			memory;
>  	enum dma_data_direction		dma_dir;
> -	struct vb2_buffer		*bufs[VB2_MAX_FRAME];
> +	struct vb2_buffer		**bufs;
>  	unsigned int			num_buffers;
> +	spinlock_t			bufs_lock;
> +	size_t				max_num_bufs;
>  
>  	struct list_head		queued_list;
>  	unsigned int			queued_count;
> @@ -1239,9 +1243,16 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
>  static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
>  						unsigned int index)
>  {
> -	if (index < q->num_buffers)
> -		return q->bufs[index];
> -	return NULL;
> +	struct vb2_buffer *vb = NULL;
> +
> +	spin_lock(&q->bufs_lock);
> +
> +	if (index < q->max_num_bufs)
> +		vb = q->bufs[index];
> +
> +	spin_unlock(&q->bufs_lock);
> +
> +	return vb;
>  }
>  
>  /**
> @@ -1251,12 +1262,30 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
>   */
>  static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
>  {
> -	if (vb->index < VB2_MAX_FRAME) {
> +	bool ret = false;
> +
> +	spin_lock(&q->bufs_lock);
> +
> +	if (vb->index >= q->max_num_bufs) {
> +		struct vb2_buffer **tmp;
> +
> +		tmp = krealloc_array(q->bufs, q->max_num_bufs * 2, sizeof(*q->bufs), GFP_KERNEL);
> +		if (!tmp)
> +			goto realloc_failed;
> +
> +		q->max_num_bufs *= 2;
> +		q->bufs = tmp;
> +	}
> +
> +	if (vb->index < q->max_num_bufs) {
>  		q->bufs[vb->index] = vb;
> -		return true;
> +		ret = true;
>  	}
>  
> -	return false;
> +realloc_failed:
> +	spin_unlock(&q->bufs_lock);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -1266,8 +1295,12 @@ static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *
>   */
>  static inline void vb2_queue_remove_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
>  {
> -	if (vb->index < VB2_MAX_FRAME)
> +	spin_lock(&q->bufs_lock);
> +
> +	if (vb->index < q->max_num_bufs)
>  		q->bufs[vb->index] = NULL;
> +
> +	spin_unlock(&q->bufs_lock);
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart

