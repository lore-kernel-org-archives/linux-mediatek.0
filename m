Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB01C19F2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5JAHu6tvj78G0dPSRGcbr7BiVLL+vYjS5RyLHqkt4M=; b=1Gn0RXuWHeAUejEhFZHXnVQSl3
	4vrHsr05kyqJdLUiGN5+e5+R8VF9TWeoSLI94afYlpB4NtAzqjICWYHWOyh4o84Of/wYT92whuZq7
	MhTQNjAm6BqGOD2sZM2vdInHhpLYqlSdu5f5UGzLtOL9QeE4X0apHLLA6TdYcaZCaUIJef0xLHJVl
	ua6AqPyI/dI572Xblj4501k26Xy/WZtPu8m7p/lCG5KbjQ/U62npUnu0wwEAIlVs1xEBDyGszrRD5
	Fhvk6ARVrWH0T6fUrSZLkQlclLH+NKBvRFVQ21JtvSFQ9HVzyxMA+mQyCfqaBJYu4UaQBW7zCqsZ5
	MloWNoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHOfD-004b7a-V1; Fri, 29 Jul 2022 12:00:19 +0000
Received: from relay03.th.seeweb.it ([5.144.164.164])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHOf9-004b0S-Mq
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 12:00:18 +0000
Received: from [192.168.1.101] (abxi232.neoplus.adsl.tpnet.pl [83.9.2.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CEE251F9C3;
	Fri, 29 Jul 2022 14:00:04 +0200 (CEST)
Message-ID: <a8fa9e22-8c3f-60b2-a0db-01cfd5c37765@somainline.org>
Date: Fri, 29 Jul 2022 14:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] arm64: dts: mediatek: Add support for MT6795 Sony
 Xperia M5 smartphone
Content-Language: en-US
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
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220729104441.39177-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_050015_959710_52A3341D 
X-CRM114-Status: GOOD (  17.79  )
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



On 29.07.2022 12:44, AngeloGioacchino Del Regno wrote:
> Add a basic support for the Sony Xperia M5 (codename "Holly")
> smartphone, powered by a MediaTek Helio X10 SoC.
> 
> This achieves a console boot.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>  .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index af362a085a02..72fd683c9264 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
-holly.dtb?

>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> new file mode 100644
> index 000000000000..94d011c4126c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022, Collabora Ltd
> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +/dts-v1/;
> +#include "mt6795.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
Looks unused.

> +
> +/ {
> +	model = "Sony Xperia M5";
> +	compatible = "sony,xperia-m5", "mediatek,mt6795";
sony,holly?

> +	chassis-type = "handset";
> +
> +	aliases {
> +		mmc0 = &mmc0;
> +		mmc1 = &mmc1;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x1E800000>;
Lowercase hex in size. Also, doesn't the bootloader fill it in?

> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
Is that true for all devices with this SoC, or..? If so, it may be worth
moving this into mt6795.dtsi.

> +		bl31_secmon_reserved: secmon@43000000 {
memory@, everywhere. Use labels to name the nodes.

> +			no-map;
reg goes first.
> +			reg = <0 0x43000000 0 0x30000>;
> +		};
> +
> +		/* preloader and bootloader regions cannot be touched */
> +		preloader-region@44800000 {
> +			no-map;
> +			reg = <0 0x44800000 0 0x100000>;
> +		};
> +
> +		bootloader-region@46000000 {
> +			no-map;
> +			reg = <0 0x46000000 0 0x400000>;
> +		};
> +	};
> +};
> +
> +&pio {
> +	uart0_pins: uart0-pins {
> +		pins-rx {
> +			pinmux = <PINMUX_GPIO113__FUNC_URXD0>;
> +			bias-pull-up;
> +			input-enable;
> +		};
> +		pins-tx {
> +			pinmux = <PINMUX_GPIO114__FUNC_UTXD0>;
> +			output-high;
> +		};
> +	};
> +
> +	uart2_pins: uart2-pins {
> +		pins-rx {
> +			pinmux = <PINMUX_GPIO31__FUNC_URXD2>;
> +			bias-pull-up;
> +			input-enable;
> +		};
> +		pins-tx {
> +			pinmux = <PINMUX_GPIO32__FUNC_UTXD2>;
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
Status last here and below, please.

Konrad
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
> +};
> +
> +&uart2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2_pins>;
> +};
> 

