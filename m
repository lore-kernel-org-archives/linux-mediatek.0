Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C20DC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=me5oQW74btLSHz2qWK3ld744bjBfGIQ1WhAaHQfci/k=; b=LlpG/jyUPS8hhX
	H0jVsCYBsQfFqKYw00iPi3gDjbgtxKxpXOPKJK987MMUsJme4OuVTc7/fh0jww1cfvJMbcHXE6nho
	/c6CNmnXeaU1puFfPnjbdyQWh3jtGJPcZd5mhHchAVQ4DPlwVUaEmkBhIFKV253LHiT4GUz/laH+H
	46rxGGe4Y6wDw+jE2HuFeVwPtsURUFUq3248w4VEymuuoZFZIz/Uw+Lw2Edz741UD3tl1bJa0Lr4o
	+x55Ms9BnCjqHBAw+WO4CbpeuFNIY/fdvrxzkq5ObDw/NxPkbMFz6IQvG8uYFl7Vslf55l4633are
	ejarVRNNLJlJwSvdxb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG1t-00FPYi-GQ; Wed, 02 Feb 2022 13:50:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG11-00FOt2-BH
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id h14so18312542plf.1
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X1oq+g3gVExEjeGdLYmngTgVL65VIrxCvqUJ/+BHwmE=;
 b=KCRz8XVjXX7vecmmRDBxedtGoijXz9TKG/d5rsC2rSpg49m8IDaJTYwj6tNINwiJc4
 cf6wYYj7zZkQzPNmpbLePfd+xtlKFdsGUYQ6HnmIzphxnsU2IsvvXssDdSF2wD33M8Fr
 02XV01bw4fMu1jhtMJzXxsQ3v3JGSYPfCYifw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X1oq+g3gVExEjeGdLYmngTgVL65VIrxCvqUJ/+BHwmE=;
 b=PARy3nQUtPm75IsQoN9qId47g/yhpa99+N/XCrRCQ9SqJmS+aOr2+SUDjiIzwZ3zM0
 u8VS2fcPy7e4EsVOSYuq677+kA//BBs7I0vdxZOwkIRo8jbNIeSu1Xd/4yRY48PY1kXc
 5zT0DRiJrb1/V6SnJwruMI+mwOVjSw39N77AjXQBa1Vyp7YE4EXzDJHzc6K8Ju62IvUb
 lUk72PkErkeUzCIXo0k0Bhzbo4Q5rGoKAHoPJiLGPfyrfblez7p0qtTqpyvMqoS5BFWs
 Pm5U5Ea/CS8hSee8zSfFk6/TMY+9Ba+78YklyZkXBKy5l15VUcLyMJ6HiTqSc4WXBRpo
 qKRQ==
X-Gm-Message-State: AOAM532ICZDtZquIJkUG/ZNxV+ODDoUoeII2XhS8W0SL0eMGBTpr6eGN
 zRkt6ZqVyqRIm4jUi+0NpsAylQ==
X-Google-Smtp-Source: ABdhPJwUP4oFnhoAAEegJwmf5AZyAl8asv85imOoFVDn2fHx/GxBYDFVhY5z2Nhp76MfsHNMogifhQ==
X-Received: by 2002:a17:902:b212:: with SMTP id
 t18mr15548529plr.80.1643809782491; 
 Wed, 02 Feb 2022 05:49:42 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:42 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/31] clk: mediatek: gate: Consolidate gate type clk
 related code
Date: Wed,  2 Feb 2022 21:48:05 +0800
Message-Id: <20220202134834.690675-3-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054943_420643_9F9AF7B2 
X-CRM114-Status: GOOD (  19.59  )
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
