Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B264C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 15:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq8yGCw5g55228TSVXqVlwEC96LSIgCuU4gj18BrnfY=; b=xV3iNhVhSOEqM8Lw6g82pi5WgF
	yrIFjyD0EkIe+FX6JDu64RQ2VT1X7bcOLYJ38c0ha8HQflnNwdNhOKPSPAMhYmfvLZMnQGo+SR/3C
	6LmXY6tESMQMRFt1yBYMn99CaHIIvzP1NST6Qlwum+Px7oYZ3nyY9Qp3l2Ai5k9ac4JCoEcF3I9LC
	PvBJt9caAkTFKPbE9a2ETTV34zzhp5sjTBMOUTSpsxcTSu/YtiyTYtuW+0rZG9V4FMa7OPxx50k8L
	8HER5k5mouvfjZHEorkNi00Ld6j05K+CMA0KaWBsFtKrgtj6JdX3ioAcoEmffFwG+NfPCHunk51fh
	+iEs4RPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8x1-002EcN-UC; Thu, 09 Feb 2023 15:35:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8wy-002EZp-Rq
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 15:35:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m14so2140154wrg.13
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tq8yGCw5g55228TSVXqVlwEC96LSIgCuU4gj18BrnfY=;
        b=tkeWbi9wJTc9MeRzDy7qt1yPzQkZQNYP6/bgOt9vpo8YMSazZ45GxT4G3k0vGuQKqG
         3VMLzYSNoYmjAfnVkuHgGePIMkbxJ9V+pc+9mwmrBS+bCkAEknjI0NXxjQ3sf8hAgtlV
         AWu2ZCfMG/1mQyG13CnD2A//AmEx1IcELAJqdb8DZJlhKZ2jRqlIwS+jBzUGX0SOrETz
         UKcs8NkqrqRP1RUE/5Ac7ABvd86WoXCLgsBxsfYWsE2oKMqvsqXkYSTG7pLArmd22aW0
         m4Isc8M48QrwUYMXDz6NGDj5kU0TySAdvfz7/hmwS7MrRNAmG4D+KKfDDWTpJwovGsY+
         ml7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq8yGCw5g55228TSVXqVlwEC96LSIgCuU4gj18BrnfY=;
        b=ikcQSRswMRDK16gF2u0uM26iVr18LQLusQTyRGJBmdC7zlcsvicnJ2mzoM1gZt8DQs
         y7ylXmudtFm4cGA2QnuQrq8i2qCfvJw6H0i5OQqfzoh+lyN4LIyuQBxD/VsCLrdwLkc6
         WHIOz/wFGgwLTaNh9Wl1p6BYMYRHih4N1IbAKFwutfAmNEplzJk7UcV66/dmGdRQSQPw
         gKIKrYt+6yoWCoeF+aCdEtJbW4gSwgswxnmEhu3NyGt9sfX1bBSy7oRvfroCzglapisY
         jPoejrK9CL34RzSOT85IRgZ5FeHe7dT7ePeQbQWEEvqzPTx8ADhsa61acuJN/oCu3H34
         EA/g==
X-Gm-Message-State: AO0yUKWvylb/8JjdNucScPMO9nFFgYkX3TYa0jM54INEIDXkKnF77C7Q
	ezLvC2O/m0yF+K6NjBPvEauicg==
X-Google-Smtp-Source: AK7set8xTgUyE+Dwtou5d4+iZUWo5Vra04tsnSr6qBKJsukN5Tl3gL04SGtgKiJb8efwj/hPHlEgpg==
X-Received: by 2002:adf:d847:0:b0:2c4:645:da29 with SMTP id k7-20020adfd847000000b002c40645da29mr4972638wrl.65.1675956899678;
        Thu, 09 Feb 2023 07:34:59 -0800 (PST)
Received: from [172.17.49.168] (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
        by smtp.googlemail.com with ESMTPSA id o26-20020a5d58da000000b002c3f1223059sm1525636wrf.36.2023.02.09.07.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 07:34:59 -0800 (PST)
Message-ID: <5821b2c6-0e50-5a75-0d11-c299e68cb200@linaro.org>
Date: Thu, 9 Feb 2023 16:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] time/sched_clock: Export sched_clock_register()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, walter.chang@mediatek.com,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230208094813.20874-1-walter.chang@mediatek.com>
 <20230208094813.20874-2-walter.chang@mediatek.com>
 <e1a89a4e-8a0d-47e1-a8fd-75ea152ef816@linaro.org>
 <ad3a5c30-5062-55ae-7908-c0a127bec5ee@gmail.com>
 <3bbc55b8-6b12-4e81-026d-75e0c9116a7b@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <3bbc55b8-6b12-4e81-026d-75e0c9116a7b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_073504_924873_7EF1C4C7 
X-CRM114-Status: GOOD (  12.86  )
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

On 08/02/2023 20:45, Krzysztof Kozlowski wrote:
> On 08/02/2023 20:41, Matthias Brugger wrote:
>>
>>
>> On 08/02/2023 15:24, Krzysztof Kozlowski wrote:
>>> On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
>>>> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>>>
>>>> clocksource driver may use sched_clock_register()
>>>> to resigter itself as a sched_clock source.
>>>> Export it to support building such driver
>>>> as module, like timer-mediatek.c
>>>>
>>>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>>> ---

[ ... ]

> ... and actually test if the system works fine when booted from such
> clocksource as a module. I have doubts that and unfortunately folks
> working on GKI like to put whatever stuff from mainline into modules
> even if it does not make sense for us (see long time ago discussion
> about pinctrl drivers).

+1

It is not the first time there is a proposal to convert the timers to 
modules. After asking, nobody came with a real study regarding the 
impact of the modularization of these drivers vs the time core framework 
and the benefit.

My gut feeling is that is not that simple.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


