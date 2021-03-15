Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C291FC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:24:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52E2F64ED2
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52E2F64ED2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U/YzoCMT5tSvUWVWTTZMnO3bdb+yjYXylJmEaa15M88=; b=lxuUfDz78w7Z2B6KoypvgA6edU
	f6CEIymHFkBGbMh1VlDdVPyuCzzmQ5ECTduGPfLrdtUdyXTcW03VqBVQAyFJz817N/c42NxiSvlvu
	/FypxB1saAQvd13HIpUhpOjZjh9Cy2Xa4pgebwp1r49SAAZBTTh95VT+qAhlh4/Z3E9aKAlBsRK5J
	7QP9HmnoI25HtPiawLjyUd8rYC2XzHEINhzjyYEQ3bGVLeu2CCcIAdT7MLVX/c1AFkIFFirt5UZPd
	z8pjST86Zvhl/knpgrlgrWFBgyuWFEUPQ2tLJlzPn9BK+43qdeACvKePvxhK0q2fR7pGxPxFXw4eQ
	mirjwu6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLnD0-00Fwvt-W1; Mon, 15 Mar 2021 13:24:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLnCx-00Fwuu-I5
 for linux-mediatek@desiato.infradead.org; Mon, 15 Mar 2021 13:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=CGbEO8pGX3fYi0Y1tH4qURvKxf/Xh0RbcYljq5NcKaM=; b=ExYd6ZcJS23Dp8aBSHzes3g1ug
 P2qzEylmDRjDrHc+iWLR5uk/wVw/HClBbdYNAWX4VaF5vFG+ImEQlblyOotuPqAQJCrUjBtPAUIJA
 72JhFGsdV7cbsq8P2s6kEnXPUCKbZ+fY+N7MN4zWmsYT+sQ0gggNyo9BvmuNhfHlbrBwLAx0OUSsJ
 bb4NrR8BAOsMig/ytJAceywVuwpjWvDFSDMonirCGCHOYi1JEx1nSshizdtJGZ3mKiFkAqAqSTTku
 WzVI1kaxfe45Rv1QZJZlC3sE1q7kkxm1+q9z7JiCsXfirM5lQl9LvkesyvBEvL+FKSgxdQVIwgpsd
 Mq3hcyKg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLnCc-000Dqi-Bh
 for linux-mediatek@lists.infradead.org; Mon, 15 Mar 2021 13:24:17 +0000
X-UUID: 78709b8d4ed543858919ca10e73be76b-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CGbEO8pGX3fYi0Y1tH4qURvKxf/Xh0RbcYljq5NcKaM=; 
 b=W2S8PFW/GBVoletQgbJwRzAwkmzGwfWTFXDEmnIYfHFv3Ho8oT8XvwgraHAS6K7K2lgl/L5G7MMKqoHsSBqTFVXvilqyRneZSM3mOAC070SnFZoPl2m9qH791MEI/cMWEEzVyFqJRuLchRRJGpnjSy/H4tzGVg9IGAQD10GMbVw=;
X-UUID: 78709b8d4ed543858919ca10e73be76b-20210315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1290852451; Mon, 15 Mar 2021 05:18:53 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 06:18:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 21:18:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Mar 2021 21:18:49 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
CC: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer
 <daniel@thingy.jp>, Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <yj.chiang@mediatek.com>
Subject: [PATCH v4] irqchip/irq-mst: Support polarity configuration
Date: Mon, 15 Mar 2021 21:18:48 +0800
Message-ID: <20210315131848.31840-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_132415_685798_3A846035 
X-CRM114-Status: GOOD (  16.51  )
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
 drivers/irqchip/irq-mst-intc.c | 94 ++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index 143657b0cf28..a2ab3f837b96 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -13,15 +13,27 @@
 #include <linux/of_irq.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/syscore_ops.h>
 
-#define INTC_MASK	0x0
-#define INTC_EOI	0x20
+#define MST_INTC_MAX_IRQS	64
+
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
+	u16 saved_polarity_conf[DIV_ROUND_UP(MST_INTC_MAX_IRQS, 16)];
+#endif
 };
 
 static void mst_set_irq(struct irq_data *d, u32 offset)
@@ -78,6 +90,20 @@ static void mst_intc_eoi_irq(struct irq_data *d)
 	irq_chip_eoi_parent(d);
 }
 
+static int mst_irq_chip_set_type(struct irq_data *data, unsigned int type)
+{
+	if (type != IRQ_TYPE_EDGE_RISING && type != IRQ_TYPE_EDGE_FALLING &&
+	    type != IRQ_TYPE_LEVEL_HIGH && type != IRQ_TYPE_LEVEL_LOW)
+		return -EINVAL;
+
+	if (type == IRQ_TYPE_LEVEL_LOW || type == IRQ_TYPE_EDGE_FALLING)
+		mst_set_irq(data, INTC_REV_POLARITY);
+
+	type = IRQ_TYPE_LEVEL_HIGH;
+
+	return irq_chip_set_type_parent(data, type);
+}
+
 static struct irq_chip mst_intc_chip = {
 	.name			= "mst-intc",
 	.irq_mask		= mst_intc_mask_irq,
@@ -87,13 +113,62 @@ static struct irq_chip mst_intc_chip = {
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
@@ -145,6 +220,15 @@ static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	parent_fwspec = *fwspec;
 	parent_fwspec.fwnode = domain->parent->fwnode;
 	parent_fwspec.param[1] = cd->irq_start + hwirq;
+
+	/*
+	 * mst-intc latch the interrupt request if it's edge triggered,
+	 * so the output signal to parent GIC is always level sensitive.
+	 * And if the irq signal is active low, configure it to active high
+	 * to meet GIC SPI spec in mst_irq_chip_set_type via REV_POLARITY bit.
+	 */
+	parent_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
+
 	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
 }
 
@@ -193,6 +277,10 @@ static int __init mst_intc_of_init(struct device_node *dn,
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
