Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B662BC25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFAoAFMPSDAF2hSbEFLdE/+HaXvlvZ8+PKbWUnzgWKA=; b=dvTrDq1gFAMXzh
	mfdYiT7WLnh7L8cEZCmNvLdpm2HY+0q8jIBUocljaBCMqhYZzFQVrMod+97CdYWUaZVuz2LRczwoo
	g/t+1bvTToD9HWdnrVyxYSUqkQeHaS3p2uAc5z8DhaMa56Qnmi8syVF/JBXB6YWyoWRoQkVNamv90
	M7v8DqI95c06iY2mAJi30GqIkQe6tWDavn29WcgiCksjNpzs5SK8Qzi3u7fKIKkGdJybLP6Ku0KF3
	AVsQXrsIsWvB5Ua8RG/gd+H1i9tCRTdMk8XQCHChNlJ72pg4atlUfFbiorlR71qZPRN7JSlqwHFDz
	74qbEMysZK1iVvITdPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40lv-00000007y9R-39C8;
	Mon, 06 May 2024 16:00:59 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40lr-00000007y8F-2nff;
	Mon, 06 May 2024 16:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715011232; x=1715616032; i=frank-w@public-files.de;
	bh=zFAoAFMPSDAF2hSbEFLdE/+HaXvlvZ8+PKbWUnzgWKA=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lECczozPYgtFgQrcICyUzEC0UxuR1o1hopHkKbOVEyykpM0jdqUUY8p2nSe8y20b
	 hGiVtNmSas2qQYnWkGO+An73APii4lR5aEaU3SuIZfHUETHTSwaBuqKGXZav+2Nbd
	 1jO0a4MhqzarlsHnF40ihJJ8IRz51lD/TaQkNVQYj5bTW1v3Y2BVAv0m+E6bcdDx8
	 HuN52MDjiQvGcJIuW7z2qgMoubGGYXkAmb49w4s6fYE716L/pdfAa37l1XM62PSt9
	 o2iXiT8oGWhVdXy3aNU+uQH1H0tGwb4v7n522e4d+8tggh6K5/bL59RNY248fytfq
	 LT+YYi6wrSUm++9i8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.68.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wuq-1s0gqB3iIW-0053Rs; Mon, 06
 May 2024 18:00:32 +0200
Date: Mon, 06 May 2024 18:00:30 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v1_5/5=5D_arm64=3A_dts=3A_mediate?=
 =?US-ASCII?Q?k=3A_Add_mt7986_based_Bananapi_R3_Mini?=
User-Agent: K-9 Mail for Android
In-Reply-To: <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
References: <20240505164549.65644-1-linux@fw-web.de> <20240505164549.65644-6-linux@fw-web.de> <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
Message-ID: <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1dgAYaFHtc7EJBv4muaawIW5tkqlZguEe0+jz8+syRMCYxnVPhv
 X8CKcSrs+AZOloZfdprln+g2RDW58Z9+M8nBBC2GhWB/XvKA7q3+Y06W8GfdXi5rsoJ95sL
 nMF7/TJ9ZAMCzgdIatsSwa3M0Ow9mm0TEe0rFNFHj2EVU85xIiNnxy/sfwdjtsucAnT9/HK
 Vz7ZLUpgpncF7rzUmGp3g==
UI-OutboundReport: notjunk:1;M01:P0:yZZXYFhajyk=;jIsWIYDIG590kXssQqWzksnl0jK
 HESedwIkaVtq/L8KOVlJtOOT3E58mruCCzM1QXINqtwt5poGVjQDm/EC2BFIcr0F+Y9D9dmXK
 YSjELakaX682EVxztKaV/2NuBuADqTdOE9xAnN1YPKPlCHXIL5L/Nt5OR/3LLXVbv4IXs7LpS
 5tuYs4aPskKdRPRyoDArVGyIDdBMJ/fezE+Zqn2WdDTFPgB+Tw/+ZNWbEz4r1JHTPRawbAo4w
 +L/0b6LMGy54rcShlQneoEFENwiSBGxx6uKmeh0MRBE/cgREcn6ZHNE1K4tpxnP2ewg/jY5ZP
 7SfxJKQ9SzfzsK5EtSrltpAWI7pdneUUCsQRERYru7lee2E4XuJNijZ2s66J84LbQfBAjbvsu
 vHgXrZxkJZ1TZ/xydaHp2YLtNDLcmj3Ta5DJAs9uwkZX5DTSQBNidePO4qRoYAM8AGVOfTwiH
 k1qxuJCbSrkQK6EgdnIbbfjY3//UIXKPVSHsGkRIEohNAHbqYxLgaI7w95urYgSVZQu/ft6UH
 nbcJhtzVVXo6EwZd4wfufXMvZ21WJYFgGwCnkmkqIjD0axFy/8/+rxYiyNWhq44z1mE0BnO31
 69ybdSpGWE8kdj8xTUFBYJ1mCEWxPzlSG2hn/Mv2ONhv2ylJ09oyV9zgK1/m9qcmbDAri7aZb
 WMTYFRpr5ZOzJ+522cRhunp/JmNGiRfS4uRF5N1J182v1ICJIlcfgXFgM5cZZ+2ofpD9A9M6/
 JhQ6MSUPEm1hdpBJD62NdgJpPGrpZMg0URUCwCZD8dFBLIBEypYlXeCpax/mI/K8PlXztUMLu
 pp6VCA8jnQAXphLzN851vKizwQUUTLbnYXyYBPibWma90=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_090056_034686_546F549A 
