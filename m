Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF31C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSzhYqMN5tQil9aPLmoV6oVy2um6wF77Psn3bHeNu8c=; b=3E0wuy656Lp37W
	qb6DJSOJDY7UalOAwc3VKb3bXxQYEEqN1gJGuTjITSXK0sTobglrft+QclGDK3kjFhyq+R4y0Cous
	ioQcIegc5xbj+ZANQTip/CH2z+3jzWp0hPhSuMGFvtsR+Uji1umgMFj29Gn0PFp/AvmlK1kM1g1/M
	aSwKKIeau9Nv9xxIznvsw19VIhwmAdExlhcKZ3UuSCyW9vgF1YnEoEfZ/JaSdAuYOUh2TeUIVsHJC
	OYO4ehu39BzDDViNbU81hdd+4vhhXvTpjBksUb6OjS3LwgSaenO+P4vNB3Psho1JgfGXm5IqWolit
	u7VS6WkDbFamQooTQbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrHe2-001RPY-Ba; Wed, 18 May 2022 11:15:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrHdq-001RLI-DE; Wed, 18 May 2022 11:15:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso2995456wmh.2; 
 Wed, 18 May 2022 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gFNS66ec9gzGKI85Itd6yknLQQ11of1G4AsWn4tUdXY=;
 b=CkLdqk4Ny+Y/JjI8jbwrmF6WX1kc57xVapnnA5pBfOCKv3wC/G3MieTuRMOx1XpGrx
 LpFkV9dAQQeNtqNROMFA58ZTPgonaSjabE0RMpbX/3N0ECOCDTSLHwknxhMj7AHlS80F
 BS8HBT19FF08UjZyYhHmUDIUWLG7QX9abDQ6zwtDhLgBjZEx0whVo//jBhGIDKoUASID
 ogDq5eSySJ8WnsJFpfsvXhexyAdnm8ivs7+rJZDBTfbNFbhzggzwqyye7Ean+VM0qvMA
 hi3M2odIPBRT8jSbHQArhUXXCOLlKORjNlu9eOQ38YOJT1NK19zEE4d8mnV7Swyd2CiI
 Q4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gFNS66ec9gzGKI85Itd6yknLQQ11of1G4AsWn4tUdXY=;
 b=J9eM2M1s33sBJfaQg+Axm56TMIHLe0K+c9UOEysdlTZJG/5++1ekhfxw10ArMDZ/sK
 zHJ/0aH/VInj+bKC3hzVzjarL0GhNYMqQ1htDJDujx8WwoWPR05HeS6jmEw5580vJ9gx
 9Qkv+UqY0PR0eWuRI1NbCQ6HzJG1x4aeAwttJuLT/+LC7fJu5TIoMyDwClteH/ESLW6j
 NJx2OjF5YzCh/5rA2FXrojeC1xsYJKBn0qPryBIIe00m19k9L7dEjT5QpLIfZNl5/Bzw
 X5UlASFWxy/ZwDMpaZMJMYldeItRQFnf/Vb9snTGcAWmBhlIrndAYjkyRM0Sa8GcNzaM
 KSGw==
X-Gm-Message-State: AOAM5303GhsueVULNWX+qY1EWsgLkON7dSALr3G/R7rucK2UVqKJ/zMn
 g3fmGhn0diTWZYh/F3TyLLg=
X-Google-Smtp-Source: ABdhPJxY7LzE1xl526m35BI0lDNeQjvtILc9BgznWBrEL+AOiyPYOBnQEWaUZTSUmlKMPnT4+q1aZA==
X-Received: by 2002:a1c:1947:0:b0:392:b883:aac9 with SMTP id
 68-20020a1c1947000000b00392b883aac9mr24948193wmz.155.1652872494712; 
 Wed, 18 May 2022 04:14:54 -0700 (PDT)
Received: from [192.168.0.36] ([5.225.216.194])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm1631606wre.94.2022.05.18.04.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 04:14:54 -0700 (PDT)
Message-ID: <d00cfc46-86a6-c52b-6118-a4472e362c8e@gmail.com>
Date: Wed, 18 May 2022 13:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] clocksource/drivers/timer-mediatek: Implement
 CPUXGPT timers
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org
References: <20220509210741.12020-1-angelogioacchino.delregno@collabora.com>
 <20220509210741.12020-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220509210741.12020-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_041458_524067_3B94B442 
