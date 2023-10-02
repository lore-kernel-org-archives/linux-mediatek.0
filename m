Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3453AE7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFoOQOQj/kS91nbJ++4pssJTF+gE9T/bwW3FqGDAU9I=; b=yCL/K8ADsxWzBHqrmFLzGWXOcZ
	J4ZKpRvD2rhan305DvqlsmzitkFfbrRy1YXvXwagcEdLeZxZYWQfNJztTf9X3L0eIgqiWD+Wc4KST
	xw9e34c/VYrsx7D3u7BP78djM/HQCWuf6eKb3uOYsGjjKeN+cWi/9itbPTckIFYt5YoA9EAmVla+3
	ieWJh8XnB5ahI7HLLl6kdXg1y2LGcKcDkqST+8ZA3ZI8s2C0CGrB/Y2Wze5t3U51vAuLjNmKX7ZwL
	lLADMUY5WApDDV0+hG0ONJZDSvrs8KCz59bHaL4IiNJpaTM+BX6vTvzyiMoUjQwAMXrn0tuWppeFN
	jeR/br2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJ7X-00CnQF-06;
	Mon, 02 Oct 2023 13:37:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJ7T-00CnOE-0p;
	Mon, 02 Oct 2023 13:37:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A6CB3B80D44;
	Mon,  2 Oct 2023 13:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F63BC433C7;
	Mon,  2 Oct 2023 13:37:49 +0000 (UTC)
Message-ID: <cf73025e-0bb0-44c2-9ab3-e426c09bebd8@xs4all.nl>
Date: Mon, 2 Oct 2023 15:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/53] media: Report the maximum possible number of
 buffers for the queue
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
 <20230927153558.159278-14-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230927153558.159278-14-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_063755_560941_A0A91622 
X-CRM114-Status: GOOD (  23.76  )
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

On 27/09/2023 17:35, Benjamin Gaignard wrote:
> Use one of the struct v4l2_create_buffers reserved bytes to report
> the maximum possible number of buffers for the queue.
> V4l2 framework set V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS flags in queue
> capabilities so userland can know when the field is valid.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../userspace-api/media/v4l/vidioc-create-bufs.rst       | 8 ++++++--
>  Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst | 1 +
>  drivers/media/common/videobuf2/videobuf2-v4l2.c          | 9 +++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c                     | 4 ++--
>  include/uapi/linux/videodev2.h                           | 7 ++++++-
>  5 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> index a048a9f6b7b6..1a46549e7462 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> @@ -116,9 +116,13 @@ than the number requested.
>        - ``flags``
>        - Specifies additional buffer management attributes.
>  	See :ref:`memory-flags`.
> -
>      * - __u32
> -      - ``reserved``\ [6]
> +      - ``max_buffers``
> +      - If V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS capability flag is set
> +        this field indicate the maximum possible number of buffers
> +        for this queue.
> +    * - __u32
> +      - ``reserved``\ [5]
>        - A place holder for future extensions. Drivers and applications
>  	must set the array to zero.
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index 099fa6695167..0395187e1a5a 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -120,6 +120,7 @@ aborting or finishing any DMA in progress, an implicit
>  .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
>  .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
>  .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
> +.. _V4L2-BUF-CAP-SUPPORTS-SET-MAX-BUFS:
>  
>  .. raw:: latex
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 278ea1107b01..655133f1ae2b 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -686,6 +686,7 @@ EXPORT_SYMBOL(vb2_querybuf);
>  static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  {
>  	*caps = V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
> +	*caps |= V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS;
>  	if (q->io_modes & VB2_MMAP)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP;
>  	if (q->io_modes & VB2_USERPTR)
> @@ -767,9 +768,13 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  
>  	fill_buf_caps(q, &create->capabilities);
>  	validate_memory_flags(q, create->memory, &create->flags);
> -	create->index = q->num_buffers;
> -	if (create->count == 0)
> +
> +	create->max_buffers = q->max_num_buffers;
> +
> +	if (create->count == 0) {
> +		create->index = vb2_get_num_buffers(q);

This breaks git bisect: this function isn't introduced until patch 21/53.

Note: with the build scripts you can just run it with:

./build.sh -patches 53 ...

and it will apply each patch in sequence and attempt to compile it.

Regards,

	Hans

>  		return ret != -EBUSY ? ret : 0;
> +	}
>  
>  	switch (f->type) {
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index f4d9d6279094..700db197e371 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -483,9 +483,9 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
>  {
>  	const struct v4l2_create_buffers *p = arg;
>  
> -	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, ",
> +	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, max buffers=%u",
>  		p->index, p->count, prt_names(p->memory, v4l2_memory_names),
> -		p->capabilities);
> +		p->capabilities, p->max_buffers);
>  	v4l_print_format(&p->format, write_only);
>  }
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 78260e5d9985..b0dbb1be728c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1034,6 +1034,7 @@ struct v4l2_requestbuffers {
>  #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
>  #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
>  #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
> +#define V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS		(1 << 7)
>  
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers
> @@ -2604,6 +2605,9 @@ struct v4l2_dbg_chip_info {
>   * @flags:	additional buffer management attributes (ignored unless the
>   *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
>   *		and configured for MMAP streaming I/O).
> + * @max_buffers: if V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS capability flag is set
> + *		 this field indicate the maximum possible number of buffers
> + *		 for this queue.
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers {
> @@ -2613,7 +2617,8 @@ struct v4l2_create_buffers {
>  	struct v4l2_format	format;
>  	__u32			capabilities;
>  	__u32			flags;
> -	__u32			reserved[6];
> +	__u32			max_buffers;
> +	__u32			reserved[5];
>  };
>  
>  /*


