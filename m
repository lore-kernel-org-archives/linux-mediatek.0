Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81B5C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0BrED6HiZlYLEkAtDG9DbtiZG4uzHzIJXFHLE8rceI=; b=W3O05Ivg0JEhZW9nmiqGe00rdP
	1Bk0NFEKGoQl8kopO+LnWOW9Vm+7LMVlZigdj0pIHnQbj5gMQIv9TuKWQzgD/MhjalVdRoBdF9zDW
	EL53y26fj8M5XLAriS98O+K7RGoKTsg4Oa8sztBWoJeBbahWm6Gxzs2yzyMchUZl1dTZeGXmniwEq
	EVTY5Phu8Y4yJ5to9MhnFoPjw2yrEc3Cojtu8caQLsfIKToAZn3Meuijdw0dAiv36ttsYnx3WVjTq
	f1TZa2eRd/o7VYeN9lypsJg5J/5VNZU/2XV8yY9sxIPs6wqeCeckHk4jfYVGEj3Nb84tZp7B3JMNh
	1HC+Auyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYzH-00FrUR-3a; Thu, 02 Feb 2023 12:46:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNYyv-00FrMq-Et; Thu, 02 Feb 2023 12:46:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id o18so1604731wrj.3;
        Thu, 02 Feb 2023 04:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0BrED6HiZlYLEkAtDG9DbtiZG4uzHzIJXFHLE8rceI=;
        b=XqlhWz7lsb3tcDfLY60BFq3pSD6FZci45LC7s17bbOLKfqq7Rd+os4HlSW7khhk4yA
         jUsjsHDsOP4owxQtHsRVd4GE9dfOI68Z9kLwdVkqn0q8BHWf+1TIJ1tIWTpInRUPMFLV
         dtLGkUJc4kUVO7xWN/Ej2eZ7jEfEh/1QpHvSMl7gpAKgHKY0qJKm7mJjUFEundCrPzwk
         1Mnsjqm34/zmyTxM1kdvlE5w1954IsMwF4YOFNnbbN4v37iHklTv8X5UKRLPaaEJ1ak5
         jgUc9MhTGwrl6YFpGIgBGRCztYJJlS38BK48UvLYegL/kouyqfp0RBP3npDHSz+4S8oy
         b3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0BrED6HiZlYLEkAtDG9DbtiZG4uzHzIJXFHLE8rceI=;
        b=3S6Bv9dS+bVwxmkjU6FaCMQrGTqrLB8JXh5Mr598QDp6s4LO/k/03VWvYIeusTnJ5g
         2Wb5lpsQ6IWhx15IwObpnkwSYWxgKY1j2G1LPVx1i+vFdkFQCw+E+NJwKodC2VKwGeTc
         c8agSNDHRBwp2GTUuwLZxWW4gRFnK5tlSgy1XrToMno5LGVTrcXZEsisRYRPsHpxu1lU
         szLd0iGctwi/HsGmAbXpw9SzqAY+yflSEy8iHV+BJUYwAlZXd4eFk0ZzLxzf/Z4fDOD9
         6vOub1XBzMrxA5Go3KdZGsMf1Um0qDlUUEnZUddg54Q+sHqnwmCmBEoOMuRKI/+knD0C
         gW5w==
X-Gm-Message-State: AO0yUKXLygpvoHnZFUn/PXRb5XHRKsuCqYRDu0u89s7M/c/g9fwAxFkV
	8mOHEXZiq6Mw13qy6skjlEc=
X-Google-Smtp-Source: AK7set8M/e7bCmXUmyvdGLd3KGUnk49hegzN9IjldxwFiSSTyQruNH77mmxylrX8iDTx++ADsy4ASw==
X-Received: by 2002:adf:a202:0:b0:2be:f21:6af6 with SMTP id p2-20020adfa202000000b002be0f216af6mr5420375wra.23.1675341983772;
        Thu, 02 Feb 2023 04:46:23 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d3-20020adfe2c3000000b002bc7fcf08ddsm19583769wrj.103.2023.02.02.04.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:46:23 -0800 (PST)
Message-ID: <793fb7d0-1497-4051-d8cb-aaac7f0d07fd@gmail.com>
Date: Thu, 2 Feb 2023 13:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 1/3] soc: mediatek: mtk-svs: use svs get efuse common
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
References: <20230202124104.16504-1-roger.lu@mediatek.com>
 <20230202124104.16504-2-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230202124104.16504-2-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_044625_545909_5CA4D7D0 
X-CRM114-Status: GOOD (  20.36  )
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



On 02/02/2023 13:41, Roger Lu wrote:
> SVS might need to read both svs efuse and thermal efuse on the probe flow.
> Therefore, add a common efuse read function to remove the superfluous
> codes.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Queued for the next merge window.

Thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 71 ++++++++++++----------------------
>   1 file changed, 25 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index f26eb2f637d5..c9899f5df60a 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -1729,26 +1729,28 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
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
> @@ -1796,7 +1798,8 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
>   		svsb->vmax += svsb->dvt_fixed;
>   	}
>   
> -	ret = svs_thermal_efuse_get_data(svsp);
> +	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> +				 &svsp->tefuse, &svsp->tefuse_max);
>   	if (ret)
>   		return false;
>   
> @@ -1901,7 +1904,8 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
>   		}
>   	}
>   
> -	ret = svs_thermal_efuse_get_data(svsp);
> +	ret = svs_get_efuse_data(svsp, "t-calibration-data",
> +				 &svsp->tefuse, &svsp->tefuse_max);
>   	if (ret)
>   		return false;
>   
> @@ -2003,32 +2007,6 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
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
> @@ -2364,8 +2342,9 @@ static int svs_probe(struct platform_device *pdev)
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
> @@ -2373,19 +2352,19 @@ static int svs_probe(struct platform_device *pdev)
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
>   	svsp_irq = platform_get_irq(pdev, 0);
>   	if (svsp_irq < 0) {
>   		ret = svsp_irq;
> -		goto svs_probe_free_resource;
> +		goto svs_probe_free_tefuse;
>   	}
>   
>   	svsp->main_clk = devm_clk_get(svsp->dev, "main");
> @@ -2393,13 +2372,13 @@ static int svs_probe(struct platform_device *pdev)
>   		dev_err(svsp->dev, "failed to get clock: %ld\n",
>   			PTR_ERR(svsp->main_clk));
>   		ret = PTR_ERR(svsp->main_clk);
> -		goto svs_probe_free_resource;
> +		goto svs_probe_free_tefuse;
>   	}
>   
>   	ret = clk_prepare_enable(svsp->main_clk);
>   	if (ret) {
>   		dev_err(svsp->dev, "cannot enable main clk: %d\n", ret);
> -		goto svs_probe_free_resource;
> +		goto svs_probe_free_tefuse;
>   	}
>   
>   	svsp->base = of_iomap(svsp->dev->of_node, 0);
> @@ -2439,7 +2418,7 @@ static int svs_probe(struct platform_device *pdev)
>   svs_probe_clk_disable:
>   	clk_disable_unprepare(svsp->main_clk);
>   
> -svs_probe_free_resource:
> +svs_probe_free_tefuse:
>   	if (!IS_ERR_OR_NULL(svsp->tefuse))
>   		kfree(svsp->tefuse);
>   

