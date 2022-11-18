Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40441C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlJMwkpzlIWIbmk44rUkWhFwV2xH6YGQUeMz2w7/hK4=; b=0YE0o0iblaWxiWKyCWZfsgiWJd
	0yefILyuDiRoRHFK2VhbyAzesIIDtmrdIbX3+ENbZBGcWSHjcwFwns0PmzHSIx+41quueNeN+yiku
	fAA+c8qgWgR9aY0ZvKWyDF2haGll3IltkcSA73lUOkhFTyyPRtZIG9F+PLIYfW4/12DG8X6sliitD
	R+/anDwP8VOX1u/2zTjRdctZOmf8Q2ZDJMog1h+jT5xx8b7UG6gBr9pgcOvjYbnkH5Oy1ClCW4SAn
	N5dJct5QqcPkUeQQ4vXaP09iHfgazn6vTLtR/yb8/6JJiMpDA0OJvT0BAVBsUOGx5H+dRXYvHpTHb
	5VRCbg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyHb-003IDC-Mj; Fri, 18 Nov 2022 10:07:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyGr-003Htb-V6; Fri, 18 Nov 2022 10:06:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 12ECE6602AAB;
	Fri, 18 Nov 2022 10:06:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668766010;
	bh=Z7OZ2v5y+VgIWD+PEZh2BYTDoHwy0VQjFBEGe4alcEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tod0QP70T6g6dsjNDEOdW8OM+cI0IdaObMc0ArqspvhMQAQZxfpcv7eyzg/gzieQ8
	 i88fMoczQgCR2/DYiTnyYjN397Sagk4D7kvIuZN3uf/6vh+Vlo5/BLLqsGVNVob/Q2
	 BO3U6T7XzTgE08pa85/8l1x+w/rWPzLId9WL7ULr1GByEKEcWGcxfOsPRWVOC/I3+k
	 jyssSh6CmrN92gDQXedbFjvF8WDIXAaZUhovMbpGOv/ZEgmxY9Ldi2QmdrkPtQUD0x
	 2LSiJy+ixeUCJ3xfJmS5hzuFKXyUSwu4F6MilWTE3SvJXLYmZMLYBHadRJCZU8Rv5G
	 otxLyoWJUjErg==
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
Subject: [PATCH v1 3/4] irqchip: irq-mtk-cirq: Move register offsets to const array
Date: Fri, 18 Nov 2022 11:06:38 +0100
Message-Id: <20221118100639.33704-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
References: <20221118100639.33704-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_020654_291272_600DB933 
X-CRM114-Status: GOOD (  15.25  )
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

In preparation to add support for new SoCs having different register
offsets, add an enumeration that documents registers and move the
register offsets definitions to a u32 array.

Of course, every usage of the definitions was changed to use the
newly introduced register offsets array.

This change brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/irqchip/irq-mtk-cirq.c | 62 ++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 9bca0918078e..affbc0f48550 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -15,14 +15,30 @@
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
+enum mtk_cirq_reg_index {
+	CIRQ_STA = 0,
+	CIRQ_ACK,
+	CIRQ_MASK_SET,
+	CIRQ_MASK_CLR,
+	CIRQ_SENS_SET,
+	CIRQ_SENS_CLR,
+	CIRQ_POL_SET,
+	CIRQ_POL_CLR,
+	CIRQ_CONTROL,
+	CIRQ_MAX
+};
+
+static const u32 mtk_cirq_regs_v1[] = {
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
@@ -32,18 +48,20 @@ struct mtk_cirq_chip_data {
 	void __iomem *base;
 	unsigned int ext_irq_start;
 	unsigned int ext_irq_end;
+	const u32 *regs;
 	struct irq_domain *domain;
 };
 
 static struct mtk_cirq_chip_data *cirq_data;
 
-static void mtk_cirq_write_mask(struct irq_data *data, unsigned int offset)
+static void mtk_cirq_write_mask(struct irq_data *data, enum mtk_cirq_reg_index idx)
 {
 	struct mtk_cirq_chip_data *chip_data = data->chip_data;
 	unsigned int cirq_num = data->hwirq;
 	u32 mask = 1 << (cirq_num % 32);
+	u32 reg = chip_data->regs[idx] + (cirq_num / 32) * 4;
 
-	writel_relaxed(mask, chip_data->base + offset + (cirq_num / 32) * 4);
+	writel_relaxed(mask, chip_data->base + reg);
 }
 
 static void mtk_cirq_mask(struct irq_data *data)
@@ -160,7 +178,7 @@ static const struct irq_domain_ops cirq_domain_ops = {
 #ifdef CONFIG_PM_SLEEP
 static int mtk_cirq_suspend(void)
 {
-	u32 value, mask;
+	u32 value, mask, reg;
 	unsigned int irq, hwirq_num;
 	bool pending, masked;
 	int i, pendret, maskret;
@@ -200,31 +218,34 @@ static int mtk_cirq_suspend(void)
 				continue;
 		}
 
+		reg = cirq_data->regs[CIRQ_ACK] + (i / 32) * 4;
 		mask = 1 << (i % 32);
-		writel_relaxed(mask, cirq_data->base + CIRQ_ACK + (i / 32) * 4);
+		writel_relaxed(mask, cirq_data->base + reg);
 	}
 
 	/* set edge_only mode, record edge-triggerd interrupts */
 	/* enable cirq */
-	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
+	reg = cirq_data->regs[CIRQ_CONTROL];
+	value = readl_relaxed(cirq_data->base + reg);
 	value |= (CIRQ_EDGE | CIRQ_EN);
-	writel_relaxed(value, cirq_data->base + CIRQ_CONTROL);
+	writel_relaxed(value, cirq_data->base + reg);
 
 	return 0;
 }
 
 static void mtk_cirq_resume(void)
 {
+	u32 reg = cirq_data->regs[CIRQ_CONTROL];
 	u32 value;
 
 	/* flush recorded interrupts, will send signals to parent controller */
-	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
-	writel_relaxed(value | CIRQ_FLUSH, cirq_data->base + CIRQ_CONTROL);
+	value = readl_relaxed(cirq_data->base + reg);
+	writel_relaxed(value | CIRQ_FLUSH, cirq_data->base + reg);
 
 	/* disable cirq */
-	value = readl_relaxed(cirq_data->base + CIRQ_CONTROL);
+	value = readl_relaxed(cirq_data->base + reg);
 	value &= ~(CIRQ_EDGE | CIRQ_EN);
-	writel_relaxed(value, cirq_data->base + CIRQ_CONTROL);
+	writel_relaxed(value, cirq_data->base + reg);
 }
 
 static struct syscore_ops mtk_cirq_syscore_ops = {
@@ -240,6 +261,9 @@ static void mtk_cirq_syscore_init(void)
 static inline void mtk_cirq_syscore_init(void) {}
 #endif
 
+static const struct of_device_id mtk_cirq_of_match[] = {
+	{ .compatible = "mediatek,
+
 static int __init mtk_cirq_of_init(struct device_node *node,
 				   struct device_node *parent)
 {
@@ -274,6 +298,8 @@ static int __init mtk_cirq_of_init(struct device_node *node,
 	if (ret)
 		goto out_unmap;
 
+	cirq_data->regs = mtk_cirq_regs_v1;
+
 	irq_num = cirq_data->ext_irq_end - cirq_data->ext_irq_start + 1;
 	domain = irq_domain_add_hierarchy(domain_parent, 0,
 					  irq_num, node,
-- 
2.38.1


