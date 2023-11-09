Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC36DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0vqLcwMHi35Q7Jj57DaHLGweKZjuSSil7pKNUJCFkc=; b=f1ffj+0wkvmPBw1nyhTUGSB2KV
	nZlXLx4JnEmgt66nYVNHdmQ+E3nmGME9u0i2RlJ5sa+xOxFlL7sXOkWB+jNbXhGrA6zttiFCG6pIC
	vpm7jZJrUeiIdMigzl2jnnyKkZo3jL77SUFg8pUuxvlog0SeZn/SB4q0AufJ/vunCAx8zOjzGnNX8
	HIgD4lg93wNiPdyoe3AzcwqkVPAxiRd2bWxgwmBIE836suG/bwNyVN+q3QmXqVF1xjApmzj5MRnW4
	WHvHvBraEaWvHtBD/CGCAoov48Bt0tCPPdp98TP8xSWj/g7DkgQ7K9QEYqSu7By7FuKeyB500TznS
	ukYoJS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13JY-0065ER-2v;
	Thu, 09 Nov 2023 11:35:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13JV-0065DE-06;
	Thu, 09 Nov 2023 11:35:10 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D3ED6607421;
	Thu,  9 Nov 2023 11:35:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529707;
	bh=wGG+JYaee46Jc94cdQPHhrwgWxti1g7uR47NXJMRWPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c2HZJPMU+RJlp9bGpU/z/4TDFlnLjBdWVnSHnQ/RzeERzo16ueDJWzTkwclEBsg2Z
	 dZt+YphS4hO6SgU5kizdOR+bIwXd7QQCM+IMcGQoAiiethCYZLoPylhihnExZZTk+t
	 xJ50alw3c6iuzotTobkKzmTDDP3DpyBIJT8MqExsmR05XAuI0i2L4Um0xp7d3TV6vc
	 xIGstsv0FC1BdjoOJ7m0U1McFFjQIwP/lmhfql6m3K+DYz5SCR573p3QCxCkTMNoxq
	 H42aquTBINLz3ywE7l3Ku5vFm9UGQ2StHfIncCHYn2z3BytaEu5zyUrcBTSC5z3SXx
	 HjSAMjR7Y6BSg==
Message-ID: <43985ffc-ca34-4051-8ae3-1d52c0337918@collabora.com>
Date: Thu, 9 Nov 2023 12:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 40/56] media: usb: cx231xx: Stop direct calls to queue
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
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-41-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-41-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_033509_194987_7AD22CEE 
X-CRM114-Status: GOOD (  15.11  )
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

> ---
>   drivers/media/usb/cx231xx/cx231xx-417.c   | 5 +++--
>   drivers/media/usb/cx231xx/cx231xx-video.c | 5 +++--
>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
> index fe4410a5e128..45973fe690b2 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-417.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-417.c
> @@ -1218,12 +1218,13 @@ static int queue_setup(struct vb2_queue *vq,
>   {
>   	struct cx231xx *dev = vb2_get_drv_priv(vq);
>   	unsigned int size = mpeglinesize * mpeglines;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev->ts1.ts_packet_size  = mpeglinesize;
>   	dev->ts1.ts_packet_count = mpeglines;
>   
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
> +		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;
>   
>   	if (*nplanes)
>   		return sizes[0] < size ? -EINVAL : 0;
> diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
> index e23b8ccd79d4..c8eb4222319d 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-video.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-video.c
> @@ -714,11 +714,12 @@ static int queue_setup(struct vb2_queue *vq,
>   		       unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct cx231xx *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev->size = (dev->width * dev->height * dev->format->depth + 7) >> 3;
>   
> -	if (vq->num_buffers + *nbuffers < CX231XX_MIN_BUF)
> -		*nbuffers = CX231XX_MIN_BUF - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < CX231XX_MIN_BUF)
> +		*nbuffers = CX231XX_MIN_BUF - q_num_bufs;
>   
>   	if (*nplanes)
>   		return sizes[0] < dev->size ? -EINVAL : 0;


