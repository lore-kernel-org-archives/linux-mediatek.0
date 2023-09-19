Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E449CD5BC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 14:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdKIgiAOy3uYSQM4wmzrqwnNkYlTy1ILSdbTEDrHCtI=; b=fbLykbObwG02MurXKvgwcGVLtE
	tqvdLXcC585I63M6NzFIosR02b/nXBzZHV/qQLc0iNJv+AKrnSF8mKfOpbdaWotGS8X90HlB4W2vK
	3f4VMmu+wQjk6dZc8RRaaJ+bhl+8gEUUEirHJbKVvt2159+kpkrYGEI6DQDjwdm677zMLeKzfovaD
	g8t8qiAnnrxDIiO+U5RfDw7R98WpRgugIlCynzmUf8DPzLwztS14YakO3+27mxicHNuG2dM0CVzTd
	nbFxKTCxXMCdt3ZQW7u3+BrpJpkh+mh5KnM+vtZhiejHU/v3cM13eVjmJpt3mGOjbyrb5NOivr41y
	jpd8vBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qibZk-000dWj-2i;
	Tue, 19 Sep 2023 14:19:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qibZh-000dUd-0Y;
	Tue, 19 Sep 2023 14:19:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E63B1CE134D;
	Tue, 19 Sep 2023 14:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42FCC433C7;
	Tue, 19 Sep 2023 14:19:29 +0000 (UTC)
Message-ID: <d52bff95-7cee-4e75-9f77-488384e92998@xs4all.nl>
Date: Tue, 19 Sep 2023 16:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 38/49] media: usb: cx231xx: Stop direct calls to queue
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
 <20230914133323.198857-39-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-39-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_071937_415732_CB5860C7 
X-CRM114-Status: GOOD (  15.93  )
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
>  drivers/media/usb/cx231xx/cx231xx-417.c   | 5 +++--
>  drivers/media/usb/cx231xx/cx231xx-video.c | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
> index c5e21785fafe..9ec0b7e355e2 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-417.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-417.c
> @@ -1218,13 +1218,14 @@ static int queue_setup(struct vb2_queue *vq,
>  		       unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct cx231xx *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  	unsigned int size = mpeglinesize * mpeglines;
>  
>  	dev->ts1.ts_packet_size  = mpeglinesize;
>  	dev->ts1.ts_packet_count = mpeglines;
>  
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
> +		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;

Drop the check, update min_buffers_needed from 1 to CX231XX_MIN_BUF.

>  
>  	if (*nplanes)
>  		return sizes[0] < size ? -EINVAL : 0;
> diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
> index e23b8ccd79d4..c8eb4222319d 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-video.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-video.c
> @@ -714,11 +714,12 @@ static int queue_setup(struct vb2_queue *vq,
>  		       unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct cx231xx *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  
>  	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
>  
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
> +		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;

Ditto.

>  
>  	if (*nplanes)
>  		return sizes[0] < dev->size ? -EINVAL : 0;

Regards,

	Hans

