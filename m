Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F65C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lL7ib0fQfHAIVHKNMEUfuV2w/rUMbmu/eMiez+EADGc=; b=1cHgullutkrR2zBM+UCAmJYXiH
	G97kXBRCe+x1vDaAtvWZxPSEF5WdfgT3ME+9KVb5eGThyfGFnreM/qNw9rqUowqcqwmxenB4BSkUT
	iNHFEJfjoE3ob3s9YRtqyGhkbp7GVd6zfu/Q4Fl2Wqr577jqcUmQzuO9TiyY3i3TP3snpPk6ampGh
	CJ7gAGyxpfUESi5w/5bk8OF80+1p1aJYCCm1IgeHQ+7h+PXdIYDoK2hOULgpOHVf6NkQpMTiLB8Ay
	huSSQqnM+SKLxDcBu4FR99PN+enaBE7V3a/CCA6nwWNVJqCD/UzTVWGam0he2p8e2O6hemfU/5JiZ
	4rdpD/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSXa-0073FR-6G; Tue, 08 Nov 2022 17:37:38 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSXN-0073C9-Pc; Tue, 08 Nov 2022 17:37:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v7so9294765wmn.0;
        Tue, 08 Nov 2022 09:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lL7ib0fQfHAIVHKNMEUfuV2w/rUMbmu/eMiez+EADGc=;
        b=YT8bDUSuYGlX0nSv0Gmye3eRq5y7UbhWrZlTinDOm2D4cvZMf0uBi7FXOD/RD83xQD
         ftEA8Oy9SJ2khn9xHaudJCfy0C5C8+J1XVTe/TZJqrUQboYjz9T+6Auu5BcqxQMiJCk9
         UdOU0NgLAak/vV5X9oK8gPFcxQyRDiTPOq0WF1zieFiXoksfSP6SM7MuznRRMKFDeSTs
         vr4uFMd5goEZAPH8EnCKiqptmLyIk0JdgcQYHSmHAS5ZLUJ+8z37Ot2CbG4HKOMt1Rje
         80KqeqTvSDNFxAUoK0/7qt428CD+a2206fRXAs2pSszQXryGl280+QJPRi/VyEnH3o53
         /AXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lL7ib0fQfHAIVHKNMEUfuV2w/rUMbmu/eMiez+EADGc=;
        b=Jk+gHvF66pnaTfNxzMbNJ3GL3FEIZAOXzJikatWgBH5FbKUjDQnDRS7MgXisA3MDAZ
         dG9hyExmWSbnRzQdjUZTZ2dWv0dH4f+9ewODmwqw6LERyROkeVHtDoho4lHcTvStqCT7
         7qPuptK24l2vfJ6VICX2FuViNrkbS5Z7719l65tKvNl+vBnyq+HPqkfhYExZ+hLysbyT
         j/LIZwBgaS1quWbtb0q9ta4iXIWYxJq317PGS90vTtqa+1Ja5Mwp8kvqxiUdH7j0uaNM
         Lj0j82j9AVKAUSijtmCnqYcsviaOxy1f7m8PM7gSPFkqlOuq2Vdvh2jT9VkDn7EJXwON
         ebLg==
X-Gm-Message-State: ACrzQf2Zgsry7srOdW4WlX9TfuLlgKbM8X0lssbzkJED1BB4v5u4IoXu
	5fUu8pTUi+vSal9vBdgC+I0=
X-Google-Smtp-Source: AMsMyM4ZRxL1bJwjZOpkyyyJeMjJb4TNMK6d9bQf6wA8GOKPj1utSTr6/nojgUJfPKlu3A5LPUB2tA==
X-Received: by 2002:a05:600c:4ecf:b0:3cf:8762:1a67 with SMTP id g15-20020a05600c4ecf00b003cf87621a67mr24970726wmq.41.1667929042011;
        Tue, 08 Nov 2022 09:37:22 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d4b12000000b002365f326037sm13165230wrq.63.2022.11.08.09.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 09:37:20 -0800 (PST)
Message-ID: <58d55016-afc7-e560-32cf-8228794b5752@gmail.com>
Date: Tue, 8 Nov 2022 18:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, nfraprado@collabora.com
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-6-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221107072243.15748-6-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_093725_859737_98367E45 
X-CRM114-Status: GOOD (  23.14  )
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



On 07/11/2022 08:22, Nancy.Lin wrote:
> Simplify code for update  mmsys reg.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 45 ++++++++++++--------------------
>   1 file changed, 16 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 9a327eb5d9d7..73c8bd27e6ae 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -99,22 +99,27 @@ struct mtk_mmsys {
>   	struct reset_controller_dev rcdev;
>   };
>   
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | (val & mask);

I'm not sure about the change in the implementation of mtk_mmsys_update_bits(). 
Nicolas tried to explain it to me on IRC but I wasn't totally convincing. As we 
have to go for at least another round of this patches, I'd like to get a clear 
understanding while it is needed that val bits are set to 1 in the mask.

Regards,
Matthias

> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>   	int i;
>   
>   	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			reg |= routes[i].val;
> -			writel_relaxed(reg, mmsys->regs + routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
> +					      routes[i].val);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>   
> @@ -124,27 +129,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>   	int i;
>   
>   	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			writel_relaxed(reg, mmsys->regs + routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> -static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> -{
> -	u32 tmp;
> -
> -	tmp = readl_relaxed(mmsys->regs + offset);
> -	tmp = (tmp & ~mask) | val;
> -	writel_relaxed(tmp, mmsys->regs + offset);
> -}
> -
>   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>   {
>   	if (val)
> @@ -161,18 +153,13 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
>   {
>   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
>   	unsigned long flags;
> -	u32 reg;
>   
>   	spin_lock_irqsave(&mmsys->lock, flags);
>   
> -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> -
>   	if (assert)
> -		reg &= ~BIT(id);
> +		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), 0);
>   	else
> -		reg |= BIT(id);
> -
> -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> +		mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), BIT(id));
>   
>   	spin_unlock_irqrestore(&mmsys->lock, flags);
>   

