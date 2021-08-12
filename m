Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEE2C4320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:46:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A2860FBF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60A2860FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnJmU3uTj0HmsXGczwufEX5arpw0N2UWjBMjusDPCZI=; b=sgB8ud9u6jNO8+
	35zFvRsV/RHUMqLpZgUt+IeL68vxTe5V3SFf8j9pPmjJNrVUWIvP0RjBlObRenjdJXIZifJU/aoBD
	vjkv2CpgVaxkt9qcyijdmNn7tW2cN3YxzAhmf+sx3IPAOfbnZQNOdhS2TkGlhGrUgrPkVmvF18fih
	JnmGwLOetr+0cwralGZpJ7Qhz8Tqwsy3+kK68FXMxU/v1cYpcfiaUyPdq4ikEz5qfe+lxAdEGCWMx
	MxCvdaXvOFgE2hal5AJV48g8t+Lj8UONinDskmxO34xBUntkRQBElYl9sA30naZfI+dzJOps5T1yv
	20DtF6QH2KJ1+86545LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE7Hx-009VbQ-Pl; Thu, 12 Aug 2021 09:46:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE7HI-009VIU-BI; Thu, 12 Aug 2021 09:45:36 +0000
X-UUID: 3916ab4d84ca404684c14b8c404e089a-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bfQpL1WW/DOfTceGsgwIWlS6SzlueuJECjiwvlcZInw=; 
 b=YvshEwsgeaxoZgUowwpeAdntSq4Fbur0b0V+yQOJgGpBfuXItalvBho3/12RmhlV5OgooFnGgn6sLElSDaoVZsgHqPsv6Tu+aOqEMBJRqUPAoDCjTN9cUToF8FK359vqbg85UQzAoAjgdSydQJcsJXcheSvGYsRn/85NfIHI4BI=;
X-UUID: 3916ab4d84ca404684c14b8c404e089a-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2138821235; Thu, 12 Aug 2021 02:45:24 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 02:35:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 17:35:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 Aug 2021 17:35:22 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <inux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>
Subject: [PATCH 2/4] clk: mediatek: support COMMON_CLK_MEDIATEK module build
Date: Thu, 12 Aug 2021 17:35:17 +0800
Message-ID: <20210812093519.3550-3-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210812093519.3550-1-miles.chen@mediatek.com>
References: <20210812093519.3550-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_024532_421796_A7DB5662 
X-CRM114-Status: GOOD (  13.01  )
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

To support COMMON_CLK_MEDIATEK module build,
add MODULE_LICENSE and export necessary symbols.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-apmixed.c | 3 +++
 drivers/clk/mediatek/clk-cpumux.c  | 3 +++
 drivers/clk/mediatek/clk-gate.c    | 8 ++++++++
 drivers/clk/mediatek/clk-mtk.c     | 8 ++++++++
 drivers/clk/mediatek/clk-mux.c     | 4 ++++
 drivers/clk/mediatek/clk-pll.c     | 4 ++++
 drivers/clk/mediatek/reset.c       | 2 ++
 7 files changed, 32 insertions(+)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index 258d128370f2..caa9119413f1 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
 
@@ -97,3 +98,5 @@ struct clk * __init mtk_clk_register_ref2usb_tx(const char *name,
 
 	return clk;
 }
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 79fe09028742..f85c755c9fc1 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
@@ -106,3 +107,5 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 
 	return 0;
 }
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index a35cf0b22150..b02d2f74dd0d 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/clkdev.h>
+#include <linux/module.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -122,24 +123,28 @@ const struct clk_ops mtk_clk_gate_ops_setclr = {
 	.enable		= mtk_cg_enable,
 	.disable	= mtk_cg_disable,
 };
+EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr);
 
 const struct clk_ops mtk_clk_gate_ops_setclr_inv = {
 	.is_enabled	= mtk_cg_bit_is_set,
 	.enable		= mtk_cg_enable_inv,
 	.disable	= mtk_cg_disable_inv,
 };
+EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_inv);
 
 const struct clk_ops mtk_clk_gate_ops_no_setclr = {
 	.is_enabled	= mtk_cg_bit_is_cleared,
 	.enable		= mtk_cg_enable_no_setclr,
 	.disable	= mtk_cg_disable_no_setclr,
 };
+EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr);
 
 const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
 	.is_enabled	= mtk_cg_bit_is_set,
 	.enable		= mtk_cg_enable_inv_no_setclr,
 	.disable	= mtk_cg_disable_inv_no_setclr,
 };
+EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
 
 struct clk *mtk_clk_register_gate(
 		const char *name,
@@ -181,3 +186,6 @@ struct clk *mtk_clk_register_gate(
 
 	return clk;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_gate);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index cec1c8a27211..cb2dabe60aaf 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/clkdev.h>
+#include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/device.h>
 
@@ -41,6 +42,7 @@ struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(mtk_alloc_clk_data);
 
 void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 		int num, struct clk_onecell_data *clk_data)
@@ -67,6 +69,7 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 			clk_data->clks[rc->id] = clk;
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
 
 void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 		int num, struct clk_onecell_data *clk_data)
@@ -93,6 +96,7 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 			clk_data->clks[ff->id] = clk;
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
 
 int mtk_clk_register_gates_with_dev(struct device_node *node,
 		const struct mtk_gate *clks,
@@ -145,6 +149,7 @@ int mtk_clk_register_gates(struct device_node *node,
 	return mtk_clk_register_gates_with_dev(node,
 		clks, num, clk_data, NULL);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
 
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
@@ -258,6 +263,7 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
 			clk_data->clks[mc->id] = clk;
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_composites);
 
 void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 			int num, void __iomem *base, spinlock_t *lock,
@@ -286,3 +292,5 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 			clk_data->clks[mcd->id] = clk;
 	}
 }
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index b0c61709bacc..a507eea26cc7 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -8,6 +8,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 
 #include "clk-mtk.h"
 #include "clk-mux.h"
@@ -190,3 +191,6 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index f440f2cd0b69..399e7b4297c8 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -7,6 +7,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/clkdev.h>
 #include <linux/delay.h>
@@ -368,3 +369,6 @@ void mtk_clk_register_plls(struct device_node *node,
 		clk_data->clks[pll->id] = clk;
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index cb939c071b0c..9079bfc29ec0 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -137,3 +137,5 @@ void mtk_register_reset_controller_set_clr(struct device_node *np,
 	mtk_register_reset_controller_common(np, num_regs, regofs,
 		&mtk_reset_ops_set_clr);
 }
+
+MODULE_LICENSE("GPL");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
