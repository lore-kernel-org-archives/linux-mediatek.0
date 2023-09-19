Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB28CD5BC6
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 14:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHiyddYWNRItwrf6LRqbyXaRuNklhh9JUBbF/ep9CrI=; b=S9+e4IAbI6FeEWghhLq4lMz369
	eUYaMAjRchgSyhDgafZ5cjMJfXEYm2xtO4T1J9ACWI6XGrti4FdKXT04Ast0f8X4inJdW1kXQHEWw
	2H90vPMF6/wLeRpHndHH2MJbeOtmintR4yLTkuZ+VJEFvIBqXyXVl25jJbk4rMvD6gcf3XDHcKZWN
	823bVv8k0SATApHNtyVjpee50l/JH3CzbYXuV2LafXX56puX8+gHqON1nV8lRFc5LcSn0TTki7i+8
	3uBKNNNyw2yryX5RCvrmrBOYUTIZxSk6antANSblGPVgSXazwSBtHe9/g2awdBIaWW1w0evE5UZhl
	FsAFic+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibQg-000c6i-0t;
	Tue, 19 Sep 2023 14:10:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibQd-000c5N-02;
	Tue, 19 Sep 2023 14:10:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36AF661620;
	Tue, 19 Sep 2023 14:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18227C433C7;
	Tue, 19 Sep 2023 14:10:09 +0000 (UTC)
Message-ID: <b459dc32-7eba-481e-8c52-99bba5a5db4d@xs4all.nl>
Date: Tue, 19 Sep 2023 16:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 34/49] media: ti: Stop direct calls to queue
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
 <20230914133323.198857-35-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-35-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_071015_132214_FF6CBA11 
X-CRM114-Status: GOOD (  17.18  )
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
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   | 5 +++--
>  drivers/media/platform/ti/cal/cal-video.c        | 5 +++--
>  drivers/media/platform/ti/davinci/vpif_capture.c | 5 +++--
>  drivers/media/platform/ti/davinci/vpif_display.c | 5 +++--
>  drivers/media/platform/ti/omap/omap_vout.c       | 5 +++--
>  5 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 63092013d476..3b1e5dfecdbc 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -1774,10 +1774,11 @@ static int vpfe_queue_setup(struct vb2_queue *vq,
>  			    unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned size = vpfe->fmt.fmt.pix.sizeimage;
>  
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;

Drop this, instead update min_buffers_needed from 1 to 3.

>  
>  	if (*nplanes) {
>  		if (sizes[0] < size)
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index a8abcd0fee17..5dfe40ca47fc 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -602,10 +602,11 @@ static int cal_queue_setup(struct vb2_queue *vq,
>  			   unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
>  
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;

Drop this check, min_buffers_needed is already 3.

>  
>  	if (*nplanes) {
>  		if (sizes[0] < size)
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> index 99fae8830c41..fc42b4bc37e6 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -113,6 +113,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
>  	struct channel_obj *ch = vb2_get_drv_priv(vq);
>  	struct common_obj *common = &ch->common[VPIF_VIDEO_INDEX];
>  	unsigned size = common->fmt.fmt.pix.sizeimage;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  
>  	vpif_dbg(2, debug, "vpif_buffer_setup\n");
>  
> @@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
>  		size = sizes[0];
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;

Drop, and update min_buffers_needed to 3.

>  
>  	*nplanes = 1;
>  	sizes[0] = size;
> diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
> index f8ec2991c667..9dbab1003c1d 100644
> --- a/drivers/media/platform/ti/davinci/vpif_display.c
> +++ b/drivers/media/platform/ti/davinci/vpif_display.c
> @@ -115,6 +115,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
>  	struct channel_obj *ch = vb2_get_drv_priv(vq);
>  	struct common_obj *common = &ch->common[VPIF_VIDEO_INDEX];
>  	unsigned size = common->fmt.fmt.pix.sizeimage;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  
>  	if (*nplanes) {
>  		if (sizes[0] < size)
> @@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
>  		size = sizes[0];
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;

Ditto.

>  
>  	*nplanes = 1;
>  	sizes[0] = size;
> diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
> index 4143274089c3..72ce903717d3 100644
> --- a/drivers/media/platform/ti/omap/omap_vout.c
> +++ b/drivers/media/platform/ti/omap/omap_vout.c
> @@ -944,10 +944,11 @@ static int omap_vout_vb2_queue_setup(struct vb2_queue *vq,
>  				     struct device *alloc_devs[])
>  {
>  	struct omap_vout_device *vout = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	int size = vout->pix.sizeimage;
>  
> -	if (is_rotation_enabled(vout) && vq->num_buffers + *nbufs > VRFB_NUM_BUFS) {
> -		*nbufs = VRFB_NUM_BUFS - vq->num_buffers;
> +	if (is_rotation_enabled(vout) && q_num_bufs + *nbufs > VRFB_NUM_BUFS) {
> +		*nbufs = VRFB_NUM_BUFS - q_num_bufs;
>  		if (*nbufs == 0)
>  			return -EINVAL;
>  	}

Regards,

	Hans

