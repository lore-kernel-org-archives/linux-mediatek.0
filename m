Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43354C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHO5Ul87Q3Yggb9Cai4nZKcEcr34Oj9dQ4NY589NOoY=; b=OrOa36pK0fDBz79hp6SnGHYmJR
	tVoCqVCyR+C/22lKM5xfDjqTO6OWy7rMEjZpvsgypohQei3jM2cGWDeqTpZdTYIEves5htwyeaqix
	xayCEXVnNkTm4O7yhRExYo6bfZ+4IEgmp3qdS4QIbYH8AdejbsAPtvNdgib3xA7X2NXUMloIgqJax
	ACj3AxKukKsf6NaXQA9jzAoPEZz5ru08b2KfQG0y2ntUiB9z6WfujlxLpiy3bQLyQWAs79FoWDYHQ
	UrIodIrO+CgZwO6gWLxqwPKdMasu6ZK0KXX7l+pr3BoL32VzjILqGVYSRPcjXqrKZ4bayZz4ivmZN
	8BYIIwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScZ7-009y2t-Fi; Thu, 16 Feb 2023 11:36:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScYw-009xxq-5Y; Thu, 16 Feb 2023 11:36:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EAFB66021A4;
	Thu, 16 Feb 2023 11:36:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676547384;
	bh=G9BSho1GnSatqIudITCrmTSdqPkXYOoJFWUkVyjCuWc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MyUu8FB94A0Xm90zVQgHmFH4gauMLWTbAaktc57qXymFPjpzpP3wCNXtNnX+wKuPI
	 agAo7XMul4fd6z9GjzVyIiH8GPrkiYBmgVWOhJ99+ozzkjWcSjaDMmj2aUenx87HVN
	 6UL6RZ1vexo2EIPuzdTMuEAQ/bP+B2+uBSdxp5ShFlABvfsAZTw7GFmBAGLqpBkhpW
	 FfEI/QX5s87okEdjpO778JFQxKnLBw0S6LNxu92JJbLQDHcxf4Kz9ooDHUkat3P3wP
	 FfCoh2tbfor/X/7zza8KgpvPepEHyhHdUc7LHOJVmBmY1Ju7rLaWHxXxKElUnQzVD3
	 qlRdpXBCcUS6Q==
Message-ID: <26c100f2-bf31-7212-5d13-25b6b14b8f61@collabora.com>
Date: Thu, 16 Feb 2023 12:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, "Maciej W . Rozycki"
 <macro@orcam.me.uk>, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com>
 <20230214222021.k3tsfwezhnh7tdlx@bogus>
 <996b4e61-8486-d939-7367-1240b3c5c5fa@collabora.com>
 <20230215131849.mcgz53jf24atialp@bogus>
 <53f0e612-b5cc-262e-df98-add1e8a06573@collabora.com>
 <20230215144627.ddjc7x365qdnhymi@bogus>
 <7ac030be-8b5e-d190-6676-8cea9cdc1915@collabora.com>
 <96d6f405-22bc-f112-2c88-76da280eed46@gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <96d6f405-22bc-f112-2c88-76da280eed46@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_033630_495296_A5D38C6C 
X-CRM114-Status: GOOD (  33.73  )
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

