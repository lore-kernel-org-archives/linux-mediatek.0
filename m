Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5295EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbOj7N8DnodBtyBa/Rqm6IhIsv562FLo7dT8/Zy1CWM=; b=RL7vvLqj8ndHjA
	M1tMQbNXsx6uU99JyZRkZiw67qP17EefVHsQI0f63UHPwEws727fbJPkIlhzu3DuNeXRHJc8zZihb
	KZXHLzQY9vyp4BguUaeTSddG+lcX3E335OT2/hiGVZAk6x/U2SV13giUBCQSvFiGSDBIfaOEA6+Dx
	7HN2/b8HPmY2xB1gilbXdKObx4uv2rCj3Bf1321V38eVQamz5ObZBqLRqweOxlPdxcBFetR0RYXaf
	RPf5IKEqcW4S93w9+ycmMklFGKSZr/f2TOATzmKETEMvMNXjfizpusMBD3hRHtusH1cYK5fsu1zXT
	6jg1usOaAiZvcNfrO6XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhrbV-000EZb-Ux; Fri, 22 Apr 2022 11:37:37 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhrbJ-000EVS-Az; Fri, 22 Apr 2022 11:37:26 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 r14-20020a9d750e000000b00605446d683eso5264014otk.10; 
 Fri, 22 Apr 2022 04:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vlZn9Fi0P9yMNdagcLbI/5cAQLpglB2hUiQX2NP/3po=;
 b=dbRnPQc/4YlwjQpR8ScZhURvIB0BVu4D6r1Ole3iIW+Rl7K6NwzUj1fMkbdM2At171
 4RQrKG/49dJa8fYe/iMpv6+zPUAv3dthIq3WDlvZfHfa5vipZ27OiXk8r1aNxGmJCNQG
 XoY/ev+ecGAraZVYpooCw/N6O4OKDnsc0FUcGOjD/qLn5SOLILOyITzwktYY/SURC8XR
 +OqTsK+3gJd6LbQhhEvjhnbccmr6Skl9EBHvEH8vhVpoZFi2J34MuWweg9cWADNr7mAa
 vkWGih+wpUHBm44Fu18yU7hyVjASC7wyv9aoKtaWEIlf1J5+K2D7OJ19djyEq2b98VEJ
 4EcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vlZn9Fi0P9yMNdagcLbI/5cAQLpglB2hUiQX2NP/3po=;
 b=N69jWzRBlQhPUz4RpTB+YYdJg9LfPGmFr1mOwg+Eq4OPXMYcwEvvqeYxoV3wTf0xrQ
 60VDE7e90gwVDe4M5uIS0hb55LFmZ7J1spbJESRMOjFBLaJOMDkQGNvRbUFLjUXPwrAh
 aiJQUZ8+BDbBpy0rbatNn55QxI2kwAlThMNDLrrhYRNUCkJ2/c53w+0Kw77bmqVz8onx
 f3TDOOi/5/xH0HcW8Avc4EaboY/zNLkQqZpUyWmLNsmz0K34L0wVAiz2FWuJwAOeFVJu
 A/v+7Ccn4R8FXku8WIwRAtP7DWevFNFxx/twTNpRF5cndzK7R0R2GqkrxuYFLhbXwli9
 ffvg==
X-Gm-Message-State: AOAM53045pbgGFzsI7UzcoNq4BAdyHfpOGgqZxLGgW9jQL08BHD6Q7aU
 ErUaE9H/IqO46wFlbWlHlLM=
X-Google-Smtp-Source: ABdhPJysVFALggRZYOphtxg3XKdkPQ43XCmhqa3I1LI785e3lXPB+h5jhVwcL6EFhDwJGqRhvXPcvw==
X-Received: by 2002:a9d:4796:0:b0:601:94e2:ce0b with SMTP id
 b22-20020a9d4796000000b0060194e2ce0bmr1504913otf.197.1650627443160; 
 Fri, 22 Apr 2022 04:37:23 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 6-20020aca0706000000b002f9d20b3134sm646148oih.7.2022.04.22.04.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 04:37:22 -0700 (PDT)
Message-ID: <6e06f2a0-ee9b-4cf4-85a3-243ed3121c50@gmail.com>
Date: Fri, 22 Apr 2022 13:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v17 07/21] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-8-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220416020749.29010-8-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_043725_435431_D3357F39 
X-CRM114-Status: GOOD (  20.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/04/2022 04:07, Nancy.Lin wrote:
> MT8195 vdosys1 has more than 32 reset bits and a different reset base
> than other chips. Modify mmsys for support 64 bit and different reset
> base.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mt8195-mmsys.h |  1 +
>   drivers/soc/mediatek/mtk-mmsys.c    | 39 ++++++++++++++++++-----------
>   drivers/soc/mediatek/mtk-mmsys.h    |  1 +
>   3 files changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index 5469073e3073..0a286fa5a824 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -139,6 +139,7 @@
>   #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
>   #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER			0
>   
> +#define MT8195_VDO1_SW0_RST_B		0x1d0
>   #define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
>   #define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
>   #define MT8195_VDO1_HDR_TOP_CFG		0xd00
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index ea04aa2c3840..d7c806f9e494 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -20,6 +20,8 @@
>   #include "mt8195-mmsys.h"
>   #include "mt8365-mmsys.h"
>   
> +#define MMSYS_SW_RESET_PER_REG 32
> +
>   static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>   	.clk_driver = "clk-mt2701-mm",
>   	.routes = mmsys_default_routing_table,
> @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>   	.routes = mmsys_default_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
>   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>   };
>   
>   static const struct mtk_mmsys_match_data mt8173_mmsys_match_data = {
> @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>   	.routes = mmsys_mt8183_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>   	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>   };
>   
>   static const struct mtk_mmsys_match_data mt8183_mmsys_match_data = {
> @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
>   	.routes = mmsys_mt8186_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
>   	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> +	.num_resets = 32,
>   };
>   
>   static const struct mtk_mmsys_match_data mt8186_mmsys_match_data = {
> @@ -148,6 +153,8 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>   	.clk_driver = "clk-mt8195-vdo1",
>   	.routes = mmsys_mt8195_routing_table,
>   	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> +	.sw0_rst_offset = MT8195_VDO1_SW0_RST_B,
> +	.num_resets = 64,
>   };
>   
>   static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
> @@ -234,18 +241,22 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
>   {
>   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
>   	unsigned long flags;
> +	u32 offset;
>   	u32 reg;
>   
> +	offset = (id / MMSYS_SW_RESET_PER_REG) * sizeof(u32);
> +	id = id % MMSYS_SW_RESET_PER_REG;
> +
>   	spin_lock_irqsave(&mmsys->lock, flags);
>   
> -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> +	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset + offset);
>   
>   	if (assert)
>   		reg &= ~BIT(id);
>   	else
>   		reg |= BIT(id);
>   
> -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> +	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset + offset);
>   
>   	spin_unlock_irqrestore(&mmsys->lock, flags);
>   
> @@ -360,18 +371,6 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	spin_lock_init(&mmsys->lock);
> -
> -	mmsys->rcdev.owner = THIS_MODULE;
> -	mmsys->rcdev.nr_resets = 32;
> -	mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
> -	mmsys->rcdev.of_node = pdev->dev.of_node;
> -	ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
> -		return ret;
> -	}
> -

I'm not sure why you move that code block. It's not explained in the commit message.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
