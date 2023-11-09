Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9365DC4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klAz5yh+EvO3eoSVw0wEtLyBHT2XfW8hl2uFiWVcpQg=; b=Mf5DBP7vgC+yt5YYyVx9UTdBNO
	JP5C7yDclwbMVb5V/uYkNUTVbfKjzN3kwb69xFvHkOdluOUBs6onlKceENZa0vPDobXcH7JM088eO
	BkQ/vkmnzY4VcQFC5qQx1DQe7uYlzsm3JVNVkn44jZz7/PW7RUH+f6/IvrieHEJNCR31u50M+zTqI
	QP5f54OXoS3YoGAuLsjRBtK45dFWaAMYnjg42xAHOl1/x+PIcmNVQC6yvhIk1WBk0qa2rk5utO9UY
	cZjPRDntq/V7XdyaFugxAKw6wkbCl6s3EGMdWpdDFXYi/UMie7SuFXX+CAuRfdxuta14gSMnz3dJv
	lO+nY7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13KY-0065MG-2E;
	Thu, 09 Nov 2023 11:36:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13KV-0065LT-2K;
	Thu, 09 Nov 2023 11:36:13 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E3BB66607421;
	Thu,  9 Nov 2023 11:36:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529770;
	bh=0/A01qhv+t/yxdlH4Uvpb5ikYV4gg6UyE57UO6NZhgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FG515hO3HjrUoULvSvT8VrKX3xPTGhoWcL+Y7qvZnyMA2aPTy1YXj9DAPO31UMTjV
	 M/ZEPpT/iG2nkXY83ACoykIN132N+TFuiFhdo0aWI6PGD5X7Phrc3REt048TB4woQk
	 9iGfao44RM9abMps+U1mSCMncgz79o40ckh7ufYYzdUX2YVX4PQF0X8HBebiEDSSWG
	 4Cecd4zyffcfzbnw5gccysBL1rHboOZlrtGTDdpVvF3o/E3Zp4+oya3OKcYFCZnsNO
	 65Bkdk/aIsPuTaaKA4VzyvIPvAuXZbKmazdg5DnfnFxIDoHo1fE31/HeQZjIqUw2dE
	 /cc2HV0dy3luA==
Message-ID: <ff26f953-35cc-4206-a8e9-86cf05acdc71@collabora.com>
Date: Thu, 9 Nov 2023 12:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 41/56] media: usb: hackrf: Stop direct calls to queue
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
 Antti Palosaari <crope@iki.fi>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-42-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-42-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_033611_892637_B7881550 
X-CRM114-Status: GOOD (  14.56  )
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

> CC: Antti Palosaari <crope@iki.fi>
> ---
>   drivers/media/usb/hackrf/hackrf.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
> index 3e535be2c520..9c0ecd5f056c 100644
> --- a/drivers/media/usb/hackrf/hackrf.c
> +++ b/drivers/media/usb/hackrf/hackrf.c
> @@ -753,12 +753,13 @@ static int hackrf_queue_setup(struct vb2_queue *vq,
>   		unsigned int *nplanes, unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct hackrf_dev *dev = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev_dbg(dev->dev, "nbuffers=%d\n", *nbuffers);
>   
>   	/* Need at least 8 buffers */
> -	if (vq->num_buffers + *nbuffers < 8)
> -		*nbuffers = 8 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 8)
> +		*nbuffers = 8 - q_num_bufs;
>   	*nplanes = 1;
>   	sizes[0] = PAGE_ALIGN(dev->buffersize);
>   


