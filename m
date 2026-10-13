Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7176CC6B16
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpB1pSYzU/DFyffmKgLpdYkjUU97msISlGmPAchVX0s=; b=2sb/GW1JgFCGOfk8x5UyVpxlAr
	Jg2Aa7EkGTqGsy3bs7EKtAZAZX6LHaPq1QnM4ae7v0jjSk+83oYBYpShotVPhTaYbqKmg4jZ7CwAm
	zwgOMDywIxMDqrgxHVNTMonFP/2OcGTESS2V9aBKpCgCOPMsOoyN9251Xp8OnMh3kuq7EEM8zbXTn
	n/TK7BKvRoEGCcPkwE0CUacRU1EGZsEgirGC/RFrpeUJIlk3IsLCaIdeODHjAKhCa3OyVF5lwgXn3
	w/x516QaiVMxyN6CEaQk0UIOK06u54Gk0fCfEvFY9PSsNFfSkPyxRqkENEoYZLDp9fdixaWUYNluv
	EQZTz+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIT-0000000DHgh-1Ttj;
	Tue, 13 Oct 2026 15:20:09 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIH-0000000DHS1-3vvy
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:06 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so2546747a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904797; x=1792509597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpB1pSYzU/DFyffmKgLpdYkjUU97msISlGmPAchVX0s=;
        b=aU9vs8P0nR6XT7NL//XOj5sjvaSYsEhxiYu66PtYSsU32MEtL92HlkLyXFFlHieeAJ
         iLmb1lYF47MTYZMvl1geKdLExFvh8B5U+atP2Xia04gmaiyG7o7JpMNar92POL0lz+p/
         caMEou8cvwoZxu3cnVR9wPCrglvVq8sis0YTCHs09HhqXICiztO7ITz8f8NJIUuT/Ft6
         uz/NxBDw3cBnpskDqQtcMIKHWk7vGsTjM+GgaZqDAOrw7oHEPdWaOvmgwn72x4041JtH
         FvwRwYZ4b3BjdJ8DEDc3AnJ9HhFi25DACZR116U92GsKuyOVkGdKt/eNOIwsvypZzc4S
         SQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904797; x=1792509597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpB1pSYzU/DFyffmKgLpdYkjUU97msISlGmPAchVX0s=;
        b=qp9Y1GAtxTuHvQzyQWbxLd3+QpvV1BSRzv7rI6um8vw7Ogefn+/BMbKVog61Dhx4T6
         xwlotsiDG+nAj+FayEE7/60y1XHJWrpjWKl5sAB+GdnT5NdC0snSEASiYg3AW8koHvRO
         qmPY3jICVAX7lkRrvdwsZnYb2ZmpTmOadRBc5hPdIXpvQf905IRyyvE3cvizYFaU/y6L
         5ptA8UARcRcl9uErqzopMMt7tHVueO4lyc8wrPHDsGQiVFnqf18yVVzAiV1BC0NwtqBf
         01PyCelYBXSVrfDcu8ZW5Rqx/A7YsjThCpfikAOpp//d5HH+269IaZv0iTyIh/iJzzQj
         id+w==
X-Forwarded-Encrypted: i=1; AKwUvBzodV6xxI80oW8DSQyKDrLnUx4VCD8t7kA8fWG/6t+wv3ZKQkz1iOLDFVscNSv9eIyJy6GYTc+SaOuk+ERZLw==@lists.infradead.org
X-Gm-Message-State: AFq9FYL42rVU5zYohFsHd3H9Qo5hgpCW/TCjRlSM64yZDuBJQpGfhynW
	IwWzLA/KIIA0CXCfik9fRtcjqQkRSXAy8XefCJEbh5Zc56onC5fNvWFi
