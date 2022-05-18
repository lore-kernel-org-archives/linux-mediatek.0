Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2972BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+IBaK2vdsJboeexyz77zeCyP02e1n2L/FvT+9Qv2JY=; b=vV3IeuGWrdo5H8
	gT+sceG2viugDpi2ym4WfP0P2EbfkbdC12FCTmGmi1C9j1xCEwyuhH5uyfJ6nXGpOvb5+huy7sSuF
	/L/bbT3E67hIJa9+tUBVmvKl2lBzN1H+nhvXxy1s9rtyc7qvX6OHNVzwwA+EWJ/FOsrJ5Tml6iEUv
	QtH1HtDGQmFbEUl2gY/e/xJxCVd8Oe3pAExav6vM+yh/t7gWIdis+bPLMMolyAjMvTafs7mSu78wU
	lqlcx4k2LVhydDOkYIoGfF6NzlPoOfS5h0flWnzI7rurIfdTX7AK2GOHzOydr62Q/7rSm/bTv4zq4
	bD7GzxnnSE5xGMY+Wp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrErq-000XY0-PY; Wed, 18 May 2022 08:17:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrEjO-000Ono-Uy; Wed, 18 May 2022 08:08:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F06641F449CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652861306;
 bh=mpP7Pc1893QPlCciLJ22aLJE2mBm+QxuS/avhCUhEOI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YrBWRtru4kUp9aZFQxv03wJ5iFyqHWgcmhdEzkK4IaaDj4+nkvCVEth+LA/rZK/y3
 MPhswYA/iHJxfXFRVItZclWsas9VeRQB9azALv0a8lUFPWzittbpyol/58U5WzcZLL
 +tEIm6Qe1NvC9wjvDnxutNhw1/0O8pV5HJe19hmLZp1vB04/UrEWWjmroJHe6M9bjl
 ri9Yjn4O0YFmIrVo/aQ/cKA5ce5Xw3tdKHotdk9zV0iCeBr9j5vwo8rZMYMFCjKiud
 XQlnWc9SzFa0OXRAz3x3rAD+WGdcKDcZJsXXsA8u1HdwcOnVhPpQXLayS8PETaR/nu
 ooFQmfalYcK5g==
Message-ID: <e3f1fe5b-b031-10b7-6e17-bc11e98cf5a3@collabora.com>
Date: Wed, 18 May 2022 10:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/2] clocksource/drivers/timer-mediatek: Implement
 CPUXGPT timers
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20220509210741.12020-1-angelogioacchino.delregno@collabora.com>
 <20220509210741.12020-3-angelogioacchino.delregno@collabora.com>
 <20220517204705.GA1597201-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220517204705.GA1597201-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_010831_489029_317805E3 
X-CRM114-Status: GOOD (  42.19  )
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

Il 17/05/22 22:47, Rob Herring ha scritto:
> On Mon, May 09, 2022 at 11:07:40PM +0200, AngeloGioacchino Del Regno wrote:
>> Some MediaTek platforms with a buggy TrustZone ATF firmware will not
>> initialize the AArch64 System Timer correctly: in these cases, the
>> System Timer address is correctly programmed, as well as the CNTFRQ_EL0
>> register (reading 13MHz, as it should be), but the assigned hardware
>> timers are never started before (or after) booting Linux.
> 
> I believe the upstream position in regards to arch timer work-arounds is
> fix the firmware.
> 

Hello Rob,

unfortunately, this is not possible for all boards and/or all devices: while
it's really straightforward to add a register write in TrustZone, and MT6795
even has ATF support upstream, the major blocker for this is consumer devices.

There, you cannot simply flash a new ATF firmware because some partitions and
some firmwares are checked against an obviously not public OEM signature:
taking as an example the device that I'm using for development (a Sony Xperia M5
smartphone), a firmware fix would imply that Sony needs to release a new TZ
fw, which is not going to happen because that device was *abandoned* years ago.

Though, Sony is not the only OEM that is affected by that issue: all smartphones
have this signature check against the OEM's keys, which is 99.9% of the MT6795
boards.
Now there's also another catch: MT6795 is *not* the only SoC that requires this
fix... it's many others as well, both ARM and ARM64, and the count is very large!
...and there's more: some of the OEMs/ODMs that produced MT6795 devices don't
even exist anymore!!!

Hence, the only way to avoid turning a very large pile of electronics into
e-waste is to give a new life to those abandoned deices by actually providing
a way to boot them - and this is the only way, as this commit is not just
for SMP, but also for the boot CPU, and Linux won't work without. At all.

If there was any way to get the firmware fixed, I would've gone for that,
but this is *really* the only option.

Regards,
Angelo

