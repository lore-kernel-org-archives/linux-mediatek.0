Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EE8CD5BCD
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqP7OBH1haGTtngDbec8qbqnxOUVouPxLTIBODBKMuo=; b=1TTwSIpemg6Mx6ix8pJVH+Sjq7
	lmw7zg9zizajl2f7FU2lSAaZwmd1K5Ku4vJgkgR4RcHlZ/uZ8SDgLXM9p1M+XG2h5M8ykdbsKSTX7
	RxXtJK/OxSq2giK1x7XqS12LlvDp/e97HLFZ5UBXVte6D9tjIJ9E8rBjGWSR8gp6InXMQw6vhIZ4U
	7pEviU1vBZqoI8fLpGJmFclzMfDusF6tNHlNJ/awkNVz8JvU7/OLgBtuC+5EuptCih3GNgk+NzCvT
	z8z48LmfwFgfk2VD488YkkT6618b3V4mYK8kPxQ06uqW1LWUWvyccMddJYuAWa7Zr2gj7JcG0PKmI
	LY4/COxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qicMN-000jVe-1k;
	Tue, 19 Sep 2023 15:09:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qicMJ-000jUb-1s;
	Tue, 19 Sep 2023 15:09:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8C09FCE1358;
	Tue, 19 Sep 2023 15:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634C8C433C8;
	Tue, 19 Sep 2023 15:09:44 +0000 (UTC)
Message-ID: <7a437626-f3f1-4828-9852-8332b02f7a34@xs4all.nl>
Date: Tue, 19 Sep 2023 17:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 46/49] media: core: Free range of buffers
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
 <20230914133323.198857-47-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-47-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_080951_972482_82AFC71B 
X-CRM114-Status: GOOD (  22.72  )
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

On 14/09/2023 15:33, Benjamin Gaignard wrote:
> Improve __vb2_queue_free() and __vb2_free_mem() to free
> range of buffers and not only the last few buffers.
> Intoduce starting index to be flexible on range and change the loops
> according to this parameters.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 30 +++++++++----------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index c5d4a388331b..88cdf4dcb07c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -527,13 +527,12 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  /*
>   * __vb2_free_mem() - release all video buffer memory for a given queue
>   */
> -static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
> +static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int count)
>  {
> -	unsigned int buffer = 0;
> -	long i = q->max_allowed_buffers;
> +	unsigned int i, buffer = 0;
>  	struct vb2_buffer *vb;
>  
> -	for (i = q->max_allowed_buffers; i >= 0 && buffer < buffers; i--) {
> +	for (i = start; i < q->max_allowed_buffers && buffer < count; i++) {
>  		vb = vb2_get_buffer(q, i);
>  		if (!vb)
>  			continue;

Isn't there a 'buffer++' missing here?

> @@ -550,19 +549,18 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
>  }
>  
>  /*
> - * __vb2_queue_free() - free buffers at the end of the queue - video memory and
> + * __vb2_queue_free() - free count buffers from start index of the queue - video memory and
>   * related information, if no buffers are left return the queue to an
>   * uninitialized state. Might be called even if the queue has already been freed.
>   */
> -static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
> +static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned int count)
>  {
> -	unsigned int buffer;
> -	long i = q->max_allowed_buffers;
> +	unsigned int i, buffer;
>  
>  	lockdep_assert_held(&q->mmap_lock);
>  
>  	/* Call driver-provided cleanup function for each buffer, if provided */
> -	for (i = q->max_allowed_buffers, buffer = 0; i >= 0 && buffer < buffers; i--) {
> +	for (i = start, buffer = 0; i < q->max_allowed_buffers && buffer < count; i++) {
>  		struct vb2_buffer *vb = vb2_get_buffer(q, i);
>  
>  		if (!vb)

Same issue, 'buffer' is never incremented.

> @@ -574,7 +572,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>  	}
>  
>  	/* Release video buffer memory */
> -	__vb2_free_mem(q, buffers);
> +	__vb2_free_mem(q, start, count);
>  
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>  	/*
> @@ -659,8 +657,8 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>  #endif
>  
>  	/* Free vb2 buffers */
> -	for (i = q->max_allowed_buffers, buffer = 0; i > 0 && buffer < buffers; i--) {
> -		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
> +	for (i = start, buffer = 0; i < q->max_allowed_buffers && buffer < count; i++) {
> +		struct vb2_buffer *vb = vb2_get_buffer(q, i);
>  
>  		if (!vb)
>  			continue;

Ditto.

> @@ -884,7 +882,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  		 * queued without ever calling STREAMON.
>  		 */
>  		__vb2_queue_cancel(q);
> -		__vb2_queue_free(q, q_num_bufs);
> +		__vb2_queue_free(q, 0, q_num_bufs);
>  		mutex_unlock(&q->mmap_lock);
>  
>  		/*
> @@ -995,7 +993,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  		 * from already queued buffers and it will reset q->memory to
>  		 * VB2_MEMORY_UNKNOWN.
>  		 */
> -		__vb2_queue_free(q, allocated_buffers);
> +		__vb2_queue_free(q, 0, allocated_buffers);

Shouldn't we use 'first_index' here instead of '0'?

>  		mutex_unlock(&q->mmap_lock);
>  		return ret;
>  	}
> @@ -1135,7 +1133,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		 * from already queued buffers and it will reset q->memory to
>  		 * VB2_MEMORY_UNKNOWN.
>  		 */
> -		__vb2_queue_free(q, allocated_buffers);
> +		__vb2_queue_free(q, 0, allocated_buffers);

Ditto.

>  		mutex_unlock(&q->mmap_lock);
>  		return -ENOMEM;
>  	}
> @@ -2617,7 +2615,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
>  	__vb2_cleanup_fileio(q);
>  	__vb2_queue_cancel(q);
>  	mutex_lock(&q->mmap_lock);
> -	__vb2_queue_free(q, q->max_allowed_buffers);
> +	__vb2_queue_free(q, 0, q->max_allowed_buffers);
>  	kfree(q->bufs);
>  	q->bufs = NULL;
>  	bitmap_free(q->bufs_map);

Regards,

	Hans

