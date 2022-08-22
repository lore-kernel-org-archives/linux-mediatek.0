Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEE4C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ixFGQG5e9RKRZHpz9Cu92U2YnlZwaXuKgNBpkgvxkE=; b=QkroHjNKAMnwVuvziHQoGU6WS/
	+OWBvWbm/2lrdcLzHiTQOlJNXiq5TBO4+qeP2CanKDNWw/lWmOvdq2lX6XTMlXklmfkjVs2cPQGlI
	CrObx6XYHNw9n5yBvA4cfpTY5VCDrAJgPDhnt3cmxgt/3tcOptddhZWIiz4+U8sQah4K90DkASxAT
	oJ/As9KSH68ZRewjESb3lrvEprbJq1QnxF5jpeoP0+4apsV20ocCAODgwPbnEBoznqxh6rxNmkuda
	Kdpkr2hBYJl+5HUXHz9XiIge6wsrKWduZUUAwAYL7/PMnGfLHZRQZsQQG52jljpa944clpRfSDtYz
	Y//ReLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQA81-00Cda6-SL; Mon, 22 Aug 2022 16:18:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQA7m-00CdTG-LM; Mon, 22 Aug 2022 16:18:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id l33-20020a05600c1d2100b003a645240a95so3932268wms.1;
        Mon, 22 Aug 2022 09:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc;
        bh=6ixFGQG5e9RKRZHpz9Cu92U2YnlZwaXuKgNBpkgvxkE=;
        b=cDRpGmx7LsRKFvYcCRTxTVMl8aKQmv5vX5bo6SPWyEkhiLqp9QMkwVYRNC5BAZ+wR1
         BOoSjyuKZKEu8Z3NSX8Wj92W4KlpRO3iOzt5mVwVTusK5Om+hzKibrjEU0PugeP9PoyA
         nhQJwgIqiDRGyikQzvIyF+0Q6hN2k28XSiBNTkgXvI6kBdOrnylNh6OmRers2WVhyMhX
         UIfaA8iC70+0PYVxTQPvcPMxmM+/2cAAPBcd34RKK+MpOchyR/SEXb8giLxR/jLy1bOx
         dH1WYp+JDfi0ATjYj/NiKnnKiNNFCUOYGBoWo12MJrdhGmHUocs0GsCDrkQ4GE46bMtw
         aLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=6ixFGQG5e9RKRZHpz9Cu92U2YnlZwaXuKgNBpkgvxkE=;
        b=72M1+ihfz33KYr/vUvIL9Ij6s4MX51UrXSb1X1+lN+e01A3+U/FTLATsMNTNSFpeI1
         kexReoh97IlA9FbpLmXeRhDrgEYEAQ+XD9jqZnWQpmVzB2nVcw2yuvJ76yGR0/IR8mQl
         CN1Y0Ejq+QCb0vxKQEVQCmHFLTIcxyNqAadI1kQwn0/fXeGtAwgtfIDOL3c8Zh82whrJ
         xr7+Ca70Yd4bLJIm9dVdoo/tN7E7GWcawRf1/D0fULkM2Iikuo5M+s2d5bdnfgjv9VAQ
         NRaqN/j0JsK8V2PXLOGCN0DNCaPAaM2K9CCdg3gl0DD9seKwFUfYX6u+z8dXKbMQK0L2
         LBKQ==
X-Gm-Message-State: ACgBeo3/+jmhf3s0X9ESx8OPe6/xq+71isHMm/YytptuDif3GH472K8Y
	uvVcJePCGgxIfv5NJnez1Mw=
X-Google-Smtp-Source: AA6agR7y7pHj5qGSGOXHJmt+ZxMtu/Zf41zSLzBGKYd5mK6HGK789VisccjsBBRadh0oYVXV5FulIw==
X-Received: by 2002:a05:600c:502b:b0:3a5:d36a:8b93 with SMTP id n43-20020a05600c502b00b003a5d36a8b93mr15707189wmr.180.1661185081107;
        Mon, 22 Aug 2022 09:18:01 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id o23-20020a05600c511700b003a5c1e916c8sm17342525wms.1.2022.08.22.09.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 09:17:59 -0700 (PDT)
