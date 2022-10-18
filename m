Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7514AC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 02:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhd/ZUoCMuwUhpjleHprYk4PDVfQssfuw60p/YwvSaQ=; b=v35V7/9l0V5+17tDO9gULGxhUw
	pgF1Fm3W1T3fPxP5U+PB81rq1ZjMhHqmEcRvT4SogqSfkEQ+XpInOm9g0X0bcllGXKHvA4QJZdti2
	Y03EYpX8dlwcpRn2COyKQAnLOGrlkUazg8jz5HsuuBrSesf4a45c9dwN48AyYTfGPu3mmGwfF3yRP
	q3No54lMyN1+hoUaxV0JzHw+1HfalHhc/pVQlgAHR5c7B8T33Pdltc8ldqXlsvRmUIqUXV9xUiq4j
	5fswFY7iRx640fhHO45tis8C87xCGcQ41cS2G5kRK/AVax2Z07sjMGKdyqr5TK6dVi4O1omqL2Uwf
	CQ39gjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okbvU-0019Z8-Vo; Tue, 18 Oct 2022 02:01:52 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okbvJ-0019W8-Co
	for linux-mediatek@lists.infradead.org; Tue, 18 Oct 2022 02:01:43 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id mg6so8508509qvb.10
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 19:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fhd/ZUoCMuwUhpjleHprYk4PDVfQssfuw60p/YwvSaQ=;
        b=jNaPVof0L0MmviTeoZV5EZJKtT33wAw+QpArqZCK6HQpL238vQw4N9i2cO6lbsYE9u
         ENwS2Qee5VTIW8OUIqkDb1dudArA/lyynHOGkqu1WNkl0b9bX50Vt2UYqn+8Nm6Mc35y
         EHBvdhX0Q8X5AzWWA2nXRS0VT4p2NmSYqaWA6zgSHGBN6C+Uppm1VwHWsUZjqD0ayp0m
         nPAqQBRRyx0oWM7k2kc1BkNzykME+r4hDTPgQ3u3/Qavcc2O+tK7Wn41wt8RAVOMtKe3
         8hutEbNMFXpRh6C5gwciChhrDuCPMMe3IXQ1cSihSud1HzHNBN7fcGW4KSmHeaJ3corw
         3iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhd/ZUoCMuwUhpjleHprYk4PDVfQssfuw60p/YwvSaQ=;
        b=XcouTAWoNe7VX2zoyOgoW6gUJXn7YXPfaJTqzPr4D8ycK3nbTfeOFMxkbC41ORMj8y
         UyBVDc2QINDRmn3ERqnNGIk2z46erD04KoJeau4SuQ6EJTaXXQ4JWil6o/wo35sh3De3
         TqGHxAvvu8nAl7xqLRlAJiGl+bbV87b8Rw/6Z20/sRZSh1f1gnHOK18SeL969+CTLk+t
         VmVFtzEb+67m6nL4L5bVJol2h4MxLttKT/YS86d/YAFoJjCScx0CJlWVhBMBfQ+pfGTa
         pzWA2xbdfmnGRn2blhakXu+Vt4i4AE5tiL2QlgcE0cbx4tYSkhFpM7twB8oVRjpuKhbh
         zY5g==
X-Gm-Message-State: ACrzQf2TJI6fI2YpW2DLV/rfKgQGan0JAepLneQEaA4bMj35S26dlnWm
	M5rFeckCvtJJkHhmqtYHokLOgw==
X-Google-Smtp-Source: AMsMyM6Y1eek9DkmLLKa1ivGYgW3X5larIJ9MQZNCr5jutpXmxlW/v23OPmjIS4nXOeidTQiMBvmxg==
X-Received: by 2002:a05:6214:c2a:b0:474:2411:b482 with SMTP id a10-20020a0562140c2a00b004742411b482mr365531qvd.128.1666058499306;
        Mon, 17 Oct 2022 19:01:39 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id hh6-20020a05622a618600b00343057845f7sm983408qtb.20.2022.10.17.19.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 19:01:38 -0700 (PDT)
Message-ID: <d6bda69e-d331-3e64-2100-d41e84c3fab7@linaro.org>
Date: Mon, 17 Oct 2022 22:01:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] arm64: dts: mt8195: Add Ethernet controller
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com
References: <20221017095834.7675-1-biao.huang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221017095834.7675-1-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_190141_478589_7B0BB92E 
X-CRM114-Status: GOOD (  15.38  )
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

