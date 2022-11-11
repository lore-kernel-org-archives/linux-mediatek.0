Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB276C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhPdRtC5P9el746wpRaUn88cJ5QQDfecOo6k2qO/YRw=; b=hkWe5iAj0PPqBb
	gnzPN8sdw0lwgc1p3JC8CEirzzQHcRgSSvd1o989foF/TUhPLbTt0pYZ9F3o/nz2MQbExCMrcizVF
	2x2NEAV+wWHskOw9iqK3/LR7KNPAaWQBjnAKoSYhdiegwKjNDo7iVy95A4Q43C7wd3oN7/1CPVq5I
	sz/j8VUsWrpVFzxxGdPLwXz8dCHvgtXJCJ5dCh1VAdYUtC8NFdQmW4iC5B9U5CUwv5jH9d7+n4Hxm
	AKHZa872qitQXnEJ3uAmtqlDDa4jaGq8vXKYf9bt54bdGpWUEg+c28MLHyQXOe2UZcftONz/TstB0
	0FmkCKhTcst95eqtMzHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPsJ-00EQsr-Mi; Fri, 11 Nov 2022 08:59:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPsG-00EQnf-S7; Fri, 11 Nov 2022 08:58:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id cl5so5576826wrb.9;
        Fri, 11 Nov 2022 00:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhPdRtC5P9el746wpRaUn88cJ5QQDfecOo6k2qO/YRw=;
        b=ODGS5/N8z37QTHKd5wbq4rm9UfLrcVtAuaFYHP7eg1RmB60fM6AbAEWq7/1Gp0P4uw
         YXxXdjEgcOWEnJR16XgxwN3t+Hxp7N4ob7EgqVR2tGxOjP8bhvyO90i78jwlF1f7ZIBF
         CnhBcXg5/dag8qOYkgsMD5lm3xbkFYbApk+XFYTzVjSoF6w0LX9NPRMw4Phfbgk2rg1X
         3KM92AqpV5pzv2vAuaWVl621EA3vNJvQD1V8jfIu4Non1oiNsEP97cxAilSxgWTp9kDh
         KPjURzRoOe4nASGRYWUqrLCwAq+E6G7PWCTtMPiC0vVf5IYS53//UqhZKcvhiMIUsRyv
         W4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhPdRtC5P9el746wpRaUn88cJ5QQDfecOo6k2qO/YRw=;
        b=xe6Uerukz9TPKAqN/8DeUFZr8gtNj5m8awpemOqlIT84gilkgq9xExzEt8HDKqWPiP
         ot6/Eit/c4ou9Y0vjcBegnFZYTXeihPslOOudPJHfzdeO57rYEbalmnUvRxucIAfn6Im
         bHuyns8SId6BuCaIM+1HMopw3xn9KUXik6TkVFeynyQtJ+j2RUwsFKyXDtlGXsZUc5WA
         G7yHgGnNTKI2Hw4AulErdTUel4QpefZjLgdQw0Uc/Fobf+TYo2GRFpTVqjHLO09iAcq+
         2w/zddRWWN8IrUojOEwgRzI4TW4HnU7qdp9TKwvVUBh1afG6JIsHaQGVPm3tg2lkkb7R
         JTgQ==
X-Gm-Message-State: ANoB5pmge/P54BQwudN+faauq2n7rwE/BTBYfAAnY8GORohMp46F5o85
	GMSq2oQT55YXYwsesyU3A017bF7c/hZXSw==
X-Google-Smtp-Source: AA0mqf6gSWwlgp9C2vWz+Si18kl9g/4RJgfoUqSd0qYNeAadlvvMv6N2lPtTR6po77IdmggQlHlK1Q==
X-Received: by 2002:adf:ea0c:0:b0:236:60e8:3cca with SMTP id q12-20020adfea0c000000b0023660e83ccamr621581wrm.471.1668157131624;
        Fri, 11 Nov 2022 00:58:51 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d5645000000b0022da3977ec5sm1283001wrw.113.2022.11.11.00.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:58:49 -0800 (PST)
