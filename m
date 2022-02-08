Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998CBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kVhkFngw+whYzLtnhmZAmRT9NFiSPXAx+FX+smNzKc=; b=PGxzAdSp3kUPGj
	RVkBE0dgkEEVwYUBRi3d3FtcBmgPeilICcBLwggkhlk3Xg8Sw23XsSQAZCojvvomuhW6MhMC9wpFR
	zeEVVeixMz7HDX8zo9Z3kyXMu8JQlteLV6P8nHWPG94eEjm5cDKDH94AzA8bX2CQTptMcAAn5frGc
	vVGlXc9vWFBPiMY+h3JdJ05M05y6Fyi4R4KGG+z9iAnaoAPDviSbSv6NiWuf0cyB3cl/hn+vR5nQF
	hbk0eLTxi9o3OjEYbmg1JsOhLzURqPB/gSePVKpuse4SkEu1TVdsEsECiFEL1DilXUkUbh3lRhIeJ
	LrHdd9OD4aScGYxzqLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPop-00DnqF-KX; Tue, 08 Feb 2022 12:42:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPni-00DnHN-Mp
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:40:57 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso417973pjd.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sJY5Um+e3Zhwa51B9/uiFlDKmQ6du7mYuS31VfH399Q=;
 b=SDUVezZ2U7t3EKc/zBv6B+CFLef3IyaUyi9jwAdEPdFHZ4OhbAldQvTrcFyF4SpMpw
 XbL84xhIgwY3GULLblL6VThNKqcL6YfvDQmb6FFmCF/+07WiwmAJYzh3n0JhpmU5gUF4
 b6b0N6R1MGh0WZrzWv0zOuyg3Nen/apn0TFfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJY5Um+e3Zhwa51B9/uiFlDKmQ6du7mYuS31VfH399Q=;
 b=LSLWbhaC2kGkiK0LZ+j8lVMkvbMFy1sWV/uj6ZPL9y4bE9170zYX41FvbqKRePwCFN
 if23/Hw25F7kuFJD4hDEpG7HUf9AGIUNCA5N3P9zHHC8cMPiVWz3owvThYfoawQb1D90
 14Hg029Dd7xkoiqEdb39ylFAOf+63GEvi8MefP3mXcge5K2QmGEP0P02r4hXnUXz3Q1L
 ffs0Zc9kc/59kaBN2goPRkxsfSGfID/pub7DC96gEgQptfXhdsYgR3ga5olHSwcmDl9u
 SFoMAKIBfRae18j5nYIiLMiKRkPnTz8x7UWkFvKxXcS3/VxqI6+BVWoMtt403MpTiC7z
 TUrQ==
X-Gm-Message-State: AOAM530I28E2a4oJHwuf7bKO9Orr3XFmIu4jyUFoR5BygEWLYTKJDfS+
 K+8gh16dUbnBaWAndJBy6vlJkQ==
X-Google-Smtp-Source: ABdhPJzIptVfF9/Nr+7xAEGmtgdzohLMSJf77H6U3m66Hps5mBQCBofvJaIC8Rc4OcVkb/jxNFfcfA==
X-Received: by 2002:a17:902:7e06:: with SMTP id
 b6mr4461526plm.58.1644324053538; 
 Tue, 08 Feb 2022 04:40:53 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:40:53 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/31] clk: mediatek: gate: Consolidate gate type clk
 related code
Date: Tue,  8 Feb 2022 20:40:05 +0800
Message-Id: <20220208124034.414635-3-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044054_839844_99F31B9F 
X-CRM114-Status: GOOD (  19.29  )
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

Right now some bits of the gate type clk code are in clk-gate.[ch], but
other bits are in clk-mtk.[ch]. This is different from the cpumux and
mux type clks, for which all of the code are found in the same files.

Move the functions that register multiple clks from a given list,
mtk_clk_register_gates_with_dev() and mtk_clk_register_gates(), to
clk-gate.[ch] to consolidate all the code for the gate type clks.

This commit only moves code with minor whitespace fixups to correct
the code style. Further improvements, such as internalizing various
functions and structures will be done in later commits.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 53 ++++++++++++++++++++++++++++++++-
 drivers/clk/mediatek/clk-gate.h | 25 ++++++++++++++++
 drivers/clk/mediatek/clk-mtk.c  | 51 -------------------------------
 drivers/clk/mediatek/clk-mtk.h  | 25 ----------------
 4 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 5d88b428565b..54921768bfba 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -11,9 +11,9 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/clkdev.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 
-#include "clk-mtk.h"
 #include "clk-gate.h"
 
 static u32 mtk_get_clockgating(struct clk_hw *hw)
@@ -182,4 +182,55 @@ struct clk *mtk_clk_register_gate(
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_gate);
 
