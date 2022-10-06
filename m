Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9148C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbeeFZ+x3aHj+XaOJLuyuhdGWHomvDtrnGAOISq7ELg=; b=EjSJT/o9cP1p6N110U5J0Oemwl
	CdPy1WaAZECucm79Gxad0dweHrqW6JgLoJpz78vMNLGt772MasxVB5PeGdWMmTRo4kzncmSu21u2e
	qs5Daj2z2mwOIaEzl+oTiWOTC2lRCqvFA5AcsBXlI6LA8aLxwQckJhRGB/QJX1vt1AI1SDhmOWZKx
	Vk1QkgmqkS4zsN2uZAEPC4I/dvI+nGRwB5eS1VF3lRdwpTIOvyTb4PeKJfChZC1cXJyqj3VXclZ/2
	QZP/2SjALgg8/8D2dQirzh0C4k8WlCpupV36yNDJIntBcEm+y3AGKF9qHoFhHrYlmT3HyxvJyoiye
	SK+WmJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOk2-001kal-As; Thu, 06 Oct 2022 11:08:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogOjy-001kVm-LG
	for linux-mediatek@lists.infradead.org; Thu, 06 Oct 2022 11:08:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id h129-20020a1c2187000000b003c1e11f54d2so310562wmh.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Oct 2022 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbeeFZ+x3aHj+XaOJLuyuhdGWHomvDtrnGAOISq7ELg=;
        b=Ck8AReTJ9PME9fyJ5bXtOD/KlktSnDb4/OtXx1sJS7huduv7GfLAMWSXKqcIN17UF3
         R7/9ZR5n+M7+mdAm6920py5T4bhkLTORzDBj9I6CIxG5KCWswu7G7S1x119Bj+UzzPJl
         9jnWMDHTL3WMjbMDNwEFczA8NZPaJ2FObPXXb6h8xz8DBDDSIUXoPRwhWsJQ3HG5VgWm
         Avb9Kj4Ip+Jjb2+EbMMGAovxT+wEkgjSWxnw/wkEO5QwGvHYPdg3BTs3tl//OaryYvFo
         C9iHLk5rpOlH14SYUmLC0aIORmgGLquwwfnn96p5hI+L54qSvraQLI3PeV3Eq5PVcqwj
         U15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CbeeFZ+x3aHj+XaOJLuyuhdGWHomvDtrnGAOISq7ELg=;
        b=O9sLUPQpXDSlKKjp0vRV7h0vmXiAqNqx6BPg5x8hYTx6gVa2/9n0Fn4zd4HztIItXi
         1Z7+eXgf1dJdVTwKdfwxTk+4tJ5OJ7rr+s+HsXf+hIHWG5PLiNrbxXAmxfwnaYFaEC5q
         5qFzhf1WpWD6lbEX+30NlIq+pKAqEsyxYeJY5X0zSxmnq8YpyAU77jYr1h1yoIJ4pSkV
         7vuMicfYKQzssgL410qVYFs+X6wzBYuE1PSHc27vVRueftC+1a3T2ki6i1LsUEG8dEW/
         sf4n38o7xferdIWdwc+djqlX7UYn3L0s5Nsyhgi4GoAmR4yIAez8wW+4e23x5gaNYSZT
         2MTQ==
X-Gm-Message-State: ACrzQf04jgsSFjakRvzYwDh8Sjgd/6mgLy+zF/WeXLxWhYuwyUqYbNyy
	kJwxkutt2qA/fcasNk+oEDWK0A==
X-Google-Smtp-Source: AMsMyM476u1+t4iuw4iTs7clnDHL2LOAoA/r6b7hlBpiXlWfhv4Cgr5efpX+4UWm4OsdqnRY4ViAxQ==
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id fc11-20020a05600c524b00b003b48c0cf3b6mr6717571wmb.50.1665054501394;
        Thu, 06 Oct 2022 04:08:21 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0a5500b003b4e009deb2sm5928180wmq.41.2022.10.06.04.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 04:08:20 -0700 (PDT)
