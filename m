Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77046C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nW461BRLiacu0fQQcbQ/ms/ezKwyN5n8RtJZv2E3pzI=; b=kCTNzyyqZbZCKKTomzfhJwvNrL
	NtHn3f/KGKrR4BreMvBlwd2gSb84YnRvMDtzlpFPlgBhDuS7HaZcxBOODbgdICN7CxbzYPCEzpkmQ
	YISDmWdGy9H6Borpm9mR37pOcq7ioZrRoTIueZNNj7WWfUNOLZuKlLr2iuTdNgE9/w4+g1Fs9ne6H
	HOY6GXhqZvSwfTksQdLpfyC2Q/TnQvAYiBuj33N3zGm5MIMq6+1dGfugMr+AxbIzmcw+0FWHV5WWq
	TykE2+gpFqmI6NTZfd4gNyuPDhjWhbu89vT8VS/U8miPfoxe8XdYykxcLuFjN7ZKYIDW4xewicB/1
	V8pF17nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJchW-0076Fe-JB; Thu, 04 Aug 2022 15:23:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJchF-00764Q-UP
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 15:23:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id m22so19476738lfl.9
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nW461BRLiacu0fQQcbQ/ms/ezKwyN5n8RtJZv2E3pzI=;
        b=TE/B8wyMpbf1LI41Lhn15lvfybUpLZEHXS/BLWnYha6wZrM+cxcV1SuDzGfJRc2PgY
         EyrThtV7g6W1JZWxs4kHp8LXLUatpvhCrJ7lfxrC7EmVyuJVwJR4Dx05bIzVyMEFxdbX
         SiJewCnfCknNi+KrQ2jgelkym/SP4B88ZpkG4kCSTiZFoS9ONf1QdulTOssBhXsaTpkm
         24GlW7C6oaTgJcgyzaSQ1OUqi5nKKwoNrPIMOb2r+1TdE6GgwdDK2URutVX2MoRpWB2J
         uV+8tjwPpqmhfOKPp1q3lfHVmy/rYFfRjxwlzJHRnfRJ3kb9q2BskfN3uvw5zsLu70/T
         4HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nW461BRLiacu0fQQcbQ/ms/ezKwyN5n8RtJZv2E3pzI=;
        b=APdDxCmuKIyp+HhOUHCCxLMoOdAgJiJH715sLHsI+4TkC75s97UBB3PCVjvfMxU+UR
         WmKqYPhMNxiQRrKp4qt/HX/5ssf2LIEoGy2JtAbtt/vEfxdd6wbT42j1aMdw4gBeJAJT
         T+ebEuaV+KuIr0ypVtGnZoa8WE2FlAHWAwXf/UzVMi7ILi/XcNb4o2GY0aDB5iywiFLt
         2hsdSTUGeOg9QC+RU5cwKPehs86O2GKk1k4uGufqMbByKeZNzOh8V5kixxmLHaTWylyf
         keFzfB+qX0NC8JiZwuJoxlR3jq+lZmOewMcVW1lAzakkTQCn+t3wm19x7f9Vh12NbamB
         tK6A==
X-Gm-Message-State: ACgBeo1MczXRjupF12XRR3BlSOxIsVQL6yugL4Wr307ohBBEavw5lLu6
	ulc87vjB9sY2nguDHdNrskCNkw==
X-Google-Smtp-Source: AA6agR6XRVfgI5FIRRD5dHZyN1ms60HDbZr53GF7XOvw/X/QlbaYbzoFd/8eYvuatAQOsPhrSuivHg==
X-Received: by 2002:a19:8c04:0:b0:48a:7683:3845 with SMTP id o4-20020a198c04000000b0048a76833845mr975449lfd.297.1659626612516;
        Thu, 04 Aug 2022 08:23:32 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id j9-20020a2e8249000000b0025e66a771efsm148498ljh.136.2022.08.04.08.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 08:23:31 -0700 (PDT)
Message-ID: <93f32d3a-ffca-8bf1-77c2-d0f4a22f4f12@linaro.org>
Date: Thu, 4 Aug 2022 17:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8.1, 3/7] arm64: dts: mt8192: Add thermal zone
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
 <20220804130912.676043-4-bchihi@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804130912.676043-4-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_082338_064347_982A77B3 
X-CRM114-Status: GOOD (  15.77  )
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
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> This adds the thermal zone for the mt8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 113 ++++++++++++++++++++++-
>  1 file changed, 112 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index cbae5a5ee4a0..3320b5c14ee3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
> - * Copyright (C) 2020 MediaTek Inc.
> + * Copyright (C) 2022 MediaTek Inc.

This is unexpected, so it needs careful explanation.

>   * Author: Seiya Wang <seiya.wang@mediatek.com>
>   */
>  
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mt8192-power.h>
> +#include <dt-bindings/reset/mt8192-resets.h>
>  
>  / {
>  	compatible = "mediatek,mt8192";
> @@ -599,6 +600,28 @@ spi0: spi@1100a000 {
>  			status = "disabled";
>  		};
>  
> +		lvts_ap: thermal-sensor@1100b000 {
> +			compatible = "mediatek,mt8192-lvts-ap";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x1100b000 0 0x1000>;
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg CLK_INFRA_THERM>;
> +			resets = <&infracfg MT8192_INFRA_RST0_THERM_CTRL_SWRST>;
> +			nvmem-cells = <&lvts_e_data1>;
> +			nvmem-cell-names = "lvts_calib_data1";
> +		};
> +
> +		lvts_mcu: thermal-sensor@11278000 {
> +			compatible = "mediatek,mt8192-lvts-mcu";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x11278000 0 0x1000>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg CLK_INFRA_THERM>;
> +			resets = <&infracfg MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> +			nvmem-cells = <&lvts_e_data1>;
> +			nvmem-cell-names = "lvts_calib_data1";
> +		};
> +
>  		spi1: spi@11010000 {
>  			compatible = "mediatek,mt8192-spi",
>  				     "mediatek,mt6765-spi";
> @@ -1457,4 +1480,92 @@ larb2: larb@1f002000 {
>  			power-domains = <&spm MT8192_POWER_DOMAIN_MDP>;
>  		};
>  	};
> +
> +	thermal_zones: thermal-zones {
> +		cpu-big1-thermal {

Names look not matching DT schema.


Best regards,
Krzysztof