X-Gm-Gg: AYBFou1Y9gJJH7gowhmu4MXVeae8W7Uw5VQTp1xXZMIzGa7VfGjJs1Dtm2MA9pB97Kt
	uPLber90qVB0HcXSdq/NiTIEzoRnNHi2XoHc2Tz7fwrdVoVPX1EIxoBuLJ4YFO6a0UUsdwxtkOf
	mmtJ//szdkfY89nFidv8surOoYT9VLZMIbYWhYNBtYlIdIHaOJMpKdUpg2EfpLpZaXPrglPYmct
	IjO81HQpyytO32VjC0t2GTWve4LM+Z2EplW5tJvuZNwWuotRwoG9KQ8SvJaez4aefQC//dH1T/7
	VkX9X/WxTuTBx1BVG6zJEI6nR0Az4zaCMPs50a5SQoS0FGrLVqhkYUg9oi24s8Q8Ot28m4EbEmu
	CqUodZ0sHTAwHpKplzHTA6YJNz5Vtfozx+TPYmjETlzVfKmk2D9+MYFkTUKg8KAy24xNV67rhDl
	hgYJKxgOhjZeKRkC5hFR2k6eQJeKS+BUbu0JpLlQ9+8HCgB7Awf+HqUcdMHk8YmotF3ocf6sOpV
	Vm1lnIWmJnN4eQAaZmBEYSUqrJz
X-Received: by 2002:a17:90b:3b84:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3ab3a736596mr9866608a91.20.1791904796990;
        Tue, 13 Oct 2026 08:19:56 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:56 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 20/35] clk: mediatek: mt6795: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:19 +0900
Message-ID: <20261013151734.3177690-21-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081958_064562_275A726E 
X-CRM114-Status: GOOD (  17.56  )
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

The MT6795 infracfg driver previously needed custom probe/remove
callbacks to register CPU muxes, which were not supported by the
common helpers. With CPU mux support now available, infracfg can
use mtk_clk_simple_probe() and mtk_clk_simple_remove().

The pericfg driver can also use the common helpers, which already
support its gate and composite clocks.

Keep the apmixedsys driver unchanged because it requires ref2usb_tx
clock handling, which is not yet supported by the common helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt6795-infracfg.c | 72 ++++-----------------
 drivers/clk/mediatek/clk-mt6795-pericfg.c  | 73 ++++------------------
 2 files changed, 23 insertions(+), 122 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index 914bb069aa85..6aefc577ece5 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -8,7 +8,6 @@
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -77,76 +76,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
 };
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_gates,
+	.num_clks = ARRAY_SIZE(infra_gates),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt6795_infracfg[] = {
-	{ .compatible = "mediatek,mt6795-infracfg" },
+	{ .compatible = "mediatek,mt6795-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_infracfg);
 
-static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
-				     ARRAY_SIZE(infra_gates), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-					ARRAY_SIZE(cpu_muxes), clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_cpumuxes;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt6795_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt6795_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt6795-infracfg",
 		.of_match_table = of_match_clk_mt6795_infracfg,
 	},
-	.probe = clk_mt6795_infracfg_probe,
-	.remove = clk_mt6795_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_infracfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index 27d0ef7d7b2f..53c79e830b6a 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -85,77 +85,28 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_idx_map_nr = ARRAY_SIZE(peri_idx_map),
 };
 
+static const struct mtk_clk_desc pericfg_desc = {
+	.clks = peri_gates,
+	.num_clks = ARRAY_SIZE(peri_gates),
+	.composite_clks = peri_clks,
+	.num_composite_clks = ARRAY_SIZE(peri_clks),
+	.rst_desc = &clk_rst_desc,
+	.clk_lock = &mt6795_peri_clk_lock,
+};
+
 static const struct of_device_id of_match_clk_mt6795_pericfg[] = {
-	{ .compatible = "mediatek,mt6795-pericfg" },
+	{ .compatible = "mediatek,mt6795-pericfg", .data = &pericfg_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_pericfg);
 
-static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, peri_gates,
-				     ARRAY_SIZE(peri_gates), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_composites(&pdev->dev, peri_clks,
-					  ARRAY_SIZE(peri_clks), base,
-					  &mt6795_peri_clk_lock, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_composites;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_composites:
-	mtk_clk_unregister_composites(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(peri_gates, ARRAY_SIZE(peri_gates), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt6795_pericfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
-	mtk_clk_unregister_gates(peri_gates, ARRAY_SIZE(peri_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt6795_pericfg_drv = {
 	.driver = {
 		.name = "clk-mt6795-pericfg",
 		.of_match_table = of_match_clk_mt6795_pericfg,
 	},
-	.probe = clk_mt6795_pericfg_probe,
-	.remove = clk_mt6795_pericfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_pericfg_drv);
 
-- 
2.56.0


