Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozvBE78DwpjHRRiZgEhYFOFa+M0+9TCScXnm71+Nnto=; b=hfpVb3kEXLyzhG
	BIvi+DiuVRVrrii+VV0Rd2DAPGx016RYcfi8e0e1qww2jO59fxOCCcjIcQNsDBuAwpZET4ER8kowQ
	2HjKUDJrdD/Hbw3YLQGXTeHrbUylG0k+r81ldaEVUFTcvQPLbWsI/SOkjgCoeWhDD+2jRvi8v1D+t
	UbTFkgRUI+/e8v9Hb9+ExVOYRetj1yPCfpVb0o0f6WBAJN7A1SBSzzzGVxwHSK/VJFasJ+9TIbMDO
	5m/c1NvKcoZbQg35nZ3d6budgSzfi/sJp9gnaHLN5oxjH6aRcUzfpzor1FpQlu6cdFIQoA918kGeo
	JgUEmnxkKAdV9a/5UtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqW8g-006fLj-4x; Mon, 16 May 2022 08:31:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqW8R-006fDl-7O; Mon, 16 May 2022 08:31:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6E5C21F427EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652689876;
 bh=ytW6OzemA443Fouu0UIECYThL8+4RWJXRFWc1m4MtCA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DrwGfIZryGFSE47jUYrBD9ViP0HynbmltEeFaTfaRjPvDy127ALe3/gLlx4a/wIBm
 cpYw0qGPUh+ofhh0mBWJ5H4ZzXZlc6BC5fYLTbjuGUDrbCCqRRmyf5DpkU2H7FTAt0
 3yTXp9b7+x2kaw0UwSpa4FazbLDEeAB4UGuRl0ZhTGJQqJZJ34D+mlB8Gcb54Dq2bO
 OD26aijV8SV43MYCA/nARuauX2z8LwzxNUkZA+iotU9mdoqhSHbVAtmatPJMuUBuV9
 e6tAROSSVU6Iesivz5qfYmqVSEWIWedgd9icIfmLbDDdirUd2TbOyZwkeotkq+RVUP
 MDIFscgK1UCHg==
