Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0841C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdUVMvmoPrrbhBE5u65jfC9AYUyaFuz95hPjuAAP8t0=; b=fIeKud40DDv9VnatVUg/PQNQxm
	ESqF3WOBl3G6Y9ouQiGZ4o/79jS5jHwH9wy+u7Vp5t36l3RrOvgJ0DQx4JUt/Eh330pYsaPhZrF8L
	KcCpfMbJlzbDSyr9dvDMJM5QO0MyrxX09jm5gdQk/XPrTAAEUzDS/jzANwFEY/c6IYIlfwEZk6xiG
	vM6v8YUzofqvNtU5/ga7GxV2HIptLDKaYJzllJpC+Jv+OGoWE6RGwK2zzYI9ani3dbWTVv0KvwcsG
	NIpm0p/HDJ9ElaalO8HAnU28nOa8e10CX9kkuvVjo6FpyXPzEl7FPDE0Routybj0kPi7PWYz9uIFx
	ovpj9KBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11gd-005pWG-2r;
	Thu, 09 Nov 2023 09:50:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11ga-005pV8-0U;
	Thu, 09 Nov 2023 09:50:53 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4BDE56607410;
	Thu,  9 Nov 2023 09:50:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699523450;
	bh=wHz7BSLit9iJCz9Rq7LuGR5W9A9QLTf6UvjPIsXnOb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f5os2KkBrMxX7fKenpnv0S5pHDaJXkA071okahwLyfpXWIStY7bRsAF0CUa32phoX
	 8AHY53GexYwfCna9GKDz1KqAMNkk8NYWLVLbY70mI9Fbea7AU6wshtA7WPKHoFIM97
	 W0UOUcQiDQvQByogIiE39S0vAeZ+DBZCVxFeSZ/r00GOXZZBRDGJe5K1X2clGmzSwk
	 abZsQVkbsElbTHwhBMz0A5TrbFKMzUd8Nnr1lUkcnd18lIyxs0hknHz6Ew4gbEH0Ov
	 I4cKg3/FgYk5ijEx3i35e5TUbwsbYGjhMRPhq/gvXFdz+GdVl/UlYfHVyosmmkj9JQ
	 E9Daww0PvlHvA==
Message-ID: <fc11c361-7d5b-493f-96c8-8495293f2544@collabora.com>
Date: Thu, 9 Nov 2023 10:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 19/56] media: dvb-core: Do not initialize twice queue
 num_buffer field
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
 <20231031163104.112469-20-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-20-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_015052_323149_89707AD5 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Benjamin,

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> The above memset already zeroed all the ctx fields, it is useless
> to do it here again.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>   drivers/media/dvb-core/dvb_vb2.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 3a966fdf814c..a731b755a0b9 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -177,7 +177,6 @@ int dvb_vb2_init(struct dvb_vb2_ctx *ctx, const char *name, int nonblocking)
>   	q->ops = &dvb_vb2_qops;
>   	q->mem_ops = &vb2_vmalloc_memops;
>   	q->buf_ops = &dvb_vb2_buf_ops;
> -	q->num_buffers = 0;

A few lines above this one is this:

	q->is_output = 0;

Can this also be included in this (cleanup) patch?

Regards,

Andrzej

>   	ret = vb2_core_queue_init(q);
>   	if (ret) {
>   		ctx->state = DVB_VB2_STATE_NONE;


