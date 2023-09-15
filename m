Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5708EE6440
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqF0GmXW7u/0GMyc/k7hirQHe/I8GeaepW/dVu/If4I=; b=ZPjejITVvmITlcPnktagXGWV8Z
	889+wPN8JcpSH1FXoeJjHY1TGxLenLkbROtu3cvwXKXe0m7kgRTG7AoVrBdKYn5+Fs/+VCoHciiFr
	fqRHlUwp8Qn13sAHLHxTHrzda1UyxrTWqjOjRQ4aoeu/24LUPPKC/AcdPfBUOtYTZfmuSa8baoLfg
	dAFuK0XX1xFHNA6SgYwKtjT4s2DzE3uHULROxJdIxWS1uOKNE42fx4+Etivh60DqUnP0iBA5E2W1b
	7ZZFZcznOmuKUpFmDxE+x69igKL8IUQIbHLHv77EpCcMitN9LP+WF08JkMGT34LsBM4y8Yk1Gn8tB
	AUYFdULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh40e-00A8AL-1V;
	Fri, 15 Sep 2023 08:17:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh40a-00A89f-2y;
	Fri, 15 Sep 2023 08:17:02 +0000
X-UUID: 3baf031053a011ee86758d4a7c00f3a0-20230915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=YqF0GmXW7u/0GMyc/k7hirQHe/I8GeaepW/dVu/If4I=;
	b=NRlUpoN/dAcBVWAT4ykIIf6TKuvyGpdvwk7QektWns6fbhiAMoJ13JVfjfJ/c9lS+Br3mCIMncapVmJz0ofp6mU0ASKIhLNRYXifp2D4UxNBf2tbr8ykYT1iWVZYGPTNWObuHPEeYRnI0YlH1WyoIy98t9HQxhsx/HtRYwMgFcc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:287df59a-5c08-4a42-990d-4eb1cc182b33,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:0e0bbcef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 3baf031053a011ee86758d4a7c00f3a0-20230915
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 766390131; Fri, 15 Sep 2023 01:16:55 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Sep 2023 16:16:18 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 15 Sep 2023 16:16:17 +0800
Message-ID: <0f34d997-5464-f924-5f8a-b158ab13e7da@mediatek.com>
Date: Fri, 15 Sep 2023 16:16:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: add device-tree for Genio
 700 EVK board
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-QJ Chen <chris-qj.chen@mediatek.com>
References: <20230914061833.32288-1-macpaul.lin@mediatek.com>
 <20230914061833.32288-2-macpaul.lin@mediatek.com>
 <8596fd5e-035b-b7be-3588-c07f27d1f38f@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <8596fd5e-035b-b7be-3588-c07f27d1f38f@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_011700_963606_50374A8B 
X-CRM114-Status: GOOD (  17.24  )
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

