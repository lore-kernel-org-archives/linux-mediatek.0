Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4ABC25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 09:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffBVl8c9008Y5FEu6Ji1WAJsWhs1//KwxybcfJJQxL4=; b=mHGml82WavwDqJLxfjOO4sKKf4
	Znz57kVNuR6PBf6zqdHl8zrTrquGBcVrMUhz0UVQRrsvnMrtAwb85kG3Wf+wavPHw18/vajTRzvyg
	MSBbq6yNk4h9JRQ+wCIvBxIHqxQ7PIfjQlnjLtX3yr6Rn5u0S5wBZtWcBHWbxBE/TIH+V059ICAKS
	NO89WsAxzWOt8UeefpHx9E8hb5nzqhRFix5+ck+VgtiyMn5/Usw3jfSw4TvOou9952VJWz1dPPCwD
	ml4WmQbCdJOBM4ojPmV7vJqq0firJN12HyEmJnoMISiRlJrXg+XsxmZlR19neA9uxIS/pNGDUzaYp
	XRgoVkBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInvQ-009Tsh-MY; Fri, 20 Jan 2023 09:43:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInaL-009JsQ-40; Fri, 20 Jan 2023 09:21:29 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 470976602EE6;
	Fri, 20 Jan 2023 09:21:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674206479;
	bh=Hzd4ZCV3hbu/y9AeR6NdpNg7TukN9MbTEJnGSGiCBhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f4DG2KuNiFzsYstHxJJXutDMOtjXjYREM4/d1pQZiHQvQmIZGNpbrjD6MUVGUMxo9
	 DWuzuZF7EvxDtUd/L7e+AdGZqVOf3CDyX+xlH8eJ+UXQLNnCiLZpYq+AUv65nXgEbE
	 ryWIM00sGKIZl3xI9Gz6+qt0dizIFNy7Ms4GXkcYlhxOuFyVHMN4W+WGU7p2iabYsY
	 FTkIma5GevA8NwHFSIlR1RpXBhkh/khFC0VzCQEAQViWw9YVdYUmb3aqe+HIeJjf0i
	 tZJ2pDLH3POo6Xbq7XBGobwrWoeU9X8wCdlR4gOHW6mOraAr+U5vXLs7aBHiDCax2N
	 51+rOlnYrGfVQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 12/23] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
Date: Fri, 20 Jan 2023 10:20:42 +0100
Message-Id: <20230120092053.182923-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_012121_511967_7F0A0A7B 
X-CRM114-Status: GOOD (  15.73  )
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

As a preparation to increase probe functions commonization across
various MediaTek SoC clock controller drivers, extend function
mtk_clk_simple_probe() to be able to register not only gates, but
also fixed clocks, factors, muxes and composites.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 101 ++++++++++++++++++++++++++++++---
 drivers/clk/mediatek/clk-mtk.h |  10 ++++
 2 files changed, 103 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index ca9aa24e769c..281d30d6cb2b 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -11,12 +11,14 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
+#include "clk-mux.h"
 
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
@@ -466,20 +468,71 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	const struct mtk_clk_desc *mcd;
 	struct clk_hw_onecell_data *clk_data;
 	struct device_node *node = pdev->dev.of_node;
-	int r;
+	void __iomem *base;
+	int num_clks, r;
 
 	mcd = of_device_get_match_data(&pdev->dev);
 	if (!mcd)
 		return -EINVAL;
 
-	clk_data = mtk_alloc_clk_data(mcd->num_clks);
+	/* Composite clocks needs us to pass iomem pointer */
+	if (mcd->composite_clks) {
+		if (!mcd->shared_io)
+			base = devm_platform_ioremap_resource(pdev, 0);
+		else
+			base = of_iomap(node, 0);
+
+		if (IS_ERR_OR_NULL(base))
+			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
+	}
+
+	/* Calculate how many clk_hw_onecell_data entries to allocate */
+	num_clks = mcd->num_clks + mcd->num_composite_clks;
+	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
+	num_clks += mcd->num_mux_clks;
+
+	clk_data = mtk_alloc_clk_data(num_clks);
 	if (!clk_data)
 		return -ENOMEM;
 
