Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AD0C54FB9
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ureO+uz+HH3VWTrrGTWXTia0TXwq9jc/nCIjnx/zm8E=; b=2cY330jfeZ57WMIHeyhvWgnRiw
	ZXNR7zTM6Z/2WeHwrsPld8ALWl9EF6dlwnqdV7e5rFse/IgK+uNF1aXrmyv7pVGm7cCH3M3cir7Vq
	yrqr0DYTTaJg/QREtx5p90fj9D/0GzCNmuk0XQqOCqOwhAeFtkwOrGRm6rjAlpJSQacT2v6pgEtom
	irxKkyLJOPCToPqbDS2ttnHwM/5D+SfkymUqZg0ItmKdsATK5CKKoAY3JRQxo8sj4mo3PldeVH/69
	m2KoysKgW0frH+PvNmEd0EXNSaDit8TPVqkOGh2EmGz+vJfQKJeuGbgGOuXTG+zOTJ92aoqstu104
	k5opCO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OjV-00GOfI-0I;
	Tue, 21 Nov 2023 11:15:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OjR-00GOdn-1T;
	Tue, 21 Nov 2023 11:15:55 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50930f126b1so7075849e87.3;
        Tue, 21 Nov 2023 03:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700565347; x=1701170147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ureO+uz+HH3VWTrrGTWXTia0TXwq9jc/nCIjnx/zm8E=;
        b=IjEpCT+BI1Vrmn7r8459p6NjZLGxKeGC1d+OefHLvCk+mhsI2taowpPOhBcyE++7AT
         gdVi1haEYt7LaGK+yAkhUmZs8Cf76lkaqfxzkqFYJHRSLcnwP/uepqivjkPQ4iE7LVat
         /Ei/bv+pu54lHnsAd1nWnyLlBW/F3P8YQ+yqjWUAm2B4S5Yx2JuQ8gSSNv1oW82STHZb
         m8ptl2gkhSeZ2qPNgUwtjjztoVQyIESF/BTHTsW7VbohY5POZEJGT5n7Pu97lSSHsW3T
         WvLKoBhLEhXu3zUPq1hIlRDvfP58WJ40n2K8aIxfxSvsNOxAAwhPi5XLCDNgcRUOT5I9
         qmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700565347; x=1701170147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ureO+uz+HH3VWTrrGTWXTia0TXwq9jc/nCIjnx/zm8E=;
        b=def736YMjeqiRFDBACMYDhNKO5NWu+gmAXyA4oQTP4Q72mB2yGH7MAyIWahhL60E5M
         nux+SCPoGK4IocJQZnTZ9oTvTse7RlQHFFXs/Lbx1banuFnngoFblBGWeL6WIiHeWfdz
         6TxXlmCA3DQbRheKMkzdTI2760u5cOCR9Vvc5st00CT4335W7qjaYH+lMbamYRdcJFoa
         i13qOG+piFzvd7PJqACuyd3JX6jICHJB9U8D/fEVH8W0ejtWLAFhwMIiFmhp55UnMsgb
         aoyvCuWMilHES60xjaivEBHt71nKcFHq8QxR79DjY+iuqYuxPdzdNnly57nOHbUtZYH+
         EWOQ==
X-Gm-Message-State: AOJu0YyCVLFHedtVngUdguMRq56tgD/ADFvBoAEjCZ/dNLiWj53H7C1G
	1p2DhL2zcX9Tc+mX3d3xdg8=
X-Google-Smtp-Source: AGHT+IF+ca+iA+AgWJJxG336wPchy8U1lzUCfl4fZu0x93tY+S/cX8tc1q5hjP9nQBcoID876FPrYg==
X-Received: by 2002:a05:6512:110d:b0:50a:a82c:a5f2 with SMTP id l13-20020a056512110d00b0050aa82ca5f2mr8673055lfg.66.1700565346890;
        Tue, 21 Nov 2023 03:15:46 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id q25-20020a19a419000000b005056422d204sm1495561lfc.158.2023.11.21.03.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 03:15:46 -0800 (PST)
