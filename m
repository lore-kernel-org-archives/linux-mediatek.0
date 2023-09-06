Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9A9EB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 07:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/D3S02pV0j69DWmyqjSauKntrk3YcPUrV89cnyW/2M=; b=TK5WcpUmgp9kaf++GyCDjm1Uo0
	G0GoYw5V38Ele6h0Dy474eatS6ShBt+xpNQi1+jjFqJKQmAao6lCx9tNeW+PrANqMXAhsYaHvgKzk
	2KB/1M9O3soy8UFtXTwaf6G2qWdBzlquagBvS/liXKMpvNOk+xBQ/Dgig6W4e59TbFcHlyUo3O8CB
	aZgMmJW/biW7lIs5+rtXDujzs71jkWWjsKE8ClFfPL04PYS5UieMLVQYZvb7mJU8rdTCYAcg9CTUC
	A2r1l2tAfHXk2Hk+lU6YV4sddi3mHngUZXxN128Zu3T5SJ5xypkRMMluMkvKhBpx6gXasjiOJuyT4
	FkkRpnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmwX-007Uoe-0S;
	Wed, 06 Sep 2023 07:27:17 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmwT-007Umd-1L
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 07:27:14 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99de884ad25so514219866b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693985229; x=1694590029; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/D3S02pV0j69DWmyqjSauKntrk3YcPUrV89cnyW/2M=;
        b=ef5a4l7sYAYMWLESmQxl9nN0zYxzvsK3OuP4GsGSCR2JLCYYqX4+lh1S96339WkEWG
         0//YN00BZ1rF/a523/88WcUOK/NPrOvFZr0+hBx4MfUzmlgUVbsRn7mbR00UMEgsSkxv
         n6sXcU007GDc5CUJ+hwysUF0RTHqKIeFCbJp1k71zs5d/0FPzQvx59HCFJ47yel2eEAJ
         Imesp/P02gVPP2S5lvSuDrJNH+nmqFPXV9j7atscUeXf9YC2YYSX+f4r7hGxTCBkSDxB
         qA/3MhvWOa0EZBJwuBZMnl3kvwHNTnzN4LUGI95/XrnMTKZs4s1TdaCvoIy5v+LtHr7R
         PXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693985229; x=1694590029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D3S02pV0j69DWmyqjSauKntrk3YcPUrV89cnyW/2M=;
        b=I2lsG4UfUk91eAzQM0RN8zUgbeaVh7wQBvIXy0W6TQpS3NQ2f7mwg8kDTFrdqCyy5j
         d8u7vZQMKIP/wSqnABAs+WWiDHaghc6FBHb/xo4rHJ7buIdZzjcNhnJtx+RSItqUFKHf
         tPUmUR06M6VVW7HE1szE7fyBIeXfQrwqpxmHqs/Q8bHS6frjqjggQFQH1XZvcl8MLpAV
         PxkvZH7o4MgfHNVBwm0n82lAwcxL4E7sZxJhzwkTvYuaaf5J/J5kMmicY9QuKJIb3BM7
         BPO1N6IPYG6UFsglYWZXfpIvRe84Cj0eZ7dbFL7xNMMOAkHAzYTyANSpUqN9Ilz+WLk5
         8U7g==
X-Gm-Message-State: AOJu0Yzd3oY1hZ3rlp3DFKUr3fUdLGV8IofXzKtFRg65NDxfYlTpz60e
	JpXB6ZrYZTNTxzBmQjkBtlFaEA==
X-Google-Smtp-Source: AGHT+IFSivZXNYKgOoZ31LkGFVLn7z0ozLSMGOS34alVtKgZpxs2nm8bdPv5Y8/tJvhmbBZRQfgz0Q==
X-Received: by 2002:a17:907:724b:b0:9a1:d5de:5e3 with SMTP id ds11-20020a170907724b00b009a1d5de05e3mr1621628ejc.54.1693985229558;
        Wed, 06 Sep 2023 00:27:09 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id qc8-20020a170906d8a800b0099275c59bc9sm8561948ejb.33.2023.09.06.00.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:27:09 -0700 (PDT)
