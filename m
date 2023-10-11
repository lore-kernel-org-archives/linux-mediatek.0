Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802CECD98FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 08:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2363xDvr9RMdOnD46JMR1qKEQjeBzOOXpBpbNdU3ZA=; b=QL1ySfbGLPkJfBKBO412h98Fyz
	LvycBp1plxE4y8kCHsazDPKi2FUrzS/8pMi1Mm7E9MFUavDGoQQk8oiowJr8elJ3IdXUxmcqRXwQi
	Id8uNYAo3uwBmFKCaGG4FUT6P/+IgfzACrgEsl+CpWA9S0g3325Fo/V/WDf3G1rki6jWNKfUkuyNk
	bT/gK5jXJwlsP1OdSUU1jnb+0SeJQF1UU19Jv42ezBuqsVLnCCx9XWQoBEJIlGPeak5bTuhBbX17c
	aWF1YkBbvkPwmuZKmd1ApHxmzE7hvri+uDXBVbwWBeIeGLi+BY35MDl9NoXjd5EJDdAl4f9iSN+XF
	PSUp2oUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUCy-00FBjy-0m;
	Wed, 11 Oct 2023 08:04:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUCt-00FBhC-27;
	Wed, 11 Oct 2023 08:04:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CE724CE0CF3;
	Wed, 11 Oct 2023 08:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E60C433C7;
	Wed, 11 Oct 2023 08:04:32 +0000 (UTC)
Message-ID: <905d78f8-26a2-4229-8892-38d7cf24e39c@xs4all.nl>
Date: Wed, 11 Oct 2023 10:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/54] media: videobuf2: Rework offset 'cookie'
 encoding pattern
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
 <20231003080704.43911-2-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231003080704.43911-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_010440_031468_B0F0B543 
X-CRM114-Status: GOOD (  36.09  )
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

On 03/10/2023 10:06, Benjamin Gaignard wrote:
> Change how offset 'cookie' field value is computed to make possible
> to use more buffers.
> The maximum number of buffers depends of PAGE_SHIFT value and can
> go up to 0x7fff when PAGE_SHIFT = 12.
> With this encoding pattern we know the maximum number that a queue
> could store so we can check it at  queue init time.
> It also make easier and faster to find buffer and plane from using
> the offset field.
> Change __find_plane_by_offset() prototype to return the video buffer
> itself rather than it index.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 10:
> - Make BUFFER_INDEX_MASK definition more readable.
> - Correct typo.
> 
>  .../media/common/videobuf2/videobuf2-core.c   | 72 +++++++++----------
>  1 file changed, 33 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 27aee92f3eea..5591ac830668 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -31,6 +31,11 @@
>  
>  #include <trace/events/vb2.h>
>  
> +#define PLANE_INDEX_SHIFT	(PAGE_SHIFT + 3)
> +#define PLANE_INDEX_MASK	0x7
> +#define MAX_BUFFER_INDEX	BIT_MASK(30 - PLANE_INDEX_SHIFT)
> +#define BUFFER_INDEX_MASK	(MAX_BUFFER_INDEX - 1)
> +
>  static int debug;
>  module_param(debug, int, 0644);
>  
> @@ -358,21 +363,24 @@ static void __setup_offsets(struct vb2_buffer *vb)
>  	unsigned int plane;
>  	unsigned long off = 0;

This is a rather ugly name. I suggest renaming this to "offset" to avoid
confusion with "on"/"off". See additional comments on this below.

>  
> -	if (vb->index) {
> -		struct vb2_buffer *prev = q->bufs[vb->index - 1];
> -		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
> -
> -		off = PAGE_ALIGN(p->m.offset + p->length);
> -	}
> +	/*
> +	 * Offsets cookies value have the following constraints:

I'd rephrase this a little bit:

	 * The offset "cookie" value has the following constraints:

> +	 * - a buffer can have up to 8 planes.
> +	 * - v4l2 mem2mem uses bit 30 to distinguish between source and destination buffers.

Related to Sakari's comments: the mem2mem framework uses source and destination
a lot, but vb2 is mostly OUTPUT/CAPTURE. So it is best to mention both:

source -> OUTPUT (aka "source", bit 30 is 0)
destination -> CAPTURE (aka "destination", bit 30 is 1)

> +	 * - must be page aligned
> +	 * That led to this bit mapping when PAGE_SHIFT = 12:
> +	 * |30                |29        15|14       12|11 0|
> +	 * |DST_QUEUE_OFF_BASE|buffer index|plane index| 0  |
> +	 * where there are 15 bits to store the buffer index.
> +	 * Depending on PAGE_SHIFT value we can have fewer bits to store the buffer index.
> +	 */
> +	off = vb->index << PLANE_INDEX_SHIFT;
>  
>  	for (plane = 0; plane < vb->num_planes; ++plane) {
> -		vb->planes[plane].m.offset = off;
> +		vb->planes[plane].m.offset = off + (plane << PAGE_SHIFT);
>  
>  		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
>  				vb->index, plane, off);
> -
> -		off += vb->planes[plane].length;
> -		off = PAGE_ALIGN(off);
>  	}
>  }
>  
> @@ -2185,13 +2193,12 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
>  EXPORT_SYMBOL_GPL(vb2_core_streamoff);
>  
>  /*
> - * __find_plane_by_offset() - find plane associated with the given offset off
> + * __find_plane_by_offset() - find video buffer and plane associated with the given offset off
>   */
>  static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,

