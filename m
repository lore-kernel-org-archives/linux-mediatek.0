Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FC4C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gN8Wq5E0N3HaFBsHRV9eya7b4jMZgDEegEG0/7rxU6Y=; b=Gma5w8Xm0DtEiF0ww/admmEB2w
	QDon6SbPJKiItX54qPbw7+DJRP6j464NnnbGOvUNm7cCwU9yuTBX4YHpy73RNasFMrQh6Xk4howTJ
	QhgA/R1YdZg2TD9GLoaY28YTQq/hyTj4Kx4qpfIOgEOcPqx6uP9X6k5VhVQXoH8zuie8fyz1UmHdK
	hFSJCEOez/XBrb+b8LX4Iht4olcF13B9Rrt37+9mMAFRXScpo3bOORHn5dauzNpkAWM0qPq42vbM5
	bly30sFJ0twY6VyM+yM0zWE+35/CuDvzySLw4qs1zBEt117S4OL4f8C2StXVjeSB33IdhV70LkZxS
	ocnVDYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqpZ-0089GM-0K; Tue, 31 Jan 2023 13:37:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqpO-0089E3-5w; Tue, 31 Jan 2023 13:37:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so794492wmq.1;
        Tue, 31 Jan 2023 05:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gN8Wq5E0N3HaFBsHRV9eya7b4jMZgDEegEG0/7rxU6Y=;
        b=M6fdQdSxkncaF2gGsMGmgwiRTx17JrkmhphINg4jzKeXIuUUE1NClOZlA7lVuWJSjN
         v+SEeYL251vyLO2jJDt2liXop052ZSYklXuUYxSCDnEm/j+QWu6ecEzDtxaiXYvozVhP
         GrYlTT9qUcHjJ7SKnGBvyPkvBFAga/Z5tWgD2xAENUFPlL6H5ne63PQ0IGYZeJDuKweG
         +oMFYUHPIQ4bwSSfJ09zxZIqEREqJa8kfxaX17h+xwP5tBxPCocx6ANCbJdzFgk7oVwR
         /QrcBX1MqLYpJSm45IIwP74qjZeF319LZw2WmJ5KRm1Xe+JtbsIVJ5PCSJ50n3+Z9KmN
         zO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gN8Wq5E0N3HaFBsHRV9eya7b4jMZgDEegEG0/7rxU6Y=;
        b=z6X8YiQXXuPyDrtT6rMonRYJJjXu9zSKEOCe4k2iYaowzsRFMmbgG7wn+qESTzVA7E
         1/I58K3wOtHQCq6UPbneshSBF6Si1dFb6k6mfRJH3X3bLJg5f0jYCeV86hc80kxACOdt
         84hU/fyWa5WFbH8jd+4eqVxPjhJiu/9HK9KhjPWTll422OojPPZU1vWOowZnpRlsqt97
         FHT6FAAblhKQxBrL6zbwA/gvU2owoGw2OU33HExA2FxGqv7OGbWfmbM5NBOmmNiE7tCt
         33ca8JNOQsd3u/0cclajeWrcycjJblN7ikMszGZIhVTlxoN2vhCj8RyJYGmvYqhmNYEu
         LvZA==
X-Gm-Message-State: AO0yUKUJ8cXWPPa8sijdNPC2FOON/SsIL/C897sN/a4LgeT2DbHLwD/v
	Bu5y8lpd7BLPskrYEvxV1JoruiuzFsI=
X-Google-Smtp-Source: AK7set++xleaE8Iw4YlNEsa+QphiRF4k9n4Zuxxob7UJsMazROSSd23CO1qgR/pRIHH2ikmmllOqcA==
X-Received: by 2002:a05:600c:314f:b0:3dc:4aa6:a8a9 with SMTP id h15-20020a05600c314f00b003dc4aa6a8a9mr3641957wmo.7.1675172256417;
        Tue, 31 Jan 2023 05:37:36 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c3-20020a1c3503000000b003dc1d668866sm19247111wma.10.2023.01.31.05.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:37:35 -0800 (PST)
Message-ID: <2995be5e-88e9-f00d-7bce-2f7c9eb5724d@gmail.com>
Date: Tue, 31 Jan 2023 14:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 12/14] soc: mediatek: mtk-svs: use svs get efuse common
 function
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-13-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-13-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_053738_275858_2160406D 
X-CRM114-Status: GOOD (  20.01  )
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



