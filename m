Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC4FC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1vg4m/VO0MJixxSFQxYroHS6wmKORiBS3+pI5CUOeA=; b=HAOmLNlSQyd4nx3/P5xn8WOOIf
	KszeM3WuJnr1pe+VF/K/TlMbR7QnC0GuewvUsNzIoT2WYb6QfiVpURizBE4eQaZ9fF2uo68/3WpM9
	SyFjYQnNqP/1Rx901j/tjTCTF0vZ6gIr3BSdTEzhWgBEqfSfmv4Qj7n1omWy64lhcTpt1w9ZOgJlc
	kGGZRqswtcd7hjbFP4k/ZKOxzDdgkbGdaYEvVq7vLL0L/paJwRqK2Le4SD8zM0fKmnNQRuxeTOeV3
	B6/Bt98fK50wEymh//+mz+XBcdBZW06SDuPcECCcRUHSQCWqgnvxBI7eAUUaYAcc8JukLMEwniQ+/
	qH+zesHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps0Zc-006W6c-2u;
	Thu, 27 Apr 2023 12:18:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps0Za-006W4s-1R;
	Thu, 27 Apr 2023 12:18:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-2f917585b26so7689971f8f.0;
        Thu, 27 Apr 2023 05:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682597883; x=1685189883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1vg4m/VO0MJixxSFQxYroHS6wmKORiBS3+pI5CUOeA=;
        b=h8aWLVXfJoVHByEfH4nDVYZAgF7pCMbFAKULlTJDAvY0i9RXCc8hqvbf1SoACMTFLi
         sGAiE3uURyayj6Q4q5y4S1FWrSwXVGFmAYz2GNFk0GwLD0dRj2EFPMWZiFXoFKbFFV+x
         9P4N5aNiE1wimcUPLnIqgCyeGBfhCvqZm2rmvvhKMVcdZTKNfD17oCoduDcdZZiZj1s0
         j+aDXbU7JtBM71oh2fvNMEw2z/kywg2XahtK/jiAHpBHr7OlyA0YfoznY+2NcrxLqN3B
         F26EQ8CGy4sL9AKzIfy5KPXxMG/Mhr/8ojo+qQpxWiTttAbzxgILJCdZd7oqQXj+Uxmm
         BdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682597883; x=1685189883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1vg4m/VO0MJixxSFQxYroHS6wmKORiBS3+pI5CUOeA=;
        b=MU/5VZ6AYZaRvmgD2v03mJkQeFIVdN4jqxB1wUxxy4T4sR1jK5VfTg+yaHTvZJeWa3
         LyGs3nV/Wj+8+DlWDJ3ajg+xzBu1jWtIipuiqQFOMBcH2LIAeAoRYaQSQto101kpw1PL
         yPiJGu8n3jIKmhfYZGaTs+/dEjWn4Ub7yM3Tg2ZLHobCzQGujMh80pWdxYt2PNNshZ4L
         FZkP1Q87yRCiIDik7+7r7HA19c/ucGoq7YJr+/OZd5OGQnTY1OFT8wsBDgSWUDviL6et
         AGJumA+qzlBL7TrpNRMjewmP+94SMHarHfhpuuicYJ86Ij56wYuCGDzI/bLyExqcBeVQ
         M1dA==
X-Gm-Message-State: AC+VfDxBke9Y5JRpP8owaWv7GTXGfXfIL06oWr44VDSJEykSsXUYlnlI
	9FNcVN3eKC5PFRxrxv9C2xw=
X-Google-Smtp-Source: ACHHUZ6XSKZdEQZ82p2Ne5sQayHi/JgjrgiM+HvaVe1sFcjLXkT3Cm1pfdAlTzJEugJrw6il1B3WXQ==
X-Received: by 2002:a5d:40cd:0:b0:2ff:3a63:ed61 with SMTP id b13-20020a5d40cd000000b002ff3a63ed61mr1121516wrq.13.1682597882571;
        Thu, 27 Apr 2023 05:18:02 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g3-20020a5d5543000000b002fe254f6c33sm18366680wrw.92.2023.04.27.05.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 05:18:01 -0700 (PDT)
Message-ID: <ba23e233-a0a2-c5e9-1a63-497d7dea4814@gmail.com>
Date: Thu, 27 Apr 2023 14:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] drm/mediatek: Add DSI support for mt8188 vdosys0
Content-Language: en-US, ca-ES, es-ES
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nathan Lu <nathan.lu@mediatek.com>
References: <20230427084040.3651-1-jason-jh.lin@mediatek.com>
 <20230427084040.3651-3-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230427084040.3651-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_051806_484880_D37DBE74 
X-CRM114-Status: GOOD (  16.65  )
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



On 27/04/2023 10:40, Jason-JH.Lin wrote:
> Add DSI as main display output for mt8188 vdosys0.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 5 +++++
>   drivers/gpu/drm/mediatek/mtk_dsi.c          | 9 +++++++++
>   4 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 72c57442f965..bf06ccb65652 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -48,6 +48,7 @@ int mtk_dpi_encoder_index(struct device *dev);
>   
>   void mtk_dsi_ddp_start(struct device *dev);
>   void mtk_dsi_ddp_stop(struct device *dev);
> +int mtk_dsi_encoder_index(struct device *dev);
>   
>   int mtk_gamma_clk_enable(struct device *dev);
>   void mtk_gamma_clk_disable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index fe20ce26b19f..214233d36487 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -318,6 +318,7 @@ static const struct mtk_ddp_comp_funcs ddp_dsc = {
>   static const struct mtk_ddp_comp_funcs ddp_dsi = {
>   	.start = mtk_dsi_ddp_start,
>   	.stop = mtk_dsi_ddp_stop,
> +	.encoder_index = mtk_dsi_encoder_index,
>   };
>   
>   static const struct mtk_ddp_comp_funcs ddp_gamma = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index d8c49614a107..7ea4dc87c558 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -191,8 +191,13 @@ static const unsigned int mt8188_mtk_ddp_main_routes_0[] = {
>   	DDP_COMPONENT_DP_INTF0
>   };
>   
> +static const unsigned int mt8188_mtk_ddp_main_routes_1[] = {
> +	DDP_COMPONENT_DSI0
> +};
> +
>   static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
>   	{0, ARRAY_SIZE(mt8188_mtk_ddp_main_routes_0), mt8188_mtk_ddp_main_routes_0},
> +	{0, ARRAY_SIZE(mt8188_mtk_ddp_main_routes_1), mt8188_mtk_ddp_main_routes_1},
>   };
>   
>   static const unsigned int mt8192_mtk_ddp_main[] = {
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 7d5250351193..f9d2d5447e2e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -865,6 +865,15 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>   	return ret;
>   }
>   
> +int mtk_dsi_encoder_index(struct device *dev)
> +{
> +	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +	int encoder_index = drm_encoder_index(&dsi->encoder);
> +
> +	dev_dbg(dev, "encoder index:%d", encoder_index);
> +	return encoder_index;
> +}
> +
>   static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>   {
>   	int ret;

