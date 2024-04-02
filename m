Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F13CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1ZaxICN7ToIIozbqtvOwNxujfW1ijdhvFxXA7sozGs=; b=Gq7N+51RJ0XaEL5aDdhK8RpOuA
	2M7JqdIRA8d4ZAEpq7tIXPtgb1UHEjWfEYmS98cd/9q0mQptTcYh9UmkuM9VnoYznhQc+LkNIBj24
	U04Suk5E/lHYAWVs0JyxXPSf/bvyhwxEu9xnyxJubX10+OgMW1m10oz3PKGfdT4lYsg0hwavbIWum
	i8xPm7YkuKUEbHM6FCE61ooIaJkQt0+phfngDKGErbNhzb78faEyEibMv16oJwFsVub0WWhvkHGMs
	vbGxs1SchYv7pAJg7Wt5piZdBe4EHvEpFSEkOjG9sqk43DOqez0JCcDrTuBNZM/1FZmTTYhCv+f1f
	mo3Ev6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rranc-0000000AVev-2Kvu;
	Tue, 02 Apr 2024 09:51:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rranL-0000000AVYq-0J0F;
	Tue, 02 Apr 2024 09:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712051455;
	bh=vw9cJNl0LdiDuqpsolVN3qVEokjCyQNhVMfH1BeHA1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=35rLm1S57yMgRE+kXJmLpYmkm6SUggu4hiypnYM7pxO4Qzz9MUkxoEoG37wJDSR6Z
	 I8BjXG4rZv7tpL4/HMeydnOgGt0ywMPEuDn11KRvHZRlJA7NhpvZfYTrjiV5/T/m13
	 2HD16VV0x41MOn+n1To3JOlICC43sCB0n0bH0hAIRBSAvH16r+yKjZi8o+m/+mavOx
	 69yABYjYrxphibinRyMHdWhSbfS/EbQaN0yWq2DFey5Kd4xJVO5OEDRCqDu9CYTVIe
	 gVnRQusPVg3hFVlyOBPtEtBJdiqTGIwN2X4A4JUTkh2jWt+y+9xfXbF3M4ah0i0/gZ
	 mXMBr2WexXVpQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D7B0737820EF;
	Tue,  2 Apr 2024 09:50:53 +0000 (UTC)
Message-ID: <4949bd54-8c32-4490-ab19-d38796d29ac1@collabora.com>
Date: Tue, 2 Apr 2024 11:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: mediatek: vcodec: fix h264 multi statless
 decoder smatch warning
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240229095611.6698-1-yunfei.dong@mediatek.com>
 <20240229095611.6698-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240229095611.6698-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_025119_222867_78A9B63E 
X-CRM114-Status: GOOD (  14.74  )
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

Il 29/02/24 10:56, Yunfei Dong ha scritto:
> Fix smatch static checker warning for vdec_h264_req_multi_if.c.
> Leading to kernel crash when fb is NULL.
> 
> Fixes: 397edc703a10 ("media: mediatek: vcodec: add h264 decoder")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c         | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> index 0e741e0dc8ba..ab8e708e0df1 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> @@ -724,11 +724,16 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
>   		return vpu_dec_reset(vpu);
>   
>   	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
> +	if (!fb) {
> +		mtk_vdec_err(inst->ctx, "fb buffer is NULL");
> +		return -EBUSY;
> +	}
> +
>   	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>   	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
>   
> -	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
> -	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;

You're changing the behavior here, can you please explain why this change is valid
into the commit description?

Thanks,
Angelo

> +	y_fb_dma = (u64)fb->base_y.dma_addr;
> +	c_fb_dma = (u64)fb->base_c.dma_addr;
>   	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
>   		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
>   