On 11/01/2023 08:45, Roger Lu wrote:
> SVS might need to read both svs efuse and thermal efuse on the probe flow.
> Therefore, add a common efuse read function to remove the superfluous
> codes.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Looks good to me, could you please rebase.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/soc/mediatek/mtk-svs.c | 69 ++++++++++++----------------------
>   1 file changed, 24 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index bd23d1111d7b..a7f0a6f02d52 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1758,26 +1758,28 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
>   	return 0;
>   }
>   
> -static int svs_thermal_efuse_get_data(struct svs_platform *svsp)
> +static int svs_get_efuse_data(struct svs_platform *svsp,
> +			      const char *nvmem_cell_name,
> +			      u32 **svsp_efuse, size_t *svsp_efuse_max)
>   {
>   	struct nvmem_cell *cell;
>   
> -	/* Thermal efuse parsing */
> -	cell = nvmem_cell_get(svsp->dev, "t-calibration-data");
> +	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
>   	if (IS_ERR_OR_NULL(cell)) {
> -		dev_err(svsp->dev, "no \"t-calibration-data\"? %ld\n", PTR_ERR(cell));
> +		dev_err(svsp->dev, "no \"%s\"? %ld\n",
> +			nvmem_cell_name, PTR_ERR(cell));
>   		return PTR_ERR(cell);
>   	}
>   
> -	svsp->tefuse = nvmem_cell_read(cell, &svsp->tefuse_max);
> -	if (IS_ERR(svsp->tefuse)) {
> -		dev_err(svsp->dev, "cannot read thermal efuse: %ld\n",
> -			PTR_ERR(svsp->tefuse));
> +	*svsp_efuse = nvmem_cell_read(cell, svsp_efuse_max);
> +	if (IS_ERR(*svsp_efuse)) {
> +		dev_err(svsp->dev, "cannot read \"%s\" efuse: %ld\n",
> +			nvmem_cell_name, PTR_ERR(*svsp_efuse));
>   		nvmem_cell_put(cell);
> -		return PTR_ERR(svsp->tefuse);
> +		return PTR_ERR(*svsp_efuse);
>   	}
>   
> -	svsp->tefuse_max /= sizeof(u32);
> +	*svsp_efuse_max /= sizeof(u32);
>   	nvmem_cell_put(cell);
>   
>   	return 0;
> @@ -1825,7 +1827,8 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	ret = svs_thermal_efuse_get_data(svsp);
> +	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> +				 &svsp->tefuse, &svsp->tefuse_max);
>   	if (ret)
>   		return false;
>   
> @@ -1930,7 +1933,8 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   		}
>   	}
>   
> -	ret = svs_thermal_efuse_get_data(svsp);
> +	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> +				 &svsp->tefuse, &svsp->tefuse_max);
>   	if (ret)
>   		return false;
>   
> @@ -2039,32 +2043,6 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   	return true;
>   }
>   
> -static bool svs_is_efuse_data_correct(struct svs_platform *svsp)
> -{
> -	struct nvmem_cell *cell;
> -
> -	/* Get svs efuse by nvmem */
> -	cell = nvmem_cell_get(svsp->dev, "svs-calibration-data");
> -	if (IS_ERR(cell)) {
> -		dev_err(svsp->dev, "no \"svs-calibration-data\"? %ld\n",
> -			PTR_ERR(cell));
> -		return false;
> -	}
> -
> -	svsp->efuse = nvmem_cell_read(cell, &svsp->efuse_max);
> -	if (IS_ERR(svsp->efuse)) {
> -		dev_err(svsp->dev, "cannot read svs efuse: %ld\n",
> -			PTR_ERR(svsp->efuse));
> -		nvmem_cell_put(cell);
> -		return false;
> -	}
> -
> -	svsp->efuse_max /= sizeof(u32);
> -	nvmem_cell_put(cell);
> -
> -	return true;
> -}
> -
>   static struct device *svs_get_subsys_device(struct svs_platform *svsp,
>   					    const char *node_name)
>   {
> @@ -2404,8 +2382,9 @@ static int svs_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	if (!svs_is_efuse_data_correct(svsp)) {
> -		dev_notice(svsp->dev, "efuse data isn't correct\n");
> +	ret = svs_get_efuse_data(svsp, "svs-calibration-data",
> +				 &svsp->efuse, &svsp->efuse_max);
> +	if (ret) {
>   		ret = -EPERM;
>   		goto svs_probe_free_efuse;
>   	}
> @@ -2413,13 +2392,13 @@ static int svs_probe(struct platform_device *pdev)
>   	if (!svsp_data->efuse_parsing(svsp)) {
>   		dev_err(svsp->dev, "efuse data parsing failed\n");
>   		ret = -EPERM;
> -		goto svs_probe_free_resource;
> +		goto svs_probe_free_tefuse;
>   	}
>   
>   	ret = svs_bank_resource_setup(svsp);
>   	if (ret) {
>   		dev_err(svsp->dev, "svs bank resource setup fail: %d\n", ret);
> -		goto svs_probe_free_resource;
> +		goto svs_probe_free_tefuse;
>   	}
>   
>   	svsp->main_clk = devm_clk_get(svsp->dev, "main");
> @@ -2427,12 +2406,12 @@ static int svs_probe(struct platform_device *pdev)
>   		dev_err(svsp->dev, "failed to get clock: %ld\n",
>   			PTR_ERR(svsp->main_clk));
>   		ret = PTR_ERR(svsp->main_clk);
> -		goto svs_probe_free_resource;
> +		goto svs_probe_free_tefuse;
>   	}
>   
>   	ret = svs_clk_enable(svsp);
>   	if (ret)
> -		goto svs_probe_free_resource;
> +		goto svs_probe_free_tefuse;
>   
>   	svsp->base = of_iomap(svsp->dev->of_node, 0);
>   	if (IS_ERR_OR_NULL(svsp->base)) {
> @@ -2477,7 +2456,7 @@ static int svs_probe(struct platform_device *pdev)
>   svs_probe_clk_disable:
>   	svs_clk_disable(svsp);
>   
> -svs_probe_free_resource:
> +svs_probe_free_tefuse:
>   	if (!IS_ERR_OR_NULL(svsp->tefuse))
>   		kfree(svsp->tefuse);
>   