+int mtk_clk_register_gates_with_dev(struct device_node *node,
+				    const struct mtk_gate *clks, int num,
+				    struct clk_onecell_data *clk_data,
+				    struct device *dev)
+{
+	int i;
+	struct clk *clk;
+	struct regmap *regmap;
+
+	if (!clk_data)
+		return -ENOMEM;
+
+	regmap = device_node_to_regmap(node);
+	if (IS_ERR(regmap)) {
+		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
+		return PTR_ERR(regmap);
+	}
+
+	for (i = 0; i < num; i++) {
+		const struct mtk_gate *gate = &clks[i];
+
+		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+			continue;
+
+		clk = mtk_clk_register_gate(gate->name, gate->parent_name,
+					    regmap,
+					    gate->regs->set_ofs,
+					    gate->regs->clr_ofs,
+					    gate->regs->sta_ofs,
+					    gate->shift, gate->ops,
+					    gate->flags, dev);
+
+		if (IS_ERR(clk)) {
+			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
+			continue;
+		}
+
+		clk_data->clks[gate->id] = clk;
+	}
+
+	return 0;
+}
+
+int mtk_clk_register_gates(struct device_node *node,
+			   const struct mtk_gate *clks, int num,
+			   struct clk_onecell_data *clk_data)
+{
+	return mtk_clk_register_gates_with_dev(node, clks, num, clk_data, NULL);
+}
+EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 3c3329ec54b7..432b571d23b3 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -43,6 +43,22 @@ struct clk *mtk_clk_register_gate(
 		unsigned long flags,
 		struct device *dev);
 
+struct mtk_gate_regs {
+	u32 sta_ofs;
+	u32 clr_ofs;
+	u32 set_ofs;
+};
+
+struct mtk_gate {
+	int id;
+	const char *name;
+	const char *parent_name;
+	const struct mtk_gate_regs *regs;
+	int shift;
+	const struct clk_ops *ops;
+	unsigned long flags;
+};
+
 #define GATE_MTK_FLAGS(_id, _name, _parent, _regs, _shift,	\
 			_ops, _flags) {				\
 		.id = _id,					\
@@ -57,4 +73,13 @@ struct clk *mtk_clk_register_gate(
 #define GATE_MTK(_id, _name, _parent, _regs, _shift, _ops)		\
 	GATE_MTK_FLAGS(_id, _name, _parent, _regs, _shift, _ops, 0)
 
+int mtk_clk_register_gates(struct device_node *node,
+			   const struct mtk_gate *clks, int num,
+			   struct clk_onecell_data *clk_data);
+
+int mtk_clk_register_gates_with_dev(struct device_node *node,
+				    const struct mtk_gate *clks, int num,
+				    struct clk_onecell_data *clk_data,
+				    struct device *dev);
+
 #endif /* __DRV_CLK_GATE_H */
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 519a461cbb6f..0c5db3c71fdd 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -106,57 +106,6 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
 
-int mtk_clk_register_gates_with_dev(struct device_node *node,
-		const struct mtk_gate *clks,
-		int num, struct clk_onecell_data *clk_data,
-		struct device *dev)
-{
-	int i;
-	struct clk *clk;
-	struct regmap *regmap;
-
-	if (!clk_data)
-		return -ENOMEM;
-
-	regmap = device_node_to_regmap(node);
-	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
-		return PTR_ERR(regmap);
-	}
-
-	for (i = 0; i < num; i++) {
-		const struct mtk_gate *gate = &clks[i];
-
-		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id]))
-			continue;
-
-		clk = mtk_clk_register_gate(gate->name, gate->parent_name,
-				regmap,
-				gate->regs->set_ofs,
-				gate->regs->clr_ofs,
-				gate->regs->sta_ofs,
-				gate->shift, gate->ops, gate->flags, dev);
-
-		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
-			continue;
-		}
-
-		clk_data->clks[gate->id] = clk;
-	}
-
-	return 0;
-}
-
-int mtk_clk_register_gates(struct device_node *node,
-		const struct mtk_gate *clks,
-		int num, struct clk_onecell_data *clk_data)
-{
-	return mtk_clk_register_gates_with_dev(node,
-		clks, num, clk_data, NULL);
-}
-EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
-
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 0ff289d93452..bdec7dc5e07a 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -150,31 +150,6 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
 		int num, void __iomem *base, spinlock_t *lock,
 		struct clk_onecell_data *clk_data);
 
-struct mtk_gate_regs {
-	u32 sta_ofs;
-	u32 clr_ofs;
-	u32 set_ofs;
-};
-
-struct mtk_gate {
-	int id;
-	const char *name;
-	const char *parent_name;
-	const struct mtk_gate_regs *regs;
-	int shift;
-	const struct clk_ops *ops;
-	unsigned long flags;
-};
-
-int mtk_clk_register_gates(struct device_node *node,
-			const struct mtk_gate *clks, int num,
-			struct clk_onecell_data *clk_data);
-
-int mtk_clk_register_gates_with_dev(struct device_node *node,
-		const struct mtk_gate *clks,
-		int num, struct clk_onecell_data *clk_data,
-		struct device *dev);
-
 struct mtk_clk_divider {
 	int id;
 	const char *name;
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
