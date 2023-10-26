Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43120C25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 08:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onYoBp1EMC6/QTpT6OCGAQ6IXqywW+2+9GZ+lRLg8pI=; b=xnyYC7nSwy3Zgh
	y/qMlCB/xMMMyBdK8FRdTajuITwbWgK96wAft536oYPrgaBqJVr7CCxR0GWPcV6xNSS+OZqQTN7pF
	qx7zpRsdXYGEy/G8v3UtYnQjqTuh9YJzz4lJfJiGRdmYNgO5FWjyOlwmiUcBKgJ/dF8KHCKDBDaHD
	he/pD+BQp9Wmwl5zzFWKGAQiCNrjdRZz4wFO99HqOgVsSBOCl5XJAm3ZS1nD9+lZzGNGaDv+3HClM
	aAQgvTKqUBRI2UgzUjmS3MgEELkWwlc94V43NMW82BazGsrVje3eV+NhqCbUO6jhDuI5NQD/EeSVR
	BUs6ihf98Vpxku3pk+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvKt-00DuSi-0o;
	Thu, 26 Oct 2023 08:03:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvKr-00DuS9-13;
	Thu, 26 Oct 2023 08:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=onYoBp1EMC6/QTpT6OCGAQ6IXqywW+2+9GZ+lRLg8pI=; b=HKeGLCrN80k2xcp63tQNMZF6Ro
	AZ+aGFtDGp8OAxGIXKCQJ4YffAoHCNGA53r81uDVZJ9O+Wwf9UaZqiR0Qcq2TgRkohvX+uduCpl9d
	dzG4A3af83zTXeUdp5rUwgvdjMxG9b8sBQqtuuWfKwnLIQGuBN737iWET5jOz3iv1f0JE/QiCX+Sr
	BK0U5JGjLr8wRPKjLpG6Ug5lZEkD5yCfIPAc8oiqYAYUoSPyxN38NUvSCJ4XjigAtg+M9wpR7Ptqc
	yJCoJhX4GsQvaJHBnw35z8QlYgD28pIr6fTO5olioBOKk1eBwNdUe3ItrNng0UAenoKGrxeIzA/We
	L0sDtAyA==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvKl-00H8xT-2N;
	Thu, 26 Oct 2023 08:03:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 577C5660732A;
	Thu, 26 Oct 2023 09:03:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698307391;
	bh=Fef1hJcTSlQGakVzORPVPnqgvkpRbVwgbom99kx0qPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NPyWBOIhlwpM5HsEwVY0+sZFCDYnVMiPjyyFrTPzdbZTTomuxzFPWJeDFB8UIY3un
	 73ZrPdp2gJlVKtCsj9aNqVe+V+B4V7QweJuNjvnpV63I6sftQeFDGrNz/w1jhIk1eO
	 c4SH04h7SDCJBa7C8GTyUETNxcblLNo4tUNXd0Yh9K+LRXq0x6AfTF8j/ZbK8W4c2r
	 D08KUAm8AN5rgtaErjHHMH6LM6QZP9AHVbO2G2VdASPf8+/LDa4hHTaz/iKe3eXeyz
	 Xu+eqiWZlZC5tMxgK4yofLDPGrssSeNKnTGNuTOdX1Z8sThBefFdoapjS4BL7bxegn
	 i889ScG4tR3Dw==
Message-ID: <831e792e-683b-4305-a451-16bb6736280a@collabora.com>
Date: Thu, 26 Oct 2023 10:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: mt7986: add overlay for SATA power
 socket on BPI-R3
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20231025170832.78727-1-linux@fw-web.de>
 <20231025170832.78727-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231025170832.78727-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_090316_713064_67578BC4 
