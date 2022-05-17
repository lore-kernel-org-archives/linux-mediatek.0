Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DEDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbvdpULRjU6CoVQ0y0V2zB8Aw6QlGQbO6AWpL5mEMKY=; b=XxephLwvH9TpM0
	JMZ1SyF8DAxUnZe+b0/R8+AAJTxq75qntRM3U8mNqwcG5i4HJnmWOeNM4tk8jmf/dNZQNR/5X3fzo
	8MitIKFaIfJIM1C4ATjDMUu2uDxO9phVucdiFhiJejE8fQXWItXIAkZBDi6xALxdBCv+EKmK4TSYX
	gDXhDpl2wlVsgymeSGoqWTuNX3KlbXaMKQ6A0RLAfYP1cZhWGvtzGggviK+gjEcDt+xRBUzUl8D0G
	F3wx/rwDDcNf0Wq5UfEooUk58ZT92alQkhljSRUOZdx3I3tfjSbzyguk0iiOkRAHahkFbMoBPVeBA
	E1iKzLWOW1MbsmcwnX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr46C-00FoOq-QN; Tue, 17 May 2022 20:47:20 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr460-00FoLa-QE; Tue, 17 May 2022 20:47:10 +0000
Received: by mail-oi1-f172.google.com with SMTP id v65so262344oig.10;
 Tue, 17 May 2022 13:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sLYhfBC2Wn0WI956K4cX5zfF6kFRcWXkiUrSI8cWUU4=;
 b=oRXuomgHmQkj8/Qlf/1lDj+PT9NzGHtw5521PTLfNpkIU/90fplCNPeX9ECuWJiTj3
 19XFdbkySoIwNyjHZbCPYNq+0IVY9yXApY9N/pGZ/imD3XRBXAFPYQkCceXTQLK/x/Ok
 HMf4P7qR7zw4YmVc+yZ/01DsVZcEQDoicZUfrwTLPDRc6lCkVMxBPdTNP3lbAALQyXye
 yYnCvp1Er36yM8Y/n/QlXobx+ScoQngnyQZBqhdqijQw+T7untRe3jRxKJ0rQe5HjzWv
 4rbD8ZyKWkw/uDDe1XjzO9l8ERipVxihD13wZr/bGv3JNvncF05LcTKGEp+9ZQx5W3XJ
 MC1Q==
X-Gm-Message-State: AOAM5334uxGZvZL1ewydGUgTtFl4rNFdaoAtl+tq60xJh6+OaDM31+uX
 FrwCPQij9hqf3OtugylrNw==
X-Google-Smtp-Source: ABdhPJy15yaN5bdFWlOHfh3PZxsObXem8LxNxi+TSx92sibkD+hAHKR8BnxGePqPUGjIaRPvsZ/3Xw==
X-Received: by 2002:aca:bc57:0:b0:326:b2b6:2535 with SMTP id
 m84-20020acabc57000000b00326b2b62535mr16708742oif.107.1652820427027; 
 Tue, 17 May 2022 13:47:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056830160e00b006060322125csm150201otr.44.2022.05.17.13.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:47:06 -0700 (PDT)
Received: (nullmailer pid 1610923 invoked by uid 1000);
 Tue, 17 May 2022 20:47:05 -0000
Date: Tue, 17 May 2022 15:47:05 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
Subject: Re: [PATCH v2 2/2] clocksource/drivers/timer-mediatek: Implement
 CPUXGPT timers
Message-ID: <20220517204705.GA1597201-robh@kernel.org>
References: <20220509210741.12020-1-angelogioacchino.delregno@collabora.com>
 <20220509210741.12020-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220509210741.12020-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_134708_898003_4983EBA0 
X-CRM114-Status: GOOD (  45.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 09, 2022 at 11:07:40PM +0200, AngeloGioacchino Del Regno wrote:
> Some MediaTek platforms with a buggy TrustZone ATF firmware will not
> initialize the AArch64 System Timer correctly: in these cases, the
> System Timer address is correctly programmed, as well as the CNTFRQ_EL0
> register (reading 13MHz, as it should be), but the assigned hardware
> timers are never started before (or after) booting Linux.

I believe the upstream position in regards to arch timer work-arounds is 
fix the firmware.

Rob

> 
> In this condition, any call to function get_cycles() will be returning
> zero, as CNTVCT_EL0 will always read zero.
> 
> One common critical symptom of that is trying to use the udelay()
> function (calling __delay()), which executes the following loop:
> 
>             start = get_cycles();
>             while ((get_cycles() - start) < cycles)
>                     cpu_relax();
> 
> which, when CNTVCT_EL0 always reads zero, translates to:
> 
>             while((0 - 0) < 0)  ==> while(0 < 0)
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
>  - Set the clock divider (input = 26MHz, divider = 2, output = 13MHz);
>  - Set the ENABLE bit on a global register (starts all CPUX timers).
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
>  drivers/clocksource/timer-mediatek.c | 119 +++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 7bcb4a3f26fb..a3e90047f9ac 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -22,6 +22,19 @@
>  
>  #define TIMER_SYNC_TICKS        (3)
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
>  /* gpt */
>  #define GPT_IRQ_EN_REG          0x00
>  #define GPT_IRQ_ENABLE(val)     BIT((val) - 1)
> @@ -72,6 +85,57 @@
>  
>  static void __iomem *gpt_sched_reg __read_mostly;
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
>  static void mtk_syst_ack_irq(struct timer_of *to)
>  {
>  	/* Clear and disable interrupt */
> @@ -281,6 +345,60 @@ static struct timer_of to = {
>  	},
>  };
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
>  static int __init mtk_syst_init(struct device_node *node)
>  {
>  	int ret;
> @@ -339,3 +457,4 @@ static int __init mtk_gpt_init(struct device_node *node)
>  }
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>  TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> +TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer", mtk_cpux_init);
> -- 
> 2.35.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
