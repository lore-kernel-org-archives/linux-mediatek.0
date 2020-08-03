Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EBCC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:35:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98AFD2070A
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ny/OaJ4Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k1bV+uth"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98AFD2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bGY6MQPprP+9DBj7kOet0shJvYPkqTSssxyq+hgfyco=; b=ny/OaJ4Q6sxvpE44vQqD+d9we
	aKPZRl+S5fp8+7DflPneSlmmSLrGn2ffLnrX8+0UEitMe0gHurR3Syda44YZMZ34RWG+kQ90KkmEu
	YPJro0QGHUTu0ZAex3I6F6dHpeaJ4jJwDGWgUpOmrbR98HNJty4fBIdN36YOI6Mzbye+4B/L/h7kr
	D5S9P0TIOlZxcl9g6+XVov95bpi22QVhGSnl8+g9ZDMxdd/YjxlaR0oGdDJvms7yOGq6C2ZbuGQmn
	525lY2ZFMHImhEQ/u9y4gY3GM4OICgeFJEK6nbc2/XK1tfsXtq3sy+xh9/Gz9vOzz1xLNT72U6qtQ
	KeGWBSWQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2U4A-0001Vn-If; Mon, 03 Aug 2020 06:35:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2U43-0001TT-Pj; Mon, 03 Aug 2020 06:35:18 +0000
X-UUID: 71f1618ab7984b958abe7e86c9d8e976-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=12BHCE2vfEXwwIMIMyUnGPJn1q3j4PEk4JE0VxRfC5M=; 
 b=k1bV+uthV83tZTeDOlxtCXzcGBG2i8py4srHEYhHbsSysHrphW2vOuqE/I+vZNvgd4DkJ0whU2T7069WmUzODtNe2h9ZtxMW2YAu6aCmofI7BtqtCswGbW4fsRB/xCohdhgMH+ZsTo3VmEDXDT99IXK2bcyQ2TvZ1lZh8dMdW4Q=;
X-UUID: 71f1618ab7984b958abe7e86c9d8e976-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 628731815; Sun, 02 Aug 2020 22:24:40 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 23:23:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 14:23:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 14:23:01 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>
Subject: [PATCH 1/2] irqchip: irq-mt58xx: Add mt58xx interrupt controller
 support
Date: Mon, 3 Aug 2020 14:22:13 +0800
Message-ID: <20200803062214.24076-2-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200803062214.24076-1-mark-pk.tsai@mediatek.com>
References: <20200803062214.24076-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_023516_022283_B77D5A1C 
X-CRM114-Status: GOOD (  22.01  )
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
 maz@kernel.org, yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt58xx interrupt controller support using hierarchy irq
domain.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/irqchip/Kconfig      |   7 ++
 drivers/irqchip/Makefile     |   1 +
 drivers/irqchip/irq-mt58xx.c | 196 +++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/irqchip/irq-mt58xx.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 216b3b8392b5..00453af78be0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -572,4 +572,11 @@ config LOONGSON_PCH_MSI
 	help
 	  Support for the Loongson PCH MSI Controller.
 
+config MT58XX_IRQ
+	bool "MT58XX IRQ"
+	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Support Mediatek MT58XX Interrupt Controller.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 133f9c45744a..5062e9bfa92d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -111,3 +111,4 @@ obj-$(CONFIG_LOONGSON_HTPIC)		+= irq-loongson-htpic.o
 obj-$(CONFIG_LOONGSON_HTVEC)		+= irq-loongson-htvec.o
 obj-$(CONFIG_LOONGSON_PCH_PIC)		+= irq-loongson-pch-pic.o
 obj-$(CONFIG_LOONGSON_PCH_MSI)		+= irq-loongson-pch-msi.o
