Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D50C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWGafhfD6Ug0u9mIcjZPpr7PhiNBtxUIKEoUT/R6eIY=; b=JLppyMJjErjZjZIS3lynJx7OJE
	8feouoBtQsv+1R4XOR/kUDtqvWMyMuSKWlnHkxFc1yWiOo5KyhaNE5I2OEbMqCOnXhC84XGdD4lSK
	gfi7FfxRRAC3CTny+rhroxttxjHWt8K6nz6FtMw6iejD1keboOSLzV50qdYH4x3kkgQSOHQ1MT2FO
	R7oG3kmER8Q4Efnc/fgYS784IU6BTHoZKw2LJYc+Fe/Q0BS5yyR9nfirC6HU4KRuJFwpoHE6CQKoa
	rgMSKi6EP+Lc1IWS7oWP7BxGhRGo06NORYth0HJ/s/Qi2F74RiedkBVXAQOt8g1d9CQq9gsaod7zo
	FGEQA0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12HQ-005x81-2m;
	Thu, 09 Nov 2023 10:28:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12HN-005x6o-1R;
	Thu, 09 Nov 2023 10:28:54 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96104660747A;
	Thu,  9 Nov 2023 10:28:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525731;
	bh=YUI2716BL9MVVQKR0wOZgCkV9ZOFJ6M0hDxDFXWF8Os=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VduSF+4jFjCIiOCw9PdW4Xm9Hk4QGuGR5xTJ46FG+sS1ktnWtunI7b3tg/OqJUIPa
	 CuMwLN1yJisi8JFrb2oFENwUbCmWBKLb1Z/JLpAoMd2qfHCKRw2Hzr5RfAI2MqSAIE
	 uu+mi6eZpgyvFbmwviQUyIfssORhuPElWeooCByiYm7A0aOzYdipB8ZrOaKTr9V6Pc
	 90LWux9RryGgf/ag0l7/BfZoETFy1RY+igfM/q0qsWFi2eTxS0qBv9gVOvzGsbLnI8
	 u+KRjmP/Xtn1QtyMmKM3uoQ99HFgGYgBHGdazZZKdfZ+CAo29Hr//67/FMEN736MLB
	 if7F4ggybw02g==
Message-ID: <919d0ff4-2e8b-4481-970c-5b9aa0f882bb@collabora.com>
Date: Thu, 9 Nov 2023 11:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/56] media: verisilicon: Stop direct calls to queue
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
 <20231031163104.112469-30-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-30-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_022853_613204_B56E3594 
X-CRM114-Status: GOOD (  12.59  )
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

> CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>   drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
> index 64d6fb852ae9..8f8f17e671ce 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -195,7 +195,7 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>   	struct hantro_dev *vpu = ctx->dev;
>   	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>   	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
> -	unsigned int num_buffers = cap_queue->num_buffers;
> +	unsigned int num_buffers = vb2_get_num_buffers(cap_queue);
>   	struct v4l2_pix_format_mplane pix_mp;
>   	const struct hantro_fmt *fmt;
>   	unsigned int i, buf_size;