Same here: rename "off" to "offset", that also simplifies the comment above:
"with the given offset off" can now just be "with the given offset".

The same change can be done in vb2_mmap and vb2_get_unmapped_area.

I think it would be best if the off -> offset rename is done in a separate initial
patch.

I know that this isn't really DELETE_BUFS related, but I think it makes the code
a bit easier to follow.

> -			unsigned int *_buffer, unsigned int *_plane)
> +			struct vb2_buffer **vb, unsigned int *plane)
>  {
> -	struct vb2_buffer *vb;
> -	unsigned int buffer, plane;
> +	unsigned int buffer;
>  
>  	/*
>  	 * Sanity checks to ensure the lock is held, MEMORY_MMAP is
> @@ -2209,24 +2216,15 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
>  		return -EBUSY;
>  	}
>  
> -	/*
> -	 * Go over all buffers and their planes, comparing the given offset
> -	 * with an offset assigned to each plane. If a match is found,
> -	 * return its buffer and plane numbers.
> -	 */
> -	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
> -		vb = q->bufs[buffer];
> +	/* Get buffer and plane from the offset */
> +	buffer = (off >> PLANE_INDEX_SHIFT) & BUFFER_INDEX_MASK;
> +	*plane = (off >> PAGE_SHIFT) & PLANE_INDEX_MASK;
>  
> -		for (plane = 0; plane < vb->num_planes; ++plane) {
> -			if (vb->planes[plane].m.offset == off) {
> -				*_buffer = buffer;
> -				*_plane = plane;
> -				return 0;
> -			}
> -		}
> -	}
> +	if (buffer >= q->num_buffers || *plane >= q->bufs[buffer]->num_planes)
> +		return -EINVAL;
>  
> -	return -EINVAL;
> +	*vb = q->bufs[buffer];
> +	return 0;
>  }
>  
>  int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> @@ -2306,7 +2304,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  {
>  	unsigned long off = vma->vm_pgoff << PAGE_SHIFT;
>  	struct vb2_buffer *vb;
> -	unsigned int buffer = 0, plane = 0;
> +	unsigned int plane = 0;
>  	int ret;
>  	unsigned long length;
>  
> @@ -2335,12 +2333,10 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	 * Find the plane corresponding to the offset passed by userspace. This
>  	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
>  	 */
> -	ret = __find_plane_by_offset(q, off, &buffer, &plane);
> +	ret = __find_plane_by_offset(q, off, &vb, &plane);
>  	if (ret)
>  		goto unlock;
>  
> -	vb = q->bufs[buffer];
> -
>  	/*
>  	 * MMAP requires page_aligned buffers.
>  	 * The buffer length was page_aligned at __vb2_buf_mem_alloc(),
> @@ -2368,7 +2364,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	if (ret)
>  		return ret;
>  
> -	dprintk(q, 3, "buffer %d, plane %d successfully mapped\n", buffer, plane);
> +	dprintk(q, 3, "buffer %u, plane %d successfully mapped\n", vb->index, plane);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(vb2_mmap);
> @@ -2382,7 +2378,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
>  {
>  	unsigned long off = pgoff << PAGE_SHIFT;
>  	struct vb2_buffer *vb;
> -	unsigned int buffer, plane;
> +	unsigned int plane;
>  	void *vaddr;
>  	int ret;
>  
> @@ -2392,12 +2388,10 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
>  	 * Find the plane corresponding to the offset passed by userspace. This
>  	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
>  	 */
> -	ret = __find_plane_by_offset(q, off, &buffer, &plane);
> +	ret = __find_plane_by_offset(q, off, &vb, &plane);
>  	if (ret)
>  		goto unlock;
>  
> -	vb = q->bufs[buffer];
> -
>  	vaddr = vb2_plane_vaddr(vb, plane);
>  	mutex_unlock(&q->mmap_lock);
>  	return vaddr ? (unsigned long)vaddr : -EINVAL;

Regards,

	Hans

