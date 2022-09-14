Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46113C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39ebN8yN46vkEhOfN7WVyLWWk/+c6irLgIToD0MrqLc=; b=Yex1dOZvEZwhEmH+rjhZm0A3f9
	tToHpHCjgxcHoyYF8aFkE9+CCI3i/rybehUaNCUckLhAtlsBuNIfe7DMLoQxzU+0AtiV+kclqCJLV
	Zje+uGzeNppxfBXVHq1BR+cje8d+1mw8Yjs10JeJf0IOJrBOt+5J5tzHoBDmDon0txVCpVGtLe5+j
	df16wB6rY0wL4DDAI9xPp/ugvQuddEY4AgAX5vwB3IBGeB+lKCngs7KEO5TnMzIIm59XxcGrhnnP6
	iQoX3AQz+hnCMgtk7G9AOBHDgFd8fEQC/WfP5Byuy0I/AH1SbU+1zzzj0IJNn49CbpH5g4DXSw+Af
	3IdGLS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSiq-001CLA-OF; Wed, 14 Sep 2022 13:46:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSin-001CF1-H4; Wed, 14 Sep 2022 13:46:35 +0000
X-UUID: b60bb44a915148e693a1988f37d19a33-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=39ebN8yN46vkEhOfN7WVyLWWk/+c6irLgIToD0MrqLc=;
	b=MGak5W9UmG7VsZfKN7eH//eW8/QwH8IWtZnA6pEUl8RugGnlF/8eqKDPpEXYHbP6SqcgdfL+E03tMymAZ/xBkikxVaitkXQ7yc1rty0CLcbp+xycioasC6V1bh49M7t56MqMMfiO9ZdwxPUAnFTcX4gQdNMLE5x2jTrIXiYivmM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:19129ee7-8afd-4a10-a4a2-2f08f813d2e1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:05a864f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b60bb44a915148e693a1988f37d19a33-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 467904578; Wed, 14 Sep 2022 06:46:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 20:45:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Sep 2022 20:45:53 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>
Subject: [PATCH v2 1/4] clk: mediatek: Export PLL operations symbols
Date: Wed, 14 Sep 2022 20:45:49 +0800
Message-ID: <20220914124552.16964-2-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220914124552.16964-1-johnson.wang@mediatek.com>
References: <20220914124552.16964-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_064633_622380_7A5D91FD 
X-CRM114-Status: GOOD (  20.38  )
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

Export PLL operations and register functions for different type
of clock driver used.

Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 drivers/clk/mediatek/clk-pll.c | 84 ++++++++++++++--------------------
 drivers/clk/mediatek/clk-pll.h | 56 +++++++++++++++++++++++
 2 files changed, 90 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 54e6cfd29dfc..a4eca5fd539c 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -27,37 +27,10 @@
 
 #define AUDPLL_TUNER_EN		BIT(31)
 
-#define POSTDIV_MASK		0x7
-
 /* default 7 bits integer, can be overridden with pcwibits. */
 #define INTEGER_BITS		7
 
-/*
- * MediaTek PLLs are configured through their pcw value. The pcw value describes
- * a divider in the PLL feedback loop which consists of 7 bits for the integer
- * part and the remaining bits (if present) for the fractional part. Also they
- * have a 3 bit power-of-two post divider.
- */
-
-struct mtk_clk_pll {
-	struct clk_hw	hw;
-	void __iomem	*base_addr;
-	void __iomem	*pd_addr;
-	void __iomem	*pwr_addr;
-	void __iomem	*tuner_addr;
-	void __iomem	*tuner_en_addr;
-	void __iomem	*pcw_addr;
-	void __iomem	*pcw_chg_addr;
-	void __iomem	*en_addr;
-	const struct mtk_pll_data *data;
-};
-
-static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
-{
-	return container_of(hw, struct mtk_clk_pll, hw);
-}
-
-static int mtk_pll_is_prepared(struct clk_hw *hw)
+int mtk_pll_is_prepared(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 
@@ -161,8 +134,8 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
  * @fin:	The input frequency
  *
  */
-static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
-		u32 freq, u32 fin)
+void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
+			 u32 freq, u32 fin)
 {
 	unsigned long fmin = pll->data->fmin ? pll->data->fmin : (1000 * MHZ);
 	const struct mtk_pll_div_table *div_table = pll->data->div_table;
@@ -198,8 +171,8 @@ static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
 	*pcw = (u32)_pcw;
 }
 
-static int mtk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long parent_rate)
+int mtk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+		     unsigned long parent_rate)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 pcw = 0;
@@ -211,8 +184,7 @@ static int mtk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static unsigned long mtk_pll_recalc_rate(struct clk_hw *hw,
-		unsigned long parent_rate)
+unsigned long mtk_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 postdiv;
@@ -227,8 +199,8 @@ static unsigned long mtk_pll_recalc_rate(struct clk_hw *hw,
 	return __mtk_pll_recalc_rate(pll, parent_rate, pcw, postdiv);
 }
 
-static long mtk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *prate)
+long mtk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *prate)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 pcw = 0;
@@ -239,7 +211,7 @@ static long mtk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return __mtk_pll_recalc_rate(pll, *prate, pcw, postdiv);
 }
 
-static int mtk_pll_prepare(struct clk_hw *hw)
+int mtk_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
@@ -273,7 +245,7 @@ static int mtk_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static void mtk_pll_unprepare(struct clk_hw *hw)
+void mtk_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
@@ -301,7 +273,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
 	writel(r, pll->pwr_addr);
 }
 
