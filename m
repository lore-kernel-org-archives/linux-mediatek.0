Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62D3C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+yr1+nKT7s8acPwOL/4Z8aHxPGUBZqRyrnHMdHmTAk=; b=fCLm8XvAjLsnRVA4XhPLgExEkK
	jKT9x1dxyQ/phuK6V+xy7PWD9hihyeUwaNEKus2L/7ikQXVsTcC3BFuyl5A40MR7Syt6g7Won8PPL
	O3Ifd2JEOzWCBrg77rBLZjSJHhLF4ZHuXU1YcyAQkya3lv2LD6LL7ne030scv0VGMDx8FzPp0p1xQ
	GvhuE+DCxtbPN/226YHtOFg52qbWnKbAXAkpj8NycQw+UWxhBsHgPlld2RgTDq5cnjiDp/OQRyU83
	ivEEmpCZ0y8eYNUI/M0Il3b+FVHh46dUFs54nUHoecNxQ54c/iBWrvAYB94NYh0z3uvRkIpxrEDui
	Z5KKz83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCtv-00EnI1-5O; Thu, 25 Aug 2022 13:28:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCtX-00En6V-Hg; Thu, 25 Aug 2022 13:27:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k9so24642652wri.0;
        Thu, 25 Aug 2022 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=s+yr1+nKT7s8acPwOL/4Z8aHxPGUBZqRyrnHMdHmTAk=;
        b=P1Avf2ZgfYbOL0sPZf5JYEGzaYRwlP8IiTh0O1+tUKRdTr31E7o8BVCMUTkZ6ve9Bw
         qYnrlZMfFdi8anSS9exAp+DUyjMrDaLdBMOLqZcXUx8FisnfEHM0S/Vgt6ao3Fn73l1v
         W2PFaUkLCMSpcvUIkHYThuhC2Crhb4SPeaJpxziDz04LaO2ZcpFp0bw/+g1/gl4sRNDY
         jX41WsGlv2zvDsZrOic2GUjGpC7PLUhd0PdxMs62bAMvLGvFvjrBqMg7fAL+Vm571gvR
         N3UOcxMRMvgpDhd0kFSuA/q6m94YZMK3o0eag4Li9WPxvgobuxM1yHeDUR1HhVXzn6Gn
         hTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=s+yr1+nKT7s8acPwOL/4Z8aHxPGUBZqRyrnHMdHmTAk=;
        b=F7ronU052d4yJfiwwkbkmng1eFQvcM13NjnWEDH0hzfBLNOBlxLZB3Me4J66zQiwfB
         QEnVjwsgSxgQtLJhdDTJM2a2c4Io36wSIHOwUDlmTGOgnxJ010bEDTBfEZDgF+mrSXv0
         wVn94hCtq/bANOfSDzkCEhz9DqAiXZm9DylYaT9+DKpibl0T+2ncCSVcw+uMeGPiWHIl
         xGBGejGIZImrqCOZ5hRGNNNqjRwWV5qd6mNEK/mvBJgQCvc5JwYkMwBihJzcvEp5Q30l
         UOON47/3SNKorBi9WTq7f7/q7rPA9JtwfLkErWe4QlFgyxs0k8pEL9+2QQ1qkYn9EObo
         IxWA==
X-Gm-Message-State: ACgBeo3eaRLRI4Ef27Uyq77d75fCgY9VZswqHj6MYX5TOQorKP5/VCJX
	X3YCykOyxAG0vQmKMr2Kxd0=
X-Google-Smtp-Source: AA6agR4+e+gJ953ovCQzhpGeyQWCCrQ/2jVoyirofXcAeX5mDCBEzYBddFBFOkba5IBKK1D2RJF+OQ==
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id g9-20020a5d64e9000000b002207dd763ebmr2324617wri.590.1661434055754;
        Thu, 25 Aug 2022 06:27:35 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4411000000b002252e5a6841sm19802921wrq.57.2022.08.25.06.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:27:34 -0700 (PDT)
Message-ID: <d41d392b-d80f-c6e2-9d4e-d28663e5b06c@gmail.com>
Date: Thu, 25 Aug 2022 15:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 1/6] soc: mediatek: mtk-svs: Commonize t-calibration-data
 fuse array read
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-2-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220726141653.177948-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_062739_655803_775A53C0 
X-CRM114-Status: GOOD (  22.28  )
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



On 26/07/2022 16:16, AngeloGioacchino Del Regno wrote:
> Commonize the repeating pattern for reading the "t-calibration-data"
> efuse data in a new function svs_thermal_efuse_get_data(), reducing
> the size of this driver.
> 
> No functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 111 +++++++++++----------------------
>   1 file changed, 38 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 5ac431a04548..600492dc334c 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1684,11 +1684,36 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
>   	return 0;
>   }
>   
> +static int svs_thermal_efuse_get_data(struct svs_platform *svsp)
> +{
> +	struct nvmem_cell *cell;
> +
> +	/* Thermal efuse parsing */
> +	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
> +	if (IS_ERR_OR_NULL(cell)) {
> +		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n", PTR_ERR(cell));
> +		return PTR_ERR(cell);
> +	}
> +
> +	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
> +	if (IS_ERR(svsp->tefuse)) {
> +		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
> +			PTR_ERR(svsp->tefuse));
> +		nvmem_cell_put(cell);
> +		return PTR_ERR(svsp->tefuse);
> +	}
> +
> +	svsp->tefuse_max /= sizeof(u32);
> +	nvmem_cell_put(cell);
> +
> +	return 0;
> +}
> +
>   static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)

