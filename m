Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF9FC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xM3c7PPthilM+mdtoYqBLNrP+ChRJiSMtXVAPSkDtUk=; b=oU76JdQi7N55NSR435LYBm2KvR
	V/Eu9qjQLQQONh4CaivjFoTy73FQKgmGbt0zhqbhi55HjnFVB06iwPMezGdEe/q9jIoep/XNKCg2c
	WdJftyo6LjaHV2krQD5ZVQytHdbPIzLQBVSI1HBq0o5a0vugoLbn0/5IM4cvEVEVDIU1m+voQWEWH
	Q/bS0ysDPoXRL04pAj+V0LHXqBX4aEtBCjCD7gNUaBH2gbKRoI2w5IbhWRlyncZv7uOnqn9opodQC
	5ygPIYCfeNpLtrnnUD7WgdCgfJ3SGcLfYpYeOeJ8hy0jIX2jSeZYqot/XHvMeACXmj4S/GFASWDc4
	Gg2GG+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r583a-00Dngg-2n;
	Mon, 20 Nov 2023 17:27:35 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r583X-00Dnad-0L;
	Mon, 20 Nov 2023 17:27:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5094727fa67so6433494e87.3;
        Mon, 20 Nov 2023 09:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700501245; x=1701106045; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xM3c7PPthilM+mdtoYqBLNrP+ChRJiSMtXVAPSkDtUk=;
        b=U63o/y3AD2nxOrnOoGJfJji7CusIiufWIchnw9kK4p3GgWrV9B9nLAPUMCwjQxIMlO
         k6qq5xOl5czJ9Da9AfJqxmg6uYdizsOnZ7ow8ZcbX/e7jC9SQw72sSvbMZEZ1/hrKLst
         bi1zYZGC2Hv/z426pWal32QoOKT4VhkVXdg5ZK0ME6pX+L8Mk0afVh3zRVbV+bG9LCqu
         Gd42kaN5of3X/ZmCIHNf3mthlGWo5Y9XbaEBfBaSJ2qRESbT9+0AIb9K2nRbXLrAu1Di
         IMrwdrW2bQ6M1bSxsojcfZAnTGz9xw1y+CVrQdFhgLmsoYs13CTCDLKF/yZmQ7jE3EJj
         S97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501245; x=1701106045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xM3c7PPthilM+mdtoYqBLNrP+ChRJiSMtXVAPSkDtUk=;
        b=W054Fq6CjGeAjHcYaZ3BYuzrfKOzLm06qQ33zYHvRTb5NA3U1gMFi0M7l8QQb9UHyX
         hQwclbGRim/HeX34Qz/Cl8NJedc83lK3zvX/9VO0bDLqblUDey56wZc2fDYBkINyduad
         zeNXDRBnKtBV9Y+vbsVm+0DJ/zsQHfxvNBymVcldjiNRK/zxGBI9yxb3jgqRfFexul5m
         JwIZTnZJ4K3rc7ooSsWG4HtWM6uH1VvCMFDiilRhA1fz9NWtyAK2N5iOc5hWCizaGMpB
         xCqV9hZJzV95ixDaSLcQKrc6y0amRR+2VY4DNUZUMf6ejuw1GvdcTN5p0qjlSffdeZE9
         VdVA==
X-Gm-Message-State: AOJu0YwMwLzn1l2CUVXaxdmG9NhJs6BAxPmMp7/H/c3Gq7pCmnWKbUQu
	WCdLfcMc9T4gRrE9isr7HxA=
X-Google-Smtp-Source: AGHT+IHhwus3LZ9hcly7AHAGwLptRKG1AiXE3sRtHL/h1JYi/AmNkY1+8Yp1GWECgh5streU2vI7lA==
X-Received: by 2002:ac2:4552:0:b0:509:4863:137d with SMTP id j18-20020ac24552000000b005094863137dmr5968502lfm.7.1700501244454;
        Mon, 20 Nov 2023 09:27:24 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id f2-20020a50ee82000000b00548c4c4b8d5sm1134828edr.13.2023.11.20.09.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 09:27:24 -0800 (PST)
Message-ID: <b13b6ad3-2ef9-482a-bec4-8f23de6c951f@gmail.com>
Date: Mon, 20 Nov 2023 18:27:21 +0100
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
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <0c3267e5-5371-4fd8-a0f6-360ff28c9dda@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_092731_167722_CA581EB0 
X-CRM114-Status: GOOD (  21.96  )
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

