Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1096EC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlJgCog2Hv8jB8412B4wI1AwEbA0UN9A/8RVLd437gg=; b=FyLgL5eRGF2XOsZYmu4ZgyM6gL
	gumb693Hn4jeNMr2qn7xHrQdZgPIz+JUpmSOkgFzpkGMVAw7y86X5UqKB38oV2kPqOkaovJB3LzxS
	kp8AYvGFjFSHGctB6EAnk0zPjAyOoZghVqj3RysIq+qkgfmLYa0Z5H1hNqhAsuzTj6LvUgk19/o+6
	gCwu/ozQss1KbixZCYrADuyByOV/CpHtCXSrnFqgKm3nwfnwyXUC+G43ElGvB2OVGsKyHGZOaEz4e
	sFOSKTk2hfOmuVYT/i8vAy9g0WDjOOfbfd6M76uF3UoR2fF1im2Ub2PvzpegakU3m5UclyjGfg8HN
	PS4dXfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqiz-0087WT-0P; Tue, 31 Jan 2023 13:31:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqim-0087S3-Lz; Tue, 31 Jan 2023 13:30:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so5035378wms.1;
        Tue, 31 Jan 2023 05:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlJgCog2Hv8jB8412B4wI1AwEbA0UN9A/8RVLd437gg=;
        b=lmUEaSQsWaxheHAZrGoD6GfSUA+RbAdbdhfinS5hw+aurNtAA90Wnh8auikxHeq4Ls
         577MVNxMeg6DkKPS8Q894c48ZFihssvGG9cYaTB1ESrwBZCT4chLPszsO1ACGTR6Pl2j
         VqrbKRa/S6u4ensww/+oBfYBFB2cMnxV3v3M6IJHdkLc1DAvarp1W8dE6/5Haxg4LINk
         u4G1giaLslAjO9tVaezL2rzywjOay10Zg87QogUX3INl+qeWlzncVOzivNcs/VZiIAVK
         PVqBo+U5bNT5DxvfV9BRO7UyXU9FwqsEe7hPGaoEtVN9hidmPezh6PJ5xDPmFPa1V4uT
         FIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlJgCog2Hv8jB8412B4wI1AwEbA0UN9A/8RVLd437gg=;
        b=px/Z3V0hHP4zBpCOCeq89AL6ds7w9oR2FRKurzSNZtgNXUF0rYSM99fAzmyDDfZZXE
         f/U1rvmO5zMMAX8yGgF9XjBTO2pOo08Gji+aHoUL1hNmNj6aw/PDOmdNLYdv2Gn5hifH
         MEVM6gy/6YHOpCgMmNx6TxDKjMLcRzIV9B825ZTD/0mOO6OPbNwaJDygg5CuEsztGSZV
         uPrEMHTzt3ZbETf9weE8pfHasL4z7kGy/KHf5rr07zU7qhhr2tfxVh4oAdMp5Uf1aeLO
         QGgBZ2yWD+YqQdcxLmAXZkDRz/FLeoyagei4xLmSNXY5NO2pfPd8IGqSrMR3T5luNjo5
         rz/g==
X-Gm-Message-State: AO0yUKXoukJPEuJoZV1kVK8tdZGnaLWYI7EP+/N1nG84pyYqNRKaMSYg
	XKCGps+yjWTJZtI/l3MVGdQ=
X-Google-Smtp-Source: AK7set8/csf6Jb47rd2+WT8vJqeSqRgiZXGTv0gl7wmEt9eROuj0FoQXqNwIKgx+X51hhlnfWyt1hw==
X-Received: by 2002:a1c:f014:0:b0:3dc:4318:d00d with SMTP id a20-20020a1cf014000000b003dc4318d00dmr14993723wmb.11.1675171846445;
        Tue, 31 Jan 2023 05:30:46 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c2ca600b003dd1bd66e0dsm2807447wmc.3.2023.01.31.05.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:30:45 -0800 (PST)
