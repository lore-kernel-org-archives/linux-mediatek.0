Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1930BCE7A89
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKcdicweB9SW4tRwHH9GymH3cRH2ykJJRNqn7NSBMrs=; b=m+rMClP4QrNPvzer7XE/4YoT0K
	kh6KL0HCrE66Q+fhMxZZNILl3fap8PR+o4MVnD7pjz2f6ifxaICqGNkmlo8rZi5GzLt9U+Ehd+tf6
	XWyP0B2YZNdSQoULCvqs3sZ7TN6Zg66uE9XihUoZ1mjXXzLDgCV6E3IWEq1tF21OD6rQAPpDDTZA6
	++2QhMrnE3k9nNoEg9nxi30Uwy740RatWfaFb7pcRv3qDUJs/1sgOelqiX4WsBUIUf45qEi5D4G7q
	tHpYb5P6n4FPRqaQiGXHt+pnn2jklDMWA8YKkx+K7fIkBAN/iSzJaPOul4E3yiMMFszfltVHxZke1
	nnPW8j8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhfA-00DpCR-05;
	Mon, 25 Sep 2023 09:13:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhf5-00DpA6-1i;
	Mon, 25 Sep 2023 09:13:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7861366072FF;
	Mon, 25 Sep 2023 10:13:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695633226;
	bh=G+i7ey/TdIsiQ6r9kJEi+gBjHgvwqjQdIaKtDxCh6uI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TH6G67XYd7ZH2TraAeKivPSL/LNq8WEJumbUczTJjdsPKV09F0whFgko0ItKOseW8
	 DMVWjJwds4yXF3QsDBpPFfXkbSXf6vzdAWH7cpXxp4NTKXp+tdRL60WPZ4c4A2llaZ
	 3FCp+8s8rmkN9AjD28u2BxlGSNDc7tcMxxWgi6tjaa4x6hz8kIetv+Fh2lq/zwHNzd
	 P+Hcr0u8tt/0b1fy/BM7yM6iaVSU8W7OuqmEyA2GbnR/DSdFrSHJbGC/3sARlcqOs1
	 LYCdOykCqZbhv8Wkmve+aCYCLW189tDHEm0fkpXpEV1iZlk+l5uYX2sRnK9tJc0nt7
	 ubZ3VmW6RaZ6Q==
Message-ID: <6df2b962-fa21-d58f-7f39-fe46d049f97e@collabora.com>
Date: Mon, 25 Sep 2023 11:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] media: mediatek: vcodec: add encoder power management
 helper functions
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20230925040200.18220-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230925040200.18220-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_021351_845529_70A71981 
X-CRM114-Status: GOOD (  20.82  )
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

