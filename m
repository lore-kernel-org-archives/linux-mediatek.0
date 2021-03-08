Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B523C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 06:06:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1547651EE
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 06:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1547651EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5lj3/ASVA6dgVw9doPGYf0KJJF+H752fFuYOAlHgdkA=; b=bFPOgPKNgEAFSs9qjOXWKzhWbp
	ADsBYZqm1CW+pDJ4HqkigdixHBmr4w8/An8w8lfMCl22EehHHm21Hjji+PtF4la9LpM9kcjxMemVu
	FHjb9GwA8WYUKq+vKBPjPrUF8BOOvABvaarLEF1kPWAp3VE6FyyGHP03BCArvkUs0Xu4C4eZt/ZUC
	ChHclEQ/Hyl4CsOsnvI+qMXZGFEor9mE0MhQMR06HN5X+WICm9zeNwAj3Jmq/j4bCfe3w+IQpFyzP
	JKXA+wfgdgo7VZgRmR1sj2CeaZFEyVe6SdqL5yz+VzXgiu+OTnS9iib9cIPPz9lGpoK6eWZsT4Qzr
	+z4neOGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ91v-00FPgw-Q7; Mon, 08 Mar 2021 06:06:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ91h-00FPbr-4m; Mon, 08 Mar 2021 06:06:04 +0000
X-UUID: 91f40729d6064f6eb107f9f42db975f9-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NshLRlFPPFyRJlJSwhAFYQ/LjwGkPLgFTaF0zNhyl78=; 
 b=rNHiURTN1kIlXgyQutWb0lHvGNCowuvXkdw7y/29m6cXX81c2UGR2QU787p0LK4QESq2i1ftKBOFzxjoPrGRTo5Epc2ZTfLJWLivwnzUZPdUc2GMDRlfoqFp6TZJtgUU6beSXtjOP9VJJf7k7xwdv8plXi94WLnQqP5IvD9M69w=;
X-UUID: 91f40729d6064f6eb107f9f42db975f9-20210307
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1578522733; Sun, 07 Mar 2021 22:05:49 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 22:05:48 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 14:05:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 14:05:40 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 "Daniel Palmer" <daniel@thingy.jp>, Thomas Gleixner <tglx@linutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] irqchip/irq-mst: Support polarity configuration
Date: Mon, 8 Mar 2021 14:05:38 +0800
Message-ID: <20210308060538.11164-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_060558_194562_209190F6 
X-CRM114-Status: GOOD (  17.77  )
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

Support irq polarity configuration and save and restore the config
when system suspend and resume.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/irqchip/irq-mst-intc.c | 90 ++++++++++++++++++++++++++++++++--
 1 file changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index 143657b0cf28..841b9b1c2699 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -13,15 +13,25 @@
 #include <linux/of_irq.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/syscore_ops.h>
 
-#define INTC_MASK	0x0
-#define INTC_EOI	0x20
+#define INTC_MASK		0x0
+#define INTC_REV_POLARITY	0x10
+#define INTC_EOI		0x20
+
+#ifdef CONFIG_PM_SLEEP
+static LIST_HEAD(mst_intc_list);
+#endif
 
 struct mst_intc_chip_data {
 	raw_spinlock_t	lock;
 	unsigned int	irq_start, nr_irqs;
 	void __iomem	*base;
 	bool		no_eoi;
+#ifdef CONFIG_PM_SLEEP
+	struct list_head entry;
+	u16 saved_polarity_conf[DIV_ROUND_UP(64, 16)];
+#endif
 };
 
 static void mst_set_irq(struct irq_data *d, u32 offset)
@@ -78,6 +88,19 @@ static void mst_intc_eoi_irq(struct irq_data *d)
 	irq_chip_eoi_parent(d);
 }
 
+static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
+{
+	if (type != IRQ_TYPE_LEVEL_LOW && type != IRQ_TYPE_LEVEL_HIGH)
+		return -EINVAL;
+
+	if (type == IRQ_TYPE_LEVEL_LOW) {
+		mst_set_irq(data, INTC_REV_POLARITY);
+		type = IRQ_TYPE_LEVEL_HIGH;
+	}
+
+	return irq_chip_set_type_parent(data, type);
+}
+
 static struct irq_chip mst_intc_chip = {
 	.name			= "mst-intc",
 	.irq_mask		= mst_intc_mask_irq,
@@ -87,13 +110,62 @@ static struct irq_chip mst_intc_chip = {
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
-	.irq_set_type		= irq_chip_set_type_parent,
+	.irq_set_type		= mst_irq_chip_set_type,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.flags			= IRQCHIP_SET_TYPE_MASKED |
 				  IRQCHIP_SKIP_SET_WAKE |
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
+#ifdef CONFIG_PM_SLEEP
+static void mst_intc_polarity_save(struct mst_intc_chip_data *cd)
+{
+	int i;
+	void __iomem *addr = cd->base + INTC_REV_POLARITY;
+
+	for (i = 0; i < DIV_ROUND_UP(cd->nr_irqs, 16); i++)
+		cd->saved_polarity_conf[i] = readw_relaxed(addr + i * 4);
+}
+
+static void mst_intc_polarity_restore(struct mst_intc_chip_data *cd)
+{
+	int i;
+	void __iomem *addr = cd->base + INTC_REV_POLARITY;
+
+	for (i = 0; i < DIV_ROUND_UP(cd->nr_irqs, 16); i++)
+		writew_relaxed(cd->saved_polarity_conf[i], addr + i * 4);
+}
+
+static void mst_irq_resume(void)
+{
+	struct mst_intc_chip_data *cd;
+
+	list_for_each_entry(cd, &mst_intc_list, entry)
+		mst_intc_polarity_restore(cd);
+}
+
+static int mst_irq_suspend(void)
+{
+	struct mst_intc_chip_data *cd;
+
+	list_for_each_entry(cd, &mst_intc_list, entry)
+		mst_intc_polarity_save(cd);
+	return 0;
+}
+
+static struct syscore_ops mst_irq_syscore_ops = {
+	.suspend	= mst_irq_suspend,
+	.resume		= mst_irq_resume,
+};
+
+static int __init mst_irq_pm_init(void)
+{
+	register_syscore_ops(&mst_irq_syscore_ops);
+	return 0;
+}
+late_initcall(mst_irq_pm_init);
+#endif
+
 static int mst_intc_domain_translate(struct irq_domain *d,
 				     struct irq_fwspec *fwspec,
 				     unsigned long *hwirq,
@@ -145,6 +217,14 @@ static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	parent_fwspec = *fwspec;
 	parent_fwspec.fwnode = domain->parent->fwnode;
 	parent_fwspec.param[1] = cd->irq_start + hwirq;
+
+	/*
+	 * If the irq signal is active low, configure it to active high
+	 * to meet GIC SPI spec in mst_irq_chip_set_type via REV_POLARITY bit
+	 */
+	if (fwspec->param[2] == IRQ_TYPE_LEVEL_LOW)
+		parent_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
+
 	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
 }
 
@@ -193,6 +273,10 @@ static int __init mst_intc_of_init(struct device_node *dn,
 		return -ENOMEM;
 	}
 
+#ifdef CONFIG_PM_SLEEP
+	INIT_LIST_HEAD(&cd->entry);
+	list_add_tail(&cd->entry, &mst_intc_list);
+#endif
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
