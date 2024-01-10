Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC47EC4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsR/ATrfPdIgLGIZ2coCrOAOA9UzCcQEuLMVPEYRm48=; b=HuqL62guyJl4dy+Ze+jaIw9Jvf
	QbUu0uQjLG7JULwg0fgESuv6NQwksLIez31zwoc/BC9nbHcwLZ0yCj1XQ00yA33AA1qbcgKoEwHtw
	xpK9GYwzMi50Po94zDwG3nwlmctqg0H/5cmaj715O1iAyu0RThQFCWChoPZaaoiT/EAh2uQcNbhTF
	1fmRgvWFsaIKh6qXLok50nYQiQcQb8M5BRctWs2/z9qYlOu8BFfsJ2/WNdVPYjwgIykn3I1icIWMV
	r+rlvi0J1325/mVmMRz8u4XK1f+jw+e3BxkBWUlVoIZkhildfm/FrgyBUUWlvQM5Ed/1HdE0ZL0xe
	ppAk9m2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNaiL-00CeYV-23;
	Wed, 10 Jan 2024 15:41:57 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNaiH-00CeWh-3C;
	Wed, 10 Jan 2024 15:41:55 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a29058bb2ceso466012866b.0;
        Wed, 10 Jan 2024 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704901310; x=1705506110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsR/ATrfPdIgLGIZ2coCrOAOA9UzCcQEuLMVPEYRm48=;
        b=Ca6JjzM5DFpb0LN2h4iXP5S8xJ/N5q/0npVzoDK7xt4XHC+DPCowZoJyihVo84Yl5F
         +zPs5d0rMz4IzLTakUkFK56lokXaGFgixQhURY+EhDAzV48WWtq1jOmnDvl5CI/dbgcw
         fmHRzGVdUIO1+NWFRszlXnPFnl3EONa0z1CbCwMrIo4Xlcu8eRaSkbSnpcs+1SsAKDFc
         TOpPO8vBV6qnZEKrTw1jl+hs0R/jtV6En4NRTCiNoKA+nT0GqK0rsb2WxU21FWg0UAYo
         bTIHbxv3HC3DBGqA7ywoLAU7ZRZXvykNYnl1KqwfFazp7rnZnoPGuOzNzJfSI1qD9ZvN
         Ggcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704901310; x=1705506110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsR/ATrfPdIgLGIZ2coCrOAOA9UzCcQEuLMVPEYRm48=;
        b=I39esZKJaF7Re/HmcWj7rC5bOmUr20V5dg7wy7pn4huKRPupqxX+1zeBUmYABRF8MM
         nxfDXvMRAtPBNyEFGTk9aijvqUz+BKk0ZsxjdaukjLIlvTeypbY6zC9BKNBJNayNVvpP
         O7Vv0x6HlPTyqGlXV5th28y7L9pQOn6hvx28Glz8Iln7YbootDRSFwEPp2kt/PX16wWz
         QCEd1a284j9D0WUtjaUwn6ji5W8iLzpo2czJ8S7TXQklk7SIRh5ogo0rF/xabyvkPPfY
         ylMNFLr+X8xksgs0KzSD6877VKCK++rbop6s5jqwiDFyLAdbmkcu8ocoJXMKdxQZVj8s
         j4qw==
X-Gm-Message-State: AOJu0Yyorw2ZER67ezquoT1KwzR7VBjP6svxSlm+JK24vOrckOvZ1A+7
	hWm3xltcYf3WeWtCkdPFdpo=
X-Google-Smtp-Source: AGHT+IEpzs8YcWbD9Zfpq1vhLm5OkWGSL3+lkBeN5CTV4dvVJhPvEdFa+MGe40p0nNRxX1INZDFyPQ==
X-Received: by 2002:a17:907:6016:b0:a28:a79e:7f5b with SMTP id fs22-20020a170907601600b00a28a79e7f5bmr362566ejc.221.1704901309935;
        Wed, 10 Jan 2024 07:41:49 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id g19-20020a170906349300b00a2a2426728bsm2223958ejb.178.2024.01.10.07.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 07:41:49 -0800 (PST)
Message-ID: <557cf463-5ffa-4d81-8b38-44f610b26163@gmail.com>
Date: Wed, 10 Jan 2024 16:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: Add initial MT7981B and Xiaomi
 AX3000T
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240110095118.25598-1-zajec5@gmail.com>
 <20240110095118.25598-2-zajec5@gmail.com>
 <34bda5e0-0587-459b-b31c-46112b1b10fa@collabora.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <34bda5e0-0587-459b-b31c-46112b1b10fa@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_074154_032901_AD2B7238 
X-CRM114-Status: GOOD (  19.88  )
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

On 10.01.2024 14:38, AngeloGioacchino Del Regno wrote:
> Il 10/01/24 10:51, Rafał Miłecki ha scritto:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> MT7981B (AKA MediaTek Filogic 820) is a dual-core ARM Cortex-A53 SoC.
>> One of market devices using this SoC is Xiaomi AX3000T.
>>
>> This is initial contribution with basic SoC support. More hardware block
>> will get added later. Some will need their bindings (like auxadc).
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>   .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |  15 +++
>>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 108 ++++++++++++++++++
>>   3 files changed, 124 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>> index 0a189d5d8006..8bff11acfe1f 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
>> new file mode 100644
>> index 000000000000..a314c3e05e50
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +
>> +/dts-v1/;
>> +
>> +#include "mt7981b.dtsi"
>> +
>> +/ {
>> +    compatible = "xiaomi,ax3000t", "mediatek,mt7981b";
>> +    model = "Xiaomi AX3000T";
>> +
>> +    memory@40000000 {
>> +        reg = <0 0x40000000 0 0x10000000>;
>> +        device_type = "memory";
>> +    };
>> +};
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
>> new file mode 100644
>> index 000000000000..ce878ad55204
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
>> @@ -0,0 +1,108 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>> +
>> +#include <dt-bindings/clock/mediatek,mt7981-clk.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +    compatible = "mediatek,mt7981b";
>> +    interrupt-parent = <&gic>;
>> +    #address-cells = <2>;
>> +    #size-cells = <2>;
>> +
>> +    cpus {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        cpu@0 {
>> +            compatible = "arm,cortex-a53";
>> +            reg = <0x0>;
>> +            device_type = "cpu";
>> +            enable-method = "psci";
>> +        };
>> +
>> +        cpu@1 {
>> +            compatible = "arm,cortex-a53";
>> +            reg = <0x1>;
>> +            device_type = "cpu";
>> +            enable-method = "psci";
>> +        };
>> +    };
>> +
>> +    oscillator-40m {
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <40000000>;
>> +        clock-output-names = "clkxtal";
>> +        #clock-cells = <0>;
>> +    };
>> +
>> +    psci {
>> +        compatible = "arm,psci-0.2";
> 
> PSCI 0.2? I invite you to check a kernel log for a string like this one:
> 
> `PSCIv%d.%d detected in firmware`
> ...because of course if it says v1.0, this should be "arm,psci-1.0".
> 
> This is just a nitpick anyway, so you can already get my
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> P.S.: but please, confirm or deny that PSCI thing ASAP :-)
> P.P.S.: For next time - I'd be happy if you could add a cover letter to your
> patch series..!

You were right, good catch!

[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0

I'll fix that in V2. Thanks!


