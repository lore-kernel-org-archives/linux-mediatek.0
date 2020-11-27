Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D5BC63798
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 14:25:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7339621D7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 14:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3U+zQlkw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="raaH+hf0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7339621D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZiJyultdatJ7gIvYxo8vuqVbEpFIKrVnKd3XKa7YuCA=; b=3U+zQlkwgR/J2aiy0IsRBEfbZ
	nkZsba6KaY1n2vhE/uJlYMGSmEkIOIoE+Pt7YSXThpwyTQFV20RNFtZuaWV09P/LJNhlc4Ri4i0BY
	xXtidPCclQFB7dKnDHDqBpGYBQk8l1uYNtNPcJu6R2MMewV8hFl6tIwRmpN4guBTyQ5zKEUkcnkVI
	jgMRY8o07BPoYV93vJ5Mq8IjgFqYxQf6TCmomfTQWRIwK36zf9eZCxmHcOGxqK0VNb5DOIPIgTc1/
	kO3sgNIVSpaUyB5gla/Y35fM8LEDzg/+FEHyw0FlrdpKH0IKRgU6Y3dOc4HLXcLvGH53Bo76cRzFR
	0K4F17rBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kieh0-0001DW-Eg; Fri, 27 Nov 2020 14:25:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiegu-0001BO-Ay; Fri, 27 Nov 2020 14:25:41 +0000
X-UUID: 6f198943fdc44e5bbff859155be812a2-20201127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cTb/P/g1NKmtcCLpR16U3BIG3MESWcm6IG1Z/CQgAWI=; 
 b=raaH+hf0/eCDGD84sq86maqIorCdBHWqsYJwwI/lx1xz/ZYlqsGMFlce3df/gI9ULW9yWUoE8G/VDaDyZMmAm0rdqGPSX92aojBZUOVbpAZMgrisGa18cUU0NSATMCtRi2Wptvnqz6dmE5ICimBJ1XycTFEAGQXnIkLNs2pBUWQ=;
X-UUID: 6f198943fdc44e5bbff859155be812a2-20201127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1982670556; Fri, 27 Nov 2020 06:25:58 -0800
Received: from MTKMBS09N2.mediatek.inc (172.21.101.94) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 06:15:34 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 27 Nov 2020 22:15:33 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 27 Nov 2020 22:15:32 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Subject: [PATCH v1 1/3] irqchip/gic: enable irq target all
Date: Fri, 27 Nov 2020 22:15:29 +0800
Message-ID: <1606486531-25719-2-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
References: <1606486531-25719-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_092540_540929_4B262A80 
X-CRM114-Status: GOOD (  25.44  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support for interrupt distribution design for SMP system solutions.

With this feature enabled ,the SPI interrupts would be routed to
all the cores rather than boot core to achieve better
load balance of interrupt handling.
That is, interrupts might be serviced simultaneously on different CPUs.

Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 drivers/irqchip/Kconfig            |  12 ++++
 drivers/irqchip/irq-gic-v3.c       | 107 +++++++++++++++++++++--------
 include/linux/irqchip/arm-gic-v3.h |   1 +
 kernel/irq/cpuhotplug.c            |  22 ++++++
 kernel/irq/manage.c                |   7 ++
 5 files changed, 122 insertions(+), 27 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index c6098eee0c7c..c88ee7731e92 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -597,4 +597,16 @@ config MST_IRQ
 	help
 	  Support MStar Interrupt Controller.
 
+config ARM_IRQ_TARGET_ALL
+	bool "Distribute interrupts across processors on SMP system"
+	depends on SMP && ARM_GIC_V3
+	help
+	  Support for interrupt distribution design for
+	  SMP system solutions. With this feature enabled ,the
+	  SPI interrupts would be routed to all the cores rather
+	  than boot cpu to achieve better load balance of interrupt
+	  handling
+
+	  If you don't know what to do here, say N.
+
 endmenu
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 16fecc0febe8..62a878ce4681 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -381,6 +381,12 @@ static inline bool gic_supports_nmi(void)
 	       static_branch_likely(&supports_pseudo_nmis);
 }
 
