Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC947C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 11:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88EC460E52
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 11:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88EC460E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1U8XRYgh5A6YVqXItU0OKibVVJgAG07if8EhxOHBV5c=; b=bPcOP4o6Smuz89
	TKpe0uuVHMAD3106CzJoqVstgpW9hgKtER2GpJ3URh/ceMerhpqbNCBgZ4PoZFJ1DDisBIwir1EEK
	ON/xtT2BMjhwMShOHWqWbFfCLT96AoAIMcty/XGcE1t6GvRr1KF9YvRU+Lhqrt4TbYeKTzW0iTJbC
	pr8SCz7rB35t+/yG8UhQZbr7vv23+FJffZbCGgs+op5+EDcX9M0q4zgDzzhcr80RmmKTsbaXIhDVu
	3nuMZsMxX1HeQhj8gEdm4FWUbzMVkdtJaq7dAKOW8i3HGR3sRQICUSTwuBwsLBubT41vUvlaabyKV
	QtwNj6k6sGVQnpPVLIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ6tL-005SY1-8Y; Tue, 14 Sep 2021 11:46:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ6ss-005SPG-4v; Tue, 14 Sep 2021 11:45:56 +0000
X-UUID: 8de715c8f9504d5c837c4569ed5349d2-20210914
X-UUID: 8de715c8f9504d5c837c4569ed5349d2-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 28210149; Tue, 14 Sep 2021 04:45:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 04:38:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 19:38:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 19:38:08 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v4 05/13] memory: mtk-smi: Adjust some code position
Date: Tue, 14 Sep 2021 19:36:55 +0800
Message-ID: <20210914113703.31466-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210914113703.31466-1-yong.wu@mediatek.com>
References: <20210914113703.31466-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_044554_264124_C6EEACCA 
X-CRM114-Status: GOOD (  17.25  )
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

No functional change. Only move the code position to make the code more
readable.
1. Put the register smi-common above smi-larb. Prepare to add some others
   register setting.
2. Put mtk_smi_larb_unbind around larb_bind.
3. Sort the SoC data alphabetically. and put them in one line as the
   current kernel allow it.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/memory/mtk-smi.c | 188 ++++++++++++++++-----------------------
 1 file changed, 75 insertions(+), 113 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 02a584dfb9b1..33b6c5efe102 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -17,13 +17,16 @@
 #include <dt-bindings/memory/mt2701-larb-port.h>
 #include <dt-bindings/memory/mtk-memory-port.h>
 
-/* mt8173 */
-#define SMI_LARB_MMU_EN		0xf00
+/* SMI COMMON */
+#define SMI_BUS_SEL			0x220
+#define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
+/* All are MMU0 defaultly. Only specialize mmu1 here. */
+#define F_MMU1_LARB(larbid)		(0x1 << SMI_BUS_LARB_SHIFT(larbid))
 
-/* mt8167 */
-#define MT8167_SMI_LARB_MMU_EN	0xfc0
+/* SMI LARB */
 
-/* mt2701 */
+/* Below are about mmu enable registers, they are different in SoCs */
+/* gen1: mt2701 */
 #define REG_SMI_SECUR_CON_BASE		0x5c0
 
 /* every register control 8 port, register offset 0x4 */
@@ -41,20 +44,21 @@
 /* mt2701 domain should be set to 3 */
 #define SMI_SECUR_CON_VAL_DOMAIN(id)	(0x3 << ((((id) & 0x7) << 2) + 1))
 
-/* mt2712 */
-#define SMI_LARB_NONSEC_CON(id)	(0x380 + ((id) * 4))
-#define F_MMU_EN		BIT(0)
-#define BANK_SEL(id)		({			\
+/* gen2: */
+/* mt8167 */
+#define MT8167_SMI_LARB_MMU_EN		0xfc0
+
+/* mt8173 */
+#define MT8173_SMI_LARB_MMU_EN		0xf00
+
+/* general */
+#define SMI_LARB_NONSEC_CON(id)		(0x380 + ((id) * 4))
+#define F_MMU_EN			BIT(0)
+#define BANK_SEL(id)			({		\
 	u32 _id = (id) & 0x3;				\
 	(_id << 8 | _id << 10 | _id << 12 | _id << 14);	\
 })
 
-/* SMI COMMON */
-#define SMI_BUS_SEL			0x220
-#define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
-/* All are MMU0 defaultly. Only specialize mmu1 here. */
-#define F_MMU1_LARB(larbid)		(0x1 << SMI_BUS_LARB_SHIFT(larbid))
-
 enum mtk_smi_type {
 	MTK_SMI_GEN1,
 	MTK_SMI_GEN2
@@ -140,36 +144,16 @@ mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
 	return -ENODEV;
 }
 
-static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
-{
-	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
-	u32 reg;
-	int i;
-
-	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
-		return;
-
-	for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
-		reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
-		reg |= F_MMU_EN;
-		reg |= BANK_SEL(larb->bank[i]);
-		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
-	}
-}
-
-static void mtk_smi_larb_config_port_mt8173(struct device *dev)
+static void
+mtk_smi_larb_unbind(struct device *dev, struct device *master, void *data)
 {
-	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
-
-	writel(*larb->mmu, larb->base + SMI_LARB_MMU_EN);
+	/* Do nothing as the iommu is always enabled. */
 }
 
