Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07EBC25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 09:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOg8og746vz/uc/g4X3yVmKPEO9YeFhl4SX1NzuGHKY=; b=gLy2wAhEhRJxSilyIm1ZguI4SB
	lF8vGaIsB2J9ULOfcIyMFOpsFWr2NiT1YsFP/+db0EA2yu6345bpbQIreFZnQgqy1UPWY2Pq+ubJt
	dHO/E6X1sROFDuuC6jA+ORrmjXAXTq84mY1LOrIV3kEBEs8sdoseHxXwIP7rEYlB1W6Gp5S3EFOT3
	TI9O7e7sLe5rhKfHn9m2FRw30dKuh1NzdCWV+ZDnPFbYxLwvdsPGnSgK2/V9GWU8WhNmOvC9HOoYW
	cdSwqMuEkqcpTIcFhBIZeJHDgVx4QPzvneK+q5IzPCwQpJat0JSYkLDqGfgzYtoJ8rqfvp+3rQOCG
	53ykN8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwFI-00E1ip-1e;
	Thu, 26 Oct 2023 09:01:40 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwFE-00E1gK-1S;
	Thu, 26 Oct 2023 09:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1698310886; x=1698915686; i=frank-w@public-files.de;
	bh=EX+gKoyYL2415DCE+pU4HuRMXnN+XpgstDW20L6ZQJY=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:
	 References;
	b=J1KhSD9s0l9UXFPCE5Vyi2eVjRdoXr/89/3K7p4DgO3qtR8MpxZyI8vvA7vB3YHm
	 8gWSadqw6auV9Ao0u1hxLWUVaoR5n1JO7yevlqfMxOm77bzGcwigbasksjiB68YZ/
	 zxJmGAcvZ1dCVWKTCnrz6CNd3eS/ZEgT/uzCZAsm8D+DXiykaRUBGxOXxkQJJtaqz
	 AwSsy1WBVtKO3o8EoqSpCzIxrBzNOCYKP6Kj59K7oPyuoIX9BBc50ThLvxWMwbPen
	 nQSlPiZgpTshHeXL+nyoQT+vEulNDK5mxYvYA26K2cCac9hDuYQj03Uzvo0WlQVo1
	 IJn6ecp2R+f3AV2mUg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.71.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f9h-1quYfJ2RB9-004Fur; Thu, 26
 Oct 2023 11:01:26 +0200
Date: Thu, 26 Oct 2023 11:01:24 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Eric Woudstra <ericwouds@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_5/5=5D_arm64=3A_dts=3A_mt7986=3A_ad?= =?US-ASCII?Q?d_overlay_for_SATA_power_socket_on_BPI-R3?=
User-Agent: K-9 Mail for Android
In-Reply-To: <831e792e-683b-4305-a451-16bb6736280a@collabora.com>
References: <20231025170832.78727-1-linux@fw-web.de> <20231025170832.78727-6-linux@fw-web.de> <831e792e-683b-4305-a451-16bb6736280a@collabora.com>
Message-ID: <062E9FFE-633E-46F1-A914-37A370722D49@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4JuaiguTCvhAUeF/fWHv0MY42Zx4Owsv6aWpkJ66JO9LP0jox4k
 yTgL+Qpgl5UDbm7iCRxD7oMKQM9LJBDnzKWinJPLBXMIPXRZq40LOj3ZceCxMjriKoQZlvM
 Tc+ODTnVl+itcvcFccoFsJL+QWtFXyNVC/BxQ209BRUFFYhPMh02do2vgBwAGf9wRJ0WN75
 KSrDUjprC7FQ8klP+7SlQ==
