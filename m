Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B323EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IehScu8JFBu/y1LSXhAD2UHRRmwgOIe8luyVoFrS6I=; b=EhUY92kWCCNPw3pWrNonaRKnte
	w35HexVgZFOe8HKYuw5BScLMWvIt3qFYov+oaBvhU2a6o9YubcBCYOsmMb3kcfKkxGHiCHtdZiKCQ
	Aul5BSbeplHsshYLaUZ4hPWXAqJAi1ozuOI5bYRWVdXlcndPUOWYGm4oY93m5Ic6TzcyCFdj4pNv2
	gtMurPKni/czEByf1QHg/Jvp4c7R7otHp8a47V5TbENhL9ffSLZ9pxSyPcTnf6WxHAmVYROojPNR8
	HqttHzb+YB3NLdodHwbVY5kmseMHJ3e8RVebpk9G6nTutzRP6AXGqfltLUYKmSyWGK7aTmxJ9btMU
	utMuk4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9k91-002qlQ-8v; Fri, 08 Jul 2022 09:19:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9k8y-002qk9-Uh
	for linux-mediatek@lists.infradead.org; Fri, 08 Jul 2022 09:19:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32CE6626F5;
	Fri,  8 Jul 2022 09:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796F9C341CD;
	Fri,  8 Jul 2022 09:19:21 +0000 (UTC)
Message-ID: <daf5e3e6-8a13-3c16-5fa6-9c4e69883c49@xs4all.nl>
Date: Fri, 8 Jul 2022 11:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/6] media: mediatek: vcodec: Revert driver name change in
 encoder capabilities
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220701105237.932332-1-wenst@chromium.org>
 <20220701105237.932332-5-wenst@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220701105237.932332-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_021925_113872_9C6FBA99 
X-CRM114-Status: GOOD (  24.05  )
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



On 7/1/22 12:52, Chen-Yu Tsai wrote:
> This partially reverts commit fd9f8050e355d7fd1e126cd207b06c96cde7f783.
> 
> The driver name field should contain the actual driver name, not some
> otherwise unused string macro from the driver. To make this clear,
> copy the name from the driver's name field.
> 
> Fixes: fd9f8050e355 ("media: mediatek: vcodec: Change encoder v4l2 capability value")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 +
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> index 4140b4dd85bf..dc6aada882d9 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> @@ -22,6 +22,7 @@
>  #define MTK_VCODEC_DRV_NAME	"mtk_vcodec_drv"

Note that this patch removes the last user of this define, so
you can drop that define as well.

>  #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
>  #define MTK_VCODEC_ENC_NAME	"mtk-vcodec-enc"
> +#define MTK_PLATFORM_STR	"platform:mt8173"

Why add this?

>  
>  #define MTK_VCODEC_MAX_PLANES	3
>  #define MTK_V4L2_BENCHMARK	0
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index ccc753074816..30aac54d97fa 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -232,11 +232,13 @@ static int mtk_vcodec_enc_get_chip_name(void *priv)
>  static int vidioc_venc_querycap(struct file *file, void *priv,
>  				struct v4l2_capability *cap)
>  {
> +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	struct device *dev = &ctx->dev->plat_dev->dev;
>  	int platform_name = mtk_vcodec_enc_get_chip_name(priv);
>  
> -	strscpy(cap->driver, MTK_VCODEC_DRV_NAME, sizeof(cap->driver));
> -	strscpy(cap->card, MTK_VCODEC_ENC_NAME, sizeof(cap->card));
> +	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
>  	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-enc", platform_name);
> +	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));

The next patch changes cap->card again, and leaves MTK_PLATFORM_STR unused.

>  
>  	return 0;
>  }

I think it makes more sense to combine patches 1-3 and 4-6 into single
patches, one for the decoder, one for the encoder. It's easier to follow
since they all touch on the same querycap function.

Regards,

	Hans

