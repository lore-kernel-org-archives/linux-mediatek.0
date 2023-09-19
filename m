Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876ABCD5BA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S36iAsSbR1P0j+2XSbiKcwdSa0kGgezzygEyMfHj29c=; b=qCxA6UrfIU2mnxmSfatvbHPVr5
	GevTNv6/82hGl9JnmtAxS085gt05Dt6fe3gzmlzx6n5VwNUImnODYLSB78ApoPrhqylP0ewfGleJZ
	RgzCi8d+33HeYMtCL3lcXek3wOouYeFUm6tcdn4pKXK7c+2F6Rer+04DAXIFaMf4bMi5sPPzmbvAl
	Way9Xep2tBpZC4GdAIzFRyjAE9SqYbaLcz63166UZT3dM+f0DS0vchG9ZmWQbRZsqyH7Yy7pjoRyR
	+1FUOKQqLMxoGmu+vqIbhcEdYRnA6N7n958F+otpQ7bOYb3s85hoaSJ2RBO1CV0SKrW12fBcfyDHQ
	ZlmpIA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZjk-000OwH-1a;
	Tue, 19 Sep 2023 12:21:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiZjg-000OuA-2B;
	Tue, 19 Sep 2023 12:21:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D024615EB;
	Tue, 19 Sep 2023 12:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA738C433C7;
	Tue, 19 Sep 2023 12:21:43 +0000 (UTC)
Message-ID: <90ee9c16-f023-483c-8cc8-f4a15a29ea48@xs4all.nl>
Date: Tue, 19 Sep 2023 14:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/49] media: Remove duplicated index vs q->num_buffers
 check
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
 <20230914133323.198857-19-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-19-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_052148_800454_E30CAB91 
X-CRM114-Status: GOOD (  22.45  )
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

On 14/09/2023 15:32, Benjamin Gaignard wrote:
> vb2_get_buffer() already check if the requested index is valid.

typo: check -> checks

> Stop duplicating this kind of check everywhere.

Also mention you moved it from the header to videobuf2-core.c.

Although I am not sure if it belongs in this patch, it is not
needed for this. I think it is better to move it either into a
separate patch, or move it to the patch where it is really needed.

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c |  8 ++++++++
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 13 -------------
>  include/media/videobuf2-core.h                  |  8 +-------
>  3 files changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index ee4df7c68397..2add7a6795e7 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -660,6 +660,14 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>  	}
>  }
>  
> +struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q, unsigned int index)
> +{
> +	if (index < q->num_buffers)
> +		return q->bufs[index];
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(vb2_get_buffer);
> +
>  bool vb2_buffer_in_use(struct vb2_queue *q, struct vb2_buffer *vb)
>  {
>  	unsigned int plane;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 87c2d5916960..f10b70d8e66a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -378,11 +378,6 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  		return -EINVAL;
>  	}
>  
> -	if (b->index >= q->num_buffers) {
> -		dprintk(q, 1, "%s: buffer index out of range\n", opname);
> -		return -EINVAL;
> -	}
> -
>  	vb = vb2_get_buffer(q, b->index);
>  	if (!vb) {
>  		dprintk(q, 1, "%s: buffer is NULL\n", opname);
> @@ -829,10 +824,6 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
>  		return -EBUSY;
>  	}
>  
> -	if (b->index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
>  	vb = vb2_get_buffer(q, b->index);
>  	if (!vb) {
>  		dprintk(q, 1, "can't find the requested buffer\n");
> @@ -904,10 +895,6 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
>  {
>  	struct vb2_buffer *vb;
>  
> -	if (eb->index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
>  	vb = vb2_get_buffer(q, eb->index);
>  	if (!vb) {
>  		dprintk(q, 1, "can't find the requested buffer\n");

This patch should be folded into 11/49. It is 11/49 that introduced these
duplicate messages, and it should have removed those directly.

Regards,

	Hans

> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 97153c69583f..25ca395616a7 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1238,13 +1238,7 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
>   * operation, so the buffer lifetime should be taken into
>   * consideration.
>   */
> -static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> -						unsigned int index)
> -{
> -	if (index < q->num_buffers)
> -		return q->bufs[index];
> -	return NULL;
> -}
> +struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q, unsigned int index);
>  
>  /*
>   * The following functions are not part of the vb2 core API, but are useful