Il 16/02/23 12:23, Matthias Brugger ha scritto:
> 
> 
> On 16/02/2023 11:22, AngeloGioacchino Del Regno wrote:
>> Il 15/02/23 15:46, Sudeep Holla ha scritto:
>>> On Wed, Feb 15, 2023 at 02:30:51PM +0100, AngeloGioacchino Del Regno wrote:
>>>>
>>>> Both. I mean that these platforms do have architected timers, but they are stopped
>>>> before the bootloader jumps to the kernel, or they are never started at all.
>>>>
>>>> Please refer to:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/clocksource/timer-mediatek.c?h=next-20230215&id=327e93cf9a59b0d04eb3a31a7fdbf0f11cf13ecb
>>>>
>>>> For a nice explanation.
>>>>
>>>
>>> Thanks for that. Well then I see no point in making these modules if you
>>> can't have generic Image that boots on all the platform. I now tend to think
>>> that these are made modules just because GKI demands and it *might* work
>>> on one or 2 platforms. One we move this as modules, how will be know the
>>> Image without these timers or with them built as modules will boot or not
>>> on a given mediatek platform. Sorry, I initially saw some point in making
>>> these timers as modules but if they are required for boot on some systems
>>> then I see no point. So if that is the case, NACK for these as it just
>>> creates more confusion after these are merged as why some Images or
>>> even why defconfig image(if we push the config change as well) is not
>>> booting on these platforms.
>>>
>>> It is no longer just for system timer useful in low power CPU idle states
>>> as I initial thought.
>>>
>>
>> I think that there is still a point in modularization for this driver and I
>> can propose a rather simple solution, even though this may add some, rather
>> little, code duplication to the mix.
>>
>> The platforms that I've described (like mt6795) need the system timer to be
>> initialized as early as possible - that's true - but that timer is always
>> "CPUXGPT".
>>
>> On those platforms, you *still* have multiple timers:
>>   - CPUX (short for cpuxgpt), used only as system timer;
>>   - SYST, as another system timer implementation (additional timers) but
>>     those are always initialized (AFAIK) from the bootloader before booting;
>>   - GPT (General Purpose Timer).
>>
>> On one SoC, you may have:
>>   - CPUX *and* SYST
>>   - CPUX *and* GPT
>>   - CPUX *and* SYST *and* GPT
>>
>> ... where the only one that is boot critical and needs to be initialized early
>> is always only CPUX.
>>
>> Hence this proposal: to still allow modularization of timers on MediaTek platforms,
>> we could eventually split the CPUX as a separated driver that *cannot be*, due to
>> the previously explained constraints, compiled as module, hence always built-in,
>> from a timer-mediatek driver that could be a module and capable of handling only
>> SYST and GPT timers.
>>
>> In that case, we'd hence have...
>>   - timer-mediatek-cpux.o (bool)
>>   - timer-mediatek.c (tristate)
>>
>> Counting that the CPUX timers are actually even using different `tick_resume`
>> and `set_state_shutdown` callbacks (doing only a IRQ clear/restore and nothing
>> else), the amount of duplication would be .. well, again, minimal, but then
>> this means that timer-mediatek-cpux would be `default y if ARCH_MEDIATEK`, or
>> even selected by ARCH_MEDIATEK itself.
>>
>> If you think that this could be a good solution, I can send a "fast" patch to
>> split it out, preparing the ground for the people doing this module work.
>>
>> Any considerations?
>>
> 
> I think your proposal sounds acceptable, but we would need to make sure that all 
> SoCs can boot with the CPUX driver. I'm aware of some armv7 SoCs that use a kind of 
> hack to enable the architecture timer [1]. This, for one part, should be moved to 
> CPUX, if possible. For the other part it makes me wonder if really all supported 
> MediaTek platforms will boot with SYST/GPT being a module. I think we will need 
> some effort from the community to test that.
> 
> So as a resume, yes I think your approach is feasible but we should collect 
> tested-by tags before merging it.
> 
> Regards,
> Matthias
> 
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/mach-mediatek/mediatek.c?h=v6.2-rc8#n16

Right. I completely forgot about those platforms, even though my intention was
to actually try and migrate them once the CPUX was picked. My bad.

Well, I think that this module conversion will take quite a while, so there
should be no need to rush... I'll send a series later with the split *and* a
conversion of those platforms, so that we will see a removal of that
mediatek_timer_init() function.

Some encouraging words ahead: I'm totally confident that the conversion will
Just Work, because the MT6795 SoC had the same handling for CPUXGPT as the
older MT6589/7623/8127/8135... as that SoC had two implementations initially,
one as ARM, one as ARM64.

Whatever - let's see what I can come up with, then.

Cheers,
Angelo