+obj-$(CONFIG_MT58XX_IRQ)		+= irq-mt58xx.o
diff --git a/drivers/irqchip/irq-mt58xx.c b/drivers/irqchip/irq-mt58xx.c
new file mode 100644
index 000000000000..e45ad023afa6
--- /dev/null
+++ b/drivers/irqchip/irq-mt58xx.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author Mark-PK Tsai <mark-pk.tsai@mediatek.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+
+#define INTC_MASK	0x0
+#define INTC_EOI	0x20
+
+struct mtk_intc_chip_data {
+	char *name;
+	struct irq_chip chip;
+	unsigned int irq_start, nr_irqs;
+	void __iomem *base;
+};
+
+static void mtk_poke_irq(struct irq_data *d, u32 offset)
+{
+	struct mtk_intc_chip_data *cd = irq_data_get_irq_chip_data(d);
+	void __iomem *base = cd->base;
+	u8 index = (u8)irqd_to_hwirq(d);
+	u16 val, mask;
+
+	mask = 1 << (index % 16);
+	val = readw_relaxed(base + offset + (index / 16) * 4) | mask;
+	writew_relaxed(val, base + offset + (index / 16) * 4);
+}
+
+static void mtk_clear_irq(struct irq_data *d, u32 offset)
+{
+	struct mtk_intc_chip_data *cd = irq_data_get_irq_chip_data(d);
+	void __iomem *base = cd->base;
+	u8 index = (u8)irqd_to_hwirq(d);
+	u16 val, mask;
+
+	mask = 1 << (index % 16);
+	val = readw_relaxed(base + offset + (index / 16) * 4) & ~mask;
+	writew_relaxed(val, base + offset + (index / 16) * 4);
+}
+
+static void mtk_intc_mask_irq(struct irq_data *d)
+{
+	mtk_poke_irq(d, INTC_MASK);
+	irq_chip_mask_parent(d);
+}
+
+static void mtk_intc_unmask_irq(struct irq_data *d)
+{
+	mtk_clear_irq(d, INTC_MASK);
+	irq_chip_unmask_parent(d);
+}
+
+static void mtk_intc_eoi_irq(struct irq_data *d)
+{
+	mtk_poke_irq(d, INTC_EOI);
+	irq_chip_eoi_parent(d);
+}
+
+static struct irq_chip mtk_intc_chip = {
+	.irq_mask		= mtk_intc_mask_irq,
+	.irq_unmask		= mtk_intc_unmask_irq,
+	.irq_eoi		= mtk_intc_eoi_irq,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
+	.irq_set_type		= irq_chip_set_type_parent,
+	.flags			= IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_MASK_ON_SUSPEND,
+};
+
+static int mt58xx_intc_domain_translate(struct irq_domain *d,
+					struct irq_fwspec *fwspec,
+					unsigned long *hwirq,
+					unsigned int *type)
+{
+	if (is_of_node(fwspec->fwnode)) {
+		if (fwspec->param_count != 3)
+			return -EINVAL;
+
+		/* No PPI should point to this domain */
+		if (fwspec->param[0] != 0)
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
+static int mt58xx_intc_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				    unsigned int nr_irqs, void *data)
+{
+	int i;
+	irq_hw_number_t hwirq;
+	struct irq_fwspec parent_fwspec, *fwspec = data;
+	struct mtk_intc_chip_data *cd = (struct mtk_intc_chip_data *)domain->host_data;
+
+	/* Not GIC compliant */
+	if (fwspec->param_count != 3)
+		return -EINVAL;
+
+	/* No PPI should point to this domain */
+	if (fwspec->param[0])
+		return -EINVAL;
+
+	if (fwspec->param[1] >= cd->nr_irqs)
+		return -EINVAL;
+
+	hwirq = fwspec->param[1];
+	for (i = 0; i < nr_irqs; i++)
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &cd->chip,
+					      domain->host_data);
+
+	parent_fwspec = *fwspec;
+	parent_fwspec.fwnode = domain->parent->fwnode;
+	parent_fwspec.param[1] = cd->irq_start + hwirq;
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
+}
+
+static const struct irq_domain_ops mt58xx_intc_domain_ops = {
+	.translate	= mt58xx_intc_domain_translate,
+	.alloc		= mt58xx_intc_domain_alloc,
+	.free		= irq_domain_free_irqs_common,
+};
+
+int __init
+mt58xx_intc_of_init(struct device_node *dn, struct device_node *parent)
+{
+	static int nr_intc;
+	struct irq_domain *domain, *domain_parent;
+	struct mtk_intc_chip_data *cd;
+	unsigned int irq_start, irq_end;
+
+	domain_parent = irq_find_host(parent);
+	if (!domain_parent) {
+		pr_err("mt58xx-intc: interrupt-parent not found\n");
+		return -EINVAL;
+	}
+
+	cd = kzalloc(sizeof(*cd), GFP_KERNEL);
+	if (!cd)
+		return -ENOMEM;
+
+	cd->chip = mtk_intc_chip;
+	if (of_property_read_u32_index(dn, "mediatek,irqs-map-range", 0, &irq_start) ||
+	    of_property_read_u32_index(dn, "mediatek,irqs-map-range", 1, &irq_end)) {
+		kfree(cd);
+		return -EINVAL;
+	}
+
+	if (of_property_read_bool(dn, "mediatek,intc-no-eoi"))
+		cd->chip.irq_eoi = irq_chip_eoi_parent;
+
+	cd->irq_start = irq_start;
+	cd->nr_irqs = irq_end - irq_start + 1;
+	cd->chip.name = kasprintf(GFP_KERNEL, "mt58xx-intc-%d", nr_intc++);
+	if (!cd->chip.name) {
+		kfree(cd);
+		return -ENOMEM;
+	}
+
+	cd->base = of_iomap(dn, 0);
+	if (!cd->base) {
+		kfree(cd->chip.name);
+		kfree(cd);
+		return -ENOMEM;
+	}
+
+	domain = irq_domain_add_hierarchy(domain_parent, 0, cd->nr_irqs,
+					  dn, &mt58xx_intc_domain_ops, cd);
+	if (!domain) {
+		kfree(cd->chip.name);
+		iounmap(cd->base);
+		kfree(cd);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(mt58xx_intc, "mediatek,mt58xx-intc", mt58xx_intc_of_init);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
