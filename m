Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B34C38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLXItZNs7QqdaG6E/nAfar7Vb/Q2tImJeHh0DWDe/kI=; b=Nae93dBxVNDGX3QgzKFlpwE6BQ
	99bZKGLlyVEBWT8gvaCF7Rbkvssm+/F042T5GS4WZtGjB4BstL6ja0UeN73Usm/bHTcEu4kAXkpUl
	qt6Clp3eatwat9nSmmXq/jBX/WM/S1WfwyuqePPWegvBTMdebACfyzyWspYCuwN+w1xC27WitJFQm
	lTnCDe7QOaSsGwTPM/1O113wv9T7GRaNverqeM3InMceMgPak3Uze75yQdd3glktv/x1ZDa8bxxaK
	IyEgYaAx9cO/CyGHOzF4jEKrEb31S0rLVQEzKxxzCOEx9OcOzyBtoX9H44pjWm6WQZFJ4Y7Ag3aLK
	/Gssr4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzNa-00CdDl-L5; Thu, 27 Oct 2022 09:40:50 +0000
Received: from relay04.th.seeweb.it ([5.144.164.165])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzNP-00Cd8h-0n
	for linux-mediatek@lists.infradead.org; Thu, 27 Oct 2022 09:40:41 +0000
Received: from [192.168.31.208] (unknown [194.29.137.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B95E420184;
	Thu, 27 Oct 2022 11:40:28 +0200 (CEST)
Message-ID: <9ced2822-a9d2-2e59-fe40-6c6f690be487@somainline.org>
Date: Thu, 27 Oct 2022 11:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 7/7] arm64: dts: mediatek: Add support for MT6795 Sony
 Xperia M5 smartphone
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
 chaotian.jing@mediatek.com, ulf.hansson@linaro.org, matthias.bgg@gmail.com,
 hsinyi@chromium.org, nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
 fparent@baylibre.com, sam.shih@mediatek.com, sean.wang@mediatek.com,
 long.cheng@mediatek.com, wenbin.mei@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
 <20220729104441.39177-8-angelogioacchino.delregno@collabora.com>
 <a8fa9e22-8c3f-60b2-a0db-01cfd5c37765@somainline.org>
 <17139e24-d33c-8240-cd4a-d87fb3b29276@collabora.com>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <17139e24-d33c-8240-cd4a-d87fb3b29276@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_024039_428799_A758D20B 
X-CRM114-Status: GOOD (  29.10  )
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


On 27/10/2022 11:28, AngeloGioacchino Del Regno wrote:
> Il 29/07/22 14:00, Konrad Dybcio ha scritto:
>>
>>
>> On 29.07.2022 12:44, AngeloGioacchino Del Regno wrote:
>>> Add a basic support for the Sony Xperia M5 (codename "Holly")
>>> smartphone, powered by a MediaTek Helio X10 SoC.
>>>
>>> This achieves a console boot.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>
> Hello Konrad,
> First of all, I'm sorry for the very late reply.
>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>>>   .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 90 
>>> +++++++++++++++++++
>>>   2 files changed, 91 insertions(+)
>>>   create mode 100644 
>>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile 
>>> b/arch/arm64/boot/dts/mediatek/Makefile
>>> index af362a085a02..72fd683c9264 100644
>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>> @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
>> -holly.dtb?
>>
>
> I prefer using the commercial name to identify the device.
> "Holly" is the smartphone project codename and that is mentioned 
> almost nowhere:
> the aim here is to enhance readability as to make it immediately 
> understandable
> that this devicetree is for the Xperia M5 device.

Ok, sounds good.


>
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts 
>>> b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>>> new file mode 100644
>>> index 000000000000..94d011c4126c
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>>> @@ -0,0 +1,90 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2022, Collabora Ltd
>>> + * Author: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +#include "mt6795.dtsi"
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>> Looks unused.
>>
>
> Right, I'll remove that in v2.
>
>>> +
>>> +/ {
>>> +    model = "Sony Xperia M5";
>>> +    compatible = "sony,xperia-m5", "mediatek,mt6795";
>> sony,holly?
>>
>
> I'm sorry, but I can't understand the sense of adding that compatible 
> string to
> the mix. To the kernel, it doesn't mean anything - and we already have 
> another
> string advertising the specific machine, which is "sony,xperia-m5".

I was suggesting replacing xperia-m5 with holly, but since we agreed on 
keeping

m5 in the dtb name, I suppose it's fine for this one to stay too.


>
> Of course, there is no Xperia M5 with a different SoC and, even if 
> there was a
> xperia-m5 with a different SoC, we anyway have both a machine 
> compatible and a
> SoC compatible in here, so that would still not pose any issue.
>
>>> +    chassis-type = "handset";
>>> +
>>> +    aliases {
>>> +        mmc0 = &mmc0;
>>> +        mmc1 = &mmc1;
>>> +        serial0 = &uart0;
>>> +        serial1 = &uart1;
>>> +    };
>>> +
>>> +    memory@40000000 {
>>> +        device_type = "memory";
>>> +        reg = <0 0x40000000 0 0x1E800000>;
>> Lowercase hex in size. Also, doesn't the bootloader fill it in?
>>
>
> Updating the device to the latest software version will give you a 
> bootloader
> that fills that in, but the first-ever software release contains one 
> that will
> not do that in particular conditions (fastboot boot).

Ugh. If only vendors tested their software before shipping it to users..

I think it's worth to adding a comment mentioning that, though.


>
>>> +    };
>>> +
>>> +    reserved_memory: reserved-memory {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +        ranges;
>>> +
>>> +        /* 128 KiB reserved for ARM Trusted Firmware (BL31) */
>> Is that true for all devices with this SoC, or..? If so, it may be worth
>> moving this into mt6795.dtsi.
>>
>>> +        bl31_secmon_reserved: secmon@43000000 {
>> memory@, everywhere. Use labels to name the nodes.
>>
>
> I'm afraid that's not possible, as the bootloader is reading the 
> devicetree
> and requires these nodes to follow this naming.

Wow that's bad.. probably deserves a comment to prevent 'cleanups' 
breaking this.


Konrad

>
>>> +            no-map;
>> reg goes first.
>
> Will fix in v2.
>
> Best regards,
> Angelo
>
>

