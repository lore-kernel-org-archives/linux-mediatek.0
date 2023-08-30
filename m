Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F333FC83F14
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L62d2476geTvsJA6A4BBrMX7M/tX2OUjBN5Jlc4vclA=; b=3ad5d0eVLOmwmZomC4qnEFhlBA
	nSa+pts+fqjqUHYbiTICrLZDIQTyFx0BKUjlBB79YQtYRegylJKCJrV12NeFlxCbEGIRqAE0I3Bmx
	CGmygF4fOj/sndhKjooTBzr+11ri/EdkvOomnm7RF79fkz4qeEXbiPZLJ623jPr8sHcrdpfbKbqkg
	cyBMOM9Sx+ljgIUfDFz0j8yY1FtkKWIjlCupC1xkQXYxK6h733VHWn6/xXT/HRYtClnDonnXGTI04
	HwV5RHIUjcXCRAm8M7UCHqDGD7vEwBXkNXAcrqcCy/ajFINimwiiFrrVZCSMS/O/do8K9jQEi9Xhf
	beccqGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJPe-00DOHK-1t;
	Wed, 30 Aug 2023 11:31:06 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJPb-00DOGT-2j
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Aug 2023 11:31:05 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b962c226ceso82327171fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Aug 2023 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693395062; x=1693999862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L62d2476geTvsJA6A4BBrMX7M/tX2OUjBN5Jlc4vclA=;
        b=DTvxZhA/M+JNb+lCJs9dIh16oWi1cSyu4Q783g6BXijX4Y0LSDwvGMbIuovpCBWZyt
         /w8fz3hXqktM5X8Z/bHnGhaYIb93sDUikMz6dotkx8mCWvCVzX1X+b2xCUXoGWFghvme
         432vHJB5s3ElqNg2wETVtACQkgPH4i43I6q0i6bNKMvcQiclHjepgNvDc8iOnQ6xhqHg
         ZTE8TTU/4GqNgktzAkc36Ap6fylomEmHWltx14FTisK/gaFkOs6kFOlG2KjuRv4VqN1O
         j5sQiVxA10FpRvQ0Lj+6SheCjFiAsB7M4p9N4nUo+A2w7Se4mj+X3k+7ZWZXLb5MHvVv
         /9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693395062; x=1693999862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L62d2476geTvsJA6A4BBrMX7M/tX2OUjBN5Jlc4vclA=;
        b=i4bQrKrw9Mu11MiFtjL9KlrEoNnR/kj9zL0f+NWHPUgPN6rCxWEgmRRbTRxJAHCHL8
         khqFUI0t1784zRWxviu54KIJYkH+1+Eyq+FHAF+lHMltvFXw0e2zo/qWcRj5FDufA9tI
         tmBm0Cd2D7EvZNEoOCqUrGMLBGYebGvaHDcQDijlk9he6BVV+ZEs6PLWHdc19v6vQl4L
         SZp8hjS9pFrK4eZoHRbuJDYAY8np3i9gx7S68YqrqElcTGsW+fAYT+DbEiRWnrtd4Bhf
         bj0NxWpoInu0VObBaRpvxrPQTHjtQtDe6A6fX9bKno6PrXmUxb+IVE5FX0X6KY/mby4A
         oZjQ==
X-Gm-Message-State: AOJu0YwLNUDyATNYvwDU6Qe6U8vJzQ9DAh7yKe1VnuI7Gc+xilOisWjm
	mHq1aSalZO8aydhbvndQFj2LtA==
X-Google-Smtp-Source: AGHT+IFsIb5/zNz7hTl02q6WO+wKxEhj5JkM6oIg9jNfHI8d3Gk4Gmyi7jIWjdHBAX1Nq5FppKTbIQ==
X-Received: by 2002:a05:651c:228:b0:2bc:b61d:44c9 with SMTP id z8-20020a05651c022800b002bcb61d44c9mr1626113ljn.53.1693395061754;
        Wed, 30 Aug 2023 04:31:01 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906361600b00982cfe1fe5dsm7103413ejb.65.2023.08.30.04.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 04:31:01 -0700 (PDT)
