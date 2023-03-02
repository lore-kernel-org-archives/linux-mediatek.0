Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C116CC678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 11:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti6yggdPsNOIPGXfO2UGItrftMezYx+P9sftKU+qmUA=; b=rQnF2N5eLXyooAzqEio+OUFWrY
	t+I2xbG6WswS9q8uQBC1YGjWqcaA6Q6OlKpx+rfE2Ga/LPhiEdfVbFSLTwmBYuMkxD/xFXda10Hd7
	osPfsTVV85mxckOw5CwplZVA1Con68yJNV8vbnLglGKVF3o3J0D8GO0AN0KaH+xT+atES0HxYFait
	ePc2qbl3xhGpuU17VTLVqqcLF8kyiMMyaDmLJ9/Q+dOzION+r+RrN1O1oSp1Sxk9vsG/SFOVT0p5u
	A5XK54QvEFlVkztvp267Soo7UvDUrhSt4m3D/If4KQ7pZvo7IcMRXHMfyYcKGnZja99FGo9h+y3vW
	Nr+T3v/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgmD-001pZa-6T; Thu, 02 Mar 2023 11:07:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgm9-001pUb-PS; Thu, 02 Mar 2023 11:07:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id p26so10409362wmc.4;
        Thu, 02 Mar 2023 03:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677755222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ti6yggdPsNOIPGXfO2UGItrftMezYx+P9sftKU+qmUA=;
        b=ogeMmyPlp+ux1bh8ePIj9tjnZ9OyV99vPTnFYiv+uMZwKp5HtnUJJD7gO/h+KuGXgQ
         2qmTHQ2hh+O+VSWueO+T7XjElqQ8akIKpBV56Veov8Wd71Z+16tONPex+tKsIPJcrBG5
         MP0kiNPjjBde5dP0I42a4o7ExYcnChE8yymqJXpmfPOkM/HKZAnIFlYFW5ln7OvFZ14g
         cHErnwIj2YCLCdzOrX9AO8QGYgKR0qY87WOU2XrWw9NRDBygTv2g2xdGY4cQwSKYMZTs
         LEr8W1eVVoxkXNeMZFPN44AiE35J8kNMVduu90IP38nc0tJ9Vy/FVZtMpQhJasOf517d
         yoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677755222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ti6yggdPsNOIPGXfO2UGItrftMezYx+P9sftKU+qmUA=;
        b=vZ1EEmcRRpExrZR6oJs06CM4GZfspH6BtfHpSibZTIwCxBQtk5V0v2onnF+gwrj0wO
         YMyCuN6API4KGHyry+ldvEHOjnHg7BdF+h1QRGvoQ5QEX4bj2maVgYzzCAPbeMPLz5jG
         eY8u9sboibAtsT0Dev24s6YYqJ1vl+j8ZktlGxUQUm95GvG2nMVz9eIkcrrJsJeH4V4M
         qz6x4ImFq6VtH1sa318brc24ceGK3G3wZAXmGhPp8cn0vtS4rGNoqmQwsDGVaOU0+6+c
         2b2b1SNuC0qifMBXYLRPxB/HZLbvJMgdt4JRMKAJHCz50SLGWWgfZAjW0yBfsHq8q8jQ
         3M+w==
X-Gm-Message-State: AO0yUKX9uVyKNGgatOnTMo3oYp74h/ipGV4z0lpnmeVbSAPWK29eDw+Z
	9mT9H/XdNjzyy9Z4jRzc51otJJThzItDXg==
X-Google-Smtp-Source: AK7set+yVpXtDFapduhsB0nccsgHCdavaSYmvTKCXeQKdTLPsNpVFb/bbrhQF8nu1ZSwpum2tkVRQw==
X-Received: by 2002:a05:600c:1894:b0:3e1:fc61:e0e5 with SMTP id x20-20020a05600c189400b003e1fc61e0e5mr7220130wmp.33.1677755221954;
        Thu, 02 Mar 2023 03:07:01 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u9-20020a5d5149000000b002c54c92e125sm15122249wrt.46.2023.03.02.03.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 03:07:01 -0800 (PST)
Message-ID: <380b32fc-6e9b-6f7d-e8ff-063346ee1d27@gmail.com>
Date: Thu, 2 Mar 2023 12:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 3/4] arm64: dts: mt8195: Align vppsys node to dtschema
Content-Language: en-US
To: matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
 <20230209160357.19307-3-matthias.bgg@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230209160357.19307-3-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_030705_877311_5590E25A 
X-CRM114-Status: GOOD (  17.38  )
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



On 09/02/2023 17:03, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> As the node is a syscon, this has to be reflected in the compatible and
> the node name.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

A similar patch is already in v6.3-tmp/dts64:
168136cbef9c ("arm64: dts: mediatek: mt8195: add MMSYS configuration for VPPSYS")

I'll drop this one as well.
My bad, I should have noticed that earlier.

Regards,
Matthias

> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 8f1264d5290bf..5261367031426 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1795,8 +1795,8 @@ mfgcfg: clock-controller@13fbf000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		vppsys0: clock-controller@14000000 {
> -			compatible = "mediatek,mt8195-vppsys0";
> +		vppsys0: syscon@14000000 {
> +			compatible = "mediatek,mt8195-vppsys0", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
>   			#clock-cells = <1>;
>   		};
> @@ -1900,8 +1900,8 @@ larb8: larb@14e05000 {
>   			power-domains = <&spm MT8195_POWER_DOMAIN_WPESYS>;
>   		};
>   
> -		vppsys1: clock-controller@14f00000 {
> -			compatible = "mediatek,mt8195-vppsys1";
> +		vppsys1: syscon@14f00000 {
> +			compatible = "mediatek,mt8195-vppsys1", "syscon";
>   			reg = <0 0x14f00000 0 0x1000>;
>   			#clock-cells = <1>;
>   		};

