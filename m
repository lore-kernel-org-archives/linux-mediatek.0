Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3554DCDB482
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpG3oMrjIsT8xDGmfuQ2fU/AReBP2VaA+uUxIlZGvrQ=; b=09XUAqTzqbQ12TeV+VcIBIAx8L
	09e7B1iS/MuzRSKK8Xp1be7ngDsnJDoh33SwovpWo/QQ3jjc5fgKKoxJYL+jQvReivvN/N+XtZe9Z
	yMoQKzOTyJFny2lwJCNhQgM62jwpo9nDuXxTIn5ys/+x0YisaNK0ZArqF8HFdSUAfl4BJaTZRY0yG
	SD3GFyLfoENfXhml0iIbONi7bd8JHrtEVzbTs2PsthNYzojCdNHDqCAAWSP5l4jhkhQwGhRXAAz2H
	83aJ3oC6ycITU8UsPrLEmxvQlB8e4Ks6bRSJy9dN7l30wDlOWOft+riQ4ZlpTT8w+vA2C/8YzM+q2
	NDm0Tt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsK21-0092hh-37;
	Mon, 16 Oct 2023 09:37:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsK1u-0092e1-0Q
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 09:37:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-406619b53caso43535045e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Oct 2023 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697449012; x=1698053812; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpG3oMrjIsT8xDGmfuQ2fU/AReBP2VaA+uUxIlZGvrQ=;
        b=UGF/NfEmEGsFC/Et8El0n+fL1WSAoUs5YsqioF1VW038r1/TgUIQgBDPwfyStCFLtT
         VP+ISsX29nRPTnXOGs7BIDL6DJCGd/7BulxTcMIP2RIM2ViTzr1Hve9k2vRRIyS7ZQKz
         HSopCVPh9LhOnkELCvf7UZ3MVTiucWku0XX2u1UTbxkyUxXP6jXat3eRV2M4ucd7r1my
         v7IWWoCk1hP5m9yOMqVu59rQuoyQotfbVBaCqasbSSDKDyEmCGZO9G6LM11v2eryXR1w
         z4KHhsZcun3Nlk3IDvt3ICQ3lG3PiBcyw702ZVRDj700YqAlaLaOGzisBKHoIQxRUTN8
         Chcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697449012; x=1698053812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpG3oMrjIsT8xDGmfuQ2fU/AReBP2VaA+uUxIlZGvrQ=;
        b=g6jvZNBfV7vl892Kw/fJWxJax2zBko04jBddrDPE1kGP2N6rob2SJeRVBqjo4whQUc
         3cTgaSolKH/dWcfmJLy+RtkAj3UcyB1JdfzZcy0pz23NSeyJEM3cnLCj3Q6XatopTmDp
         oz1GMe8HDdbB4hM8UxkpF5mLJ6h+wHboTB5atWM1PfIaMm0qia9ps7r7RS1ioVn2RcsS
         KB+PBkPW0/UDkP6JAn2KQhCUtqsC/4kw40u2XGPlvRGnZ5R6D/L3b8R4btHu3RmLXCK+
         MVRfJyw5gPWQKQBX2fNN+cw+ZxhCZbOaBscdtFQHsAA2HAh9b4jZxrCpXLI33Z89dqrL
         U6ug==
X-Gm-Message-State: AOJu0YxUBbpGBy7pOyuOua12aCjMjwnsMiR6nWQrMepHbQINHbjP3HDQ
	LZEcyPIa4A1LANP4PRTX89J7OQ==
X-Google-Smtp-Source: AGHT+IH/ZtlBXNIdbthN2kGK9l0A+zO40WM2DyE7paHyzWXN65vzbqLy6bgTSXvzpfj+1kfBYpyGPQ==
X-Received: by 2002:a1c:7c0b:0:b0:402:8896:bb7b with SMTP id x11-20020a1c7c0b000000b004028896bb7bmr27843813wmc.6.1697449011759;
        Mon, 16 Oct 2023 02:36:51 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l5-20020a7bc445000000b00406847c988asm6602483wmi.12.2023.10.16.02.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 02:36:51 -0700 (PDT)
