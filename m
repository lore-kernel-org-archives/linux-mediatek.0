Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0771C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 09:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4SHZJGMSH/mzKJLc/gAi+Wvt/E2Whv1alERDoBvvtA=; b=LsQeHAb81XmwfB81UC2mskb82p
	qg0sKffIqyzTWx3wZXMUcS/tfhSejX4VmcNtP74xENU6zX3jCX6Yqe1LqkeuRiPcZuda2Mzuepppg
	CuP4a73ESwyaDySCwaKxoODgYo8n5G8a8vwZ5OvtGJxLNhxWRciUy9kcjRE3QHzaV57N3Nx1OeTB6
	P13TG/8ieoVE4kOGEro8QJyqNKed1wFb68QE7GsMcC0uOeGW6teJcbUJMOTrfUDdzzvBWYFCqfOIe
	6mYrhUAT4uUt3wF+rMIRL69kwQrIWnlP4igOV85XYOcvOFIPqOu3exk13Uw0+WjVIwomLnWn9B7MR
	XrJUQDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Nka-008AyG-36;
	Fri, 10 Nov 2023 09:24:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1NkX-008AxK-0Z;
	Fri, 10 Nov 2023 09:24:26 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D05AD66073D3;
	Fri, 10 Nov 2023 09:24:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699608260;
	bh=28TPHHA9Iel9THKWFs6QPU/6HNkFryi8SVAuj58Nqhc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QQOWpE7gIbxb1eJj9TsBokiPp9dEbYBqhq9+G9cWRilgRPrpk7MU02BYltetkXSk/
	 5BBflBVkUunL9iALpYBxuao1sPI0Q0aS7A0aSPgxS3KNLTAY3f9q5HtWtekNxdlxCs
	 b4lmWmO8/xeay6hrctKOJk0Qv8XfGGXooG5le9Z+9I3CrQLYy74zgbELoURGK0G//+
	 iqC05s4VtTHUOGJNffRiYcrzcVzRWRVKhJwofs7otFKZfQZ1z4NpEOH7yOH5sU9xgT
	 48U8RLJYNt70Rz2PYT97PxMuKcO62szxM11D+7mQTbZzq2j11OxJg4LrzXKj92tSZW
	 6OUcHPZhSbbjw==
Message-ID: <8e7629ca-eb6c-41d4-af3e-9938397a08c0@collabora.com>
Date: Fri, 10 Nov 2023 10:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 14/56] media: sti: hva: Remove useless check
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
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
 <20231109163512.179524-15-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231109163512.179524-15-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_012425_433044_FAD408A1 
X-CRM114-Status: GOOD (  13.81  )
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
> Remove index range test since it is done by vb2_get_buffer().
> vb2_get_buffer() can return a NULL pointer so we need the return
> value.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

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


