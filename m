Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E8FC4167D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKTyWokpX5cgue49QDtZFQPjUpwVAu8TbIboU5lRKS0=; b=DJr583mJSxpk3vyBLeG8Rw7Gaj
	CLwofAwsOPrchGzjZBiX0wzN2dnQLBQTBiizkVV4cdoGoIwaK7DmnsvrNFJV36/td0JZerEGQhN+d
	uWggImJLFgewtMz2HwybJCGdHQUic2Y9491Ls37EjPQ/Ht9eZLRd6X/STZfVALcFRzSQSxqt7xpfT
	pU8L3w3cMC9nx2J4Ob2sBJuQAEzhzFcYzd0XVamMh2PKlvnww9VBk2y+me2aWsqHVriqiwxtOTFqQ
	9pA/Zyogux6Ym3Zht1OHLuYOTsDA3QNI0mpbWa1mE9SJjZTK/Ky7SYMVU+pRlFm5P5drRDaKN4LG6
	LnZzyA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0g3F-003TlH-2z;
	Wed, 08 Nov 2023 10:44:49 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0g3B-003Tfc-0E
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 10:44:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6c43f830566so1399695b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Nov 2023 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699440284; x=1700045084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKTyWokpX5cgue49QDtZFQPjUpwVAu8TbIboU5lRKS0=;
        b=ZT0WlVQC6Z0Pkv/j8D6ZSY6mw7630QOB2n+HO0aKZ4Q743x5602Z/6kyZahE/3+Isa
         BjJp0eH8CUUbFwOzdsEyBkqrlFrtmAucCR9fHvNAv1xzMMsVMaF9ljAEFB2WGzXoaKTw
         mNhCBc/rH/lBTQTYUgBxoHbz9qrNK4Tpq2lpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440284; x=1700045084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKTyWokpX5cgue49QDtZFQPjUpwVAu8TbIboU5lRKS0=;
        b=xMMPPBi6DbZpzdeCKfc4Mm502PRmdl6HEcKO+ozIw1rerm2K9Vr9ckgm9YMEjme9V5
         OT3X1X86n8uAvmOK77sGF6wdspZLVrmnSkIwSuDHY9oM7c1xgEeGKDOjxxptTfeFG6Tb
         SS1l7TnnuctmhajPgc1AHAsaIESeNDU5wMnHcIVwCeuHc2xcSWw8zwreabt2EOTHnoNS
         nQ82sUvTwP7EHxcAfvSNvesq+ijQNTU0lKSUI40YK3cnOoby0d2wjcdGpFNhHDjFcma8
         ooahYFy5DFeu1m6LrnjvqiON5ReqiHJICEyZFkFgs/1og29N7ru8Pv6OfT32ryKfP3Ro
         WRjA==
X-Gm-Message-State: AOJu0YxC4kxif08GIqZyizIgstjsYBDg4duVw2HipVFMVz5Q8KHL/K74
	+b89u5yKKCfDfV+UV+w+z2/WSg==
X-Google-Smtp-Source: AGHT+IEzqy1BibD2RC0l4kCSPsKsVPKvQCQxco2ue8t7SCmmOXz1P0lkP95g4IaHmCfbUqjrwn7xKw==
X-Received: by 2002:a05:6a20:7f97:b0:14c:daa9:5e22 with SMTP id d23-20020a056a207f9700b0014cdaa95e22mr1989536pzj.45.1699440283822;
        Wed, 08 Nov 2023 02:44:43 -0800 (PST)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902e88c00b001bb3beb2bc6sm1450272plg.65.2023.11.08.02.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:43 -0800 (PST)
Date: Wed, 8 Nov 2023 10:44:39 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH v14 52/56] media: core: Add bitmap manage bufs array
 entries
Message-ID: <20231108104439.oxpbbd2yro7u57t4@chromium.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-53-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031163104.112469-53-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_024445_176695_337B4DA2 
X-CRM114-Status: GOOD (  34.27  )
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

