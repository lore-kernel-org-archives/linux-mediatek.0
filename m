Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F5FCDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhPTFo0oeO5TRqWDpWuYA24BLESlX4TcTcfhwdipP/8=; b=U9+jjqZ+opVduezzGapNKE5fF/
	/vnNBsntBSo3pUfL7vEfznTXQK3eiE8hF4EA79fBxgdnGAAJsqfWGSBju+/B2+p5Fya//AMQe9iUT
	r2SobvmKT2uWYNbqOQAd3qFwXnnioikXUncBnguGcuLxfFfaN6DTlfruKbJIsb9MNvXAAikvXyMuy
	aFe/VcjkycHZjAak+RY7mQ6au1jkp/lLkbxLdr/bkF2prXj5ORR44l7/quATKPvHeH4Skhw7bAsI5
	5vIp9RUTR4bElbC9mrDBYTdLhiLT8Jd5QL+EBGc7qsh9Fw5U0O7cr74zZc5suSyQmSEIHnmAfWFvZ
	glDrnJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIpy-008oW8-0T;
	Mon, 16 Oct 2023 08:20:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIpu-008oU0-2F;
	Mon, 16 Oct 2023 08:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6ADFCE128A;
	Mon, 16 Oct 2023 08:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC20AC433C8;
	Mon, 16 Oct 2023 08:20:20 +0000 (UTC)
Message-ID: <dcf6f56a-2b6d-4178-ad8e-c0f40804aeba@xs4all.nl>
Date: Mon, 16 Oct 2023 10:20:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 34/56] media: usb: cx231xx: Set min_buffers_needed to
 CX231XX_MIN_BUF
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-35-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231012114642.19040-35-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_012026_909106_42E78562 
X-CRM114-Status: GOOD (  12.88  )
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

On 12/10/2023 13:46, Benjamin Gaignard wrote:
> vb2 queue_setup checks for a minimum number of buffers so set
> min_buffers_needed to  aCX231XX_MIN_BUFnd remove the useless check in

Garbled line.

Regards,

	Hans

> cx231xx queue_setup().
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/usb/cx231xx/cx231xx-417.c   | 4 +---
>  drivers/media/usb/cx231xx/cx231xx-video.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
> index c5e21785fafe..fecdb12f5ef7 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-417.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-417.c
> @@ -1223,9 +1223,6 @@ static int queue_setup(struct vb2_queue *vq,
>  	dev->ts1.ts_packet_size  = mpeglinesize;
>  	dev->ts1.ts_packet_count = mpeglines;
>  
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> -
>  	if (*nplanes)
>  		return sizes[0] < size ? -EINVAL : 0;
>  	*nplanes = 1;
> @@ -1777,6 +1774,7 @@ int cx231xx_417_register(struct cx231xx *dev)
>  	q = &dev->mpegq;
>  	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
> +	q->min_buffers_needed = CX231XX_MIN_BUF;
>  	q->drv_priv = dev;
>  	q->buf_struct_size = sizeof(struct cx231xx_buffer);
>  	q->ops = &cx231xx_video_qops;
> diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
> index e23b8ccd79d4..26b593844157 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-video.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-video.c
> @@ -717,9 +717,6 @@ static int queue_setup(struct vb2_queue *vq,
>  
>  	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
>  
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> -
>  	if (*nplanes)
>  		return sizes[0] < dev->size ? -EINVAL : 0;
>  	*nplanes = 1;
> @@ -1805,6 +1802,7 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
>  	q = &dev->vidq;
>  	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  	q->io_modes = VB2_USERPTR | VB2_MMAP | VB2_DMABUF | VB2_READ;
> +	q->min_buffers_needed = CX231XX_MIN_BUF;
>  	q->drv_priv = dev;
>  	q->buf_struct_size = sizeof(struct cx231xx_buffer);
>  	q->ops = &cx231xx_video_qops;


