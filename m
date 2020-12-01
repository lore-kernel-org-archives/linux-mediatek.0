Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF00EC64E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 13:54:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5833A20705
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 13:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kwRmn7tJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fWkVbO6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5833A20705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZKBaZU5TrdE7Ywj6l5TwR37dAwTy58qb2goiB63EUqk=; b=kwRmn7tJ3c3I6J/bGNkQGQQce
	cqRpy7nJGZa+82nvJ60XbylYEDvfhpAgIdNBn/cFCe7pQLffgOYiXXgZbE8f9npKtlqUNCHpPQZ3A
	cGV5nY5vSBnIqnAOIMV0DvwJqjxcV7CQxLR+RPQMF2YQxQbaM0L/x+YKtqWZsHvDiKwBJB1bLL88C
	jzAsOaJKHILa0mYjzamGb2qu0I/+KMMCyUab/t8pcIz0yrPmdPFPMIQz+aZwmge1CseorxNSnMNZP
	iDtj00AtFA5Hs3RAxROtqAdrYKUqxDcjRLcBERmMsBxfm7jnXoegzVD7U/uAh9P1qzn8c4iJ1t1o/
	1AHSD6Mdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk67D-0002SY-8K; Tue, 01 Dec 2020 13:54:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk678-0002QL-JT; Tue, 01 Dec 2020 13:54:46 +0000
X-UUID: 33d485481975462f94a0bd79b98310b2-20201201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=npQJLYhJs4KVDbXW09nf6u01q7cqjZM8TiJu7Mfh160=; 
 b=fWkVbO6kJPS64DzM+OIsHBFo11N5uCMIK+QFt/MlEoHo16nGLZ0SfkFczqqQoNBf7+AX4n2K26v9NBUFJDt13QXdVlhebqXKKdLSmPU22fFnhe0y0d0dH3KEY4891UCxN23H2XYZhfAcZqO2127gMLxDK02sHGWHnbuTvEZqDFA=;
X-UUID: 33d485481975462f94a0bd79b98310b2-20201201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1330015963; Tue, 01 Dec 2020 05:54:21 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 05:54:29 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 21:54:30 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Dec 2020 21:54:28 +0800
Message-ID: <1606830870.6835.45.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/3] irqchip/gic: enable irq target all
From: Hanks Chen <hanks.chen@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
Date: Tue, 1 Dec 2020 21:54:30 +0800
In-Reply-To: <a3bd54fb5fe1c8ea11559d7459710263@kernel.org>
References: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
 <1606486531-25719-2-git-send-email-hanks.chen@mediatek.com>
 <a3bd54fb5fe1c8ea11559d7459710263@kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6B2837C1B7A98B135897F4FE8A9609BCBF928033311CA78B79A7698FFE212FB22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_085443_555253_A52A4246 
