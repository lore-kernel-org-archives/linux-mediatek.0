Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F81DC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRaB+d91Uu6xiAKEYbnjI1nP1SW5PnoIztJ/4Xz4pDQ=; b=dMpG22LRm6DnHZjhoSzawi607X
	DcIH7iFV/qf4vlB98AHgvDGTw2BKDYtPoW/7MMIBefuO8ELFAZu1fPrmSvEIgkmAzpDWooYt5EWWc
	SFFkAQf+NcDYqS5AulZg6oLGHmja2JKWWD5gluxZmeqv8d3/TWnnscR5x9vjxZxoGaiUZCRWkiTmm
	AbfHIzdrgiiEnDhd3Q5NNUv4v00lVa4byfGmgrQ6Wes/TVYwBRVt9VhaXWxzla/xj0ehwsQ1b9ihd
	dH9HzKYN1EFwXCnC1aLIFNCWik7QzVFze7ysp903k8AjkTWVWk0r/xbhT4YnsUot8KY0+aqhPXk2V
	z8lBkogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdnW-004des-1j;
	Mon, 11 Dec 2023 10:46:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCdnL-004daN-2i;
	Mon, 11 Dec 2023 10:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA2C0611A8;
	Mon, 11 Dec 2023 10:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FB5C433C7;
	Mon, 11 Dec 2023 10:45:45 +0000 (UTC)
Message-ID: <797a2cbd-ab84-47ec-99b0-23c392f343e1@xs4all.nl>
Date: Mon, 11 Dec 2023 11:45:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3,02/21] v4l2: handle secure memory flags in queue setup
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
 <20231206081538.17056-3-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231206081538.17056-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_024551_971469_A7E73C31 
X-CRM114-Status: GOOD (  29.92  )
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

Hi Yunfei, Jeffrey,

Some comments below:

On 06/12/2023 09:15, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Validates the secure memory flags when setting up a queue and ensures
> the queue has the proper capability.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 34 +++++++++++++------
>  2 files changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 8c1df829745b..09dc030484be 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -813,6 +813,15 @@ static bool verify_coherency_flags(struct vb2_queue *q, bool non_coherent_mem)
>  	return true;
>  }
>  
> +static bool verify_secure_mem_flags(struct vb2_queue *q, bool secure_mem)
> +{
> +	if (secure_mem != q->secure_mem) {
> +		dprintk(q, 1, "secure memory model mismatch\n");
> +		return false;
> +	}
> +	return true;
> +}
> +
>  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  		     unsigned int flags, unsigned int *count)
>  {
> @@ -820,6 +829,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> +	bool secure_mem = flags & V4L2_MEMORY_FLAG_SECURE;
>  	unsigned int i;
>  	int ret = 0;
>  
> @@ -836,6 +846,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	if (*count == 0 || q_num_bufs != 0 ||
>  	    (q->memory != VB2_MEMORY_UNKNOWN && q->memory != memory) ||
>  	    !verify_coherency_flags(q, non_coherent_mem)) {
> +		bool no_previous_buffers = !q->num_buffers;
> +
>  		/*
>  		 * We already have buffers allocated, so first check if they
>  		 * are not in use and can be freed.
> @@ -854,6 +866,12 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  		__vb2_queue_free(q, q_num_bufs);
>  		mutex_unlock(&q->mmap_lock);
>  
> +		/*
> +		 * Do not allow switching secure buffer mode.
> +		 */
> +		if (!no_previous_buffers && !verify_secure_mem_flags(q, secure_mem))
> +			return -EINVAL;
> +

Why is this needed? Here VIDIOC_REQBUFS is called either to just delete
all existing buffers (count == 0), or to delete all existing buffers and
allocate new buffers (count > 0).

Since in both cases all existing buffers are deleted, you are free to choose
whatever new secure mode you want.

>  		/*
>  		 * In case of REQBUFS(0) return immediately without calling
>  		 * driver's queue_setup() callback and allocating resources.
> @@ -882,6 +900,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	if (ret)
>  		return ret;
>  	set_queue_coherency(q, non_coherent_mem);
> +	q->secure_mem = secure_mem;
>  
>  	/*
>  	 * Ask the driver how many buffers and planes per buffer it requires.
> @@ -986,6 +1005,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
>  	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +	bool secure_mem = flags & V4L2_MEMORY_FLAG_SECURE;
>  	bool no_previous_buffers = !q_num_bufs;
>  	int ret = 0;
>  
> @@ -1015,6 +1035,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			return ret;
>  		q->waiting_for_buffers = !q->is_output;
>  		set_queue_coherency(q, non_coherent_mem);
> +		q->secure_mem = secure_mem;
>  	} else {
>  		if (q->memory != memory) {
>  			dprintk(q, 1, "memory model mismatch\n");
> @@ -1022,6 +1043,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		}
>  		if (!verify_coherency_flags(q, non_coherent_mem))
>  			return -EINVAL;
> +		if (!verify_secure_mem_flags(q, secure_mem))
> +			return -EINVAL;
>  	}
>  
>  	num_buffers = min(*count, q->max_num_buffers - q_num_bufs);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 54d572c3b515..0a530830276c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -686,22 +686,30 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> +	if (q->allow_secure_mem && q->io_modes & VB2_DMABUF)
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_SECURE_MEM;
>  }
>  
> -static void validate_memory_flags(struct vb2_queue *q,
> +static bool validate_memory_flags(struct vb2_queue *q,
>  				  int memory,
>  				  u32 *flags)
>  {
> +	if (*flags & V4L2_MEMORY_FLAG_SECURE &&
> +	    (!q->allow_secure_mem || memory != V4L2_MEMORY_DMABUF)) {
> +		return false;
> +	}
> +

This check belongs to videobuf2-core.c and the check should be done
in vb2_core_reqbufs and vb2_core_create_bufs.

So just leave this function as a void.

>  	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
>  		/*
> -		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
> -		 * but in order to avoid bugs we zero out all bits.
> +		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only.

Just drop this as well since it adds no useful information anymore.

>  		 */
> -		*flags = 0;
> -	} else {
> -		/* Clear all unknown flags. */
> -		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
> +		*flags &= ~V4L2_MEMORY_FLAG_NON_COHERENT;
>  	}
> +
> +	/* Clear all unknown flags. */
> +	*flags &= V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_SECURE;

This is still needed here.

> +
> +	return true;
>  }
>  

So the following changes from here...

>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
> @@ -710,7 +718,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  	u32 flags = req->flags;
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	validate_memory_flags(q, req->memory, &flags);
> +	if (!validate_memory_flags(q, req->memory, &flags))
> +		return -EINVAL;
>  	req->flags = flags;
>  	return ret ? ret : vb2_core_reqbufs(q, req->memory,
>  					    req->flags, &req->count);
> @@ -752,7 +761,8 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	unsigned i;
>  
>  	fill_buf_caps(q, &create->capabilities);
> -	validate_memory_flags(q, create->memory, &create->flags);
> +	if (!validate_memory_flags(q, create->memory, &create->flags))
> +		return -EINVAL;
>  	create->index = vb2_get_num_buffers(q);
>  	create->max_num_buffers = q->max_num_buffers;
>  	create->capabilities |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
> @@ -1007,7 +1017,8 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  	u32 flags = p->flags;
>  
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> -	validate_memory_flags(vdev->queue, p->memory, &flags);
> +	if (!validate_memory_flags(vdev->queue, p->memory, &flags))
> +		return -EINVAL;
>  	p->flags = flags;
>  	if (res)
>  		return res;
> @@ -1031,7 +1042,8 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>  
>  	p->index = vdev->queue->num_buffers;
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> -	validate_memory_flags(vdev->queue, p->memory, &p->flags);
> +	if (!validate_memory_flags(vdev->queue, p->memory, &p->flags))
> +		return -EINVAL;
>  	/*
>  	 * If count == 0, then just check if memory and type are valid.
>  	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.

...to the end should all be dropped since the vb2 core will do the checks.

Regards,

	Hans