Message-ID: <bcb229bf-4243-05aa-93db-98af1c779880@gmail.com>
Date: Tue, 31 Jan 2023 14:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 11/14] soc: mediatek: mtk-svs: delete superfluous
 platform data entries
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
 <20230111074528.29354-12-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-12-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_053048_776985_DD406F20 
X-CRM114-Status: GOOD (  20.67  )
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
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The platform name and efuse parsing function pointer are only used while
> probing the device. Use them from the svs_platform_data struct instead.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 9d9210c22289..bd23d1111d7b 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -313,14 +313,12 @@ static const u32 svs_regs_v2[] = {
>   
>   /**
>    * struct svs_platform - svs platform control
> - * @name: svs platform name
>    * @base: svs platform register base
>    * @dev: svs platform device
>    * @main_clk: main clock for svs bank
>    * @pbank: svs bank pointer needing to be protected by spin_lock section
>    * @banks: svs banks that svs platform supports
>    * @rst: svs platform reset control
> - * @efuse_parsing: svs platform efuse parsing function pointer
>    * @efuse_max: total number of svs efuse
>    * @tefuse_max: total number of thermal efuse
>    * @regs: svs platform registers map
> @@ -330,14 +328,12 @@ static const u32 svs_regs_v2[] = {
>    * @clk_cnt: clock count shows the clk enable/disable times by svs driver
>    */
>   struct svs_platform {
> -	char *name;
>   	void __iomem *base;
>   	struct device *dev;
>   	struct clk *main_clk;
>   	struct svs_bank *pbank;
>   	struct svs_bank *banks;
>   	struct reset_control *rst;
> -	bool (*efuse_parsing)(struct svs_platform *svsp);
>   	size_t efuse_max;
>   	size_t tefuse_max;
>   	const u32 *regs;
> @@ -2066,7 +2062,7 @@ static bool svs_is_efuse_data_correct(struct svs_platform *svsp)
>   	svsp->efuse_max /= sizeof(u32);
>   	nvmem_cell_put(cell);
>   
> -	return svsp->efuse_parsing(svsp);
> +	return true;
>   }
>   
>   static struct device *svs_get_subsys_device(struct svs_platform *svsp,
> @@ -2400,9 +2396,7 @@ static int svs_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	svsp->dev = &pdev->dev;
> -	svsp->name = svsp_data->name;
>   	svsp->banks = svsp_data->banks;
> -	svsp->efuse_parsing = svsp_data->efuse_parsing;
>   	svsp->regs = svsp_data->regs;
>   	svsp->bank_max = svsp_data->bank_max;
>   
> @@ -2413,6 +2407,12 @@ static int svs_probe(struct platform_device *pdev)
>   	if (!svs_is_efuse_data_correct(svsp)) {
>   		dev_notice(svsp->dev, "efuse data isn't correct\n");
>   		ret = -EPERM;
> +		goto svs_probe_free_efuse;
> +	}
> +
> +	if (!svsp_data->efuse_parsing(svsp)) {
> +		dev_err(svsp->dev, "efuse data parsing failed\n");
> +		ret = -EPERM;
>   		goto svs_probe_free_resource;
>   	}
>   
> @@ -2448,7 +2448,7 @@ static int svs_probe(struct platform_device *pdev)
>   	}
>   
>   	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
> -					IRQF_ONESHOT, svsp->name, svsp);
> +					IRQF_ONESHOT, svsp_data->name, svsp);
>   	if (ret) {
>   		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
>   			svsp_irq, ret);
> @@ -2478,11 +2478,13 @@ static int svs_probe(struct platform_device *pdev)
>   	svs_clk_disable(svsp);
>   
>   svs_probe_free_resource:
> -	if (!IS_ERR_OR_NULL(svsp->efuse))
> -		kfree(svsp->efuse);
>   	if (!IS_ERR_OR_NULL(svsp->tefuse))
>   		kfree(svsp->tefuse);
>   
> +svs_probe_free_efuse:
> +	if (!IS_ERR_OR_NULL(svsp->efuse))
> +		kfree(svsp->efuse);
> +
>   	return ret;
>   }
>   

