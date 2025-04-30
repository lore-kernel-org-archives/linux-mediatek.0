Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257ADC3ABAD
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Apr 2025 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM5EcPL4IKHM4rlCbQTASYXsAHqwj3BMx36LqYyLIcU=; b=hTCPtw3oSJi/GEdS4fbEzgWHpK
	O2JA7+/i884L6rZLY5VeZsQ8mru6J3R5tOB7DINpMBETPjhIPBkLGei5768lDlB+BLVDwP+PkhyJ4
	FJGqOFHj7XHbDDZL5RMSvGR8a4Swmnu1aZAmAjHEnuKm8hji99/Vi5cZp0813JdwyR+lDU+q0Ax4c
	REPYkH3cLSioSNY4+P6RRPRuz2KvFQvaHVc0b2bpX4+DshJuNluxoAKqZiBUtdmpvOmsA2Gr6tRFc
	uP52KfhBk6GTVhHuskwe9prLJ1W3xnxDmvhNS2AQPtBm1SPB+KnYBKA3QvAPN+rdM+Eezi8IkaA1Y
	9jsei+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7cB-0000000D1Ep-0MsG;
	Wed, 30 Apr 2025 13:36:43 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7aP-0000000D0ze-42j1
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Apr 2025 13:34:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C0CB91832;
	Wed, 30 Apr 2025 15:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020091; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=KM5EcPL4IKHM4rlCbQTASYXsAHqwj3BMx36LqYyLIcU=;
	b=thJYtZ6hU2/4ux2x6QQuSqiCDZVPdyiMWdONSq5CSFo6kz1FFIHYBoYBDc5/dqJLNgG122
	QKIIv7roqmY/+tCUMQeMrUfUvr2qtgJnczSUOA/68lBv68mNSQr0Iomw8MkCIJl/Fuzttb
	6jOBoSfizOVGbKJfJfkC1pTWi687RjqDyzWN3GGNtnZkvNPY0vLvKCJ14oqcZth2YJr9Zg
	RKo/A6elUaaJN6LDoLzRqS4MYDMJhHzVkHxxHKF7HEDPUkO4rpbh4mOxZfM3PFl4oxzs0L
	6/4CF2/LPsTXwMa0pyQR6cGGR6w52qPO0xZh6MRs3VFvKCREYwVX94XItio+TQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr
Subject: [PATCH v4 2/7] clocksource/drivers: Add EcoNet Timer HPT driver
Date: Wed, 30 Apr 2025 13:34:28 +0000
Message-Id: <20250430133433.22222-3-cjd@cjdns.fr>
In-Reply-To: <20250430133433.22222-1-cjd@cjdns.fr>
References: <20250430133433.22222-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_063454_383020_51FC0471 
X-CRM114-Status: GOOD (  20.58  )
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

Introduce a clocksource driver for the so-called high-precision timer (HPT)
in the EcoNet EN751221 MIPS SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clocksource/Kconfig                 |   8 +
 drivers/clocksource/Makefile                |   1 +
 drivers/clocksource/timer-econet-en751221.c | 216 ++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/clocksource/timer-econet-en751221.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 487c85259967..976afb0b2312 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -73,6 +73,14 @@ config DW_APB_TIMER_OF
 	select DW_APB_TIMER
 	select TIMER_OF
 
+config ECONET_EN751221_TIMER
+	bool "EcoNet EN751221 High Precision Timer" if COMPILE_TEST
+	depends on HAS_IOMEM
+	select CLKSRC_MMIO
+	select TIMER_OF
+	help
+	  Support for CPU timer found on EcoNet MIPS based SoCs.
+
 config FTTMR010_TIMER
 	bool "Faraday Technology timer driver" if COMPILE_TEST
 	depends on HAS_IOMEM
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 43ef16a4efa6..d2998601eda5 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_CLKBLD_I8253)	+= i8253.o
 obj-$(CONFIG_CLKSRC_MMIO)	+= mmio.o
 obj-$(CONFIG_DAVINCI_TIMER)	+= timer-davinci.o
 obj-$(CONFIG_DIGICOLOR_TIMER)	+= timer-digicolor.o
