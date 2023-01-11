Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547C1C5479D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 04:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQZKq9ub0U1JpjHTlr1nkQUsvL0Dcoim+aUp6I2Olm0=; b=1+bDJ5pgiS6qoDKPToM4+qI/9e
	ivHwscGqcfRlOe8JSDHi7fI8qg+UDPgY+ouspqBoWDGVBIHkf0Pb/+opZodDxlPkm857tSP1Lbc9Q
	0ufMFrR/gjOX7ePaF+0gMgt8FtyALkQC2ZkmIpk+HP6zHeO3Q1vLnrbBZHySvCMxSycoaI7HsrWNt
	X8eNJHIrCK4rR4eMB/gBl4cAGVkyiKz5Cl1OvK+tP8jj5LrkZOlVrMhsvkMUc8XyRLx7NzMZZpof/
	vvn63I4d803MacaZEg0e7/ehaIYTBWqmSzbAI+FkVr0xe+bu3INacTEZ9x6+04olKNxS24aDJXRYa
	wntkUPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFSKl-009Uw5-SQ; Wed, 11 Jan 2023 04:03:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFSKi-009Uud-Qk; Wed, 11 Jan 2023 04:03:26 +0000
X-UUID: e170e3b2916411eda08d4d6090ec5a5c-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=gQZKq9ub0U1JpjHTlr1nkQUsvL0Dcoim+aUp6I2Olm0=;
	b=KBXfn/EZO4MDq3ZNODGvh9VkXE0OoXUt1CYLMyy3/UV7iPyup6bXS8iYUGAVaOxXKw3c+6J8by+KHa2e9Fn6EJTOmceuEk/m+GRXDqiPXV1BY+mbyzNK9DCMPM9VbeGrWuaEPTy3CVbPdz0HfP5KWMS5jp43O4sOkqkLNZT1FLk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:842a4008-df01-404d-a1ab-76440b80185c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:ce2077f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: e170e3b2916411eda08d4d6090ec5a5c-20230110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1419090701; Tue, 10 Jan 2023 21:03:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 11:53:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 11 Jan 2023 11:53:14 +0800
Message-ID: <d4a6da02-c8ce-1171-7b63-1546f33b441d@mediatek.com>
Date: Wed, 11 Jan 2023 11:53:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Content-Language: en-US
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzysztof.kozlowski@linaro.org"
	<krzysztof.kozlowski@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	=?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "macpaul@gmail.com"
	<macpaul@gmail.com>, =?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?=
	<Miles.Chen@mediatek.com>, =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?=
	<Rex-BC.Chen@mediatek.com>, =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?=
	<TingHan.Shen@mediatek.com>, <yow-shin.liou@mediatek.com>,
	<ben.lok@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <74ecff7a-bc75-0514-6aa2-b1401b8d43b8@linaro.org>
 <1f1222103100b02c4ff7d2273860b1beed49256c.camel@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <1f1222103100b02c4ff7d2273860b1beed49256c.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_200324_901299_34A11549 
X-CRM114-Status: GOOD (  19.48  )
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



