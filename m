Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F569C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 07:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUW3KA9oY945l0WjSYU6yb4//t7RdEnfaQxLmA8naNk=; b=tbXgWuAWVSAb6uXiKPON6fGAbv
	4KJEyUsl9aWkfmJdhKfWaKy7BnIUyJ7at38PhhhhRNZx0IX/Pzn7+F8v5K718sSgTRU2aUrqj5Kvz
	AodCUhvFC/42I6iHg8y7KefcZQg94kmLUMNVCUZCk/KbRy+zxl79vpoenLG/QJ1RPvAfS5fh/IfrC
	83zJZn2GEkXERJ6+i96S/v0MPJ/kCxf8ZWRybD9SZ8P5DjY14UF+DmN4dXxB1mV1kIAaBikwmX+24
	juOkSFyOXCHrCSxizQr+MZzR1ekJRETE1IkLtspMhWDnqIfvxHrQ883Zg4UtGOrnu2ms9ZFsy27U/
	RjFpKr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfF6f-0014h6-20;
	Thu, 23 Mar 2023 07:11:29 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfF6c-0014fN-2r
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Mar 2023 07:11:28 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r11so82490113edd.5
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Mar 2023 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679555482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUW3KA9oY945l0WjSYU6yb4//t7RdEnfaQxLmA8naNk=;
        b=Enx3yShv9rOD2nIIE/rTGErqDu2U128+byphOkCKi2XPmw+I5IAIUxG63+IOmwuzn+
         oARiz1450a+c08/zkYU8eppOA+yA3xHbW9Nb5oTrg9IzpQmMgjcHocEgLRxaKC7tDeyX
         NxZKNA9AU7yZVk48s5DwN+mIT5h/Z0Mevuc6nm6D7GKfKFtqR7EJveWWaHsTQW3/KU6v
         aERZlrC/V4bgQVcjhZJM2fencBwIYTOhvMDj6rltaHo41zpW+eApkVR1O8RHqjykqwQ0
         Fxl0rpAvJ8KODKBXUfsmYWhiBSR+fWxMwcNP6BBIN1soqzTRXUOSovP1safcFeuKAGW4
         Nwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679555482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUW3KA9oY945l0WjSYU6yb4//t7RdEnfaQxLmA8naNk=;
        b=Ci9SZq+taWlGjfscA/pv1QKxDSCJzhjHgIP0nwaRZcMINMw+SJ4P0KkhEMa0trxL2S
         TuTWiTP1ywb7X6ppCSFj4GlSeaQcciIbEYsaKO8CxfW5G1kgfCNs2r0723GByEacDOI/
         0C8EW8LZb3BKJY1WaRguxT+l0Qqi1HIAtvxVWuSdJGxwAvGolLCYbxYgBnjuui2eJ787
         Xmd15Njo5bo8mnoZeo/a5gfdQI46dhpAUu1z89AQnjfOszLd8bk6SCribDbMrE8hJw5G
         A7lRAdIEzoYp43V9E1Yj6WtTVfdst3DXG5FUEy+PB383pf0GHNJDoI9o6nG3fxBRJ4Gf
         tjQw==
X-Gm-Message-State: AO0yUKW5xfTceRVEUONN4hLmJYo5s5WsXUZwOCUcHogfSYjQMkU7lz3t
	T807wl62BxgHw3nmub7vRl9CnQ==
X-Google-Smtp-Source: AK7set/Wh2D5M3irdgQqmOgdbjL2IfZlCgF1MyK7gaU1RemY2AYRPNcbyBr72ujeMWSgIXR35zZfGw==
X-Received: by 2002:a17:906:3999:b0:933:3705:a9f0 with SMTP id h25-20020a170906399900b009333705a9f0mr10340527eje.19.1679555482610;
        Thu, 23 Mar 2023 00:11:22 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id so8-20020a170907390800b0093d0867a65csm313823ejc.175.2023.03.23.00.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:11:21 -0700 (PDT)
