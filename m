Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060BDD15D96
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L715kHuJ2J0qh5kv1BtZZ9W6S5jOOOUIIt/QySi/OX0=; b=j0lbp4DhWDtP4mmHsYJGj63ZFY
	d+quL3vXCneDuhsCVavPMU9/VqmVYYyrAZ3xfliwjuL12SbwVbie1XWKj5IlkSgqCz/lDu4s/1rba
	jo5FRI3UhOV8AFtWSZyvRk5rcvV4HVZrBJXJF9IEra6jQq5Zq6tN9+MAq3h8iOJ0KdkTHOBfmOm6c
	WrwkgEO5cJO9GyXdySiNhy0f0iNQTDtkkLk7k3/T8ZIzxGzQsLPPc9iBZfKfl6Hk8GOuP9KF18Soc
	z5pOam909XWOTSMUd2+D7VBl+gRRrIGjRss3A0VgHWyn4FzZn5FSVgM0ioInBoaykxabe6RWDZxwG
	O5kDfBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sxS-00000007Wt8-2qzY;
	Mon, 21 Oct 2024 14:00:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rdG-00000007Gdz-1blM;
	Mon, 21 Oct 2024 12:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729514132;
	bh=6yTBTh60Y/KjEm4ulMUsaCtpVhZo6wmYVFZWdN+BQcI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n3Da1lY5ifIG0HIbIKLOXX7fWP+pRg1BWcZRZRBA0JD6YqK5hFdoSwyFpOWOVAckG
	 Ym+ihkaThzCMfde6Uf795gS2HTNIUdg13wapr1dEi4km/60cbEMuTg58xuEavUX8mv
	 nBzv0/CzXTBgqb81DWbLatv69qj6pp/DtRnpTRTfLX+OpClGiuze1aW2sKwpWLnSv1
	 hTNRtiehLk9VhnTjawpFDL4wop9H2wo71NLDVYuxosiep/0d/WTbFeZsCA1WGoP1lo
	 TwCikOihlGQzZvg6rRgTk+hvi9SjNeFnHRrES8Bm/dzK/0UUVBggssjmgFovEFin3B
	 KaMZkyLWFnCxQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E17D17E3601;
	Mon, 21 Oct 2024 14:35:31 +0200 (CEST)
Message-ID: <daacbe14-b6f8-4de2-8bb1-b3db62245a66@collabora.com>
Date: Mon, 21 Oct 2024 14:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: Guenter Roeck <linux@roeck-us.net>, yassine.oudjana@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
 <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
 <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
 <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
 <WOMHLS.HLNVQWWVER5T1@gmail.com>
 <4e3545ce-5740-48b6-8c10-666548d31908@roeck-us.net>
 <ccacc376-8494-4941-a4b8-dbb4d09914ee@collabora.com>
 <14eb9404-a71c-4f8f-a808-8d3c1cf50c49@roeck-us.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <14eb9404-a71c-4f8f-a808-8d3c1cf50c49@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_053534_623157_FDB6B7C5 
X-CRM114-Status: GOOD (  47.04  )
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

