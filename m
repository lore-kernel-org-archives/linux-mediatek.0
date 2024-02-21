Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF69FC48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxYy/oCllbVJu1lUjrqdo3aNdYciiuAnqI38767Tw8k=; b=i4l5S2jkTXi7o6a/15yWI8L4ub
	JwAPz40Mk7D0O6Qksc/6tnBuLWrsE9SPjir3fPojNDXuKXkOeKdRgeqZdItRxOzJ64EkIW3QNsQrb
	5SXiRkih+7sw1Fc4ISD0+Cej4NohgEj93cBWQtk09PfPABPSCPglyFO7jykLeJqx4f3C1nYvoQZpP
	ZMs+l97xB7ikKGryAP0ENIqxtzbb7buTcQbWtQ453+qacsZJ5MaqbB/OS5MpvaluqW1NeKYWpimId
	LefBDmjxYApkrfYWPoDuZi3MrY+2LZeZEC0MsFwngD448KU4gEuyjVkyKP89+9lr1svur+3gWAsBf
	XYv5yTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjgp-00000000Sbe-1EPq;
	Wed, 21 Feb 2024 10:18:59 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcjgl-00000000Sac-2PMR;
	Wed, 21 Feb 2024 10:18:57 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d208d0b282so86255551fa.0;
        Wed, 21 Feb 2024 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708510733; x=1709115533; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxYy/oCllbVJu1lUjrqdo3aNdYciiuAnqI38767Tw8k=;
        b=CCKsCenhcDEgdqi702ewxv0JSbjJ6ynQBU7mWhfgwqIHkMdnZOVSTUql/MqKJgPYPn
         NoH5Z2vkPCdH9shPCFTmevZuqWgSenpzKiwwbl550gr/PmWZ1LFH0EDXjbyRWkL1f8Lh
         Bv85n7O7BGuITGMyIlwV1R5A+fTodGS7CEAbsR94LOlTJxynH06/McxXhRjiEPyF7rna
         5CiqeYhqgDdeExKr/LOY/Gr54H+t16YcPlSLUAxSURBy8VH/T9x5iqMiDe/Bh1IUPl9E
         KdTYZVa+o6bJ8DEcPYIZkZiZ0J4w7HjWTIadiDw0+GwLzEQSsD4bvtxCuJkhih1u+eJi
         eQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708510733; x=1709115533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxYy/oCllbVJu1lUjrqdo3aNdYciiuAnqI38767Tw8k=;
        b=j7IeeD61qKqDnIyp36Ikv6OvPbAlaWNB9S98iLaPzO53ydye/L+7dng2wEiuYKKuGv
         ZEey319Seao/mN8DTm/MrJRQpiUbax3Ns7QTcp1UGS37OEnMZnOOunBQiw+TO97+kJ9U
         P5iOI2mQaKl4H/oGHlKuuulEph93kXBtF+KQpPFDDEt6sq3uVJ15/K/2xuDbJwSR018Y
         xImPpYXTLerRZLw5hAw4vSDevGFUEnkH44edhLDiRi3K0R7+pS74ZIyo9AgRsUjVU1y2
         +99efhQ1HyuY1amS0utjqV4WHcTByZLwt4gD7Oqr2uF1Z/HJKZRkBOv7/lsEQ8Z7k0Ud
         tviA==
X-Forwarded-Encrypted: i=1; AJvYcCUeCUuaURTT2Z/p6i/XohEQpMfFdK2SQ1T8b147SLxAtCw8kxcmyCzdo14kHinsOmFS8BpZEORqeZ8FIWqe5LUKM8krXdG5KK/0BI2yMORtWgO0e8cJESbjspmgUluWRKTCBRWYWP3x8OeRaKwejBob1fJto09m/Go=
X-Gm-Message-State: AOJu0YzmflhrU95sE0e04Fg45f5Sg9wzv4AWXxSYo+nWrr6XHZRm9S47
	ogIdAgh9/Heem646+ULY3pSMlb4riktVyP3HTSFcOK+LnxgP2Rbk
X-Google-Smtp-Source: AGHT+IFTdBLcdX+mNatMOQW4Ps2MUiqJKNUfiZQWmGfDF5dJHJtDnU58iVGJ9gek14cZwh5wfP1jew==
X-Received: by 2002:a2e:9192:0:b0:2d2:50ba:e5b6 with SMTP id f18-20020a2e9192000000b002d250bae5b6mr1780390ljg.10.1708510733213;
        Wed, 21 Feb 2024 02:18:53 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id l12-20020a2ea30c000000b002d2191e20e1sm1799512lje.92.2024.02.21.02.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 02:18:52 -0800 (PST)