On 17/10/2022 05:58, Biao Huang wrote:
> Add Ethernet controller node for mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88 ++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 87 +++++++++++++++++++
>  2 files changed, 175 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 4fbd99eb496a..02e04f82a4ae 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -258,6 +258,72 @@ &mt6359_vsram_others_ldo_reg {
>  };
>  
>  &pio {
> +	eth_default: eth_default {

No underscores in node names. Please also be sure your patch does not
bring new warnings with `dtbs_check` (lack of suffix above could mean it
brings...)

> +		txd_pins {

No underscores

> +			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
> +				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
> +				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
> +				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +		};
> +		cc_pins {

Ditto... and so on.

> +			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
> +				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
> +				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
> +				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +		};
> +		rxd_pins {
> +			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
> +				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
> +				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
> +				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
> +		};
> +		mdio_pins {
> +			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
> +				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
> +			input-enable;
> +		};
> +		power_pins {
> +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> +			output-high;
> +		};
> +	};
> +
> +	eth_sleep: eth_sleep {
> +		txd_pins {
> +			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
> +				 <PINMUX_GPIO78__FUNC_GPIO78>,
> +				 <PINMUX_GPIO79__FUNC_GPIO79>,
> +				 <PINMUX_GPIO80__FUNC_GPIO80>;
> +		};
> +		cc_pins {
> +			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
> +				 <PINMUX_GPIO88__FUNC_GPIO88>,
> +				 <PINMUX_GPIO87__FUNC_GPIO87>,
> +				 <PINMUX_GPIO86__FUNC_GPIO86>;
> +		};
> +		rxd_pins {
> +			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
> +				 <PINMUX_GPIO82__FUNC_GPIO82>,
> +				 <PINMUX_GPIO83__FUNC_GPIO83>,
> +				 <PINMUX_GPIO84__FUNC_GPIO84>;
> +		};
> +		mdio_pins {
> +			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
> +				 <PINMUX_GPIO90__FUNC_GPIO90>;
> +			input-disable;
> +			bias-disable;
> +		};
> +		power_pins {
> +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> +			input-disable;
> +			bias-disable;
> +		};
> +	};
> +
>  	gpio_keys_pins: gpio-keys-pins {
>  		pins {
>  			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
> @@ -434,6 +500,28 @@ &xhci0 {
>  	status = "okay";
>  };
>  
> +&eth {
> +	phy-mode ="rgmii-rxid";
> +	phy-handle = <&eth_phy0>;
> +	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
> +	snps,reset-delays-us = <0 10000 10000>;
> +	mediatek,tx-delay-ps = <2030>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&eth_default>;
> +	pinctrl-1 = <&eth_sleep>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		eth_phy0: eth_phy0@1 {

ethernet-phy@1

> +			compatible = "ethernet-phy-id001c.c916";
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
>  &xhci1 {
>  	vusb33-supply = <&mt6359_vusb_ldo_reg>;
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..aa1fcc3b9cb6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1042,6 +1042,93 @@ spis1: spi@1101e000 {
>  			status = "disabled";
>  		};
>  
> +		stmmac_axi_setup: stmmac-axi-config {
> +			snps,wr_osr_lmt = <0x7>;
> +			snps,rd_osr_lmt = <0x7>;
> +			snps,blen = <0 0 0 0 16 8 4>;
> +		};
> +
> +		mtl_rx_setup: rx-queues-config {
> +			snps,rx-queues-to-use = <4>;
> +			snps,rx-sched-sp;
> +			queue0 {
> +				snps,dcb-algorithm;
> +				snps,map-to-dma-channel = <0x0>;
> +			};
> +			queue1 {
> +				snps,dcb-algorithm;
> +				snps,map-to-dma-channel = <0x0>;
> +			};
> +			queue2 {
> +				snps,dcb-algorithm;
> +				snps,map-to-dma-channel = <0x0>;
> +			};
> +			queue3 {
> +				snps,dcb-algorithm;
> +				snps,map-to-dma-channel = <0x0>;
> +			};
> +		};
> +
> +		mtl_tx_setup: tx-queues-config {
> +			snps,tx-queues-to-use = <4>;
> +			snps,tx-sched-wrr;
> +			queue0 {
> +				snps,weight = <0x10>;
> +				snps,dcb-algorithm;
> +				snps,priority = <0x0>;
> +			};
> +			queue1 {
> +				snps,weight = <0x11>;
> +				snps,dcb-algorithm;
> +				snps,priority = <0x1>;
> +			};
> +			queue2 {
> +				snps,weight = <0x12>;
> +				snps,dcb-algorithm;
> +				snps,priority = <0x2>;
> +			};
> +			queue3 {
> +				snps,weight = <0x13>;
> +				snps,dcb-algorithm;
> +				snps,priority = <0x3>;
> +			};
> +		};
> +
> +		eth: ethernet@11021000 {
> +			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
> +			reg = <0 0x11021000 0 0x4000>;
> +			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "macirq";
> +			mac-address = [00 55 7b b5 7d f7];

How is this property of a SoC? Are you saying now that all MT8195 SoCs
have the same MAC address?

Best regards,
Krzysztof


