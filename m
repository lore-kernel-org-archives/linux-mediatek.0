Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9363C3DA49
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jul 2024 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pi+X2g2kJTDKQmnA1Db4zYkGS17i73/InmWu+9v9jSk=; b=LpQ10xM1jABVZuO/+QAPQfGzEz
	EF68nhitG2B2hTO62ITfB3i7OrPBfO6SfWoSVkcC116LSXmds7pDRo4O0Gxgx32p4os9h6A2dgTzf
	vll/CQkqOBZFmYQSgfJbGLn/IiXeLZBX6x24EmvpTMIbNYbRSUfjH4k0V4gH3f/jvarz1ZOEnukYO
	5dpWGguKuQr3Dv3QFrGuIEhtgMbD5jgECT8Man4PpAQsbNDq2E8AJbb/pdvxT42EJIploRS0rJM+e
	3OB7cbZwhI73a8tGBGKMpX14P59kito5c2om6Z4PRuN6QOTfeBGPjrQok8S/uubr4JlxwPxfFzqpp
	qmoK1n9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV6AO-00000004oIs-46Zs;
	Sat, 20 Jul 2024 09:14:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV6A2-00000004oE0-0Jzk;
	Sat, 20 Jul 2024 09:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95B3CCE021E;
	Sat, 20 Jul 2024 09:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2581C2BD10;
	Sat, 20 Jul 2024 09:13:39 +0000 (UTC)
Message-ID: <b09c8cd9-2e1e-48e1-a5c7-db020fc88808@xs4all.nl>
Date: Sat, 20 Jul 2024 11:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/28] v4l2: add restricted memory flags
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
 <20240720071606.27930-2-yunfei.dong@mediatek.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240720071606.27930-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_021350_470353_D1B9A361 
X-CRM114-Status: GOOD (  25.82  )
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

Hi Yunfei,

First a high-level comment:

Adding a new V4L2 uAPI also requires patches to v4l-utils, specifically v4l2-ctl
and v4l2-compliance (i.e. new tests are needed for this flag). This will also help
you test the driver.

Some more comments below:

On 20/07/2024 09:15, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Adds a V4L2 flag which indicates that a queue is using restricted
> dmabufs and the corresponding capability flag.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [Yunfei: Change reviewer's comments]
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst       | 10 +++++++++-
>  .../userspace-api/media/v4l/vidioc-reqbufs.rst         |  6 ++++++
>  include/media/videobuf2-core.h                         |  8 +++++++-
>  include/uapi/linux/videodev2.h                         |  2 ++
>  4 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 52bbee81c080..901eb007aae8 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -696,7 +696,7 @@ enum v4l2_memory
>  
>  .. _memory-flags:
>  
> -Memory Consistency Flags
> +Memory Flags
>  ------------------------
>  
>  .. raw:: latex
> @@ -728,6 +728,14 @@ Memory Consistency Flags
>  	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
>  	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
>  	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> +    * .. _`V4L2-MEMORY-FLAG-RESTRICTED`:
> +
> +      - ``V4L2_MEMORY_FLAG_RESTRICTED``
> +      - 0x00000002
> +      - The queued buffers are expected to be in restricted memory. If not, an
> +	error will be returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``.
> +	Typically restricted buffers are allocated using a restricted dma-heap. This flag
> +	can only be specified if the :ref:`V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM` is set.
>  
>  .. raw:: latex
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index bbc22dd76032..8a264ae08db1 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -122,6 +122,7 @@ aborting or finishing any DMA in progress, an implicit
>  .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
>  .. _V4L2-BUF-CAP-SUPPORTS-MAX-NUM-BUFFERS:
>  .. _V4L2-BUF-CAP-SUPPORTS-REMOVE-BUFS:
> +.. _V4L2-BUF-CAP-SUPPORTS-RESTRICTED_MEM:
>  
>  .. raw:: latex
>  
> @@ -166,6 +167,11 @@ aborting or finishing any DMA in progress, an implicit
>          :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>`,
>          :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>` and
>          :ref:`V4L2_MEMORY_FLAG_NON_COHERENT <V4L2-MEMORY-FLAG-NON-COHERENT>`.
> +    * - ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM``
> +      - 0x00000100
> +      - This capability is set by the driver to indicate the queue supports
> +        restricted memory. See
> +        :ref:`V4L2_MEMORY_FLAG_RESTRICTED <V4L2-MEMORY-FLAG-RESTRICTED>`.
>  
>  .. raw:: latex
>  

What is missing in this documentation is what error to expect if you queue a buffer
from non-restricted memory to a driver configured for restricted memory. You probably
want a specific error code for that (EACCES? EPERM?).

Regards,

	Hans

> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 955237ac503d..afd497e93a37 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -517,6 +517,9 @@ struct vb2_buf_ops {
>   *		->finish().
>   * @non_coherent_mem: when set queue will attempt to allocate buffers using
>   *		non-coherent memory.
> + * @allow_restricted_mem: when set user-space can pass the %V4L2_MEMORY_FLAG_RESTRICTED
> + *		flag to indicate the dma bufs are restricted.
> + * @restricted_mem: when set queue will verify that the dma bufs are restricted.
>   * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
>   *		driver can set this to a mutex to let the v4l2 core serialize
>   *		the queuing ioctls. If the driver wants to handle locking
> @@ -621,6 +624,8 @@ struct vb2_queue {
>  	unsigned int			uses_requests:1;
>  	unsigned int			allow_cache_hints:1;
>  	unsigned int			non_coherent_mem:1;
> +	unsigned int			allow_restricted_mem:1;
> +	unsigned int			restricted_mem:1;
>  
>  	struct mutex			*lock;
>  	void				*owner;
> @@ -792,7 +797,8 @@ void vb2_core_querybuf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory:	memory type, as defined by &enum vb2_memory.
>   * @flags:	auxiliary queue/buffer management flags. Currently, the only
> - *		used flag is %V4L2_MEMORY_FLAG_NON_COHERENT.
> + *		used flags are %V4L2_MEMORY_FLAG_NON_COHERENT and
> + *		%V4L2_MEMORY_FLAG_RESTRICTED.
>   * @count:	requested buffer count.
>   *
>   * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 4e91362da6da..c4b1bc10af4c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1060,6 +1060,7 @@ struct v4l2_requestbuffers {
>  };
>  
>  #define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
> +#define V4L2_MEMORY_FLAG_RESTRICTED			(1 << 1)
>  
>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
>  #define V4L2_BUF_CAP_SUPPORTS_MMAP			(1 << 0)
> @@ -1071,6 +1072,7 @@ struct v4l2_requestbuffers {
>  #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
>  #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
>  #define V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS		(1 << 8)
> +#define V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM		(1 << 9)
>  
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers

