Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73A0ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 15:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTa1pbTVMPJ1tf0fbIJm6r4QEWbV/1sWEH4W85gfxdA=; b=4mFUEEk1cFVEKjg70KsXbgL6b8
	euH9TvvHmV2EUPyspcD7JSkC0anU//AvJ/cH0E4WCad2skrDBGLAsmu3PZuHV4+Pg/o46qwrSnJjh
	bTQZwsj1rVbWf9j5jk4Ul0OzAxZf5q4sU9fq8sEuiXNwz9SqRhJy7+ndMfgruqUP/khU6EJZSHLLc
	8C0ZziYpejHa5v49xl3rj3wiQDOlARwJGWiaGAqHxFYtd/6O8HzG1sc6f0kqdSBa9IMs6F7lAMVEG
	coBbkugIyZOuPpcNJRTmZB2So/Zhn5/74mtYTFaJSjtkBeLb38YjYoq0MjOev9K033kAYC6DPoRE4
	C85eMOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaezd-004nYx-6q; Tue, 20 Sep 2022 15:17:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeza-004nWN-8L
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 15:17:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r7so4880344wrm.2
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sTa1pbTVMPJ1tf0fbIJm6r4QEWbV/1sWEH4W85gfxdA=;
        b=Y0I8B2b3LP+wzBoIwffHFhR8WfPrSkke8bPxBfdpa1N8AqQnjtUb7c4CmtN24qDDhp
         qdL9Uud2I30izEuKxHpDkDIvQsHjjHSigXA8ob2zyPlsjdSDJEqyqPpzLn28QvWSy7KL
         qQeFNIl2oWaknO+UzEWzpGs+d8ZNb2Cx/uKizP1/tOe+EHQFl93J0S8U18g/IvP7Y7F4
         d6f4YSPMFnQYjUgtnRkeGD7bo7q0GU0CxKxamfwit1fq15nkLEYURNwTzCI/sJHwioVE
         98Z217tzwyEGW4GGj3HG0mcmrgh37N5Ne8Nwz9cTvOGRaCoWzT7R1EwI6zs2gdSg2djQ
         KQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sTa1pbTVMPJ1tf0fbIJm6r4QEWbV/1sWEH4W85gfxdA=;
        b=6erkXWBplzrHqWtzkCdQ+LdGjgimyPNuW8GQTyFIteipCfKeqIB5/Zqu9qewMoLk6B
         vLyleb5P1zXGOaqDT/pOlmkDl27Jl3JMSq091ardLkL+vnxnZRYHBTtOTVXfvvXqOLCf
         PiD/UzQJM9YJVmb8FiaacirDr+qW7JuRqYenQcbxq907wil7aXMO05Tl2FBQCgY/mQfH
         qDs3tj/rUQkMt1sPrE4L7B+52GJuBUJ/0KCCki+8ay8P5Sm2RVg9ZxlGXNE2C6AyK9JT
         86DncLDkUUHLszdW6/mwrYAIRiVzWaclv1Rfg4oBoUD3Wl6Aopx37X8Bh7BqeACaWjDm
         E5EA==
X-Gm-Message-State: ACrzQf0fgKILpYOu1ZKcD2AnNA+2RfAM9VReK1Ig1Lao5ct9EYejMND8
	4FdNUMgm13KicP3maysvsT3mgg==
X-Google-Smtp-Source: AMsMyM4CnxN9VS5xftyuGqfVz/42sP79DDIp25KA4140PE5NmZBRvjW0ASBqI2gKS8NFBNgL+mI2tQ==
X-Received: by 2002:a5d:6d46:0:b0:21f:8b7:4c1d with SMTP id k6-20020a5d6d46000000b0021f08b74c1dmr14533501wri.455.1663687016603;
        Tue, 20 Sep 2022 08:16:56 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id cc16-20020a5d5c10000000b0021e4829d359sm40298wrb.39.2022.09.20.08.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:16:56 -0700 (PDT)
Message-ID: <bf4d4cdf-27a1-7e09-59dc-25a8646fad1f@baylibre.com>
Date: Tue, 20 Sep 2022 17:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: remove thermal zones
 without trips.
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220914131339.18348-1-aouledameur@baylibre.com>
 <a8af4c54-12a2-a314-f190-f12859ef4ddd@gmail.com>
 <ca326ce8-3eee-8a7a-a522-9ffbdf7d8a82@linaro.org>
Content-Language: en-US
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <ca326ce8-3eee-8a7a-a522-9ffbdf7d8a82@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_081658_332370_2803FBAB 
X-CRM114-Status: GOOD (  13.21  )
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

On 9/15/22 17:50, Daniel Lezcano wrote:
> On 14/09/2022 16:15, Matthias Brugger wrote:
>>
>>
>> On 14/09/2022 15:13, Amjad Ouled-Ameur wrote:
>>> Thermal zones without trip point are not registered by thermal core.
>>>
>>> tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
>>> only but are not supposed to remain on DT.
>>>
>>> Remove the zones above and keep only cpu_thermal.
>>>
>>
>> My understanding is that this thermal zones exist but are not used. 
>> DTS should describe the HW as it is, so I propose to add
>> status = "disabled";
>> to the zones.
>>
>
> At least the trip points must be declared as stated in the bindings
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/thermal/thermal-zones.yaml#n213 
>
>
In the base case we should but there are no trip points for these 
sensors according to MediaTek.


Regards,

Amjad


