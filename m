Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e8v/qKack7pXqWTGj6TcH+Qr67SMqK1jDu1aXO5xzk=; b=xywkbj+9HzCP1gPv8XlVQB5g6C
	uh3+x89/KbuoqREZNwJMwBuBo0jR7gBPX1/iGU05P5FlQX4dk5NSEgRjeEmtoOeBvMd4h5iykwmnY
	k9nj8J1d7Aa4usb0mqgLslULfD3vxL/EoXlFBE+llzcsVxIhqQyPgTyxRHuXx5zmT1oA9hvuynts7
	q/UhE9z0ZlXM2oeJs8ZIxOFZmqksG00WRyAKFy4qlPlM1zgAf84+uUHsuMpvA0YTIHLL9CuG6ylxU
	Lgm1Mshi8x234JtoH40bEX4MnAZ+bSxiGF6ExLE7YEDx2jqOI9wf2Gxe7fvksfLE3MXav+ghafKV1
	TdbbzRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaMK-000b9U-9G; Mon, 28 Nov 2022 09:23:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaLL-000akK-D3; Mon, 28 Nov 2022 09:22:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E4C4B6602ACD;
	Mon, 28 Nov 2022 09:22:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669627344;
	bh=32ufF8mWQ76mzZ5g0aMyF+USFsqUYsn/m1kjTdJpMXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VYNdmUYHNRMqyBLOUgKC2BDNXZgGAoGOqzyaC5jO9VljbA9KpYMT8RA1U8CCT3vOy
	 CoZZIDLoGUx2iSc++hXg7nCh9mar5rq5SbhuAmMUuzENmUz3o/lwdF8pxPAw8Zeiyf
	 YFfpKKRrdg36K5bYBUqvtnMIqnQhJq/t8ZS1TzN3+IakoJfetGDvRnpZKY8w1uGz7j
	 CfFsnhTJKZI3bJFYIW7nsR9803Vl6+WwwlPEV+DBKauzaA81lCHdXP1JwPLOOMYBg5
	 gS7RMMAgMD3UR9FwugwSPid9Gah0nLQFqjiL3qxtjUk2d/1lLjY4uSjwpm+Tgp8A0F
	 mYcv5qp6/EyMg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	youlin.pei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 3/4] irqchip: irq-mtk-cirq: Move register offsets to const array
Date: Mon, 28 Nov 2022 10:22:16 +0100
Message-Id: <20221128092217.36552-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128092217.36552-1-angelogioacchino.delregno@collabora.com>
References: <20221128092217.36552-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_012227_738478_D343310A 
X-CRM114-Status: GOOD (  18.15  )
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

In preparation to add support for new SoCs having a different
register layout, add an enumeration that documents register
offsets and move the definitions for the same to a u32 array;

Selecting the right register offsets array is done by adding an
of_device_id array containing all of the currently supported
compatible strings pointing to the "v1" offsets array (as data):
since no devicetree declares the `mediatek,mtk-cirq` compatible
without a SoC-specific one, it wasn't necessary to provide any
legacy fallback.

Every usage of the aforemementioned definitions was changed to
get a register address through a newly introduced `mtk_cirq_reg()`
accessor.

This change brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/irqchip/irq-mtk-cirq.c | 82 +++++++++++++++++++++++++++-------
 1 file changed, 65 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 9bca0918078e..4776ed6492fb 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -15,14 +15,29 @@
 #include <linux/slab.h>
 #include <linux/syscore_ops.h>
 
-#define CIRQ_ACK	0x40
-#define CIRQ_MASK_SET	0xc0
-#define CIRQ_MASK_CLR	0x100
-#define CIRQ_SENS_SET	0x180
-#define CIRQ_SENS_CLR	0x1c0
-#define CIRQ_POL_SET	0x240
-#define CIRQ_POL_CLR	0x280
-#define CIRQ_CONTROL	0x300
+enum mtk_cirq_regoffs_index {
+	CIRQ_STA,
+	CIRQ_ACK,
+	CIRQ_MASK_SET,
+	CIRQ_MASK_CLR,
+	CIRQ_SENS_SET,
+	CIRQ_SENS_CLR,
+	CIRQ_POL_SET,
+	CIRQ_POL_CLR,
+	CIRQ_CONTROL
+};
+
+static const u32 mtk_cirq_regoffs_v1[] = {
+	[CIRQ_STA]	= 0x0,
+	[CIRQ_ACK]	= 0x40,
+	[CIRQ_MASK_SET]	= 0xc0,
+	[CIRQ_MASK_CLR]	= 0x100,
+	[CIRQ_SENS_SET]	= 0x180,
+	[CIRQ_SENS_CLR]	= 0x1c0,
+	[CIRQ_POL_SET]	= 0x240,
+	[CIRQ_POL_CLR]	= 0x280,
+	[CIRQ_CONTROL]	= 0x300,
+};
 
 #define CIRQ_EN	0x1
 #define CIRQ_EDGE	0x2