+static inline bool gic_supports_1n(void)
+{
+	return (IS_ENABLED(CONFIG_ARM_IRQ_TARGET_ALL) &&
+		~(readl_relaxed(gic_data.dist_base + GICD_TYPER) & GICD_TYPER_No1N));
+}
+
 static int gic_irq_set_irqchip_state(struct irq_data *d,
 				     enum irqchip_irq_state which, bool val)
 {
@@ -716,6 +722,7 @@ static void __init gic_dist_init(void)
 {
 	unsigned int i;
 	u64 affinity;
+
 	void __iomem *base = gic_data.dist_base;
 	u32 val;
 
@@ -759,16 +766,27 @@ static void __init gic_dist_init(void)
 	/* Enable distributor with ARE, Group1 */
 	writel_relaxed(val, base + GICD_CTLR);
 
-	/*
-	 * Set all global interrupts to the boot CPU only. ARE must be
-	 * enabled.
-	 */
-	affinity = gic_mpidr_to_affinity(cpu_logical_map(smp_processor_id()));
-	for (i = 32; i < GIC_LINE_NR; i++)
-		gic_write_irouter(affinity, base + GICD_IROUTER + i * 8);
+	if (!gic_supports_1n()) {
+		/*
+		 * Set all global interrupts to the boot CPU only. ARE must be
+		 * enabled.
+		 */
+		affinity = gic_mpidr_to_affinity(cpu_logical_map(smp_processor_id()));
+		for (i = 32; i < GIC_LINE_NR; i++)
+			gic_write_irouter(affinity, base + GICD_IROUTER + i * 8);
 
-	for (i = 0; i < GIC_ESPI_NR; i++)
-		gic_write_irouter(affinity, base + GICD_IROUTERnE + i * 8);
+		for (i = 0; i < GIC_ESPI_NR; i++)
+			gic_write_irouter(affinity, base + GICD_IROUTERnE + i * 8);
+	} else {
+		/* default set target all for all SPI */
+		for (i = 32; i < GIC_LINE_NR; i++)
+			gic_write_irouter(GICD_IROUTER_SPI_MODE_ANY,
+					  base + GICD_IROUTER + i * 8);
+
+		for (i = 0; i < GIC_ESPI_NR; i++)
+			gic_write_irouter(GICD_IROUTER_SPI_MODE_ANY,
+					  base + GICD_IROUTERnE + i * 8);
+	}
 }
 
 static int gic_iterate_rdists(int (*fn)(struct redist_region *, void __iomem *))
@@ -1191,29 +1209,64 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
 	if (gic_irq_in_rdist(d))
 		return -EINVAL;
 
-	/* If interrupt was enabled, disable it first */
-	enabled = gic_peek_irq(d, GICD_ISENABLER);
-	if (enabled)
-		gic_mask_irq(d);
+	if (!gic_supports_1n()) {
+		/* If interrupt was enabled, disable it first */
+		enabled = gic_peek_irq(d, GICD_ISENABLER);
+		if (enabled)
+			gic_mask_irq(d);
 
-	offset = convert_offset_index(d, GICD_IROUTER, &index);
-	reg = gic_dist_base(d) + offset + (index * 8);
-	val = gic_mpidr_to_affinity(cpu_logical_map(cpu));
+		offset = convert_offset_index(d, GICD_IROUTER, &index);
+		reg = gic_dist_base(d) + offset + (index * 8);
+		val = gic_mpidr_to_affinity(cpu_logical_map(cpu));
 
-	gic_write_irouter(val, reg);
+		gic_write_irouter(val, reg);
 
-	/*
-	 * If the interrupt was enabled, enabled it again. Otherwise,
-	 * just wait for the distributor to have digested our changes.
-	 */
-	if (enabled)
-		gic_unmask_irq(d);
-	else
-		gic_dist_wait_for_rwp();
+		/*
+		 * If the interrupt was enabled, enabled it again. Otherwise,
+		 * just wait for the distributor to have digested our changes.
+		 */
+		if (enabled)
+			gic_unmask_irq(d);
+		else
+			gic_dist_wait_for_rwp();
+
+		irq_data_update_effective_affinity(d, cpumask_of(cpu));
+
+	} else {
+		/*
+		 * no need to update when:
+		 * input mask is equal to the current setting
+		 */
+		if (cpumask_equal(irq_data_get_affinity_mask(d), mask_val))
+			return IRQ_SET_MASK_OK_NOCOPY;
+
+		/* If interrupt was enabled, disable it first */
+		enabled = gic_peek_irq(d, GICD_ISENABLER);
+		if (enabled)
+			gic_mask_irq(d);
+
+		offset = convert_offset_index(d, GICD_IROUTER, &index);
+		reg = gic_dist_base(d) + offset + (index * 8);
 
-	irq_data_update_effective_affinity(d, cpumask_of(cpu));
+		/* GICv3 supports target is 1 or all */
+		if (cpumask_weight(mask_val) > 1)
+			val = GICD_IROUTER_SPI_MODE_ANY;
+		else
+			val = gic_mpidr_to_affinity(cpu_logical_map(cpu));
+
+		gic_write_irouter(val, reg);
+
+		/*
+		 * If the interrupt was enabled, enabled it again. Otherwise,
+		 * just wait for the distributor to have digested our changes.
+		 */
+		if (enabled)
+			gic_unmask_irq(d);
+		else
+			gic_dist_wait_for_rwp();
+	}
 
-	return IRQ_SET_MASK_OK_DONE;
+	return IRQ_SET_MASK_OK;
 }
 #else
 #define gic_set_affinity	NULL
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index f6d092fdb93d..c24336d506a3 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -80,6 +80,7 @@
 #define GICD_CTLR_ENABLE_SS_G0		(1U << 0)
 
 #define GICD_TYPER_RSS			(1U << 26)
