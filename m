Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9271ACD5BC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 14:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7RvbYjCkB6pNrCxoiqg0RFhoXztxf9Y+j61bTlIZgM=; b=oCeyigKgVmmT34MLH1NschQlrs
	D9vfFwDTDfLH6gPR+Fg5h39dwOUs9phKoFFMtTrR7NXyREysJYyEMn1zDKa7hDIdxUHYn2qJYcf75
	jwyBT0w8KuLvu+hjVtPY3VgCDqyuwYoHv05wueZzxyqW3ptz9B11aMUZgh5Z2SQUTVochNKmYoQwk
	1srJcWgDJqZ857gjNCNi8wB4BJKA3KyFolZDTo2WDb0G8PAStWdw16CH3ewzFzT83e66RxIyKO7dI
	pJyfNi72THOLw0yaB3iMMW1ixR68SAOi528+LKFRIzyqAATz2g8bZUKhs1FkFzYnB7mG+KOFB8NSH
	rQOG9EOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibWH-000cpH-0f;
	Tue, 19 Sep 2023 14:16:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibWD-000cna-2E;
	Tue, 19 Sep 2023 14:16:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1EE53616D4;
	Tue, 19 Sep 2023 14:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D61C433C8;
	Tue, 19 Sep 2023 14:15:57 +0000 (UTC)
Message-ID: <c15ddc52-1ba6-4650-ada3-b5cbddfa125a@xs4all.nl>
Date: Tue, 19 Sep 2023 16:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 36/49] media: test-drivers: Stop direct calls to queue
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
 <20230914133323.198857-37-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-37-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_071601_810006_0358F939 
X-CRM114-Status: GOOD (  18.76  )
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
>  drivers/media/test-drivers/visl/visl-dec.c         | 4 ++--
>  drivers/media/test-drivers/vivid/vivid-meta-cap.c  | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-meta-out.c  | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-touch-cap.c | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-vbi-cap.c   | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-vbi-out.c   | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 5 +++--
>  drivers/media/test-drivers/vivid/vivid-vid-out.c   | 5 +++--
>  8 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
> index ba20ea998d19..81da5dcf890a 100644
> --- a/drivers/media/test-drivers/visl/visl-dec.c
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -287,7 +287,7 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
>  	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
>  
>  	len = 0;
> -	for (i = 0; i < out_q->num_buffers; i++) {
> +	for (i = 0; i < out_q->max_allowed_buffers; i++) {
>  		char entry[] = "index: %u, state: %s, request_fd: %d, ";
>  		u32 old_len = len;
>  		struct vb2_buffer *vb2;
> @@ -347,7 +347,7 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
>  	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
>  
>  	len = 0;
> -	for (i = 0; i < cap_q->num_buffers; i++) {
> +	for (i = 0; i < cap_q->max_allowed_buffers; i++) {
>  		u32 old_len = len;
>  		struct vb2_buffer *vb2;
>  		char *q_status;
> diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.c b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
> index 780f96860a6d..646b1c6a936f 100644
> --- a/drivers/media/test-drivers/vivid/vivid-meta-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
> @@ -18,6 +18,7 @@ static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  				struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned int size =  sizeof(struct vivid_uvc_meta_buf);
>  
>  	if (!vivid_is_webcam(dev))
> @@ -30,8 +31,8 @@ static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  		sizes[0] = size;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;
>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
> index 95835b52b58f..4a569a6e58be 100644
> --- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
> @@ -18,6 +18,7 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  				struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned int size =  sizeof(struct vivid_meta_out_buf);
>  
>  	if (!vivid_is_webcam(dev))
> @@ -30,8 +31,8 @@ static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  		sizes[0] = size;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;
>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> index c7f6e23df51e..4b3c6ea0afde 100644
> --- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
> @@ -13,6 +13,7 @@ static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  				 struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	struct v4l2_pix_format *f = &dev->tch_format;
>  	unsigned int size = f->sizeimage;
>  
> @@ -23,8 +24,8 @@ static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>  		sizes[0] = size;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;
>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> index b65b02eeeb97..fcd7f40385e9 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> @@ -124,6 +124,7 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
>  		       unsigned sizes[], struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
>  	unsigned size = vq->type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ?
>  		36 * sizeof(struct v4l2_sliced_vbi_data) :
> @@ -134,8 +135,8 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = size;
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;
>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
> index cd56476902a2..8f0da5d88bcc 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
> @@ -20,6 +20,7 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
>  		       unsigned sizes[], struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	bool is_60hz = dev->std_out & V4L2_STD_525_60;
>  	unsigned size = vq->type == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT ?
>  		36 * sizeof(struct v4l2_sliced_vbi_data) :
> @@ -30,8 +31,8 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
>  
>  	sizes[0] = size;
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;
>  
>  	*nplanes = 1;
>  	return 0;
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> index 3a06df35a2d7..0cc7602b9fb2 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> @@ -77,6 +77,7 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
>  		       unsigned sizes[], struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned buffers = tpg_g_buffers(&dev->tpg);
>  	unsigned h = dev->fmt_cap_rect.height;
>  	unsigned p;
> @@ -117,8 +118,8 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
>  					dev->fmt_cap->data_offset[p];
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;

This can be dropped, min_buffers_needed is set to 2 already.

>  
>  	*nplanes = buffers;
>  
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
> index 184a6df2c29f..25578f55a060 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
> @@ -25,6 +25,7 @@ static int vid_out_queue_setup(struct vb2_queue *vq,
>  		       unsigned sizes[], struct device *alloc_devs[])
>  {
>  	struct vivid_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	const struct vivid_fmt *vfmt = dev->fmt_out;
>  	unsigned planes = vfmt->buffers;
>  	unsigned h = dev->fmt_out_rect.height;
> @@ -73,8 +74,8 @@ static int vid_out_queue_setup(struct vb2_queue *vq,
>  				       vfmt->data_offset[p] : size;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> -		*nbuffers = 2 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 2)
> +		*nbuffers = 2 - q_num_bufs;

Ditto.

>  
>  	*nplanes = planes;
>  

Regards,

	Hans

