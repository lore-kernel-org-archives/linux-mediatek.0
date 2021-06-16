Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165A9C48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 11:49:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFFEA61241
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 11:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFFEA61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCuS1FkNbZWrtBkoAo/Yz27XxyOqr6iJUh6/GQrdIFc=; b=eZTGI8pglaAahk
	vsfAb35zvk+rj/mf+RgsYdQ76ulBVtgvbQ0tZuYyyWWVy0iK8RplfwUnR4x+c3PldrchYpAht56Gw
	iUrkSLs8STgI/NY+KHvxBhgtO/ohCu+5vN529tadT/D2lKlfkZS9p9YIgZCZWafsVlZhHC1qrhqWB
	phVrHss5eGYCM5dfntk3zHK80RnQsVKPfXhR5MUeUl2av/wZtz2tDj/T1S3Pxd13CEbuHy7PUtCcU
	8Sw0Egiox37mljCAWNIZIUBfqJx6ZvLdD/3Yr/O+j6KIMdDv799Nh+5npHQIAZrvOFVDhNRqTw8Ol
	k6fGYxQZlXjmED4OlWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltU2P-0067Kp-Tu; Wed, 16 Jun 2021 11:48:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltU1r-006797-6P; Wed, 16 Jun 2021 11:48:21 +0000
X-UUID: 9c9aa7ccbf294ceb8a40f0ba5fd42082-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=denad34Tt9MmjlpUkxJIcrBgLkJVOaRDWrPVF3tu26Y=; 
 b=q3kmHeHHDUor9dvE3BvTAXivGXP/58rwYeq5A1bGR1mXXupxxF1QwHSDOF14ZlBVA/KpLYs38vYbvMHqoLxkr4bscMNtSlKc1in5t4byIgGemhA/6xOlH7snwZEGNBhSlW0JW/BFGziZphFFhl5Xl+dGig0XKln8e8lAzTgOtwA=;
X-UUID: 9c9aa7ccbf294ceb8a40f0ba5fd42082-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 808586810; Wed, 16 Jun 2021 04:48:12 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 04:44:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 19:44:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 19:44:26 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>
Subject: [PATCH 3/9] memory: mtk-smi: Use clk_bulk instead of the clk ops
Date: Wed, 16 Jun 2021 19:43:40 +0800
Message-ID: <20210616114346.18812-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616114346.18812-1-yong.wu@mediatek.com>
References: <20210616114346.18812-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_044819_564838_6F91676D 
X-CRM114-Status: GOOD (  24.46  )
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

smi have many clocks: apb/smi/gals.
This patch use clk_bulk interface instead of the orginal one to simply
the code.