Il 25/09/23 06:02, Irui Wang ha scritto:
> Remove PM functions at start/stop streaming, add PM helper functions
> to get PM before encoding frame start and put PM after encoding frame
> done. Meanwhile, remove unnecessary clock operations.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>   .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 21 +++----------------
>   .../vcodec/encoder/mtk_vcodec_enc_pm.c        | 18 ++++++++++++++++
>   .../vcodec/encoder/mtk_vcodec_enc_pm.h        |  3 ++-
>   .../mediatek/vcodec/encoder/venc_drv_if.c     |  8 ++-----
>   4 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index 04948d3eb011..eb381fa6e7d1 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -866,7 +866,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>   {
>   	struct mtk_vcodec_enc_ctx *ctx = vb2_get_drv_priv(q);
>   	struct venc_enc_param param;
> -	int ret, pm_ret;
> +	int ret;
>   	int i;
>   
>   	/* Once state turn into MTK_STATE_ABORT, we need stop_streaming
> @@ -886,18 +886,12 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>   			return 0;
>   	}
>   
> -	ret = pm_runtime_resume_and_get(&ctx->dev->plat_dev->dev);
> -	if (ret < 0) {
> -		mtk_v4l2_venc_err(ctx, "pm_runtime_resume_and_get fail %d", ret);
> -		goto err_start_stream;
> -	}
> -
>   	mtk_venc_set_param(ctx, &param);
>   	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
>   	if (ret) {
>   		mtk_v4l2_venc_err(ctx, "venc_if_set_param failed=%d", ret);
>   		ctx->state = MTK_STATE_ABORT;
> -		goto err_set_param;
> +		goto err_start_stream;
>   	}
>   	ctx->param_change = MTK_ENCODE_PARAM_NONE;
>   
> @@ -910,18 +904,13 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>   		if (ret) {
>   			mtk_v4l2_venc_err(ctx, "venc_if_set_param failed=%d", ret);
>   			ctx->state = MTK_STATE_ABORT;
> -			goto err_set_param;
> +			goto err_start_stream;
>   		}
>   		ctx->state = MTK_STATE_HEADER;
>   	}
>   
>   	return 0;
>   
> -err_set_param:
> -	pm_ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
> -	if (pm_ret < 0)
> -		mtk_v4l2_venc_err(ctx, "pm_runtime_put fail %d", pm_ret);
> -
>   err_start_stream:
>   	for (i = 0; i < q->num_buffers; ++i) {
>   		struct vb2_buffer *buf = vb2_get_buffer(q, i);
> @@ -1004,10 +993,6 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>   	if (ret)
>   		mtk_v4l2_venc_err(ctx, "venc_if_deinit failed=%d", ret);
>   
> -	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
> -	if (ret < 0)
> -		mtk_v4l2_venc_err(ctx, "pm_runtime_put fail %d", ret);
> -
>   	ctx->state = MTK_STATE_FREE;
>   }
>   
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
> index 3fce936e61b9..a22b7dfc656e 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
> @@ -58,6 +58,24 @@ int mtk_vcodec_init_enc_clk(struct mtk_vcodec_enc_dev *mtkdev)
>   	return 0;
>   }
>   
> +void mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(pm->dev);
> +	if (ret)
> +		dev_err(pm->dev, "pm_runtime_resume_and_get fail: %d", ret);
> +}

Those are exactly the same functions as the DECODER counterpart... instead
of duplicating them, can you please simply commonize the functions in
mtk_vcodec_dec_pm.c ?

Regards,
Angelo

> +
> +void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_put(pm->dev);
> +	if (ret && ret != -EAGAIN)
> +		dev_err(pm->dev, "pm_runtime_put fail %d", ret);
> +}
> +
>   void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>   {
>   	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
> index e50be0575190..157ea08ba9e3 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
> @@ -10,7 +10,8 @@
>   #include "mtk_vcodec_enc_drv.h"
>   
>   int mtk_vcodec_init_enc_clk(struct mtk_vcodec_enc_dev *dev);
> -
> +void mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm);
> +void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm);
>   void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
>   void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
>   
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
> index 1bdaecdd64a7..c402a686f3cb 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
> @@ -32,9 +32,7 @@ int venc_if_init(struct mtk_vcodec_enc_ctx *ctx, unsigned int fourcc)
>   	}
>   
>   	mtk_venc_lock(ctx);
> -	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
>   	ret = ctx->enc_if->init(ctx);
> -	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
>   	mtk_venc_unlock(ctx);
>   
>   	return ret;
> @@ -46,9 +44,7 @@ int venc_if_set_param(struct mtk_vcodec_enc_ctx *ctx,
>   	int ret = 0;
>   
>   	mtk_venc_lock(ctx);
> -	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
>   	ret = ctx->enc_if->set_param(ctx->drv_handle, type, in);
> -	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
>   	mtk_venc_unlock(ctx);
>   
>   	return ret;
> @@ -68,10 +64,12 @@ int venc_if_encode(struct mtk_vcodec_enc_ctx *ctx,
>   	ctx->dev->curr_ctx = ctx;
>   	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
>   
> +	mtk_vcodec_enc_pw_on(&ctx->dev->pm);
>   	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
>   	ret = ctx->enc_if->encode(ctx->drv_handle, opt, frm_buf,
>   				  bs_buf, result);
>   	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
> +	mtk_vcodec_enc_pw_off(&ctx->dev->pm);
>   
>   	spin_lock_irqsave(&ctx->dev->irqlock, flags);
>   	ctx->dev->curr_ctx = NULL;
> @@ -89,9 +87,7 @@ int venc_if_deinit(struct mtk_vcodec_enc_ctx *ctx)
>   		return 0;
>   
>   	mtk_venc_lock(ctx);
> -	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
>   	ret = ctx->enc_if->deinit(ctx->drv_handle);
> -	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
>   	mtk_venc_unlock(ctx);
>   
>   	ctx->drv_handle = NULL;