Message-ID: <502fc7b1-a32d-6901-3a45-d2aa0e0c3849@linaro.org>
Date: Wed, 6 Sep 2023 09:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8365-pumpkin: Add overlays
 for thp7312 cameras
Content-Language: en-US
To: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230905233118.183140-1-paul.elder@ideasonboard.com>
 <20230905233118.183140-4-paul.elder@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905233118.183140-4-paul.elder@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_002713_453348_60EBAE2B 
X-CRM114-Status: GOOD (  19.75  )
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

On 06/09/2023 01:31, Paul Elder wrote:
> Add overlays for the Pumpkin i350 to support THP7312 cameras.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  4 +
>  .../mt8365-pumpkin-common-thp7312.dtsi        | 23 ++++++
>  .../mt8365-pumpkin-csi0-thp7312-imx258.dtso   | 73 +++++++++++++++++++
>  .../mt8365-pumpkin-csi1-thp7312-imx258.dtso   | 73 +++++++++++++++++++
>  4 files changed, 173 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 20570bc40de8..ceaf24105001 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -56,4 +56,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>  
> +mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi0-thp7312-imx258.dtbo
> +mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-csi1-thp7312-imx258.dtbo
>  mtk-mt8365-pumpkin-dtbs := mt8365-pumpkin.dtb mt8365-pumpkin-ethernet-usb.dtbo
> +
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mtk-mt8365-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
> new file mode 100644
> index 000000000000..478697552617
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Ideas on Board
> + * Author: Paul Elder <paul.elder@ideasonboard.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	vsys_v4p2: regulator@0 {

Hm? Is this a bus?

> +		compatible = "regulator-fixed";
> +		regulator-name = "vsys-v4p2";
> +		regulator-min-microvolt = <4200000>;
> +		regulator-max-microvolt = <4200000>;
> +	};
> +
> +	camera61_clk: cam_clk24m {

And this is not on a bus? It's the same / node!

Please work on mainline, which means take mainline code and change it to
your needs. Do not take downstream poor code and change it...

No underscores in node names. Also generic node names, so at least with
generic prefix or suffix.


> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		#clock-cells = <0>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
> new file mode 100644
> index 000000000000..740d14a19d75
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Ideas on Board
> + * Author: Paul Elder <paul.elder@ideasonboard.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/mt8365-pinfunc.h>
> +#include "mt8365-pumpkin-common-thp7312.dtsi"
> +
> +&i2c3 {
> +	camera@61 {
> +		compatible = "thine,thp7312";
> +		reg = <0x61>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam0_pins_default>;
> +		reset-gpios = <&pio 118 GPIO_ACTIVE_LOW>;
> +		clocks = <&camera61_clk>;
> +
> +		vddcore-supply = <&vsys_v4p2>;
> +		vhtermrx-supply = <&vsys_v4p2>;
> +		vddtx-supply = <&vsys_v4p2>;
> +		vddhost-supply = <&vsys_v4p2>;
> +		vddcmos-supply = <&vsys_v4p2>;
> +		vddgpio_0-supply = <&vsys_v4p2>;
> +		vddgpio_1-supply = <&vsys_v4p2>;
> +		DOVDD-supply = <&vsys_v4p2>;
> +		AVDD-supply = <&vsys_v4p2>;
> +		DVDD-supply = <&vsys_v4p2>;
> +
> +		orientation = <0>;
> +		rotation = <0>;
> +
> +		thine,rx,data-lanes = <4 1 3 2>;

NAK for this property.


> +
> +		port {
> +			isp1_out: endpoint {
> +				remote-endpoint = <&seninf_in1>;
> +				data-lanes = <4 2 1 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&pio {
> +	cam0_pins_default: cam0_pins_default {

No underscores in node names.

> +		pins_rst {

Ditto


Best regards,
Krzysztof