UI-OutboundReport: notjunk:1;M01:P0:pOFbp70mMLs=;lW3OCcgAkEoklLGV+oZ74nLYYDx
 JVnFqULJO8vTnfUam/H1EWDUygUYH7NVvqJCb5QGF4wqBhXU0NTbWd5rrtWN+RaCd23il7RP/
 dhtxrupIsO/ZZi4HedbgwmqsKRSW3ZUa+1UClonXamqMbChoC+zFH51FC2QwP6PmChEEkdDt9
 fWR3dH8THpvrAKR9NWx82GmOf0/TNi4L72T8rcA3JVv+PsOcerHfqcOuV9dBunNKnZigOkgr2
 8ey7L724xUrEo2sVl7cyRTTUgh1Z+Ge+LkKi/MC8FINxcI60/rSwe/nuiVc7bxn3x1kF1KgTi
 Le3QRlbkKrmC/P1CpaZYRQC/h/Z/fRVE2XqePIWv3+4w3RI8LT/wo49WeV6xPQBwN13SKrcVd
 /dxQSF67k47lU9jRVNMo6Q6EMZzsUKC2jgZD0lrVpD5nWTgmj43uumEASKvLWVTXw8Mymq6Ue
 nSEz0tKam8QYUgVz+aQ27ut4GRG5p9DsY+EW9kzkUsFlpjNe+VHr/Os5MkhCQ0EL/gQWHtVae
 7XFUpwGDOr3AuogF6dIC79B/leNzBfPftyR1U7YEofzKJlVzGPCj9s23vgZ64O1tLGrOqNZP2
 FRGZ8P6yzzUEw++idxVHuDGVFnLgDjekC6IMORD0VpchT+22YNgtLYNnw/TiIxyZBB0E6I3uy
 8hjDnR92rMgEyo4zh7t+7R70FpMrhN4ToeduxA0RkQS9puiwvHq2+8TUlJHKVo0kxlYEkiqYc
 n3MBWzekzYdcwvCG8bt8eibDGfxN0I+W1kcwiRLlki8lQEzQ6cgHNeAQPKq/ZzM8bFkPqgdfq
 jY4Rhaz32hqY7Bq41ZIOe4XS+wqv5jWEQExkxyMSSW47DJQzWPsEMwd4m7vnNTW0ufYj8Zhqv
 V+c3oK/5Q45y5DoBvTbLe/D2Dm+z0O+WPU021LKP/gg4JP2M0Yjzmon+u5/cPqQvK0wrPrqqn
 jzC1JovaswN0HkKS1+v0N0PxDIs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_020136_876503_90D2B658 
X-CRM114-Status: GOOD (  17.29  )
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

Hi Angelo

Bpi-r3 can boot with only 1 mmc device and 1 spi-device=2E Some users may =
not use the sata overlay=2E Using overlays in fit have the advantage to pro=
be hardware in uboot and load the required overlays instead of loading a fu=
ll dtb=2E

Am 26=2E Oktober 2023 10:03:08 MESZ schrieb AngeloGioacchino Del Regno <an=
gelogioacchino=2Edelregno@collabora=2Ecom>:
>Il 25/10/23 19:08, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Bananapi R3 has a Power socket entended for using external SATA drives=
=2E
>> This Socket is off by default but can be switched with gpio 8=2E
>>=20
>> Add an overlay to activate it=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>> v2:
>> - rebase on the patch "add dtbs with applied overlays for bpi-r3"
>> - add sata-overlay to the full dtbs
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         | 13 +++++--
>>   =2E=2E=2E/mt7986a-bananapi-bpi-r3-sata=2Edtso         | 39 ++++++++++=
+++++++++
>>   2 files changed, 48 insertions(+), 4 deletions(-)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-=
r3-sata=2Edtso
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
>> index 24eeba0703ce=2E=2Ec3b236a47513 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -13,26 +13,31 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-b=
pi-r3=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor=2Edtbo
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sata=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd=2Edtbo
>
>The devicetree overlays make no sense without a base devicetree, right? :=
-)

The base-dtb is needed,but i prefer have 1 base-dt and overlays (in 1 fit =
image dynamically load in uboot) instead of 4+ full dtbs,but some people pr=
efer using the full dtbs=2E

>dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor=2Edtbo <-- m=
akes no sense!

Depends on users preference :) full dtb is easier to load,but less flexibl=
e=2E

>Check how it's done in freescale (nxp) and renesas=2E=2E=2E and there's a=
lso one instance
>of overlays in qualcomm=2E

