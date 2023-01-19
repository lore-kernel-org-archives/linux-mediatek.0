Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42250C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHH+KmVkm4uaS5su6DhQGdf280FMF9BCxat013P5oGQ=; b=0TiyMyXUl0AWE1FQkNhuAptjjg
	aMQMmW8nhrcpYEfXeMiom2sZLdxcK/UKyDw7hl+mfD2mpICrsP2khvPJB8l3ndRGOS9q8W67YAHT0
	8bs0h8IpU3Y/YmFjaMO/8avclsQcAdnvhndAagj7qPvr2jTH08RgWYquElxsr91UItzkLN39Blof/
	/cPqKZ1hdHwJ8D7o+Xk3thtQvkyCf1Wk/UP9LVIMKXE46VbZC0MzKU+LlQ2iz1HUBlDgLe54q+54Z
	vpDYwLkAvtpdcL4paApynEHzcpcCrfAnqtj47aEurzjHyZhJQL4g/m3OUdGCIuZQ26SsEFt+ODZEb
	17oD8i3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZWI-006WVF-Mh; Thu, 19 Jan 2023 18:20:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZW4-006WR7-DZ; Thu, 19 Jan 2023 18:20:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id l8so2220384wms.3;
        Thu, 19 Jan 2023 10:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHH+KmVkm4uaS5su6DhQGdf280FMF9BCxat013P5oGQ=;
        b=GqKp2vOVQlufREuR+mxKuUX/qXUZVhR/2fU4TQRP7zRuP3onF9SvxcIZUU12qbKKO3
         GA74CUGvcgfj6xg9d0591RN7dfxwN3w4OPiF9QfYA/Fw4pL64+hAXaHEGkCtBr/nsHZ/
         Ta7SSWWR89aEi1FET0Hx9aJPYmJmFGAedLZKagiMBQ5+tZcMP6WFARpaGl3pAQAoAnO3
         FDJVcuUvZxnnBxSsfze+rlI0Wpe4dIqXmHjPYSUh6EooRGvn/QDZ1pEXoGwi0l2z5zPo
         cAmbd+2ubz9AZW7mbV4O3DqfDoIXPKkCGf9foK+oJZ/Oe/3hM2+FeStvV+iIhkqCcEfZ
         UNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHH+KmVkm4uaS5su6DhQGdf280FMF9BCxat013P5oGQ=;
        b=345pg8GtYg/JhHHVAnJLEUrO/onN5zS5kCzmJ2WUfDpZRhGl7c6WSCcn8ZDaRDtGus
         jX+9JOs1plzLhS6XDAldj1CulxBvpDMwvQCIf/fa+p07747T2FVtwMgazTgFL+2yhGIy
         KpD3+j66pz+3NRW6GWb+ztqXJchty0URcs6vPTgmYIfM2UA9/MSrJHep0aVhuqsLlTfB
         UO+bBxJ6zzH/8xtqENlWFM1r/1NENBXPNQppimWRNYx1Z9/nO007zgrnaMcC2rFkg1r6
         H0uGoZk/DIE/iduM/n4khuz/Pm3HdyZ6TIK//IMGlkd/4cX6UFMpCGGNR+vsMiJdhFgr
         joyA==
X-Gm-Message-State: AFqh2ko+/ARu6Z0s7vkPcNISU6sjRlKOMoFHFg4OhhrxtqBy3loVFdjP
	WJsBMWs9ZfYx1IuJH9yN3iE=
X-Google-Smtp-Source: AMrXdXutKZIpKraeZQVfKb2+7pXev/RBBlJWtd2oCakLdYQqUCD5lRtEWIx2JODT4tXHXXYajoe+mg==
X-Received: by 2002:a05:600c:510d:b0:3da:f719:50cd with SMTP id o13-20020a05600c510d00b003daf71950cdmr10826371wms.18.1674152397010;
        Thu, 19 Jan 2023 10:19:57 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s7-20020a1cf207000000b003db11dfc687sm5464787wmc.36.2023.01.19.10.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:19:56 -0800 (PST)
Message-ID: <d580f1dc-e49f-48c9-30be-a0ef25ad1435@gmail.com>
Date: Thu, 19 Jan 2023 19:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 2/2] arm64: dts: mt8195: Add Ethernet controller
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com, netdev@vger.kernel.org
References: <20230105010712.10116-1-biao.huang@mediatek.com>
 <20230105010712.10116-3-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230105010712.10116-3-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_102002_501708_F88CE1F4 
X-CRM114-Status: GOOD (  13.88  )
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



