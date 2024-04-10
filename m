Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCEDCD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziNLBEavMFMG0GfbRRHA8010gbB3jZaJU46gRxSDrTY=; b=meB6V4dHGNTmXWP7EHfY5BZXi5
	D4YE/MfBDNQw3eyfLmcMJnOD+gGfmvhM67eIyiRqi2d3ERLMpqRq/jGvgscragO/fLIxgziBOtTvs
	5xSQlQzso71avWdtX2LCdMAUsUneXjob9mS77QuvAJRvBmV+qYng1L2HSs+omSVpk05qf6MLa5esU
	xsWi90yRZsAJTpL1zEBIjiThpkVqnsx/ztTzstUXIqNsAvGha+4jdeLajcBhO/mIQUaV8AICvUFTG
	en2EiL0Eo/mqoAZd6aCVE/8Xdk7mPrkvvx+FI7E+9cxOXElpiQdg5ltxJjZX6+P5p5ILURE4/CasU
	NrXEXw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rua2P-00000007pMn-30pG;
	Wed, 10 Apr 2024 15:39:01 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rua2K-00000007pJD-4Aa4
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 15:38:59 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so64871751fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712763531; x=1713368331; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ziNLBEavMFMG0GfbRRHA8010gbB3jZaJU46gRxSDrTY=;
        b=kzF/xDKC4YWhvH0SDhMtbBmQZw/NE8j2eErCXpv8EnRvKJ21Xl0obKy/VdWCXmtZQj
         +BKI0vJyCvi7Q82Bb9COXbXumnw06jLEkz876YZ/twATz92dpNxFsqaWfN+WmTXfgOkk
         8P/BmniRSxiLNRMJYR9ICHmGca6M9RroD38n7PqB7LBoASyRmiXU0kHHiibiJgwuF8wo
         obbzxOKclRVAblBNryZzZalHtmCPXmCM4e30RdjJVdBMZV8Xo84NaEoa44sDvfZRHVmT
         F12zSBRiuGhqtO8FdppIxIKbfB/PIdsgSEcJeo6S0uCRUSDVvrzu80AxE/x5Jj0J7tjw
         2zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712763531; x=1713368331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ziNLBEavMFMG0GfbRRHA8010gbB3jZaJU46gRxSDrTY=;
        b=B44TEqaxr4MYME6IHoP+p2v3cjiBW5R9iCrJUIK6E5Y2OEVYmcMKmQpUz/kOxZzRjx
         rXYcqr+IYDvk7HRDV2BGadhKTs0SfamqQZz6r9LhK2wW8xgJPuh0Obe7Q2cz+ldp4CtE
         c5+XO/7/5D1whzRZNXxd19V6mUbOc53MQIRy4QHK2bFG/TU5YOpoe2q7rVZE/dYKFYiU
         AX+meTIRDSkVJ/TViqO/DJuljPSulZ9YWq1FDnaYpl/l27gGp18g9ylnAAm2GCJI5kDY
         RM22hwahzbAzLOWWpIUuP3fWdF2PlHthdufHTPCilKSJL0AneyaTjXkmIenJfJetLydW
         /Eyg==
X-Forwarded-Encrypted: i=1; AJvYcCVkn8mCnypV38ZFt1V09IJnRV53FWvptjadM8cLkTMEmJZyRk7jhBjykzuiWLacmS/O8hnZPrY44nB09f4hTujWH527lghnEkqlYKFpeDL6mqLw
X-Gm-Message-State: AOJu0YznjJ7ubhRvGsDi1XqtvA7bVeX5joN5HwZkaMHrtxknFZClGWjs
	VMCRTaWVATsmghV4ZK/cV2XE2c9YPJq+CvHjxPM2uXwAkOvfZeAWTYOjQuWK/qk=
X-Google-Smtp-Source: AGHT+IG2wwHYacJLlQJ1p8tbRHpThfXnZhkjy+riyIarl5DIopRdALbX2un4cz4Xr1qBJqWWBM+Yfw==
X-Received: by 2002:a05:651c:1a28:b0:2d8:34ad:7f4e with SMTP id by40-20020a05651c1a2800b002d834ad7f4emr2818446ljb.4.1712763530670;
        Wed, 10 Apr 2024 08:38:50 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c470700b00416b2cbad06sm2591936wmo.41.2024.04.10.08.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:38:50 -0700 (PDT)
Message-ID: <757b554b-add9-4d0e-89cf-0a5569187f18@baylibre.com>
Date: Wed, 10 Apr 2024 17:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/18] ASoC: mediatek: mt8186: Unify mt8186-mt6366
 machine drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-14-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-14-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_083857_133285_41DF4BA2 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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



On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> @@ -318,16 +409,24 @@ static int mt8186_it6505_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   static int mt8186_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
>   				     struct snd_pcm_hw_params *params)
>   {
> +	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
>   	int ret;
>   
>   	ret = mtk_sof_dai_link_fixup(rtd, params);
>   
>   	if (!strcmp(rtd->dai_link->name, "I2S0") ||
>   	    !strcmp(rtd->dai_link->name, "I2S1") ||
> -	    !strcmp(rtd->dai_link->name, "I2S2"))
> -		mt8186_i2s_hw_params_fixup(rtd, params);
> -	else if (!strcmp(rtd->dai_link->name, "I2S3"))
> -		mt8186_it6505_i2s_hw_params_fixup(rtd, params);
> +	    !strcmp(rtd->dai_link->name, "I2S2")) {
> +		if (soc_card_data->card_data->flags & DA7219_CODEC_PRESENT)

Is the flag missing like you did for mt8195-mt6359.c ?
			if (!(codec_init & MT6359_CODEC_INIT)) {
				dai_link->init = mt8195_mt6359_init;
				codec_init |= MT6359_CODEC_INIT;


> +			mt8186_i2s_hw_params_32le_fixup(rtd, params);
> +		else
> +			mt8186_i2s_hw_params_24le_fixup(rtd, params);
> +	} else if (!strcmp(rtd->dai_link->name, "I2S3")) {
> +		if (soc_card_data->card_data->flags & DA7219_CODEC_PRESENT)
> +			mt8186_i2s_hw_params_24le_fixup(rtd, params);
> +		else
> +			mt8186_i2s_hw_params_32le_fixup(rtd, params);
> +	}
>   
>   	return ret;
>   }

-- 
Regards,
Alexandre

