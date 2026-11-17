Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8225606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yU3ktoLV;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NCoRBhCf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+5KzUYY/vcXfemi9waz3d6wiZ68aHIzdXI9cSdmvu0U=; b=yU3ktoLVY6jYNL
	iQpOdpNeqBqNQWbUzBT3l5jypsJf/1Ue5bVodoMtZljc0XUZrDZyGkhKpdpYBmCS6kFTHtU60zl80
	tCHb9e5vBmC2XaFUMVbaF7WpNUXEdQwJYyO66aNrUgapT8rWcAlN3GhCpwys0L8F4tbix7+8eX/Zp
	On5MT/2HqhgQHirtwBTA6XzIFb6zhgI/KaNl90rQf2mDIJhotaRnba+FCw3Ey6LhS5Fed08uRPkzv
	fiiIvy4MRla+maOLMMBZUANciXM9rRZJpjTjztLBEYCLlj7sBXndw+hlZIMvTnLvYv6kO51MmooA5
	zu5H7GOdkSlmcemYJlMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1m-00000006a3C-1U54;
	Tue, 17 Nov 2026 17:31:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1e-00000006Zyw-1eLl
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 17:31:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso1165905e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 09:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936680; x=1795541480; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5KzUYY/vcXfemi9waz3d6wiZ68aHIzdXI9cSdmvu0U=;
        b=NCoRBhCfmfKs5hKYCTtgiuSZ0WhjPqEM88M/u3NFfsQjHQIihXCg/8RLV8QLKlLZDj
         di/3Gwifv2n+au99OiQS5nLEm12cGeyMEd+qzuLbadA/oRjyu3oMRCTBC2FW+4recLE8
         Q1E3kkbSWFfihnV+JdjMUcZ+nqur0sDNXxbyLHB45K6i9ET5i6G6qBmEuZwajIGsY2Az
         DjdRx61hsufueVlusvTyj86mO7sXM+PlONLFOAV2CojVU5sqKZh6dbxvHmWjJBbfbfzF
         xQwrMH1HSwtH8pBDy8t9+nIiHi7OuUuMuK1z8flcbm7yZL2sKhirO1Qz/iRYENqw3ABg
         rbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936680; x=1795541480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5KzUYY/vcXfemi9waz3d6wiZ68aHIzdXI9cSdmvu0U=;
        b=sDB741CWXWruvHjHPFFWo8ixvZgYlwhWGZaKdAa6Q5Eg3Pf+ni1XDAnwxRElZUzlQU
         qeAf9LQmIOH61+dbwW8Gzb+m9oKD+aKwkuFfDYUkCo6+UPdT8doEhPTw05nbKIzAdo8M
         dGbfREfZxbUFC9zbeG9Se+2Yb6sWV6QLxZu5W7h8Auo55u/jyBnnpRB1foatINPa/UO/
         3PwgGlh71Z7/VcdBnpUVfCDa0v6SuOqld5TrRotzIDQdKEFz2KNT0NClrxwUG56BpOH3
         0uJwdBd/8CXXuLo0wVnz0rgALBw8ZyalL7K9x4OV/KMx2EbgB61XTguzq7jLoZNpEbPA
         4w9Q==
X-Forwarded-Encrypted: i=1; AL+hErG0SSNWmYAjq8a9ThgavVwkKq6tmJgirqgaL6VnfsyGMnLlEArISEIE2alcE+YeERClevV81zJhZjzKdW0IQQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9XgBmCaZ1J8HX6UymwhmT45DvmSyfnTWhQmwjjeT859BPqCH37
	kxSp9oH8jSGGvoFuXJPAaShRrR75DIFOyOA5O8b0slPj9H79Jcuzh+mM3yIdFmdUSgQ=