On 05/01/2023 02:07, Biao Huang wrote:
> Add Ethernet controller node for mt8195.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 77 ++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 92 ++++++++++++++++++++
>   2 files changed, 169 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 4fbd99eb496a..6a48c135f0da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -78,6 +78,23 @@ optee_reserved: optee@43200000 {
>   	};
>   };
>   
> +&eth {
> +	phy-mode ="rgmii-id";
> +	phy-handle = <&ethernet_phy0>;
> +	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
> +	snps,reset-delays-us = <0 10000 80000>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&eth_default_pins>;
> +	pinctrl-1 = <&eth_sleep_pins>;
> +	status = "okay";
> +
> +	mdio {
> +		ethernet_phy0: ethernet-phy@1 {
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
>   &i2c6 {
>   	clock-frequency = <400000>;
>   	pinctrl-0 = <&i2c6_pins>;
> @@ -258,6 +275,66 @@ &mt6359_vsram_others_ldo_reg {
>   };
>   
>   &pio {
> +	eth_default_pins: eth-default-pins {
> +		pins-txd {
> +			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
> +				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
> +				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
> +				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +		};
> +		pins-cc {
> +			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
> +				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
> +				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
> +				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
> +			drive-strength = <MTK_DRIVE_8mA>;
> +		};
> +		pins-rxd {
> +			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
> +				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
> +				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
> +				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
> +		};
> +		pins-mdio {
> +			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
> +				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
> +			input-enable;
> +		};
> +		pins-power {
> +			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
> +				 <PINMUX_GPIO92__FUNC_GPIO92>;
> +			output-high;
> +		};
> +	};
> +
> +	eth_sleep_pins: eth-sleep-pins {
> +		pins-txd {
> +			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
> +				 <PINMUX_GPIO78__FUNC_GPIO78>,
> +				 <PINMUX_GPIO79__FUNC_GPIO79>,
> +				 <PINMUX_GPIO80__FUNC_GPIO80>;
> +		};
> +		pins-cc {
> +			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
> +				 <PINMUX_GPIO88__FUNC_GPIO88>,
> +				 <PINMUX_GPIO87__FUNC_GPIO87>,
> +				 <PINMUX_GPIO86__FUNC_GPIO86>;
> +		};
> +		pins-rxd {
> +			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
> +				 <PINMUX_GPIO82__FUNC_GPIO82>,
> +				 <PINMUX_GPIO83__FUNC_GPIO83>,
> +				 <PINMUX_GPIO84__FUNC_GPIO84>;
> +		};
> +		pins-mdio {
> +			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
> +				 <PINMUX_GPIO90__FUNC_GPIO90>;
> +			input-disable;
> +			bias-disable;
> +		};
> +	};
> +
>   	gpio_keys_pins: gpio-keys-pins {
>   		pins {
>   			pinmux = <PINMUX_GPIO106__FUNC_GPIO106>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 5d31536f4c48..28b3ebd145bf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1046,6 +1046,98 @@ spis1: spi@1101e000 {
>   			status = "disabled";
>   		};
>   
> +		eth: ethernet@11021000 {
> +			compatible = "mediatek,mt8195-gmac", "snps,dwmac-5.10a";
> +			reg = <0 0x11021000 0 0x4000>;
> +			interrupts = <GIC_SPI 716 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names = "macirq";
> +			clock-names = "axi",
> +				      "apb",
> +				      "mac_main",
> +				      "ptp_ref",
> +				      "rmii_internal",
> +				      "mac_cg";
> +			clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET>,
> +				 <&pericfg_ao CLK_PERI_AO_ETHERNET_BUS>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_250M>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +				 <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>,
> +				 <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
> +			assigned-clocks = <&topckgen CLK_TOP_SNPS_ETH_250M>,
> +					  <&topckgen CLK_TOP_SNPS_ETH_62P4M_PTP>,
> +					  <&topckgen CLK_TOP_SNPS_ETH_50M_RMII>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_ETHPLL_D2>,
> +						 <&topckgen CLK_TOP_ETHPLL_D8>,
> +						 <&topckgen CLK_TOP_ETHPLL_D10>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_ETHER>;
> +			mediatek,pericfg = <&infracfg_ao>;
> +			snps,axi-config = <&stmmac_axi_setup>;
> +			snps,mtl-rx-config = <&mtl_rx_setup>;
> +			snps,mtl-tx-config = <&mtl_tx_setup>;
> +			snps,txpbl = <16>;
> +			snps,rxpbl = <16>;
> +			snps,clk-csr = <0>;
> +			status = "disabled";
> +
> +			mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			stmmac_axi_setup: stmmac-axi-config {
> +				snps,wr_osr_lmt = <0x7>;
> +				snps,rd_osr_lmt = <0x7>;
> +				snps,blen = <0 0 0 0 16 8 4>;
> +			};
> +
> +			mtl_rx_setup: rx-queues-config {
> +				snps,rx-queues-to-use = <4>;
> +				snps,rx-sched-sp;
> +				queue0 {
> +					snps,dcb-algorithm;
> +					snps,map-to-dma-channel = <0x0>;
> +				};
> +				queue1 {
> +					snps,dcb-algorithm;
> +					snps,map-to-dma-channel = <0x0>;
> +				};
> +				queue2 {
> +					snps,dcb-algorithm;
> +					snps,map-to-dma-channel = <0x0>;
> +				};
> +				queue3 {
> +					snps,dcb-algorithm;
> +					snps,map-to-dma-channel = <0x0>;
> +				};
> +			};
> +
> +			mtl_tx_setup: tx-queues-config {
> +				snps,tx-queues-to-use = <4>;
> +				snps,tx-sched-wrr;
> +				queue0 {
> +					snps,weight = <0x10>;
> +					snps,dcb-algorithm;
> +					snps,priority = <0x0>;
> +				};
> +				queue1 {
> +					snps,weight = <0x11>;
> +					snps,dcb-algorithm;
> +					snps,priority = <0x1>;
> +				};
> +				queue2 {
> +					snps,weight = <0x12>;
> +					snps,dcb-algorithm;
> +					snps,priority = <0x2>;
> +				};
> +				queue3 {
> +					snps,weight = <0x13>;
> +					snps,dcb-algorithm;
> +					snps,priority = <0x3>;
> +				};
> +			};
> +		};
> +
>   		xhci0: usb@11200000 {
>   			compatible = "mediatek,mt8195-xhci",
>   				     "mediatek,mtk-xhci";