> Rob
> 
>>
>> In this condition, any call to function get_cycles() will be returning
>> zero, as CNTVCT_EL0 will always read zero.
>>
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
>> @@ -22,6 +22,19 @@
>>   
>>   #define TIMER_SYNC_TICKS        (3)
>>   
>> +/* cpux mcusys wrapper */
>> +#define CPUX_CON_REG		0x0
>> +#define CPUX_IDX_REG		0x4
>> +
>> +/* cpux */
>> +#define CPUX_IDX_GLOBAL_CTRL	0x0
>> + #define CPUX_ENABLE		BIT(0)
>> + #define CPUX_CLK_DIV_MASK	GENMASK(10, 8)
>> + #define CPUX_CLK_DIV1		BIT(8)
>> + #define CPUX_CLK_DIV2		BIT(9)
>> + #define CPUX_CLK_DIV4		BIT(10)
>> +#define CPUX_IDX_GLOBAL_IRQ	0x30
>> +
>>   /* gpt */
>>   #define GPT_IRQ_EN_REG          0x00
>>   #define GPT_IRQ_ENABLE(val)     BIT((val) - 1)
>> @@ -72,6 +85,57 @@
>>   
>>   static void __iomem *gpt_sched_reg __read_mostly;
>>   
>> +static u32 mtk_cpux_readl(u32 reg_idx, struct timer_of *to)
>> +{
>> +	writel(reg_idx, timer_of_base(to) + CPUX_IDX_REG);
>> +	return readl(timer_of_base(to) + CPUX_CON_REG);
>> +}
>> +
>> +static void mtk_cpux_writel(u32 val, u32 reg_idx, struct timer_of *to)
>> +{
>> +	writel(reg_idx, timer_of_base(to) + CPUX_IDX_REG);
>> +	writel(val, timer_of_base(to) + CPUX_CON_REG);
>> +}
>> +
>> +static void mtk_cpux_disable_irq(struct timer_of *to)
>> +{
>> +	const unsigned long *irq_mask = cpumask_bits(cpu_possible_mask);
>> +	u32 val;
>> +
>> +	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_IRQ, to);
>> +	val &= ~(*irq_mask);
>> +	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_IRQ, to);
>> +}
>> +
>> +static void mtk_cpux_enable_irq(struct timer_of *to)
>> +{
>> +	const unsigned long *irq_mask = cpumask_bits(cpu_possible_mask);
>> +	u32 val;
>> +
>> +	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_IRQ, to);
>> +	val |= *irq_mask;
>> +	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_IRQ, to);
>> +}
>> +
>> +static int mtk_cpux_clkevt_shutdown(struct clock_event_device *clkevt)
>> +{
>> +	/* Clear any irq */
>> +	mtk_cpux_disable_irq(to_timer_of(clkevt));
>> +
>> +	/*
>> +	 * Disabling CPUXGPT timer will crash the platform, especially
>> +	 * if Trusted Firmware is using it (usually, for sleep states),
>> +	 * so we only mask the IRQ and call it a day.
>> +	 */
>> +	return 0;
>> +}
>> +
>> +static int mtk_cpux_clkevt_resume(struct clock_event_device *clkevt)
>> +{
>> +	mtk_cpux_enable_irq(to_timer_of(clkevt));
>> +	return 0;
>> +}
>> +
>>   static void mtk_syst_ack_irq(struct timer_of *to)
>>   {
>>   	/* Clear and disable interrupt */
>> @@ -281,6 +345,60 @@ static struct timer_of to = {
>>   	},
>>   };
>>   
>> +static int __init mtk_cpux_init(struct device_node *node)
>> +{
>> +	static struct timer_of to_cpux;
>> +	u32 freq, val;
>> +	int ret;
>> +
>> +	/*
>> +	 * There are per-cpu interrupts for the CPUX General Purpose Timer
>> +	 * but since this timer feeds the AArch64 System Timer we can rely
>> +	 * on the CPU timer PPIs as well, so we don't declare TIMER_OF_IRQ.
>> +	 */
>> +	to_cpux.flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
>> +	to_cpux.clkevt.name = "mtk-cpuxgpt";
>> +	to_cpux.clkevt.rating = 10;
>> +	to_cpux.clkevt.cpumask = cpu_possible_mask;
>> +	to_cpux.clkevt.set_state_shutdown = mtk_cpux_clkevt_shutdown;
>> +	to_cpux.clkevt.tick_resume = mtk_cpux_clkevt_resume;
>> +
>> +	/* If this fails, bad things are about to happen... */
>> +	ret = timer_of_init(node, &to_cpux);
>> +	if (ret) {
>> +		WARN(1, "Cannot start CPUX timers.\n");
>> +		return ret;
>> +	}
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
>> +		WARN(1, "Requested unsupported timer frequency %u\n", freq);
>> +
>> +	/* Clock input is 26MHz, set DIV2 to achieve 13MHz clock */
>> +	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_CTRL, &to_cpux);
>> +	val &= ~CPUX_CLK_DIV_MASK;
>> +	val |= CPUX_CLK_DIV2;
>> +	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_CTRL, &to_cpux);
>> +
>> +	/* Enable all CPUXGPT timers */
>> +	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_CTRL, &to_cpux);
>> +	mtk_cpux_writel(val | CPUX_ENABLE, CPUX_IDX_GLOBAL_CTRL, &to_cpux);
>> +
>> +	clockevents_config_and_register(&to_cpux.clkevt, timer_of_rate(&to_cpux),
>> +					TIMER_SYNC_TICKS, 0xffffffff);
>> +
>> +	return 0;
>> +}
>> +
>>   static int __init mtk_syst_init(struct device_node *node)
>>   {
>>   	int ret;
>> @@ -339,3 +457,4 @@ static int __init mtk_gpt_init(struct device_node *node)
>>   }
>>   TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>>   TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
>> +TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer", mtk_cpux_init);
>> -- 
>> 2.35.1
>>
>>


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
