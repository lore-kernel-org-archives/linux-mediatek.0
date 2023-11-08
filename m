Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581FBC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xs6kO966tviXDcekUu8tsI0D2rT5dqi/AClW46/ecTc=; b=4Cl6D7Wns0tX9qMs7P8KU+cEnz
	yFx8OHaQv+KqNvDEeQTV1iPWyCcLBG9rL3i2svygltKBT+mdTd73qX7Te9u59kn6ofwQ14R4OtAWW
	khNhkSurNYIIoJCYnKS1Ziznjy34tAYZ4XPFpwMGzawCwNuYLQPTZPqpj/u+uIsFxs4ZBHMOjjyAO
	v8T5fQrnbvL0588rnU6xwvKM2JZuC9nGVdF5aYZSd7dHLgZb0LaspD0OYT2gZyNzBOSarJzGyVchv
	9KYddxfx6DD9wDyK7xRHPUMyAYzRLbiyk/6qkvfmX8GYsIM6DQgB6mxE3x1twt+yfcKycHmFpfM+u
	rg12LZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0llU-004L1B-0k;
	Wed, 08 Nov 2023 16:50:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0llQ-004Kzn-0g;
	Wed, 08 Nov 2023 16:50:49 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F2776607699;
	Wed,  8 Nov 2023 16:50:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699462245;
	bh=+sODeHjd8Zjj0on3iV7YDUdkXMjj8v7Lrv4oakBoV4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ShKdGXxBZN2kZvFJvNnXk0eN2yafgrTLmYJpjq8w9ja9BC8pum//fy+OgQGWuZjaN
	 xxVgdeqTEYotKiIBOh/WSNOJayEVu+qVjAEBApU7NBis4Ypl3SDmK0ZqVnt3VW/cWO
	 4GBozKOo+ZAMCcBx59rq4zf+tyNqvOHhxbEgCIPRq8pVLYhzIDKEuB11bnAUaBziU7
	 DU3MpzzZDjyAeQu7DiOzTpps2ljRfZVoiV/Tict0SWLJoyIKRwg9QlerX6zZYzD81f
	 xBGSB9PKjo7m2UVELovGwQhaxuF5Fl6ybUrtONi1HQPpSupprlJXa1GeX8Zutd7vKH
	 RPybPbfDCvjmg==
Message-ID: <7128cc07-5c16-4e6d-b7d0-aa90ec493fd2@collabora.com>
Date: Wed, 8 Nov 2023 17:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 07/56] media: videobuf2: Add helper to get queue
 number of buffers
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
 <20231031163104.112469-8-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-8-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_085048_377899_BC63F5BC 
X-CRM114-Status: GOOD (  17.94  )
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
> In the future a side effect of introducing DELETE_BUFS ioctl is
> the create of 'holes' (i.e. unused buffers) in bufs arrays.
> To know which entries of the bufs arrays are used a bitmap will
> be added in struct vb2_queue. That will also mean that the number
> of buffers will be computed given the number of bit set in this bitmap.
> To smoothly allow this evolution all drives must stop using
> directly num_buffers field from struct vb2_queue.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   include/media/videobuf2-core.h | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index cd3ff1cd759d..8f9d9e4af5b1 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1139,6 +1139,15 @@ static inline bool vb2_fileio_is_active(struct vb2_queue *q)
>   	return q->fileio;
>   }
>   
> +/**
> + * vb2_get_num_buffers() - get the number of buffer in a queue
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> + */
> +static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
> +{
> +	return q->num_buffers;
> +}
> +
>   /**
>    * vb2_is_busy() - return busy status of the queue.
>    * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> @@ -1147,7 +1156,7 @@ static inline bool vb2_fileio_is_active(struct vb2_queue *q)
>    */
>   static inline bool vb2_is_busy(struct vb2_queue *q)
>   {
> -	return (q->num_buffers > 0);
> +	return vb2_get_num_buffers(q) > 0;
>   }
>   
>   /**


