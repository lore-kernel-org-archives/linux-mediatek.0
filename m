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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8694EC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 15:26:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0E765268
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 15:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0E765268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z21pISW7Ito1LHnlNWQUW5IT16bRY9sHmojjbg0LjsI=; b=jQ4aWnRbnhNhKG05wWf3aI/W2s
	LgHBslEvwgun9qR8W1YUDUdZ7s+KLRC+zvAspIpoIL5WHMkkH9Bxam+UFvgdqU+dR1/sZGLMb+53q
	3ATDCNpFFvC/Km8MGXwkKViidICoQrVWj4xK4drqhxco0rubXHJp/YON2sY0IgNCw/e2nTXGWhOhj
	ud/ZEmsdwAhXeJ4L+OOH+j8fRrMX9Mz8QjU0SfYLCqpj1AFDcir1YLKW2zU9WYfoqPxLuRPmfhVIg
	DRiRTpzYTl1RZLO1Ybe+1X069RRBFeyuoONKlNSSBTClTPeNc8HtdPMkUDVptfZHy0jh0j2AuOlwH
	fowGn/tQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJHmL-000ZZb-Gm; Mon, 08 Mar 2021 15:26:41 +0000
Received: from mailgw02.mediatek.com ([66.171.122.166])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJHm1-000ZMH-Pe; Mon, 08 Mar 2021 15:26:28 +0000
X-UUID: e17d2473e74b4bdc9fbe9a1f91bfdb84-20210308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=A9+vzUKEz0cEfPMQtT/ndW6F8ofu1sZEj7wcu2EOiws=; 
 b=sBaJNDfj4oOCyrOHMK56MgxUe1uhKr1u5rA3TXsFYyAlWGETO8BZDNfnX7KWCXMddYFj/TRJRjL9MhHm4SaLIjrstfW2nInvB+fH8l+vswuS+tO2WSUVWtgdSdFk4hpefHTp3Mg/+g0uHKjMXd2RoioI07Y1Rpf3wvazkUHKeQY=;
X-UUID: e17d2473e74b4bdc9fbe9a1f91bfdb84-20210308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 262133463; Mon, 08 Mar 2021 07:26:15 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 07:26:08 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 23:26:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 23:26:06 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 "Daniel Palmer" <daniel@thingy.jp>, Thomas Gleixner <tglx@linutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3] irqchip/irq-mst: Support polarity configuration
Date: Mon, 8 Mar 2021 23:26:05 +0800
Message-ID: <20210308152605.26122-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_152623_424003_C169D0F0 
X-CRM114-Status: GOOD (  18.04  )
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
 drivers/irqchip/irq-mst-intc.c | 92 ++++++++++++++++++++++++++++++++--
 1 file changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index 143657b0cf28..50f3ef8bc610 100644
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
@@ -78,6 +90,19 @@ static void mst_intc_eoi_irq(struct irq_data *d)
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
@@ -87,13 +112,62 @@ static struct irq_chip mst_intc_chip = {
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
@@ -145,6 +219,14 @@ static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned int virq,
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
 
@@ -193,6 +275,10 @@ static int __init mst_intc_of_init(struct device_node *dn,
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