Message-ID: <147af53c-1695-4c83-a83d-b6460b332f63@gmail.com>
Date: Tue, 21 Nov 2023 12:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231117104315.9718-2-zajec5@gmail.com>
 <20231117104315.9718-3-zajec5@gmail.com>
 <0c3267e5-5371-4fd8-a0f6-360ff28c9dda@collabora.com>
 <b13b6ad3-2ef9-482a-bec4-8f23de6c951f@gmail.com>
 <94165a35-4ce9-4624-938f-00545562fee4@collabora.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <94165a35-4ce9-4624-938f-00545562fee4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_031553_491970_202670C2 
X-CRM114-Status: GOOD (  20.17  )
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

On 21.11.2023 11:31, AngeloGioacchino Del Regno wrote:
> Il 20/11/23 18:27, Rafał Miłecki ha scritto:
>> On 20.11.2023 15:17, AngeloGioacchino Del Regno wrote:
>>> Il 17/11/23 11:43, Rafał Miłecki ha scritto:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.
>>>> It has 512 MiB of RAM, one 2.5 Gbps PoE (802.3at) Ethernet port and
>>>> on-SoC Wi-Fi.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>>>   .../mediatek/mt7986a-acelink-ew-7886cax.dts   | 175 ++++++++++++++++++
>>>>   2 files changed, 176 insertions(+)
>>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>>>> index e6e7592a3645..9ff2ab6c5e4d 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>>> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>>>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
>>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
>>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
>>>> new file mode 100644
>>>> index 000000000000..18d19281dfdb
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
>>>> @@ -0,0 +1,175 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>>>> +
>>>> +/dts-v1/;
>>>> +#include <dt-bindings/input/input.h>
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/leds/common.h>
>>>> +
>>>> +#include "mt7986a.dtsi"
>>>> +
>>>> +/ {
>>>> +    model = "Acelink EW-7886CAX";
>>>> +    compatible = "acelink,ew-7886cax", "mediatek,mt7986a";
>>>> +
>>>> +    aliases {
>>>> +        serial0 = &uart0;
>>>> +    };
>>>> +
>>>> +    chosen {
>>>> +        stdout-path = "serial0:115200n8";
>>>> +    };
>>>> +
>>>> +    memory@40000000 {
>>>> +        reg = <0 0x40000000 0 0x20000000>;
>>>> +        device_type = "memory";
>>>> +    };
>>>> +
>>>> +    keys {
>>>> +        compatible = "gpio-keys";
>>>> +
>>>> +        key-restart {
>>>> +            label = "Reset";
>>>> +            gpios = <&pio 7 GPIO_ACTIVE_LOW>;
>>>> +            linux,code = <KEY_RESTART>;
>>>> +        };
>>>> +    };
>>>> +
>>>> +    leds {
>>>> +        compatible = "gpio-leds";
>>>> +
>>>> +        led-0 {
>>>
>>> Please, reorder by name
>>>
>>>              color =    ...
>>>              function = ...
>>>              gpios = ...
>>
>> Can you explain why and if there is a place I can find rules to follow
>> regarding such aspects? I really would like to just be aware of all
>> rules and don't waste anyone's time for such details.
>>
>> FWIW I checked Documentation/devicetree/bindings/*.rst (after few years
>> I admit) but I couldn't find anything there about properties order.
>>
>> If we currently don't have rules I don't really think we should enforce
>> following per-maintainer preferences. I really don't object your
>> suggestions but there is simply no way to remember each maintainer's
>> rules. We simply have too many subsystems and architectures boards.
>>
>>
> 
> What I said is not a maintainer preference but more of a general rule, which is
> in the process of being documented.
> 
> Check the patch there, at the time of writing, v2:
> https://lore.kernel.org/all/20231120084044.23838-1-krzysztof.kozlowski@linaro.org/

That is exactly what I was looking for (except I didn't assume it may we
WIP). Thank you!

