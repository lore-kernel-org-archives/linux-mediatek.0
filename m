Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B407C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTsYGZzhaRMoDOgNfzuhnR52+qccmbYkM+d60yg4Y1o=; b=ND7RXtne3TmSYOIWOV7mkjbu+D
	X5qNJgexGkuy60acZw7nM4hFdGQ94CxIYhNPAmBL7AHvyLhRkYj54EKLVLlEBNkW9/bO1xOfm/W2J
	HXsyNlLXxBEWCUEVx7EIFZZbJ25r5B/9k59d1tSMvcqy6/q9gsA/Mj6HV79hVi78yKj//KLIaeaFn
	0813r9nLtDC/gGjQipNOykAUWTsnUqGlJcjpI871yfLSXJdtRIqkQrVPF4ye506ahwmGQYT5CVJs8
	Vkh/KBpM+zf+TzYiFabRF2FNul/0Dy8c+YInI9UZtitEz2rnHdn+OaOiF5IV0rnoAQBDGeAIfXzfB
	kqyMSn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYJF-008XOW-QD; Wed, 14 Sep 2022 19:44:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYYJC-008XJ5-Da
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 19:44:32 +0000
Received: by mail-wr1-x433.google.com with SMTP id bo13so10831120wrb.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 12:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YTsYGZzhaRMoDOgNfzuhnR52+qccmbYkM+d60yg4Y1o=;
        b=rc+mHPUzZAS2vaOMbc+ho7YHBG6KDEr4WTDkzwNDL0gxKp6i5o6efQIKDl8MVjCkyp
         SDdCy7XR0H1SXxE22Txl/z622N2tIr7mI4YdTIwEYE9Z1d3CoVS3404Dj1AGaLK4rTHy
         fPXLz/c5SN7bK6yuNa42AWpsuABfsCuMl+aGIsABOLYcy9IVXfGmh9ztlUefWnX81bpG
         xChKHRapSNO/RFnek90S91Lh6nm4jKMBAk812ZPbc8GM60idFsqF63UnRtL4adtHlBjt
         lhKD8sJso61h70U78ySAd/CBrFkIE4KoSTVDd944h70BZbIdFr5BmqrYyEDrCxdWBKtG
         SsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YTsYGZzhaRMoDOgNfzuhnR52+qccmbYkM+d60yg4Y1o=;
        b=GWsweFNFveA8mDaYrcj6SJhO6pWWmkf9hLf+9JaC4rwksgyuczieXN4ytQxOCUgwir
         FNblKm/lG5ooOGW8CVFRM4n1r1pGyDlRusHMvjW5TmnnnLyC5dNiOjCOPxyyXwlW46Jd
         577kYJHGNjE1w3/3mipmCtTaEO3lJfwtVDhoqFqT3GkHq3+Xev9V2E8q7Z6SNOq+HvJ/
         LxfNtmUlOdn7cigkdNsJHOqd84/8vNRx8VLNBICIuZ8xKjjdfN0g8u9GAh4iQ13Y1mDL
         j5sykfUvZ+WI+/S6u1SWRIxbGbho+ZyOzoF729YX336jqcAc+vC9aLlrZxJwVQQnMNEG
         Sb8w==
X-Gm-Message-State: ACgBeo3BSsrY/py5uFDaGOZOTYnYGJLScRQIEwRWZBbQoYKIpgUIvBMu
	bGPNdre24kreywNU1nZuV/uiyg==
X-Google-Smtp-Source: AA6agR7EL+x8pNTKbWUf5+XEsJ9MrMWoqCeAkvA4m6JWQ59HbDf/+G5IzKtN54Lh5GYaFanSNTBEGA==
X-Received: by 2002:a05:6000:1866:b0:228:e373:ad68 with SMTP id d6-20020a056000186600b00228e373ad68mr21165175wri.605.1663184666639;
        Wed, 14 Sep 2022 12:44:26 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id bi6-20020a05600c3d8600b003b339438733sm53756wmb.19.2022.09.14.12.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 12:44:25 -0700 (PDT)
Message-ID: <6e9c94e7-3f0b-83bd-b419-db6c002f7d98@baylibre.com>
Date: Wed, 14 Sep 2022 21:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: remove thermal zones
 without trips.
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220914131339.18348-1-aouledameur@baylibre.com>
 <a8af4c54-12a2-a314-f190-f12859ef4ddd@gmail.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <a8af4c54-12a2-a314-f190-f12859ef4ddd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_124430_464157_152DB21E 
X-CRM114-Status: GOOD (  17.21  )
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

Hi Matthias,

Thank you for your review.

On 9/14/22 16:15, Matthias Brugger wrote:
>
>
> On 14/09/2022 15:13, Amjad Ouled-Ameur wrote:
>> Thermal zones without trip point are not registered by thermal core.
>>
>> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
>> only but are not supposed to remain on DT.
>>
>> Remove the zones above and keep only cpu_thermal.
>>
>
> My understanding is that this thermal zones exist but are not used. 
> DTS should describe the HW as it is, so I propose to add
> status = "disabled";
> to the zones.
>
Correct, they are unused unless for testing purposes. Thus, your 
suggestion of disabling them seems more relevant

than removal.


Regards,

Amjad

> Regards,
> Matthias
>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 57 ------------------------
>>   1 file changed, 57 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index 9d32871973a2..f65fae8939de 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -1182,63 +1182,6 @@ THERMAL_NO_LIMIT
>>                       };
>>                   };
>>               };
>> -
>> -            /* The tzts1 ~ tzts6 don't need to polling */
>> -            /* The tzts1 ~ tzts6 don't need to thermal throttle */
>> -
>> -            tzts1: tzts1 {
>> -                polling-delay-passive = <0>;
>> -                polling-delay = <0>;
>> -                thermal-sensors = <&thermal 1>;
>> -                sustainable-power = <5000>;
>> -                trips {};
>> -                cooling-maps {};
>> -            };
>> -
>> -            tzts2: tzts2 {
>> -                polling-delay-passive = <0>;
>> -                polling-delay = <0>;
>> -                thermal-sensors = <&thermal 2>;
>> -                sustainable-power = <5000>;
>> -                trips {};
>> -                cooling-maps {};
>> -            };
>> -
>> -            tzts3: tzts3 {
>> -                polling-delay-passive = <0>;
>> -                polling-delay = <0>;
>> -                thermal-sensors = <&thermal 3>;
>> -                sustainable-power = <5000>;
>> -                trips {};
>> -                cooling-maps {};
>> -            };
>> -
>> -            tzts4: tzts4 {
>> -                polling-delay-passive = <0>;
>> -                polling-delay = <0>;
>> -                thermal-sensors = <&thermal 4>;
>> -                sustainable-power = <5000>;
>> -                trips {};
>> -                cooling-maps {};
>> -            };
>> -
>> -            tzts5: tzts5 {
>> -                polling-delay-passive = <0>;
>> -                polling-delay = <0>;
>> -                thermal-sensors = <&thermal 5>;
>> -                sustainable-power = <5000>;
>> -                trips {};
>> -                cooling-maps {};
>> -            };
>> -
>> -            tztsABB: tztsABB {
>> -                polling-delay-passive = <0>;
>> -                polling-delay = <0>;
>> -                thermal-sensors = <&thermal 6>;
>> -                sustainable-power = <5000>;
>> -                trips {};
>> -                cooling-maps {};
>> -            };
>>           };
>>             pwm0: pwm@1100e000 {

