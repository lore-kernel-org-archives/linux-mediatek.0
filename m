Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F137C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0baWAAPwrom+eARvlOORCVg5jEAduzYGP/840fDJF/g=; b=KG5B+YRwr/xJB0
	uRot6riGci5rKH/kH6G1kHRxMVCITaZ5IsH3HYXY4bv9NewIIv1OlfBxq3KNjTXIhEPz23NSXCHOY
	do3OM82UlkeuZCgO7amyMWJchSQHe6frvf8BVyIK/LnI6JwrJJGUWdE/yMPCizZCNV29cLAFLJaqf
	z2wp3pLhG1nRRGu3ZCiSK3kO6/q3AoPl55TDCHo38TkEB9z3o3hdrvrJHag02qrZOObOjyjWW1AbL
	CZxD5mKlaJfRGenu+Nc52YHQwmT4DQOjfjVzwDaimcSImk96cjQfqmmN+p6OuYhWsimQLyoe2D6mq
	TWGFokiQhNMEdjfwe2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noAcD-00GHhR-N9; Mon, 09 May 2022 21:08:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noAbe-00GHS3-Px; Mon, 09 May 2022 21:07:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D30E11F430F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652130469;
 bh=JLghvR/iOn7Dwgag/eEFL3hJl1MmWcjIvBMeSXosG2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kgtCyeYeKI25TsBLBK/qVasnZu7M0uh7o0BoXF2FZ8+1c9u1A7tSPJqCrzPx3JEze
 /iofLkNVDaA+ZtM3ih6wZCv/EbIXsl0tXxm1aGGUuwphgjkRoQQDfy9E5aGtnTvRet
 cTjEuZX7blsvzvcO5+iCWiFo3TGCR2bVIPDWOA11Jgtsrh3J5I8VeOBHTigwFe9xSi
 jgvpjT52hO+6+Ww+x9mC/ZRyRI4NZatUtaQyB8d3W9YH7y+nwCTGy2RkbmMetA5ZWm
 WOqvnp0FjPjQGQyEPAvXcVmR9aSU+/gsf2GNEBxqVJK3S3Kf+KVP0ecom75JiItD5C
 p9DMzS9D4fqFQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] clocksource/drivers/timer-mediatek: Implement CPUXGPT
 timers
Date: Mon,  9 May 2022 23:07:40 +0200
Message-Id: <20220509210741.12020-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509210741.12020-1-angelogioacchino.delregno@collabora.com>
References: <20220509210741.12020-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_140751_133965_D1E737F9 
X-CRM114-Status: GOOD (  25.95  )
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

Some MediaTek platforms with a buggy TrustZone ATF firmware will not
initialize the AArch64 System Timer correctly: in these cases, the
System Timer address is correctly programmed, as well as the CNTFRQ_EL0
register (reading 13MHz, as it should be), but the assigned hardware
timers are never started before (or after) booting Linux.

In this condition, any call to function get_cycles() will be returning
zero, as CNTVCT_EL0 will always read zero.

One common critical symptom of that is trying to use the udelay()
function (calling __delay()), which executes the following loop:

            start = get_cycles();
            while ((get_cycles() - start) < cycles)
                    cpu_relax();

which, when CNTVCT_EL0 always reads zero, translates to:

            while((0 - 0) < 0)  ==> while(0 < 0)

