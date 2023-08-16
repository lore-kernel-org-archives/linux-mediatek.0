Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE06FC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5n91htKzIHlpOuyIAFaHjnrWIciBtPbUUme3oKXxmls=; b=BXqwI3OghQPwBe+I796N5tLVDf
	Ownn7QnvGOCwQCuKT6ZprxCs7boj4W6R1yWyMmQZAe2inld7PqXqdtlZcAcNDtPjV+DN62wlhMLTO
	6GK4ZwrrwlfRqQ1OsAdZFHnwfz/rdTIOCeBTj+iOvjWOB8+BGoq5q1Ao0G7Z6IubiAs2qMmr5td1V
	wvs7PHJocXkbvBMVNFKJPyIaxg7hXceDggGicw4HAYilDC1V415WHDgGe5US6dp8Wqjx0fXKoUGVy
	B5vm9JddhOSgUwb9gjg2f3BIwiojgLtOBd3np2S/D0QgBZTnWHgOL4i2CNUzr7sPNaXLKJ15u38vk
	pgHGqrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWHbX-004NWo-1e;
	Wed, 16 Aug 2023 14:34:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWHbU-004NUY-1c
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 14:34:34 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD170C85;
	Wed, 16 Aug 2023 16:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692196394;
	bh=ch/klZHDWO7+wfH82u1d/vkSCn7e/idW6e/eLKXAOcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWYyocUEZHPl4QsqQwrzXI2aFJhpjS60bm9JqNSp/G3txrZ+vWwJOPwbQl+9NZriA
	 RzqTL3vt03+3MRkKKkWRWQPjgBwUuuUwGcIsIXlIGzmYY5bz121MXVH1AKa8kghUPq
	 UzcNBo3d6EWfoi2B2PZJiLxud8luDeufVKADRWvo=
Date: Wed, 16 Aug 2023 17:34:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH] media: videobuf2-core.c: check if all buffers have the
 same number of planes
Message-ID: <20230816143432.GA4436@pendragon.ideasonboard.com>
References: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_073432_709480_25833910 
X-CRM114-Status: GOOD (  26.00  )
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

Hi Hans,

Thank you for the patch.

On Wed, Aug 16, 2023 at 02:47:33PM +0200, Hans Verkuil wrote:
> Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
> number of planes per buffer might be different from the already allocated buffers.
> 
> However, this does not make a lot of sense and there are no drivers that allow
> for variable number of planes in the allocated buffers.
> 
> While it is possible do this today, when such a buffer is queued it will fail
> in the buf_prepare() callback where the plane sizes are checked if those are
> large enough. If fewer planes were allocated, then the size for the missing
> planes are 0 and the check will return -EINVAL.
> 
> But it is much better to do this check in VIDIOC_CREATE_BUFS.

I don't think this is a good idea. One important use case for
VIDIOC_CREATE_BUFS is to allocate buffers for a different format than
the one currently configured for the device, to prepare for a future
capture (or output) session with a different configuration. This patch
would prevent that.

> This patch adds the check to videobuf2-core.c
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> With this patch the mediatek vcodec patch would no longer be needed:
> https://patchwork.linuxtv.org/project/linux-media/patch/20230810082333.972165-1-harperchen1110@gmail.com/
> ---
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index cf6727d9c81f..b88c08319bbe 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -938,6 +938,10 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			dprintk(q, 1, "memory model mismatch\n");
>  			return -EINVAL;
>  		}
> +		if (requested_planes != q->num_planes) {
> +			dprintk(q, 1, "num_planes mismatch\n");
> +			return -EINVAL;
> +		}
>  		if (!verify_coherency_flags(q, non_coherent_mem))
>  			return -EINVAL;
>  	}
> @@ -1002,6 +1006,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		mutex_unlock(&q->mmap_lock);
>  		return -ENOMEM;
>  	}
> +	if (no_previous_buffers)
> +		q->num_planes = num_planes;
>  	mutex_unlock(&q->mmap_lock);
> 
>  	/*
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 4b6a9d2ea372..799a285447b7 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -558,6 +558,7 @@ struct vb2_buf_ops {
>   * @dma_dir:	DMA mapping direction.
>   * @bufs:	videobuf2 buffer structures
>   * @num_buffers: number of allocated/used buffers
> + * @num_planes: number of planes in each buffer
>   * @queued_list: list of buffers currently queued from userspace
>   * @queued_count: number of buffers queued and ready for streaming.
>   * @owned_by_drv_count: number of buffers owned by the driver
> @@ -621,6 +622,7 @@ struct vb2_queue {
>  	enum dma_data_direction		dma_dir;
>  	struct vb2_buffer		*bufs[VB2_MAX_FRAME];
>  	unsigned int			num_buffers;
> +	unsigned int			num_planes;
> 
>  	struct list_head		queued_list;
>  	unsigned int			queued_count;

-- 
Regards,

Laurent Pinchart

