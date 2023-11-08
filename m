Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0818FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTR9KPyf0npmQKTp+fodwrraNfKxnzcBrGn46op0drs=; b=g7oPJZwA9B1QAjPinAQU3PAf9/
	tosTD/SV8y3KnIMNOgQrmMgIFMKFqVzeh2XKVz7sEqRIkEYzMeMsHMWuCIRrNozRIni197M4H22c2
	bWCLYkuTvJz/xC5585bKv6e1ZUWOR55bCZvAzN02ovVXveyNYmaT3MPV3lBACxMqWMZ2eFtLg3GbI
	vCG9NtAQzZaZG7J5KAMXQnYaId0hVYU+CF1dyMkiKf2iwyX0IGuYIrJ9OBKGtuNFrU6l2OO9IwGSX
	Miv4sL0nchpMoXsW+vSYvftivycJyrhDjt5NI4Bk4GreUHLePCaMKOyqJB1ViZT/hK85EhKUrJxER
	HjT7TxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0luW-004M5p-0Q;
	Wed, 08 Nov 2023 17:00:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0luS-004M53-2J;
	Wed, 08 Nov 2023 17:00:10 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 47EA6660746B;
	Wed,  8 Nov 2023 17:00:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699462807;
	bh=v1ZDZ92VUQvwcoBTo3YLDcAwJdq/9mIJJULop13aVjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DPxbTyaMPU2PQPpXxDwVbUyxVY/ySm7+tshhCBnMxktHXu5Kh0l9Afdgu0EnxdUWH
	 floksg8TAOJSiHZxMPD3IYNNlfIhDPj+4lRd+l4r+20sstKqxMtm3uaxuEUpH4HV8H
	 bj2caCJtxaR2A4JrNmbREt4LXd1zWiGhZXCmehnFWJbX4ZbbhHcdDNwREOs6B+53J2
	 8A9E0grogHDLtSbXuAUXzTS13taqL3kN8EyD44HLM5mYgfN6dF4940IlqqKM5oUBox
	 TtXAkleyJc8CCq31npcCizjNq+A0hjdLzCUGVCdmIX2A48L+pzoQVP8s4mHkzKVHds
	 c7OVd7EwTfbkg==
Message-ID: <900d7ba8-6b0c-412a-936c-184decba7566@collabora.com>
Date: Wed, 8 Nov 2023 18:00:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 11/56] media: mediatek: jpeg: Use vb2_get_buffer()
 instead of directly access to buffers array
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
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-12-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-12-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_090008_891390_22058255 
X-CRM114-Status: GOOD (  15.23  )
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
> Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
> This allows us to change the type of the bufs in the future.
> After each call to vb2_get_buffer() we need to be sure that we get
> a valid pointer so check the return value of all of them.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Bin Liu <bin.liu@mediatek.com>
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 7194f88edc0f..73a063b1569b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -598,12 +598,11 @@ static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
>   		goto end;
>   
>   	vq = v4l2_m2m_get_vq(fh->m2m_ctx, buf->type);
> -	if (buf->index >= vq->num_buffers) {
> -		dev_err(ctx->jpeg->dev, "buffer index out of range\n");
> +	vb = vb2_get_buffer(vq, buf->index);
> +	if (!vb) {
> +		dev_err(ctx->jpeg->dev, "buffer not found\n");
>   		return -EINVAL;
>   	}
> -
> -	vb = vq->bufs[buf->index];
>   	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(vb);
>   	jpeg_src_buf->bs_size = buf->m.planes[0].bytesused;
>   


