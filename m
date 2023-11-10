Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5340CC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 09:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5mFjzha6WERefZP68LDH4ZJE1RqAPU+H1iYXFXpE4I=; b=q/KHPbux0EFBg8UueG0+8SDljS
	Ff9AnFcTiDjrVx2jJwCB2nyXgneCcF8UqNiWFiqNGp6V5wJNq0GHOZbtMYaGlGjCiAdzYnDjxwldz
	9KF/SUPOLz+QQs+POvvFOY+4rwHZAeuJNO+ZbBo2A7SbbUmQOI9xKA5Vs8mvWG2/CX57cVSPUs+Nz
	E8lbowJHGnYlpeG3YESjI3bAlRc3ybAF+snBxokj4losmNVvc6cOlQKs6myWXN9Rv+k4R1n3mLQmB
	Dpk3W5OaE+tGV/GyqvnXibTtQVCrGmaQvRJPXSyoj5Rf72rsFocix7bM199koT141ZVvZ7R9haSeh
	Lq4CkuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Nmn-008BWh-0V;
	Fri, 10 Nov 2023 09:26:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Nmk-008BVi-11;
	Fri, 10 Nov 2023 09:26:43 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F05666073E2;
	Fri, 10 Nov 2023 09:26:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699608401;
	bh=gi6eNiomHAGLi9GNKFJFP416UqYP7sKqgmX+FgclTY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cigBLQcqBV90Hl5smGHz3i4Y2bQxHN/jELj7hTq9pCLQ3sNMgNuesh3AoF8Y2cTRk
	 W9lsEN72BiG8BgVnHSI+3u2A+IajCQpbesSsebnN14n778NAcIzGvl2Kdcw6fhkS5X
	 eZ123YfG+N9hVXfDiCh4ZxepXq5oiZhJ7ykNKj+TpllpWHY0KxjDuOKRUcj9lyp8PA
	 U/9MosoXdS1fEHo+Bp2g04o7o05tLhiEnW4nrEtmg+KX3FbydeZp7djQ9gpJX9b7et
	 HWhBkYsPjoD6ltQV/jrZ1MlvLW3DDegDkDfHb/omTqzD7umVUcN7vjlLaaEGWxgSxN
	 ss45pzKhVG6Zg==
Message-ID: <7224be00-99cb-4134-b45f-98b92c1fb4da@collabora.com>
Date: Fri, 10 Nov 2023 10:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 25/56] media: pci: tw68: Stop direct calls to queue
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
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
 <20231109163512.179524-26-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231109163512.179524-26-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_012642_482769_D565060B 
X-CRM114-Status: GOOD (  15.74  )
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

W dniu 9.11.2023 o 17:34, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>   drivers/media/pci/tw68/tw68-video.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/tw68/tw68-video.c b/drivers/media/pci/tw68/tw68-video.c
> index 773a18702d36..79b627ebc92a 100644
> --- a/drivers/media/pci/tw68/tw68-video.c
> +++ b/drivers/media/pci/tw68/tw68-video.c
> @@ -360,13 +360,14 @@ static int tw68_queue_setup(struct vb2_queue *q,
>   			   unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct tw68_dev *dev = vb2_get_drv_priv(q);
> -	unsigned tot_bufs = q->num_buffers + *num_buffers;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +	unsigned int tot_bufs = q_num_bufs + *num_buffers;
>   	unsigned size = (dev->fmt->depth * dev->width * dev->height) >> 3;
>   
>   	if (tot_bufs < 2)
>   		tot_bufs = 2;
>   	tot_bufs = tw68_buffer_count(size, tot_bufs);
> -	*num_buffers = tot_bufs - q->num_buffers;
> +	*num_buffers = tot_bufs - q_num_bufs;
>   	/*
>   	 * We allow create_bufs, but only if the sizeimage is >= as the
>   	 * current sizeimage. The tw68_buffer_count calculation becomes quite


