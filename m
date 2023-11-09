Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7269C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 14:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRGGvcMa7sRus7II7hW3Csnr1xF+BQGI3C/Dm0lE38A=; b=SHKLsDOGxC5+BoIg69LFcpMKJP
	WRwCx7YnOtTaAVzEBX4rUZ49ePoVlM2Nqsl6b5/SHqcDX/IP5hFtahWPwHANYkxVcYh7Ip4Q8E1Tv
	SW+UX+/E+HkBYmSBtaKu/5Hz1kdqvgBwuvxLjTFPql04zppXx7waVSP9UdZxG5dUfftzPbxSgYVnR
	7jDqDoQiXt1//sT+fxEWrlcT9z4zZBSec8z1ypekLTofKJNkHn2ZsHCzgPAASkqYSPhYnBwOXy8oO
	W3cNr+j7te7BQuVnOkCeeySAvtdU87iEwxFvpxQTKx6SqBcOtUSH/4ZLZifFmCw2ph3AINgqu7yTE
	Ihgnww9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r15lx-006T2I-1T;
	Thu, 09 Nov 2023 14:12:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r15lt-006T0w-25;
	Thu, 09 Nov 2023 14:12:39 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A7236660739D;
	Thu,  9 Nov 2023 14:12:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699539156;
	bh=bHsPXcPq+RCxN5m6no2vYCXtGthGOFXffIvEuss0WaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NLuvksTyGejXV9sdJMh5tC3X3EILGdZx7JOLHtkjqzvKQ3PL4BSf6mYdIJ7FKI30m
	 rMh4dIyDlhnunSIkJ8s6NjI4lfqp/zXcSG28zGAuDeaTLFZPzE40mcEAWUASYHATBa
	 QbRzO5gBq0o/kbUh0knpprCOQbTygboTYfIvHGmxhtXd6F6s3FhngHg7en/XzWeJTc
	 aQYUVjVNJLT4k7J25i+aaWNgjsKMtcBmEHtLCKaNdFFHxKPC97grku+QB19Tw0N1Yc
	 Dy7666VhwjTj4anJuDh1NtIg7zZvVjI5Xz8jN1tn4wDjBKwsEYJtoXGCdhLNQwKPTe
	 lcwYPysIvoRSQ==
Message-ID: <9f0edfe5-0bde-43ca-9238-2c84897c56a8@collabora.com>
Date: Thu, 9 Nov 2023 15:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 48/56] media: verisilicon: Store chroma and motion
 vectors offset
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
 <20231031163104.112469-49-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-49-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_061237_883616_5CD5F044 
X-CRM114-Status: GOOD (  13.55  )
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
> Store computed values of chroma and motion vectors offset because
> they depends on width and height values which change if the resolution
> change.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> CC: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/media/platform/verisilicon/hantro.h            | 2 ++
>   drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c | 6 ++++--
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
> index 0948b04a9f8d..6f5eb975d0e3 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -328,6 +328,8 @@ struct hantro_vp9_decoded_buffer_info {
>   	/* Info needed when the decoded frame serves as a reference frame. */
>   	unsigned short width;
>   	unsigned short height;
> +	size_t chroma_offset;
> +	size_t mv_offset;
>   	u32 bit_depth : 4;
>   };
>   
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> index 6fc4b555517f..6db1c32fce4d 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -158,9 +158,11 @@ static void config_output(struct hantro_ctx *ctx,
>   
>   	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
>   	hantro_write_addr(ctx->dev, G2_OUT_CHROMA_ADDR, chroma_addr);
> +	dst->vp9.chroma_offset = chroma_offset(ctx, dec_params);
>   
>   	mv_addr = luma_addr + mv_offset(ctx, dec_params);
>   	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, mv_addr);
> +	dst->vp9.mv_offset = mv_offset(ctx, dec_params);
>   }
>   
>   struct hantro_vp9_ref_reg {
> @@ -195,7 +197,7 @@ static void config_ref(struct hantro_ctx *ctx,
>   	luma_addr = hantro_get_dec_buf_addr(ctx, &buf->base.vb.vb2_buf);
>   	hantro_write_addr(ctx->dev, ref_reg->y_base, luma_addr);
>   
> -	chroma_addr = luma_addr + chroma_offset(ctx, dec_params);
> +	chroma_addr = luma_addr + buf->vp9.chroma_offset;
>   	hantro_write_addr(ctx->dev, ref_reg->c_base, chroma_addr);
>   }
>   
> @@ -238,7 +240,7 @@ static void config_ref_registers(struct hantro_ctx *ctx,
>   	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params->alt_frame_ts);
>   
>   	mv_addr = hantro_get_dec_buf_addr(ctx, &mv_ref->base.vb.vb2_buf) +
> -		  mv_offset(ctx, dec_params);
> +		  mv_ref->vp9.mv_offset;
>   	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_addr);
>   
>   	hantro_reg_write(ctx->dev, &vp9_last_sign_bias,


