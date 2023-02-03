Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B79C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eCtsGF41WjTzwj4MiFKnyo2/eolWQk6TBMwedwS+GA=; b=msY/3RbIz1JY5X5QU5+yevLi8N
	QzrKMpX8DyJ5jVsqvpnOCY3e8yap+oOUS1A5gOTWWemF0BHgxFpR4zIejYhPTt+jf/QyMerUV368H
	wiJCNG+LBOlZRhd79U2El4zdUCZRV3xfoLHZBD9106X38OJflHX5Ka+0ZsbrLP9L/aPCd2PxBN1g3
	G5gNM+RIeRy1v8cJ2E488u2kZoNwaoc/QpzxWtWkzkMGR1ucf7llQPMO2Wdfwu96hSF/jnjy55QGQ
	kVQOTDNiKOzZhFlWHySRGJOzKppPgJ5j/YTe1f9DbnrJz5PoEatJvNsIQKPL/5pB8cSUp19/mZFLC
	KwRQm5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvEy-001mVI-Ii; Fri, 03 Feb 2023 12:32:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvEn-001mOX-Ao; Fri, 03 Feb 2023 12:32:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so5911760wmb.2;
        Fri, 03 Feb 2023 04:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eCtsGF41WjTzwj4MiFKnyo2/eolWQk6TBMwedwS+GA=;
        b=kIyp6KZ9t6gqZ422axb8Y3xXddye1aQeR3SpqwKHb9KL+wwEeTlv45VdsnqpwibyUF
         FYERsxE76QWspJEMIlt0kDV4Il2sZlaZLzRwtSD9I2t6iQQLD/b2+B02dOV5h2mHphYN
         BsOpj5uLCAnBECldPaMKcPFsk/ZmI1M2W+kAVJT6mpjsMmwZGDMnG1R4PEUujP6dukOI
         gVpjB51enE9NjNHZBLXSIAk0Lrs01vr1GOarE5poGB/4NgxhCE2yMxHuQJ2u33cogE8x
         O190KYijsBCbVyqoBhyxkQAlGMyxJfy9SX1tH2suQ+LPkVivuCxmGqNFcWNpMx5KswML
         4c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eCtsGF41WjTzwj4MiFKnyo2/eolWQk6TBMwedwS+GA=;
        b=BacfAiJdfDlIjc8csjyqU1Oizecc9Go5Q5LSeP56cfNNAYzJjxgJ+nhGsFD6Uo4C6+
         eecHAnCw8TAeva17GxKja/pItpPcBJqJ+FYsnVy/6235IGxGiGOgcRmcikhdN1he5dLN
         VeuTkfGkh9OicFXu4KpjR2dMIrl0ilAaPd9JZT542QXznjOpRqgJNol97u0Kxcqexiy2
         6du5VsXgOojp1dBxalkLDRFr34JjHeX/nQbWfbvsqjvGf5NYgpdo1csLIiFq1yYz35kB
         0iOYbmAAhjEJRDrxnXYa4oXB8z2OmV+90YmL83Dz1C5oAD3rM/5FL+NbtGupe0QY3pAx
         9cnw==
X-Gm-Message-State: AO0yUKVjIcGunek5pO+uZ2wGfAtgqJ+CetyCU2I41VzWImuZMa5A2KUN
	BT2vrHKF9TNiA6OUN5rhFLE=
X-Google-Smtp-Source: AK7set/bhNPKI2837cPL0+Z8686YxoP/jGLaYlKihTYitHEjiZgeRhGyDr5j2uRpvxfFiiS27awlMg==
X-Received: by 2002:a05:600c:3b14:b0:3dc:5c86:12f3 with SMTP id m20-20020a05600c3b1400b003dc5c8612f3mr11940588wms.1.1675427533293;
        Fri, 03 Feb 2023 04:32:13 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b003dfeea6a85csm82235wmo.31.2023.02.03.04.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 04:32:12 -0800 (PST)
Message-ID: <fb36ce3f-dd67-32b5-7ce0-ad15dd3b540a@gmail.com>
Date: Fri, 3 Feb 2023 13:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230105170735.1637416-1-msp@baylibre.com>
 <20230105170735.1637416-4-msp@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 3/8] soc: mediatek: pm-domains: Create bus protection
 operation functions
In-Reply-To: <20230105170735.1637416-4-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_043217_416957_3FED4643 
X-CRM114-Status: GOOD (  19.63  )
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



On 05/01/2023 18:07, Markus Schneider-Pargmann wrote:
> Separate the register access used for bus protection enable/disable into
> their own functions. These will be used later for WAY_EN bits.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>   drivers/soc/mediatek/mtk-pm-domains.c | 68 +++++++++++++++------------
>   1 file changed, 39 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 4333cd297405..999e1f6c86b0 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -117,26 +117,50 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
>   					MTK_POLL_TIMEOUT);
>   }
>   
> +static int scpsys_bus_protect_clear(const struct scpsys_bus_prot_data *bpd,
> +				    struct regmap *regmap)
> +{
> +	u32 val;
> +	u32 sta_mask = bpd->bus_prot_sta_mask;
> +
> +	if (bpd->bus_prot_reg_update)
> +		regmap_clear_bits(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
> +	else
> +		regmap_write(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
> +
> +	if (bpd->ignore_clr_ack)
> +		return 0;
> +
> +	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
> +					val, !(val & sta_mask),
> +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +}
> +

NIT: please move this function below
static int scpsys_bus_protect_enable(struct scpsys_domain *pd) {...}

This allows for better readability.

> +static int scpsys_bus_protect_set(const struct scpsys_bus_prot_data *bpd,
> +				  struct regmap *regmap)
> +{
> +	u32 val;
> +	u32 sta_mask = bpd->bus_prot_sta_mask;
> +
> +	if (bpd->bus_prot_reg_update)
> +		regmap_set_bits(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
> +	else
> +		regmap_write(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
> +
> +	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
> +					val, (val & sta_mask) == sta_mask,
> +					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +}
> +
>   static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
>   {
>   	int i, ret;
>   
>   	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> -		u32 val;
> -		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
> -		u32 sta_mask = bpd[i].bus_prot_sta_mask;
> -
> -		if (!set_clr_mask)
> +		if (!bpd[i].bus_prot_set_clr_mask)
>   			break;
>   
> -		if (bpd[i].bus_prot_reg_update)
> -			regmap_set_bits(regmap, bpd[i].bus_prot_set, set_clr_mask);
> -		else
> -			regmap_write(regmap, bpd[i].bus_prot_set, set_clr_mask);
> -
> -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> -					       val, (val & sta_mask) == sta_mask,
> -					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +		ret = scpsys_bus_protect_set(&bpd[i], regmap);
>   		if (ret)
>   			return ret;
>   	}
> @@ -161,24 +185,10 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
>   	int i, ret;
>   
>   	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
> -		u32 val;
> -		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
> -		u32 sta_mask = bpd[i].bus_prot_sta_mask;
> -
> -		if (!set_clr_mask)
> -			continue;
> -
> -		if (bpd[i].bus_prot_reg_update)
> -			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, set_clr_mask);
> -		else
> -			regmap_write(regmap, bpd[i].bus_prot_clr, set_clr_mask);
> -
> -		if (bpd[i].ignore_clr_ack)
> +		if (!bpd[i].bus_prot_set_clr_mask)
>   			continue;
>   
> -		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
> -					       val, !(val & sta_mask),
> -					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +		ret = scpsys_bus_protect_clear(&bpd[i], regmap);
>   		if (ret)
>   			return ret;
>   	}

