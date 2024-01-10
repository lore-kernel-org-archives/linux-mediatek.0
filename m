Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6ADC4707B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgL20j1nZAXSZ8F1FU1UqMDVYXJOJDxRFfQbKGFyb8c=; b=1XX0qt+5kALuN3pHtyoF+DNpiV
	wevOI1dq+yq2IXiuhDDF2WCyV3aCP0/8yGUXPUdFD+fFB82Oc7+cI45w2zUuyhEMJHM72h2mdLl65
	9u3NGNbiBSQC3gElYDTiEFyTF6UkTIAUv8q2IQvgSha3kfdT2VLDeFcowlw7OvnrYFyEZ1nzBfp8P
	Xt4sRha/rk+AYVNO9yFOHD3J+16v8aJRVg1H2+6R8RrWcGh9R8A2u3ZeUO/C3rKgHU/aGJXuDuBoa
	rnK+d9A/4ER9cEM9/p5lQgRBXjwiinP7yqwh8YZ385ZPnZ95xMhftScLmkgIwvGuLBkZ0DB/Q4MKO
	V8MIJuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYnA-00C2mh-0I;
	Wed, 10 Jan 2024 13:38:48 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYn6-00C2iE-0m;
	Wed, 10 Jan 2024 13:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704893918;
	bh=SgeTmy9vWKtca0Vyjva4J6wsQuy5/arJ5kyVli3Wyhc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hvxRyBv2rN52qUOdhsThMmZY46Lu8JPBT67MHEWZGEdwDVv2zjhDaMeApPxWzVSg5
	 MXSdj9XvLeuHPnm5OrW7W+xrHYTkJf3lG76WzvoqeU+63BFuq27oOZkIYNn8IBhDUN
	 9EIBF3iNk7GpA8bobjb3TKIYkyfGb9IGHrK3WPCs4EfYLY8wzgMyzCYwUqm5HJtN32
	 lSgVcm+ReFE9eX+UVtMCUviOI9Y0DicPifaw6hj+sLT/vZX6n8ZB2bqgfRlkmWm6aw
	 5kFVW/g07pLX1sr/qL7aCUh74zOdWb5zO10ILCyRong6SiOJl1hN4tbumiIILWdR2Z
	 KM5ScTEWWNigQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1AE913780C1F;
	Wed, 10 Jan 2024 13:38:37 +0000 (UTC)
Message-ID: <34bda5e0-0587-459b-b31c-46112b1b10fa@collabora.com>
Date: Wed, 10 Jan 2024 14:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: Add initial MT7981B and Xiaomi
 AX3000T
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240110095118.25598-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_053844_423791_58A57F35 
X-CRM114-Status: GOOD (  17.99  )
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

Il 10/01/24 10:51, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981B (AKA MediaTek Filogic 820) is a dual-core ARM Cortex-A53 SoC.
> One of market devices using this SoC is Xiaomi AX3000T.
> 
> This is initial contribution with basic SoC support. More hardware block
> will get added later. Some will need their bindings (like auxadc).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |  15 +++
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 108 ++++++++++++++++++
>   3 files changed, 124 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 0a189d5d8006..8bff11acfe1f 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
> new file mode 100644
> index 000000000000..a314c3e05e50
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +/dts-v1/;
> +
> +#include "mt7981b.dtsi"
> +
> +/ {
> +	compatible = "xiaomi,ax3000t", "mediatek,mt7981b";
> +	model = "Xiaomi AX3000T";
> +
> +	memory@40000000 {
> +		reg = <0 0x40000000 0 0x10000000>;
> +		device_type = "memory";
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> new file mode 100644
> index 000000000000..ce878ad55204
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +#include <dt-bindings/clock/mediatek,mt7981-clk.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible = "mediatek,mt7981b";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +		};
> +
> +		cpu@1 {
> +			compatible = "arm,cortex-a53";
> +			reg = <0x1>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +		};
> +	};
> +
> +	oscillator-40m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <40000000>;
> +		clock-output-names = "clkxtal";
> +		#clock-cells = <0>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";

PSCI 0.2? I invite you to check a kernel log for a string like this one:

`PSCIv%d.%d detected in firmware`
...because of course if it says v1.0, this should be "arm,psci-1.0".

This is just a nitpick anyway, so you can already get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: but please, confirm or deny that PSCI thing ASAP :-)
P.P.S.: For next time - I'd be happy if you could add a cover letter to your
patch series..!

Cheers,
Angelo