Message-ID: <657fcef0-8e15-0bdd-b91c-9a172e2ad391@linaro.org>
Date: Wed, 30 Aug 2023 13:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8195-demo: simplify mt6360
 nodes
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20230825114623.16884-1-macpaul.lin@mediatek.com>
 <20230830111532.9048-1-macpaul.lin@mediatek.com>
 <20230830111532.9048-4-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230830111532.9048-4-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_043103_892794_FE690910 
X-CRM114-Status: GOOD (  18.97  )
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

On 30/08/2023 13:15, Macpaul Lin wrote:
> The dts file for the MediaTek MT8195 demo board has been refactored
> to improve the configuration of the MT6360 multi-function PMIC.
> 
> The changes include:
>  - Addition of the mt6360.dtsi include file, which contains the common
>    configuration of the MT6360 for all mt8195 boards.
>  - Removal of the direct inclusion of the mt6360-regulator.h file.
>  - Removal of the common configuration of the MT6360 PMIC since
>    the included mt6360.dtsi is used.
>  - Add names according to the schematic of mt8195-demo board for
>    mt6360 nodes.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 173 ++++++++-----------
>  1 file changed, 74 insertions(+), 99 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 8aea6f5d72b3..d082d679dbbe 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -11,7 +11,6 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> -#include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>  
>  / {
>  	model = "MediaTek MT8195 demo board";
> @@ -130,103 +129,9 @@
>  	mt6360: pmic@34 {
>  		compatible = "mediatek,mt6360";
>  		reg = <0x34>;
> -		interrupt-controller;
> +		pinctrl-0 = <&mt6360_pins>;
> +		pinctrl-names = "default";
>  		interrupts-extended = <&pio 101 IRQ_TYPE_EDGE_FALLING>;
> -		interrupt-names = "IRQB";
> -
> -		charger {
> -			compatible = "mediatek,mt6360-chg";
> -			richtek,vinovp-microvolt = <14500000>;
> -
> -			otg_vbus_regulator: usb-otg-vbus-regulator {
> -				regulator-compatible = "usb-otg-vbus";
> -				regulator-name = "usb-otg-vbus";
> -				regulator-min-microvolt = <4425000>;
> -				regulator-max-microvolt = <5825000>;
> -			};
> -		};
> -
> -		regulator {
> -			compatible = "mediatek,mt6360-regulator";
> -			LDO_VIN3-supply = <&mt6360_buck2>;
> -
> -			mt6360_buck1: buck1 {

Your patchset does not look bisectable. Does not look tested, either...
Why having duplicated regulators (?) and then removing correct
regulators and keeping wrong ones?

> -				regulator-compatible = "BUCK1";
> -				regulator-name = "mt6360,buck1";
> -				regulator-min-microvolt = <300000>;
> -				regulator-max-microvolt = <1300000>;
> -				regulator-allowed-modes = <MT6360_OPMODE_NORMAL
> -							   MT6360_OPMODE_LP
> -							   MT6360_OPMODE_ULP>;
> -				regulator-always-on;
> -			};

...

>  	};
>  };
>  
> @@ -259,8 +164,8 @@
>  	cap-sd-highspeed;
>  	sd-uhs-sdr50;
>  	sd-uhs-sdr104;
> -	vmmc-supply = <&mt6360_ldo5>;
> -	vqmmc-supply = <&mt6360_ldo3>;
> +	vmmc-supply = <&mt6360_vmch_pmu_ldo5_reg>;
> +	vqmmc-supply = <&mt6360_vmc_pmu_ldo3_reg>;
>  	status = "okay";
>  };
>  
> @@ -300,6 +205,67 @@
>  	regulator-always-on;
>  };
>  
> +#include "mt6360.dtsi"

Includes are in the top part of the DTS. Sometimes bottom, but never in
the middle.


Best regards,
Krzysztof


