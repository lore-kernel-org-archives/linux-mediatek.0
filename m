Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C8EC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEukjb2UHK5KqOanQB61zhcVE7DRFNm5dcKOe0eZBnI=; b=tmDQZKyvgDGZOxb1WjXdyi9Wm8
	2m8t+FWFNxI0UKGfpTPQQ4CtYOsythkxPoGz3UeZ8DdwUE1HhEh8GRyssqHn1p4WpKwsakRAvp5jb
	0GEp+pcyNoIskGJ0dgGANCIYf4cFiIIy7k1NmgJDJY/TE3bSJ+8mtOSuQ03h0/oCbA9DFNsYFZ3ge
	XRbmyD2Dp8u69/6N50tT5wWq++oF39SroPmlgDkGkNwrGHEwxBHSVp/w2Adm/c6RwPVAu4/IQPufH
	Qr3hTg3XixhkFJHmqR8Uu3nEdQTgRyQYWcC1N9xHMBUnyUlV4haUEaZ79qqbz9L+BJ9tcUs9lE5H/
	/ePiYPYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offSl-009PLy-Pl; Tue, 04 Oct 2022 10:47:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offSZ-009PI9-TW
	for linux-mediatek@lists.infradead.org; Tue, 04 Oct 2022 10:47:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id f11so18040565wrm.6
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Oct 2022 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=cEukjb2UHK5KqOanQB61zhcVE7DRFNm5dcKOe0eZBnI=;
        b=dhKSlYdYkxEW6eonWePf90D/2Wkp27oLOK/2b1lxm0GZ2l8Rbv60TIC/4og+E/LlpZ
         zE8hxUxVfxYcMGcewbLcPorJ6pTTOEf+ogZkrm+IZqcESkFi1KjcJh4jNpNGlmdA0FQ1
         vAAgBLlA1+wc8iJ6CdcCUk+jhQz8AcU2Bvn+AMdw1LGeK8jbgFajfwM+5lsDE6HSB5C6
         Xfol4ujqekdk5SSbQFqbKEJD5LdGYHO61fWF8HLwQ0OhZt0kwc5S9A9v7CDrY/qbyjhJ
         5uzHI1SzYbt5kQtrlSO9CpPwnPCvMlex+1V5jd2/gSVlRm8XEt3aca0Kq1ABqguQS+d+
         AruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cEukjb2UHK5KqOanQB61zhcVE7DRFNm5dcKOe0eZBnI=;
        b=1LOPLKdsdPW6lEHEg2aSoQEJU2DbJhXXVXVIK0wy+gbJrOEPKkgG1riWmBWjkYk8W5
         ZIchbs9hWgtLX/gT/gHRsQ/Qr1kD2vRZQu6gILNupyAqI/UQlXk4CEuc6DtViPfmiLvX
         iH2UZu9a6fkEFQfp5UfDAmrTnYtYCus5sy+PVUvLNu/6beudpNSxPaccPhwL6o9OzSgr
         nXnyvYIkoAZENC8xZw8ztBoArZqeq6FEBs2ocHPLFbmJAFCApbQyduUxj2IuKz1p2Bwd
         EPlR5XdN1esq7YYJQ2G6tP7nRA9HEeN5PQYXXKp1EOQ08LTGrVrQrtRTgWNXf7IRIqpp
         3PwA==
X-Gm-Message-State: ACrzQf2PM5uHjnwvV4gwx6piEtA6U6fLWsl2IRCnOhO5FsLRcWTa7Bx9
	Cs/4DmLnqutz8TFyWvB08DyIig==
X-Google-Smtp-Source: AMsMyM7ncqbuDxUiZMMmnbuthAQ80+V55LgaGgIxWvf/tI6EXifGRpjq/61Pu4DozeT85LYz66Jplg==
X-Received: by 2002:a05:6000:4c:b0:22e:48e0:1a0b with SMTP id k12-20020a056000004c00b0022e48e01a0bmr3105069wrx.618.1664880452067;
        Tue, 04 Oct 2022 03:47:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c456:8337:99aa:2667? ([2a05:6e02:1041:c10:c456:8337:99aa:2667])
        by smtp.googlemail.com with ESMTPSA id k18-20020a05600c1c9200b003b5054c6cd2sm25870085wms.36.2022.10.04.03.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 03:47:31 -0700 (PDT)
Message-ID: <17f3fd40-70c1-2e8d-8002-dfe9690aed88@linaro.org>
Date: Tue, 4 Oct 2022 12:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8183: disable thermal zones
 without trips.
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221004101130.17256-1-aouledameur@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221004101130.17256-1-aouledameur@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_034735_960179_19CEC892 
X-CRM114-Status: GOOD (  17.77  )
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


Hi Amjad,

On 04/10/2022 12:11, Amjad Ouled-Ameur wrote:
> Thermal zones without trip point are not registered by thermal core.
> 
> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
> only.
> 
> Disable the zones above and keep only cpu_thermal enabled.

It does not make sense to disable the thermal zones. Either the thermal 
zones are needed or they are not. Keeping them for debug purpose is not 
desired.

Alternatively to removal, you can:

  - remove 'sustainable-power'
  - add a passive trip point, optionally a hot trip point and a critical 
trip point

The passive trip point will allow the userspace to set a value in order 
to get notified about the devices temperature (writable trip point). 
The hot temperature will send a notification to userspace so it can take 
a last chance decision to drop the temperature before the critical 
temperature.

The passive trip point temperature could be a high temperature.

The mitigation is also managed from userspace as a whole.


> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 9d32871973a2..53f7a0fbaa88 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1191,6 +1191,7 @@ tzts1: tzts1 {
>   				polling-delay = <0>;
>   				thermal-sensors = <&thermal 1>;
>   				sustainable-power = <5000>;
> +				status = "disabled";
>   				trips {};
>   				cooling-maps {};
>   			};
> @@ -1200,6 +1201,7 @@ tzts2: tzts2 {
>   				polling-delay = <0>;
>   				thermal-sensors = <&thermal 2>;
>   				sustainable-power = <5000>;
> +				status = "disabled";
>   				trips {};
>   				cooling-maps {};
>   			};
> @@ -1209,6 +1211,7 @@ tzts3: tzts3 {
>   				polling-delay = <0>;
>   				thermal-sensors = <&thermal 3>;
>   				sustainable-power = <5000>;
> +				status = "disabled";
>   				trips {};
>   				cooling-maps {};
>   			};
> @@ -1218,6 +1221,7 @@ tzts4: tzts4 {
>   				polling-delay = <0>;
>   				thermal-sensors = <&thermal 4>;
>   				sustainable-power = <5000>;
> +				status = "disabled";
>   				trips {};
>   				cooling-maps {};
>   			};
> @@ -1227,6 +1231,7 @@ tzts5: tzts5 {
>   				polling-delay = <0>;
>   				thermal-sensors = <&thermal 5>;
>   				sustainable-power = <5000>;
> +				status = "disabled";
>   				trips {};
>   				cooling-maps {};
>   			};
> @@ -1236,6 +1241,7 @@ tztsABB: tztsABB {
>   				polling-delay = <0>;
>   				thermal-sensors = <&thermal 6>;
>   				sustainable-power = <5000>;
> +				status = "disabled";
>   				trips {};
>   				cooling-maps {};
>   			};


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

