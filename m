Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945AFC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh4nLytH1UrA2iQs/fVrhb1nEoIoVCV9Y8jH68nXWy8=; b=0/7CgGRsENV1FKt9BpsGeKz3vT
	ZUDoBCjZV3zlSXmw2JLuGCK4vRux5R4TYa/pnTjyTBSfGbyJ5YhvtFCyrMYnO3zUv+JzocIzV8dN1
	VhdCgvW1xEtTJWLhDFLjkykzpuxVSfZiGvWEQlz1wWdkvWQvHJyoUFXloDANS8rKbpN9UDsJuNT6o
	05Ija/vB0uJuEfO4798Q27PMVYmgnzm56+owk4l8ExKWlDLfjptuUORApmAD6B5bARrZW1RpurXhk
	h6e0nQ4k/5+iYAbxqTyXP9Cqj+05OUFuvouiwfRkiy0UlaK49oCVkA1kuEELZqqrJpdtDiCqK9V6K
	ts/jp8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcgw-0075wd-8b; Thu, 04 Aug 2022 15:23:18 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcgk-0075lc-3v
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 15:23:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id x39so21694073lfu.7
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kh4nLytH1UrA2iQs/fVrhb1nEoIoVCV9Y8jH68nXWy8=;
        b=lZJc4JgTk8uKIZ5ux9BZ4zn7/W3yKuDdLZMrPOS4jaxt5r0rEWIgbWzk6+TkTIOEHb
         0gHtYfRs5k+LQjl2A5GGWLja2Z6rSTHQc0XflZt6fkhkRm94K3DYE9QAxyqiNtPJ/ngR
         4pH3gYfp9XQh6FDzdkvoH1dLJjh+00NpMK1Pkf0DuxWM0Yu6CtkcU4JqYlXghucHY8si
         mrf3gsNnfysk9R6bkJeHYLD9HGX7zG/WFXh+CQvOv72hQL7wQk3N+tfSzw3zxbjzJxjk
         MwdvkxGeniCowmbiYerg34tXwvQ3RqTJ7KKQPTVyrzJ6sMyBCOhKeCmVkBp74U9GEEu2
         DQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kh4nLytH1UrA2iQs/fVrhb1nEoIoVCV9Y8jH68nXWy8=;
        b=WxnQhNyGDfqdzONFYvFwsykJ+7sj0L2ZcRxyOzBejRoWtSKa3eBLesEd+HpsVlJok6
         /i0W2+cmK2Lb/YcrA8AG7p7iS8BO7spKH8Uyebbc+jmM44/hX6X99cLhJ5MNlfJhV4mv
         59itxivvnKRx4KjOvdCBYvSnl2RMzRd8IOHx2CWB+Z/YOocYCFuJ5uuFdQKQ7JZsOlQj
         S5MqPMaBw9I7fFI09+jSJpcqZazJ0Mc9eBIhfmIxt7J/Lm+57HyGaaFCfgVQ6h1kqGQl
         vvblpvTBePZRfQhvpfLPZ92eodnMc2fKYUHvEUSAZag8lP1aDaBj77QoVNN8xd+ADkcc
         hR9A==
X-Gm-Message-State: ACgBeo0RYZ5nzFuWdMphKW2HI8B1sUpwXwapuGBosE2xhGTRwaV9tUkt
	rAOA2Mb2rn3Qx0IJRK4Pz4n0Ng==
X-Google-Smtp-Source: AA6agR4W2EpgFvOAtyhi3xOePp7AUFNalAIiGmLE6pOC8eXNjKNNM4/4aokgAwUh5QIcbpXFlff6Kw==
X-Received: by 2002:a19:6508:0:b0:48a:71c:b6cb with SMTP id z8-20020a196508000000b0048a071cb6cbmr891768lfb.133.1659626575245;
        Thu, 04 Aug 2022 08:22:55 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id o16-20020a056512053000b0048af6d4e5fbsm150043lfc.275.2022.08.04.08.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 08:22:54 -0700 (PDT)
Message-ID: <f54deddd-251d-aa8c-6946-f447077d7782@linaro.org>
Date: Thu, 4 Aug 2022 17:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8.1, 6/7] arm64: dts: mt8195: Add thermal zone
Content-Language: en-US
To: bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220804130912.676043-1-bchihi@baylibre.com>
 <20220804130912.676043-7-bchihi@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804130912.676043-7-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_082306_218782_8A41C918 
X-CRM114-Status: GOOD (  13.57  )
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

On 04/08/2022 15:09, bchihi@baylibre.com wrote:
> From: Tinghan Shen <tinghan.shen@mediatek.com>
> 
> This adds the thermal zone for the mt8195.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 111 +++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index cbd0401968a2..5890e688eebe 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> +#include <dt-bindings/reset/mt8195-resets.h>
>  
>  / {
>  	compatible = "mediatek,mt8195";
> @@ -452,6 +453,28 @@ spi0: spi@1100a000 {
>  			status = "disabled";
>  		};
>  
> +		lvts_ap: thermal-sensor@1100b000 {
> +			compatible = "mediatek,mt8195-lvts-ap";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x1100b000 0 0x1000>;
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>;
> +			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
> +			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
> +		};
> +
> +		lvts_mcu: thermal-sensor@11278000 {
> +			compatible = "mediatek,mt8195-lvts-mcu";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x11278000 0 0x1000>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> +			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
> +			nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
> +		};
> +
>  		spi1: spi@11010000 {
>  			compatible = "mediatek,mt8195-spi",
>  				     "mediatek,mt6765-spi";
> @@ -1106,4 +1129,92 @@ vencsys_core1: clock-controller@1b000000 {
>  			#clock-cells = <1>;
>  		};
>  	};
> +
> +	thermal_zones: thermal-zones {
> +		cpu-big1-thermal {

Does this pass dtbs_check?

Best regards,
Krzysztof

