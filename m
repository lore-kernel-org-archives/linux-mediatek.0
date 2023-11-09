Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD66FC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 12:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjL0Ih/CuxNF+dJBu3tNwjCjKUa3LD4oRM+pAcnKCyo=; b=LB7D331oLlziBvBFFW3xmYIS5Z
	bE3EOQ0rU3dBQAUZlar4f2DbqYNgwmVtcYdbM7k1Oo6vtrIntnS+s+QACuxxx4Qe2DHChZHBqdGdJ
	cT04izG6CAFVdl1/zvBt8kGCIUL1ygLUWTKRnxdUxE2us8s/9yt7XUsLtmbq9nzDqyqvfyGnFEwUy
	iPkbvWh05ToJo1Z4idBRVYliQ86tY0J4IJG2mS85p4YUnYK5OexPiGeizDNtK2WGRMNuF55DY4UXR
	2XeILYVr1FMe9WBUX/SLIhg0K/xj7MGJpG+i/0qTHCGcVKdXFJ/ELPm1mR1ZzJaDmFkaJVpEXMxSN
	SDc8Xdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r14Bk-006K9i-26;
	Thu, 09 Nov 2023 12:31:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r14Bh-006K8b-0f;
	Thu, 09 Nov 2023 12:31:10 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7593E660747A;
	Thu,  9 Nov 2023 12:31:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699533067;
	bh=QHgtkMbPR42XKzSt/d+F/ArcOpNb7M22RF22MC40QeM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jBIwjCKMOyEVutf0k2TMxWSVOmm3Cghe1TCrrR5c6GflI/qkDOAlYNLENryacWSA4
	 eTJ5LKYeM/TzU+645E9Zfll4bF96thUjF619GeowEpaQi08Fn+yWnkJuLbsHwTxP5S
	 5FF5s0iPPpyXbuR2NC4h5FF7rbUFkErs2EYIkeJ3QD6d6iJ8B3xK+NtxBYFsGMGefw
	 VAMnREmoHUj4VHHKldKmK6FssrknRoE9gg3ftextkd7l3LVxp7zaheXW53db6/7v+Z
	 HBw8TS3kKXEifNJE0DdNRKBgc8WiEXT+ZulaQRey88yBiUVKAb1vnWjefmOHWin7wW
	 NlqHrKsePhs7w==
Message-ID: <d020a006-e413-4004-82ff-0fe7e0894df8@collabora.com>
Date: Thu, 9 Nov 2023 13:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 45/56] media: test-drivers: vivid: Increase max
 supported buffers for capture queues
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
 <20231031163104.112469-46-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-46-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_043109_373391_3F901C26 
X-CRM114-Status: GOOD (  13.72  )
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
> Change the maximum number of buffers of some capture queues in order
> to test max_num_buffers field.
> 
> Allow to allocate up to:
> - 64 buffers for video capture queue.
> - 1024 buffers for sdr capture queue.
> - 32768 buffers for vbi capture queue.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/test-drivers/vivid/vivid-core.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index 394c9f81ea72..353f035fcd19 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -876,6 +876,20 @@ static int vivid_create_queue(struct vivid_dev *dev,
>   	q->type = buf_type;
>   	q->io_modes = VB2_MMAP | VB2_DMABUF;
>   	q->io_modes |= V4L2_TYPE_IS_OUTPUT(buf_type) ?  VB2_WRITE : VB2_READ;
> +
> +	/*
> +	 * The maximum number of buffers is 32768 if PAGE_SHIFT == 12,
> +	 * see also MAX_BUFFER_INDEX in videobuf2-core.c. It will be less if
> +	 * PAGE_SHIFT > 12, but then max_num_buffers will be clamped by
> +	 * videobuf2-core.c to MAX_BUFFER_INDEX.
> +	 */
> +	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		q->max_num_buffers = 64;
> +	if (buf_type == V4L2_BUF_TYPE_SDR_CAPTURE)
> +		q->max_num_buffers = 1024;
> +	if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE)
> +		q->max_num_buffers = 32768;
> +
>   	if (allocators[dev->inst] != 1)
>   		q->io_modes |= VB2_USERPTR;
>   	q->drv_priv = dev;