Message-ID: <9955078b-72cd-4260-0cc2-ba1b9e0a0bdd@gmail.com>
Date: Fri, 11 Nov 2022 09:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC v3 05/11] arm64: dts: mt7986: add mmc related device nodes
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-6-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221106085034.12582-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_005856_991017_23C65DAC 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/11/2022 09:50, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This patch adds mmc support for MT7986.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - fix pullups/pulldowns for mt7986a-rfb to have generic bias-pull-*
> 
> v2:
> - update mmc-node because clocks changed
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 87 ++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 15 ++++
>   2 files changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 2b5d7ea31b4d..e1a0331aaa5f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -5,6 +5,8 @@
>    */
>   
>   /dts-v1/;
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
>   #include "mt7986a.dtsi"
>   
>   / {
> @@ -24,6 +26,15 @@ memory@40000000 {
>   		reg = <0 0x40000000 0 0x40000000>;
>   	};
>   
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>   	reg_3p3v: regulator-3p3v {
>   		compatible = "regulator-fixed";
>   		regulator-name = "fixed-3.3V";
> @@ -76,7 +87,83 @@ switch: switch@0 {
>   	};
>   };
>   
> +&mmc0 {
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_pins_default>;
> +	pinctrl-1 = <&mmc0_pins_uhs>;
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	hs400-ds-delay = <0x14014>;
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&reg_1p8v>;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	status = "okay";
> +};
> +
>   &pio {
> +	mmc0_pins_default: mmc0-pins {
> +		mux {
> +			function = "emmc";
> +			groups = "emmc_51";

Waiting on
https://patchwork.kernel.org/project/linux-mediatek/patch/20221106080114.7426-3-linux@fw-web.de/

Please correct me if I'm wrong.

Matthias

> +		};
> +		conf-cmd-dat {
> +			pins = "EMMC_DATA_0", "EMMC_DATA_1", "EMMC_DATA_2",
> +			       "EMMC_DATA_3", "EMMC_DATA_4", "EMMC_DATA_5",
> +			       "EMMC_DATA_6", "EMMC_DATA_7", "EMMC_CMD";
> +			input-enable;
> +			drive-strength = <4>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
> +		};
> +		conf-clk {
> +			pins = "EMMC_CK";
> +			drive-strength = <6>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
> +		};
> +		conf-ds {
> +			pins = "EMMC_DSL";
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
> +		};
> +		conf-rst {
> +			pins = "EMMC_RSTB";
> +			drive-strength = <4>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
> +		};
> +	};
> +
> +	mmc0_pins_uhs: mmc0-uhs-pins {
> +		mux {
> +			function = "emmc";
> +			groups = "emmc_51";
> +		};
> +		conf-cmd-dat {
> +			pins = "EMMC_DATA_0", "EMMC_DATA_1", "EMMC_DATA_2",
> +			       "EMMC_DATA_3", "EMMC_DATA_4", "EMMC_DATA_5",
> +			       "EMMC_DATA_6", "EMMC_DATA_7", "EMMC_CMD";
> +			input-enable;
> +			drive-strength = <4>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
> +		};
> +		conf-clk {
> +			pins = "EMMC_CK";
> +			drive-strength = <6>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
> +		};
> +		conf-ds {
> +			pins = "EMMC_DSL";
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
> +		};
> +		conf-rst {
> +			pins = "EMMC_RSTB";
> +			drive-strength = <4>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
> +		};
> +	};
> +
>   	spi_flash_pins: spi-flash-pins {
>   		mux {
>   			function = "spi";
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 1c7a973c28ca..32c26b239ae6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -284,6 +284,21 @@ ssusb: usb@11200000 {
>   			status = "disabled";
>   		};
>   
> +		mmc0: mmc@11230000 {
> +			compatible = "mediatek,mt7986-mmc";
> +			reg = <0 0x11230000 0 0x1000>,
> +			      <0 0x11c20000 0 0x1000>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&topckgen CLK_TOP_EMMC_416M_SEL>,
> +				 <&infracfg CLK_INFRA_MSDC_HCK_CK>,
> +				 <&infracfg CLK_INFRA_MSDC_CK>,
> +				 <&infracfg CLK_INFRA_MSDC_133M_CK>,
> +				 <&infracfg CLK_INFRA_MSDC_66M_CK>;
> +			clock-names = "source", "hclk", "source_cg", "bus_clk",
> +				      "sys_cg";
> +			status = "disabled";
> +		};
> +
>   		usb_phy: t-phy@11e10000 {
>   			compatible = "mediatek,mt7986-tphy",
>   				     "mediatek,generic-tphy-v2";