Please rebase on upstream driver, no support for mt8195 for now.

Regards,
Matthias

>   {
>   	struct svs_bank *svsb;
> -	struct nvmem_cell *cell;
>   	u32 idx, i, ft_pgm, vmin, golden_temp;
> +	int ret;
>   
>   	for (i = 0; i < svsp->efuse_max; i++)
>   		if (svsp->efuse[i])
> @@ -1730,24 +1755,9 @@ static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	/* Thermal efuse parsing */
> -	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
> -	if (IS_ERR_OR_NULL(cell)) {
> -		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
> -			PTR_ERR(cell));
> -		return false;
> -	}
> -
> -	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
> -	if (IS_ERR(svsp->tefuse)) {
> -		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
> -			PTR_ERR(svsp->tefuse));
> -		nvmem_cell_put(cell);
> +	ret = svs_thermal_efuse_get_data(svsp);
> +	if (ret)
>   		return false;
> -	}
> -
> -	svsp->tefuse_max /= sizeof(u32);
> -	nvmem_cell_put(cell);
>   
>   	for (i = 0; i < svsp->tefuse_max; i++)
>   		if (svsp->tefuse[i] != 0)
> @@ -1770,8 +1780,8 @@ static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
>   static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
>   {
>   	struct svs_bank *svsb;
> -	struct nvmem_cell *cell;
>   	u32 idx, i, vmin, golden_temp;
> +	int ret;
>   
>   	for (i = 0; i < svsp->efuse_max; i++)
>   		if (svsp->efuse[i])
> @@ -1809,24 +1819,9 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	/* Thermal efuse parsing */
> -	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
> -	if (IS_ERR_OR_NULL(cell)) {
> -		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
> -			PTR_ERR(cell));
> -		return false;
> -	}
> -
> -	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
> -	if (IS_ERR(svsp->tefuse)) {
> -		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
> -			PTR_ERR(svsp->tefuse));
> -		nvmem_cell_put(cell);
> +	ret = svs_thermal_efuse_get_data(svsp);
> +	if (ret)
>   		return false;
> -	}
> -
> -	svsp->tefuse_max /= sizeof(u32);
> -	nvmem_cell_put(cell);
>   
>   	for (i = 0; i < svsp->tefuse_max; i++)
>   		if (svsp->tefuse[i] != 0)
> @@ -1849,8 +1844,8 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
>   static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
>   {
>   	struct svs_bank *svsb;
> -	struct nvmem_cell *cell;
>   	u32 idx, i, golden_temp;
> +	int ret;
>   
>   	for (i = 0; i < svsp->efuse_max; i++)
>   		if (svsp->efuse[i])
> @@ -1911,24 +1906,9 @@ static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	/* Thermal efuse parsing */
> -	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
> -	if (IS_ERR_OR_NULL(cell)) {
> -		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
> -			PTR_ERR(cell));
> +	ret = svs_thermal_efuse_get_data(svsp);
> +	if (ret)
>   		return false;
> -	}
> -
> -	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
> -	if (IS_ERR(svsp->tefuse)) {
> -		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
> -			PTR_ERR(svsp->tefuse));
> -		nvmem_cell_put(cell);
> -		return false;
> -	}
> -
> -	svsp->tefuse_max /= sizeof(u32);
> -	nvmem_cell_put(cell);
>   
>   	golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
>   	if (!golden_temp)
> @@ -1946,11 +1926,11 @@ static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
>   static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   {
>   	struct svs_bank *svsb;
> -	struct nvmem_cell *cell;
>   	int format[6], x_roomt[6], o_vtsmcu[5], o_vtsabb, tb_roomt = 0;
>   	int adc_ge_t, adc_oe_t, ge, oe, gain, degc_cali, adc_cali_en_t;
>   	int o_slope, o_slope_sign, ts_id;
>   	u32 idx, i, ft_pgm, mts, temp0, temp1, temp2;
> +	int ret;
>   
>   	for (i = 0; i < svsp->efuse_max; i++)
>   		if (svsp->efuse[i])
> @@ -2026,24 +2006,9 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   		}
>   	}
>   
> -	/* Get thermal efuse by nvmem */
> -	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
> -	if (IS_ERR(cell)) {
> -		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n",
> -			PTR_ERR(cell));
> -		goto remove_mt8183_svsb_mon_mode;
> -	}
> -
> -	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
> -	if (IS_ERR(svsp->tefuse)) {
> -		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
> -			PTR_ERR(svsp->tefuse));
> -		nvmem_cell_put(cell);
> -		goto remove_mt8183_svsb_mon_mode;
> -	}
> -
> -	svsp->tefuse_max /= sizeof(u32);
> -	nvmem_cell_put(cell);
> +	ret = svs_thermal_efuse_get_data(svsp);
> +	if (ret)
> +		return false;
>   
>   	/* Thermal efuse parsing */
>   	adc_ge_t = (svsp->tefuse[1] >> 22) & GENMASK(9, 0);

