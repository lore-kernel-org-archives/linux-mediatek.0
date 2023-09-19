Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711EECD5BAC
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uVz+80h/nSv9XGpMNd/4a1ZIXrLIps1dac6iRJIFgc=; b=UT6q+PJhNY7fxJ5f9v6T9PRVcz
	/h2Yy1bGrmkqKYHi6VrNgBN2NAmnAMBBW00jTJDwthcQPGTq4mEecPD5R4gHbi9omz0SMvvLE3TiY
	xdoThzEmfMmEl70G/V6IHLO1tj2Jyfj1EFWfLWoV96RlnvOL3O6UQPbL3NgmtTLvsSlaNMDvP/FBD
	FX8BYN6NSjuDzm0jD4LQSZWPhiE3I6Z8JiFnGOlwysq0e6KRVuIgetfDEbwy+/oaiJrCXmuxHncZn
	IoFZY0+z2XwpgqumRynDC03W1QpcQNTo8RAEkyQsAYtUNemI6rWMCg3xOFy6j69uXhSBdS95D/iVH
	I+HT/ymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZwK-000QXc-09;
	Tue, 19 Sep 2023 12:34:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZwG-000QWS-0b;
	Tue, 19 Sep 2023 12:34:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D29B6153F;
	Tue, 19 Sep 2023 12:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D65C433C9;
	Tue, 19 Sep 2023 12:34:42 +0000 (UTC)
Message-ID: <50e4bc29-2c2d-48ae-aafc-bcedcba9c104@xs4all.nl>
Date: Tue, 19 Sep 2023 14:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 20/49] media: core: Rework how create_buf index
 returned value is computed
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
 <20230914133323.198857-21-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-21-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_053448_337007_266D333C 
X-CRM114-Status: GOOD (  27.12  )
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

This patch is too early, it should be moved to after 44/49.

Up to 44/49 (and excluding this patch), it is all internal rework that can
fairly easily be merged. This patch + 45-49 is where the actual delete_buf
implementation happens.

I would like to get all the prep work merged fairly soon (ideally for 6.7).
At that point we support more than 32 buffers, but not yet deleting buffers.

That last step can be worked on separately. But we're dealing with a much
shorter patch series at that point.

I'll get back to this patch later for a proper review.

Regards,

	Hans

On 14/09/2023 15:32, Benjamin Gaignard wrote:
> When DELETE_BUFS will be introduced holes could created in bufs array.
> To be able to reuse these unused indices reworking how create->index
> is set is mandatory.
> Let __vb2_queue_alloc() decide which first index is correct and
> forward this to the caller.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 24 +++++++++++++------
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 17 +++++++------
>  include/media/videobuf2-core.h                |  4 +++-
>  3 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 70b6b8f8c390..a4c2fae8705d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -443,15 +443,24 @@ static void vb2_queue_remove_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
>   */
>  static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  			     unsigned int num_buffers, unsigned int num_planes,
> -			     const unsigned plane_sizes[VB2_MAX_PLANES])
> +			     const unsigned plane_sizes[VB2_MAX_PLANES],
> +			     unsigned int *first)
>  {
>  	unsigned int buffer, plane;
>  	struct vb2_buffer *vb;
> +	unsigned long first_index;
>  	int ret;
>  
>  	/* Ensure that q->num_buffers+num_buffers is below q->max_allowed_buffers */
>  	num_buffers = min_t(unsigned int, num_buffers,
> -			    q->max_allowed_buffers - q->num_buffers);
> +			    q->max_allowed_buffers - vb2_get_num_buffers(q));
> +
> +	first_index = vb2_get_num_buffers(q);
> +
> +	if (first_index >= q->max_allowed_buffers)
> +		return 0;
> +
> +	*first = first_index;
>  
>  	for (buffer = 0; buffer < num_buffers; ++buffer) {
>  		/* Allocate vb2 buffer structures */
> @@ -472,7 +481,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		}
>  		call_void_bufop(q, init_buffer, vb);
>  
> -		if (!vb2_queue_add_buffer(q, vb, q->num_buffers + buffer)) {
> +		if (!vb2_queue_add_buffer(q, vb, first_index++)) {
>  			dprintk(q, 1, "failed adding buffer %d to queue\n", buffer);
>  			kfree(vb);
>  			break;
> @@ -832,7 +841,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> -	unsigned int i;
> +	unsigned int i, first;
>  	int ret = 0;
>  
>  	if (q->streaming) {
> @@ -919,7 +928,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  
>  	/* Finally, allocate buffers and video memory */
>  	allocated_buffers =
> -		__vb2_queue_alloc(q, memory, num_buffers, num_planes, plane_sizes);
> +		__vb2_queue_alloc(q, memory, num_buffers, num_planes, plane_sizes, &first);
>  	if (allocated_buffers == 0) {
>  		dprintk(q, 1, "memory allocation failed\n");
>  		ret = -ENOMEM;
> @@ -993,7 +1002,8 @@ EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			 unsigned int flags, unsigned int *count,
>  			 unsigned int requested_planes,
> -			 const unsigned int requested_sizes[])
> +			 const unsigned int requested_sizes[],
> +			 unsigned int *first)
>  {
>  	unsigned int num_planes = 0, num_buffers, allocated_buffers;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> @@ -1055,7 +1065,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  
>  	/* Finally, allocate buffers and video memory */
>  	allocated_buffers = __vb2_queue_alloc(q, memory, num_buffers,
> -				num_planes, plane_sizes);
> +				num_planes, plane_sizes, first);
>  	if (allocated_buffers == 0) {
>  		dprintk(q, 1, "memory allocation failed\n");
>  		ret = -ENOMEM;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 3eb707abc26b..a88abcea2921 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -762,7 +762,6 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  
>  	fill_buf_caps(q, &create->capabilities);
>  	validate_memory_flags(q, create->memory, &create->flags);
> -	create->index = q->num_buffers;
>  	if (create->count == 0)
>  		return ret != -EBUSY ? ret : 0;
>  
> @@ -804,11 +803,16 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	for (i = 0; i < requested_planes; i++)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
> -	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> -						create->flags,
> -						&create->count,
> -						requested_planes,
> -						requested_sizes);
> +	if (ret)
> +		return ret;
> +
> +	ret = vb2_core_create_bufs(q, create->memory,
> +				   create->flags,
> +				   &create->count,
> +				   requested_planes,
> +				   requested_sizes,
> +				   &create->index);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(vb2_create_bufs);
>  
> @@ -1036,7 +1040,6 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>  	int res = vb2_verify_memory_type(vdev->queue, p->memory,
>  			p->format.type);
>  
> -	p->index = vdev->queue->num_buffers;
>  	fill_buf_caps(vdev->queue, &p->capabilities);
>  	validate_memory_flags(vdev->queue, p->memory, &p->flags);
>  	/*
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 1ecaf4b5a76f..19c93d8eb7c8 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -803,6 +803,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   * @count: requested buffer count.
>   * @requested_planes: number of planes requested.
>   * @requested_sizes: array with the size of the planes.
> + * @first: index of the first created buffer
>   *
>   * Videobuf2 core helper to implement VIDIOC_CREATE_BUFS() operation. It is
>   * called internally by VB2 by an API-specific handler, like
> @@ -819,7 +820,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			 unsigned int flags, unsigned int *count,
>  			 unsigned int requested_planes,
> -			 const unsigned int requested_sizes[]);
> +			 const unsigned int requested_sizes[],
> +			 unsigned int *first);
>  
>  /**
>   * vb2_core_prepare_buf() - Pass ownership of a buffer from userspace


