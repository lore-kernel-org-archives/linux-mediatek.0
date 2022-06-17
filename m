Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1781DCCA479
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiGd/G18mnXfAnwyT/vN2yw57fx/1UEELfONJBgsPiU=; b=OY0hWJFE9pi3HPQGlr2Hqhl/5z
	bC08ZjBSFCfzjOEO5mgBg1Ryd3v0YUdIjzE7Hsp+DxorrYY495hKT6FtxFgNAcL0qONkEkPVMkj8R
	szVmhFJtwxNO56CgIou/FIhFdJzOwlelLDWExgD1JElRAolMMJNc5Yb2moozS120W0bEQ23s1SEUt
	3Ss+1JSBmGBhYnbz4+v7BkA1HO6oGecM3HzKR8bEKnxT1gn9amZGA/LUb0vFS6iXD94iM4k+J3/s6
	tbaW0lQkSNzDf+6wbXn0LC1OYBt/K/Bhpx9OoX24ISsVyCopkit2cBdVRaJmqAjV9yTKx9Bcgtwea
	qok3P61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29Sz-0071IG-Dw; Fri, 17 Jun 2022 10:44:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29SC-0070rJ-GO; Fri, 17 Jun 2022 10:43:54 +0000
Received: by mail-ej1-x62a.google.com with SMTP id h23so7963688ejj.12;
        Fri, 17 Jun 2022 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=AiGd/G18mnXfAnwyT/vN2yw57fx/1UEELfONJBgsPiU=;
        b=VJGDBaLwKCaTN0E3YXVF9jHgxLrlNG7667EGq4tM8lH0Jj5v9IeJ8Bp5VWKq5NMyYb
         5iMXOXz2KivIOmNkOxjk4YgJL5l3L9HKBsazeqCv8lVt/dcBtU8qfDqfmHEQZZQdetrq
         97mTgq9S+mBB4iprd0LRRQxKEmQGn6d9auRVXTdQ3HImBt3EiTBui/aJIK98KA5pph6p
         OZNU0KgucPKhFX8qM53dhe3LQUOFyJCpS/tcexfirlbNPevl5K7UwUwf92nmrtSCtUHL
         t+BKrJoviExSkCSNDQLMaY3h82RHo66dvs7SjNMGC6SKbB9SZexPspyWcaBwwm7yTdJ/
         UKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AiGd/G18mnXfAnwyT/vN2yw57fx/1UEELfONJBgsPiU=;
        b=PsvX+Iwhfe4hmMMnAcpO0PwJ0qgKWO2wCRUzAKM1nN+WKj37FKV8GO87+N0njSiZPA
         dEB2GhKSmhgl50dsHiJzizxG2DcWSp0+yVEYIlkU5ZYMwLocbkFII4B3P0cZoM+x4eFp
         v8Y06sZou2fuAu5SlkqGYkrAZQpPxLh/8q30RzEW9qpAzCYHOWhfnxWsdX6ktqt8o+OX
         87jGzdsKJDqCKZ2ZEeCg6FKc23pOwfI1klbrfsSmTXYZMrS20CFGoymn6ZzdaXHzxot1
         Bt2nb5VwFEouCXtWJl1eMNung6VhivSJUbl8Qp7RTXudba3zpNlRj6NP/u8E0wTnw3wL
         5OzA==
X-Gm-Message-State: AJIora/vCSMBvpJNMD4ni2nauf773C7Y0aZQbyq20Ct/mw9FZbt6B+ps
	46pz639Em6s3PxOqqFutjjQ=
X-Google-Smtp-Source: AGRyM1u5wVHvSt+IqLZK0au6HLE1grAgjeBZEKVVVQaH/p4dMq24y0opu3PhRSo42Jyp+s1jT4scDg==
X-Received: by 2002:a17:906:7a57:b0:711:faf1:587d with SMTP id i23-20020a1709067a5700b00711faf1587dmr8328834ejo.581.1655462628898;
        Fri, 17 Jun 2022 03:43:48 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id i24-20020a05640200d800b0042dcac2afc6sm3425003edu.72.2022.06.17.03.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:43:47 -0700 (PDT)
Message-ID: <8f9d7850-fe31-41b3-cded-63a020356e13@gmail.com>
Date: Fri, 17 Jun 2022 12:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 16/40] arm64: dts: mediatek: mt7622-bananapi-bpi-r64:
 align led node names with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-16-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616005333.18491-16-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_034352_639802_1834C30E 
X-CRM114-Status: GOOD (  13.97  )
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
> with 'led'.  Use generic color properties instead of the node name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index c2311733d2de..7d1ecf72a6c3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -8,6 +8,7 @@
>   /dts-v1/;
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>   
>   #include "mt7622.dtsi"
>   #include "mt6380.dtsi"
> @@ -56,14 +57,16 @@ wps-key {
>   	leds {
>   		compatible = "gpio-leds";
>   
> -		green {
> +		led-0 {
>   			label = "bpi-r64:pio:green";
> +			color = <LED_COLOR_ID_GREEN>;
>   			gpios = <&pio 89 GPIO_ACTIVE_HIGH>;
>   			default-state = "off";
>   		};
>   
> -		red {
> +		led-1 {
>   			label = "bpi-r64:pio:red";
> +			color = <LED_COLOR_ID_RED>;
>   			gpios = <&pio 88 GPIO_ACTIVE_HIGH>;
>   			default-state = "off";
>   		};

