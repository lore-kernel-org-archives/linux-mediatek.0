Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F8C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MotCSoryy538dU4sd/kPxvSQk611e3lP3KbTp/tMf6I=; b=09lEZGCsD6HbE+slt8Kg2yEzJY
	M1wKhDwwZDwztjsIdwgQ0BOr3L8Gnm+CSnqedjn3wT1Q+zFSKjS3nw7AUaHz9NWpXCqv1BhAZyNII
	vn0WufW4+lTXJbBI5Lcnwt1M+hi1NUlFOLt86V0Xgd7TydsyLduB9td9yglhcyp0VreQVrsRQC9O1
	3Acx2OQbfZjOG2DuasumNGO/h2VtHSOR4T38/gBuz6ywB1hQuipGS0odeV4YQcVjKCDN4sd0nfn2q
	RqiZuvN2kKPujoG0VG7AxlEY2nFj3JZGqW39woJPM6SOyFEp3D9EhSTOU5oUabXfZEP5fgDrgrQQP
	8EcliDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsqA-00H43c-05; Wed, 08 Feb 2023 22:22:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPspz-00H41v-Ki; Wed, 08 Feb 2023 22:22:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id ud5so1171780ejc.4;
        Wed, 08 Feb 2023 14:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MotCSoryy538dU4sd/kPxvSQk611e3lP3KbTp/tMf6I=;
        b=WAEy0xb6CZ9HX0fSxjBWNO3YpfUlG1EC4sjqWKhhRioOTgsftejtx4dU6u0d9COCSJ
         9ZWAEYkL8/1+Fi3/S1TF2Uohgj3GCJ0X8wo900pw+vmp99WZUyPYW8DbnBp6PBTKlhrC
         0uapyTl0x2KzhcdKiKmt8wfEk4YHVlVoC8mBkwR7bal+oP/hWSx0fBHggUo3K0tKwq9T
         MpEsZFGHKVyMzshrh6eS90qdVTUg5gvU3GZ7b880+2PR/4Vxh9Z2PCDOL7kH/VtBlUs0
         JCYgOoIeAHrnpe3ySH0iGe1R8L4Tp3KmHl1CaRtjTTNpPDqqf/X5r9W6YeJ0Kbhh9rSd
         AXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MotCSoryy538dU4sd/kPxvSQk611e3lP3KbTp/tMf6I=;
        b=U2SY635tVytdEg2XnxdYvkK4PAK8/G31La5JFycvLqhc51pOeY5+AiEyaF5MzqaZqB
         x2wUy5pfc2NehAT/fwkR+4i65Ag+6eZUaHYL5mknprs/bM4na2cAaA9xQTrxGe8jceH0
         t0x6nxjg0FdU5AkLF5BexucMW5h3CPma8a96BsMUOvnrcGI/gVhuFXXAZrSJtpIjCmu7
         2ZsbqQv1l3bQJoOAnCjuMNFoSoCDWOnNCJUU5LdTn3a8aOw+hcqcSUfLqf96s+KP0ebo
         YdIo0xZqRKORa8FXi3FWiEWtY6S7KCLANekHCMX4Z/Qb49XfCSzbn1RIdjb28in46G3u
         mh8g==
X-Gm-Message-State: AO0yUKWtoBk7Igl21Yto8rCrrj3vCLTs1yP6rtEgXp0R9LUbZTlpsNJx
	svD+LTl4zz9TbZYChpKX7sM=
X-Google-Smtp-Source: AK7set+BZTkMVkd8cQ484owCwlv4swQ/ZhotrgNghCkCvzTyQSH7VGC9J9jY1hYBHyznSRGnKy9THw==
X-Received: by 2002:a17:906:3009:b0:896:427b:148 with SMTP id 9-20020a170906300900b00896427b0148mr9298998ejz.1.1675894962898;
        Wed, 08 Feb 2023 14:22:42 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f20-20020a170906c09400b00872c0bccab2sm33928ejz.35.2023.02.08.14.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 14:22:42 -0800 (PST)
Message-ID: <a021950c-f3d8-8623-4b8f-76c70751c005@gmail.com>
Date: Wed, 8 Feb 2023 23:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
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
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/3] time/sched_clock: Export sched_clock_register()
In-Reply-To: <3bbc55b8-6b12-4e81-026d-75e0c9116a7b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_142247_757083_A758AF40 
X-CRM114-Status: GOOD (  17.66  )
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
>>>>    kernel/time/sched_clock.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
>>>> index 8464c5acc913..8e49e87d1221 100644
>>>> --- a/kernel/time/sched_clock.c
>>>> +++ b/kernel/time/sched_clock.c
>>>> @@ -150,8 +150,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>>>>    	return HRTIMER_RESTART;
>>>>    }
>>>>    
>>>> -void __init
>>>> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>>> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>>
>>> Is there a non-init caller?
>>>
>>>>    {
>>>>    	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>>>>    	u32 new_mult, new_shift;
>>>> @@ -223,6 +222,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>>>    
>>>>    	pr_debug("Registered %pS as sched_clock source\n", read);
>>>>    }
>>>> +EXPORT_SYMBOL_GPL(sched_clock_register);
>>>
>>> Where is the module using it?
>>>
>>> You need to bring users of these two changes, not just prepare something
>>> for your out of tree patches.
>>>
>>
>> I'd propose to add at least one driver that will need these changes, to make it
>> clear why you need that.
> 
> ... and actually test if the system works fine when booted from such
> clocksource as a module. I have doubts that and unfortunately folks
> working on GKI like to put whatever stuff from mainline into modules
> even if it does not make sense for us (see long time ago discussion
> about pinctrl drivers).
> 

Yes thinking about it twice, it makes only sense if  the Arm architecture timer 
is running. Otherwise the system will hang on boot. I know that older MediaTek 
devices had problems with that...