-static const struct clk_ops mtk_pll_ops = {
+const struct clk_ops mtk_pll_ops = {
 	.is_prepared	= mtk_pll_is_prepared,
 	.prepare	= mtk_pll_prepare,
 	.unprepare	= mtk_pll_unprepare,
@@ -310,18 +282,15 @@ static const struct clk_ops mtk_pll_ops = {
 	.set_rate	= mtk_pll_set_rate,
 };
 
-static struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
-		void __iomem *base)
+struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
+					const struct mtk_pll_data *data,
+					void __iomem *base,
+					const struct clk_ops *pll_ops)
 {
-	struct mtk_clk_pll *pll;
 	struct clk_init_data init = {};
 	int ret;
 	const char *parent_name = "clk26m";
 
-	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll)
-		return ERR_PTR(-ENOMEM);
-
 	pll->base_addr = base + data->reg;
 	pll->pwr_addr = base + data->pwr_reg;
 	pll->pd_addr = base + data->pd_reg;
@@ -343,7 +312,7 @@ static struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 
 	init.name = data->name;
 	init.flags = (data->flags & PLL_AO) ? CLK_IS_CRITICAL : 0;
-	init.ops = &mtk_pll_ops;
+	init.ops = pll_ops;
 	if (data->parent_name)
 		init.parent_names = &data->parent_name;
 	else
@@ -360,7 +329,22 @@ static struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
 	return &pll->hw;
 }
 
-static void mtk_clk_unregister_pll(struct clk_hw *hw)
+struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
+				    void __iomem *base)
+{
+	struct mtk_clk_pll *pll;
+	struct clk_hw *hw;
+
+	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	hw = mtk_clk_register_pll_ops(pll, data, base, &mtk_pll_ops);
+
+	return hw;
+}
+
+void mtk_clk_unregister_pll(struct clk_hw *hw)
 {
 	struct mtk_clk_pll *pll;
 
@@ -423,8 +407,8 @@ int mtk_clk_register_plls(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
 
-static __iomem void *mtk_clk_pll_get_base(struct clk_hw *hw,
-					  const struct mtk_pll_data *data)
+__iomem void *mtk_clk_pll_get_base(struct clk_hw *hw,
+				   const struct mtk_pll_data *data)
 {
 	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index fe3199715688..e87ab08eea9b 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -7,6 +7,7 @@
 #ifndef __DRV_CLK_MTK_PLL_H
 #define __DRV_CLK_MTK_PLL_H
 
+#include <linux/clk-provider.h>
 #include <linux/types.h>
 
 struct clk_ops;
@@ -20,6 +21,7 @@ struct mtk_pll_div_table {
 
 #define HAVE_RST_BAR	BIT(0)
 #define PLL_AO		BIT(1)
+#define POSTDIV_MASK	0x7
 
 struct mtk_pll_data {
 	int id;
@@ -48,10 +50,64 @@ struct mtk_pll_data {
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 };
 
+/*
+ * MediaTek PLLs are configured through their pcw value. The pcw value describes
+ * a divider in the PLL feedback loop which consists of 7 bits for the integer
+ * part and the remaining bits (if present) for the fractional part. Also they
+ * have a 3 bit power-of-two post divider.
+ */
+
+struct mtk_clk_pll {
+	struct clk_hw	hw;
+	void __iomem	*base_addr;
+	void __iomem	*pd_addr;
+	void __iomem	*pwr_addr;
+	void __iomem	*tuner_addr;
+	void __iomem	*tuner_en_addr;
+	void __iomem	*pcw_addr;
+	void __iomem	*pcw_chg_addr;
+	void __iomem	*en_addr;
+	const struct mtk_pll_data *data;
+};
+
+
 int mtk_clk_register_plls(struct device_node *node,
 			  const struct mtk_pll_data *plls, int num_plls,
 			  struct clk_hw_onecell_data *clk_data);
 void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 			     struct clk_hw_onecell_data *clk_data);
 
+extern const struct clk_ops mtk_pll_ops;
+
+static inline struct mtk_clk_pll *to_mtk_clk_pll(struct clk_hw *hw)
+{
+	return container_of(hw, struct mtk_clk_pll, hw);
+}
+
+int mtk_pll_is_prepared(struct clk_hw *hw);
+
+int mtk_pll_prepare(struct clk_hw *hw);
+
+void mtk_pll_unprepare(struct clk_hw *hw);
+
+unsigned long mtk_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate);
+
+void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
+			 u32 freq, u32 fin);
+int mtk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+		     unsigned long parent_rate);
+long mtk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *prate);
+
+struct clk_hw *mtk_clk_register_pll_ops(struct mtk_clk_pll *pll,
+					const struct mtk_pll_data *data,
+					void __iomem *base,
+					const struct clk_ops *pll_ops);
+struct clk_hw *mtk_clk_register_pll(const struct mtk_pll_data *data,
+				    void __iomem *base);
+void mtk_clk_unregister_pll(struct clk_hw *hw);
+
+__iomem void *mtk_clk_pll_get_base(struct clk_hw *hw,
+				   const struct mtk_pll_data *data);
+
 #endif /* __DRV_CLK_MTK_PLL_H */
-- 
2.18.0


