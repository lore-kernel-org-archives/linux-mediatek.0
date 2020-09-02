Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A96BC433E6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:34:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B974520758
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJiQL+3U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tTlVqBt5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B974520758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vaEeM64AXPXAVH7GNks6c8XHEDyNwuf5iOuLV/bWvxg=; b=KJiQL+3Uhq9qQup8cijA4AZ+T
	6HmjSg9HMZsMic/ZOx+0GYgJKKEjMmB1ECNZhWg+pwn+2IPBsjfHXm8Grib5eCLv/r1gHe1zUHHLX
	dXyv45JN4WqeGQYT0ncJ3cR237rA5EqxUKYJ39zCtShZdmpJoItLeE2s0i63ApO+W9gaFd3A5XoFU
	jamrSQc65MtqWxMGTD8d7n177HCxuO93LIzXOz2gTDUDpGuUpOlDigjWzXj5cA4meRQx6+XCo2TZl
	JubuXvSlxfCswYZpZgW1vbp5pfiU1mUP3Iy3/9ZSR7PwlL5n0ZV9/yVCyQFP3H5Buvrjbd5VNACoX
	V8kAZeDUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMLd-0001s0-8P; Wed, 02 Sep 2020 06:34:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMLY-0001qG-LU; Wed, 02 Sep 2020 06:34:18 +0000
X-UUID: bd991921f189436abab3d8d1e89d5eec-20200901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kxH3tHGksx8HMp2pVMJOe2I26SY3rM5VW3ZL8QVRR+w=; 
 b=tTlVqBt5KGW7hJrtFvpexygtXonaW3wdHHGfALgKhgCCTHZPfLpjTtiUHbG0kS2/PJDnxU14UEsOaNDsQE+Try4F0Q1UQj0MsSwtMIiupxfiaSiSxRvPc1duw4Q/OQHpFRhIwdfH/reKU7jCg5/pVCT2zVeeIlDGqNPpbmEh0hI=;