@@ -32,18 +47,32 @@ struct mtk_cirq_chip_data {
 	void __iomem *base;
 	unsigned int ext_irq_start;
 	unsigned int ext_irq_end;
+	const u32 *offsets;
 	struct irq_domain *domain;
 };
 
 static struct mtk_cirq_chip_data *cirq_data;
 
-static void mtk_cirq_write_mask(struct irq_data *data, unsigned int offset)
+static void __iomem *mtk_cirq_reg(struct mtk_cirq_chip_data *chip_data,
+				  enum mtk_cirq_regoffs_index idx)
+{
+	return chip_data->base + chip_data->offsets[idx];
+}
+
+static void __iomem *mtk_cirq_irq_reg(struct mtk_cirq_chip_data *chip_data,
+				      enum mtk_cirq_regoffs_index idx,
+				      unsigned int cirq_num)
+{
+	return mtk_cirq_reg(chip_data, idx) + (cirq_num / 32) * 4;
+}
+
+static void mtk_cirq_write_mask(struct irq_data *data, enum mtk_cirq_regoffs_index idx)
 {
 	struct mtk_cirq_chip_data *chip_data = data->chip_data;
 	unsigned int cirq_num = data->hwirq;
 	u32 mask = 1 << (cirq_num % 32);
 
-	writel_relaxed(mask, chip_data->base + offset + (cirq_num / 32) * 4);
+	writel_relaxed(mask, mtk_cirq_irq_reg(chip_data, idx, cirq_num));
 }
 
 static void mtk_cirq_mask(struct irq_data *data)
@@ -160,6 +189,7 @@ static const struct irq_domain_ops cirq_domain_ops = {
 #ifdef CONFIG_PM_SLEEP
 static int mtk_cirq_suspend(void)
 {
+	void __iomem *reg;
 	u32 value, mask;
 	unsigned int irq, hwirq_num;
 	bool pending, masked;
@@ -200,31 +230,34 @@ static int mtk_cirq_suspend(void)
 				continue;
 		}
 
+		reg = mtk_cirq_irq_reg(cirq_data, CIRQ_ACK, i);
 		mask = 1 << (i % 32);
-		writel_relaxed(mask, cirq_data->base + CIRQ_ACK + (i / 32) * 4);
+		writel_relaxed(mask, reg);
 	}
 
 	/* set edge_only mode, record edge-triggerd interrupts */
 	/* enable cirq */
-	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
+	reg = mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
+	value = readl_relaxed(reg);
 	value |= (CIRQ_EDGE | CIRQ_EN);
-	writel_relaxed(value, cirq_data->base + CIRQ_CONTROL);
+	writel_relaxed(value, reg);
 
 	return 0;
 }
 
 static void mtk_cirq_resume(void)
 {
+	void __iomem *reg = mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	u32 value;
 
 	/* flush recorded interrupts, will send signals to parent controller */
-	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
-	writel_relaxed(value | CIRQ_FLUSH, cirq_data->base + CIRQ_CONTROL);
+	value = readl_relaxed(reg);
+	writel_relaxed(value | CIRQ_FLUSH, reg);
 
 	/* disable cirq */
-	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
+	value = readl_relaxed(reg);
 	value &= ~(CIRQ_EDGE | CIRQ_EN);
-	writel_relaxed(value, cirq_data->base + CIRQ_CONTROL);
+	writel_relaxed(value, reg);
 }
 
 static struct syscore_ops mtk_cirq_syscore_ops = {
@@ -240,10 +273,18 @@ static void mtk_cirq_syscore_init(void)
 static inline void mtk_cirq_syscore_init(void) {}
 #endif
 
+static const struct of_device_id mtk_cirq_of_match[] = {
+	{ .compatible = "mediatek,mt2701-cirq", .data = &mtk_cirq_regoffs_v1 },
+	{ .compatible = "mediatek,mt8135-cirq", .data = &mtk_cirq_regoffs_v1 },
+	{ .compatible = "mediatek,mt8173-cirq", .data = &mtk_cirq_regoffs_v1 },
+	{ /* sentinel */ }
+};
+
 static int __init mtk_cirq_of_init(struct device_node *node,
 				   struct device_node *parent)
 {
 	struct irq_domain *domain, *domain_parent;
+	const struct of_device_id *match;
 	unsigned int irq_num;
 	int ret;
 
@@ -274,6 +315,13 @@ static int __init mtk_cirq_of_init(struct device_node *node,
 	if (ret)
 		goto out_unmap;
 
+	match = of_match_node(mtk_cirq_of_match, node);
+	if (!match) {
+		ret = -ENODEV;
+		goto out_unmap;
+	}
+	cirq_data->offsets = match->data;
+
 	irq_num = cirq_data->ext_irq_end - cirq_data->ext_irq_start + 1;
 	domain = irq_domain_add_hierarchy(domain_parent, 0,
 					  irq_num, node,
-- 
2.38.1