Message-ID: <7d4caab4-bb70-8e32-dc06-5edd51dbeea5@collabora.com>
Date: Mon, 16 May 2022 10:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/2] clocksource/drivers/timer-mediatek: Implement
 CPUXGPT timers
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20220513201442.13569-1-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220513201442.13569-1-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_013123_662727_7682E2A5 
X-CRM114-Status: GOOD (  42.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/05/22 22:14, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <yassine.oudjana@gmail.com>
> 
> On Mon,  9 May 2022 23:07:40 +0200, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
>> Some MediaTek platforms with a buggy TrustZone ATF firmware will not
>> initialize the AArch64 System Timer correctly: in these cases, the
>> System Timer address is correctly programmed, as well as the CNTFRQ_EL0
>> register (reading 13MHz, as it should be), but the assigned hardware
>> timers are never started before (or after) booting Linux.
>>
>> In this condition, any call to function get_cycles() will be returning
>> zero, as CNTVCT_EL0 will always read zero.
> 
> I spent a lot of time trying to figure out why the arch timer didn't
> work on MT6737T and never got any results. Turns out this is why...
> 
> I ended up using the GPT (@ 0x10004000) as a system timer and it
> worked fine.
> 
> With this patch the arch timer started to work finally. Thanks for
> the fix! See below for one comment on this patch.
> 

Hello Yassine,

yes this is a common quirk that's present on all (or almost all?) older
MediaTek platforms - as I explained, due to TZ doing only partial init
for these timers.

I'm happy to read that this is working out as expected: I saw you pushing
some patches for older MTK SoCs, so I started researching about what the
community was blocked on with the upstreaming of these, and learnt about
such major blocker.

There's more, though: you also need to initialize the CPU MTCMOS at early
boot in order for SMP to work on (some?) old platforms, or at least this
is true for MT6795.

Since it looks like you're interested in giving love to old SoCs, I will
anticipate to you that I *do* have a local implementation for a correct
initialization of the MTCMOS for the non-boot cores... that needs to be
cleaned up a bit before I push that upstream though.

>> One common critical symptom of that is trying to use the udelay()
>> function (calling __delay()), which executes the following loop:
>>
>>              start = get_cycles();
>>              while ((get_cycles() - start) < cycles)
>>                      cpu_relax();
>>
>> which, when CNTVCT_EL0 always reads zero, translates to:
>>
>>              while((0 - 0) < 0)  ==> while(0 < 0)
>>
>> ... generating an infinite loop, even though zero is never less
>> than zero, but always equal to it (this has to be researched,
>> but it's out of the scope of this commit).
>>
>> To fix this issue on the affected MediaTek platforms, the solution
>> is to simply start the timers that are designed to be System Timer(s).
>> These timers, downstream, are called "CPUXGPT" and there is one
>> timer per CPU core; luckily, it is not necessary to set a start bit
>> on each CPUX General Purpose Timer, but it's conveniently enough to:
>>   - Set the clock divider (input = 26MHz, divider = 2, output = 13MHz);
>>   - Set the ENABLE bit on a global register (starts all CPUX timers).
>>
>> The only small hurdle with this setup is that it's all done through
>> the MCUSYS wrapper, where it is needed, for each read or write, to
>> select a register address (by writing it to an index register) and
>> then to perform any R/W on a "CON" register.
>>
>> For example, writing "0x1" to the CPUXGPT register offset 0x4:
>> - Write 0x4 to mcusys INDEX register
>> - Write 0x1 to mcusys CON register
>>
>> Reading from CPUXGPT register offset 0x4:
>> - Write 0x4 to mcusys INDEX register
>> - Read mcusys CON register.
>>
>> Finally, starting this timer makes platforms affected by this issue
>> to work correctly.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clocksource/timer-mediatek.c | 119 +++++++++++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>
>> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
>> index 7bcb4a3f26fb..a3e90047f9ac 100644
>> --- a/drivers/clocksource/timer-mediatek.c
>> +++ b/drivers/clocksource/timer-mediatek.c

..snip..

>> +
>> +	/*
>> +	 * Check if we're given a clock with the right frequency for this
>> +	 * timer, otherwise warn but keep going with the setup anyway, as
>> +	 * that makes it possible to still boot the kernel, even though
>> +	 * it may not work correctly (random lockups, etc).
>> +	 * The reason behind this is that having an early UART may not be
>> +	 * possible for everyone and this gives a chance to retrieve kmsg
>> +	 * for eventual debugging even on consumer devices.
>> +	 */
>> +	freq = timer_of_rate(&to_cpux);
>> +	if (freq > 13000000)
> 
> Input clock is 26MHz and is then divided by 2 in CPUXGPT, so shouldn't
> this be 26000000 instead? I get a warning here with 26MHz system clock
> supplied:
> 

This may seem to be counter intuitive... I had two ways to implement this:
1. Design this driver to take "clk26m" as a clock input and make it so
    that it reads the expected frequency from CNTFRQ_EL0, then setup the
    dividers based on that reading; or
2. Take "clk13m" as input and refuse to take anything else.

Keeping in mind that:
1. There's no way (that I know, at least) to set a different clock source for
    the CPUXGPT timers, and
2. There's no platform (I've been researching on that) that uses a different
    frequency for these timers...

...there will never be any platform that outputs a clock that's not 13MHz,
hence I chose to follow path 2 and take the 13MHz "System Clock", which is
something that is present downstream as well.

In any case, now that you make me think about that, it may indeed be more
logical to assign the 26MHz clock to this node... my intention was to force
knowledge on this outputting 13MHz instead but, I realize, this may be the
wrong way of doing that.

> clocks {
> 	...
> 	clk26m: clk26m {
> 		compatible = "fixed-clock";
> 		clock-frequency = <26000000>;
> 		#clock-cells = <0>;
> 	};
> 	...
> };
> ...
> soc {
> 	...
> 	cpuxgpt: timer@10200670 {
> 		compatible = "mediatek,mt6795-systimer";
> 		reg = <0 0x10200670 0 0x8>;

My congratulations on this timer node: you're a smart person!
I was expecting people complaining about "this doesn't work" and having
to explain that 0x10200000 is not the right iostart for this node, but
I didn't have to.

Hats off.

Cheers,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