>In short:
> - Remove all of the dtb-$(CONFIG_ARCH_MEDIATEK) +=3D blah=2Edtbo
> - xxxx-dtbs:=3D blah=2Edtb blah-overlay=2Edtbo, dtb-$(CONFIG_ARCH_MEDIAT=
EK) +=3D xxxx=2Edtb
>   is correct=2E

That will break my current way :( openwrt uses same=2E

>>   mt7986a-bananapi-bpi-r3-emmc-nand-dtbs :=3D \
>>   	mt7986a-bananapi-bpi-r3=2Edtb \
>>   	mt7986a-bananapi-bpi-r3-emmc=2Edtbo \
>> -	mt7986a-bananapi-bpi-r3-nand=2Edtbo
>> +	mt7986a-bananapi-bpi-r3-nand=2Edtbo \
>> +	mt7986a-bananapi-bpi-r3-sata=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nand=2E=
dtb
>>   mt7986a-bananapi-bpi-r3-emmc-nor-dtbs :=3D \
>>   	mt7986a-bananapi-bpi-r3=2Edtb \
>>   	mt7986a-bananapi-bpi-r3-emmc=2Edtbo \
>> -	mt7986a-bananapi-bpi-r3-nor=2Edtbo
>> +	mt7986a-bananapi-bpi-r3-nor=2Edtbo \
>> +	mt7986a-bananapi-bpi-r3-sata=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc-nor=2Ed=
tb
>>   mt7986a-bananapi-bpi-r3-sd-nand-dtbs :=3D \
>>   	mt7986a-bananapi-bpi-r3=2Edtb \
>>   	mt7986a-bananapi-bpi-r3-sd=2Edtbo \
>> -	mt7986a-bananapi-bpi-r3-nand=2Edtbo
>> +	mt7986a-bananapi-bpi-r3-nand=2Edtbo \
>> +	mt7986a-bananapi-bpi-r3-sata=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nand=2Edt=
b
>>   mt7986a-bananapi-bpi-r3-sd-nor-dtbs :=3D \
>>   	mt7986a-bananapi-bpi-r3=2Edtb \
>>   	mt7986a-bananapi-bpi-r3-sd=2Edtbo \
>> -	mt7986a-bananapi-bpi-r3-nor=2Edtbo
>> +	mt7986a-bananapi-bpi-r3-nor=2Edtbo \
>> +	mt7986a-bananapi-bpi-r3-sata=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd-nor=2Edtb
>>     dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-rfb=2Edtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata=
=2Edtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata=2Edtso
>> new file mode 100644
>> index 000000000000=2E=2E6ab06813412a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata=2Edtso
>> @@ -0,0 +1,39 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0 OR MIT)
>> +/*
>> + * Copyright (C) 2021 MediaTek Inc=2E
>> + * Author: Frank Wunderlich <frank-w@public-files=2Ede>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio=2Eh>
>> +
>> +/ {
>> +	compatible =3D "bananapi,bpi-r3", "mediatek,mt7986a";
>> +
>> +	fragment@0 {
>> +		target-path =3D "/";
>> +		__overlay__ {
>
>This could be easier, I think=2E
>
>&{/} {
>
>	reg_sata12v: regulator-sata12v {
>		=2E=2E=2E=2E
>	};
>
>	something_else: something-else { =2E=2E=2E };
>};

Need to try this=2E

>Regards,
>Angelo
>
>> +			reg_sata12v: regulator-sata12v {
>> +				compatible =3D "regulator-fixed";
>> +				regulator-name =3D "sata12v";
>> +				regulator-min-microvolt =3D <12000000>;
>> +				regulator-max-microvolt =3D <12000000>;
>> +				gpio =3D <&pio 8 GPIO_ACTIVE_HIGH>;
>> +				enable-active-high;
>> +				regulator-always-on;
>> +			};
>> +
>> +			reg_sata5v: regulator-sata5v {
>> +				compatible =3D "regulator-fixed";
>> +				regulator-name =3D "sata5v";
>> +				regulator-min-microvolt =3D <5000000>;
>> +				regulator-max-microvolt =3D <5000000>;
>> +				regulator-always-on;
>> +				vin-supply =3D <&reg_sata12v>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>


regards Frank