Message-ID: <b4e8d3c6-5113-4324-9af5-c4e89cd89349@gmail.com>
Date: Wed, 21 Feb 2024 11:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: Add Cudy WR3000 V1
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240221073524.20947-1-zajec5@gmail.com>
 <20240221073524.20947-5-zajec5@gmail.com>
 <2fdf724e-4994-4873-971a-56c19b9fc471@collabora.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <2fdf724e-4994-4873-971a-56c19b9fc471@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_021855_638720_92864306 
X-CRM114-Status: GOOD (  18.57  )
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

On 21.02.2024 11:11, AngeloGioacchino Del Regno wrote:
> Il 21/02/24 08:35, Rafał Miłecki ha scritto:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Cudy WR3000 V1 is an MT7981B (AKA Filogic 820) based wireless router. It
>> has 256 MiB of RAM, some LEDs & buttons and (not described yet) 4
>> Ethernet ports.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>>   .../dts/mediatek/mt7981b-cudy-wr3000-v1.dts   | 74 +++++++++++++++++++
>>   2 files changed, 75 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>> index 37b4ca3a87c9..96da4ad640aa 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts b/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
>> new file mode 100644
>> index 000000000000..cb36a089518a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-cudy-wr3000-v1.dts
>> @@ -0,0 +1,74 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +#include "mt7981b.dtsi"
>> +
>> +/ {
>> +    compatible = "cudy,wr3000-v1", "mediatek,mt7981b";
>> +    model = "Cudy WR3000 V1";
>> +
>> +    memory@40000000 {
>> +        reg = <0 0x40000000 0 0x10000000>;
>> +        device_type = "memory";
>> +    };
>> +
>> +    keys {
>> +        compatible = "gpio-keys";
>> +
>> +        key-wps {
>> +            label = "WPS";
>> +            gpios = <&pio 0 GPIO_ACTIVE_LOW>;
>> +            linux,code = <KEY_WPS_BUTTON>;
>> +        };
>> +
>> +        key-reset {
>> +            label = "RESET";
>> +            gpios = <&pio 1 GPIO_ACTIVE_LOW>;
>> +            linux,code = <KEY_RESTART>;
>> +        };
>> +    };
>> +
>> +    leds {
>> +        compatible = "gpio-leds";
>> +
>> +        led-0 {
>> +            function = LED_FUNCTION_WAN;
>> +            color = <LED_COLOR_ID_BLUE>;
>> +            gpios = <&pio 5 GPIO_ACTIVE_LOW>;
> 
> Can we please order those properties alphabetically, as it doesn't impact
> on human readability in any way?
> Just a nitpick, anyway.
> 
> color = <LED_COLOR_ID_BLUE>;
> function = LED_FUNCTION_WAN;
> gpios = <&pio 5 GPIO_ACTIVE_LOW>;

If I understand [1] correctly alphabetical / alpha-numerical order
applies to non-addresses nodes only.

Here I put "function" first as that seemed more important than a color.

Perhaps you could suggest an addition to Devicetree Sources (DTS) Coding
Style or point me to the missed part, please?

[1] https://www.kernel.org/doc/html/next/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node



>> +        };
>> +
>> +        led-1 {
>> +            function = LED_FUNCTION_WLAN_2GHZ;
>> +            color = <LED_COLOR_ID_BLUE>;
>> +            gpios = <&pio 6 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        led-2 {
>> +            function = LED_FUNCTION_WLAN_5GHZ;
>> +            color = <LED_COLOR_ID_BLUE>;
>> +            gpios = <&pio 7 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        led-3 {
>> +            function = LED_FUNCTION_LAN;
>> +            color = <LED_COLOR_ID_BLUE>;
>> +            gpios = <&pio 9 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        led-4 {
>> +            function = LED_FUNCTION_STATUS;
>> +            color = <LED_COLOR_ID_BLUE>;
>> +            gpios = <&pio 10 GPIO_ACTIVE_LOW>;
>> +        };
>> +
>> +        led-5 {
>> +            function = "online";
> 
> Uhm, what does "online" mean?
> 
> Are you sure that you can't use any of the LED_FUNCTION_XXX standard definitions?

This device has:
1. "WAN Port" LED that indicates "WAN Port has connection" state
2. "Internet" LED that indicates "Connected to the Internet" state

I couldn't find any define that would fit Internet access LED case.