+#define GICD_TYPER_No1N			(1U << 25)
 #define GICD_TYPER_LPIS			(1U << 17)
 #define GICD_TYPER_MBIS			(1U << 16)
 #define GICD_TYPER_ESPI			(1U << 8)
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index 02236b13b359..779512e44960 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -87,6 +87,18 @@ static bool migrate_one_irq(struct irq_desc *desc)
 		return false;
 	}
 
+#ifdef CONFIG_ARM_IRQ_TARGET_ALL
+	/*
+	 * No move required, if interrupt is 1 of N IRQ.
+	 * write current cpu_online_mask into affinity mask.
+	 */
+	if (cpumask_weight(desc->irq_common_data.affinity) > 1) {
+		cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);
+
+		return false;
+	}
+#endif
+
 	/*
 	 * Complete an eventually pending irq move cleanup. If this
 	 * interrupt was moved in hard irq context, then the vectors need
@@ -191,6 +203,16 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
 	struct irq_data *data = irq_desc_get_irq_data(desc);
 	const struct cpumask *affinity = irq_data_get_affinity_mask(data);
 
+#ifdef CONFIG_ARM_IRQ_TARGET_ALL
+	/*
+	 * No restore required, if interrupt is 1 of N IRQ.
+	 */
+	if (cpumask_weight(affinity) > 1) {
+		cpumask_set_cpu(cpu, irq_data_get_affinity_mask(data));
+		return;
+	}
+#endif
+
 	if (!irqd_affinity_is_managed(data) || !desc->action ||
 	    !irq_data_get_irq_chip(data) || !cpumask_test_cpu(cpu, affinity))
 		return;
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index c460e0496006..770b97e326bd 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -270,7 +270,14 @@ int irq_do_set_affinity(struct irq_data *data, const struct cpumask *mask,
 	switch (ret) {
 	case IRQ_SET_MASK_OK:
 	case IRQ_SET_MASK_OK_DONE:
+#ifndef CONFIG_ARM_IRQ_TARGET_ALL
 		cpumask_copy(desc->irq_common_data.affinity, mask);
+#else
+		if (cpumask_weight(mask) > 1)
+			cpumask_copy(desc->irq_common_data.affinity, cpu_online_mask);
+		else
+			cpumask_copy(desc->irq_common_data.affinity, mask);
+#endif
 		fallthrough;
 	case IRQ_SET_MASK_OK_NOCOPY:
 		irq_validate_effective_affinity(data);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
