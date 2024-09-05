Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41660CD4849
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoC0Ny4WSYinybKdl9aiH0TLHdCuVyPoDTMFjdIh75U=; b=MS5r8l5XE2vbRbJSGTgwCFrLAO
	P05B792jQlmJ0hUsigksg37CAqwtNWW1xeY85oewvcxB8nq53syTRpd8qrmSkgmn50GFOmo0irs3W
	MkD5RZc59V55lVMt2PjnajXTteu5AeKKzvCyEdOo7TLoPV2hI6JRgiaM/6EjZeCWkWjpfO3om77vS
	dMq/bJXuBarR+h7vZI112xOgRbucdx2MdO1yFFFGN1e8PRJT5eB4a/eNLgfcq7rKkwWB26YJpv1hi
	LSiv+cSD9GjEJtkvLONB4IXhWr2qyWi/GtA7gJcJBj83QKpZaqNaDs2VJDddaT1OubYIU2nNfcotw
	pNl1jIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smLi0-0000000A5z6-3F74;
	Thu, 05 Sep 2024 23:16:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smKXd-00000009x0r-2neq;
	Thu, 05 Sep 2024 22:02:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-374ca65cafdso680254f8f.2;
        Thu, 05 Sep 2024 15:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725573684; x=1726178484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AoC0Ny4WSYinybKdl9aiH0TLHdCuVyPoDTMFjdIh75U=;
        b=Ei5QFawvLvo0pmX9t0UnAy5zKcM7j9LFtQHBOrwgdi4sfKsqCtoJ1+/hhDGmz2u1a1
         s9oqQ/on7v+7btDPTEWVKNVwkIN3c+Lw7uzDrqa4eZntwglWliPtHfoQ0+5YhuGPxFy1
         iZ8SDoH/6PurHVhbfGlSoQjProVIporBqxi8PfS8BMl/hYEVr+nWfIRBRQaeaDUbFTUZ
         ufjF9vgrJ7AhGiyGciF3u7a4d54PGZo8mId9V9s4EyjnDn8iSV+wufVK3T0w0ZjzrHFN
         flWFL068uJ5pXXeHFycyK1ZuHiw6dmbcjIn5T6i6Yclt13b2d2uJdQN9didjV59nUE07
         Bugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725573684; x=1726178484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoC0Ny4WSYinybKdl9aiH0TLHdCuVyPoDTMFjdIh75U=;
        b=VOTtnngsn7b6ludlkLCldzu+pqTZVCbeWZBl0ccE71WK+FQZbvoPVtU+hupW6AL393
         D++Tqr3iLUJcPwcQU0XJrnUSxEKVFmtXwKDmbvVDYf6K/kp6+MGUBBmf0bydTc8Hrc9Q
         SlsW9YRGx/AmdYIF8e49jZ+oD2Z4O9awulXkglRqXYzBXpdTvSIR9RuI6de9iKw4sfeK
         RTTMBmlwmjsf/uDqiyR8DLFtV5T5Hdc6XVGy27wHVArtbvbhlWB4ga/jS1qs9YpdepIK
         OKsKT3gB3vdpIcocJclCG5J/kBIxwRj0l8JiRpyOHR5NDQWFu9v/ZGls54Gx94dA9B9+
         aPmg==
X-Forwarded-Encrypted: i=1; AJvYcCVAi+ta7O8wZoftLVAGxS15te3sPvbAB+JM/aXwo2dcXbh7ywurBGWFic4r/aZooFDh6cu0eJWH/1cXypyDNEI=@lists.infradead.org, AJvYcCXbKQQy2ABEKWP9DPzJJZ7kq4snMuareC9oa8cpfhSoZq3ZwWkrFOZekaPCvVDWLSo8zOReaydk3KKULfBzb12v@lists.infradead.org
X-Gm-Message-State: AOJu0YznyrOiQw/eApMT4zZqfZUFeXAM+w7xIOs6Lwz/1165Qj7eYKB0
	t5qGVn83gXkA73HklxcBJqQc64nz0Sg9TASL2MJ0FxYw4CL0M2tysMfWXBnj
X-Google-Smtp-Source: AGHT+IGef/4AomL/u0Puaprn/Dc6DBo92r8+YXqsKiEOvxTx6lvNwXky1c8YfzA3/hK8+oPTs26tAg==
X-Received: by 2002:adf:f245:0:b0:374:cd96:f73 with SMTP id ffacd0b85a97d-374cd961046mr7748038f8f.3.1725573683490;
        Thu, 05 Sep 2024 15:01:23 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374cd905b7csm10739445f8f.74.2024.09.05.15.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 15:01:22 -0700 (PDT)
Message-ID: <732cea84-3d2d-469c-93a0-76d93d8271bc@gmail.com>
Date: Fri, 6 Sep 2024 00:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: mediatek: add afe support for mt8365
 SoC
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
 <20240226-audio-i350-v8-4-e80a57d026ce@baylibre.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240226-audio-i350-v8-4-e80a57d026ce@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_150125_727150_A138506E 
X-CRM114-Status: GOOD (  14.36  )
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
> Add audio front end support of MT8365 SoC.
> Update the file header.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 43 ++++++++++++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index eb449bfa8803..9c91fe8ea0f9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -2,9 +2,11 @@
>   /*
>    * (C) 2018 MediaTek Inc.
>    * Copyright (C) 2022 BayLibre SAS
> - * Fabien Parent <fparent@baylibre.com>
> - * Bernhard Rosenkränzer <bero@baylibre.com>
> + * Authors: Fabien Parent <fparent@baylibre.com>
> + *	    Bernhard Rosenkränzer <bero@baylibre.com>
> + *	    Alexandre Mergnat <amergnat@baylibre.com>
>    */
> +
>   #include <dt-bindings/clock/mediatek,mt8365-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> @@ -812,6 +814,43 @@ apu: syscon@19020000 {
>   			reg = <0 0x19020000 0 0x1000>;
>   			#clock-cells = <1>;
>   		};
> +
> +		afe: audio-controller@11220000 {
> +			compatible = "mediatek,mt8365-afe-pcm";
> +			reg = <0 0x11220000 0 0x1000>;
> +			#sound-dai-cells = <0>;
> +			clocks = <&clk26m>,
> +				 <&topckgen CLK_TOP_AUDIO_SEL>,
> +				 <&topckgen CLK_TOP_AUD_I2S0_M>,
> +				 <&topckgen CLK_TOP_AUD_I2S1_M>,
> +				 <&topckgen CLK_TOP_AUD_I2S2_M>,
> +				 <&topckgen CLK_TOP_AUD_I2S3_M>,
> +				 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
> +				 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
> +				 <&topckgen CLK_TOP_AUD_1_SEL>,
> +				 <&topckgen CLK_TOP_AUD_2_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S0_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S1_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S2_SEL>,
> +				 <&topckgen CLK_TOP_APLL_I2S3_SEL>;
> +			clock-names = "top_clk26m_clk",
> +				      "top_audio_sel",
> +				      "audio_i2s0_m",
> +				      "audio_i2s1_m",
> +				      "audio_i2s2_m",
> +				      "audio_i2s3_m",
> +				      "engen1",
> +				      "engen2",
> +				      "aud1",
> +				      "aud2",
> +				      "i2s0_m_sel",
> +				      "i2s1_m_sel",
> +				      "i2s2_m_sel",
> +				      "i2s3_m_sel";
> +			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
> +			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
> +			status = "disabled";
> +		};
>   	};
>   
>   	timer {
> 