Il 17/10/24 17:39, Guenter Roeck ha scritto:
> On 10/17/24 08:16, AngeloGioacchino Del Regno wrote:
>> Il 17/10/24 16:09, Guenter Roeck ha scritto:
>>> On 10/16/24 23:43, yassine.oudjana@gmail.com wrote:
>>> ...
>>>>>>
>>>>>> Say I don't want to use the watchdog (which I don't, all I need from TOPRGU 
>>>>>> is the resets, I don't care about the watchdog). Not starting the watchdog 
>>>>>> means I can't reset the system because all mtk_wdt_restart will do is make 
>>>>>> TOPRGU send me an IRQ that I have no use for.
>>>>>
>>>>> If you don't want to use the watchdog, then you don't need to care about bark
>>>>> interrupts and you don't need any mtk_wdt_restart() functionality at all :-)
>>>>
>>>> I need mtk_wdt_restart to restart my system. I shouldn't need to take off my 
>>>> phone's back cover and remove the battery every time :)
>>>>
>>>>>
>>>> I think what Guenter said makes sense. We should make sure the watchdog is 
>>>> started when calling mtk_wdt_restart or at least configured in such a way that 
>>>> we are sure it will issue a system reset.
>>>>
>>>
>>> It is more than that. There is no limitation in the watchdog API that says
>>> "you must only use the watchdog kernel driver to reset the system if the
>>> watchdog has been activated from userspace". Such a limitation would be
>>> completely arbitrary and not make any sense. It is perfectly fine to enable
>>> the watchdog from the restart callback if needed. Actually, all restart
>>> handlers in watchdog drivers have to do that if they indeed use a watchdog
>>> to reset the system.
>>>
>>> Actually, I am not entirely sure I understand what we are arguing about.
>>>
>>
>> Guenter:
>> We're arguing about bad configuration and lots of misunderstanding.
>>
>> Regarding WDT_MODE_EXRST_EN: when enabled, it enables an external output
>> reset signal - meaning that it's going to flip the state of a GPIO to active
>> (high in Yassine's case - as that's configured through WDT_MODE BIT(1) and
>> his 0x5c means that it's flipped on), signaling to another chip (usually,
>> the PMIC...!) that we want to reset the system.
>>
>> Explaining what Yassine is doing with this commit: he is flipping the IRQ_EN
>> bit [BIT(5)] in WDT_MODE.
>>
>> When bit 5 *is set*, the watchdog bark event will only raise an interrupt and
>> will not reset the system (that's left to be done to an interrupt handler in
>> the driver).
>>
>> When bit 5 *is NOT set*, the watchdog bark event will trigger a CPU reset.
>>
>> Now, my confusion came from the fact that he's trying to fix a watchdog bark
>> event so that it triggers system reset, but I didn't understand the actual
>> reason why he wants to do that - which is powering off the system!
>>
>>
>> Yassine:
>>
>> You don't *have to* rely on the watchdog to reset the system, and if you use
>> only that - especially on a smartphone - I'm mostly sure that you'll get
>> power leakage.
>>
>> Before you read the following - please note that this is platform dependent
>> so, take this with a grain of salt: it is the PMIC that should get configured
>> to take your system down! I have a hunch that this works for you only because
>> the platform will reboot, and then the bootloader will decide to turn off the
>> system for you by default (that, unless you send a warm reboot indication).
>>
>> That flow looks more like a hack than a solution for an actual problem.
>>
>>
>> Now - whether you want to fix your platform or not, this is out of the scope
>> of this commit, which is - in the end - still fixing something that is wrong.
>>
>> Effectively, as Guenter said, if the watchdog is never started, the restart
>> function is not going to reboot the system, so yes this problem needs to be
>> fixed.
>>
>> There are two problems in this driver that can be solved with:
>>   1. Disable IRQ generation when *no irq* is found in DT; and
>>   2. Implement support for reboot in mtk_wdt_isr() by reading the WDT_STA
>>      register and by then taking appropriate actions.
>>
> 
> That won't work because interrupts are likely disabled when the reset callback
> executes. The reset handler must not depend on an interrupt. It has to be
> self-contained: It has to configure the hardware to issue a reset.
> On some systems, that is done by setting the watchdog timeout to a really low value
> and enabling it. Others have a special configuration in the watchdog register set
> which triggers a reset immediately. If the hardware supports pretimeout, that would
> have to be disabled because the idea is to trigger a reset signal, not an interrupt.
> 
> To repeat, setting up the system and then waiting for an interrupt to do something
> defeats the purpose of the reset handler, which is to issue a reset signal.
> Somehow. If that can be done from an interrupt handler, it can and should be done
> immediately instead.
> 
>> Of course my preference would be N.2 because:
>>   - The pretimeout way is already supported in the driver, and if you specify
>>     a pretimeout, then the watchdog will never trigger SYSRST->XRST: this
>>     is actually a bug (IMO!!), as declaring an IRQ in DT means losing reset (!);
>>   - The WDT_STA register tells you more than just "SW/HW watchdog reset asserted"
>>     and that can be extended in the future to support more than that.
>>
>> However, I recognize that this may be too much work for you, so, if there's no
>> way for you to properly add support for N.2 - I can chime in.
>>
>> As for N.1, the solution is simple: check if platform_get_irq_optional fails
>> and - if it does - force unsetting (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN) in
>> WDT_MODE, if and only if WDT_EN is not set.. but that, in the probe function!
>>
> 
> All that should be configured in the reset handler. It has to disable interrupts
> even if there is interrupt support because that is not what is wanted at this point.
> 

Ack.
After re-reading this and thinking about it for a bit - you're definitely right.

Let's go for the setup in the reset handler then.

Though, I think that a v2 is still needed here - one patch to fix the reset handler
(at this point, with a Fixes tag for backporting..!), and one to add support for
the MT6735 resets.

Cheers,
Angelo