-	r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks, mcd->num_clks,
-				   clk_data);
-	if (r)
-		goto free_data;
+	if (mcd->fixed_clks) {
+		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
+						mcd->num_fixed_clks, clk_data);
+		if (r)
+			goto free_data;
+	}
+
+	if (mcd->factor_clks) {
+		r = mtk_clk_register_factors(mcd->factor_clks,
+					     mcd->num_factor_clks, clk_data);
+		if (r)
+			goto unregister_fixed_clks;
+	}
+
+	if (mcd->mux_clks) {
+		r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
+					   mcd->num_mux_clks, node,
+					   mcd->clk_lock, clk_data);
+		if (r)
+			goto unregister_factors;
+	};
+
+	if (mcd->composite_clks) {
+		/* We don't check composite_lock because it's optional */
+		r = mtk_clk_register_composites(&pdev->dev,
+						mcd->composite_clks,
+						mcd->num_composite_clks,
+						base, mcd->clk_lock, clk_data);
+		if (r)
+			goto unregister_muxes;
+	}
+
+	if (mcd->clks) {
+		r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
+					   mcd->num_clks, clk_data);
+		if (r)
+			goto unregister_composites;
+	}
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
@@ -497,9 +550,28 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	return r;
 
 unregister_clks:
-	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+	if (mcd->clks)
+		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+unregister_composites:
+	if (mcd->composite_clks)
+		mtk_clk_unregister_composites(mcd->composite_clks,
+					      mcd->num_composite_clks, clk_data);
+unregister_muxes:
+	if (mcd->mux_clks)
+		mtk_clk_unregister_muxes(mcd->mux_clks,
+					 mcd->num_mux_clks, clk_data);
+unregister_factors:
+	if (mcd->factor_clks)
+		mtk_clk_unregister_factors(mcd->factor_clks,
+					   mcd->num_factor_clks, clk_data);
+unregister_fixed_clks:
+	if (mcd->fixed_clks)
+		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
+					      mcd->num_fixed_clks, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
+	if (mcd->shared_io && base)
+		iounmap(base);
 	return r;
 }
 EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
@@ -511,7 +583,20 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+	if (mcd->clks)
+		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+	if (mcd->composite_clks)
+		mtk_clk_unregister_composites(mcd->composite_clks,
+					      mcd->num_composite_clks, clk_data);
+	if (mcd->mux_clks)
+		mtk_clk_unregister_muxes(mcd->mux_clks,
+					 mcd->num_mux_clks, clk_data);
+	if (mcd->factor_clks)
+		mtk_clk_unregister_factors(mcd->factor_clks,
+					   mcd->num_factor_clks, clk_data);
+	if (mcd->fixed_clks)
+		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
+					      mcd->num_fixed_clks, clk_data);
 	mtk_free_clk_data(clk_data);
 
 	return 0;
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index ed329d8d7349..1bdaa0acb909 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -220,7 +220,17 @@ void mtk_clk_unregister_ref2usb_tx(struct clk_hw *hw);
 struct mtk_clk_desc {
 	const struct mtk_gate *clks;
 	size_t num_clks;
+	const struct mtk_composite *composite_clks;
+	size_t num_composite_clks;
+	const struct mtk_fixed_clk *fixed_clks;
+	size_t num_fixed_clks;
+	const struct mtk_fixed_factor *factor_clks;
+	size_t num_factor_clks;
+	const struct mtk_mux *mux_clks;
+	size_t num_mux_clks;
 	const struct mtk_clk_rst_desc *rst_desc;
+	spinlock_t *clk_lock;
+	bool shared_io;
 };
 
 int mtk_clk_simple_probe(struct platform_device *pdev);
-- 
2.39.0