On Tue, Oct 31, 2023 at 05:31:00PM +0100, Benjamin Gaignard wrote:
> Add a bitmap field to know which of bufs array entries are
> used or not.
> Remove no more used num_buffers field from queue structure.
> Use bitmap_find_next_zero_area() to find the first possible
> range when creating new buffers to fill the gaps.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 42 +++++++++++++++----
>  include/media/videobuf2-core.h                | 15 ++++---
>  2 files changed, 42 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 2c8cf479a962..6e88406fcae9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -416,11 +416,12 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
>   */
>  static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
>  {
> -	WARN_ON(index >= q->max_num_buffers || q->bufs[index]);
> +	WARN_ON(index >= q->max_num_buffers || test_bit(index, q->bufs_bitmap));
>  
>  	q->bufs[index] = vb;
>  	vb->index = index;
>  	vb->vb2_queue = q;
> +	set_bit(index, q->bufs_bitmap);
>  }
>  
>  /**
> @@ -429,6 +430,7 @@ static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, uns
>   */
>  static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
>  {
> +	clear_bit(vb->index, vb->vb2_queue->bufs_bitmap);
>  	vb->vb2_queue->bufs[vb->index] = NULL;
>  	vb->vb2_queue = NULL;
>  }
> @@ -450,11 +452,12 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned long index;
>  	int ret;
>  
> -	/* Ensure that the number of already queue + num_buffers is below q->max_num_buffers */
> +	/* Ensure that vb2_get_num_buffers(q) + num_buffers is no more than q->max_num_buffers */
>  	num_buffers = min_t(unsigned int, num_buffers,
>  			    q->max_num_buffers - vb2_get_num_buffers(q));
>  
> -	index = vb2_get_num_buffers(q);
> +	index = bitmap_find_next_zero_area(q->bufs_bitmap, q->max_num_buffers,
> +					   0, num_buffers, 0);
>  
>  	*first_index = index;
>  
> @@ -656,7 +659,6 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>  		kfree(vb);
>  	}
>  
> -	q->num_buffers -= buffers;
>  	if (!vb2_get_num_buffers(q)) {
>  		q->memory = VB2_MEMORY_UNKNOWN;
>  		INIT_LIST_HEAD(&q->queued_list);
> @@ -874,6 +876,14 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  		q->bufs = kcalloc(q->max_num_buffers, sizeof(*q->bufs), GFP_KERNEL);
>  	if (!q->bufs)
>  		ret = -ENOMEM;
> +
> +	if (!q->bufs_bitmap)
> +		q->bufs_bitmap = bitmap_zalloc(q->max_num_buffers, GFP_KERNEL);
> +	if (!q->bufs_bitmap) {
> +		ret = -ENOMEM;
> +		kfree(q->bufs);
> +		q->bufs = NULL;
> +	}
>  	q->memory = memory;
>  	mutex_unlock(&q->mmap_lock);
>  	if (ret)
> @@ -943,7 +953,6 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	}
>  
>  	mutex_lock(&q->mmap_lock);
> -	q->num_buffers = allocated_buffers;
>  
>  	if (ret < 0) {
>  		/*
> @@ -970,6 +979,10 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	mutex_lock(&q->mmap_lock);
>  	q->memory = VB2_MEMORY_UNKNOWN;
>  	mutex_unlock(&q->mmap_lock);
> +	kfree(q->bufs);
> +	q->bufs = NULL;
> +	bitmap_free(q->bufs_bitmap);
> +	q->bufs_bitmap = NULL;
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
> @@ -1006,9 +1019,19 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		q->memory = memory;
>  		if (!q->bufs)
>  			q->bufs = kcalloc(q->max_num_buffers, sizeof(*q->bufs), GFP_KERNEL);
> -		if (!q->bufs)
> +		if (!q->bufs) {
>  			ret = -ENOMEM;
> +			goto unlock;
> +		}
> +		if (!q->bufs_bitmap)
> +			q->bufs_bitmap = bitmap_zalloc(q->max_num_buffers, GFP_KERNEL);

Same as with the kcalloc(). Why not just allocate this in the core code,
e.g. vb2_core_queue_init()?

Actually, is it because we want to avoid allocating
resources early, before the need to actually use the vb2 queue?
If so, could this go to some other core function that runs later, e.g. __vb2_queue_alloc()?

> +		if (!q->bufs_bitmap) {
> +			ret = -ENOMEM;
> +			kfree(q->bufs);
> +			q->bufs = NULL;
> +		}
>  		mutex_unlock(&q->mmap_lock);
> +unlock:
>  		if (ret)
>  			return ret;
>  		q->waiting_for_buffers = !q->is_output;
> @@ -1070,7 +1093,6 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	}
>  
>  	mutex_lock(&q->mmap_lock);
> -	q->num_buffers += allocated_buffers;
>  
>  	if (ret < 0) {
>  		/*
> @@ -2549,7 +2571,9 @@ void vb2_core_queue_release(struct vb2_queue *q)
>  	__vb2_queue_free(q, q->max_num_buffers);
>  	kfree(q->bufs);
>  	q->bufs = NULL;
> -	q->num_buffers = 0;
> +	bitmap_free(q->bufs_bitmap);
> +	q->bufs_bitmap = NULL;
> +
>  	mutex_unlock(&q->mmap_lock);
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_queue_release);
> @@ -2904,7 +2928,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  	 * Check if we need to dequeue the buffer.
>  	 */
>  	index = fileio->cur_index;
> -	if (index >= q->num_buffers) {
> +	if (!test_bit(index, q->bufs_bitmap)) {

I don't like this low level manipulation of queue internals here (after all
the work other patches did to use helpers). Why not just keep
vb2_get_num_buffers() here?

>  		struct vb2_buffer *b;
>  
>  		/*
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 6986ff4b77cd..288477075a0e 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -346,7 +346,7 @@ struct vb2_buffer {
>   *			describes the requested number of planes and sizes\[\]
>   *			contains the requested plane sizes. In this case
>   *			\*num_buffers are being allocated additionally to
> - *			q->num_buffers. If either \*num_planes or the requested
> + *			queue buffers. If either \*num_planes or the requested

Perhaps "the buffers already in the queue"?

>   *			sizes are invalid callback must return %-EINVAL.
>   * @wait_prepare:	release any locks taken while calling vb2 functions;
>   *			it is called before an ioctl needs to wait for a new
> @@ -557,7 +557,7 @@ struct vb2_buf_ops {
>   * @memory:	current memory type used
>   * @dma_dir:	DMA mapping direction.
>   * @bufs:	videobuf2 buffer structures
> - * @num_buffers: number of allocated/used buffers
> + * @bufs_bitmap: bitmap to manage bufs entries.

Perhaps "bitmap tracking whether each bufs[] entry is used"?

>   * @max_num_buffers: upper limit of number of allocated/used buffers
>   * @queued_list: list of buffers currently queued from userspace
>   * @queued_count: number of buffers queued and ready for streaming.
> @@ -621,7 +621,7 @@ struct vb2_queue {
>  	unsigned int			memory;
>  	enum dma_data_direction		dma_dir;
>  	struct vb2_buffer		**bufs;
> -	unsigned int			num_buffers;
> +	unsigned long			*bufs_bitmap;
>  	unsigned int			max_num_buffers;
>  
>  	struct list_head		queued_list;
> @@ -1150,7 +1150,10 @@ static inline bool vb2_fileio_is_active(struct vb2_queue *q)
>   */
>  static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
>  {
> -	return q->num_buffers;
> +	if (!q->bufs_bitmap)
> +		return 0;
> +
> +	return bitmap_weight(q->bufs_bitmap, q->max_num_buffers);

Hmm, could we just cache the number of buffers we have, so that we don't
have to go over the entire bitmap every time? (Basically just keep the
code that we had for handling q->num_buffers before this patch.)

>  }
>  
>  /**
> @@ -1253,13 +1256,13 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
>  static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
>  						unsigned int index)
>  {
> -	if (!q->bufs)
> +	if (!q->bufs_bitmap)
>  		return NULL;
>  
>  	if (index >= q->max_num_buffers)
>  		return NULL;
>  
> -	if (index < q->num_buffers)
> +	if (test_bit(index, q->bufs_bitmap))

Aha, I see why we need the extra condition above now. Perhaps it should've
been added in this patch instead?

>  		return q->bufs[index];
>  	return NULL;
>  }
> -- 
> 2.39.2
> 

Best regards,
Tomasz

