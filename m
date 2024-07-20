Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8450FC3DA59
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jul 2024 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R9sTv8fa+ZUZh5Yi/POfZ/Vc3MZ39LdwuNwaJkGWew=; b=3MY8BNVKGUI4zvp5sFgldl2f4H
	r6bGx4TsiwfvxEunNqZlMMk5Z+zE0xkhNZ4w/B69XAIAW0OlOXYEya1aVWRY9OQc+rAlxDtHkqi1b
	Ak7ldiXdrLpstoLqECL4HA2Ym2PE08iEAkvnX2HUVR2MKDr5fIA3ZZ+vJbyeMpK/UqGbksjMijoAJ
	bq2R125hLBggzfnRvcG1G3FcEYcTjGpzvPYn1O+8Y9WQiAzuT2Qz6wnKpdR2gOU62QhbXBSZ12dO3
	cqDA8wWX0DsVAUXNPDS2t6o8YhkLEqu2IziOw5eiZ42y2sICp1zt9G75DzAHAYZR5YNCtl9SocCGQ
	P7KxPCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV6n9-00000004s3s-0JK5;
	Sat, 20 Jul 2024 09:54:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV6mk-00000004ryq-3Lsz;
	Sat, 20 Jul 2024 09:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7709FCE0170;
	Sat, 20 Jul 2024 09:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29CAC2BD10;
	Sat, 20 Jul 2024 09:53:39 +0000 (UTC)
Message-ID: <a6a7a9c8-7406-4e69-a5cf-08cf06c7793d@xs4all.nl>
Date: Sat, 20 Jul 2024 11:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/28] v4l2: handle restricted memory flags in queue
 setup
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
 <20240720071606.27930-3-yunfei.dong@mediatek.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240720071606.27930-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_025351_233982_E5DE9963 
X-CRM114-Status: GOOD (  30.91  )
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

On 20/07/2024 09:15, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Validates the restricted memory flags when setting up a queue and
> ensures the queue has the proper capability.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [Yunfei: Change reviewer's comments]
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 29 +++++++++++++++++++
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 0217392fcc0d..44080121f37e 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -830,6 +830,23 @@ static bool verify_coherency_flags(struct vb2_queue *q, bool non_coherent_mem)
>  	return true;
>  }
>  
> +static bool verify_restricted_mem_flags(struct vb2_queue *q, bool restricted_mem)
> +{
> +	if (restricted_mem != q->restricted_mem) {
> +		dprintk(q, 1, "restricted memory model mismatch\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static inline int restricted_mem_mismatch(bool restricted_mem, struct vb2_queue *q,
> +					  enum vb2_memory memory)
> +{
> +	return restricted_mem && (!q->allow_restricted_mem || memory != VB2_MEMORY_DMABUF) ?
> +	       -1 : 0;
> +}
> +
>  static int vb2_core_allocated_buffers_storage(struct vb2_queue *q)
>  {
>  	if (!q->bufs)
> @@ -863,6 +880,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> +	bool restricted_mem = flags & V4L2_MEMORY_FLAG_RESTRICTED;
>  	unsigned int i, first_index;
>  	int ret = 0;
>  
> @@ -906,6 +924,9 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  			return 0;
>  	}
>  
> +	if (restricted_mem_mismatch(restricted_mem, q, memory))
> +		return -EINVAL;
> +
>  	/*
>  	 * Make sure the requested values and current defaults are sane.
>  	 */
> @@ -923,6 +944,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	if (ret)
>  		return ret;
>  	set_queue_coherency(q, non_coherent_mem);
> +	q->restricted_mem = restricted_mem;
>  
>  	/*
>  	 * Ask the driver how many buffers and planes per buffer it requires.
> @@ -1031,6 +1053,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
>  	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +	bool restricted_mem = flags & V4L2_MEMORY_FLAG_RESTRICTED;
>  	bool no_previous_buffers = !q_num_bufs;
>  	int ret = 0;
>  
> @@ -1039,6 +1062,9 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		return -ENOBUFS;
>  	}
>  
> +	if (restricted_mem_mismatch(restricted_mem, q, memory))
> +		return -EINVAL;
> +
>  	if (no_previous_buffers) {
>  		if (q->waiting_in_dqbuf && *count) {
>  			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
> @@ -1057,6 +1083,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			return ret;
>  		q->waiting_for_buffers = !q->is_output;
>  		set_queue_coherency(q, non_coherent_mem);
> +		q->restricted_mem = restricted_mem;
>  	} else {
>  		if (q->memory != memory) {
>  			dprintk(q, 1, "memory model mismatch\n");
> @@ -1064,6 +1091,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		}
>  		if (!verify_coherency_flags(q, non_coherent_mem))
>  			return -EINVAL;
> +		if (!verify_restricted_mem_flags(q, restricted_mem))
> +			return -EINVAL;
>  	}
>  
>  	num_buffers = min(*count, q->max_num_buffers - q_num_bufs);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 293f3d5f1c4e..9ee24e537e0c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -682,7 +682,7 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>  		*flags = 0;

Hmm, unless I am mistaken, this clears all flags. So if memory is DMABUF, then
the V4L2_MEMORY_FLAG_RESTRICTED is just overwritten with 0. And that's what will
be passed to vb2_core_reqbufs.

So how can this work? I'm not sure how you can have tested this.

In any case, this function should change and do this instead:

        /* Clear all unknown flags. */
         *flags &= V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_RESTRICTED;

        if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP)
		*flags &= ~V4L2_MEMORY_FLAG_NON_COHERENT;

I considered whether V4L2_MEMORY_FLAG_RESTRICTED should be cleared if memory
wasn't DMABUF, but I don't think that is right: you want to see an error
returned if you try such a combination.

>  	} else {
>  		/* Clear all unknown flags. */
> -		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
> +		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_RESTRICTED;
>  	}
>  
>  	*caps |= V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
> @@ -698,6 +698,8 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> +	if (q->allow_restricted_mem && q->io_modes & VB2_DMABUF)
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM;
>  	if (max_num_bufs) {
>  		*max_num_bufs = q->max_num_buffers;
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;

What appears to be missing in this patch is what happens if you pass unrestricted
memory to a queue that is configured for restricted memory: there does not appear
to be a check for that. Or is that allowed? If so, that should be documented.

And what happens if you pass a dmabuf for restricted memory to a queue that expects
unrestricted memory? You want to get a nice error code for that (EACCES/EPERM, I
never quite know which is the right one for that). That would apply to VIDIOC_QBUF
and VIDIOC_PREPARE_BUF. This assumes you can easily query a dmabuf fd to see whether
it is in restricted memory or not. I'm not sure if that is the case today.

I also think that it would be useful to add a V4L2_BUF_FLAG_RESTRICTED_MEM flag
that vb2 will return to userspace if the queue is configured for restricted memory.

That will indicate to the application that the buffer indeed represents a buffer
in restricted memory.

Regards,

	Hans