On 9/14/23 18:02, AngeloGioacchino Del Regno wrote:
> Il 14/09/23 08:18, Macpaul Lin ha scritto:
>> Add basic device-tree for the Genio 700 EVK board. The
>> Genio 700 EVK is based on MediaTek MT8390 SoC.
>> MT8390 hardware register maps are identical to MT8188.
>>
>> The Genio 700 EVK has following features:
>>
>> - MT8390 SoC
>> - MT6365 PMIC
>> - MT6319 Buck IC
>> - 12V DC Jack
>> - 2x4GB LPDDR4X
>> - 64GB eMMC 5.1
>> - 64Mb SPI NOR
>> - M.2 Key A-E slot with PCIe Gen2 and USB 2.0
>> - 2x DSI LCM ports
>> - 2x touch sensor ports
>> - 2x MIPI-CSI, as camera daughter board slots
>> - USB 2 micro USB connector
>> - USB 3 with 1 to 2 hub:
>>    - M.2 Key B slot
>>    - Type-C connector, with DisplayPort over Type-C
>> - HDMI 2.0 TX port with Type A HDMI connector
>> - eDP port
>> - Gigabit Ethernet with RJ45 connector
>> - SD card slot
>> - Earphone Jack
>> - Analog Microphone
>> - 2x Digital Microphone
>> - 3x UART with serial-to-usb converters and micro USB connectors
>>
>> Signed-off-by: Chris-QJ Chen <chris-qj.chen@mediatek.com>
>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>   .../dts/mediatek/mt8390-genio-700-evk.dts     | 880 ++++++++++++++++++
>>   2 files changed, 881 insertions(+)
>>   create mode 100644 
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
>>
>> dependencies for v1:
>>   - This patch should be applied after the following patch set
>>    - mt8365-gneio-350-evk's dts change (v4)
>>     - 
>> https://lore.kernel.org/linux-arm-kernel/20230912092444.31635-1-macpaul.lin@mediatek.com/T/ 
>>
>>    - mt8395-genio-1200-evk's dts basic support (v6)
>>     - 
>> https://lore.kernel.org/lkml/20230911115717.26184-1-macpaul.lin@mediatek.com/T/ 
>>
>>    - mt8188 platform's basic support
>>     - 
>> https://lore.kernel.org/lkml/a4e1a80ebd19896410f50b0297e05dce06fb47cc.camel@mediatek.com/T/ 
>>
>>
>> changes for v2:
>>   - Fix gpio defines '0' to 'GPIO_ACTIVE_HIGH'.
>>   - Drop duplicate name: 'default' for I2C4.
>>   - Update dependencies
>>    - mt8365-gneio-350-evk's dts change (v5)
>>     - 
>> https://lore.kernel.org/lkml/20230913032226.4092-1-macpaul.lin@mediatek.com/ 
>>
>>    - mt8395-genio-1200-evk's dts basic support (v7)
>>     - 
>> https://lore.kernel.org/linux-arm-kernel/20230913032057.3197-1-macpaul.lin@mediatek.com/T/ 
>>
>>    - mt8188 platform's basic support (v4)
>>     - 
>> https://lore.kernel.org/lkml/a4e1a80ebd19896410f50b0297e05dce06fb47cc.camel@mediatek.com/T/ 
>>
>>
>> changes for v3:
>>   - No change.
>>   - Update dependencies
>>    - mt8365-gneio-350-evk's dts change (v5)
>>     - 
>> https://lore.kernel.org/lkml/20230913032226.4092-1-macpaul.lin@mediatek.com/ 
>>
>>    - mt8395-genio-1200-evk's dts basic support (v8)
>>     - 
>> https://lore.kernel.org/lkml/20230914055145.16801-1-macpaul.lin@mediatek.com/T/ 
>>
>>    - mt8188 platform's basic support (v4)
>>     - 
>> https://lore.kernel.org/lkml/a4e1a80ebd19896410f50b0297e05dce06fb47cc.camel@mediatek.com/T/ 
>>
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile 
>> b/arch/arm64/boot/dts/mediatek/Makefile
>> index 22f362bbbdac..3262849c0f6b 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -54,5 +54,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += 
>> mt8195-cherry-tomato-r3.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-genio-350-evk.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts 
>> b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
>> new file mode 100644
>> index 000000000000..ed6bbf0c15cc
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
>> @@ -0,0 +1,880 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2023 MediaTek Inc.
>> + * Author: Chris Chen <chris-qj.chen@mediatek.com>
>> + *       Pablo Sun <pablo.sun@mediatek.com>
>> + *       Macpaul Lin <macpaul.lin@mediatek.com>
>> + */
>> +/dts-v1/;
>> +
>> +#include "mt8188.dtsi"
>> +#include "mt6359.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
>> +#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +#include <dt-bindings/usb/pd.h>
>> +
>> +/ {
>> +    model = "MediaTek Genio-700 EVK";
>> +    compatible = "mediatek,mt8390-evk", "mediatek,mt8390",
>> +             "mediatek,mt8188";
>> +
> 
> ..snip..
> 
>> +
>> +&i2c0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c0_pins>;
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +
>> +    touchscreen@5d {
>> +        compatible = "goodix,gt9271";
>> +        reg = <0x5d>;
>> +        interrupt-parent = <&pio>;
>> +        interrupts = <6 IRQ_TYPE_EDGE_RISING>;
> 
> interrupts-extended = <&pio 7 IRQ_TYPE_EDGE_RISING>;
> 
> after which:
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>
> 

Line 'interrupts-extended = <&pio 6 IRQ_TYPE_EDGE_RISING>;'
has been fixed in v4 patch.

Thanks!
Macpaul Lin