Message-ID: <36dde9aa-b6ea-7194-c1bc-94d52c02649b@gmail.com>
Date: Mon, 22 Aug 2022 18:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
References: <20220822144303.3438467-1-msp@baylibre.com>
 <20220822144303.3438467-3-msp@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 2/4] soc: mediatek: Add support of WAY_EN operations
In-Reply-To: <20220822144303.3438467-3-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_091805_220888_A5D0E13C 
X-CRM114-Status: GOOD (  30.94  )
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



On 22/08/2022 16:43, Markus Schneider-Pargmann wrote:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This updates the power domain to support WAY_EN operations. These
> operations enable a path between different units of the chip and are
> labeled as 'way_en' in the register descriptions.
> 
> This operation is required by the mt8365 for the MM power domain.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>      Changes in v3:
>      - Separated the way_en functions for clarity
>      - Added some checks for infracfg_nao
>      
>      Changes in v2:
>      - some minor style fixes.
>      - Renamed 'wayen' to 'way_en' to clarify the meaning
>      - Updated commit message
> 
>   drivers/soc/mediatek/mtk-pm-domains.c | 162 +++++++++++++++++++++-----
>   drivers/soc/mediatek/mtk-pm-domains.h |  28 +++--
>   2 files changed, 149 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 9734f1091c69..c2cbe0de6aa1 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -43,6 +43,7 @@ struct scpsys_domain {
>   	struct clk_bulk_data *clks;
>   	int num_subsys_clks;
>   	struct clk_bulk_data *subsys_clks;
> +	struct regmap *infracfg_nao;
>   	struct regmap *infracfg;
>   	struct regmap *smi;
>   	struct regulator *supply;
> @@ -117,26 +118,61 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
>   					MTK_POLL_TIMEOUT);
>   }
>   
> -static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
> +static int __scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd,
> +				       struct regmap *regmap)
> +{
> +	u32 val;
> +	u32 mask = bpd->bus_prot_mask;
> +	u32 sta_mask = bpd->bus_prot_sta_mask;
> +
> +	if (bpd->bus_prot_reg_update)
> +		regmap_set_bits(regmap, bpd->bus_prot_set, mask);
> +	else
> +		regmap_write(regmap, bpd->bus_prot_set, mask);
> +
> +	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta, val,
> +					(val & sta_mask) == sta_mask,
> +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +}
> +
> +static int scpsys_bus_way_disable(const struct scpsys_bus_prot_data *bpd,
> +				  struct regmap *regmap,
> +				  struct regmap *ack_regmap)
> +{
> +	u32 val;
> +	u32 mask = bpd->bus_prot_mask;
> +	u32 sta_mask = bpd->bus_prot_sta_mask;
> +
> +	if (bpd->bus_prot_reg_update)
> +		regmap_clear_bits(regmap, bpd->bus_prot_set, mask);
> +	else
> +		regmap_write(regmap, bpd->bus_prot_set, mask);
> +
> +	if (bpd->ignore_clr_ack)
> +		return 0;
> +
> +	return regmap_read_poll_timeout(ack_regmap, bpd->bus_prot_sta, val,
> +					(val & sta_mask) == sta_mask,
> +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +}
> +
> +static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd,
> +				      struct regmap *regmap, struct regmap *infracfg_nao)
>   {
>   	int i, ret;
>   
>   	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> -		u32 val, mask = bpd[i].bus_prot_mask;
> -
> -		if (!mask)
> +		if (!bpd[i].bus_prot_mask)
>   			break;
>   
> -		if (bpd[i].bus_prot_reg_update)
> -			regmap_set_bits(regmap, bpd[i].bus_prot_set, mask);
> +		if (bpd[i].way_en)
> +			ret = scpsys_bus_way_disable(&bpd[i], regmap, infracfg_nao);
>   		else
> -			regmap_write(regmap, bpd[i].bus_prot_set, mask);
> -
> -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> -					       val, (val & mask) == mask,
> -					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> -		if (ret)
> +			ret = __scpsys_bus_protect_enable(&bpd[i], regmap);
> +		if (ret) {
> +			pr_err("%s %d %d\n", __PRETTY_FUNCTION__, __LINE__, ret);
>   			return ret;
> +		}
>   	}
>   
>   	return 0;
> @@ -146,37 +182,71 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>   {
>   	int ret;
>   
> -	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg, pd->infracfg);
> +	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg,
> +					 pd->infracfg, pd->infracfg_nao);
>   	if (ret)
>   		return ret;
>   
> -	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi);
> +	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi, NULL);
> +}
> +
> +static int __scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
> +					struct regmap *regmap)
> +{
> +	u32 val;
> +	u32 mask = bpd->bus_prot_mask;
> +	u32 sta_mask = bpd->bus_prot_sta_mask;
> +
> +	if (bpd->bus_prot_reg_update)
> +		regmap_clear_bits(regmap, bpd->bus_prot_clr, mask);
> +	else
> +		regmap_write(regmap, bpd->bus_prot_clr, mask);
> +
> +	if (bpd->ignore_clr_ack)
> +		return 0;
> +
> +	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta, val,
> +					!(val & sta_mask), MTK_POLL_DELAY_US,
> +					MTK_POLL_TIMEOUT);
> +}
> +
> +static int scpsys_bus_way_enable(const struct scpsys_bus_prot_data *bpd,
> +				 struct regmap *regmap,
> +				 struct regmap *ack_regmap)
> +{
> +	u32 val;
> +	u32 mask = bpd->bus_prot_mask;
> +	u32 sta_mask = bpd->bus_prot_sta_mask;
> +
> +	if (bpd->bus_prot_reg_update)
> +		regmap_set_bits(regmap, bpd->bus_prot_clr, mask);
> +	else
> +		regmap_write(regmap, bpd->bus_prot_clr, mask);
> +
> +	return regmap_read_poll_timeout(ack_regmap, bpd->bus_prot_sta, val,
> +					(val & sta_mask) == sta_mask,
> +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>   }
>   
>   static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
> -				       struct regmap *regmap)
> +				       struct regmap *regmap,
> +				       struct regmap *infracfg_nao)
>   {
>   	int i, ret;
>   
>   	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
> -		u32 val, mask = bpd[i].bus_prot_mask;
> -
> -		if (!mask)
> +		if (!bpd[i].bus_prot_mask)
>   			continue;
>   
> -		if (bpd[i].bus_prot_reg_update)
> -			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, mask);
> +		if (bpd[i].way_en)
> +			ret = scpsys_bus_way_enable(&bpd[i], regmap,
> +						    infracfg_nao);
>   		else
> -			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
> -
> -		if (bpd[i].ignore_clr_ack)
> -			continue;
> -
> -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> -					       val, !(val & mask),
> -					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> -		if (ret)
> +			ret = __scpsys_bus_protect_disable(&bpd[i], regmap);
> +		if (ret) {
> +			pr_err("%s %d %d\n", __PRETTY_FUNCTION__, __LINE__, ret);
>   			return ret;
> +		}
>   	}
>   
>   	return 0;
> @@ -186,11 +256,12 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
>   {
>   	int ret;
>   
> -	ret = _scpsys_bus_protect_disable(pd->data->bp_smi, pd->smi);
> +	ret = _scpsys_bus_protect_disable(pd->data->bp_smi, pd->smi, NULL);
>   	if (ret)
>   		return ret;
>   
> -	return _scpsys_bus_protect_disable(pd->data->bp_infracfg, pd->infracfg);
> +	return _scpsys_bus_protect_disable(pd->data->bp_infracfg,
> +			pd->infracfg, pd->infracfg_nao);
>   }
>   
>   static int scpsys_regulator_enable(struct regulator *supply)
> @@ -294,6 +365,21 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   	return 0;
>   }
>   
> +static bool scpsys_bp_infracfg_has_way_en(const struct scpsys_bus_prot_data *bpd)
> +{
> +	int i;
> +
> +	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> +		if (!bpd[i].bus_prot_mask)
> +			break;

So MT8365_POWER_DOMAIN_MM will return false as the first member of bp_infracfg 
is BUS_PROT_WR(...)

Apart from that, why don't you use a CAPS to acheive the same?

> +
> +		if (bpd[i].way_en)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   static struct
>   generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
>   {
> @@ -364,6 +450,20 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>   			return ERR_CAST(pd->smi);
>   	}
>   
> +	if (scpsys_bp_infracfg_has_way_en(pd->data->bp_smi)) {
> +		dev_err(scpsys->dev, "bp_smi does not support WAY_EN\n");

Do we really need to check the correctness of the driver data at runtime?

> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	pd->infracfg_nao = syscon_regmap_lookup_by_phandle_optional(
> +		node, "mediatek,infracfg_nao");

Not in the binding description.

> +	if (IS_ERR(pd->infracfg_nao)) {
> +		if (scpsys_bp_infracfg_has_way_en(pd->data->bp_infracfg))
> +			return ERR_CAST(pd->infracfg_nao);
> +
> +		pd->infracfg_nao = NULL;
> +	}
> +
>   	num_clks = of_clk_get_parent_count(node);
>   	if (num_clks > 0) {
>   		/* Calculate number of subsys_clks */
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 7d3c0c36316c..974c68a1d89c 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -41,23 +41,29 @@
>   
>   #define SPM_MAX_BUS_PROT_DATA		6
>   
> -#define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
> -		.bus_prot_mask = (_mask),			\
> -		.bus_prot_set = _set,				\
> -		.bus_prot_clr = _clr,				\
> -		.bus_prot_sta = _sta,				\
> -		.bus_prot_reg_update = _update,			\
> -		.ignore_clr_ack = _ignore,			\
> +#define _BUS_PROT(_mask, _sta_mask, _set, _clr, _sta, _update, _ignore, _way_en) {	\
> +		.bus_prot_mask = (_mask),				\
> +		.bus_prot_set = _set,					\
> +		.bus_prot_clr = _clr,					\
> +		.bus_prot_sta = _sta,					\
> +		.bus_prot_sta_mask = _sta_mask,				\
> +		.bus_prot_reg_update = _update,				\
> +		.ignore_clr_ack = _ignore,				\
> +		.way_en = _way_en,					\
>   	}
>   
>   #define BUS_PROT_WR(_mask, _set, _clr, _sta)			\
> -		_BUS_PROT(_mask, _set, _clr, _sta, false, false)
> +		_BUS_PROT(_mask, _mask, _set, _clr, _sta, false, false, false)
>   
>   #define BUS_PROT_WR_IGN(_mask, _set, _clr, _sta)		\
> -		_BUS_PROT(_mask, _set, _clr, _sta, false, true)
> +		_BUS_PROT(_mask, _mask, _set, _clr, _sta, false, true, false)
>   
>   #define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)		\
> -		_BUS_PROT(_mask, _set, _clr, _sta, true, false)
> +		_BUS_PROT(_mask, _mask, _set, _clr, _sta, true, false, false)
> +
> +#define BUS_PROT_WAY_EN(_en_mask, _sta_mask, _set, _sta)	\
> +		_BUS_PROT(_en_mask, _sta_mask, _set, _set, _sta, true, false, \
> +			  true)
>   
>   #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
>   		BUS_PROT_UPDATE(_mask,				\
> @@ -70,8 +76,10 @@ struct scpsys_bus_prot_data {
>   	u32 bus_prot_set;
>   	u32 bus_prot_clr;
>   	u32 bus_prot_sta;
> +	u32 bus_prot_sta_mask;

I'm not very happy with the naming. In the end we need an extra mask for bus 
protection using WAY_EN. But right now I can't come up with a good name.

Regards,
Matthias

>   	bool bus_prot_reg_update;
>   	bool ignore_clr_ack;
> +	bool way_en;
>   };
>   
>   /**