Message-ID: <16254095-30e9-90f6-6dc7-22b29dad93e3@linaro.org>
Date: Thu, 23 Mar 2023 07:11:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] nvmem: mtk-efuse: Support postprocessing for GPU speed
 binning data
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wenst@chromium.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230321143319.333803-1-angelogioacchino.delregno@collabora.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230321143319.333803-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_001127_039000_0181F4CB 
X-CRM114-Status: GOOD (  28.55  )
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



On 21/03/2023 14:33, AngeloGioacchino Del Regno wrote:
> On some MediaTek SoCs GPU speed binning data is available for read
> in the SoC's eFuse array but it has a format that is incompatible
> with what the OPP API expects, as we read a number from 0 to 7 but
> opp-supported-hw is expecting a bitmask to enable an OPP entry:
> being what we read limited to 0-7, it's straightforward to simply
> convert the value to BIT(value) as a post-processing action.
> 
> So, introduce post-processing support and enable it by evaluating
> the newly introduced platform data's `uses_post_processing` member,
> currently enabled only for MT8186.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied thanks,

--srini
>   drivers/nvmem/mtk-efuse.c | 53 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index a08e0aedd21c..b36cd0dcc8c7 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -10,6 +10,11 @@
>   #include <linux/io.h>
>   #include <linux/nvmem-provider.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +struct mtk_efuse_pdata {
> +	bool uses_post_processing;
> +};
>   
>   struct mtk_efuse_priv {
>   	void __iomem *base;
> @@ -29,6 +34,37 @@ static int mtk_reg_read(void *context,
>   	return 0;
>   }
>   
> +static int mtk_efuse_gpu_speedbin_pp(void *context, const char *id, int index,
> +				     unsigned int offset, void *data, size_t bytes)
> +{
> +	u8 *val = data;
> +
> +	if (val[0] < 8)
> +		val[0] = BIT(val[0]);
> +
> +	return 0;
> +}
> +
> +static void mtk_efuse_fixup_cell_info(struct nvmem_device *nvmem,
> +				      struct nvmem_layout *layout,
> +				      struct nvmem_cell_info *cell)
> +{
> +	size_t sz = strlen(cell->name);
> +
> +	/*
> +	 * On some SoCs, the GPU speedbin is not read as bitmask but as
> +	 * a number with range [0-7] (max 3 bits): post process to use
> +	 * it in OPP tables to describe supported-hw.
> +	 */
> +	if (cell->nbits <= 3 &&
> +	    strncmp(cell->name, "gpu-speedbin", min(sz, strlen("gpu-speedbin"))) == 0)
> +		cell->read_post_process = mtk_efuse_gpu_speedbin_pp;
> +}
> +
> +static struct nvmem_layout mtk_efuse_layout = {
> +	.fixup_cell_info = mtk_efuse_fixup_cell_info,
> +};
> +
>   static int mtk_efuse_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -36,6 +72,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	struct nvmem_device *nvmem;
>   	struct nvmem_config econfig = {};
>   	struct mtk_efuse_priv *priv;
> +	const struct mtk_efuse_pdata *pdata;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -45,20 +82,32 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	if (IS_ERR(priv->base))
>   		return PTR_ERR(priv->base);
>   
> +	pdata = device_get_match_data(dev);
>   	econfig.stride = 1;
>   	econfig.word_size = 1;
>   	econfig.reg_read = mtk_reg_read;
>   	econfig.size = resource_size(res);
>   	econfig.priv = priv;
>   	econfig.dev = dev;
> +	if (pdata->uses_post_processing)
> +		econfig.layout = &mtk_efuse_layout;
>   	nvmem = devm_nvmem_register(dev, &econfig);
>   
>   	return PTR_ERR_OR_ZERO(nvmem);
>   }
>   
> +static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
> +	.uses_post_processing = true,
> +};
> +
> +static const struct mtk_efuse_pdata mtk_efuse_pdata = {
> +	.uses_post_processing = false,
> +};
> +
>   static const struct of_device_id mtk_efuse_of_match[] = {
> -	{ .compatible = "mediatek,mt8173-efuse",},
> -	{ .compatible = "mediatek,efuse",},
> +	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
> +	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
> +	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
>   	{/* sentinel */},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_efuse_of_match);

