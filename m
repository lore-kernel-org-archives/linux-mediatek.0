Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EF9C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8geeXEOb1JFpSL51yP1LqtEfxAQbaVotjCJur5zhD4=; b=XetYUsJeopYQSAj62lqQCD4Euq
	OsaSeBDsFe2C7BYvFTh9KFi48LS7VmfBIH1wgcfyIBaPqSXz8lKUSb0B8967cMAORncUrKQj5v8QT
	EhhZKqGE5seSTzciHiz+kMtQTAI5JqJgkzs22uhCGaSEm6oCZkBQ/4mGb26FxbWbkfaHE4ewJ70Zj
	Tt4FodC3B8JVIqoGA+W4UIKnRAcnNTzasJvD0OcRL6jvwVPHhkVUxXVihxLoGjx4pFquweAYWKBpk
	osPsDOShMavp7+5yCGHrYQXKuKbID5C/51YyGXmJ7fRe7NnvjR9thAwVUlYfBoLpfxlJ0J8kyX7Ow
	eH+hQpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1qmK-00Du8G-04;
	Wed, 24 May 2023 15:51:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1qmF-00Du7F-3D
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 15:51:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f61530506aso7702565e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684943509; x=1687535509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8geeXEOb1JFpSL51yP1LqtEfxAQbaVotjCJur5zhD4=;
        b=r9Xqu5ND0Bk5xdzrVcEKYQlFpEEChNge6LbIG0g17WQIR6Y6FlFTjj1VLIptKxk12Q
         yq45EGDPQw9rNHr+jipV1YSj4asgJuaRjeVL0NZhwSDk/F7WDrzxEpDXrSSJyrZb0/M3
         zBXKIn/cV0bBTAFnJDnUkCCcwvue3vKTmsqLCYu0uVu4CEJS93Dy/yQ+lZNpqtjw/llJ
         /i6QJwMZfnhn0BXjS9g7SEYSgcIwM6tYnNKca4sWH8rz2seGcHobfGaMYO1qrYroAdGx
         05BznJ1hGxFw4jfQNNWBm56IewOjSboZXbEWkM4NBUXJGppz8/FOt58lkiEa84eE4ux7
         4f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684943509; x=1687535509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8geeXEOb1JFpSL51yP1LqtEfxAQbaVotjCJur5zhD4=;
        b=X+I3ytiPCkeRMf/dyeaolnUI0i8FgIPF76880srx3Mu7rnbUZksbFKHSE0dReFAsDX
         QtGqsbNkSnnM+L3HcaPfU/sgC1HKB4tl9wHmNuKL7XVP2tzWfQba/z2SYDjR3TkIfmuo
         vUWlaQbI59Yp5rXtcXPF+EwcCLgbsVNdAxBYvvVKOEBsDBsXeFq+Xcyp27H6TxaK098l
         45wd5/981XgutGK/IXl9LnpBC9cBoVIVpcgHWqwNRnkjocsMTIdJX3XZxppo95dft+JB
         rWTEMYMw/wSO5yn6ve9j1k0WT/lIwTy7soAXZcvlEA3nGxYg+/cKeSLPYO9azdYEDLYd
         VKHg==
X-Gm-Message-State: AC+VfDymKc/UiL7HHYo4pQEmn0loR2kiK6BQWEWtORVOdmhTiNK85vFW
	Q2fxLo7SdqWTzuLWTWpBeoBNOw==
X-Google-Smtp-Source: ACHHUZ5sgxsCI/lVRvjZNq+J7kPDx+SvOmaq/8wjAiMQ785YfC+h5iFAEtyNc1gq4Kqqj6aQ7yTjgQ==
X-Received: by 2002:a7b:cb91:0:b0:3f6:45d:28a1 with SMTP id m17-20020a7bcb91000000b003f6045d28a1mr219488wmi.14.1684943508981;
        Wed, 24 May 2023 08:51:48 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id z26-20020a05600c221a00b003f60101074dsm2721773wml.33.2023.05.24.08.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 08:51:48 -0700 (PDT)
Message-ID: <dcd5050b-8459-e7cc-b5ad-eb435aba6e84@baylibre.com>
Date: Wed, 24 May 2023 17:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 6/7] ASoC: mediatek: mt8188-mt6359: support new board
 with nau88255
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-7-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-7-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_085152_241548_5CB2576D 
X-CRM114-Status: GOOD (  15.32  )
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

On 23/05/2023 04:19, Trevor Wu wrote:
>   	card_data = (struct mt8188_card_data *)of_device_get_match_data(&pdev->dev);
> @@ -776,9 +1066,38 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
>   				dai_link->init = mt8188_mt6359_init;
>   				init_mt6359 = true;
>   			}
> +		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
> +			   strcmp(dai_link->name, "ETDM2_OUT_BE") == 0 ||
> +			   strcmp(dai_link->name, "ETDM1_IN_BE") == 0 ||
> +			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
> +			if (!strcmp(dai_link->codecs->dai_name, MAX98390_CODEC_DAI)) {
> +				dai_link->ops = &mt8188_max98390_ops;
> +				if (init_max98390)
> +					continue;

I prefer that you do like your patch [PATCH v2 1/7] to be consistent
and easy to read.

+			if (!init_mt6359) {
+				dai_link->init = mt8188_mt6359_init;
+				init_mt6359 = true;
+			}

> +
> +				dai_link->init = mt8188_max98390_codec_init;
> +				init_max98390 = true;
> +			} else if (!strcmp(dai_link->codecs->dai_name, NAU8825_CODEC_DAI)) {
> +				dai_link->ops = &mt8188_nau8825_ops;
> +				if (init_nau8825)
> +					continue;

ditto

> +
> +				dai_link->init = mt8188_nau8825_codec_init;
> +				dai_link->exit = mt8188_nau8825_codec_exit;
> +				init_nau8825 = true;
> +			} else {
> +				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {

Shouldn't be with a NOT operator ("!") ?
+ if (!strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {


> +					if (init_dumb)
> +						continue;

ditto

> +
> +					dai_link->init = mt8188_dumb_amp_init;
> +					init_dumb = true;
> +				}
> +			}
>   		}
>   	}
>   
> +	priv->private_data = card_data;
>   	snd_soc_card_set_drvdata(card, priv);
>   
>   	ret = devm_snd_soc_register_card(&pdev->dev, card);
> @@ -795,11 +1114,20 @@ static struct mt8188_card_data mt8188_evb_card = {
>   	.name = "mt8188_mt6359",
>   };
>   
> +static struct mt8188_card_data mt8188_nau8825_card = {
> +	.name = "mt8188_nau8825",
> +	.quirk = NAU8825_HS_PRESENT,
> +};
> +
>   static const struct of_device_id mt8188_mt6359_dt_match[] = {
>   	{
>   		.compatible = "mediatek,mt8188-mt6359-evb",
>   		.data = &mt8188_evb_card,
>   	},
> +	{
> +		.compatible = "mediatek,mt8188-nau8825",
> +		.data = &mt8188_nau8825_card,
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mt8188_mt6359_dt_match);

-- 
Regards,
Alexandre


