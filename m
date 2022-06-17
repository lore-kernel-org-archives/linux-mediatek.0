Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E9BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otzMXO+UzjAVntuNvFzmToiaj0Xvl10WTmF2X1x20Gs=; b=iWaBOoQxD6yZHKSlLo/odl9VOR
	EqB92Q7F3ZCc+e3v34vDPvrUnU4wmoG9nrFxNSUI2Nw3VWMEf44NgSBYx/HIIcdEA0OYvZYqxnfc+
	RM+7EzevFpR/rOh4qDD8up7MALpaTZF5eZW/RohR11oLZ9tU0R06FHbzwoHjEF21U/2ty/qhce0bJ
	lBr9sJQO3ptCW9mCieGUbdAQFut8z5Q+yk7YRzLx1jYMGDclP7iIt50DwWcWLSEGh5JsW/wQfVynZ
	WSkyc/6KQJ8dBo+pQ14sjilOWyC10N/pa1bT4OeR4Hqc1IaUYMObt8Jv7yMz/s9rfpb6+VTZKIkDj
	yrWcS7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29TS-0071ZC-61; Fri, 17 Jun 2022 10:45:10 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29Sw-0071E1-7m; Fri, 17 Jun 2022 10:44:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id o7so8024707eja.1;
        Fri, 17 Jun 2022 03:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=otzMXO+UzjAVntuNvFzmToiaj0Xvl10WTmF2X1x20Gs=;
        b=NbYG0/ltrsRmRfUcWflVhrJw27NKwjWAIJLlH+BtGanROc2UkceKeROAUsMGYNWAYm
         uwjxjB4sww9rCvxZbMcmzK7/o+ko5hPycRmwL9Z41FT2agzVwgKMgk1bJZjOhg7IMdfH
         Erxa5b6ZPlPWptAUQ0GTIFYhFm7r5RO2nMOry269LSBYPA3G/CgBzAvadEGWF8wDHfPR
         IWysUmq0Jnp2S2O9LKnUd9akvLGUdYQOkjkyqzRZXnjMe4/4PuNyQfz0AeY//YMvqjz/
         wlPEWG3jjFg1wxOH2SA3BA0ladlyO8vWZH4kEiXJsrKgFRux5hSNtg4XX8z0Ysl1aCPd
         xEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=otzMXO+UzjAVntuNvFzmToiaj0Xvl10WTmF2X1x20Gs=;
        b=Zln+GkqbqB5FHZKFoEWzc7Jjb+Mhqkj+ptNCOBNmYpyJS3Q31YxjABQvx6zntctjAq
         o8zhp7H7ufXwsK2gbk6g893SjZ45KSxuetoa6ldOH89kZYz3fXULppCr2jOoZyinc6VG
         jEQScvX/UiLYUdkuX960LHcQNHhwz+uBowm4MlqsQd8KZka/0LkijCPU9LFebEhAixBs
         jXhS8uZNq786D898+xM5aKsnFulB3JzC2Hx1xs7epqWMS5u/96c4FgGgtkXKTIxKrWQT
         dMmkLjRKY/xAZ2KEahXt3QXRnqjCcpkxXgFTemwK166lgIAxP1/4pBL8yvUZY5g5MoJp
         axiw==
X-Gm-Message-State: AJIora/eWB4fjj40mFjP2T3WNxnuJqCo8cNksGhmM/erMmo2xyhNyzOt
	et1TtRoEhsPs0PBOqlvcMRo=
X-Google-Smtp-Source: AGRyM1tTm4mmAhpPdwZ1D1xqJQ5B0eHb98NUmc1YWQWMSXAhfW1NR8KcCN8FzvGnAS9VZWpLUFAjtQ==
X-Received: by 2002:a17:906:2cc8:b0:6fd:d8d8:b8f3 with SMTP id r8-20020a1709062cc800b006fdd8d8b8f3mr8655303ejr.384.1655462674583;
        Fri, 17 Jun 2022 03:44:34 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id y3-20020a056402358300b0042dc25fdf5bsm3632843edc.29.2022.06.17.03.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:44:33 -0700 (PDT)
Message-ID: <edc8933a-5433-8fe9-f5ab-5efeaa6cde78@gmail.com>
Date: Fri, 17 Jun 2022 12:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 18/40] ARM: dts: mediatek: align gpio-key node names
 with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-18-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616005333.18491-18-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_034438_395761_972A79C2 
X-CRM114-Status: GOOD (  12.74  )
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



On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

> ---
>   arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 4 ++--
>   arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 4 ++--
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 4 ++--
>   arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 4 ++--
>   arch/arm/boot/dts/mt7629-rfb.dts              | 4 ++--
>   5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
> index 13c86936d1c8..e8b4b6d30d19 100644
> --- a/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
> +++ b/arch/arm/boot/dts/mt7623a-rfb-emmc.dts
> @@ -45,13 +45,13 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&key_pins_a>;
>   
> -		factory {
> +		button-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/mt7623a-rfb-nand.dts b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
> index 88d8f0b2f4c2..61f5da68d4b0 100644
> --- a/arch/arm/boot/dts/mt7623a-rfb-nand.dts
> +++ b/arch/arm/boot/dts/mt7623a-rfb-nand.dts
> @@ -45,13 +45,13 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&key_pins_a>;
>   
> -		factory {
> +		button-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index 027c1b0c6a98..5008115d2494 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -91,13 +91,13 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&key_pins_a>;
>   
> -		factory {
> +		button-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> index 1b9b9a8145a7..bf67a8e9be59 100644
> --- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> +++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> @@ -60,13 +60,13 @@ gpio-keys {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&key_pins_a>;
>   
> -		factory {
> +		button-factory {
>   			label = "factory";
>   			linux,code = <BTN_0>;
>   			gpios = <&pio 256 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 257 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/mt7629-rfb.dts b/arch/arm/boot/dts/mt7629-rfb.dts
> index eb536cbebd9b..84e14bee7235 100644
> --- a/arch/arm/boot/dts/mt7629-rfb.dts
> +++ b/arch/arm/boot/dts/mt7629-rfb.dts
> @@ -23,13 +23,13 @@ chosen {
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   
> -		reset {
> +		button-reset {
>   			label = "factory";
>   			linux,code = <KEY_RESTART>;
>   			gpios = <&pio 60 GPIO_ACTIVE_LOW>;
>   		};
>   
> -		wps {
> +		button-wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
>   			gpios = <&pio 58 GPIO_ACTIVE_LOW>;

