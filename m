Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DF7C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8f4zM5qHLx1ksy5n8ob0vtS6sEALLBJDuHyVMhxRAs=; b=WkdM7JFfZXJlCMnxMuaMqTxMxD
	W+PSMBkBhDf1rGzHpqle42Y6MSlC5SZwzEOhG6uhvXY/MZr/G6amE6YLGKk4IfFKH5kq/7K8vqAb3
	beH45Y6v+OaxLfOyNk6QHAIAxL6ldRA9hPdP9HhxkXJH2YudeCdXZW3YDfPW94J4q4ErvUWM6zI/Q
	G784jpMPqpU1XYK7peGxEDMFPC1I/U5+9OX2bJC81bEhYUiCFdI9/WJk6jQhqTGGmsvGwQKsoa6b6
	K02MDWwCPnFt3tOd45agRMeCVLia+In0O8uaWRDmfl5ItxJFfpBY5r1YquG6mFpJXtGwfXnaQk432
	7scUGkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11MX-005mkH-01;
	Thu, 09 Nov 2023 09:30:09 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11MT-005miy-2Z;
	Thu, 09 Nov 2023 09:30:07 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D57B6607410;
	Thu,  9 Nov 2023 09:30:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699522203;
	bh=9DyG7QadW/ZB77/AoaK7eHY4Fj3oy5z9XOUorXxwg9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S4rtDO/y59Vlxzgq+9apsVQ+c0wLEonjrqKtts9FP/zBEeFqFUQ3t/yUeGkMA1NBl
	 mMGxINOPTbW55hhfHMMdk04M7yfVHd8dBtvbF+ExamdW7pYgsqohm+OyICXc7e1qRN
	 F75S7r/aXl7CECgk2bH2+sOPnQ+ik3eZdmKzxTAQtoYr7ZV81MSVYPfPunWB4jBEvS
	 MyNgISo6khl5tK1iS4f4Q4sIQqynZJKFH0YTq2CZTmlU1jyrfI6EvzHgcAqeinL8kI
	 xjxbqc3pGRoLPg3AhuajlyvcQmTmhO2CZjKcc+koKP1JXPV9v8OYqOPHAHgZ2ZSvDc
	 bKujPujjg4Gjw==
Message-ID: <1d9c20f8-9735-4957-b718-7e0835ba7096@collabora.com>
Date: Thu, 9 Nov 2023 10:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 14/56] media: sti: hva: Use vb2_get_buffer() instead
 of directly access to buffers array
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
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-15-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-15-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_013005_989847_78D37CE5 
X-CRM114-Status: GOOD (  19.07  )
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
> Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
> This allows us to change the type of the bufs in the future.
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer so check the return value of all of them.
> Remove index range test since it is done by vb2_get_buffer().

Actually, the patch uses vb2_get_buffer() instead of using vb2_get_buffer().
IOW vb2_get_buffer() continues to be used before and after this patch is applied.

I'd rather reformulate the commit message body to say that we remove
index check because it is already performed by vb2_get_buffer(), but
introduce a check for a NULL result.

Regards,

Andrzej

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
> ---
>   drivers/media/platform/st/sti/hva/hva-v4l2.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
> index 3a848ca32a0e..cfe83e9dc01b 100644
> --- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
> +++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
> @@ -569,14 +569,11 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
>   		struct vb2_buffer *vb2_buf;
>   
>   		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, buf->type);
> -
> -		if (buf->index >= vq->num_buffers) {
> -			dev_dbg(dev, "%s buffer index %d out of range (%d)\n",
> -				ctx->name, buf->index, vq->num_buffers);
> +		vb2_buf = vb2_get_buffer(vq, buf->index);
> +		if (!vb2_buf) {
> +			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
>   			return -EINVAL;
>   		}
> -
> -		vb2_buf = vb2_get_buffer(vq, buf->index);
>   		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
>   		stream->bytesused = buf->bytesused;
>   	}