On 20.11.2023 15:17, AngeloGioacchino Del Regno wrote:
> Il 17/11/23 11:43, Rafał Miłecki ha scritto:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.
>> It has 512 MiB of RAM, one 2.5 Gbps PoE (802.3at) Ethernet port and
>> on-SoC Wi-Fi.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>   .../mediatek/mt7986a-acelink-ew-7886cax.dts   | 175 ++++++++++++++++++
>>   2 files changed, 176 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>> index e6e7592a3645..9ff2ab6c5e4d 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
>> new file mode 100644
>> index 000000000000..18d19281dfdb
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
>> @@ -0,0 +1,175 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +#include "mt7986a.dtsi"
>> +
>> +/ {
>> +    model = "Acelink EW-7886CAX";
>> +    compatible = "acelink,ew-7886cax", "mediatek,mt7986a";
>> +
>> +    aliases {
>> +        serial0 = &uart0;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = "serial0:115200n8";
>> +    };
>> +
>> +    memory@40000000 {
>> +        reg = <0 0x40000000 0 0x20000000>;
>> +        device_type = "memory";
>> +    };
>> +
>> +    keys {
>> +        compatible = "gpio-keys";
>> +
>> +        key-restart {
>> +            label = "Reset";
>> +            gpios = <&pio 7 GPIO_ACTIVE_LOW>;
>> +            linux,code = <KEY_RESTART>;
>> +        };
>> +    };
>> +
>> +    leds {
>> +        compatible = "gpio-leds";
>> +
>> +        led-0 {
> 
> Please, reorder by name
> 
>              color =    ...
>              function = ...
>              gpios = ...

Can you explain why and if there is a place I can find rules to follow
regarding such aspects? I really would like to just be aware of all
rules and don't waste anyone's time for such details.

FWIW I checked Documentation/devicetree/bindings/*.rst (after few years
I admit) but I couldn't find anything there about properties order.

If we currently don't have rules I don't really think we should enforce
following per-maintainer preferences. I really don't object your
suggestions but there is simply no way to remember each maintainer's
rules. We simply have too many subsystems and architectures boards.


>> +            function = LED_FUNCTION_STATUS;
>> +            color = <LED_COLOR_ID_RED>;
>> +            gpios = <&pio 18 GPIO_ACTIVE_HIGH>;
>> +        };
>> +
>> +        led-1 {
>> +            function = LED_FUNCTION_STATUS;
>> +            color = <LED_COLOR_ID_GREEN>;
>> +            gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
>> +        };
>> +
>> +        led-2 {
>> +            function = LED_FUNCTION_STATUS;
>> +            color = <LED_COLOR_ID_BLUE>;
>> +            gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
>> +        };
>> +    };
>> +};
>> +
>> +&watchdog {
> 
> Ordering again, watchdog goes before wifi

Actually I ordered those in what I believe to be the most natural
numeric order. All those blocks references are ordered by the order
they appear in the included file and those follow numeric order I
believe.

I'd go as far as to claim using alhapbetical labels order is pretty
weak. Labels can be renamed and that would require reordering a lot of
.dts entries. On the other hand SoC's MMIO accessible hardware blocks
are quite unlikely to get reordered.


>> +    status = "okay";
>> +};
>> +
>> +&trng {
>> +    status = "okay";
>> +};
>> +
>> +&crypto {
> 
> crypto goes first.
> 
> crypto, eth, pcie_phy, spi0, trng, watchdog, wifi.
> 
>> +    status = "okay";
>> +};
>> +
>> +&uart0 {
>> +    status = "okay";
>> +};
>> +
>> +&spi0 {
>> +    status = "okay";
>> +
>> +    flash@0 {
>> +        compatible = "spi-nand";
>> +        reg = <0>;
> 
> compatible
> reg
> #address/size cells
> spi-max-frequency
> spi-rx-bus-width
> spi-tx-bus-width
> 
>> +        spi-max-frequency = <52000000>;
>> +        spi-tx-bus-width = <4>;
>> +        spi-rx-bus-width = <4>;
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        partitions: partitions {
>> +            compatible = "fixed-partitions";
>> +            #address-cells = <1>;
>> +            #size-cells = <1>;
>> +
>> +            partition@0 {
>> +                label = "bootloader";
>> +                reg = <0x0 0x100000>;
> 
> label, reg, read-only
> 
>> +                read-only;
>> +            };
>> +
>> +            partition@100000 {
>> +                label = "u-boot-env";
> 
> reg first, label last
> 
>> +                reg = <0x100000 0x80000>;
>> +            };
>> +
>> +            factory: partition@180000 {
> 
> Why do you have a phandle here? This has no use, please remove.
> 
>> +                label = "factory";
>> +                reg = <0x180000 0x200000>;
>> +                read-only;
>> +                compatible = "nvmem-cells";
> 
> compatible
> reg
> label
> read-only;
> 
>> +
>> +                nvmem-layout {
>> +                    compatible = "fixed-layout";
>> +                    #address-cells = <1>;
>> +                    #size-cells = <1>;
>> +
>> +                    eeprom: eeprom@0 {
>> +                        reg = <0x0 0x1000>;
>> +                    };
>> +
>> +                    macaddr: macaddr@4 {
>> +                        reg = <0x4 0x6>;
>> +                    };
>> +                };
>> +            };
>> +
>> +            partition@380000 {
>> +                label = "fip";
>> +                reg = <0x380000 0x200000>;
> 
> reg first, label last
> 
>> +            };
>> +
>> +            partition@580000 {
>> +                label = "ubi";
>> +                reg = <0x580000 0x4000000>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
> 
> Regards,
> Angelo