Message-ID: <3de3e2ad-382d-4e2f-8943-1cd284604ab7@baylibre.com>
Date: Mon, 16 Oct 2023 11:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 4/4] arm64: dts: Add MediaTek MT8188 dts and
 evaluation board and Makefile
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230921060235.32478-1-jason-ch.chen@mediatek.com>
 <20230921060235.32478-5-jason-ch.chen@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230921060235.32478-5-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_023654_402419_3FA620D8 
X-CRM114-Status: GOOD (  19.88  )
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



On 21/09/2023 08:02, Jason-ch Chen wrote:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> MT8188 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
> and 2 CA78 cores. MT8188 share many HW IP with MT65xx series.
> 
> We add basic chip support for MediaTek MT8188 on evaluation board.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt8188-evb.dts | 400 ++++++++
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi    | 951 ++++++++++++++++++++
>   3 files changed, 1352 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index c99c3372a4b5..9bd2324259a3 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-evb.dts b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
> new file mode 100644
> index 000000000000..ad71a0e1ad41
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-evb.dts
> @@ -0,0 +1,400 @@
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
> +	status = "okay";
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_default_pins>;
> +	pinctrl-1 = <&mmc0_uhs_pins>;
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	supports-cqe;
> +	cap-mmc-hw-reset;
> +	no-sdio;
> +	no-sd;
> +	hs400-ds-delay = <0x1481b>;
> +	vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
> +	vqmmc-supply = <&mt6359_vufs_ldo_reg>;
> +	non-removable;
> +};
> +
> +&mt6359_vbbck_ldo_reg {
> +	regulator-always-on;
> +};
> +
> +&mt6359_vcn33_2_bt_ldo_reg {
> +	regulator-always-on;
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
> +&mt6359_vufs_ldo_reg {
> +	regulator-always-on;
> +};
> +

This is a lot of always-on regulator.
Is it possible to justify them? Maybe some of them should be just 
included into a relevent node ? For example, "mt6359_vcn33_2_bt_ldo_reg" 
could be into the bluetooth node right ?

Angelo already wrote me a feedback about that in the MT8365 serie:
https://lore.kernel.org/all/ff7292f0-9055-1787-2543-e219fe30dddf@collabora.com/

> +&nor_flash {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&nor_pins_default>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <52000000>;
> +	};
> +};
> +
> +&pio {
> +	adsp_uart_pins: adsp-uart-pins {
> +		pins-adsp-uart {
> +			pinmux = <PINMUX_GPIO35__FUNC_O_ADSP_UTXD0>,
> +				 <PINMUX_GPIO36__FUNC_I1_ADSP_URXD0>;
> +		};
> +	};
> +
> +	i2c0_pins: i2c0-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>,
> +				 <PINMUX_GPIO55__FUNC_B1_SCL0>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +		};
> +	};
> +
> +	i2c1_pins: i2c1-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO58__FUNC_B1_SDA1>,
> +				 <PINMUX_GPIO57__FUNC_B1_SCL1>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +		};
> +	};
> +
> +	i2c2_pins: i2c2-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO60__FUNC_B1_SDA2>,
> +				 <PINMUX_GPIO59__FUNC_B1_SCL2>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +		};
> +	};
> +
> +	i2c3_pins: i2c3-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO62__FUNC_B1_SDA3>,
> +				 <PINMUX_GPIO61__FUNC_B1_SCL3>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +		};
> +	};
> +
> +	i2c4_pins: i2c4-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO64__FUNC_B1_SDA4>,
> +				 <PINMUX_GPIO63__FUNC_B1_SCL4>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +		};
> +	};
> +
> +	i2c5_pins: i2c5-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO66__FUNC_B1_SDA5>,
> +				 <PINMUX_GPIO65__FUNC_B1_SCL5>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +		};
> +	};
> +
> +	i2c6_pins: i2c6-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO68__FUNC_B1_SDA6>,
> +				 <PINMUX_GPIO67__FUNC_B1_SCL6>;
> +			bias-pull-up = <MTK_PULL_SET_RSEL_011>;
> +		};
> +	};
> +
> +	mmc0_default_pins: mmc0-default-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO161__FUNC_B1_MSDC0_DAT0>,
> +				 <PINMUX_GPIO160__FUNC_B1_MSDC0_DAT1>,
> +				 <PINMUX_GPIO159__FUNC_B1_MSDC0_DAT2>,
> +				 <PINMUX_GPIO158__FUNC_B1_MSDC0_DAT3>,
> +				 <PINMUX_GPIO154__FUNC_B1_MSDC0_DAT4>,
> +				 <PINMUX_GPIO153__FUNC_B1_MSDC0_DAT5>,
> +				 <PINMUX_GPIO152__FUNC_B1_MSDC0_DAT6>,
> +				 <PINMUX_GPIO151__FUNC_B1_MSDC0_DAT7>,
> +				 <PINMUX_GPIO156__FUNC_B1_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <6>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO157__FUNC_B1_MSDC0_CLK>;
> +			drive-strength = <6>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-rst {
> +			pinmux = <PINMUX_GPIO155__FUNC_O_MSDC0_RSTB>;
> +			drive-strength = <6>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +	};
> +
> +	mmc0_uhs_pins: mmc0-uhs-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO161__FUNC_B1_MSDC0_DAT0>,
> +				 <PINMUX_GPIO160__FUNC_B1_MSDC0_DAT1>,
> +				 <PINMUX_GPIO159__FUNC_B1_MSDC0_DAT2>,
> +				 <PINMUX_GPIO158__FUNC_B1_MSDC0_DAT3>,
> +				 <PINMUX_GPIO154__FUNC_B1_MSDC0_DAT4>,
> +				 <PINMUX_GPIO153__FUNC_B1_MSDC0_DAT5>,
> +				 <PINMUX_GPIO152__FUNC_B1_MSDC0_DAT6>,
> +				 <PINMUX_GPIO151__FUNC_B1_MSDC0_DAT7>,
> +				 <PINMUX_GPIO156__FUNC_B1_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <8>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO157__FUNC_B1_MSDC0_CLK>;
> +			drive-strength = <8>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-ds {
> +			pinmux = <PINMUX_GPIO162__FUNC_B0_MSDC0_DSL>;
> +			drive-strength = <8>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-rst {
> +			pinmux = <PINMUX_GPIO155__FUNC_O_MSDC0_RSTB>;
> +			drive-strength = <8>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +	};
> +
> +	nor_pins_default: nor-pins {
> +		pins0 {
> +			pinmux = <PINMUX_GPIO127__FUNC_B0_SPINOR_IO0>,
> +				 <PINMUX_GPIO125__FUNC_O_SPINOR_CK>,
> +				 <PINMUX_GPIO128__FUNC_B0_SPINOR_IO1>;
> +			bias-pull-down;
> +		};
> +
> +		pins1 {
> +			pinmux = <PINMUX_GPIO126__FUNC_O_SPINOR_CS>,
> +				 <PINMUX_GPIO129__FUNC_B0_SPINOR_IO2>,
> +				 <PINMUX_GPIO130__FUNC_B0_SPINOR_IO3>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	spi0_pins: spi0-pins {
> +		pins-spi {
> +			pinmux = <PINMUX_GPIO69__FUNC_O_SPIM0_CSB>,
> +				 <PINMUX_GPIO70__FUNC_O_SPIM0_CLK>,
> +				 <PINMUX_GPIO71__FUNC_B0_SPIM0_MOSI>,
> +				 <PINMUX_GPIO72__FUNC_B0_SPIM0_MISO>;
> +			bias-disable;
> +		};
> +	};
> +
> +	spi1_pins: spi1-pins {
> +		pins-spi {
> +			pinmux = <PINMUX_GPIO75__FUNC_O_SPIM1_CSB>,
> +				 <PINMUX_GPIO76__FUNC_O_SPIM1_CLK>,
> +				 <PINMUX_GPIO77__FUNC_B0_SPIM1_MOSI>,
> +				 <PINMUX_GPIO78__FUNC_B0_SPIM1_MISO>;
> +			bias-disable;
> +		};
> +	};
> +
> +	spi2_pins: spi2-pins {
> +		pins-spi {
> +			pinmux = <PINMUX_GPIO79__FUNC_O_SPIM2_CSB>,
> +				 <PINMUX_GPIO80__FUNC_O_SPIM2_CLK>,
> +				 <PINMUX_GPIO81__FUNC_B0_SPIM2_MOSI>,
> +				 <PINMUX_GPIO82__FUNC_B0_SPIM2_MISO>;
> +			bias-disable;
> +		};
> +	};
> +
> +	uart0_pins: uart0-pins {
> +		pins-uart0 {
> +			pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
> +				 <PINMUX_GPIO32__FUNC_I1_URXD0>;
> +			bias-pull-up;
> +		};
> +	};
> +};
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
> +&xhci0 {
> +	status = "okay";
> +};
> +
> +&xhci1 {
> +	status = "okay";
> +};
> +
> +&xhci2 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> new file mode 100644
> index 000000000000..37343297e392
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -0,0 +1,951 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + *
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
> +#include <dt-bindings/power/mediatek,mt8188-power.h>
> +
> +/ {
> +	compatible = "mediatek,mt8188";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x000>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <282>;
> +			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <282>;
> +			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <282>;
> +			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <282>;
> +			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x400>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <282>;
> +			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x500>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <282>;
> +			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu6: cpu@600 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a78";
> +			reg = <0x600>;
> +			enable-method = "psci";
> +			clock-frequency = <2600000000>;
> +			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_1>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu7: cpu@700 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a78";
> +			reg = <0x700>;
> +			enable-method = "psci";
> +			clock-frequency = <2600000000>;
> +			capacity-dmips-mhz = <1024>;
> +			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_1>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core5 {
> +					cpu = <&cpu5>;
> +				};
> +
> +				core6 {
> +					cpu = <&cpu6>;
> +				};
> +
> +				core7 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_off_l: cpu-off-l {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00010000>;
> +				local-timer-stop;
> +				entry-latency-us = <50>;
> +				exit-latency-us = <95>;
> +				min-residency-us = <580>;
> +			};
> +
> +			cpu_off_b: cpu-off-b {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00010000>;
> +				local-timer-stop;
> +				entry-latency-us = <45>;
> +				exit-latency-us = <140>;
> +				min-residency-us = <740>;
> +			};
> +
> +			cluster_off_l: cluster-off-l {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x01010010>;
> +				local-timer-stop;
> +				entry-latency-us = <55>;
> +				exit-latency-us = <155>;
> +				min-residency-us = <840>;
> +			};
> +
> +			cluster_off_b: cluster-off-b {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x01010010>;
> +				local-timer-stop;
> +				entry-latency-us = <50>;
> +				exit-latency-us = <200>;
> +				min-residency-us = <1000>;
> +			};
> +		};
> +
> +		l2_0: l2-cache0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			next-level-cache = <&l3_0>;
> +			cache-unified;
> +		};
> +
> +		l2_1: l2-cache1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			next-level-cache = <&l3_0>;
> +			cache-unified;
> +		};
> +
> +		l3_0: l3-cache {
> +			compatible = "cache";
> +			cache-level = <3>;
> +			cache-unified;
> +		};
> +	};
> +
> +	clk13m: oscillator-13m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <13000000>;
> +		clock-output-names = "clk13m";
> +	};
> +
> +	clk26m: oscillator-26m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <26000000>;
> +		clock-output-names = "clk26m";
> +	};
> +
> +	clk32k: oscillator-32k {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "clk32k";
> +	};
> +
> +	pmu-a55 {
> +		compatible = "arm,cortex-a55-pmu";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
> +	};
> +
> +	pmu-a78 {
> +		compatible = "arm,cortex-a78-pmu";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer: timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clock-frequency = <13000000>;
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		gic: interrupt-controller@c000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <4>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			#redistributor-regions = <1>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0x0c000000 0 0x40000>,
> +			      <0 0x0c040000 0 0x200000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			ppi-partitions {
> +				ppi_cluster0: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
> +				};
> +
> +				ppi_cluster1: interrupt-partition-1 {
> +					affinity = <&cpu6 &cpu7>;
> +				};
> +			};
> +		};
> +
> +		topckgen: syscon@10000000 {
> +			compatible = "mediatek,mt8188-topckgen", "syscon";
> +			reg = <0 0x10000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		infracfg_ao: syscon@10001000 {
> +			compatible = "mediatek,mt8188-infracfg-ao", "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pericfg: syscon@10003000 {
> +			compatible = "mediatek,mt8188-pericfg", "syscon";
> +			reg = <0 0x10003000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pio: pinctrl@10005000 {
> +			compatible = "mediatek,mt8188-pinctrl";
> +			reg = <0 0x10005000 0 0x1000>,
> +			      <0 0x11c00000 0 0x1000>,
> +			      <0 0x11e10000 0 0x1000>,
> +			      <0 0x11e20000 0 0x1000>,
> +			      <0 0x11ea0000 0 0x1000>,
> +			      <0 0x1000b000 0 0x1000>;
> +			reg-names = "iocfg0", "iocfg_rm",
> +				    "iocfg_lt", "iocfg_lm", "iocfg_rt",
> +				    "eint";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pio 0 0 176>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		watchdog: watchdog@10007000 {
> +			compatible = "mediatek,mt8188-wdt";
> +			mediatek,disable-extrst;
> +			reg = <0 0x10007000 0 0x100>;
> +			#reset-cells = <1>;
> +		};
> +
> +		apmixedsys: syscon@1000c000 {
> +			compatible = "mediatek,mt8188-apmixedsys", "syscon";
> +			reg = <0 0x1000c000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		systimer: timer@10017000 {
> +			compatible = "mediatek,mt8188-timer", "mediatek,mt6765-timer";
> +			reg = <0 0x10017000 0 0x1000>;
> +			reg-names = "sys_timer_base";
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk13m>;
> +		};
> +
> +		pwrap: pwrap@10024000 {
> +			compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";
> +			reg = <0 0x10024000 0 0x1000>;
> +			reg-names = "pwrap";
> +			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
> +				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
> +			clock-names = "spi", "wrap";
> +		};
> +
> +		scp: scp@10500000 {
> +			compatible = "mediatek,mt8188-scp";
> +			reg = <0 0x10500000 0 0x100000>,
> +			      <0 0x10720000 0 0xe0000>;
> +			reg-names = "sram", "cfg";
> +			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> +
> +		adsp_audio26m: clock-controller@10b91100 {
> +			compatible = "mediatek,mt8188-adsp-audio26m";
> +			reg = <0 0x10b91100 0 0x100>;
> +			#clock-cells = <1>;
> +		};
> +
> +		uart0: serial@11001100 {
> +			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
> +			reg = <0 0x11001100 0 0x100>;
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@11001200 {
> +			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
> +			reg = <0 0x11001200 0 0x100>;
> +			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@11001300 {
> +			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
> +			reg = <0 0x11001300 0 0x100>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@11001400 {
> +			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
> +			reg = <0 0x11001400 0 0x100>;
> +			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		auxadc: adc@11002000 {
> +			compatible = "mediatek,mt8188-auxadc", "mediatek,mt8173-auxadc";
> +			reg = <0 0x11002000 0 0x1000>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_AUXADC>;
> +			clock-names = "main";
> +			#io-channel-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		pericfg_ao: syscon@11003000 {
> +			compatible = "mediatek,mt8188-pericfg-ao", "syscon";
> +			reg = <0 0x11003000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		spi0: spi@1100a000 {
> +			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x1100a000 0 0x1000>;
> +			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_AO_SPI0>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@11010000 {
> +			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11010000 0 0x1000>;
> +			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_AO_SPI1>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi2: spi@11012000 {
> +			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11012000 0 0x1000>;
> +			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_AO_SPI2>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi3: spi@11013000 {
> +			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11013000 0 0x1000>;
> +			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_AO_SPI3>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi4: spi@11018000 {
> +			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11018000 0 0x1000>;
> +			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_AO_SPI4>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		spi5: spi@11019000 {
> +			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0x11019000 0 0x1000>;
> +			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
> +				 <&topckgen CLK_TOP_SPI>,
> +				 <&infracfg_ao CLK_INFRA_AO_SPI5>;
> +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> +			status = "disabled";
> +		};
> +
> +		xhci1: usb@11200000 {
> +			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
> +			reg = <0 0x11200000 0 0x1000>,
> +			      <0 0x11203e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port1 PHY_TYPE_USB2>,
> +			       <&u3port1 PHY_TYPE_USB3>;
> +			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
> +					  <&topckgen CLK_TOP_SSUSB_XHCI>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
> +				 <&topckgen CLK_TOP_SSUSB_TOP_REF>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x468 2>;
> +			wakeup-source;
> +			status = "disabled";
> +		};
> +
> +		mmc0: mmc@11230000 {
> +			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11230000 0 0x10000>,
> +			      <0 0x11f50000 0 0x1000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC50_0>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>,
> +				 <&infracfg_ao CLK_INFRA_AO_RG_AES_MSDCFDE_CK_0P>;
> +			clock-names = "source", "hclk", "source_cg", "crypto_clk";
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@11240000 {
> +			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11240000 0 0x1000>,
> +			      <0 0x11eb0000 0 0x1000>;
> +			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC30_1>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
> +				 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
> +			clock-names = "source", "hclk", "source_cg";
> +			assigned-clocks = <&topckgen CLK_TOP_MSDC30_1>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
> +			status = "disabled";
> +		};
> +
> +		i2c0: i2c@11280000 {
> +			compatible = "mediatek,mt8188-i2c";
> +			reg = <0 0x11280000 0 0x1000>,
> +			      <0 0x10220080 0 0x80>;
> +			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clock-div = <1>;
> +			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C0>,
> +				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
> +			clock-names = "main", "dma";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@11281000 {
> +			compatible = "mediatek,mt8188-i2c";
> +			reg = <0 0x11281000 0 0x1000>,
> +			      <0 0x10220180 0 0x80>;
> +			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clock-div = <1>;
> +			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C2>,
> +				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
> +			clock-names = "main", "dma";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@11282000 {
> +			compatible = "mediatek,mt8188-i2c";
> +			reg = <0 0x11282000 0 0x1000>,
> +			      <0 0x10220280 0 0x80>;
> +			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clock-div = <1>;
> +			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C3>,
> +				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
> +			clock-names = "main", "dma";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		imp_iic_wrap_c: clock-controller@11283000 {
> +			compatible = "mediatek,mt8188-imp-iic-wrap-c";
> +			reg = <0 0x11283000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		xhci2: usb@112a0000 {
> +			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
> +			reg = <0 0x112a0000 0 0x1000>,
> +			      <0 0x112a3e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port2 PHY_TYPE_USB2>;
> +			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_3P>,
> +					  <&topckgen CLK_TOP_USB_TOP_3P>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
> +				 <&topckgen CLK_TOP_SSUSB_TOP_P3_REF>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
> +			status = "disabled";
> +		};
> +
> +		xhci0: usb@112b0000 {
> +			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
> +			reg = <0 0x112b0000 0 0x1000>,
> +			      <0 0x112b3e00 0 0x0100>;
> +			reg-names = "mac", "ippc";
> +			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
> +			phys = <&u2port0 PHY_TYPE_USB2>;
> +			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>,
> +					  <&topckgen CLK_TOP_USB_TOP_2P>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
> +						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
> +			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
> +				 <&topckgen CLK_TOP_SSUSB_TOP_P2_REF>,
> +				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck";
> +			mediatek,syscon-wakeup = <&pericfg 0x460 2>;
> +			wakeup-source;
> +			status = "disabled";
> +		};
> +
> +		nor_flash: spi@1132c000 {
> +			compatible = "mediatek,mt8188-nor", "mediatek,mt8186-nor";
> +			reg = <0 0x1132c000 0 0x1000>;
> +			clocks = <&topckgen CLK_TOP_SPINOR>,
> +				 <&pericfg_ao CLK_PERI_AO_FLASHIFLASHCK>,
> +				 <&pericfg_ao CLK_PERI_AO_FLASHIF_BUS>;
> +			clock-names = "spi", "sf", "axi";
> +			assigned-clocks = <&topckgen CLK_TOP_SPINOR>;
> +			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@11e00000 {
> +			compatible = "mediatek,mt8188-i2c";
> +			reg = <0 0x11e00000 0 0x1000>,
> +			      <0 0x10220100 0 0x80>;
> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clock-div = <1>;
> +			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C1>,
> +				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
> +			clock-names = "main", "dma";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@11e01000 {
> +			compatible = "mediatek,mt8188-i2c";
> +			reg = <0 0x11e01000 0 0x1000>,
> +			      <0 0x10220380 0 0x80>;
> +			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clock-div = <1>;
> +			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C4>,
> +				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
> +			clock-names = "main", "dma";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		imp_iic_wrap_w: clock-controller@11e02000 {
> +			compatible = "mediatek,mt8188-imp-iic-wrap-w";
> +			reg = <0 0x11e02000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		u3phy0: t-phy@11e30000 {
> +			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x0 0x11e30000 0x1000>;
> +			status = "disabled";
> +
> +			u2port0: usb-phy@0 {
> +				reg = <0x0 0x700>;
> +				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P2_REF>,
> +					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
> +				clock-names = "ref", "da_ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
> +		u3phy1: t-phy@11e40000 {
> +			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x0 0x11e40000 0x1000>;
> +			status = "disabled";
> +
> +			u2port1: usb-phy@0 {
> +				reg = <0x0 0x700>;
> +				clocks = <&topckgen CLK_TOP_SSUSB_PHY_REF>,
> +					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
> +				clock-names = "ref", "da_ref";
> +				#phy-cells = <1>;
> +			};
> +
> +			u3port1: usb-phy@700 {
> +				reg = <0x700 0x700>;
> +				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>,
> +					 <&clk26m>;
> +				clock-names = "ref", "da_ref";
> +				#phy-cells = <1>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		u3phy2: t-phy@11e80000 {
> +			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x0 0x11e80000 0x1000>;
> +			status = "disabled";
> +
> +			u2port2: usb-phy@0 {
> +				reg = <0x0 0x700>;
> +				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P3_REF>,
> +					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
> +				clock-names = "ref", "da_ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
> +		i2c5: i2c@11ec0000 {
> +			compatible = "mediatek,mt8188-i2c";
> +			reg = <0 0x11ec0000 0 0x1000>,
> +			      <0 0x10220480 0 0x80>;
> +			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clock-div = <1>;
> +			clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C5>,
> +				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
> +			clock-names = "main", "dma";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c@11ec1000 {
> +			compatible = "mediatek,mt8188-i2c";
> +			reg = <0 0x11ec1000 0 0x1000>,
> +			      <0 0x10220600 0 0x80>;
> +			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clock-div = <1>;
> +			clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C6>,
> +				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
> +			clock-names = "main", "dma";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		imp_iic_wrap_en: clock-controller@11ec2000 {
> +			compatible = "mediatek,mt8188-imp-iic-wrap-en";
> +			reg = <0 0x11ec2000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mfgcfg: clock-controller@13fbf000 {
> +			compatible = "mediatek,mt8188-mfgcfg";
> +			reg = <0 0x13fbf000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vppsys0: clock-controller@14000000 {
> +			compatible = "mediatek,mt8188-vppsys0";
> +			reg = <0 0x14000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		wpesys: clock-controller@14e00000 {
> +			compatible = "mediatek,mt8188-wpesys";
> +			reg = <0 0x14e00000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		wpesys_vpp0: clock-controller@14e02000 {
> +			compatible = "mediatek,mt8188-wpesys-vpp0";
> +			reg = <0 0x14e02000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vppsys1: clock-controller@14f00000 {
> +			compatible = "mediatek,mt8188-vppsys1";
> +			reg = <0 0x14f00000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys: clock-controller@15000000 {
> +			compatible = "mediatek,mt8188-imgsys";
> +			reg = <0 0x15000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys1_dip_top: clock-controller@15110000 {
> +			compatible = "mediatek,mt8188-imgsys1-dip-top";
> +			reg = <0 0x15110000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys1_dip_nr: clock-controller@15130000 {
> +			compatible = "mediatek,mt8188-imgsys1-dip-nr";
> +			reg = <0 0x15130000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys_wpe1: clock-controller@15220000 {
> +			compatible = "mediatek,mt8188-imgsys-wpe1";
> +			reg = <0 0x15220000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		ipesys: clock-controller@15330000 {
> +			compatible = "mediatek,mt8188-ipesys";
> +			reg = <0 0x15330000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys_wpe2: clock-controller@15520000 {
> +			compatible = "mediatek,mt8188-imgsys-wpe2";
> +			reg = <0 0x15520000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys_wpe3: clock-controller@15620000 {
> +			compatible = "mediatek,mt8188-imgsys-wpe3";
> +			reg = <0 0x15620000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys: clock-controller@16000000 {
> +			compatible = "mediatek,mt8188-camsys";
> +			reg = <0 0x16000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_rawa: clock-controller@1604f000 {
> +			compatible = "mediatek,mt8188-camsys-rawa";
> +			reg = <0 0x1604f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_yuva: clock-controller@1606f000 {
> +			compatible = "mediatek,mt8188-camsys-yuva";
> +			reg = <0 0x1606f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_rawb: clock-controller@1608f000 {
> +			compatible = "mediatek,mt8188-camsys-rawb";
> +			reg = <0 0x1608f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys_yuvb: clock-controller@160af000 {
> +			compatible = "mediatek,mt8188-camsys-yuvb";
> +			reg = <0 0x160af000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		ccusys: clock-controller@17200000 {
> +			compatible = "mediatek,mt8188-ccusys";
> +			reg = <0 0x17200000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys_soc: clock-controller@1800f000 {
> +			compatible = "mediatek,mt8188-vdecsys-soc";
> +			reg = <0 0x1800f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys: clock-controller@1802f000 {
> +			compatible = "mediatek,mt8188-vdecsys";
> +			reg = <0 0x1802f000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vencsys: clock-controller@1a000000 {
> +			compatible = "mediatek,mt8188-vencsys";
> +			reg = <0 0x1a000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +	};
> +};

-- 
Regards,
Alexandre

