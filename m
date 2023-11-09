Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8886FC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HngeoqDz22zss4NWFzYfJY8eqlbApQFQ9edszxEFh+Y=; b=mUjOXx2UfofNCXTZT4phIw6UsI
	+g12sGC/qTFs5Mij0ZAVMselYgSBmUogWnxDlrT3dYGzAodd6W57A5N6jAsy9DQ+ypjJkzZAv5cbJ
	fp1ynxmtEctZjtOu//UV8NLrVI8VX4JQJ5pLqmq8P0+/Z8xQH00yhnV2d1Azp79QT59JRxJaVVbJw
	oCTF0mKZHavZUo+FO/c+xQtTMk88txFqX+3ljSDWG5BjLYXWc1X+LJpoF6IS26EQn4OJ175hVS0R4
	a75Q4MAp4Gvr0A59FkBpi4Zzs/xrn3w0TE7rQ3Nqp3HiVkQ/WfVEAIoxPQrlsV3I0PMUC2PeMlAOW
	1gz12GYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1334-0062k3-1v;
	Thu, 09 Nov 2023 11:18:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1330-0062j5-3D;
	Thu, 09 Nov 2023 11:18:08 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C5E86607421;
	Thu,  9 Nov 2023 11:18:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699528684;
	bh=I504Z+CG3YiZx4Vj5jJplJQXnwlNFB6qyZMvx/v7OwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LFpzg58qWNb9jJefSQAPJdRVV60nbfvp7R2wUIzcSIW2N9QkRCLFmKRwfrDgu8Alg
	 4W3q4maR60goIRKz1R9N53+n+g9fjlA4VtdRllKHxdLnpqywQtaROhkG13EPGidoqB
	 qDdL823VyFRpt7hNMzrpQQohW5EbNL1yYp868/cq75IGLDjkgBKloPw1BSC3ZxPMcy
	 UbnQRRIG+ax5xnlMokeOMPk/F7aispaGNIRmMwcOtuyFV8W3Al+k7TeZ/OR9II0HWJ
	 h7WSGoINBSqOTR7wId9VmZnEu2Ul/GxA5TqnW0fHMr0NYdHnUL2Qkkd0TOVO0Apd/a
	 K0BWxOR+w8cGQ==
Message-ID: <20023047-775a-4bd3-8bdb-932347e91c66@collabora.com>
Date: Thu, 9 Nov 2023 12:17:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 32/56] media: meson: vdec: Stop direct calls to queue
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
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-33-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-33-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_031807_187623_D5E08562 
X-CRM114-Status: GOOD (  16.75  )
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

> CC: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/staging/media/meson/vdec/vdec.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 219185aaa588..1e2369f104c8 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -167,22 +167,23 @@ static void process_num_buffers(struct vb2_queue *q,
>   				bool is_reqbufs)
>   {
>   	const struct amvdec_format *fmt_out = sess->fmt_out;
> -	unsigned int buffers_total = q->num_buffers + *num_buffers;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +	unsigned int buffers_total = q_num_bufs + *num_buffers;
>   	u32 min_buf_capture = v4l2_ctrl_g_ctrl(sess->ctrl_min_buf_capture);
>   
> -	if (q->num_buffers + *num_buffers < min_buf_capture)
> -		*num_buffers = min_buf_capture - q->num_buffers;
> +	if (q_num_bufs + *num_buffers < min_buf_capture)
> +		*num_buffers = min_buf_capture - q_num_bufs;
>   	if (is_reqbufs && buffers_total < fmt_out->min_buffers)
> -		*num_buffers = fmt_out->min_buffers - q->num_buffers;
> +		*num_buffers = fmt_out->min_buffers - q_num_bufs;
>   	if (buffers_total > fmt_out->max_buffers)
> -		*num_buffers = fmt_out->max_buffers - q->num_buffers;
> +		*num_buffers = fmt_out->max_buffers - q_num_bufs;
>   
>   	/* We need to program the complete CAPTURE buffer list
>   	 * in registers during start_streaming, and the firmwares
>   	 * are free to choose any of them to write frames to. As such,
>   	 * we need all of them to be queued into the driver
>   	 */
> -	sess->num_dst_bufs = q->num_buffers + *num_buffers;
> +	sess->num_dst_bufs = q_num_bufs + *num_buffers;
>   	q->min_buffers_needed = max(fmt_out->min_buffers, sess->num_dst_bufs);
>   }
>   


