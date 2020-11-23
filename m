Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7E4C56201
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:48:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 766CA2074B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u6EV6Rqn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g76vEyaC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 766CA2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4F/lO+H26PpNu35GkPZRgYxnOdKxrP3YBfJaIVO5yc=; b=u6EV6Rqn+aZYfwRpN/9V0E3tP
	lRpzOiCSGPRrth8SjK6o5/fiFD+byiU2CalUh17AnLAWjfY2x7bs6iBlZLeZD2K17zEuky2Md2VGj
	W+vWcJ8IZ3NLbKPDWO9AW182P4zfgF/KV33PQtM83LWr4F09hTT8qzLlXsW0S8rIA8E+4uHzjIIf8
	15oADlZe0Tx2EITYLs2lGSsTEB/0cOOW5WExvET1vAGIO+ao65jZXd/Jc6UIFRRA2dggdW1cGNvWp
	8Qw9oLDxiXDmMz5BGREzs+iGV+eKWc1SE0NLNSdDPEv20Ruvs3j1PQO+oC0OfgmBbBkJ7dVTDbgNz
	2zF59QbGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh2qD-0001qT-Nm; Mon, 23 Nov 2020 03:48:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh2q9-0001oE-Ki; Mon, 23 Nov 2020 03:48:35 +0000
X-UUID: 7375bbbfa75940e9ad3738303dca8c98-20201122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=04ex3XPUGKkDxTDZXxXtRwtSYOBPySZfTpPilLGGNtc=; 
 b=g76vEyaCBw/Z+iH+tpBKw0o2A/DXeBaeO46yLTh6mDiizSqtOCc4af3feWTw+uX999mAZNfzy9htI76KqSXUQeZUNk1Ie5PmNMwNvDo5WLm7X2QXZ4WZW+9+4762UaWrZZTMPxamagnVgC7xxe2NSKOkyd9CiuKHUKF+QJpYyJY=;
