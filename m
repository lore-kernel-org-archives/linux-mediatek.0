Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78EAC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvYOJ7mjGZt2sFpHqF+LZA5k69lV+Vn24RY4TlLt1N4=; b=SnnfwZz5KimqSdr14dVnj8Guk6
	UxUcpVdPG98G9xFuyPhGL5fhbpca/Tp8QeC9kVdZzacwolUjo71KDLJGnTpSFfoCmUokdz7e6xoQk
	DxGsjzGXjQT+gmZ32Olmo5n9xq16sWKzdlYDzEumdeM2XqMr7TGSqWRlb8Jn+D5QHgcgoOpHMPYXF
	Z0ifsicwILGb9MKUMnamOZWKFS9Dv6mT87uIg1eU4ZxPLci+/6bWElc6vdFy1GDRVN2Alj7InxpzV
	mnFNxcK8ucug3qneqytZlMyjZ9Saz2US4pxSKBNNIbQXE3EqUptW3pRvGZcSTVL0fImVEhYwkPLnd
	qHWsF8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5zi-00DYBi-HC; Mon, 21 Nov 2022 12:33:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5zg-00DY9q-2w; Mon, 21 Nov 2022 12:33:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so8908595wmg.2;
        Mon, 21 Nov 2022 04:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvYOJ7mjGZt2sFpHqF+LZA5k69lV+Vn24RY4TlLt1N4=;
        b=SCz7aRwoP9trV3qSF8SVLaZgUfTKYE2NARsIggbXxNvrhR9dHOcL/yo8gAimbe//Yw
         C5SOkZks30dbzjrJzHHSFE07QW0FaVrFaiU676w53C/FRDJ8YFN4Pk5YdyopBpWB/4G2
         X6dZS58cacMsVQWUr9uYcFeLxYy8mCx2u88Lrux1NcaExEPqgTQO2Qeluvl+OszhZXdw
         Db0VLwCEruzSNj8ndz+guqCWvc/0CyHXuV/zYpl26JayChz7bKNz3Jw5uwx2GdhWPywB
         jpB47N5X79l34W7B8zPlmStAVIC86HhH5BAaZZZPH1EHlLyp/zH3iIdZhan3Lb4NoSFg
         TfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvYOJ7mjGZt2sFpHqF+LZA5k69lV+Vn24RY4TlLt1N4=;
        b=pKkJuCRzD/LS6Eqb/YGcJ/LoXD1LmWX+JBNsJq8m/reMtiMOxCvjQJVy9oW1dXuavF
         meSxM9tkmt1aZfl6F1HpFmNN0XqwRKMTsB6bvzoLR1QZJAyMKIdg3mxVQAbA25tAAyHZ
         OoHcnxojMscd/NKXE6YW3LpaYwsP955+cfA4ZiAKsrqiHP/hXWZ9D2TBsI4EhWnJ99hn
         aSWNk+HXwnszIWyXHImWJ08WKQ/ShnbFPE/CM7ytNBOZcNHayHUh6eHTv+OXexMXJ2mi
         Hve9Boy1litwdLNcErZxZeuYFYonmF6K4aFissWrU+eADtb/tpjgowGnKorcxgiQdo14
         fmTA==
X-Gm-Message-State: ANoB5pkuwZafNNG0WT5xX2QPKoFyMVxf6X5k9QVm0ZA8B9Uxo36QpYF2
	7KWizkLajr7lTUSbkR0oFU4=
X-Google-Smtp-Source: AA0mqf6FNGvoMt+llsc388PlfovbuF1W+XnNVzY03ZWRBukvUhJ9UgdZfu7k50CwD+43rBE7Gz7H3A==
X-Received: by 2002:a05:600c:3acd:b0:3cf:550e:d7a2 with SMTP id d13-20020a05600c3acd00b003cf550ed7a2mr4931505wms.97.1669034026550;
        Mon, 21 Nov 2022 04:33:46 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d6291000000b0022e66749437sm11196458wru.93.2022.11.21.04.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:33:45 -0800 (PST)
Message-ID: <e0a35381-0ef3-c134-e1ef-b073a28458c9@gmail.com>
Date: Mon, 21 Nov 2022 13:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] pinctrl: mediatek: common: Remove check for
 pins-are-numbered
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 khilman@baylibre.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-2-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221121015451.2471196-2-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_043348_169880_79E08B9D 
X-CRM114-Status: GOOD (  13.80  )
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



On 21/11/2022 02:54, Bernhard Rosenkränzer wrote:
> Remove the check for the unnecessary pins-are-numbered Devicetree property.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 076ae0b38e3d7..553d16703475b 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1057,7 +1057,6 @@ int mtk_pctrl_init(struct platform_device *pdev,
>   	struct pinctrl_pin_desc *pins;
>   	struct mtk_pinctrl *pctl;
>   	struct device_node *np = pdev->dev.of_node, *node;
> -	struct property *prop;
>   	int ret, i;
>   
>   	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> @@ -1066,11 +1065,6 @@ int mtk_pctrl_init(struct platform_device *pdev,
>   
>   	platform_set_drvdata(pdev, pctl);
>   
> -	prop = of_find_property(np, "pins-are-numbered", NULL);
> -	if (!prop)
> -		return dev_err_probe(dev, -EINVAL,
> -				     "only support pins-are-numbered format\n");
> -
>   	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
>   	if (node) {
>   		pctl->regmap1 = syscon_node_to_regmap(node);

