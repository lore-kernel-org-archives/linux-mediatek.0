Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F037ACE7A9F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 22:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C8hhu7UF1prZzQBlIpQi9WZUq80sNM1a9c4IpQcukQ=; b=GFN4MDAA/AR4dXUgzWA8eB14LX
	85XcULQ3v4k4wRXcGb63dSj9cYOZ+3M+Iwd4fhVmr6UBBm8q0oi3p3pDkYXKK2r9g4G20SnayBPyN
	cUo36NcyCS3rdAdnEf5Bc1ihby/g+SO+ShGODObHwUr5M8tEeBEAip/bs3nlcA0+HZ6zaqwEq3d87
	0ZTtgSqKQ+kjVQtI0oleUK56XVHufJW1lWutEtFl8J33k5wzglHQq6nfC6kD3zIPYfbpecbIoQcGd
	2QI2ciaynT74rSh81s0MoucYj3it1HOHSmLgKxwSnAoNxvpI7NXb3aI6sDYzG+tjNPDTaQh/uK/XM
	Lu8PYO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smKfT-00000009yCP-3Vvp;
	Thu, 05 Sep 2024 22:09:31 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smKY2-00000009x5v-462g;
	Thu, 05 Sep 2024 22:03:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-374bd0da617so722082f8f.3;
        Thu, 05 Sep 2024 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725573709; x=1726178509; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0C8hhu7UF1prZzQBlIpQi9WZUq80sNM1a9c4IpQcukQ=;
        b=ILxDoGzcN2b1R2aIL3ZUSZkU1sYAraGIcx1jLJaQA1+CBtqsAEXWk01WZuMYMoygs/
         4Tw1kr00YDqj5Yk6+vsWuOmBHL7OOj7poA8bDcA17Pn3+0vVWiZ+KCd8N8BHs51DWPbx
         K7kbvMW5+5hrBrhccsBrN2h6fKmAIk09B40IlRCWin+kgzyUL1o7B0QOHrA7R05WGWi9
         Gu69AX2ZrrOyD3RlVgbm0k1fgK1V3E85IbzRnCmfFRKzoL2ogFiH9QGF52uLy/hrv9nr
         YCuW8WNLywdMLEN+Ionwi8Pkuw5rXHUklp7zb6h38aMZj53rSyOFaR2Nbrf086aHB1AE
         Tqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725573709; x=1726178509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C8hhu7UF1prZzQBlIpQi9WZUq80sNM1a9c4IpQcukQ=;
        b=sgOmZIfmqRxagziGnjxWT5E090CY/ij12wMHW7BoTaORSAfpkcZhjSGqqHqFCKp0UL
         QncYUZjLemFR1ysSlsjfH7u9rVy2CuQW+l2L22H95RcjKOLkxAnByBq5rgB2Ii0pJRCp
         UdlhOjz4718JnqGqc6S61I6HbjWnmgmHmWnSnbIc2FnTyt8nyWvfhk16hvK+91g5orim
         LnK4gn6zQVGAkHvh9gTYOBN410wifTy1DCAofNErbq9yE3EDYTtd7q7FXN/oWOSdtv1L
         Yx33J5BE3Ok7KQfoSNje+w6I+SXH3ojqJ5gIUPWQK7lRDMW5DJtUHxR4MVTMwlfEI1/X
         eSqw==
X-Forwarded-Encrypted: i=1; AJvYcCW5FBJLD4Sj/i284rKNN7TZnrkyNOZKU3shcIT7e3RI3a8gX2njuevs2bR2EFK8RRuj5LXlS9Qu0ONXA++8fnA=@lists.infradead.org, AJvYcCW5QfAe7fSEMw0iioZnxs2iKowuh/R1nlbglMYlyhwdy5juQ0cYqU1IVG8P87qg+dZmBpyW2CpygUEIsk6CUA0H@lists.infradead.org
X-Gm-Message-State: AOJu0YwmzaK/grTy/snqtwS/A039/JTztH690x2oMT9aZ76PSwB3Zrvh
	7JK0LcCCjr2yMCmS5tic/4NN21lje+Cs5oNqzK6q6AW0nTK9+0Pr
X-Google-Smtp-Source: AGHT+IElahqPKvWLjx7YchTXMk1+RaSi2ZhBIEkSCfNN3mzWLWWJG1UFmh98W7AWF/nNDxN2kCp33Q==
X-Received: by 2002:adf:f4d0:0:b0:371:7e46:68cb with SMTP id ffacd0b85a97d-378896a5c01mr265056f8f.50.1725573709257;
        Thu, 05 Sep 2024 15:01:49 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c29aa150sm14562288f8f.101.2024.09.05.15.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 15:01:48 -0700 (PDT)
Message-ID: <0ffcc54f-f06d-41c6-b0d0-cc420ebc1527@gmail.com>
Date: Fri, 6 Sep 2024 00:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: mediatek: add audio support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
 <20240226-audio-i350-v8-5-e80a57d026ce@baylibre.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240226-audio-i350-v8-5-e80a57d026ce@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_150151_093512_2AD7DA12 
X-CRM114-Status: GOOD (  14.96  )
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



On 05/09/2024 11:07, Alexandre Mergnat wrote:
> Add the sound node which is linked to the MT8365 SoC AFE and
> the MT6357 audio codec.
> 
> Update the file header.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 86 +++++++++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 4211a992dd9d..7d90112a7e27 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -4,6 +4,7 @@
>    * Authors:
>    * Fabien Parent <fparent@baylibre.com>
>    * Bernhard Rosenkränzer <bero@baylibre.com>
> + * Alexandre Mergnat <amergnat@baylibre.com>
>    */
>   
>   /dts-v1/;
> @@ -86,6 +87,28 @@ optee_reserved: optee@43200000 {
>   			reg = <0 0x43200000 0 0x00c00000>;
>   		};
>   	};
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
> +	};
> +};
> +
> +&afe {
> +	mediatek,dmic-mode = <1>;
> +	status = "okay";
>   };
>   
>   &cpu0 {
> @@ -178,9 +201,72 @@ &mt6357_pmic {
>   	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
>   	interrupt-controller;
>   	#interrupt-cells = <2>;
> +	mediatek,micbias0-microvolt = <1900000>;
> +	mediatek,micbias1-microvolt = <1700000>;
>   };
>   
>   &pio {
> +	aud_default_pins: audiodefault-pins {
> +		clk-dat-pins {
> +			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
> +				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
> +				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
> +				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
> +		};
> +	};
> +
> +	aud_dmic_pins: audiodmic-pins {
> +		clk-dat-pins {
> +			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
> +				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
> +				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
> +		};
> +	};
> +
> +	aud_miso_off_pins: misooff-pins {
> +		clk-dat-pins {
> +			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
> +				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
> +				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
> +				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
> +			input-enable;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +		};
> +	};
> +
> +	aud_miso_on_pins: misoon-pins {
> +		clk-dat-pins {
> +			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
> +				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
> +				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
> +				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
> +			drive-strength = <6>;
> +		};
> +	};
> +
> +	aud_mosi_off_pins: mosioff-pins {
> +		clk-dat-pins {
> +			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
> +				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
> +				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
> +				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
> +			input-enable;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +		};
> +	};
> +
> +	aud_mosi_on_pins: mosion-pins {
> +		clk-dat-pins {
> +			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
> +				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
> +				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
> +				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
> +			drive-strength = <6>;
> +		};
> +	};
> +
>   	ethernet_pins: ethernet-pins {
>   		phy_reset_pins {
>   			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
> 