X-CRM114-Status: GOOD (  49.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, CC Hwang <cc.hwang@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Loda
 Chou <loda.chou@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Marc,

Sorry for the late reply.


On Fri, 2020-11-27 at 18:11 +0000, Marc Zyngier wrote:
> On 2020-11-27 14:15, Hanks Chen wrote:
> > Support for interrupt distribution design for SMP system solutions.
> 
> As far as I know, we have been supporting interrupt distribution on
> ARM SMP systems pretty well for the past... what... 15 years?
> I'm sure Russell can dig out an ARM926 SMP system that even predates
> that.
> 
> > With this feature enabled ,the SPI interrupts would be routed to
> > all the cores rather than boot core to achieve better
> > load balance of interrupt handling.
> 
> Please quantify this compared to the current distribution method.
> 
Got it, but I need some time to prepare for the demonstration.
I'll show it soon.
Btw, it is good on IO bandwidth-sensitive applications, we could also
use androbench to recognize it.

> > That is, interrupts might be serviced simultaneously on different CPUs.
> 
> They already can. What is new here? Or do you mean the *same* interrupt
> being serviced by different CPUs *at the same time*? That'd be fun.
> 

It is my fault, I used the imprecise word to describe it.
Not mean 'same interrupt being serviced by different CPUs'.
You are right, we can use affinity API to achieve 'different CPUs'
However, I focus on HW behavior.
If we don't change the setting of affinity(target to boot CPU),
SPI IRQs might still be serviced on different CPUs after applying target
all.

> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > ---
> >  drivers/irqchip/Kconfig            |  12 ++++
> >  drivers/irqchip/irq-gic-v3.c       | 107 +++++++++++++++++++++--------
> >  include/linux/irqchip/arm-gic-v3.h |   1 +
> >  kernel/irq/cpuhotplug.c            |  22 ++++++
> >  kernel/irq/manage.c                |   7 ++
> >  5 files changed, 122 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index c6098eee0c7c..c88ee7731e92 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -597,4 +597,16 @@ config MST_IRQ
> >  	help
> >  	  Support MStar Interrupt Controller.
> > 
> > +config ARM_IRQ_TARGET_ALL
> > +	bool "Distribute interrupts across processors on SMP system"
> > +	depends on SMP && ARM_GIC_V3
> > +	help
> > +	  Support for interrupt distribution design for
> > +	  SMP system solutions. With this feature enabled ,the
> > +	  SPI interrupts would be routed to all the cores rather
> > +	  than boot cpu to achieve better load balance of interrupt
> > +	  handling
> > +
> > +	  If you don't know what to do here, say N.
> 
> There is no way we start introducing conditional compilation for
> architectural features. Either this works at all times, or it doesn't
> exist.
> 
I have no idea how to solve it.
Indeed, it is not good to enable the feature on every ARM-based
platform.
maybe I could use device tree to determine whether or not the feature
should be enabled.
e.g.
gic: interrupt-controller {
	compatible = "arm,gic-v3";
	...
	irq-target-all-enable = <1>;
};

Would this be better?

> > +
> >  endmenu
> > diff --git a/drivers/irqchip/irq-gic-v3.c 
> > b/drivers/irqchip/irq-gic-v3.c
> > index 16fecc0febe8..62a878ce4681 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -381,6 +381,12 @@ static inline bool gic_supports_nmi(void)
> >  	       static_branch_likely(&supports_pseudo_nmis);
> >  }
> > 
> > +static inline bool gic_supports_1n(void)
> > +{
> > +	return (IS_ENABLED(CONFIG_ARM_IRQ_TARGET_ALL) &&
> > +		~(readl_relaxed(gic_data.dist_base + GICD_TYPER) & 
> > GICD_TYPER_No1N));
> > +}
> > +
> >  static int gic_irq_set_irqchip_state(struct irq_data *d,
> >  				     enum irqchip_irq_state which, bool val)
> >  {
> > @@ -716,6 +722,7 @@ static void __init gic_dist_init(void)
> >  {
> >  	unsigned int i;
> >  	u64 affinity;
> > +
> 
> Spurious whitespace.

Got it, I'll fix it.

> 
> >  	void __iomem *base = gic_data.dist_base;
> >  	u32 val;
> > 
> > @@ -759,16 +766,27 @@ static void __init gic_dist_init(void)
> >  	/* Enable distributor with ARE, Group1 */
> >  	writel_relaxed(val, base + GICD_CTLR);
> > 
> > -	/*
> > -	 * Set all global interrupts to the boot CPU only. ARE must be
> > -	 * enabled.
> > -	 */
> > -	affinity = 
> > gic_mpidr_to_affinity(cpu_logical_map(smp_processor_id()));
> > -	for (i = 32; i < GIC_LINE_NR; i++)
> > -		gic_write_irouter(affinity, base + GICD_IROUTER + i * 8);
> > +	if (!gic_supports_1n()) {
> > +		/*
> > +		 * Set all global interrupts to the boot CPU only. ARE must be
> > +		 * enabled.
> > +		 */
> > +		affinity = 
> > gic_mpidr_to_affinity(cpu_logical_map(smp_processor_id()));
> > +		for (i = 32; i < GIC_LINE_NR; i++)
> > +			gic_write_irouter(affinity, base + GICD_IROUTER + i * 8);
> > 
> > -	for (i = 0; i < GIC_ESPI_NR; i++)
> > -		gic_write_irouter(affinity, base + GICD_IROUTERnE + i * 8);
> > +		for (i = 0; i < GIC_ESPI_NR; i++)
> > +			gic_write_irouter(affinity, base + GICD_IROUTERnE + i * 8);
> > +	} else {
> > +		/* default set target all for all SPI */
> > +		for (i = 32; i < GIC_LINE_NR; i++)
> > +			gic_write_irouter(GICD_IROUTER_SPI_MODE_ANY,
> > +					  base + GICD_IROUTER + i * 8);
> > +
> > +		for (i = 0; i < GIC_ESPI_NR; i++)
> > +			gic_write_irouter(GICD_IROUTER_SPI_MODE_ANY,
> > +					  base + GICD_IROUTERnE + i * 8);
> 
> Why should we decide to distribute interrupts to all CPUs by default 
> when
> we don't even know where to route them?
> 
It makes sense to dispatch SPI interrupts defaultly by GICD when we
transfer the control to GIC HW.
It's more real time to track the IRQ balance by HW controller and the
policy is based on CPU state or low power purpose.

btw, we also want to introduce the interrupt class to our big-little
system.It is an implementation-defined feature that the GIC600 provides
for the 1 of N SPIs.

> > +	}
> >  }
> > 
> >  static int gic_iterate_rdists(int (*fn)(struct redist_region *, void
> > __iomem *))
> > @@ -1191,29 +1209,64 @@ static int gic_set_affinity(struct irq_data
> > *d, const struct cpumask *mask_val,
> >  	if (gic_irq_in_rdist(d))
> >  		return -EINVAL;
> > 
> > -	/* If interrupt was enabled, disable it first */
> > -	enabled = gic_peek_irq(d, GICD_ISENABLER);
> > -	if (enabled)
> > -		gic_mask_irq(d);
> > +	if (!gic_supports_1n()) {
> > +		/* If interrupt was enabled, disable it first */
> > +		enabled = gic_peek_irq(d, GICD_ISENABLER);
> > +		if (enabled)
> > +			gic_mask_irq(d);
> > 
> > -	offset = convert_offset_index(d, GICD_IROUTER, &index);
> > -	reg = gic_dist_base(d) + offset + (index * 8);
> > -	val = gic_mpidr_to_affinity(cpu_logical_map(cpu));
> > +		offset = convert_offset_index(d, GICD_IROUTER, &index);
> > +		reg = gic_dist_base(d) + offset + (index * 8);
> > +		val = gic_mpidr_to_affinity(cpu_logical_map(cpu));
> > 
> > -	gic_write_irouter(val, reg);
> > +		gic_write_irouter(val, reg);
> > 
> > -	/*
> > -	 * If the interrupt was enabled, enabled it again. Otherwise,
> > -	 * just wait for the distributor to have digested our changes.
> > -	 */
> > -	if (enabled)
> > -		gic_unmask_irq(d);
> > -	else
> > -		gic_dist_wait_for_rwp();
> > +		/*
> > +		 * If the interrupt was enabled, enabled it again. Otherwise,
> > +		 * just wait for the distributor to have digested our changes.
> > +		 */
> > +		if (enabled)
> > +			gic_unmask_irq(d);
> > +		else
> > +			gic_dist_wait_for_rwp();
> > +
> > +		irq_data_update_effective_affinity(d, cpumask_of(cpu));
> > +
> > +	} else {
> > +		/*
> > +		 * no need to update when:
> > +		 * input mask is equal to the current setting
> > +		 */
> > +		if (cpumask_equal(irq_data_get_affinity_mask(d), mask_val))
> > +			return IRQ_SET_MASK_OK_NOCOPY;
> > +
> > +		/* If interrupt was enabled, disable it first */
> > +		enabled = gic_peek_irq(d, GICD_ISENABLER);
> > +		if (enabled)
> > +			gic_mask_irq(d);
> > +
> > +		offset = convert_offset_index(d, GICD_IROUTER, &index);
> > +		reg = gic_dist_base(d) + offset + (index * 8);
> > 
> > -	irq_data_update_effective_affinity(d, cpumask_of(cpu));
> > +		/* GICv3 supports target is 1 or all */
> > +		if (cpumask_weight(mask_val) > 1)
> > +			val = GICD_IROUTER_SPI_MODE_ANY;
> 
> There is a massive difference between targeting more than one CPU
> and targeting all the CPUs. This breaks all existing drivers and
> userspace that need to manage interrupt affinity.
> 
Yes, it is not a good implementation that cause the user-space confused.
Should I modify the code as follows?

If (bitmap_equal(mask_val, online_mask, nr_cpumask_bits))
	val = GICD_IROUTER_SPI_MODE_ANY;

redefine the coverage

> > +		else
> > +			val = gic_mpidr_to_affinity(cpu_logical_map(cpu));
> > +
> > +		gic_write_irouter(val, reg);
> > +
> > +		/*
> > +		 * If the interrupt was enabled, enabled it again. Otherwise,
> > +		 * just wait for the distributor to have digested our changes.
> > +		 */
> > +		if (enabled)
> > +			gic_unmask_irq(d);
> > +		else
> > +			gic_dist_wait_for_rwp();
> 
> Why so much code duplication?

Got it, I'll remove the duplicated code.

> 
> > +	}
> > 
> > -	return IRQ_SET_MASK_OK_DONE;
> > +	return IRQ_SET_MASK_OK;
> >  }
> >  #else
> >  #define gic_set_affinity	NULL
> > diff --git a/include/linux/irqchip/arm-gic-v3.h
> > b/include/linux/irqchip/arm-gic-v3.h
> > index f6d092fdb93d..c24336d506a3 100644
> > --- a/include/linux/irqchip/arm-gic-v3.h
> > +++ b/include/linux/irqchip/arm-gic-v3.h
> > @@ -80,6 +80,7 @@
> >  #define GICD_CTLR_ENABLE_SS_G0		(1U << 0)
> > 
> >  #define GICD_TYPER_RSS			(1U << 26)
> > +#define GICD_TYPER_No1N			(1U << 25)
> >  #define GICD_TYPER_LPIS			(1U << 17)
> >  #define GICD_TYPER_MBIS			(1U << 16)
> >  #define GICD_TYPER_ESPI			(1U << 8)
> > diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
> > index 02236b13b359..779512e44960 100644
> > --- a/kernel/irq/cpuhotplug.c
> > +++ b/kernel/irq/cpuhotplug.c
> > @@ -87,6 +87,18 @@ static bool migrate_one_irq(struct irq_desc *desc)
> >  		return false;
> >  	}
> > 
> > +#ifdef CONFIG_ARM_IRQ_TARGET_ALL
> 
> No way.
> 
> > +	/*
> > +	 * No move required, if interrupt is 1 of N IRQ.
> > +	 * write current cpu_online_mask into affinity mask.
> > +	 */
> > +	if (cpumask_weight(desc->irq_common_data.affinity) > 1) {
> > +		cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);
> 
> Again, this is totally bogus.
> 

