Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC0CC25B77
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 May 2024 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4I1m7xKVTyYsdzU1xyi4ewlcSDXoVx5WsGrUlhqQCQ=; b=nt55Bly9j07R07WGbA+p9ekbVt
	34GTbH0xscIHdHYZH2CwqxOUYopOKZoUqwdofzM8Ky/RvRrYks98j1kJxupTwkbpv0Zcg3p2tyyXJ
	XFa8UoyKg8dnrcWrH5N4W3wcpRe18VaBwexcwQjJPW1lYOF9RjUyz6+bjVV16n06h1ug7b7perb6Q
	3l6Up3/rQgPtREW4yWkqglwueHHF0S1UKuncm8bYg1zVXfevEoBf2tPN3GZ9kmlUoegtyPXDaFlzU
	xD7IzdwTRM99ZjWmPfIoJ+ndfEUMKGgXQlv0Lwml85R5rfqVKiRp4nttp6sDq/vJgdP8VrEubEs/C
	7ZVsl+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9jxX-00000002kvv-4C6q;
	Wed, 22 May 2024 11:16:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9jxT-00000002kth-0NDB;
	Wed, 22 May 2024 11:16:37 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED5DCD49;
	Wed, 22 May 2024 13:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716376579;
	bh=q83AOrxhjHdDtbOcVJNIw+dm8Yj5lnBFmVhmfjLn9IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YY5D39vjYu90YM40AKH7ctfUmXDtAh3vruu9Dqw2jQ0NLNg+p6WrLmo9V7u80L71G
	 ULiTQnW/MDSY/YmaYPNEkMMkY14OWGsTrZo+WvhbojfStattNgZP5ollUYzcsHdSof
	 gSbVh5HKYAenHcnPeB8iJ3mhIXdBV6fvJtxyM+zw=
Date: Wed, 22 May 2024 14:16:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
Message-ID: <20240522111622.GA31185@pendragon.ideasonboard.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-5-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516122102.16379-5-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_041635_324491_6F94FDEF 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Jefrey,

Thank you for the patch.

On Thu, May 16, 2024 at 08:20:42PM +0800, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Adds documentation for V4L2_MEMORY_FLAG_RESTRICTED.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 52bbee81c080..807e43bfed2b 100644
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
> +	can only be specified if the ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM`` is set.

Why is this flag needed ? Given that the usage model requires the V4L2
device to be a dma buf importer, why would userspace set the
V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
buffer to the device ?

The V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag also needs to be
documented in the relevant section, I don't think that's done in this
series.

>  
>  .. raw:: latex
>  

-- 
Regards,

Laurent Pinchart

