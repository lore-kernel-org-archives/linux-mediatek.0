Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2764DECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DS/dB1Z8F2XdEan+7+v8LqVABBrY3Wgrn6yGpXksSnc=; b=WG2Rtw7c1of7Q+3Wh4IAqndNxm
	36Aa1VgjgK1g1kFVx5O70XhydVvuk+c7dUXayaZ4h5cDZyONjZkwEaVMpxS22CYTkH9BfCjiYLRU0
	Cyed8QSB8kB8+DoEeW0VeqGRS+qPh4Xby+YmrG+YS9Vowwyk7kXBHOm/lUlRxlYkOOtCx94tbp5w0
	dC/r1Js+Pn0MZfnRNACGIHkbaqrSUubixLsPtIcjlkm+CmICbtHJ6UTjjnxNAjMIIWEVPz0uFPGxD
	+VGtcRvPpe2gUontfbXcGepqXMXYXbwEhdbEm3aSfJJReWuzrBMdBQtJoYhTYzWAXIG2biPhs47pe
	qR1f7Veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSI4-000fWm-V9; Wed, 14 Sep 2022 13:18:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSHg-000f3Z-EU
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 13:18:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id bg5-20020a05600c3c8500b003a7b6ae4eb2so15475911wmb.4
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DS/dB1Z8F2XdEan+7+v8LqVABBrY3Wgrn6yGpXksSnc=;
        b=U3uQB5mdqAWulEk/fX6kGrPUKTRAaJXxtaOqKnZAK5Ttyefxo59iAwEwEq8JOs8iDO
         8bg+Va6JCMlpApltHBGInErDhsVO/awvtfjGuzGNSlwI02Q0ktap8u/XuljHFlumrxPW
         VLi5lh1mJys7EZxxZ/Nr7IES8Ir9goTJkdpzG2VjdnfSsdSNGhvpbQErQ+qsVh2WkQMu
         oaXx1T8Y9JtzepZG8kPn4V5SP9bnXVKSbygKNW6mTmPEfC/OREA9Im1NSxl4L7Dm0UWf
         wTkmIKou80/6UwkmnHY8AJxZTKgznM7FrmL6CVqn1JYMegf1VFmsHppG76zsL+OL9EMb
         yS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DS/dB1Z8F2XdEan+7+v8LqVABBrY3Wgrn6yGpXksSnc=;
        b=vrSSEEywA/LbPjp6pXZXphz9IDYvwp4w6dCLssfgxrzW95OlyqPPJApWloASHW+Jp8
         PcldKgCq3eRU6WhUS0sQTwnLXnSmCNcO4UELK83wgwsCmnuWIHLspkuuuV8Fsu1jWLeL
         gId38WDHAacBDhp8BeqWpTkXOgKw/iZkkFATNoicdRzvlRd+RssOv36LVsJHNsflXo7z
         PW/qB/oQprmXOzQjuUQN9GgT2dYcNglIhdDubP2FUB+yGU1cVk2RMs54ejfQQUmZqb0t
         4a2PLfUIiwiAB88gtGdva/36rdf5qE2J801C3YlRmgiEr+AOYkbk4pRxgzVa5V3QJ13R
         lmEA==
X-Gm-Message-State: ACgBeo25VUXUENgOUbgeJhbJ9zhlpjH/Qn9rT3ZQAEW2fCMPm+zLNTRZ
	b96dUcWoyk9yv+GUn1LU5gGPWQ==
X-Google-Smtp-Source: AA6agR4grufWg+c3qXZKBLUKABCRUYDpCsb6qvLVWtV85cOL2R6YF4TAyyUjumc/HzIXaQ4ecB7u6w==
X-Received: by 2002:a05:600c:1ca8:b0:3b4:a5d1:2033 with SMTP id k40-20020a05600c1ca800b003b4a5d12033mr1741290wms.23.1663161510097;
        Wed, 14 Sep 2022 06:18:30 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c038a00b003b2878b9e0dsm16599554wmd.20.2022.09.14.06.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 06:18:29 -0700 (PDT)
Message-ID: <fda72ade-3c47-e9f8-d041-3a87d55318aa@baylibre.com>
Date: Wed, 14 Sep 2022 15:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re:
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220914131219.18236-1-aouledameur@baylibre.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <20220914131219.18236-1-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_061832_531684_E3031EC3 
X-CRM114-Status: GOOD (  16.94  )
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

Hi,

The subject has not been parsed correctly, I resent a proper patch here:

https://patchwork.kernel.org/project/linux-mediatek/patch/20220914131339.18348-1-aouledameur@baylibre.com/


Sorry for the noise.

Regards,

Amjad

On 9/14/22 15:12, Amjad Ouled-Ameur wrote:
> Subject: [PATCH] arm64: dts: mediatek: mt8183: remove thermal zones without
>   trips.
>
> Thermal zones without trip point are not registered by thermal core.
>
> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
> only but are not supposed to remain on DT.
>
> Remove the zones above and keep only cpu_thermal.
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 57 ------------------------
>   1 file changed, 57 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 9d32871973a2..f65fae8939de 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1182,63 +1182,6 @@ THERMAL_NO_LIMIT
>   					};
>   				};
>   			};
> -
> -			/* The tzts1 ~ tzts6 don't need to polling */
> -			/* The tzts1 ~ tzts6 don't need to thermal throttle */
> -
> -			tzts1: tzts1 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 1>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tzts2: tzts2 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 2>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tzts3: tzts3 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 3>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tzts4: tzts4 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 4>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tzts5: tzts5 {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 5>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
> -
> -			tztsABB: tztsABB {
> -				polling-delay-passive = <0>;
> -				polling-delay = <0>;
> -				thermal-sensors = <&thermal 6>;
> -				sustainable-power = <5000>;
> -				trips {};
> -				cooling-maps {};
> -			};
>   		};
>   
>   		pwm0: pwm@1100e000 {

