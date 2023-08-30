Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40614C83F01
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPzazxE4kU5k//9ZcNlYNg754/qN4kaoUkzlKxdqu3U=; b=Gl73Zw7yA9cTNLfbfg3TwWs8vP
	XqILl4X8PluiU62L08/v6acY7+beWL2LuYDfLz3V55y8VPNmExlzuoMFpDouxTIaVcBUxLuESeKv5
	7L2zoauo7pdFUatlIW8h/t/1s2Cr0BRJK+wa2ZQb0HB+RVAJhxVmUTZU7Oc5Vv+6nnLYeqLa9TlfW
	3W6+kEO9GkdfcK5+TDZyt9F7pzCxrfXe47GnyZVrNqL47RE7NJOSnxc9c730f7q5gIXXjkUlCX9eu
	utbaT2TOaI+MpB9gW65YWIMtEoWNhhUX/uRhWm50EQAJP6TBAFkML4t5YIRXjnZ3GTXKt2EHiJJEh
	7G/SAq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbKG8-00DT5n-0B;
	Wed, 30 Aug 2023 12:25:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbKG4-00DT4T-0J;
	Wed, 30 Aug 2023 12:25:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BBBA3623F0;
	Wed, 30 Aug 2023 12:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0634BC433C8;
	Wed, 30 Aug 2023 12:25:10 +0000 (UTC)
Message-ID: <01c299f2-8118-5d86-e9b6-a459c1b6c467@xs4all.nl>
Date: Wed, 30 Aug 2023 14:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 01/10] media: videobuf2: Rework offset 'cookie'
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
References: <20230824092133.39510-1-benjamin.gaignard@collabora.com>
 <20230824092133.39510-2-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230824092133.39510-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_052516_241448_C3E74057 
X-CRM114-Status: GOOD (  30.17  )
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

On 24/08/2023 11:21, Benjamin Gaignard wrote:
> Change how offset 'cookie' field value is computed to make possible
> to use more buffers (up to 0xffff).
> With this encoding pattern we know the maximum number that a queue
> could store so we can check ing at queue init time.
> It also make easier and faster to find buffer and plane from using
> the offset field.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> v5:
> - I haven't change DST_QUEUE_OFF_BASE definition because it used in
>   v4l2-mem2mem and s5p_mfc driver with a shift.
> 
>  .../media/common/videobuf2/videobuf2-core.c   | 48 +++++++++----------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index cf6727d9c81f..e06905533ef4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -31,6 +31,10 @@
>  
>  #include <trace/events/vb2.h>
>  
> +#define PLANE_INDEX_SHIFT	3
> +#define PLANE_INDEX_MASK	0x7
> +#define MAX_BUFFERS		0xffff

Very poor name, see below.

> +
>  static int debug;
>  module_param(debug, int, 0644);
>  
> @@ -358,21 +362,23 @@ static void __setup_offsets(struct vb2_buffer *vb)
>  	unsigned int plane;
>  	unsigned long off = 0;
>  
> -	if (vb->index) {
> -		struct vb2_buffer *prev = q->bufs[vb->index - 1];
> -		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
> -
> -		off = PAGE_ALIGN(p->m.offset + p->length);
> -	}
> +	/*
> +	 * Offsets cookies value have the following constraints:
> +	 * - a buffer could have up to 8 planes.
> +	 * - v4l2 mem2mem use bit 30 to distinguish between source and destination buffers.
> +	 * - must be page aligned
> +	 * That led to this bit mapping:
> +	 * |30                |29        15|14       12|11 0|
> +	 * |DST_QUEUE_OFF_BASE|buffer index|plane index| 0  |
> +	 * where there is 16 bits to store buffer index.

16 -> 15: there are 15 (not 16!) bits available for buffer indices. So the maximum
number of buffers is 32768, given that the indices start at 0.

> +	 */
> +	off = vb->index << (PLANE_INDEX_SHIFT + PAGE_SHIFT);
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
> @@ -2209,21 +2215,15 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
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
> +	buffer = (off >> (PLANE_INDEX_SHIFT + PAGE_SHIFT)) & MAX_BUFFERS;

Hmm, you use it as a mask. The name MAX_BUFFERS is really confusing.
How about BUFFER_INDEX_MASK? That is consistent with PLANE_INDEX_MASK.

> +	plane = (off >> PAGE_SHIFT) & PLANE_INDEX_MASK;
>  
> -		for (plane = 0; plane < vb->num_planes; ++plane) {
> -			if (vb->planes[plane].m.offset == off) {
> -				*_buffer = buffer;
> -				*_plane = plane;
> -				return 0;
> -			}
> -		}
> +	vb = q->bufs[buffer];
> +	if (vb->planes[plane].m.offset == off) {
> +		*_buffer = buffer;
> +		*_plane = plane;
> +		return 0;
>  	}
>  
>  	return -EINVAL;

Regards,

	Hans