X-UUID: bd991921f189436abab3d8d1e89d5eec-20200901
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1719667997; Tue, 01 Sep 2020 22:34:08 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 23:34:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 14:34:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Sep 2020 14:34:04 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH v3 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
Date: Wed, 2 Sep 2020 14:33:43 +0800
Message-ID: <20200902063344.1852-2-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200902063344.1852-1-mark-pk.tsai@mediatek.com>
References: <20200902063344.1852-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C1AD1E4F07400650ADD964CC6309425B7922614FDC0368EF2EA93CEBD55586AB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_023416_897963_6DC2B3A2 
X-CRM114-Status: GOOD (  22.68  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 yj.chiang@mediatek.com, daniel@0x0f.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mark-pk.tsai@mediatek.com,
 matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MStar interrupt controller support using hierarchy irq
domain.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Tested-by: Daniel Palmer <daniel@thingy.jp>
---
 MAINTAINERS                    |   7 ++
 drivers/irqchip/Kconfig        |   8 ++
 drivers/irqchip/Makefile       |   1 +
 drivers/irqchip/irq-mst-intc.c | 199 +++++++++++++++++++++++++++++++++
 4 files changed, 215 insertions(+)
 create mode 100644 drivers/irqchip/irq-mst-intc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e4647c84c987..f3ce60b181af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11755,6 +11755,13 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/anttip/media_tree.git
 F:	drivers/media/usb/msi2500/
 
+MSTAR INTERRUPT CONTROLLER DRIVER
+M:	Mark-PK Tsai <mark-pk.tsai@mediatek.com>
+M:	Daniel Palmer <daniel@thingy.jp>
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
+F:	drivers/irqchip/irq-mst-intc.c
+
 MSYSTEMS DISKONCHIP G3 MTD DRIVER
 M:	Robert Jarzmik <robert.jarzmik@free.fr>
 L:	linux-mtd@lists.infradead.org
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index bfc9719dbcdc..c6321a69aed9 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -571,4 +571,12 @@ config LOONGSON_PCH_MSI
 	help
 	  Support for the Loongson PCH MSI Controller.
 
+config MST_IRQ
+	bool "MStar Interrupt Controller"
+	default ARCH_MEDIATEK
+	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Support MStar Interrupt Controller.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 133f9c45744a..e2688a62403e 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -111,3 +111,4 @@ obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
 obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
 obj-$(CONFIG_LOONGSON_PCH_PIC)		+= irq-loongson-pch-pic.o
 obj-$(CONFIG_LOONGSON_PCH_MSI)		+= irq-loongson-pch-msi.o
+obj-$(CONFIG_MST_IRQ)			+= irq-mst-intc.o
diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
new file mode 100644
index 000000000000..4be077591898
--- /dev/null
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author Mark-PK Tsai <mark-pk.tsai@mediatek.com>
+ */
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define INTC_MASK	0x0
+#define INTC_EOI	0x20
+
+struct mst_intc_chip_data {
+	raw_spinlock_t	lock;
+	unsigned int	irq_start, nr_irqs;
+	void __iomem	*base;
+	bool		no_eoi;
+};
+
+static void mst_set_irq(struct irq_data *d, u32 offset)
+{
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct mst_intc_chip_data *cd = irq_data_get_irq_chip_data(d);
+	u16 val, mask;
+	unsigned long flags;
+
+	mask = 1 << (hwirq % 16);
+	offset += (hwirq / 16) * 4;
+
+	raw_spin_lock_irqsave(&cd->lock, flags);
+	val = readw_relaxed(cd->base + offset) | mask;
+	writew_relaxed(val, cd->base + offset);
+	raw_spin_unlock_irqrestore(&cd->lock, flags);
+}
+
+static void mst_clear_irq(struct irq_data *d, u32 offset)
+{
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	struct mst_intc_chip_data *cd = irq_data_get_irq_chip_data(d);
+	u16 val, mask;
+	unsigned long flags;
+
+	mask = 1 << (hwirq % 16);
+	offset += (hwirq / 16) * 4;
+
+	raw_spin_lock_irqsave(&cd->lock, flags);
+	val = readw_relaxed(cd->base + offset) & ~mask;
+	writew_relaxed(val, cd->base + offset);
+	raw_spin_unlock_irqrestore(&cd->lock, flags);
+}
+
+static void mst_intc_mask_irq(struct irq_data *d)
+{
+	mst_set_irq(d, INTC_MASK);
+	irq_chip_mask_parent(d);
+}
+
+static void mst_intc_unmask_irq(struct irq_data *d)
+{
+	mst_clear_irq(d, INTC_MASK);
+	irq_chip_unmask_parent(d);
+}
+
+static void mst_intc_eoi_irq(struct irq_data *d)
+{
+	struct mst_intc_chip_data *cd = irq_data_get_irq_chip_data(d);
+
+	if (!cd->no_eoi)
+		mst_set_irq(d, INTC_EOI);
+
+	irq_chip_eoi_parent(d);
+}
+
+static struct irq_chip mst_intc_chip = {
+	.name			= "mst-intc",
+	.irq_mask		= mst_intc_mask_irq,
+	.irq_unmask		= mst_intc_unmask_irq,
+	.irq_eoi		= mst_intc_eoi_irq,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
+	.irq_set_type		= irq_chip_set_type_parent,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_MASK_ON_SUSPEND,
+};
+
+static int mst_intc_domain_translate(struct irq_domain *d,
+				     struct irq_fwspec *fwspec,
+				     unsigned long *hwirq,
+				     unsigned int *type)
+{
+	struct mst_intc_chip_data *cd = d->host_data;
+
+	if (is_of_node(fwspec->fwnode)) {
+		if (fwspec->param_count != 3)
+			return -EINVAL;
+
+		/* No PPI should point to this domain */
+		if (fwspec->param[0] != 0)
+			return -EINVAL;
+
+		if (fwspec->param[1] >= cd->nr_irqs)
+			return -EINVAL;
+
+		*hwirq = fwspec->param[1];
+		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				 unsigned int nr_irqs, void *data)
+{
+	int i;
+	irq_hw_number_t hwirq;
+	struct irq_fwspec parent_fwspec, *fwspec = data;
+	struct mst_intc_chip_data *cd = domain->host_data;
+
+	/* Not GIC compliant */
+	if (fwspec->param_count != 3)
+		return -EINVAL;
+
+	/* No PPI should point to this domain */
+	if (fwspec->param[0])
+		return -EINVAL;
+
+	hwirq = fwspec->param[1];
+	for (i = 0; i < nr_irqs; i++)
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &mst_intc_chip,
+					      domain->host_data);
+
+	parent_fwspec = *fwspec;
+	parent_fwspec.fwnode = domain->parent->fwnode;
+	parent_fwspec.param[1] = cd->irq_start + hwirq;
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
+}
+
+static const struct irq_domain_ops mst_intc_domain_ops = {
+	.translate	= mst_intc_domain_translate,
+	.alloc		= mst_intc_domain_alloc,
+	.free		= irq_domain_free_irqs_common,
+};
+
+int __init
+mst_intc_of_init(struct device_node *dn, struct device_node *parent)
+{
+	struct irq_domain *domain, *domain_parent;
+	struct mst_intc_chip_data *cd;
+	u32 irq_start, irq_end;
+
+	domain_parent = irq_find_host(parent);
+	if (!domain_parent) {
+		pr_err("mst-intc: interrupt-parent not found\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32_index(dn, "mstar,irqs-map-range", 0, &irq_start) ||
+	    of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, &irq_end))
+		return -EINVAL;
+
+	cd = kzalloc(sizeof(*cd), GFP_KERNEL);
+	if (!cd)
+		return -ENOMEM;
+
+	cd->base = of_iomap(dn, 0);
+	if (!cd->base) {
+		kfree(cd);
+		return -ENOMEM;
+	}
+
+	cd->no_eoi = of_property_read_bool(dn, "mstar,intc-no-eoi");
+	raw_spin_lock_init(&cd->lock);
+	cd->irq_start = irq_start;
+	cd->nr_irqs = irq_end - irq_start + 1;
+	domain = irq_domain_add_hierarchy(domain_parent, 0, cd->nr_irqs, dn,
+					  &mst_intc_domain_ops, cd);
+	if (!domain) {
+		iounmap(cd->base);
+		kfree(cd);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(mst_intc, "mstar,mst-intc", mst_intc_of_init);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