If I add the target all flag into irq_common_data stucture to
distinguish it. Would this be better?

remove #ifdef CONFIG_ARM_IRQ_TARGET_ALL

and

if (desc->irq_common_data.irq_target_all)
	cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);


> > +
> > +		return false;
> > +	}
> > +#endif
> > +
> >  	/*
> >  	 * Complete an eventually pending irq move cleanup. If this
> >  	 * interrupt was moved in hard irq context, then the vectors need
> > @@ -191,6 +203,16 @@ static void irq_restore_affinity_of_irq(struct
> > irq_desc *desc, unsigned int cpu)
> >  	struct irq_data *data = irq_desc_get_irq_data(desc);
> >  	const struct cpumask *affinity = irq_data_get_affinity_mask(data);
> > 
> > +#ifdef CONFIG_ARM_IRQ_TARGET_ALL
> > +	/*
> > +	 * No restore required, if interrupt is 1 of N IRQ.
> > +	 */
> > +	if (cpumask_weight(affinity) > 1) {
> > +		cpumask_set_cpu(cpu, irq_data_get_affinity_mask(data));
> > +		return;
> > +	}
> 
> Same thing.
> 

as above

remove #ifdef CONFIG_ARM_IRQ_TARGET_ALL

and

if (desc->irq_common_data.irq_target_all) {
	cpumask_set_cpu(cpu, irq_data_get_affinity_mask(data));
	return;
}