X-CRM114-Status: GOOD (  20.03  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 25/10/23 19:08, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Bananapi R3 has a Power socket entended for using external SATA drives.
> This Socket is off by default but can be switched with gpio 8.
> 
> Add an overlay to activate it.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - rebase on the patch "add dtbs with applied overlays for bpi-r3"
> - add sata-overlay to the full dtbs
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         | 13 +++++--
>   .../mt7986a-bananapi-bpi-r3-sata.dtso         | 39 +++++++++++++++++++
>   2 files changed, 48 insertions(+), 4 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 24eeba0703ce..c3b236a47513 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -13,26 +13,31 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sata.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo

The devicetree overlays make no sense without a base devicetree, right? :-)

dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo <-- makes no sense!

Check how it's done in freescale (nxp) and renesas... and there's also one instance
of overlays in qualcomm.

In short:
  - Remove all of the dtb-$(CONFIG_ARCH_MEDIATEK) += blah.dtbo
  - xxxx-dtbs:= blah.dtb blah-overlay.dtbo, dtb-$(CONFIG_ARCH_MEDIATEK) += xxxx.dtb
    is correct.

>   mt7986a-bananapi-bpi-r3-emmc-nand-dtbs := \
>   	mt7986a-bananapi-bpi-r3.dtb \
>   	mt7986a-bananapi-bpi-r3-emmc.dtbo \
> -	mt7986a-bananapi-bpi-r3-nand.dtbo
> +	mt7986a-bananapi-bpi-r3-nand.dtbo \
> +	mt7986a-bananapi-bpi-r3-sata.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nand.dtb
>   mt7986a-bananapi-bpi-r3-emmc-nor-dtbs := \
>   	mt7986a-bananapi-bpi-r3.dtb \
>   	mt7986a-bananapi-bpi-r3-emmc.dtbo \
> -	mt7986a-bananapi-bpi-r3-nor.dtbo
> +	mt7986a-bananapi-bpi-r3-nor.dtbo \
> +	mt7986a-bananapi-bpi-r3-sata.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nor.dtb
>   mt7986a-bananapi-bpi-r3-sd-nand-dtbs := \
>   	mt7986a-bananapi-bpi-r3.dtb \
>   	mt7986a-bananapi-bpi-r3-sd.dtbo \
> -	mt7986a-bananapi-bpi-r3-nand.dtbo
> +	mt7986a-bananapi-bpi-r3-nand.dtbo \
> +	mt7986a-bananapi-bpi-r3-sata.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nand.dtb
>   mt7986a-bananapi-bpi-r3-sd-nor-dtbs := \
>   	mt7986a-bananapi-bpi-r3.dtb \
>   	mt7986a-bananapi-bpi-r3-sd.dtbo \
> -	mt7986a-bananapi-bpi-r3-nor.dtbo
> +	mt7986a-bananapi-bpi-r3-nor.dtbo \
> +	mt7986a-bananapi-bpi-r3-sata.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nor.dtb
>   
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso
> new file mode 100644
> index 000000000000..6ab06813412a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Frank Wunderlich <frank-w@public-files.de>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	compatible = "bananapi,bpi-r3", "mediatek,mt7986a";
> +
> +	fragment@0 {
> +		target-path = "/";
> +		__overlay__ {

This could be easier, I think.

&{/} {

	reg_sata12v: regulator-sata12v {
		....
	};

	something_else: something-else { ... };
};

Regards,
Angelo

> +			reg_sata12v: regulator-sata12v {
> +				compatible = "regulator-fixed";
> +				regulator-name = "sata12v";
> +				regulator-min-microvolt = <12000000>;
> +				regulator-max-microvolt = <12000000>;
> +				gpio = <&pio 8 GPIO_ACTIVE_HIGH>;
> +				enable-active-high;
> +				regulator-always-on;
> +			};
> +
> +			reg_sata5v: regulator-sata5v {
> +				compatible = "regulator-fixed";
> +				regulator-name = "sata5v";
> +				regulator-min-microvolt = <5000000>;
> +				regulator-max-microvolt = <5000000>;
> +				regulator-always-on;
> +				vin-supply = <&reg_sata12v>;
> +			};
> +		};
> +	};
> +};
> +


