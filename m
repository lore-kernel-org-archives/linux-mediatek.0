Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E1BCD5BC9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQGYKcXIZKOZ5zrXeLMHlt1FetRNAAeva/mpX7sbmJQ=; b=oNEDnD533+Kut5edw7fJkSnRPB
	GXhEE7Z6LiUnnKfgqDD3jnQD/7cDjnKH3N77WXU8xjssn/IvKEkQh8joFNsFO/n9/DuPqo3aK15eV
	PtnqPBvloA+LQI4+rsJqCPN8czMUSH4hT7wUYBW16al1+ZFNIGbBjj3QW7E84blSc3ID6O46zE2G6
	xb8kT69gtHFjqIQmvdmyJANbqCRNp9hvHccG7R3Af3IDefmGCGaMc6ZTwqcZdcuJLird3D6spSp/D
	CzOPSZno864rRKtP2nH+yLxGzmZPiJmqlsc+4jS05mZtYGjRD+EByRZvU6b5tOMFMDNeAWPHHcY9y
	I1IYt7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibgA-000eYk-05;
	Tue, 19 Sep 2023 14:26:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibg6-000eXB-2D;
	Tue, 19 Sep 2023 14:26:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 122DE616DC;
	Tue, 19 Sep 2023 14:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92BBC433CC;
	Tue, 19 Sep 2023 14:26:09 +0000 (UTC)
Message-ID: <307be618-f25b-4400-8659-11c9837dae35@xs4all.nl>
Date: Tue, 19 Sep 2023 16:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 44/49] media: cedrus: Stop direct calls to queue
 num_buffers field
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
 <20230914133323.198857-45-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-45-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_072614_763924_91D1D7F8 
X-CRM114-Status: GOOD (  16.05  )
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
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 4 +++-
>  drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index dfb401df138a..bbe5802ea861 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -649,11 +649,13 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>  	struct cedrus_dev *dev = ctx->dev;
>  	struct cedrus_buffer *buf;
>  	struct vb2_queue *vq;
> +	unsigned int q_num_bufs;
>  	unsigned int i;
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	q_num_bufs = vb2_get_num_buffers(vq);
>  
> -	for (i = 0; i < vq->num_buffers; i++) {
> +	for (i = 0; i < q_num_bufs; i++) {

Shouldn't this be vq->max_allowed_buffers?

>  		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));

And continue if vb2_get_buffer(vq, i) == NULL?

>  
>  		if (buf->codec.h264.mv_col_buf_size > 0) {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> index fc9297232456..533a38316686 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
> @@ -865,11 +865,13 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
>  	struct cedrus_dev *dev = ctx->dev;
>  	struct cedrus_buffer *buf;
>  	struct vb2_queue *vq;
> +	unsigned int q_num_bufs;
>  	unsigned int i;
>  
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	q_num_bufs = vb2_get_num_buffers(vq);
>  
> -	for (i = 0; i < vq->num_buffers; i++) {
> +	for (i = 0; i < q_num_bufs; i++) {

Ditto.

>  		buf = vb2_to_cedrus_buffer(vb2_get_buffer(vq, i));
>  
>  		if (buf->codec.h265.mv_col_buf_size > 0) {

If this driver starts supporting DELETE_BUF, then you can't use vb2_get_num_buffers(vq),
right?

	Hans