X-UUID: 7375bbbfa75940e9ad3738303dca8c98-20201122
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1601143776; Sun, 22 Nov 2020 19:48:08 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 Nov 2020 19:48:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Nov 2020 11:48:23 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 Nov 2020 11:48:23 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 1/8] mfd: mt6358: refine interrupt code
Date: Mon, 23 Nov 2020 11:48:03 +0800
Message-ID: <1606103290-15034-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_224834_241626_ACE8744F 
X-CRM114-Status: GOOD (  21.29  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch refines the interrupt related code to support new chips.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/mfd/mt6358-irq.c        | 65 +++++++++++++++++++--------------
 include/linux/mfd/mt6358/core.h |  8 ++--
 2 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
index db734f2831ff..4b094e5e51cc 100644
--- a/drivers/mfd/mt6358-irq.c
+++ b/drivers/mfd/mt6358-irq.c
@@ -13,7 +13,9 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-static struct irq_top_t mt6358_ints[] = {
+#define MTK_PMIC_REG_WIDTH 16
+
+static const struct irq_top_t mt6358_ints[] = {
 	MT6358_TOP_GEN(BUCK),
 	MT6358_TOP_GEN(LDO),
 	MT6358_TOP_GEN(PSC),
@@ -24,6 +26,13 @@ static struct irq_top_t mt6358_ints[] = {
 	MT6358_TOP_GEN(MISC),
 };
 
+static struct pmic_irq_data mt6358_irqd = {
+	.num_top = ARRAY_SIZE(mt6358_ints),
+	.num_pmic_irqs = MT6358_IRQ_NR,
+	.top_int_status_reg = MT6358_TOP_INT_STATUS0,
+	.pmic_ints = mt6358_ints,
+};
+
 static void pmic_irq_enable(struct irq_data *data)
 {
 	unsigned int hwirq = irqd_to_hwirq(data);
@@ -62,15 +71,15 @@ static void pmic_irq_sync_unlock(struct irq_data *data)
 		/* Find out the IRQ group */
 		top_gp = 0;
 		while ((top_gp + 1) < irqd->num_top &&
-		       i >= mt6358_ints[top_gp + 1].hwirq_base)
+		       i >= irqd->pmic_ints[top_gp + 1].hwirq_base)
 			top_gp++;
 
 		/* Find the IRQ registers */
-		gp_offset = i - mt6358_ints[top_gp].hwirq_base;
-		int_regs = gp_offset / MT6358_REG_WIDTH;
-		shift = gp_offset % MT6358_REG_WIDTH;
-		en_reg = mt6358_ints[top_gp].en_reg +
-			 (mt6358_ints[top_gp].en_reg_shift * int_regs);
+		gp_offset = i - irqd->pmic_ints[top_gp].hwirq_base;
+		int_regs = gp_offset / MTK_PMIC_REG_WIDTH;
+		shift = gp_offset % MTK_PMIC_REG_WIDTH;
+		en_reg = irqd->pmic_ints[top_gp].en_reg +
+			 (irqd->pmic_ints[top_gp].en_reg_shift * int_regs);
 
 		regmap_update_bits(chip->regmap, en_reg, BIT(shift),
 				   irqd->enable_hwirq[i] << shift);
@@ -95,10 +104,11 @@ static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
 	unsigned int irq_status, sta_reg, status;
 	unsigned int hwirq, virq;
 	int i, j, ret;
+	struct pmic_irq_data *irqd = chip->irq_data;
 
-	for (i = 0; i < mt6358_ints[top_gp].num_int_regs; i++) {
-		sta_reg = mt6358_ints[top_gp].sta_reg +
-			mt6358_ints[top_gp].sta_reg_shift * i;
+	for (i = 0; i < irqd->pmic_ints[top_gp].num_int_regs; i++) {
+		sta_reg = irqd->pmic_ints[top_gp].sta_reg +
+			irqd->pmic_ints[top_gp].sta_reg_shift * i;
 
 		ret = regmap_read(chip->regmap, sta_reg, &irq_status);
 		if (ret) {
@@ -114,8 +124,8 @@ static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
 		do {
 			j = __ffs(status);
 
-			hwirq = mt6358_ints[top_gp].hwirq_base +
-				MT6358_REG_WIDTH * i + j;
+			hwirq = irqd->pmic_ints[top_gp].hwirq_base +
+				MTK_PMIC_REG_WIDTH * i + j;
 
 			virq = irq_find_mapping(chip->irq_domain, hwirq);
 			if (virq)
@@ -131,12 +141,12 @@ static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
 static irqreturn_t mt6358_irq_handler(int irq, void *data)
 {
 	struct mt6397_chip *chip = data;
-	struct pmic_irq_data *mt6358_irq_data = chip->irq_data;
+	struct pmic_irq_data *irqd = chip->irq_data;
 	unsigned int bit, i, top_irq_status = 0;
 	int ret;
 
 	ret = regmap_read(chip->regmap,
-			  mt6358_irq_data->top_int_status_reg,
+			  irqd->top_int_status_reg,
 			  &top_irq_status);
 	if (ret) {
 		dev_err(chip->dev,
@@ -144,8 +154,8 @@ static irqreturn_t mt6358_irq_handler(int irq, void *data)
 		return IRQ_NONE;
 	}
 
-	for (i = 0; i < mt6358_irq_data->num_top; i++) {
-		bit = BIT(mt6358_ints[i].top_offset);
+	for (i = 0; i < irqd->num_top; i++) {
+		bit = BIT(irqd->pmic_ints[i].top_offset);
 		if (top_irq_status & bit) {
 			mt6358_irq_sp_handler(chip, i);
 			top_irq_status &= ~bit;
@@ -180,17 +190,18 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 	int i, j, ret;
 	struct pmic_irq_data *irqd;
 
-	irqd = devm_kzalloc(chip->dev, sizeof(*irqd), GFP_KERNEL);
-	if (!irqd)
-		return -ENOMEM;
+	switch (chip->chip_id) {
+	case MT6358_CHIP_ID:
+		chip->irq_data = &mt6358_irqd;
+		break;
 
-	chip->irq_data = irqd;
+	default:
+		dev_err(chip->dev, "unsupported chip: 0x%x\n", chip->chip_id);
+		return -ENODEV;
+	}
 
 	mutex_init(&chip->irqlock);
-	irqd->top_int_status_reg = MT6358_TOP_INT_STATUS0;
-	irqd->num_pmic_irqs = MT6358_IRQ_NR;
-	irqd->num_top = ARRAY_SIZE(mt6358_ints);
-
+	irqd = chip->irq_data;
 	irqd->enable_hwirq = devm_kcalloc(chip->dev,
 					  irqd->num_pmic_irqs,
 					  sizeof(*irqd->enable_hwirq),
@@ -207,10 +218,10 @@ int mt6358_irq_init(struct mt6397_chip *chip)
 
 	/* Disable all interrupts for initializing */
 	for (i = 0; i < irqd->num_top; i++) {
-		for (j = 0; j < mt6358_ints[i].num_int_regs; j++)
+		for (j = 0; j < irqd->pmic_ints[i].num_int_regs; j++)
 			regmap_write(chip->regmap,
-				     mt6358_ints[i].en_reg +
-				     mt6358_ints[i].en_reg_shift * j, 0);
+				     irqd->pmic_ints[i].en_reg +
+				     irqd->pmic_ints[i].en_reg_shift * j, 0);
 	}
 
 	chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
diff --git a/include/linux/mfd/mt6358/core.h b/include/linux/mfd/mt6358/core.h
index c5a11b7458d4..68578e2019b0 100644
--- a/include/linux/mfd/mt6358/core.h
+++ b/include/linux/mfd/mt6358/core.h
@@ -6,12 +6,9 @@
 #ifndef __MFD_MT6358_CORE_H__
 #define __MFD_MT6358_CORE_H__
 
-#define MT6358_REG_WIDTH 16
-
 struct irq_top_t {
 	int hwirq_base;
 	unsigned int num_int_regs;
-	unsigned int num_int_bits;
 	unsigned int en_reg;
 	unsigned int en_reg_shift;
 	unsigned int sta_reg;
@@ -25,6 +22,7 @@ struct pmic_irq_data {
 	unsigned short top_int_status_reg;
 	bool *enable_hwirq;
 	bool *cache_hwirq;
+	const struct irq_top_t *pmic_ints;
 };
 
 enum mt6358_irq_top_status_shift {
@@ -146,8 +144,8 @@ enum mt6358_irq_numbers {
 {	\
 	.hwirq_base = MT6358_IRQ_##sp##_BASE,	\
 	.num_int_regs =	\
-		((MT6358_IRQ_##sp##_BITS - 1) / MT6358_REG_WIDTH) + 1,	\
-	.num_int_bits = MT6358_IRQ_##sp##_BITS, \
+		((MT6358_IRQ_##sp##_BITS - 1) /	\
+		MTK_PMIC_REG_WIDTH) + 1,	\
 	.en_reg = MT6358_##sp##_TOP_INT_CON0,	\
 	.en_reg_shift = 0x6,	\
 	.sta_reg = MT6358_##sp##_TOP_INT_STATUS0,	\
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