X-Gm-Gg: AYBFou14qTP9YBcmhsIH7c50dtsu4usCcOYlESQXULhBrya5ZfUH3Gnji4cmwdjzL5q
	8pjjYs9Wg5UTN0E/PhLaLVHz+9HBBpvl0rNgophR6qFqiGEzPFgzoPMnCpM9SJavwUyundlQ4yW
	+cYbBgvIGiRW3Dv4Wi3v6V3+PT12dmaIIOn+TpScFi5xrY0GGqP7Wp+39PWpBr3ZwFP0zyMoSmB
	YDEW3GDJvO+nP75P8yM7pmmljOu6LNeVJniwnDuo36Iq+MKMJA9hZnO8w8Q1tG7K04Iut0rtIsA
	WRqcaKykPZE+tROq3ELsL0TPMFL0qIzoWnNwHckARnvBzyU95A+FqW4Q0V15dkbn+lewvlYsQP7
	WL+Dco1TesAVxVvBzWOCQlToL1o6/aGc+MS0QhAoPRuzvofmvz9/UwXJGSVYq65mgMmmkncNf+1
	OHdmXyLlL4it0cWNlPeqsScDmiZFZHEUZf9jZtcNjoTUmnHcubsb4ej6VkeHT66EG8029JBpoEL
	7mPwWVxXyTfC8dzR2oSSv3P2wRE/RpUxyKVJaDLx81V4ogeSLq+0DxX4P5tmhOY4gJCFIfah9Hx
	8T/WGGu4e9ZRIDLMPhNRqeUP3CjiEUkL/91JjyDYM3HzChmHeNijVNox8LpaUbBwA9kOsb1+y2+
	Xvw==
X-Received: by 2002:a05:600c:3111:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb61184db8mr281583825e9.30.1794936680498;
        Tue, 17 Nov 2026 09:31:20 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:19 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Nov 2026 17:31:05 +0000