X-CRM114-Status: GOOD (  17.64  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

Thanks for review=2E

Am 6=2E Mai 2024 14:48:59 MESZ schrieb AngeloGioacchino Del Regno <angelog=
ioacchino=2Edelregno@collabora=2Ecom>:
>Il 05/05/24 18:45, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add device Tree for Bananapi R3 Mini SBC=2E
>>=20
>> Co-developed-by: Eric Woudstra <ericwouds@gmail=2Ecom>
>> Signed-off-by: Eric Woudstra <ericwouds@gmail=2Ecom>
>> Co-developed-by: Tianling Shen <cnsztl@gmail=2Ecom>
>> Signed-off-by: Tianling Shen <cnsztl@gmail=2Ecom>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>   =2E=2E=2E/mediatek/mt7986a-bananapi-bpi-r3-mini=2Edts | 486 +++++++++=
+++++++++
>>   2 files changed, 487 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-=
r3-mini=2Edts
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
>> index 37b4ca3a87c9=2E=2E1763b001ab06 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-=
r64=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7981b-xiaomi-ax3000t=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-acelink-ew-7886cax=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3=2Edtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-mini=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor=2Edtbo
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini=
=2Edts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini=2Edts
>> new file mode 100644
>> index 000000000000=2E=2Ec764b4dc4752
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini=2Edts
>> @@ -0,0 +1,486 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0 OR MIT)
>> +/*
>> + * Copyright (C) 2021 MediaTek Inc=2E
>> + * Authors: Frank Wunderlich <frank-w@public-files=2Ede>
>> + *          Eric Woudstra <ericwouds@gmail=2Ecom>
>> + *          Tianling Shen <cnsztl@immortalwrt=2Eorg>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio=2Eh>
>> +#include <dt-bindings/input/input=2Eh>
>> +#include <dt-bindings/leds/common=2Eh>
>> +#include <dt-bindings/pinctrl/mt65xx=2Eh>
>> +
>> +#include "mt7986a=2Edtsi"
>> +
>> +/ {
>> +	model =3D "Bananapi BPI-R3 Mini";
>> +	chassis-type =3D "embedded";
>> +	compatible =3D "bananapi,bpi-r3mini", "mediatek,mt7986a";
>> +
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +		ethernet0 =3D &gmac0;
>> +		ethernet1 =3D &gmac1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:115200n8";
>> +	};
>> +
>> +	dcin: regulator-12vd {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "12vd";
>> +		regulator-min-microvolt =3D <12000000>;
>> +		regulator-max-microvolt =3D <12000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	fan: pwm-fan {
>> +		compatible =3D "pwm-fan";
>> +		#cooling-cells =3D <2>;
>> +		/* cooling level (0, 1, 2) - pwm inverted */
>> +		cooling-levels =3D <255 96 0>;
>
>Did you try to actually invert the PWM?
>
>Look for PWM_POLARITY_INVERTED ;-)

Mtk pwm driver does not support it

https://elixir=2Ebootlin=2Ecom/linux/latest/source/drivers/pwm/pwm-mediate=
k=2Ec#L211