On 1/11/23 10:19, Chunfeng Yun (云春峰) and Krzysztof Kozlowski wrote:
> On Fri, 2023-01-06 at 13:56 +0100, Krzysztof Kozlowski wrote:
>> On 05/01/2023 10:28, Macpaul Lin wrote:
>>> Introduce the split MT8195 laptop and iot USB configurations.
>>> The hardware specifications for LAPTOP devices is different from
>>> IOT
>>> devices. The major differences include some hardware constrains for
>>> dual-role switch for USB controllers in different configurations,
>>> especially for power management and other control flows as well.
>>>
>>> Here are some hardware specifiction differences listed:
>>>    1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device
>>> mode).
>>>    2. IOT devices must support multiple gadget devices and host
>>> mode.
>>>    3. Dual-role switch is not fully supported. Only USB PORT0
>>> support
>>>       dual-role switch.
>>>    4. Power management is designed in primary and secondary
>>> dominator.
>>>       For a dual-role port, the device controller is the primary
>>> controller
>>>       for power management; while the host controller is the
>>> secondary.
>>>       LAPTOP devices should remove device nodes for avoiding
>>> abnormal
>>>       behavior.
>>>
>>> This modifcation is to add USB configurations "mt8195-laptop-
>>> usb.dtsi"
>>> for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.
>>>
>>> To remove common USB configurations for mt8195.dtsi and switch
>>> includes
>>> dtsi these new files for the boards will come in next patch.
>>>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>   .../boot/dts/mediatek/mt8195-iot-usb.dtsi     | 122
>>> ++++++++++++++++++
>>>   .../boot/dts/mediatek/mt8195-laptop-usb.dtsi  | 102
>>> +++++++++++++++
>>>   2 files changed, 224 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-iot-
>>> usb.dtsi
>>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-laptop-
>>> usb.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
>>> new file mode 100644
>>> index 000000000000..f9bd79542044
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-iot-usb.dtsi
>>> @@ -0,0 +1,122 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (C) 2022 MediaTek Inc.
>>> + */
>>> +
>>> +#include "mt8195.dtsi"
>>> +
>>> +/ {
>>> +	soc {
>>> +		ssusb: ssusb@11200000 {
>>
>> Node name: usb

Got it.

>>
>>> +			compatible ="mediatek,mt8183-mtu3",
>>> "mediatek,mtu3";
>>> +			reg = <0 0x11201000 0 0x2dff>,
>>> +			      <0 0x11203e00 0 0x0100>;
>>> +			reg-names = "mac", "ippc";
>>> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			phys = <&u2port0 PHY_TYPE_USB2>,
>>> +			       <&u3port0 PHY_TYPE_USB3>;
>>> +			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
>>> +				 <&topckgen CLK_TOP_SSUSB_REF>,
>>> +				 <&infracfg_ao
>>> CLK_INFRA_AO_SSUSB_XHCI>;
>>> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
>>> +			#address-cells = <2>;
>>> +			#size-cells = <2>;
>>> +			ranges;
>>> +			status = "disabled";
>>> +
>>> +			xhci0: xhci@11200000 {
> s/xhci/usb
>>> +				compatible = "mediatek,mt8195-xhci",
>>> +					     "mediatek,mtk-xhci";
>>> +				reg = <0 0x11200000 0 0x1000>;
>>> +				reg-names = "mac";
>>> +				interrupts = <GIC_SPI 129
>>> IRQ_TYPE_LEVEL_HIGH 0>;
>>> +				assigned-clocks = <&topckgen
>>> CLK_TOP_USB_TOP>,
>>> +						  <&topckgen
>>> CLK_TOP_SSUSB_XHCI>;
>>> +				assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>,
>>> +							 <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +				clocks = <&infracfg_ao
>>> CLK_INFRA_AO_SSUSB>,
>>> +					 <&infracfg_ao
>>> CLK_INFRA_AO_SSUSB_XHCI>,
>>> +					 <&topckgen CLK_TOP_SSUSB_REF>,
>>> +					 <&apmixedsys
>>> CLK_APMIXED_USB1PLL>;
>>> +				clock-names = "sys_ck", "xhci_ck",
>>> "ref_ck", "mcu_ck";
>>> +				status = "disabled";
>>> +			};
>>> +		};
>>> +
>>> +		xhci1: xhci1@11290000 {
>>
>> Node names should be generic, so just "xhci"
> also use "usb", no generic name "xhci" in the following spec
> 

Thanks for the reminding. I'll align the naming assignment in origin 
mt8195.dtsi and in the following specification.

>>
> https://urldefense.com/v3/__https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html*generic-names-recommendation__;Iw!!CTRNKA9wMg0ARbw!n5NxtuBHI5f9tS659pqDgRDZNAFxnXriet0G48KA64n1CEWYYsL0vXY0I-Mw99H8a8UDW5KR_79k7IvYg8Er5gNvmkXE9HZH$
>>   
>>
>>> +			compatible = "mediatek,mt8195-xhci",
>>> +				     "mediatek,mtk-xhci";
>>> +			reg = <0 0x11290000 0 0x1000>,
>>> +			      <0 0x11293e00 0 0x0100>;
>>> +			reg-names = "mac", "ippc";
>>> +			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			phys = <&u2port1 PHY_TYPE_USB2>,
>>> +			       <&u3port1 PHY_TYPE_USB3>;
>>> +			assigned-clocks = <&topckgen
>>> CLK_TOP_USB_TOP_1P>,
>>> +					  <&topckgen
>>> CLK_TOP_SSUSB_XHCI_1P>;
>>> +			assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>,
>>> +						 <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +			clocks = <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_1P_BUS>,
>>> +				 <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_1P_XHCI>,
>>> +				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
>>> +				 <&apmixedsys CLK_APMIXED_USB1PLL>;
>>> +			clock-names = "sys_ck", "xhci_ck", "ref_ck",
>>> "mcu_ck";
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		ssusb1: usb1@112a1000 {
>>
>> usb
>>

Got it.

>>> +			compatible = "mediatek,mt8183-mtu3",
>>> "mediatek,mtu3";
>>> +			reg = <0 0x112a1000 0 0x2dff>,
>>> +				  <0 0x112a3e00 0 0x0100>;
>>> +			reg-names = "mac", "ippc";
>>> +			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			phys = <&u2port2 PHY_TYPE_USB2>;
>>> +			assigned-clocks = <&topckgen
>>> CLK_TOP_USB_TOP_2P>;
>>> +			assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +			clocks = <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_2P_BUS>,
>>> +				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
>>> +				 <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_2P_XHCI>;
>>> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
>>> +			mediatek,syscon-wakeup = <&pericfg 0x400 4>;
>>> +			#address-cells = <2>;
>>> +			#size-cells = <2>;
>>> +			ranges;
>>> +			status = "disabled";
>>> +
>>> +			xhci2: xhci2@112a0000 {
>>
>> xhci
> use "usb", no need change it when move from mt8195.dtsi
> 

Got it.

>>
>>> +				compatible = "mediatek,mt8195-
>>> xhci","mediatek,mtk-xhci";
>>> +				reg = <0 0x112a0000 0 0x1000>;
>>> +				reg-names = "mac";
>>> +				interrupts-extended = <&gic GIC_SPI 533
>>> IRQ_TYPE_LEVEL_HIGH 0>,
>>> +					      <&pio 220
>>> IRQ_TYPE_EDGE_FALLING>;
>>> +				assigned-clocks = <&topckgen
>>> CLK_TOP_SSUSB_XHCI_2P>;
>>> +				assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +				clocks = <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_2P_XHCI>;
>>> +				clock-names = "sys_ck";
>>> +				status = "disabled";
>>> +			};
>>> +		};
>>> +
>>> +		xhci3: xhci3@112b0000 {
>>
>> xhci
> usb

Got it.

>>> +			compatible = "mediatek,mt8195-xhci",
>>> +				     "mediatek,mtk-xhci";
>>> +			reg = <0 0x112b0000 0 0x1000>,
>>> +			      <0 0x112b3e00 0 0x0100>;
>>> +			reg-names = "mac", "ippc";
>>> +			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH
>>> 0>;
>>> +			phys = <&u2port3 PHY_TYPE_USB2>;
>>> +			assigned-clocks = <&topckgen
>>> CLK_TOP_USB_TOP_3P>,
>>> +					  <&topckgen
>>> CLK_TOP_SSUSB_XHCI_3P>;
>>> +			assigned-clock-parents = <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>,
>>> +						 <&topckgen
>>> CLK_TOP_UNIVPLL_D5_D4>;
>>> +			clocks = <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_3P_BUS>,
>>> +				 <&pericfg_ao
>>> CLK_PERI_AO_SSUSB_3P_XHCI>,
>>> +				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
>>> +			clock-names = "sys_ck", "xhci_ck", "ref_ck";
>>> +			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
>>> +			wakeup-source;
>>> +			usb2-lpm-disable;
>>> +			status = "disabled";
>>> +		};
>>
>>
>> Best regards,
>> Krzysztof
>>

Thanks
Macpaul Lin