Subject: [PATCH 2/2] irqchip: Add MediaTek SMMU wrapper driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8196-smmu-wrapper-v1-2-229f04d9f693@baylibre.com>
References: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
In-Reply-To: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_093122_477842_D64838AE 
X-CRM114-Status: GOOD (  22.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT8196, each interrupt of the multimedia SMMUv3 must be acknowledged
in a MediaTek wrapper, which otherwise keeps its GIC line asserted.

Add a driver for the wrapper as a chained interrupt controller.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 MAINTAINERS                       |   1 +
 drivers/irqchip/Kconfig           |  11 +++
 drivers/irqchip/Makefile          |   1 +
 drivers/irqchip/irq-mtk-smmu-wp.c | 145 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 158 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cc65a753ad2..36866ba47912 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17228,6 +17228,7 @@ M:	Alexandre Mergnat <amergnat@baylibre.com>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/mediatek,mt8196-smmu-wp.yaml
+F:	drivers/irqchip/irq-mtk-smmu-wp.c
 
 MEDIATEK SWITCH DRIVER
 M:	Chester A. Unal <chester.a.unal@arinc9.com>
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 2edf121c7841..2773515f1dd4 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -866,4 +866,15 @@ config IRQCHIP_XILINX_SMMU_CSR
 	  ZynqMP-class platforms where a vendor CSR block mediates SMMU
 	  interrupts.
 
+config MTK_SMMU_WP
+	bool "MediaTek SMMU wrapper interrupt controller"
+	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
+	default ARCH_MEDIATEK && ARM64
+	select IRQ_DOMAIN
+	help
+	  Support for the wrapper block that MediaTek integrates
+	  with the multimedia SMMUv3 of MT8196.
+	  The interrupts of that SMMU do not work without this
+	  driver.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index eb539d41251e..573b6c06fe06 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -73,6 +73,7 @@ obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
 obj-$(CONFIG_MTK_IRQ)			+= irq-mtk-sysirq.o irq-mtk-cirq.o
+obj-$(CONFIG_MTK_SMMU_WP)		+= irq-mtk-smmu-wp.o
 obj-$(CONFIG_ARCH_DIGICOLOR)		+= irq-digicolor.o
 obj-$(CONFIG_ARCH_SA1100)		+= irq-sa11x0.o
 obj-$(CONFIG_INGENIC_IRQ)		+= irq-ingenic.o
diff --git a/drivers/irqchip/irq-mtk-smmu-wp.c b/drivers/irqchip/irq-mtk-smmu-wp.c
new file mode 100644
index 000000000000..6e5172d18b14
--- /dev/null
+++ b/drivers/irqchip/irq-mtk-smmu-wp.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MediaTek SMMU wrapper interrupt controller
+ *
+ * Copyright (C) 2026 BayLibre, SAS
+ *
+ * The wrapper latches each SMMUv3 interrupt source in IRQ_STA and keeps its
+ * single output line asserted while a latched source is not acknowledged.
+ * An acknowledgment clears every pending occurrence of the source, so each
+ * source is handled as an edge, acknowledged before its handler reads the
+ * SMMU state. No mask register is known.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define MTK_SMMU_WP_IRQ_STA		0x80
+#define MTK_SMMU_WP_IRQ_ACK		0x84
+#define MTK_SMMU_WP_IRQ_ACK_CNT		0x88
+#define MTK_SMMU_WP_IRQ_ACK_CNT_MASK	GENMASK(7, 0)
+
+#define MTK_SMMU_WP_NR_IRQS		8
+
+struct mtk_smmu_wp {
+	struct device		*dev;
+	void __iomem		*base;
+	struct irq_domain	*domain;
+};
+
+static void mtk_smmu_wp_ack_source(struct mtk_smmu_wp *wp, unsigned int src)
+{
+	writel_relaxed(BIT(src), wp->base + MTK_SMMU_WP_IRQ_ACK);
+	/* Flush the posted ACK before the SMMU is read */
+	readl(wp->base + MTK_SMMU_WP_IRQ_STA);
+}
+
+static void mtk_smmu_wp_irq_ack(struct irq_data *d)
+{
+	mtk_smmu_wp_ack_source(irq_data_get_irq_chip_data(d), d->hwirq);
+}
+
+static const struct irq_chip mtk_smmu_wp_chip = {
+	.name		= "mtk-smmu-wp",
+	.irq_ack	= mtk_smmu_wp_irq_ack,
+};
+
+static void mtk_smmu_wp_handler(struct irq_desc *desc)
+{
+	struct mtk_smmu_wp *wp = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long pending;
+	unsigned int src;
+
+	chained_irq_enter(chip, desc);
+
+	pending = readl_relaxed(wp->base + MTK_SMMU_WP_IRQ_STA);
+	for_each_set_bit(src, &pending, MTK_SMMU_WP_NR_IRQS) {
+		if (generic_handle_domain_irq(wp->domain, src)) {
+			/* Release an unused source, which would hold the line */
+			mtk_smmu_wp_ack_source(wp, src);
+			dev_warn_ratelimited(wp->dev, "unexpected source %u\n", src);
+		}
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int mtk_smmu_wp_map(struct irq_domain *d, unsigned int virq, irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(virq, &mtk_smmu_wp_chip, handle_edge_irq);
+	irq_set_chip_data(virq, d->host_data);
+	return 0;
+}
+
+static const struct irq_domain_ops mtk_smmu_wp_domain_ops = {
+	.map	= mtk_smmu_wp_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static void mtk_smmu_wp_setup(struct mtk_smmu_wp *wp)
+{
+	u32 val;
+
+	/* Make each IRQ_ACK write clear every pending occurrence */
+	val = readl_relaxed(wp->base + MTK_SMMU_WP_IRQ_ACK_CNT);
+	val |= MTK_SMMU_WP_IRQ_ACK_CNT_MASK;
+	writel_relaxed(val, wp->base + MTK_SMMU_WP_IRQ_ACK_CNT);
+}
+
+static int mtk_smmu_wp_probe(struct platform_device *pdev, struct device_node *parent)
+{
+	struct irq_domain_info info = {
+		.fwnode		= dev_fwnode(&pdev->dev),
+		.size		= MTK_SMMU_WP_NR_IRQS,
+		.hwirq_max	= MTK_SMMU_WP_NR_IRQS,
+		.ops		= &mtk_smmu_wp_domain_ops,
+	};
+	struct device *dev = &pdev->dev;
+	struct mtk_smmu_wp *wp;
+	unsigned long pending;
+	unsigned int src;
+	int parent_irq;
+
+	wp = devm_kzalloc_obj(dev, *wp);
+	if (!wp)
+		return -ENOMEM;
+
+	wp->dev = dev;
+
+	wp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(wp->base))
+		return PTR_ERR(wp->base);
+
+	parent_irq = platform_get_irq(pdev, 0);
+	if (parent_irq < 0)
+		return parent_irq;
+
+	mtk_smmu_wp_setup(wp);
+
+	/* Release the sources that an earlier boot stage left latched */
+	pending = readl_relaxed(wp->base + MTK_SMMU_WP_IRQ_STA);
+	for_each_set_bit(src, &pending, MTK_SMMU_WP_NR_IRQS)
+		mtk_smmu_wp_ack_source(wp, src);
+
+	info.host_data = wp;
+	wp->domain = devm_irq_domain_instantiate(dev, &info);
+	if (IS_ERR(wp->domain))
+		return PTR_ERR(wp->domain);
+
+	irq_set_chained_handler_and_data(parent_irq, mtk_smmu_wp_handler, wp);
+
+	return 0;
+}
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_smmu_wp)
+IRQCHIP_MATCH("mediatek,mt8196-mm-smmu-wp", mtk_smmu_wp_probe)
+IRQCHIP_PLATFORM_DRIVER_END(mtk_smmu_wp)

-- 
2.43.0


