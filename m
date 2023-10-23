Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98802C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3uCaDkYIP2k+SJkMK/GFg6xfE/rRo7Hk4A+SRqM1sI=; b=Q7UVcvWPzPNbr0AeJlD7hsxAv/
	oPChUBG7BcmBdha1b2TAB3RPEpU/1QALBOYqqcGtaUY3QmUpCAQWS5vWbkFpHUpPHzUEjHHrMjsNa
	/fFY+NJmpkdwFGCOgDE27fP5N6Yr3h+nBDBmTCDFJXj4KSajxmCGsRtLEEeHrQN3OHNI9L4nw1sFc
	DoKTJIoGk/28B1fvUh/NnX33hlOapk6vyiueNScIORxRE+Qk3llW1qLqC612ydbiCMFwlHTTTiv45
	Y1fYgCMgQUzteM7ciKFVxV1KJn++OaiBApupOjaO5U1ZKGS9CseFO7V3FCZJwuzTMhEEycII5sxJq
	SVbgerag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qusbO-00781u-0R;
	Mon, 23 Oct 2023 10:56:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qusbJ-0077x2-0a
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 10:56:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9be7e3fa1daso463636966b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 03:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698058559; x=1698663359; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3uCaDkYIP2k+SJkMK/GFg6xfE/rRo7Hk4A+SRqM1sI=;
        b=jcnYJBORvyTPq7J2hdqBkLGsIgwRulok6koF2jUOWuhk1eX4Xv8b3teCG4C2nM1I1H
         aP09mX3Bf1k86eLstelhGMZ7Xe/mc6deAgUbydnlIbjJWpTp6XOYUIwEb1208lAx3OKp
         G7IvMesdezssBrfCkU33CK+Fdhja7UxZl/uRa2fUVr8XW7f5our09dX8f03ctifxiQU4
         ZA/xUtu4tyIgm2oq3CBtX2+0g0yZvau9I69oSy6CAxaMHD0NNmLbtu6fv//vXOV6lhhq
         oQztW6baHsNN7n8jfMKOtpvUyB0bL33N72nWxaBSTpqYxmH1mWNLb1EAJOrInTq1iDFd
         w7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058559; x=1698663359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3uCaDkYIP2k+SJkMK/GFg6xfE/rRo7Hk4A+SRqM1sI=;
        b=to7GgwfF+RjMfeap+IC+oKNh+NVcc0XkoRMdzIJILVEitjMELDh+Ma/pRe115I1QRz
         VKMoioPe+/7C+Om3HyisQ2GU9vq/WDwCUDxdZAnWboeGejBDwmQQmHc4u2XuiC1fegyF
         GB58lik2Oj9TFuDZ/IutyLadvo1GZyoz+/7XqKxcdzgSygYX76tlQ2TqIDxq8up2YJ2L
         pHqaXcYstwvWMe8Dtb9AV+Fe7cc26z30M187sbRW9lYQYn9dOdWfsHsMPYz2zzCs2WXX
         Lejb+mJOKtZDQoJP6DNN2GpYcAGAo1nIeIkHZeAWICfuHbGH+2UmC32M15/SrZcoZuCJ
         j/ag==
X-Gm-Message-State: AOJu0YyiVtOD/3f0iiK5xpTKE9zhztHX7QK6r4+0sEubeK9eCPz+mnoC
	1EpR1nesnIrXb4xkI+D9p6y5Qw==
X-Google-Smtp-Source: AGHT+IHgud+ri83ecGImW587nXW8BLXh+rzA3PwsJVWpotOaar4YBUzaqFakBmvO76oc4SqntSfuYA==
X-Received: by 2002:a17:907:7b9f:b0:9bf:8073:a922 with SMTP id ne31-20020a1709077b9f00b009bf8073a922mr8004440ejc.19.1698058558770;
        Mon, 23 Oct 2023 03:55:58 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906340b00b009be23a040cfsm6371567ejb.40.2023.10.23.03.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 03:55:58 -0700 (PDT)
Message-ID: <a1846955-e6d9-4217-8c9f-1f20be166f4b@baylibre.com>
Date: Mon, 23 Oct 2023 12:55:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: Add MediaTek MT8188 dts and evaluation
 board and Makefile
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231023083839.24453-1-jason-ch.chen@mediatek.com>
 <20231023083839.24453-5-jason-ch.chen@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023083839.24453-5-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_035601_468900_FEB355A7 
X-CRM114-Status: GOOD (  17.54  )
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



On 23/10/2023 10:38, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> MT8188 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
> and 2 CA78 cores. MT8188 share many HW IP with MT65xx series.
> 
> We add basic chip support for MediaTek MT8188 on evaluation board.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt8188-evb.dts | 387 ++++++++
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi    | 956 ++++++++++++++++++++
>   3 files changed, 1344 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index e6e7592a3645..8900b939ed52 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r5-sku2.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
> new file mode 100644
> index 000000000000..68a82b49f7a3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
> @@ -0,0 +1,387 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 MediaTek Inc.
> + */
> +/dts-v1/;
> +#include "mt8188.dtsi"
> +#include "mt6359.dtsi"
> +
> +/ {
> +	model = "MediaTek MT8188 evaluation board";
> +	compatible = "mediatek,mt8188-evb", "mediatek,mt8188";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		mmc0 = &mmc0;
> +	};
> +
> +	chosen: chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x80000000>;
> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		scp_mem_reserved: memory@50000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&auxadc {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";

IMO, the order should be

clock-frequency = <400000>;
pinctrl-0 = <&i2c0_pins>;
pinctrl-names = "default";
status = "okay";

Please apply this to other nodes

> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c6_pins>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	bus-width = <8>;
> +	hs400-ds-delay = <0x1481b>;
> +	max-frequency = <200000000>;
> +
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	supports-cqe;
> +	cap-mmc-hw-reset;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +
> +	vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
> +	vqmmc-supply = <&mt6359_vufs_ldo_reg>;
> +
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_default_pins>;
> +	pinctrl-1 = <&mmc0_uhs_pins>;
> +
> +	status = "okay";
> +};
> +
> +&mt6359_vcore_buck_reg {
> +	regulator-always-on;
> +};
> +
> +&mt6359_vgpu11_buck_reg {
> +	regulator-always-on;
> +};
> +
> +&mt6359_vpu_buck_reg {
> +	regulator-always-on;
> +};
> +
> +&mt6359_vrf12_ldo_reg {
> +	regulator-always-on;
> +};
> +
> +&nor_flash {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&nor_pins_default>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";

Order:


#address-cells = <1>;
#size-cells = <0>;

pinctrl-0 = <&nor_pins_default>;
pinctrl-names = "default";

status = "okay";

> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <52000000>;
> +	};
> +};
> +

..snip..

> +
> +&pmic {
> +	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&scp {
> +	memory-region = <&scp_mem_reserved>;
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins>;

Order:

pinctrl-0 = <&spi0_pins>;
pinctrl-names = "default";

Please apply this to other nodes

> +	status = "okay";
> +};
> +
> +&spi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi1_pins>;
> +	status = "okay";
> +};
> +
> +&spi2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi2_pins>;
> +	status = "okay";
> +};
> +
> +&u3phy0 {
> +	status = "okay";
> +};
> +
> +&u3phy1 {
> +	status = "okay";
> +};
> +
> +&u3phy2 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
> +	status = "okay";
> +};
> +

..snip..

> +		};
> +	};
> +};

After that:
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