+obj-$(CONFIG_ECONET_EN751221_TIMER)	+= timer-econet-en751221.o
 obj-$(CONFIG_OMAP_DM_TIMER)	+= timer-ti-dm.o
 obj-$(CONFIG_OMAP_DM_SYSTIMER)	+= timer-ti-dm-systimer.o
 obj-$(CONFIG_DW_APB_TIMER)	+= dw_apb_timer.o
diff --git a/drivers/clocksource/timer-econet-en751221.c b/drivers/clocksource/timer-econet-en751221.c
new file mode 100644
index 000000000000..9cfeead09377
--- /dev/null
+++ b/drivers/clocksource/timer-econet-en751221.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Timer present on EcoNet EN75xx MIPS based SoCs.
+ *
+ * Copyright (C) 2025 by Caleb James DeLisle <cjd@cjdns.fr>
+ */
+
+#include <linux/io.h>
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/clockchips.h>
+#include <linux/sched_clock.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/cpuhotplug.h>
+#include <linux/clk.h>
+
+#define ECONET_BITS			32
+#define ECONET_MIN_DELTA		0x00001000
+#define ECONET_MAX_DELTA		GENMASK(ECONET_BITS - 2, 0)
+/* 34Kc hardware has 1 block and 1004Kc has 2. */
+#define ECONET_NUM_BLOCKS		DIV_ROUND_UP(NR_CPUS, 2)
+
+static struct {
+	void __iomem	*membase[ECONET_NUM_BLOCKS];
+	u32		freq_hz;
+} econet_timer __ro_after_init;
+
+static DEFINE_PER_CPU(struct clock_event_device, econet_timer_pcpu);
+
+/* Each memory block has 2 timers, the order of registers is:
+ * CTL, CMR0, CNT0, CMR1, CNT1
+ */
+static inline void __iomem *reg_ctl(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1];
+}
+
+static inline void __iomem *reg_compare(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x04;
+}
+
+static inline void __iomem *reg_count(u32 timer_n)
+{
+	return econet_timer.membase[timer_n >> 1] + (timer_n & 1) * 0x08 + 0x08;
+}
+
+static inline u32 ctl_bit_enabled(u32 timer_n)
+{
+	return 1U << (timer_n & 1);
+}
+
+static inline u32 ctl_bit_pending(u32 timer_n)
+{
+	return 1U << ((timer_n & 1) + 16);
+}
+
+static bool cevt_is_pending(int cpu_id)
+{
+	return ioread32(reg_ctl(cpu_id)) & ctl_bit_pending(cpu_id);
+}
+
+static irqreturn_t cevt_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *dev = this_cpu_ptr(&econet_timer_pcpu);
+	int cpu = cpumask_first(dev->cpumask);
+
+	if (!cevt_is_pending(cpu)) {
+		pr_debug("%s IRQ %d on CPU %d is not pending\n", __func__, irq, cpu);
+		return IRQ_NONE;
+	}
+
+	iowrite32(ioread32(reg_count(cpu)), reg_compare(cpu));
+	dev->event_handler(dev);
+	return IRQ_HANDLED;
+}
+
+static int cevt_set_next_event(ulong delta, struct clock_event_device *dev)
+{
+	u32 next;
+	int cpu;
+
+	cpu = cpumask_first(dev->cpumask);
+	next = ioread32(reg_count(cpu)) + delta;
+	iowrite32(next, reg_compare(cpu));
+
+	if ((s32)(next - ioread32(reg_count(cpu))) < ECONET_MIN_DELTA / 2)
+		return -ETIME;
+
+	return 0;
+}
+
+static int cevt_init_cpu(uint cpu)
+{
+	struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, cpu);
+	u32 reg;
+
+	pr_info("%s: Setting up clockevent for CPU %d\n", cd->name, cpu);
+
+	reg = ioread32(reg_ctl(cpu)) | ctl_bit_enabled(cpu);
+	iowrite32(reg, reg_ctl(cpu));
+
+	enable_percpu_irq(cd->irq, IRQ_TYPE_NONE);
+
+	/* Do this last because it synchronously configures the timer */
+	clockevents_config_and_register(
+		cd, econet_timer.freq_hz,
+		ECONET_MIN_DELTA, ECONET_MAX_DELTA);
+
+	return 0;
+}
+
+static u64 notrace sched_clock_read(void)
+{
+	/* Always read from clock zero no matter the CPU */
+	return (u64)ioread32(reg_count(0));
+}
+
+/* Init */
+
+static void __init cevt_dev_init(uint cpu)
+{
+	iowrite32(0, reg_count(cpu));
+	iowrite32(U32_MAX, reg_compare(cpu));
+}
+
+static int __init cevt_init(struct device_node *np)
+{
+	int i, irq, ret;
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (irq <= 0) {
+		pr_err("%pOFn: irq_of_parse_and_map failed", np);
+		return -EINVAL;
+	}
+
+	ret = request_percpu_irq(irq, cevt_interrupt, np->name, &econet_timer_pcpu);
+
+	if (ret < 0) {
+		pr_err("%pOFn: IRQ %d setup failed (%d)\n", np, irq, ret);
+		goto err_unmap_irq;
+	}
+
+	for_each_possible_cpu(i) {
+		struct clock_event_device *cd = &per_cpu(econet_timer_pcpu, i);
+
+		cd->rating		= 310,
+		cd->features		= CLOCK_EVT_FEAT_ONESHOT |
+					  CLOCK_EVT_FEAT_C3STOP |
+					  CLOCK_EVT_FEAT_PERCPU;
+		cd->set_next_event	= cevt_set_next_event;
+		cd->irq			= irq;
+		cd->cpumask		= cpumask_of(i);
+		cd->name		= np->name;
+
+		cevt_dev_init(i);
+	}
+
+	cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
+			  "clockevents/en75/timer:starting",
+			  cevt_init_cpu, NULL);
+	return 0;
+
+err_unmap_irq:
+	irq_dispose_mapping(irq);
+	return ret;
+}
+
+static int __init timer_init(struct device_node *np)
+{
+	int num_blocks = DIV_ROUND_UP(num_possible_cpus(), 2);
+	struct clk *clk;
+	int ret;
+
+	clk = of_clk_get(np, 0);
+	if (IS_ERR(clk)) {
+		pr_err("%pOFn: Failed to get CPU clock from DT %ld\n", np, PTR_ERR(clk));
+		return PTR_ERR(clk);
+	}
+
+	econet_timer.freq_hz = clk_get_rate(clk);
+
+	for (int i = 0; i < num_blocks; i++) {
+		econet_timer.membase[i] = of_iomap(np, i);
+		if (!econet_timer.membase[i]) {
+			pr_err("%pOFn: failed to map register [%d]\n", np, i);
+			return -ENXIO;
+		}
+	}
+
+	/* For clocksource purposes always read clock zero, whatever the CPU */
+	ret = clocksource_mmio_init(reg_count(0), np->name,
+				    econet_timer.freq_hz, 301, ECONET_BITS,
+				    clocksource_mmio_readl_up);
+	if (ret) {
+		pr_err("%pOFn: clocksource_mmio_init failed: %d", np, ret);
+		return ret;
+	}
+
+	ret = cevt_init(np);
+	if (ret < 0)
+		return ret;
+
+	sched_clock_register(sched_clock_read, ECONET_BITS,
+			     econet_timer.freq_hz);
+
+	pr_info("%pOFn: using %u.%03u MHz high precision timer\n", np,
+		econet_timer.freq_hz / 1000000,
+		(econet_timer.freq_hz / 1000) % 1000);
+
+	return 0;
+}
+
+TIMER_OF_DECLARE(econet_timer_hpt, "econet,en751221-timer", timer_init);
-- 
2.39.5