-static void mtk_smi_larb_config_port_mt8167(struct device *dev)
-{
-	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
-
-	writel(*larb->mmu, larb->base + MT8167_SMI_LARB_MMU_EN);
-}
+static const struct component_ops mtk_smi_larb_component_ops = {
+	.bind = mtk_smi_larb_bind,
+	.unbind = mtk_smi_larb_unbind,
+};
 
 static void mtk_smi_larb_config_port_gen1(struct device *dev)
 {
@@ -202,26 +186,36 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
 	}
 }
 
-static void
-mtk_smi_larb_unbind(struct device *dev, struct device *master, void *data)
+static void mtk_smi_larb_config_port_mt8167(struct device *dev)
 {
-	/* Do nothing as the iommu is always enabled. */
+	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
+
+	writel(*larb->mmu, larb->base + MT8167_SMI_LARB_MMU_EN);
 }
 
-static const struct component_ops mtk_smi_larb_component_ops = {
-	.bind = mtk_smi_larb_bind,
-	.unbind = mtk_smi_larb_unbind,
-};
+static void mtk_smi_larb_config_port_mt8173(struct device *dev)
+{
+	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 
-static const struct mtk_smi_larb_gen mtk_smi_larb_mt8173 = {
-	/* mt8173 do not need the port in larb */
-	.config_port = mtk_smi_larb_config_port_mt8173,
-};
+	writel(*larb->mmu, larb->base + MT8173_SMI_LARB_MMU_EN);
+}
 
-static const struct mtk_smi_larb_gen mtk_smi_larb_mt8167 = {
-	/* mt8167 do not need the port in larb */
-	.config_port = mtk_smi_larb_config_port_mt8167,
-};
+static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
+{
+	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
+	u32 reg;
+	int i;
+
+	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
+		return;
+
+	for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
+		reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
+		reg |= F_MMU_EN;
+		reg |= BANK_SEL(larb->bank[i]);
+		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
+	}
+}
 
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt2701 = {
 	.port_in_larb = {
@@ -243,6 +237,16 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt6779 = {
 		/* DUMMY | IPU0 | IPU1 | CCU | MDLA */
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8167 = {
+	/* mt8167 do not need the port in larb */
+	.config_port = mtk_smi_larb_config_port_mt8167,
+};
+
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8173 = {
+	/* mt8173 do not need the port in larb */
+	.config_port = mtk_smi_larb_config_port_mt8173,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 	.larb_direct_to_common_mask = BIT(2) | BIT(3) | BIT(7),
@@ -254,34 +258,13 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 };
 
 static const struct of_device_id mtk_smi_larb_of_ids[] = {
-	{
-		.compatible = "mediatek,mt8167-smi-larb",
-		.data = &mtk_smi_larb_mt8167
-	},
-	{
-		.compatible = "mediatek,mt8173-smi-larb",
-		.data = &mtk_smi_larb_mt8173
-	},
-	{
-		.compatible = "mediatek,mt2701-smi-larb",
-		.data = &mtk_smi_larb_mt2701
-	},
-	{
-		.compatible = "mediatek,mt2712-smi-larb",
-		.data = &mtk_smi_larb_mt2712
-	},
-	{
-		.compatible = "mediatek,mt6779-smi-larb",
-		.data = &mtk_smi_larb_mt6779
-	},
-	{
-		.compatible = "mediatek,mt8183-smi-larb",
-		.data = &mtk_smi_larb_mt8183
-	},
-	{
-		.compatible = "mediatek,mt8192-smi-larb",
-		.data = &mtk_smi_larb_mt8192
-	},
+	{.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
+	{.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
+	{.compatible = "mediatek,mt6779-smi-larb", .data = &mtk_smi_larb_mt6779},
+	{.compatible = "mediatek,mt8167-smi-larb", .data = &mtk_smi_larb_mt8167},
+	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
+	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
+	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
 	{}
 };
 
@@ -438,34 +421,13 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 };
 
 static const struct of_device_id mtk_smi_common_of_ids[] = {
-	{
-		.compatible = "mediatek,mt8173-smi-common",
-		.data = &mtk_smi_common_gen2,
-	},
-	{
-		.compatible = "mediatek,mt8167-smi-common",
-		.data = &mtk_smi_common_gen2,
-	},
-	{
-		.compatible = "mediatek,mt2701-smi-common",
-		.data = &mtk_smi_common_gen1,
-	},
-	{
-		.compatible = "mediatek,mt2712-smi-common",
-		.data = &mtk_smi_common_gen2,
-	},
-	{
-		.compatible = "mediatek,mt6779-smi-common",
-		.data = &mtk_smi_common_mt6779,
-	},
-	{
-		.compatible = "mediatek,mt8183-smi-common",
-		.data = &mtk_smi_common_mt8183,
-	},
-	{
-		.compatible = "mediatek,mt8192-smi-common",
-		.data = &mtk_smi_common_mt8192,
-	},
+	{.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
+	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
+	{.compatible = "mediatek,mt6779-smi-common", .data = &mtk_smi_common_mt6779},
+	{.compatible = "mediatek,mt8167-smi-common", .data = &mtk_smi_common_gen2},
+	{.compatible = "mediatek,mt8173-smi-common", .data = &mtk_smi_common_gen2},
+	{.compatible = "mediatek,mt8183-smi-common", .data = &mtk_smi_common_mt8183},
+	{.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
 	{}
 };
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
