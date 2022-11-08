Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA0DC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 17:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCAW19E5l681mF+R72oFht/CQ2wMh6AzLr3NL86vzHU=; b=b5wspdTWZMYLSDxRPfIT7/RDW1
	waJ2i+F4CJxO5I0CWlrbXV3TRhcJqKtSYdUjS3f2b9XbeSDPlc8kpN/YLI9MADmO9hynk6VnetwDt
	5wf9Z8x7oUi0cNHzOmHL6eI/IGBDPDO/OPOloXJ2O9XLqZPHbzVyVTpq1YCNWfitztqARo7MVKp2t
	c8oHfDgAf0UC0OeVkNrO0s4FBwMVq53175GW506U+5ABoY33M0byWYOnFpKqo5BedlxE5BroFI1ME
	JeoSmdyecSlImSWNIqyBLaHy0RKU0ZmargnJmy2vEhR5QLg3Md4vmGPJyniIMDe7cAIeWmJmnXA9J
	N40i2hAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osShl-007H0z-1L; Tue, 08 Nov 2022 17:48:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSgc-007GIs-DK; Tue, 08 Nov 2022 17:47:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id cl5so22141511wrb.9;
        Tue, 08 Nov 2022 09:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCAW19E5l681mF+R72oFht/CQ2wMh6AzLr3NL86vzHU=;
        b=KTzmBk0JE13err2vSnXrAVtcQ2rrmE9bBZw+gTbDrZaw1ZzmWcNDqIUhdizIQPUY0+
         01GwSZa+t7UD/xjc4ZcdcUKdd+6rE57pOaEEe7IwMe0sDKjs7LuKZNHgfEBjHQD479bp
         CWxHXfzO4cGP8hQtsTxMSk0npAaqN3ZJdUoY7heJBXk2/OgquAvBHVPX+TLCcx6mOtzc
         KVmLyXcOCRGJF0v7c08dE1A5tH5g35g+qXdKSYVrBJNgHB0Vu8eOEx4hqXSrb+SYzPFf
         8UuAKeRynC02FfwxxhK9D27/GX9FI45AJp6rCyD7j1Sfocv6icDNwsdFi87SDJ4bpccR
         /Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCAW19E5l681mF+R72oFht/CQ2wMh6AzLr3NL86vzHU=;
        b=og7kKaLasmFJXEayjfCJCWSF6VecJh52HExrpT+uQridI2Us9x5dsyWynobWhWtM1/
         7zFhBa8O2/4zrmaAvdYwM6ca1Zb/B4Xrr21OR6quc6V0W0H9jEzsJ8TnUAyci4Dt/dGS
         6wjaHQDuR8VYLJQVTbu/j37oaVj1uUwJvAbLDRjuNPLRY9VZQuCEPKx53/gnI1qQldcP
         uip3jyfj+5qZdj1c4OEmvmZq8kLJDW5aQg1eEvl3+VJDKkq7oLP3YQGAuE6opPauaPYA
         euSD0YVW2yQ/LuL/AgNciHlFhCxHWvhKBYvocKeQ55N53pv2XgA3oP+7ELqs9JMDsGFv
         qGTA==
X-Gm-Message-State: ACrzQf1gbK00mz7wc5xz2MKnqEVaA8Sh8fX366SJFuvvoYLZXG7EzuEm
	FhPjOPvEwJchqJfB1ZXwP5U=
X-Google-Smtp-Source: AMsMyM7wysQrxo4qkni3Qar3s+rAjvxOzJif1WlMKCVrxnJjxUAX/BfYxsSJWY/0BdqiVCNkMtPmBA==
X-Received: by 2002:a5d:5942:0:b0:225:7425:4e39 with SMTP id e2-20020a5d5942000000b0022574254e39mr35607783wri.566.1667929614298;
        Tue, 08 Nov 2022 09:46:54 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id s1-20020a7bc381000000b003c6b874a0dfsm13993940wmj.14.2022.11.08.09.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 09:46:53 -0800 (PST)
Message-ID: <32ae4104-673b-1b34-5efb-dc1317e80530@gmail.com>
Date: Tue, 8 Nov 2022 18:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
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
 <20221107072243.15748-7-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v28 06/11] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
In-Reply-To: <20221107072243.15748-7-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_094658_538955_D75A1396 
X-CRM114-Status: GOOD (  23.16  )
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
> Add four mmsys config APIs. The config APIs are used for config
> mmsys reg. Some mmsys regs need to be set according to the
> HW engine binding to the mmsys simultaneously.
> 
> 1. mtk_mmsys_merge_async_config: config merge async width/height.
>     async is used for cross-clock domain synchronization.
> 2. mtk_mmsys_hdr_confing: config hdr backend async width/height.
> 3. mtk_mmsys_mixer_in_config and mtk_mmsys_mixer_in_config:
>     config mixer related settings.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Not something we need to fix in this series, but it would make sense instead of 
adding all the EXPORTS to pass the functions as callbacks in the 
platform_device_register_data. But I realize you don't pass the VDOSYS number to 
the DRM driver to distinguish between the different MMSYS devices that created 
the platform device. I hadn't had a deep look on the DRM implementation but I 
suppose it will be challenge...

Regards,
Matthias

> ---
>   drivers/soc/mediatek/mt8195-mmsys.h    |  6 +++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 35 ++++++++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h |  9 +++++++
>   3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
> index fd7b455bd675..454944a9409c 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -75,6 +75,12 @@
>   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
>   #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
>   
> +#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD				0xe30
> +#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD				0xe70
> +#define MT8195_VDO1_HDR_TOP_CFG					0xd00
> +#define MT8195_VDO1_MIXER_IN1_ALPHA				0xd30
> +#define MT8195_VDO1_MIXER_IN1_PAD				0xd40
> +
>   #define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
>   #define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			1
>   
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 73c8bd27e6ae..6040a3cff6f8 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -137,6 +137,41 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height)
> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
> +			      ~0, height << 16 | width);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
> +
> +void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height)
> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> +			      be_height << 16 | be_width);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_config);
> +
> +void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
> +			       u8 mode, u32 biwidth)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +
> +	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
> +			      alpha << 16 | alpha);
> +	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
> +			      alpha_sel << (19 + idx));
> +	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
> +			      GENMASK(31, 16) | GENMASK(1, 0), biwidth << 16 | mode);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
> +
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap)
> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
> +			      BIT(4), channel_swap << 4);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
> +
>   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>   {
>   	if (val)
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 127f1b888ace..a4708859c188 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -75,4 +75,13 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   
>   void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
>   
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height);
> +
> +void mtk_mmsys_hdr_config(struct device *dev, int be_width, int be_height);
> +
> +void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16 alpha,
> +			       u8 mode, u32 biwidth);
> +
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap);
> +
>   #endif /* __MTK_MMSYS_H */