Message-ID: <cdebdf53-d691-41b6-bb8e-f66bb6f56e56@baylibre.com>
Date: Thu, 6 Oct 2022 13:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8183: disable thermal zones
 without trips.
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221004101130.17256-1-aouledameur@baylibre.com>
 <17f3fd40-70c1-2e8d-8002-dfe9690aed88@linaro.org>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <17f3fd40-70c1-2e8d-8002-dfe9690aed88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_040834_725478_B9C1CBB0 
X-CRM114-Status: GOOD (  24.42  )
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

Hi Daniel,

Thank you for your feedback.

On 10/4/22 12:47, Daniel Lezcano wrote:
>
> Hi Amjad,
>
> On 04/10/2022 12:11, Amjad Ouled-Ameur wrote:
>> Thermal zones without trip point are not registered by thermal core.
>>
>> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
>> only.
>>
>> Disable the zones above and keep only cpu_thermal enabled.
>
> It does not make sense to disable the thermal zones. Either the thermal zones are needed or they are not. Keeping them for debug purpose is not desired.
As Matthias Brugger mentioned in previous versions, DTS should describe the HW as it is, the sensors are in the HW.
>
> Alternatively to removal, you can:
>
>  - remove 'sustainable-power'
>  - add a passive trip point, optionally a hot trip point and a critical trip point

Why removing "sustainable-power" instead of simply disabling the device ? Especially that, if a user needs to use the sensor

in the future, they might not be able to find the right sustainable-power ; thus I think it should remain the way it is.

As to adding tripping points, MediaTek does not have ones to add for now for those sensors.


Regards,

Amjad

>
> The passive trip point will allow the userspace to set a value in order to get notified about the devices temperature (writable trip point). The hot temperature will send a notification to userspace so it can take a last chance decision to drop the temperature before the critical temperature.
>
> The passive trip point temperature could be a high temperature.
>
> The mitigation is also managed from userspace as a whole.
>
>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index 9d32871973a2..53f7a0fbaa88 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -1191,6 +1191,7 @@ tzts1: tzts1 {
>>                   polling-delay = <0>;
>>                   thermal-sensors = <&thermal 1>;
>>                   sustainable-power = <5000>;
>> +                status = "disabled";
>>                   trips {};
>>                   cooling-maps {};
>>               };
>> @@ -1200,6 +1201,7 @@ tzts2: tzts2 {
>>                   polling-delay = <0>;
>>                   thermal-sensors = <&thermal 2>;
>>                   sustainable-power = <5000>;
>> +                status = "disabled";
>>                   trips {};
>>                   cooling-maps {};
>>               };
>> @@ -1209,6 +1211,7 @@ tzts3: tzts3 {
>>                   polling-delay = <0>;
>>                   thermal-sensors = <&thermal 3>;
>>                   sustainable-power = <5000>;
>> +                status = "disabled";
>>                   trips {};
>>                   cooling-maps {};
>>               };
>> @@ -1218,6 +1221,7 @@ tzts4: tzts4 {
>>                   polling-delay = <0>;
>>                   thermal-sensors = <&thermal 4>;
>>                   sustainable-power = <5000>;
>> +                status = "disabled";
>>                   trips {};
>>                   cooling-maps {};
>>               };
>> @@ -1227,6 +1231,7 @@ tzts5: tzts5 {
>>                   polling-delay = <0>;
>>                   thermal-sensors = <&thermal 5>;
>>                   sustainable-power = <5000>;
>> +                status = "disabled";
>>                   trips {};
>>                   cooling-maps {};
>>               };
>> @@ -1236,6 +1241,7 @@ tztsABB: tztsABB {
>>                   polling-delay = <0>;
>>                   thermal-sensors = <&thermal 6>;
>>                   sustainable-power = <5000>;
>> +                status = "disabled";
>>                   trips {};
>>                   cooling-maps {};
>>               };
>
>

