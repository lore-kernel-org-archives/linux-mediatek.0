Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC25C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vOobyFVXymRVpn25jWFSnKeLAFJPxK2s0OnRHMF8AI=; b=yigmHYNacycfqse7pKIdpU+ExM
	CtD2ekW9KXd+zRxti7JziEgQIajo400QwJnNyQMAg4VmfCYJUT24nTn9yG+z3Xf49+4riqG8ltmMR
	Xwt6kAShkSqYGy5Z/6N4PfVip+cg1xR+GylVQH1yqdrb86oLa5VOaZvSlCCQ9LuV2t3kYxnw+fZSp
	YckVaAbRU7hwx3FirLDELspaGph/jglb8uTSf0918V01ZUcSZE65NMZy2a3SV0XJErUbF2yJ0IsST
	FejVuOGKyu/vL8FFuEBajSKvAujRBaidkS7Foqbh+JpMr89D6m1Ru/azlguywwe3HwXA2ccfLhjMS
	RdBISTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Cpn-007xyf-Pv; Fri, 17 Jun 2022 14:20:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Cpa-007xuv-WB; Fri, 17 Jun 2022 14:20:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e25so2102642wrc.13;
        Fri, 17 Jun 2022 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3vOobyFVXymRVpn25jWFSnKeLAFJPxK2s0OnRHMF8AI=;
        b=Q30wclNYpthRDofrENHk9nKy2Pnt14+N0JhXzAnqU/vw/wjQgC4HxGJewSwSXhNe9r
         ZZbtcgKQlw9lojmioasAswJcZN55/pi/yVE+S3KslKTZPs3scqztumKtx9bjlt0vmE/4
         fHC4lhZFoP85iuSbr2W/VjxlRUIe62B2SlIVnCG+2kn6UvaCGFXIMHiyTWIEFu7yccY0
         TMNwBaSDI+FU3tDvrP2pjEPCj5bBwFNhmU9yRK98F8mrgO+1kPQoZGMkm+aXb15cOehV
         KvozbvcGEQyGsM6ujq2hrKENVriON5KcmZBU18t+GPvZttiIUM7aO6gLYsMDq5UgWRfi
         UFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3vOobyFVXymRVpn25jWFSnKeLAFJPxK2s0OnRHMF8AI=;
        b=5cfiugMSkubV1vKrEjQIXlLhEIFHIHcaaVPDqKsyFhi453a/PiTBU5MzFBLDaZy8k9
         8UL0wbXCsv0sX2VgOUqbImk5B0xEy44e5nWWzckCXKSChGvS5W0p9RPjnrlII3wx9sR9
         6ErxFZpI6WQ6x3HYmftJ1FMVL71uOGtldrHnhopzDUy/WECFZ7nED22wj8YmVujoAcm5
         9gpxWa3LBeXgI7o2kyl4xjIKtqXKveqLhuP/EhzynI2g4nmcAS2eftMR7gtYN+VYB/tE
         sm64VzRBQx0eDZY9Du4DoX1uLXEWu+O9RYRQ9CkYiM8wpb53cVD+aOCpBrfn4fvSrRRe
         oXkw==
X-Gm-Message-State: AJIora+ndwCsiFDgHSzVu5cshNS5rja6sVxMyUCWvgpWTTuqK4F3DrS1
	W52VlQKt6YikXFNI6rVOWCHGcoJyQy/rUg==
X-Google-Smtp-Source: AGRyM1tSFKuuZgKhZCminfQNyUROPCnyVZuRKnAJ/XwFsiDP7GyB2J+se02W0S3o38+Jv4Sjok+blw==
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id o9-20020a5d47c9000000b0020fe7da6a48mr9593609wrc.315.1655475612766;
        Fri, 17 Jun 2022 07:20:12 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id d8-20020adfc088000000b00213ba0cab3asm4820839wrf.44.2022.06.17.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 07:20:11 -0700 (PDT)
Message-ID: <c385ab55-bffc-8185-5d8b-f2fed1dd54a4@gmail.com>
Date: Fri, 17 Jun 2022 16:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP
 cap
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220530204214.913251-1-fparent@baylibre.com>
 <20220530204214.913251-3-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220530204214.913251-3-fparent@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_072015_103633_DC873764 
X-CRM114-Status: GOOD (  21.35  )
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



On 30/05/2022 22:42, Fabien Parent wrote:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This adds support of MTK_SCPD_STRICT_BUSP cap.
> This is required by the mt8365, for the MM power domain.
> 

Please explain better waht this flag is doing.

> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>   drivers/soc/mediatek/mtk-pm-domains.c | 37 ++++++++++++++++++++-------
>   drivers/soc/mediatek/mtk-pm-domains.h |  1 +
>   2 files changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 90b91b3b19a8..beaa5785fda2 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -263,17 +263,36 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
>   	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>   
> -	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> -	if (ret)
> -		goto err_pwr_ack;

I think it would help readability if we would enable the clocks only in the case 
that MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUSP) is false. Then we would only need 
to add the same if to the error path of err_disable_subsys_clks, correct?

Regards,
Matthias

> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUSP)) {
> +		/*
> +		 * In few Mediatek platforms(e.g. MT6779), the bus protect
> +		 * policy is stricter, which leads to bus protect release must
> +		 * be prior to bus access.
> +		 */
> +		ret = scpsys_sram_enable(pd);
> +		if (ret < 0)
> +			goto err_pwr_ack;
>   
> -	ret = scpsys_sram_enable(pd);
> -	if (ret < 0)
> -		goto err_disable_subsys_clks;
> +		ret = scpsys_bus_protect_disable(pd);
> +		if (ret < 0)
> +			goto err_pwr_ack;
>   
> -	ret = scpsys_bus_protect_disable(pd);
> -	if (ret < 0)
> -		goto err_disable_sram;
> +		ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> +		if (ret < 0)
> +			goto err_pwr_ack;
> +	} else {
> +		ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> +		if (ret)
> +			goto err_pwr_ack;
> +
> +		ret = scpsys_sram_enable(pd);
> +		if (ret < 0)
> +			goto err_disable_subsys_clks;
> +
> +		ret = scpsys_bus_protect_disable(pd);
> +		if (ret < 0)
> +			goto err_disable_sram;
> +	}
>   
>   	return 0;
>   
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index a3955d960233..5347471bc3c4 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -8,6 +8,7 @@
>   #define MTK_SCPD_SRAM_ISO		BIT(2)
>   #define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
>   #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
> +#define MTK_SCPD_STRICT_BUSP		BIT(5)
>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
>   
>   #define SPM_VDE_PWR_CON			0x0210

