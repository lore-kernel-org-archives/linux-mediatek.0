Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1622FCDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afr2VL+6FJmArI5C2gbwq7K3dzI7erVmkms4i3t36gc=; b=ckc66sO6DOC5NjdCGNzg2AdiPV
	IOsZNp+36Ds4eM9SwXqPjmm4gfLs6sIMawGgTzHIyWF5HHHy9tbCvMrsVnOCcE4iisi+yf67qfYJO
	bWsMBRAL0fKYjpsO4yEdQWeUtv3z9cnxQJ61MdviyNdhZJSPxIWm8ch4B6e1vaYoROirkfhMbjt2A
	6oJWfa61jRBd1WBOd2BzXZCt/OutUSx47ad89MPcrGZhGOXc2IEhs22E8di8gHWrXusafkYOB88Ym
	N9uf5ZJE35i0wCrEGbcZ0+xcHpXQddo0N4TYX1s4L4ND2f6/JKMyZe0lDQT1xOnzvEBdrgnHZGVy6
	EjIeR5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3ot-00EROI-0E;
	Wed, 18 Oct 2023 10:30:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3oq-00ERNZ-1W;
	Wed, 18 Oct 2023 10:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD48F616CB;
	Wed, 18 Oct 2023 10:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F7EC433C7;
	Wed, 18 Oct 2023 10:30:24 +0000 (UTC)
Message-ID: <f677c49a-15e0-4d80-9359-57ea50f19d01@xs4all.nl>
Date: Wed, 18 Oct 2023 12:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 35/56] media: cedrus: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
 <20231017144756.34719-36-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231017144756.34719-36-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_033028_574920_0417F9D2 
X-CRM114-Status: GOOD (  15.32  )
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

On 17/10/2023 16:47, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() and queue max_num_buffers field

Reference to max_num_buffers which doesn't exist yet.

> to avoid using queue num_buffer field directly.

num_buffer -> num_buffers

> This allows us to change how the number of buffers is computed in the
> futur.

futur -> future

Regards,

	Hans

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> CC: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 9 +++++++--
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 9 +++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index dfb401df138a..3e2843ef6cce 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -653,8 +653,13 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>  
> -	for (i = 0; i < vq->num_buffers; i++) {
> -		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
> +	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
> +		struct vb2_buffer *vb = vb2_get_buffer(vq, i);
> +
> +		if (!vb)
> +			continue;
> +
> +		buf = vb2_to_cedrus_buffer(vb);
>  
>  		if (buf->codec.h264.mv_col_buf_size > 0) {
>  			dma_free_attrs(dev->dev,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index fc9297232456..52e94c8f2f01 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -869,8 +869,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>  
> -	for (i = 0; i < vq->num_buffers; i++) {
> -		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
> +	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
> +		struct vb2_buffer *vb = vb2_get_buffer(vq, i);
> +
> +		if (!vb)
> +			continue;
> +
> +		buf = vb2_to_cedrus_buffer(vb);
>  
>  		if (buf->codec.h265.mv_col_buf_size > 0) {
>  			dma_free_attrs(dev->dev,