> > +#endif
> > +
> >  	if (!irqd_affinity_is_managed(data) || !desc->action ||
> >  	    !irq_data_get_irq_chip(data) || !cpumask_test_cpu(cpu, affinity))
> >  		return;
> > diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> > index c460e0496006..770b97e326bd 100644
> > --- a/kernel/irq/manage.c
> > +++ b/kernel/irq/manage.c
> > @@ -270,7 +270,14 @@ int irq_do_set_affinity(struct irq_data *data,
> > const struct cpumask *mask,
> >  	switch (ret) {
> >  	case IRQ_SET_MASK_OK:
> >  	case IRQ_SET_MASK_OK_DONE:
> > +#ifndef CONFIG_ARM_IRQ_TARGET_ALL
> >  		cpumask_copy(desc->irq_common_data.affinity, mask);
> > +#else
> > +		if (cpumask_weight(mask) > 1)
> > +			cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);
> > +		else
> > +			cpumask_copy(desc->irq_common_data.affinity, mask);
> 
> And again.
> 

as above
if (!desc->irq_common_data.irq_target_all)
	cpumask_copy(desc->irq_common_data.affinity, mask);
else
	cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);

> > +#endif
> >  		fallthrough;
> >  	case IRQ_SET_MASK_OK_NOCOPY:
> >  		irq_validate_effective_affinity(data);
> 
> To sum it up:
> 
> - You claim that the current interrupt distribution model is either non
>    functional or inefficient. I expect you to demonstrate this.
> 
> - You claim that this brings some kind of improvement: I expect you to
>    describe workloads and numbers that demonstrate the improvements.
>    1:N distribution has repeatedly shown to have much worse behaviour
>    that 1:1 distribution, so I really wonder what's new here.
> 
I'll show the demonstration to answer first two questions.