gals is optional clk(some larbs may don't have gals). use clk_bulk_optional
instead. and then remove the has_gals flag.

Also remove clk fail logs since bulk interface already output fail log.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 124 +++++++++++----------------------------
 1 file changed, 34 insertions(+), 90 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index c5fb51f73b34..bcd2bf130655 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -60,9 +60,18 @@ enum mtk_smi_gen {
 	MTK_SMI_GEN2
 };
 
+#define MTK_SMI_CLK_NR_MAX			4
+
+static const char * const mtk_smi_common_clocks[] = {
+	"apb", "smi", "gals0", "gals1", /* glas is optional */
+};
+
+static const char * const mtk_smi_larb_clocks[] = {
+	"apb",  "smi", "gals"
+};
+
 struct mtk_smi_common_plat {
 	enum mtk_smi_gen gen;
-	bool             has_gals;
 	u32              bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
 };
 
@@ -70,13 +79,12 @@ struct mtk_smi_larb_gen {
 	int port_in_larb[MTK_LARB_NR_MAX + 1];
 	void (*config_port)(struct device *dev);
 	unsigned int			larb_direct_to_common_mask;
-	bool				has_gals;
 };
 
 struct mtk_smi {
 	struct device			*dev;
-	struct clk			*clk_apb, *clk_smi;
-	struct clk			*clk_gals0, *clk_gals1;
+	unsigned int			clk_num;
+	struct clk_bulk_data		clks[MTK_SMI_CLK_NR_MAX];
 	struct clk			*clk_async; /*only needed by mt2701*/
 	union {
 		void __iomem		*smi_ao_base; /* only for gen1 */
@@ -95,45 +103,6 @@ struct mtk_smi_larb { /* larb: local arbiter */
 	unsigned char			*bank;
 };
 
-static int mtk_smi_clk_enable(const struct mtk_smi *smi)
-{
-	int ret;
-
-	ret = clk_prepare_enable(smi->clk_apb);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(smi->clk_smi);
-	if (ret)
-		goto err_disable_apb;
-
-	ret = clk_prepare_enable(smi->clk_gals0);
-	if (ret)
-		goto err_disable_smi;
-
-	ret = clk_prepare_enable(smi->clk_gals1);
-	if (ret)
-		goto err_disable_gals0;
-
-	return 0;
-
-err_disable_gals0:
-	clk_disable_unprepare(smi->clk_gals0);
-err_disable_smi:
-	clk_disable_unprepare(smi->clk_smi);
-err_disable_apb:
-	clk_disable_unprepare(smi->clk_apb);
-	return ret;
-}
-
-static void mtk_smi_clk_disable(const struct mtk_smi *smi)
-{
-	clk_disable_unprepare(smi->clk_gals1);
-	clk_disable_unprepare(smi->clk_gals0);
-	clk_disable_unprepare(smi->clk_smi);
-	clk_disable_unprepare(smi->clk_apb);
-}
-
 int mtk_smi_larb_get(struct device *larbdev)
 {
 	int ret = pm_runtime_resume_and_get(larbdev);
@@ -270,7 +239,6 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt6779 = {
 };
 
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
-	.has_gals                   = true,
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 	.larb_direct_to_common_mask = BIT(2) | BIT(3) | BIT(7),
 				      /* IPU0 | IPU1 | CCU */
@@ -320,6 +288,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	struct device_node *smi_node;
 	struct platform_device *smi_pdev;
 	struct device_link *link;
+	int i, ret;
 
 	larb = devm_kzalloc(dev, sizeof(*larb), GFP_KERNEL);
 	if (!larb)
@@ -331,22 +300,14 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	if (IS_ERR(larb->base))
 		return PTR_ERR(larb->base);
 
-	larb->smi.clk_apb = devm_clk_get(dev, "apb");
-	if (IS_ERR(larb->smi.clk_apb))
-		return PTR_ERR(larb->smi.clk_apb);
-
-	larb->smi.clk_smi = devm_clk_get(dev, "smi");
-	if (IS_ERR(larb->smi.clk_smi))
-		return PTR_ERR(larb->smi.clk_smi);
-
-	if (larb->larb_gen->has_gals) {
-		/* The larbs may still haven't gals even if the SoC support.*/
-		larb->smi.clk_gals0 = devm_clk_get(dev, "gals");
-		if (PTR_ERR(larb->smi.clk_gals0) == -ENOENT)
-			larb->smi.clk_gals0 = NULL;
-		else if (IS_ERR(larb->smi.clk_gals0))
-			return PTR_ERR(larb->smi.clk_gals0);
-	}
+	larb->smi.clk_num = ARRAY_SIZE(mtk_smi_larb_clocks);
+	for (i = 0; i < larb->smi.clk_num; i++)
+		larb->smi.clks[i].id = mtk_smi_larb_clocks[i];
+
+	ret = devm_clk_bulk_get_optional(dev, larb->smi.clk_num, larb->smi.clks);
+	if (ret)
+		return ret;
+
 	larb->smi.dev = dev;
 
 	smi_node = of_parse_phandle(dev->of_node, "mediatek,smi", 0);
@@ -391,11 +352,9 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
 	const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
 	int ret;
 
-	ret = mtk_smi_clk_enable(&larb->smi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enable clock(%d).\n", ret);
+	ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb->smi.clks);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Configure the basic setting for this larb */
 	larb_gen->config_port(dev);
@@ -407,7 +366,7 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 
-	mtk_smi_clk_disable(&larb->smi);
+	clk_bulk_disable_unprepare(larb->smi.clk_num, larb->smi.clks);
 	return 0;
 }
 
@@ -437,21 +396,18 @@ static const struct mtk_smi_common_plat mtk_smi_common_gen2 = {
 
 static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
 	.gen		= MTK_SMI_GEN2,
-	.has_gals	= true,
 	.bus_sel	= F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
 			  F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
 	.gen      = MTK_SMI_GEN2,
-	.has_gals = true,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
 		    F_MMU1_LARB(7),
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 	.gen      = MTK_SMI_GEN2,
-	.has_gals = true,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
 		    F_MMU1_LARB(6),
 };
@@ -493,7 +449,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_smi *common;
 	struct resource *res;
-	int ret;
+	int i, ret;
 
 	common = devm_kzalloc(dev, sizeof(*common), GFP_KERNEL);
 	if (!common)
@@ -501,23 +457,13 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	common->dev = dev;
 	common->plat = of_device_get_match_data(dev);
 
-	common->clk_apb = devm_clk_get(dev, "apb");
-	if (IS_ERR(common->clk_apb))
-		return PTR_ERR(common->clk_apb);
-
-	common->clk_smi = devm_clk_get(dev, "smi");
-	if (IS_ERR(common->clk_smi))
-		return PTR_ERR(common->clk_smi);
+	common->clk_num = ARRAY_SIZE(mtk_smi_common_clocks);
+	for (i = 0; i < common->clk_num; i++)
+		common->clks[i].id = mtk_smi_common_clocks[i];
 
-	if (common->plat->has_gals) {
-		common->clk_gals0 = devm_clk_get(dev, "gals0");
-		if (IS_ERR(common->clk_gals0))
-			return PTR_ERR(common->clk_gals0);
-
-		common->clk_gals1 = devm_clk_get(dev, "gals1");
-		if (IS_ERR(common->clk_gals1))
-			return PTR_ERR(common->clk_gals1);
-	}
+	ret = devm_clk_bulk_get_optional(dev, common->clk_num, common->clks);
+	if (ret)
+		return ret;
 
 	/*
 	 * for mtk smi gen 1, we need to get the ao(always on) base to config
@@ -561,11 +507,9 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
 	u32 bus_sel = common->plat->bus_sel;
 	int ret;
 
-	ret = mtk_smi_clk_enable(common);
-	if (ret) {
-		dev_err(common->dev, "Failed to enable clock(%d).\n", ret);
+	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
+	if (ret)
 		return ret;
-	}
 
 	if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
 		writel(bus_sel, common->base + SMI_BUS_SEL);
@@ -576,7 +520,7 @@ static int __maybe_unused mtk_smi_common_suspend(struct device *dev)
 {
 	struct mtk_smi *common = dev_get_drvdata(dev);
 
-	mtk_smi_clk_disable(common);
+	clk_bulk_disable_unprepare(common->clk_num, common->clks);
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