... generating an infinite loop, even though zero is never less
than zero, but always equal to it (this has to be researched,
but it's out of the scope of this commit).

To fix this issue on the affected MediaTek platforms, the solution
is to simply start the timers that are designed to be System Timer(s).
These timers, downstream, are called "CPUXGPT" and there is one
timer per CPU core; luckily, it is not necessary to set a start bit
on each CPUX General Purpose Timer, but it's conveniently enough to:
 - Set the clock divider (input = 26MHz, divider = 2, output = 13MHz);
 - Set the ENABLE bit on a global register (starts all CPUX timers).

The only small hurdle with this setup is that it's all done through
the MCUSYS wrapper, where it is needed, for each read or write, to
select a register address (by writing it to an index register) and
then to perform any R/W on a "CON" register.

For example, writing "0x1" to the CPUXGPT register offset 0x4:
- Write 0x4 to mcusys INDEX register
- Write 0x1 to mcusys CON register

Reading from CPUXGPT register offset 0x4:
- Write 0x4 to mcusys INDEX register
- Read mcusys CON register.

Finally, starting this timer makes platforms affected by this issue
to work correctly.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clocksource/timer-mediatek.c | 119 +++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..a3e90047f9ac 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -22,6 +22,19 @@
 
 #define TIMER_SYNC_TICKS        (3)
 
+/* cpux mcusys wrapper */
+#define CPUX_CON_REG		0x0
+#define CPUX_IDX_REG		0x4
+
+/* cpux */
+#define CPUX_IDX_GLOBAL_CTRL	0x0
+ #define CPUX_ENABLE		BIT(0)
+ #define CPUX_CLK_DIV_MASK	GENMASK(10, 8)
+ #define CPUX_CLK_DIV1		BIT(8)
+ #define CPUX_CLK_DIV2		BIT(9)
+ #define CPUX_CLK_DIV4		BIT(10)
+#define CPUX_IDX_GLOBAL_IRQ	0x30
+
 /* gpt */
 #define GPT_IRQ_EN_REG          0x00
 #define GPT_IRQ_ENABLE(val)     BIT((val) - 1)
@@ -72,6 +85,57 @@
 
 static void __iomem *gpt_sched_reg __read_mostly;
 
+static u32 mtk_cpux_readl(u32 reg_idx, struct timer_of *to)
+{
+	writel(reg_idx, timer_of_base(to) + CPUX_IDX_REG);
+	return readl(timer_of_base(to) + CPUX_CON_REG);
+}
+
+static void mtk_cpux_writel(u32 val, u32 reg_idx, struct timer_of *to)
+{
+	writel(reg_idx, timer_of_base(to) + CPUX_IDX_REG);
+	writel(val, timer_of_base(to) + CPUX_CON_REG);
+}
+
+static void mtk_cpux_disable_irq(struct timer_of *to)
+{
+	const unsigned long *irq_mask = cpumask_bits(cpu_possible_mask);
+	u32 val;
+
+	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_IRQ, to);
+	val &= ~(*irq_mask);
+	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_IRQ, to);
+}
+
+static void mtk_cpux_enable_irq(struct timer_of *to)
+{
+	const unsigned long *irq_mask = cpumask_bits(cpu_possible_mask);
+	u32 val;
+
+	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_IRQ, to);
+	val |= *irq_mask;
+	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_IRQ, to);
+}
+
+static int mtk_cpux_clkevt_shutdown(struct clock_event_device *clkevt)
+{
+	/* Clear any irq */
+	mtk_cpux_disable_irq(to_timer_of(clkevt));
+
+	/*
+	 * Disabling CPUXGPT timer will crash the platform, especially
+	 * if Trusted Firmware is using it (usually, for sleep states),
+	 * so we only mask the IRQ and call it a day.
+	 */
+	return 0;
+}
+
+static int mtk_cpux_clkevt_resume(struct clock_event_device *clkevt)
+{
+	mtk_cpux_enable_irq(to_timer_of(clkevt));
+	return 0;
+}
+
 static void mtk_syst_ack_irq(struct timer_of *to)
 {
 	/* Clear and disable interrupt */
@@ -281,6 +345,60 @@ static struct timer_of to = {
 	},
 };
 
+static int __init mtk_cpux_init(struct device_node *node)
+{
+	static struct timer_of to_cpux;
+	u32 freq, val;
+	int ret;
+
+	/*
+	 * There are per-cpu interrupts for the CPUX General Purpose Timer
+	 * but since this timer feeds the AArch64 System Timer we can rely
+	 * on the CPU timer PPIs as well, so we don't declare TIMER_OF_IRQ.
+	 */
+	to_cpux.flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
+	to_cpux.clkevt.name = "mtk-cpuxgpt";
+	to_cpux.clkevt.rating = 10;
+	to_cpux.clkevt.cpumask = cpu_possible_mask;
+	to_cpux.clkevt.set_state_shutdown = mtk_cpux_clkevt_shutdown;
+	to_cpux.clkevt.tick_resume = mtk_cpux_clkevt_resume;
+
+	/* If this fails, bad things are about to happen... */
+	ret = timer_of_init(node, &to_cpux);
+	if (ret) {
+		WARN(1, "Cannot start CPUX timers.\n");
+		return ret;
+	}
+
+	/*
+	 * Check if we're given a clock with the right frequency for this
+	 * timer, otherwise warn but keep going with the setup anyway, as
+	 * that makes it possible to still boot the kernel, even though
+	 * it may not work correctly (random lockups, etc).
+	 * The reason behind this is that having an early UART may not be
+	 * possible for everyone and this gives a chance to retrieve kmsg
+	 * for eventual debugging even on consumer devices.
+	 */
+	freq = timer_of_rate(&to_cpux);
+	if (freq > 13000000)
+		WARN(1, "Requested unsupported timer frequency %u\n", freq);
+
+	/* Clock input is 26MHz, set DIV2 to achieve 13MHz clock */
+	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_CTRL, &to_cpux);
+	val &= ~CPUX_CLK_DIV_MASK;
+	val |= CPUX_CLK_DIV2;
+	mtk_cpux_writel(val, CPUX_IDX_GLOBAL_CTRL, &to_cpux);
+
+	/* Enable all CPUXGPT timers */
+	val = mtk_cpux_readl(CPUX_IDX_GLOBAL_CTRL, &to_cpux);
+	mtk_cpux_writel(val | CPUX_ENABLE, CPUX_IDX_GLOBAL_CTRL, &to_cpux);
+
+	clockevents_config_and_register(&to_cpux.clkevt, timer_of_rate(&to_cpux),
+					TIMER_SYNC_TICKS, 0xffffffff);
+
+	return 0;
+}
+
 static int __init mtk_syst_init(struct device_node *node)
 {
 	int ret;
@@ -339,3 +457,4 @@ static int __init mtk_gpt_init(struct device_node *node)
 }
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
 TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer", mtk_cpux_init);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
