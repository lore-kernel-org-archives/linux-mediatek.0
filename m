Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8FFEC8724
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1JmMlgH11tGy/Tb6eLcbcQrxleZQoUgk2bLBlpEraU=; b=QZabUlzHkvjXc6hvgfc6FZ8UVQ
	Srmh/JuUX3Lfc42k+y+UfvDU/KCrlJ9UzATodEnYh0P2b0EKG0keT0F0THKOYmJ2qwoFQOGvmzEPB
	5VybkKhDt3qwfnRjOT1LnAg9jbypPkYxpblQD9qFXjNQc1DbyCTzm6b5AGvJHhtLA+LWzlW4t0vFH
	diNcsvmP5OTA/iULomraCTISBfQUy4xLPnBMyldx9O8v3HOK0IixLvVrNEUPATgeKGJVxIJCtfEKp
	l6h3RXS9Gi3/WLeoSXOlatBGYVdbjCUe9sPqtJ3Y6XvW3yElQpskpG2sYvOPlDRDeGYUl230sjDgw
	gjMq7rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeEd0-00C6t6-28;
	Thu, 07 Sep 2023 13:00:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeEcw-00C6sb-36;
	Thu, 07 Sep 2023 13:00:56 +0000
X-UUID: 8f90ed224d7e11ee86758d4a7c00f3a0-20230907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=m1JmMlgH11tGy/Tb6eLcbcQrxleZQoUgk2bLBlpEraU=;
	b=sM2JL9T86wcGTk3ApPERVhRHSYehvE7DBs3G11dSpdnNisOAYbnElONhAQqgMLU9nA9EjsSto+Wf9m0b+qRMgPn73dxD5dsfMvg6NKYeJy1HJjHsC3OBlr2Uw9/fATTHu/4mL+lov5pvXvPhOwHHinxr5ZvkidqZ3I8bzk65utk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:38b3d187-379c-4512-9d07-800fe2bfce53,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:0ad78a4,CLOUDID:871992be-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8f90ed224d7e11ee86758d4a7c00f3a0-20230907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 91858819; Thu, 07 Sep 2023 06:00:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Sep 2023 21:00:18 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 7 Sep 2023 21:00:17 +0800
Message-ID: <248153d5-2c43-2f02-cc2e-cd49fd524f89@mediatek.com>
Date: Thu, 7 Sep 2023 21:00:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: add device-tree for Genio
 1200 EVK board
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Ben Lok <ben.lok@mediatek.com>
References: <20230906114425.31187-1-macpaul.lin@mediatek.com>
 <20230906114425.31187-2-macpaul.lin@mediatek.com>
 <f9b97807-f0e1-8122-ae33-18a38ad7f195@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <f9b97807-f0e1-8122-ae33-18a38ad7f195@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_060055_012680_7EAAF219 
X-CRM114-Status: GOOD (  26.87  )
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



On 9/7/23 16:48, AngeloGioacchino Del Regno wrote:
> Il 06/09/23 13:44, Macpaul Lin ha scritto:
>> Add basic device-tree for the Genio 1200 EVK board. The
>> Demo board is made by MediaTek and has a MT8395 SoC (MT8195 family),
>> associated with the MT6359 and MT6360 PMICs, and
>> the MT7921 connectivity chip.
>>
>> The IOs available on that board are:
>> * 1 USB Type-C connector with DP aux mode support
>> * 2 USB Type-A connector with a USB hub
>> * 1 micro-USB port for gadget or OTG support
>> * 1 full size HDMI RX and 1 full size HDMI TX connector
>> * 1 micro SD slot
>> * 40 pins header
>> * SPI interface header
>> * 1 M.2 slot
>> * 1 audio jack
>> * 1 micro-USB port for serial debug
>> * 2 connectors for DSI displays, 1 of the DSI panel is installed
>> * 3 connectors for CSI cameras
>> * 1 connector for a eDP panel
>> * 1 MMC storage
>> * 1 Touch Panel (installed DSI display)
>> * 1 M.2 slot for 5G dongle
>>
>> This commit adds basic support in order to be able to boot.
>>
>> Signed-off-by: Ben Lok <ben.lok@mediatek.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>   .../boot/dts/mediatek/genio-1200-evk.dts      | 916 ++++++++++++++++++
>>   2 files changed, 917 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/genio-1200-evk.dts
>>
>> Changes for v2:
>>   - correct SOC binding to "mediatek,mt8395".
>>   - Fix a Linux coding style comments for optee node.
>>   - Fix wifi fixed 3.3v power's node with "wifi-3v3-regulator".
>>   - Fix node name of mt6360 and mt6517 to generic dts name as "pmic".
>>   - Remove unecessary blank line.
>>   - Reording usb node as the order of "phy" then "host".
>>
>> Changes for v3:
>>   - Add back bindings for "mediatek,mt8195".
>>   - Fix wifi fixed 3.3v power's node with "regulator-2"
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile 
>> b/arch/arm64/boot/dts/mediatek/Makefile
>> index c99c3372a4b5..5bf29581f08b 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -1,4 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += genio-1200-evk.dtb
> 
> Please follow the current naming in dts/mediatek/.
> 
> This should be `mt8395-genio-1200-evk.dtb`

