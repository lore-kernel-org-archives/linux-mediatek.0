Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC80C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WK1HxpHGGl1bweCWeLSHd+S0oBC7zSqXM8RsKQKx21s=; b=RNvUaupop3ZgCYQ2rJFDmaGdVv
	llffalr+7E0Q6vuwdDtg06R1OpCLa6DkAITLS1S598K/iWUvhQtcYKr0C+NS/4rf6IecPWCD6PTWG
	i0+T/51z4+LZ2i9EUFmqlpgyZUfCqURGFQWUG41LcJa1DMCFXnQyGv9QBru5hzsFJ25+/tELVqR8+
	noShq5+LiqTrRs45UtsyHjTI4e7BQa5qU4a8ga1Srlua8cnT7p6bGrHxf7NgWgr0wlslL+BTf9hIT
	qHR4OgnJO+qmzUjEF1J4TFi+4kWkiBiu51RcVOgRpIQ4m6bUTvbLOr1XWoQzHcam6q95i4z6ac3gW
	ywpBAvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Gh-0064ss-1W;
	Thu, 09 Nov 2023 11:32:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Gd-0064rq-1x;
	Thu, 09 Nov 2023 11:32:13 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 02E616607421;
	Thu,  9 Nov 2023 11:32:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529530;
	bh=VG1w9Pjjey9M4D6zDTGB2ppMv6zfZFZgDw9VZFd1POI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NU1aIuJef7HZL9xqOBaXnfBPX1f8dRX8TzKoXST6ZKdmi65WNUonx1xdbI4jJNHoQ
	 Akws7CNVKRzfM6KFRO/k6QjQGRxvALOX2rL3+qjt6hRiJ3exDuYCDR7enA3LPRQ3Gw
	 HrWFVVQK2Z3uElIt0+rMHJ+DjF68pZUp4aoAc54OLvcsOdibhaPSSMioBUuJazb8gf
	 cMr348Qe4azihf0irGki9G0wHL42fFrCL3Qt12o5xY+amvzdilt4wU6TRlRhlMWW3O
	 2tJcKicMkzl7kfq2ga3gyU9ffO9HJhTPF2saYBJve6pJvHdH8pGP1sxs3VH8eXPFpE
	 lP6Cxjw2DB5wQ==
Message-ID: <4c951ab7-9443-48e6-be18-64f60ac8b422@collabora.com>
Date: Thu, 9 Nov 2023 12:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 38/56] media: ti: Stop direct calls to queue
 num_buffers field
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-39-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-39-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_033211_897793_15C738E7 
X-CRM114-Status: GOOD (  15.78  )
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

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> ---
>   drivers/media/platform/ti/am437x/am437x-vpfe.c   | 5 +++--
>   drivers/media/platform/ti/cal/cal-video.c        | 5 +++--
>   drivers/media/platform/ti/davinci/vpif_capture.c | 5 +++--
>   drivers/media/platform/ti/davinci/vpif_display.c | 5 +++--
>   drivers/media/platform/ti/omap/omap_vout.c       | 5 +++--
>   5 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 5fa2ea9025d9..f18acf9286a2 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -1771,9 +1771,10 @@ static int vpfe_queue_setup(struct vb2_queue *vq,
>   {
>   	struct vpfe_device *vpfe = vb2_get_drv_priv(vq);
>   	unsigned size = vpfe->fmt.fmt.pix.sizeimage;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes) {
>   		if (sizes[0] < size)
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index a8abcd0fee17..94e67c057a20 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -603,9 +603,10 @@ static int cal_queue_setup(struct vb2_queue *vq,
>   {
>   	struct cal_ctx *ctx = vb2_get_drv_priv(vq);
>   	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes) {
>   		if (sizes[0] < size)
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> index 99fae8830c41..fc42b4bc37e6 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -113,6 +113,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
>   	struct channel_obj *ch = vb2_get_drv_priv(vq);
>   	struct common_obj *common = &ch->common[VPIF_VIDEO_INDEX];
>   	unsigned size = common->fmt.fmt.pix.sizeimage;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	vpif_dbg(2, debug, "vpif_buffer_setup\n");
>   
> @@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
>   		size = sizes[0];
>   	}
>   
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	*nplanes = 1;
>   	sizes[0] = size;
> diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/media/platform/ti/davinci/vpif_display.c
> index f8ec2991c667..9dbab1003c1d 100644
> --- a/drivers/media/platform/ti/davinci/vpif_display.c
> +++ b/drivers/media/platform/ti/davinci/vpif_display.c
> @@ -115,6 +115,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
>   	struct channel_obj *ch = vb2_get_drv_priv(vq);
>   	struct common_obj *common = &ch->common[VPIF_VIDEO_INDEX];
>   	unsigned size = common->fmt.fmt.pix.sizeimage;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	if (*nplanes) {
>   		if (sizes[0] < size)
> @@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *vq,
>   		size = sizes[0];
>   	}
>   
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	*nplanes = 1;
>   	sizes[0] = size;
> diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
> index 4143274089c3..72ce903717d3 100644
> --- a/drivers/media/platform/ti/omap/omap_vout.c
> +++ b/drivers/media/platform/ti/omap/omap_vout.c
> @@ -944,10 +944,11 @@ static int omap_vout_vb2_queue_setup(struct vb2_queue *vq,
>   				     struct device *alloc_devs[])
>   {
>   	struct omap_vout_device *vout = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   	int size = vout->pix.sizeimage;
>   
> -	if (is_rotation_enabled(vout) && vq->num_buffers + *nbufs > VRFB_NUM_BUFS) {
> -		*nbufs = VRFB_NUM_BUFS - vq->num_buffers;
> +	if (is_rotation_enabled(vout) && q_num_bufs + *nbufs > VRFB_NUM_BUFS) {
> +		*nbufs = VRFB_NUM_BUFS - q_num_bufs;
>   		if (*nbufs == 0)
>   			return -EINVAL;
>   	}


