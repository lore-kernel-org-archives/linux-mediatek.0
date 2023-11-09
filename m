Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E7CC4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsOt6vD1M0tpBBlXFsZ6GFnEC/o21Hd9UEJaT2NLzD8=; b=UNpNtLa1Cc5QbFWTK0iIAq70Hi
	CnUB8I0aqnw73VQTgd86tVqVULew5+9lmINzo+EC8vue60jBSm53qD2ynyF7iKkRKy+ib2bYgE/Yt
	GmebeWM4zhArNaQZDMVL0UyMJTaVAPKf50cvWDAt2xL2EtJz5V+qvsS5umObVSFGjEHgN82SmYWv2
	KK+qkI/lPBTMjiUin68tQv5QuIWI9bEa4peJoiYkfhe27O+R3uu0y3I598wJUjpp2gY45LlS00MMC
	UwrVavY/emHfIw41WH3x8Tjwocv+/yHBGuP/jm4JR4urTnuptH3tbpDXBJCUH2d2Y2pmtughdJUqH
	NwnXdMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12FO-005wnR-1l;
	Thu, 09 Nov 2023 10:26:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12FL-005wmU-1j;
	Thu, 09 Nov 2023 10:26:48 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D2D08660747A;
	Thu,  9 Nov 2023 10:26:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525606;
	bh=jAf4h4sgiviqaZEssAa8sbH54nGXtCyoEsIxJZmdzJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BAtkW3nSb+sNgx50yyTGQ9U2c9crSZN5E5WHdG/IQfT68/C3wCDJZHuQbBmCy+ojN
	 3MglN24Kx8MUhPiz2uKGyX9I7yJW0HF+t3NBQ44/k+ZaP8e/sGKIpaEg++Ki7s4Grj
	 Hucv6gCSDbUabTKvIcvgKVlTq2AUmcQ1mAWUdzrBle1PyHMbpMjMVwekITmwxNXzfJ
	 i9TnEvwkN6dSprJKaqi6DaMXA+JUn7WVkof8qqKukLUGF2PvZCf8BFvW3cLByi/xws
	 rpFiyas46Oi/pfNv9COmYd4k2fyU0z49KifjM9H7Jjm1nDMjWn6EoTj3reTTZ3cZ7g
	 ms+dUVLdOPA/w==
Message-ID: <1a25ef8e-4e72-4915-b9f1-d6477bbd2e21@collabora.com>
Date: Thu, 9 Nov 2023 11:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 28/56] media: nxp: Stop direct calls to queue
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
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-29-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-29-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_022647_702965_880E116A 
X-CRM114-Status: GOOD (  14.32  )
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

Reviewed-by: Andrzej Pietrasiewcz <andrzej.p@collabora.com>

> CC: Rui Miguel Silva <rmfrfs@gmail.com>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> CC: Martin Kepplinger <martink@posteo.de>
> ---
>   drivers/media/platform/nxp/imx7-media-csi.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 15049c6aab37..4c467fb82789 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1245,6 +1245,7 @@ static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
>   				      struct device *alloc_devs[])
>   {
>   	struct imx7_csi *csi = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   	struct v4l2_pix_format *pix = &csi->vdev_fmt;
>   	unsigned int count = *nbuffers;
>   
> @@ -1254,14 +1255,14 @@ static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
>   	if (*nplanes) {
>   		if (*nplanes != 1 || sizes[0] < pix->sizeimage)
>   			return -EINVAL;
> -		count += vq->num_buffers;
> +		count += q_num_bufs;
>   	}
>   
>   	count = min_t(__u32, IMX7_CSI_VIDEO_MEM_LIMIT / pix->sizeimage, count);
>   
>   	if (*nplanes)
> -		*nbuffers = (count < vq->num_buffers) ? 0 :
> -			count - vq->num_buffers;
> +		*nbuffers = (count < q_num_bufs) ? 0 :
> +			count - q_num_bufs;
>   	else
>   		*nbuffers = count;
>   