Fixed.

> 
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/genio-1200-evk.dts 
>> b/arch/arm64/boot/dts/mediatek/genio-1200-evk.dts
>> new file mode 100644
>> index 000000000000..dd7518784aaf
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/genio-1200-evk.dts
> 
> `mt8195-genio-1200-evk.dts` please

Is this a typo?
I'll get build error if I've actually rename the file name to 
'mt8195-genio-1200-evk.dts' which isn't match mt8395-genio-1200-evk.dtb.
(I've tested it to make sure every thing okay.)

>> @@ -0,0 +1,916 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2023 MediaTek Inc.
>> + * Author: Ben Lok <ben.lok@mediatek.com>
>> + *       Macpaul Lin <macpaul.lin@mediatek.com>
>> + */
>> +/dts-v1/;
>> +
>> +#include "mt8195.dtsi"
>> +#include "mt6359.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>> +#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +#include <dt-bindings/usb/pd.h>
>> +
>> +/ {
>> +    model = "MediaTek Genio 1200 EVK-P1V2-EMMC";
>> +    compatible = "mediatek,mt8395-evk", "mediatek,mt8395",
>> +             "mediatek,mt8195";
>> +
> 
> ..snip..
> 
>> +
>> +&eth {
>> +    phy-mode ="rgmii-rxid";
>> +    phy-handle = <&eth_phy0>;
>> +    snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
>> +    snps,reset-delays-us = <0 10000 10000>;
>> +    mediatek,tx-delay-ps = <2030>;
>> +    mediatek,mac-wol;
>> +    pinctrl-names = "default", "sleep";
>> +    pinctrl-0 = <&eth_default_pins>;
>> +    pinctrl-1 = <&eth_sleep_pins>;
>> +    status = "okay";
>> +
>> +    mdio {
>> +        compatible = "snps,dwmac-mdio";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        eth_phy0: eth-phy0@1 {
>> +            compatible = "ethernet-phy-id001c.c916";
>> +            reg = <0x1>;
>> +        };
>> +    };
>> +};
>> +
>> +&uart0 {
>> +    pinctrl-0 = <&uart0_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
>> +&uart1 {
>> +    pinctrl-0 = <&uart1_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
>> +&scp {
>> +    status = "okay";
>> +};
>> +
>> +&mmc0 {
>> +    status = "okay";
>> +    pinctrl-names = "default", "state_uhs";
>> +    pinctrl-0 = <&mmc0_default_pins>;
>> +    pinctrl-1 = <&mmc0_uhs_pins>;
>> +    bus-width = <8>;
>> +    max-frequency = <200000000>;
>> +    cap-mmc-highspeed;
>> +    mmc-hs200-1_8v;
>> +    mmc-hs400-1_8v;
>> +    cap-mmc-hw-reset;
>> +    no-sdio;
>> +    no-sd;
>> +    hs400-ds-delay = <0x14c11>;
>> +    vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
>> +    vqmmc-supply = <&mt6359_vufs_ldo_reg>;
>> +    non-removable;
>> +};
>> +
>> +&mmc1 {
>> +    pinctrl-names = "default", "state_uhs";
>> +    pinctrl-0 = <&mmc1_default_pins>;
>> +    pinctrl-1 = <&mmc1_uhs_pins>;
>> +    bus-width = <4>;
>> +    max-frequency = <200000000>;
>> +    cap-sd-highspeed;
>> +    sd-uhs-sdr50;
>> +    sd-uhs-sdr104;
>> +    no-mmc;
>> +    no-sdio;
>> +    vmmc-supply = <&mt6360_ldo5>;
>> +    vqmmc-supply = <&mt6360_ldo3>;
>> +    status = "okay";
>> +    non-removable;
>> +};
>> +
>> +
>> +&ufsphy {
>> +    status = "disabled";
>> +};
>> +
>> +&pmic {
> 
> Please order nodes by name. pmic goes before ufsphy.
> 
>> +    interrupt-parent = <&pio>;
>> +    interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
>> +};
>> +
>> +&scp {
>> +    memory-region = <&scp_mem>;
>> +    status = "okay";
>> +};
>> +
>> +&i2c0 {
> 
> ...and `i` comes before 'mmc` as well...
> 
>> +    clock-frequency = <400000>;
>> +    pinctrl-0 = <&i2c0_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
> 
> ..snip..
> 
>> +
>> +&mt6359_vgpu11_buck_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vpu_buck_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vcore_buck_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vbbck_ldo_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vaud18_ldo_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vrf12_ldo_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vcn33_2_bt_ldo_reg {
>> +    regulator-min-microvolt = <3300000>;
>> +    regulator-max-microvolt = <3300000>;
>> +};
>> +
>> +/* DEBUG: to remove */
> 
> ...then remove it? :-)

Fixed.

>> +&mt6359_vibr_ldo_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +/* For USB Hub */
>> +&mt6359_vcamio_ldo_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +&spmi {
> 
> spmi goes after pciephy.... and please fix all of the other instances
> of wrong ordering across this entire file.
> 
> Regards,
> Angelo
> 
> 

I've reordered these node according to alphabet order as could as 
possible. I'll send version v4 for reviewing. Thanks

Best regards,
Macpaul Lin