X-CRM114-Status: GOOD (  45.81  )
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



On 09/05/2022 23:07, AngeloGioacchino Del Regno wrote:
> Some MediaTek platforms with a buggy TrustZone ATF firmware will not
> initialize the AArch64 System Timer correctly: in these cases, the
> System Timer address is correctly programmed, as well as the CNTFRQ_EL0
> register (reading 13MHz, as it should be), but the assigned hardware
> timers are never started before (or after) booting Linux.
> 
> In this condition, any call to function get_cycles() will be returning
> zero, as CNTVCT_EL0 will always read zero.
> 
> One common critical symptom of that is trying to use the udelay()
> function (calling __delay()), which executes the following loop:
> 
>              start = get_cycles();
>              while ((get_cycles() - start) < cycles)
>                      cpu_relax();
> 
> which, when CNTVCT_EL0 always reads zero, translates to:
> 
>              while((0 - 0) < 0)  ==> while(0 < 0)
> 
> ... generating an infinite loop, even though zero is never less
> than zero, but always equal to it (this has to be researched,
> but it's out of the scope of this commit).
> 
> To fix this issue on the affected MediaTek platforms, the solution
> is to simply start the timers that are designed to be System Timer(s).
> These timers, downstream, are called "CPUXGPT" and there is one
> timer per CPU core; luckily, it is not necessary to set a start bit
> on each CPUX General Purpose Timer, but it's conveniently enough to:
>   - Set the clock divider (input = 26MHz, divider = 2, output = 13MHz);
>   - Set the ENABLE bit on a global register (starts all CPUX timers).
> 
> The only small hurdle with this setup is that it's all done through
> the MCUSYS wrapper, where it is needed, for each read or write, to
> select a register address (by writing it to an index register) and
> then to perform any R/W on a "CON" register.
> 
> For example, writing "0x1" to the CPUXGPT register offset 0x4:
> - Write 0x4 to mcusys INDEX register
> - Write 0x1 to mcusys CON register
> 
> Reading from CPUXGPT register offset 0x4:
> - Write 0x4 to mcusys INDEX register
> - Read mcusys CON register.
> 
> Finally, starting this timer makes platforms affected by this issue
> to work correctly.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/clocksource/timer-mediatek.c | 119 +++++++++++++++++++++++++++
>   1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 7bcb4a3f26fb..a3e90047f9ac 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -22,6 +22,19 @@
>   
>   #define TIMER_SYNC_TICKS        (3)
>   
> +/* cpux mcusys wrapper */
> +#define CPUX_CON_REG		0x0
> +#define CPUX_IDX_REG		0x4
> +
> +/* cpux */
> +#define CPUX_IDX_GLOBAL_CTRL	0x0
> + #define CPUX_ENABLE		BIT(0)
> + #define CPUX_CLK_DIV_MASK	GENMASK(10, 8)
> + #define CPUX_CLK_DIV1		BIT(8)
> + #define CPUX_CLK_DIV2		BIT(9)
> + #define CPUX_CLK_DIV4		BIT(10)
> +#define CPUX_IDX_GLOBAL_IRQ	0x30
> +
>   /* gpt */
>   #define GPT_IRQ_EN_REG          0x00
>   #define GPT_IRQ_ENABLE(val)     BIT((val) - 1)
> @@ -72,6 +85,57 @@
>   
>   static void __iomem *gpt_sched_reg __read_mostly;
>   
> +static u32 mtk_cpux_readl(u32 reg_idx, struct timer_of *to)
> +{
> +	writel(reg_idx, timer_of_base(to) + CPUX_IDX_REG);
> +	return readl(timer_of_base(to) + CPUX_CON_REG);
> +}
> +
> +static void mtk_cpux_writel(u32 val, u32 reg_idx, struct timer_of *to)
> +{
> +	writel(reg_idx, timer_of_base(to) + CPUX_IDX_REG);
> +	writel(val, timer_of_base(to) + CPUX_CON_REG);
> +}
> +
> +static void mtk_cpux_disable_irq(struct timer_of *to)
> +{
> +	const unsigned long *irq_mask = cpumask_bits(cpu_possible_mask);
> +	u32 val;
> +
> +	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_IRQ, to);
> +	val &= ~(*irq_mask);
> +	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_IRQ, to);
> +}
> +
> +static void mtk_cpux_enable_irq(struct timer_of *to)
> +{
> +	const unsigned long *irq_mask = cpumask_bits(cpu_possible_mask);
> +	u32 val;
> +
> +	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_IRQ, to);
> +	val |= *irq_mask;
> +	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_IRQ, to);
> +}

