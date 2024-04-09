Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F83CD128A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vl2WAWZiRqw9Ns4ylVujkmqdUMbnF+5lRwOPnf5XU7k=; b=o2xuOIZIC96YN4+7lbk2se+oxW
	7QoPOt9lYVlQJ3JsTW22r7XbRvdyfoacJGqf503HC3W6Eoab+vSOoji8ZOOuO/T9P3Px1Bk6n54n1
	Ak5i8PGbkodaPE0PB2fhkxH+GOhp37axy7b1u/plykW/DUxWAdt47ZZP5cp5IkBMFhF8F4OTmSNRq
	Voll65yvC2Nb5EPchTkF+bZp0TOOmFjlckA3//vf2tjv7gH4hnGqOLrrQsZEtsco9JLmBpChsZ+kW
	ay6dRw+DKvBx8NZOg337x6JuanWrAuIwvRAmGrL1uSLFuMNVVE0HrFDM5jWp41Wi7GF/LyPat3RaC
	u1CADcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDta-00000002qR3-3ONL;
	Tue, 09 Apr 2024 16:00:26 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruDtV-00000002qNI-3uQc
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 16:00:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-345e1c64695so1057085f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712678419; x=1713283219; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl2WAWZiRqw9Ns4ylVujkmqdUMbnF+5lRwOPnf5XU7k=;
        b=m3l+b/1xwQS9cjMvCyhZavDLNf/BScp2QsQLp+bns7DRpbK2dUD4WYDV4MFWaOZxfH
         EU8birpqyvGJFB/u4DlvaCcobjJDZTHhqcdTOnjR1ZGf4F0giVpnf3LpQyXULLItZz4B
         lli0JLlsuKICxWm5Wv+TO57YIr7db9Fq3eDP+YndIIQ8iCm7n0+feVDbFCSEhRFUuaju
         pAeaN6rY76l8fEMBrfx3WXO8rZBcpBXGGto/b2VClmxZywXMdbxZSZ7PTvDPrP/FN2bn
         GI8X84ak30/ivxmgGXAxFD0NkiioJViU+HKECAcBWxgQmDvHPVarslWAzkkyJ//1UTjX
         UOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712678419; x=1713283219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vl2WAWZiRqw9Ns4ylVujkmqdUMbnF+5lRwOPnf5XU7k=;
        b=J4z3OOA9LJ4f3aEIFUZEu7CDOBqdnQUajkID7opnDg6iBpZWGmGu2CBKvghHBh9cH8
         xafXZMeXA1mm/P1wHsu8eEeTfvkD69Y6BbzQEWfjUe3/ulcajNbpeB3NnIKlN/Y/LfoD
         ybeyL/Q85HB0p8HpkQOuQOaafbxPuPdaZFEGTU2ghOlNwp/iYyeP3N0wsZt8VO9aPYTw
         JL2GkX86FwtBuqyeRAL9AYKBR1q+vmu3q2SkvDf6x5+zgn61OE+okSSywJvkJYQgiDRE
         igBd9FCYjzeG76lN7tMbubt8whwOdWsY4nizT8KlB7agwBl9hRVkGjrrV8qgfTEn5Zrk
         fbxg==
X-Forwarded-Encrypted: i=1; AJvYcCVcpjJUNIGgoM1Y9St9EsqasA9wE4sLldZscSNMLUyquWEvfay4gMnZ4BR2hj2i7J7nBF0IjT+7vTzc+cr8+8WgYiD10QfEdvL+UxPP6Y78iLJw
X-Gm-Message-State: AOJu0YxFSLNamFREMXF9TTrQ06Ypw/dvMRaLXtEIaYSUoBaWqHjq+zWl
	kL/HHOUuRMNUeK2aBkLH+lbbGhZwkiwRtmAJsc4z3qGkt9U3M774EHkSprHNTE0=
X-Google-Smtp-Source: AGHT+IHXyvG8mKfTY4naLXWGXb6e7X0FvCeImKpBuVDysC36RkLPoOdejDcQfesyOgvubSVgZ97dCw==
X-Received: by 2002:adf:f1c4:0:b0:341:e4f4:4399 with SMTP id z4-20020adff1c4000000b00341e4f44399mr83235wro.68.1712678418814;
        Tue, 09 Apr 2024 09:00:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k2-20020adff282000000b0033e9d9f891csm11740838wro.58.2024.04.09.09.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 09:00:18 -0700 (PDT)
Message-ID: <62b1f2fe-7892-405c-bbb9-4bc77173a801@linaro.org>
Date: Tue, 9 Apr 2024 18:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/18] arm64: dts: mediatek: add audio support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
 <20240226-audio-i350-v3-18-16bb2c974c55@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240226-audio-i350-v3-18-16bb2c974c55@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_090022_079693_C976466C 
X-CRM114-Status: GOOD (  16.77  )
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

On 09/04/2024 15:42, Alexandre Mergnat wrote:
> Add the sound node which is linked to the MT8365 SoC AFE and
> the MT6357 audio codec.
> 
> Update the file header.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 98 +++++++++++++++++++++++++++--
>  1 file changed, 94 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 50cbaefa1a99..eb0c5f076dd4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -1,9 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2021-2022 BayLibre, SAS.
> - * Authors:
> - * Fabien Parent <fparent@baylibre.com>
> - * Bernhard Rosenkränzer <bero@baylibre.com>
> + * Copyright (c) 2024 BayLibre, SAS.


What is happening with your copyrights? Why do you change existing ones?

> + * Authors: Fabien Parent <fparent@baylibre.com>
> + *	    Bernhard Rosenkränzer <bero@baylibre.com>
> + *	    Alexandre Mergnat <amergnat@baylibre.com>
>   */
>  
>  /dts-v1/;
> @@ -86,6 +86,29 @@ optee_reserved: optee@43200000 {
>  			reg = <0 0x43200000 0 0x00c00000>;
>  		};
>  	};
> +
> +	sound: sound {
> +		compatible = "mediatek,mt8365-mt6357";
> +		pinctrl-names = "default",
> +				"dmic",
> +				"miso_off",
> +				"miso_on",
> +				"mosi_off",
> +				"mosi_on";
> +		pinctrl-0 = <&aud_default_pins>;
> +		pinctrl-1 = <&aud_dmic_pins>;
> +		pinctrl-2 = <&aud_miso_off_pins>;
> +		pinctrl-3 = <&aud_miso_on_pins>;
> +		pinctrl-4 = <&aud_mosi_off_pins>;
> +		pinctrl-5 = <&aud_mosi_on_pins>;
> +		mediatek,platform = <&afe>;
> +		status = "okay";

Where did you disable the node?

> +	};
> +};
> +
> +&afe {
> +	mediatek,dmic-mode = <1>;
> +	status = "okay";
>  };
>  
>  &cpu0 {
> @@ -174,6 +197,12 @@ &mmc1 {
>  	status = "okay";
>  };
>  
> +&mt6357_codec {
> +	mediatek,micbias0-microvolt = <1900000>;
> +	mediatek,micbias1-microvolt = <1700000>;
> +	mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
> +};
> +
>  &mt6357_pmic {
>  	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
>  	interrupt-controller;
> @@ -181,6 +210,67 @@ &mt6357_pmic {
>  };
>  
>  &pio {
> +	aud_default_pins: audiodefault-pins {
> +		pins {
> +		pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
> +			 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
> +			 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
> +			 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;

You have broken indentation everywhere.

Best regards,
Krzysztof


