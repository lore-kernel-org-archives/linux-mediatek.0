Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894F1C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta7mZIWqnEcLMWtP4KuhEP9dC9cDvHrROLo/SfBKKE8=; b=2McYHOP0CUYwzwXTvs0viz8cA+
	Mipy/PP3c1mDXPRYsg+3aZ1XSSYX1A50XXfG8XX/gU0mV1iBXpf92M3Yb8b586xJGpeseLuxYy+hX
	mnNBf19xoB8jMelAaA7/HTnRQpalKW7amiaayccb6Hwqti2HlmBzqrMsQImoiJDDkUlFY8yCTZt/D
	y417A3EUXD/I0Tg3z1rLv2coiQuGpfCTUPjS2nm6D98JF7fivY4/OF8FYMIlGyDjbTmExuZ7QPH4N
	hItiBmPb7SVbPuvD5kL34GM8w3qqWk2AIN+sg5km7wuwiRvtcB1ZNdAmhRrmtNZG3oY1PzeFH6d+0
	D3Kgbi8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r133z-0062sW-1C;
	Thu, 09 Nov 2023 11:19:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r133w-0062rB-0Y;
	Thu, 09 Nov 2023 11:19:05 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95C136607421;
	Thu,  9 Nov 2023 11:19:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699528743;
	bh=EHWlF6idsNP4hPb7jAlpbcca/qI2OyTJsZvOkakfOMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CXDVyXgIV1WXRA256QA8qY2evyCRRMqcxHwZOsFXs8KRCnGrzVgV7AhduNBhUSK7r
	 gpt5XXmgPv0CbOVSs2oay+Mj0qV2PbyqOZ333L+7TlruHuBAKsg9ZWYZqFtjo+I2TP
	 rFLMc1WmGqsdkYh4iJ/xBvx+BeArI8TkCWzrr/YW1WrD8qSaAbP5Jv/s0eAegoOxud
	 ilYIMvjraBWp82fR53n2Od3YTW0/iBQoGFx0QFksv5++v3Z7VLuXGuSus6TPUDpi4h
	 mxq5uRNR+gUweca1wiRPjPW0aks8bqzC96c6H3JBT5jJzxvUjoaJ7jCigydDrIqi81
	 WMvkKxS4Mhf4g==
Message-ID: <4835f2cf-ea3e-4a17-ab3b-c8e6f18b5192@collabora.com>
Date: Thu, 9 Nov 2023 12:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 33/56] touchscreen: sur40: Stop direct calls to queue
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
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-34-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-34-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_031904_334204_025F9AB2 
X-CRM114-Status: GOOD (  14.84  )
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
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/input/touchscreen/sur40.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
> index 8ddb3f7d307a..e7d2a52169a0 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -847,9 +847,10 @@ static int sur40_queue_setup(struct vb2_queue *q,
>   		       unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct sur40_state *sur40 = vb2_get_drv_priv(q);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>   
> -	if (q->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - q->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes)
>   		return sizes[0] < sur40->pix_fmt.sizeimage ? -EINVAL : 0;


