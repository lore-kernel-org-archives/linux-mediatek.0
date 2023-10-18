Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BD7CDB482
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSbqtCMvkCPkjdDUzhwmnBKAujQc8Px24RjnCiOCI6g=; b=vj7NZGNaiFSQOGW1JDF3I/uC6h
	32pRUWRPzWhYfqOEFUwFeq7W4utlJQnzteMjkEGBaDnNnYfkPf1GqmgbCvrZW4SS38NTyxzx5cpCO
	55ZOjng5yEjvOHodLHwaWCwhyD6dKQy38WI+5lfthmPOlV2uwYJpP8eAQqWniVaukXiY4Qd5gTROh
	toP4fUEb8BGNSmsDe3AyXa/kIlCdh45KRhp21GocbZVKOCMCw+f0r6hrzWNQuzsW8fnaQ08bdIRS8
	ymvmHzJbWWofE5sGVo52pGP35e2pBnm42Xe/RylhGrTqkjiF9gzSox++ZLXuxKfahkqyjWbBCq5aK
	HgVbZWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3e9-00EQUk-0Y;
	Wed, 18 Oct 2023 10:19:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt3e5-00EQTh-2X;
	Wed, 18 Oct 2023 10:19:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BF8F6170B;
	Wed, 18 Oct 2023 10:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C089EC433C8;
	Wed, 18 Oct 2023 10:19:17 +0000 (UTC)
Message-ID: <0fb31f73-2743-44c0-af1b-ac30c582e45a@xs4all.nl>
Date: Wed, 18 Oct 2023 12:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 22/56] media: pci: tw686x: Set min_buffers_needed to 3
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
 <20231017144756.34719-23-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231017144756.34719-23-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_031921_865002_28DF46E1 
X-CRM114-Status: GOOD (  16.02  )
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
> vb2 queue_setup checks for a minimum number of buffers so set
> min_buffers_needed to 3 and remove the useless check in
> tw686x_queue_setup().
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/media/pci/tw686x/tw686x-video.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
> index 3ebf7a2c95f0..74cd864365aa 100644
> --- a/drivers/media/pci/tw686x/tw686x-video.c
> +++ b/drivers/media/pci/tw686x/tw686x-video.c
> @@ -426,13 +426,6 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
>  	unsigned int szimage =
>  		(vc->width * vc->height * vc->format->depth) >> 3;
>  
> -	/*
> -	 * Let's request at least three buffers: two for the
> -	 * DMA engine and one for userspace.
> -	 */
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> -
>  	if (*nplanes) {
>  		if (*nplanes != 1 || sizes[0] < szimage)
>  			return -EINVAL;
> @@ -1221,7 +1214,11 @@ int tw686x_video_init(struct tw686x_dev *dev)
>  		vc->vidq.ops = &tw686x_video_qops;
>  		vc->vidq.mem_ops = dev->dma_ops->mem_ops;
>  		vc->vidq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -		vc->vidq.min_buffers_needed = 2;
> +		/*
> +		 * Let's request at least three buffers: two for the
> +		 * DMA engine and one for userspace.
> +		 */
> +		vc->vidq.min_buffers_needed = 3;

Don't touch min_buffers_needed, just keep the current check in queue_setup.

Regards,

	Hans

>  		vc->vidq.lock = &vc->vb_mutex;
>  		vc->vidq.gfp_flags = dev->dma_mode != TW686X_DMA_MODE_MEMCPY ?
>  				     GFP_DMA32 : 0;


