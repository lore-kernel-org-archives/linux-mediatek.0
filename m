Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6F4C636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NXeygwaQpVhvvyoIfJEG0rtDRDaeZnCcjZ3p7DxynU=; b=4j/kqGt6hCZePput3xDhAZvzgA
	gNj1LHu3InAtJo105LzB+JiYmX5QTNPLHaFd4jrcmTueoPFbEK16by/2PzT4Pyb7qHE91uF5rtDH0
	4gvTkHwgifQwQUKhHFmjufWB4C7YPmA1f73mp7Jsp0f7Qv+ir8Syt37KMAHGo88I/FFO34I8oXujS
	OUuoxy0JOVu0t6RN93g1LejHMdEGDz5gMy5U3ABoJGCwRTqBpm1qe1tsHOjfiUc9qgaUzpTFZEPzb
	FGMQDbNOZNBkZKDgfpE7Dxhwd6NszbAYGxhwcrbjtBwkOYxPrmtfGC2F9OrA0MD1Oztf6KvjE9j7k
	uKSPEbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNCA6-00BhqT-RR; Wed, 01 Feb 2023 12:24:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNC9w-00BhmJ-8U; Wed, 01 Feb 2023 12:24:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1303666wmq.0;
        Wed, 01 Feb 2023 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NXeygwaQpVhvvyoIfJEG0rtDRDaeZnCcjZ3p7DxynU=;
        b=kGMj/9EuKpvBCoAS0DyvEcY2pb7pGkqUKT85bBe7bFbOvQQlJ5EbYB5Qajdec16WuA
         cezG0jdYDet88QdgNdztxokxGr1gRCZV97tzQvnAqfNt94dBYMMc+rTBP8tDpURpuR+I
         MqH/JUORO17a/oUoPoq6CjC8ghTsSvf/WSFPCbSUzYkVDnT4YLhVSW/pvjCi1G0JsPji
         3ROEcThmlfRGPySPHOpeUqM4DnrZ2QI3C5Gqu7jpNqkhKDeKm0358Oc8kI9h4FPSfzra
         NDh5werIkF0/BuZUmc+HK0d7FC1k5KwwGLavTTp6RQQkGVc1XZ5hgEPDLAvWQcALH7Nu
         UAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NXeygwaQpVhvvyoIfJEG0rtDRDaeZnCcjZ3p7DxynU=;
        b=yTD0hSnL3P3qhVaEgExYQuI7AKtkXxl4mkSWfo/hJ5u2LJ16ZeKP64pw/dHmka9aPv
         h3oELC8pnu8HQ2TPHghfXheG04VfJ/ePGwzTJ3P97mp4RqZf27Ib6TjkcJgCrrU8aDHK
         bwPTg4AOW0cOn1QzUBLSHK6TfYqpmarDCTGmnwH7DS36Mb9VfejM26sQETerbEpqyB9G
         BzhVSNFn27RN0fLQR4o7JcYwp8u3Nc49BR4o7PQWgmKIEDfzjJle32KEpQTbUI/hkHtW
         Bei2qPhBQ9qCDxa+eYxsqW8l4Fj5toucgu2yZ6bDy1KR8oNrKi7IcCosUrsvAAGXaShC
         rXaA==
X-Gm-Message-State: AO0yUKXTKrP2x9BjA3aAnAOqvMgu4LeHrL36zQY06p9hzAs1ySzXXz6E
	6cshyfcoPz0pThNASYtERGY=
X-Google-Smtp-Source: AK7set+AJxtFxtJnhlRu+9+rAujgOdwo1SlUDYOgPkXUXvN5pI91jKGPYipsr54QFjPp32w8dBCZPQ==
X-Received: by 2002:a7b:c8ce:0:b0:3d9:ebf9:7004 with SMTP id f14-20020a7bc8ce000000b003d9ebf97004mr1878075wml.29.1675254253412;
        Wed, 01 Feb 2023 04:24:13 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u1-20020a05600c00c100b003a3442f1229sm1591451wmm.29.2023.02.01.04.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 04:24:12 -0800 (PST)
Message-ID: <ac19ed51-75a5-58d7-5f1b-6faf9ef2b3b4@gmail.com>
Date: Wed, 1 Feb 2023 13:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for
 mt8195-demo board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Miles Chen <miles.chen@mediatek.com>,
 linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <20230105092809.14214-3-macpaul.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230105092809.14214-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_042416_337292_7744357F 
X-CRM114-Status: GOOD (  14.96  )
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



On 05/01/2023 10:28, Macpaul Lin wrote:
> 1. Enable USB device port (USB port0).
> 2. Enable u2 speed for other USB HOST (USB port1/2/3).
> 3. Configure mt6360 (TYPEC) related pinctrls.
> 
> Note: Full dual-role switch capability requires TYPEC MUX driver and dts
> update will be send in separate patches.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 51 ++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> index 07a864cb8b54..207bb5f4c58f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -12,6 +12,7 @@
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> +#include <dt-bindings/usb/pd.h>
>   
>   / {
>   	model = "MediaTek MT8195 demo board";
> @@ -380,6 +381,22 @@
>   		};
>   	};
>   
> +	mt6360_pins: mt6360-pins {
> +		pins {
> +			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>,
> +				 <PINMUX_GPIO101__FUNC_GPIO101>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	u3_p0_vbus: u3_p0vbusdefault {
> +		pins_cmd_dat {
> +			pinmux = <PINMUX_GPIO63__FUNC_VBUSVALID>;
> +			input-enable;
> +		};
> +	};
> +
>   	uart0_pins: uart0-pins {
>   		pins {
>   			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
> @@ -393,6 +410,14 @@
>   				 <PINMUX_GPIO103__FUNC_URXD1>;
>   		};
>   	};
> +
> +	usb_otg_vbus: usb-otg-vbus-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "otg-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +	};
>   };
>   
>   
> @@ -412,6 +437,22 @@
>   	status = "okay";
>   };
>   
> +&u3port0 {
> +	status = "okay";
> +};
> +
> +&u2port1 {
> +	status = "okay";
> +};
> +
> +&u2port2 {
> +	status = "okay";
> +};
> +
> +&u2port3 {
> +	status = "okay";
> +};
> +
>   &u3phy0 {
>   	status = "okay";
>   };
> @@ -428,6 +469,16 @@
>   	status = "okay";
>   };
>   
> +&ssusb {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&u3_p0_vbus>;
> +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +	dr_mode = "otg";
> +	mediatek,usb3-drd;

What it that used for?
git grep didn't gave me any hit.

Regards,
Matthias

> +	usb-role-switch;
> +	status = "okay";
> +};
> +
>   &xhci0 {
>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
>   	vbus-supply = <&otg_vbus_regulator>;

