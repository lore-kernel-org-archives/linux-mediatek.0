Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22F9C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycliup3zgyl6TNuivdoMpgHTL30z0+2rvkzn6P1sQ+w=; b=qLvE4Zma0lVl3IKotjOSx5U1kp
	5ar2ZWUQdVuCC7118kYOtZ1hz0u6jczUcj13/ft8V8d3FrioK7JT6b3fgZ7LlDNH4VUI5RESD/pKy
	T5lYjybz5YJisIIQncL+BeX5Tg0VYtEfT6xsZ9AOealTKxTcsRvY1Cfx/saviaMcZ+5z/pt05nfz8
	4cxOoaA94Wpe9QnHUeab79aVD4DrhgCq/xIF80zvqiXNCe+Rt3L5p0y0tOu1N5CI8Q0kgdaybfghr
	XaZCz1ju+lm4bh3oIuvnetwefphZsBpXjGFCMnoLWBYDTbZLkU6ZIsS8D0d6T8LCOeN1i28cI1kZ0
	DNQi1pzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11Fm-005lfr-2b;
	Thu, 09 Nov 2023 09:23:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11Fj-005lee-27;
	Thu, 09 Nov 2023 09:23:09 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA8AD6607410;
	Thu,  9 Nov 2023 09:23:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699521786;
	bh=79QW7iQquBnwYm14N3AIvehKWVXP1fEi05nVMlo3R2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d7i3viPTau1TXKkUDV057Kz7FIJc20TwGqpUXPN+RkCqA1YQ3Tm6xQQbJTKXbrGk7
	 vDybVoh3QyJP++z4JQrE7N5ofEZhnFMCP4NPewB8oI6+6QvA2gEWidVxXZh0YackUg
	 d3SkTIWIUe3tGLxgwnFadAiSuq0bRQVUQ6OjhZz/JbKfsaUuA4aRa7fhSu4PkrAdP9
	 uMZsnimIy3G6B/BMeub95Bk+EN7LtM8m6Q/iKTrnobb2jkAeue+VYticlFOdZlx3Sk
	 EGMRuhtS2jn2RN2fJRVWJcyHl7TTombrj3pnJKbUtEHRzuJHDRwWbUW2o+jefxNNVw
	 wjGXQQbgfVWrg==
Message-ID: <aca318c9-8d6d-4c04-afdf-8eacb80f79d8@collabora.com>
Date: Thu, 9 Nov 2023 10:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 13/56] media: mediatek: vcodec: Stop direct calls to
 queue num_buffers field
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
 <20231031163104.112469-14-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-14-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_012307_827755_252A0A56 
X-CRM114-Status: GOOD (  14.97  )
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

Sorry for the noise, I made a typo in my email address. Resending with a proper one.

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Bin Liu <bin.liu@mediatek.com>
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index eb381fa6e7d1..181884e798fd 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -912,7 +912,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>   	return 0;
>   
>   err_start_stream:
> -	for (i = 0; i < q->num_buffers; ++i) {
> +	for (i = 0; i < vb2_get_num_buffers(q); ++i) {
>   		struct vb2_buffer *buf = vb2_get_buffer(q, i);
>   
>   		/*