>> +		pwms =3D <&pwm 0 10000>;
>> +		status =3D "okay";
>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "1=2E8vd";
>> +		regulator-min-microvolt =3D <1800000>;
>> +		regulator-max-microvolt =3D <1800000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		vin-supply =3D <&dcin>;
>> +	};
>> +
>> +	reg_3p3v: regulator-3p3v {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "3=2E3vd";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		vin-supply =3D <&dcin>;
>> +	};
>> +
>> +	usb_vbus: regulator-usb-vbus {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "usb_vbus";
>> +		regulator-min-microvolt =3D <5000000>;
>> +		regulator-max-microvolt =3D <5000000>;
>> +		gpios =3D <&pio 20 GPIO_ACTIVE_LOW>;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	en8811_a: regulator-phy1 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "phy1";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		gpio =3D <&pio 16 GPIO_ACTIVE_LOW>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	en8811_b: regulator-phy2 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "phy2";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		gpio =3D <&pio 17 GPIO_ACTIVE_LOW>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	leds {
>> +		compatible =3D "gpio-leds";
>> +
>> +		green_led: led-0 {
>> +			color =3D <LED_COLOR_ID_GREEN>;
>> +			function =3D LED_FUNCTION_POWER;
>> +			gpios =3D <&pio 19 GPIO_ACTIVE_HIGH>;
>> +			default-state =3D "on";
>> +		};
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +
>> +		reset-key {
>> +			label =3D "reset";
>> +			linux,code =3D <KEY_RESTART>;
>> +			gpios =3D <&pio 7 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +
>> +};
>> +
>> +&cpu_thermal {
>> +	cooling-maps {
>> +		map0 {
>> +			/* active: set fan to cooling level 2 */
>> +			cooling-device =3D <&fan 2 2>;
>> +			trip =3D <&cpu_trip_active_high>;
>> +		};
>> +
>> +		map1 {
>> +			/* active: set fan to cooling level 1 */
>> +			cooling-device =3D <&fan 1 1>;
>> +			trip =3D <&cpu_trip_active_med>;
>> +		};
>> +
>> +		map2 {
>> +			/* active: set fan to cooling level 0 */
>> +			cooling-device =3D <&fan 0 0>;
>> +			trip =3D <&cpu_trip_active_low>;
>> +		};
>> +	};
>> +};
>> +
>> +&crypto {
>> +	status =3D "okay";
>> +};
>> +
>> +&eth {
>> +	status =3D "okay";
>> +
>> +	gmac0: mac@0 {
>> +		compatible =3D "mediatek,eth-mac";
>> +		reg =3D <0>;
>> +		phy-mode =3D "2500base-x";
>> +		phy-handle =3D <&phy14>;
>> +	};
>> +
>> +	gmac1: mac@1 {
>> +		compatible =3D "mediatek,eth-mac";
>> +		reg =3D <1>;
>> +		phy-mode =3D "2500base-x";
>> +		phy-handle =3D <&phy15>;
>> +	};
>> +
>> +	mdio: mdio-bus {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +	};
>> +};
>> +
>> +&mmc0 {
>> +	pinctrl-names =3D "default", "state_uhs";
>> +	pinctrl-0 =3D <&mmc0_pins_default>;
>> +	pinctrl-1 =3D <&mmc0_pins_uhs>;
>> +	vmmc-supply =3D <&reg_3p3v>;
>> +	vqmmc-supply =3D <&reg_1p8v>;
>> +};
>> +
>> +
>> +&i2c0 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&i2c_pins>;
>> +	status =3D "okay";
>> +
>> +	/* MAC Address EEPROM */
>> +	eeprom@50 {
>> +		compatible =3D "atmel,24c02";
>> +		reg =3D <0x50>;
>> +
>> +		address-width =3D <8>;
>> +		pagesize =3D <8>;
>> +		size =3D <256>;
>> +	};
>> +};
>> +
>> +&mdio {
>
>You can just move all this stuff to where you declare the mdio-bus=2E=2E=
=2E=2E

Ok,see these 2 lines are already above,so can be dropped here=2E

>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +
>> +	phy14: ethernet-phy@14 {
>
>I say that this is `phy0: ethernet-phy@14` - because this is the first PH=
Y on this
>board=2E

Ok,i change this and phy15

>> +		reg =3D <14>;
>
>Uhm=2E=2E doesn't this require the ethernet-phy-id03a2=2Ea411 compatible?

I can add it,but worked without it=2E

There was a discussion about that and result was we don't need it in board=
 dts,maybe add compatible in binding example=2E

https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/20240206194751=2E=
1901802-2-ericwouds@gmail=2Ecom/#25703356

>> +		interrupts-extended =3D <&pio 48 IRQ_TYPE_EDGE_FALLING>;
>> +		reset-gpios =3D <&pio 49 GPIO_ACTIVE_LOW>;
>> +		reset-assert-us =3D <10000>;
>> +		reset-deassert-us =3D <20000>;
>> +		phy-mode =3D "2500base-x";
>> +		full-duplex;
>> +		pause;
>> +		airoha,pnswap-rx;
>> +
>> +		leds {
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +
>> +			led@0 { /* en8811_a_gpio5 */
>> +				reg =3D <0>;
>> +				color =3D <LED_COLOR_ID_YELLOW>;
>> +				function =3D LED_FUNCTION_LAN;
>> +				function-enumerator =3D <1>;
>
>Why aren't you simply using a label?

You mean the comment? I can add it of course like for regulators=2E

>> +				default-state =3D "keep";
>> +				linux,default-trigger =3D "netdev";
>> +			};
>> +			led@1 { /* en8811_a_gpio4 */
>> +				reg =3D <1>;
>> +				color =3D <LED_COLOR_ID_GREEN>;
>> +				function =3D LED_FUNCTION_LAN;
>> +				function-enumerator =3D <2>;
>> +				default-state =3D "keep";
>> +				linux,default-trigger =3D "netdev";
>> +			};
>> +		};
>> +	};
>> +
>> +	phy15: ethernet-phy@15 {
>> +		reg =3D <15>;
>
>Same here=2E
>
>Cheers,
>Angelo
>


regards Frank