What about using a function like
mtk_cpux_set_irq(struct timer_of *to, bool enable)

Other then that things look fine.

Regards,
Matthias

> +
> +static int mtk_cpux_clkevt_shutdown(struct clock_event_device *clkevt)
> +{
> +	/* Clear any irq */
> +	mtk_cpux_disable_irq(to_timer_of(clkevt));
> +
> +	/*
> +	 * Disabling CPUXGPT timer will crash the platform, especially
> +	 * if Trusted Firmware is using it (usually, for sleep states),
> +	 * so we only mask the IRQ and call it a day.
> +	 */
> +	return 0;
> +}
> +
> +static int mtk_cpux_clkevt_resume(struct clock_event_device *clkevt)
> +{
> +	mtk_cpux_enable_irq(to_timer_of(clkevt));
> +	return 0;
> +}
> +
>   static void mtk_syst_ack_irq(struct timer_of *to)
>   {
>   	/* Clear and disable interrupt */
> @@ -281,6 +345,60 @@ static struct timer_of to = {
>   	},
>   };
>   
> +static int __init mtk_cpux_init(struct device_node *node)
> +{
> +	static struct timer_of to_cpux;
> +	u32 freq, val;
> +	int ret;
> +
> +	/*
> +	 * There are per-cpu interrupts for the CPUX General Purpose Timer
> +	 * but since this timer feeds the AArch64 System Timer we can rely
> +	 * on the CPU timer PPIs as well, so we don't declare TIMER_OF_IRQ.
> +	 */
> +	to_cpux.flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
> +	to_cpux.clkevt.name = "mtk-cpuxgpt";
> +	to_cpux.clkevt.rating = 10;
> +	to_cpux.clkevt.cpumask = cpu_possible_mask;
> +	to_cpux.clkevt.set_state_shutdown = mtk_cpux_clkevt_shutdown;
> +	to_cpux.clkevt.tick_resume = mtk_cpux_clkevt_resume;
> +
> +	/* If this fails, bad things are about to happen... */
> +	ret = timer_of_init(node, &to_cpux);
> +	if (ret) {
> +		WARN(1, "Cannot start CPUX timers.\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check if we're given a clock with the right frequency for this
> +	 * timer, otherwise warn but keep going with the setup anyway, as
> +	 * that makes it possible to still boot the kernel, even though
> +	 * it may not work correctly (random lockups, etc).
> +	 * The reason behind this is that having an early UART may not be
> +	 * possible for everyone and this gives a chance to retrieve kmsg
> +	 * for eventual debugging even on consumer devices.
> +	 */
> +	freq = timer_of_rate(&to_cpux);
> +	if (freq > 13000000)
> +		WARN(1, "Requested unsupported timer frequency %u\n", freq);
> +
> +	/* Clock input is 26MHz, set DIV2 to achieve 13MHz clock */
> +	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_CTRL, &to_cpux);
> +	val &= ~CPUX_CLK_DIV_MASK;
> +	val |= CPUX_CLK_DIV2;
> +	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_CTRL, &to_cpux);
> +
> +	/* Enable all CPUXGPT timers */
> +	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_CTRL, &to_cpux);
> +	mtk_cpux_writel(val | CPUX_ENABLE, CPUX_IDX_GLOBAL_CTRL, &to_cpux);
> +
> +	clockevents_config_and_register(&to_cpux.clkevt, timer_of_rate(&to_cpux),
> +					TIMER_SYNC_TICKS, 0xffffffff);
> +
> +	return 0;
> +}
> +
>   static int __init mtk_syst_init(struct device_node *node)
>   {
>   	int ret;
> @@ -339,3 +457,4 @@ static int __init mtk_gpt_init(struct device_node *node)
>   }
>   TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>   TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> +TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer", mtk_cpux_init);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