> - You break existing APIs where a driver or userspace can legitimately
>    decide to route an interrupt to 2 CPUs out of 256 if it decides to.
>    That's not acceptable.
> 
I redefine the coverage as above

> - You pollute the core code with hacks that should never be there. If 
> the
>    current behaviour is a problem, please state what the problem is.
> 

We found the RCU warn when IRQs target to a offline CPU without I bit
masked in CPU hot-plug flow
I'll reproduce the issue again and show the log analysis for it. 

> - You don't factor in the requirements of the pseudo-NMI masking, 
> meaning
>    the IRI doesn't know about the current PMR and will not be able to
>    efficiently dispatch interrupts.
> 
Yes. mask interrupts using PMR becomes very expensive. (require a dsb)
We don't use the pseduo-NMI in our platform.
Thank you for pointing that out, I need some time to mull it over.

> - I don't see anything that configures the participating nodes to the 
> 1:N
>    distribution, meaning it currently works by chance.
> 
1 of N SPI is dispatched by GICD with round robin policy by default.
However, GIC support the interface to control the policy of dispatching
SPI interrupt.
In MTK platform, GICD could dispatch SPI interrupts to suitable target
CPU by CPU state or low power purpose.

> - How does it work with CPU hotplug, where we actively move the 
> interrupts
>    away from a CPU going down? With this scheme, the interrupts keep 
> being
>    delivered to the wrong CPU, resulting in lost interrupts if they were
>    edge triggered.
> 

Hot-plug off CPU would assert the GICR_WAKER.ProcessorSleep and
GICR_CTLR.DPG in trusted firmware cortex-a (TF-a)
1) When ProcessorSleep is 1
All interrupts that arrive at the re-distributor are not communicated to
the CPU interface
2) When DPG is 1
Any interrupts that have not reached a core at the time of the change
are recalled and reprioritized by
the GIC

hot-plug off sequence. (PSCI in TF-a)
1. Mask interrupts on the core
2. Clear the CPU interface enables
3. GICR_WAKER.ProcessorSleep = 1
4. GICR_CTLR.DPG = 1 (we need to add it when 1 of N SPIs feature is
enabled)

According to the above, I think it would keep the edge-triggered
interrupt in GIC.


> As it stands, I can't imagine this code making it in the kernel.
> 
> Thanks,
> 
>          M.

In MTK platform, We change the dispatch policy of 1:N SPIs by interface
of interrupt routing infrastructure
and it would improve our system performance.

GICR_CTLR.DPG, cpu_active and interrupt class could also change the
policy of 1:N SPIs.
So we want to introduce the interface for 1 of N SPIs to provide more
choices.
But I need to carefully consider the various scenario on all arm64
system and don't break the established API.
I need some time to mull it over.

Thank you for your review

Hanks



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
