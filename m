Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF152C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=volgArQDNp89aIV3/sfnD7C0TsYamCVUUpy+P/VhzX4=; b=vp9zaFwstlGecAdVt+ASCBYfbr
	1fxUw5YqbS98VzGQfpTbFQR/5cU4/sficdvu1b+l1G9MJsB2m/9vjCNLV4f4WFEkXOsdj3JwjHej8
	h8pXAg855iQ6JZDsX+mMcpXRl22eVstLUQ+7eFKeClUbL8X01FfHwDR6nT0rXoGJv7X7Tq+aNeDrZ
	sZuj09R4NbvIrdxpzTaI0GxXereDQ5p2TM/ZE6tB4HC8LRces6oj5ZmMDOnLJpRKEmRwHjxJDEAbT
	q0Jb7vR5qdB2jplfXm6jIkhhFlr1nz5wbH0Xj9nRxEToLjZKtDgSwXlVsdvp0wSQ6hLvM6tJWisxn
	UcMq7HmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6lq-001dTb-9y; Thu, 09 Feb 2023 13:15:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6lg-001dQX-1g; Thu, 09 Feb 2023 13:15:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD22766020C4;
	Thu,  9 Feb 2023 13:15:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675948511;
	bh=flYyaBSmlEq7QSoE4eSNQuFLX6pZVzUjxjjfV61BCsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WZt3qc5nFIEl8Of9UBxnkDrj4UBlzk2nm3enY1yIp552vQwO12nsIdK5EuSLmAjvk
	 2XW+3+SV82Ud+mocxWkMI4fQ/PFMfLAY11BzxaOpjCcbDhqCUXI/SADnEGdMMhcFso
	 jTGscBo0x1BjF3q9SE8jqLwIKkGGzjPnswJbW1NxmQ3LnHnYixJ8vrI5kyRuGm9GIG
	 SqPIebDfj5+SwTvQxWe4l0pPgY3ZCJOeR2yYdSHLBc5b6+HmHTh0yc1eLZ/sTwBxpM
	 gHWGnK4Jn5AEdhn8DgtPzrC3cuK1RRZ33tkQBCKL9hXJZVNrXuW5/scdMXtgpii8AA
	 C//fgtdXaG9sQ==
Message-ID: <076e1d36-351d-ca36-dde9-50075f02d5c6@collabora.com>
Date: Thu, 9 Feb 2023 14:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] time/sched_clock: Export sched_clock_register()
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, "Maciej W . Rozycki"
 <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230208094813.20874-1-walter.chang@mediatek.com>
 <20230208094813.20874-2-walter.chang@mediatek.com>
 <e1a89a4e-8a0d-47e1-a8fd-75ea152ef816@linaro.org>
 <ad3a5c30-5062-55ae-7908-c0a127bec5ee@gmail.com>
 <3bbc55b8-6b12-4e81-026d-75e0c9116a7b@linaro.org>
 <a021950c-f3d8-8623-4b8f-76c70751c005@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a021950c-f3d8-8623-4b8f-76c70751c005@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_051516_370233_56374E52 
X-CRM114-Status: GOOD (  21.36  )
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

Il 08/02/23 23:22, Matthias Brugger ha scritto:
> 
> 
> On 08/02/2023 20:45, Krzysztof Kozlowski wrote:
>> On 08/02/2023 20:41, Matthias Brugger wrote:
>>>
>>>
>>> On 08/02/2023 15:24, Krzysztof Kozlowski wrote:
>>>> On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
>>>>> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>>>>
>>>>> clocksource driver may use sched_clock_register()
>>>>> to resigter itself as a sched_clock source.
>>>>> Export it to support building such driver
>>>>> as module, like timer-mediatek.c
>>>>>
>>>>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>>>> ---
>>>>>    kernel/time/sched_clock.c | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
>>>>> index 8464c5acc913..8e49e87d1221 100644
>>>>> --- a/kernel/time/sched_clock.c
>>>>> +++ b/kernel/time/sched_clock.c
>>>>> @@ -150,8 +150,7 @@ static enum hrtimer_restart sched_clock_poll(struct 
>>>>> hrtimer *hrt)
>>>>>        return HRTIMER_RESTART;
>>>>>    }
>>>>> -void __init
>>>>> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>>>> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>>>
>>>> Is there a non-init caller?
>>>>
>>>>>    {
>>>>>        u64 res, wrap, new_mask, new_epoch, cyc, ns;
>>>>>        u32 new_mult, new_shift;
>>>>> @@ -223,6 +222,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned 
>>>>> long rate)
>>>>>        pr_debug("Registered %pS as sched_clock source\n", read);
>>>>>    }
>>>>> +EXPORT_SYMBOL_GPL(sched_clock_register);
>>>>
>>>> Where is the module using it?
>>>>
>>>> You need to bring users of these two changes, not just prepare something
>>>> for your out of tree patches.
>>>>
>>>
>>> I'd propose to add at least one driver that will need these changes, to make it
>>> clear why you need that.
>>
>> ... and actually test if the system works fine when booted from such
>> clocksource as a module. I have doubts that and unfortunately folks
>> working on GKI like to put whatever stuff from mainline into modules
>> even if it does not make sense for us (see long time ago discussion
>> about pinctrl drivers).
>>
> 
> Yes thinking about it twice, it makes only sense if  the Arm architecture timer is 
> running. Otherwise the system will hang on boot. I know that older MediaTek devices 
> had problems with that...

I think also some very old Qualcomm SoCs have the same timer "issue" and I bet that
some others as well do.
Now, I won't argue about the benefits or drawbacks of having X, Y or Z as a module
because it's probably not the right time/place to... but!

I was trying to get my brain ticking on this one and I immediately didn't like it:
as a matter of fact, this kind of clocksources (especially the arch timer[s]) is
boot critical and that's not limited to ARM, anyway... this means that a such a
change can't be *that* easy, at all.

If you really want to register such a clocksource driver, I would suggest instead
to make an addition that allows you to do so, while *not* touching common code
paths that are called by multiple architectures and that may need those to stay
as they are for one reason or another.

*If* this kind of modularization will ever happen, it's something that must be
done slowly and again, not in one shot, especially not with one series "taking
care of 'em all". Please be careful when touching *core* code.

That was just an opinion on something that I can envision to be eventually going
wrong in many, many ways...

Regards,
Angelo

