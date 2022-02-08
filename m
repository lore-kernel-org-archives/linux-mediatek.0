Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DEFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0stj9F0dUKxJBFHo/kEx434P6PKk2EGuQtR57yWscog=; b=DpKlITGrJUBtXF
	Gj6xfFByxTecS1I04VKEtUcueMurC4vClSMfnT34oT0K2iba5Rw3aXuUUv/lLFKgP1VzdeFHPhBVb
	HqKLCeYHki9HYym2SOquN97b9KpiL9RBVYeD2WkeL4KOC2Y/L0MkfNZ7X2FMCImGpNNl+6g/tbP1f
	1JMkzg44xd9l2gZYZ5yqT7mF9j6WZTf3rDzLszy4e1JPTG95szYAIuuqFpWW3K+ZuwO+ZmGHHQck0
	C+NxjWdS/dbhuadnxAtUkd8xi3409EGTB7Q8qFC8i9BKHE0hgyCs4VSoeznCU6iguwLZ3quwIc9w7
	XQSivRYHtwH3GJy9VQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQBS-00Dy1m-7e; Tue, 08 Feb 2022 13:05:26 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPog-00Dnm0-M2
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:56 +0000
Received: by mail-pj1-x1034.google.com with SMTP id om7so2928011pjb.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=su8yB3PhAikF3CbTDZ6t9xjvJ0+tVV3Q7sMK1qov3u8=;
 b=dawlL8uPpwEhEdNzpFhriSJEc1UtRFiXuNLnUzi+5qbBM87ysJgWjelVSEpVjER5Jx
 joGv/TplaF0PTc6D/bNC1/u/UXy0U65BtryhYLyNRH9tBW5x3jFSaV3tmczcjqcWZiQL
 b+ndNi9SCeiJkOOce7Rr7EGiWg81mozts7FXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=su8yB3PhAikF3CbTDZ6t9xjvJ0+tVV3Q7sMK1qov3u8=;
 b=uFNU1m3gvkaa5Q0mgRxyGFjGfR6EN72oArkXjN0MHixFHzYFjZffLOzfERXhTGoHBv
 53eBxI3F7D01ZxmY3RG96V1NSVsMEQwUsZ4BjSddv4pEkG1c4A+FFME1WpgKFlV6oGn8
 FwrhHX9ByMmlwRQebOc3l08nAvVaH9xxfMNqxqa5oXFnb+Hxyg5Kl4tK2Ho+sZYDukGb
 6lW2wYzT5coJGapAF8uMKfqw3Tdl85sE9jn91YtPlK0n+eMqMLI/iaFTIy7OjBsZsPCj
 Y7V/wygG+LjOy4mcH22zkvfU1TKMam3/JtoimQgd/46OKDneqgwyClDPr27e7w6fMbKb
 gAwA==
X-Gm-Message-State: AOAM532tsoywk5j8Mr9BSTs22cNT9lGtfxQMlC6Fzq5AX+pMW5ZQtjWT
 Mg1cQ+THvv+TKcONuF9GhYwWbg==
X-Google-Smtp-Source: ABdhPJzfeIV9hW4JatNPV1xSEsdpC0w96N8R32l6fhq4Zd+WxyYTQiY+H/KMNwMzwxkzPNn53nCdVA==
X-Received: by 2002:a17:902:ecc9:: with SMTP id
 a9mr4084829plh.121.1644324113776; 
 Tue, 08 Feb 2022 04:41:53 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:53 -0800 (PST)
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
Subject: [PATCH v3 30/31] clk: mediatek: mt8195: Implement remove functions
Date: Tue,  8 Feb 2022 20:40:33 +0800
Message-Id: <20220208124034.414635-31-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044154_736361_A5DC3AB0 
X-CRM114-Status: GOOD (  15.16  )
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

Until now the mediatek clk driver library did not have any way to
unregister clks, and so none of the drivers implemented remove
functions.

Now that the library does have APIs to unregister clks, use them
to implement remove functions for the mt8195 clk drivers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 15 +++++++++++++++
 drivers/clk/mediatek/clk-mt8195-topckgen.c   | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-vdo0.c       | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-vdo1.c       | 16 ++++++++++++++++
 5 files changed, 83 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index d0fdb5a4a921..eecc7035a56a 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -132,6 +132,8 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
@@ -143,8 +145,22 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt8195_apmixed_drv = {
 	.probe = clk_mt8195_apmixed_probe,
+	.remove = clk_mt8195_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8195-apmixed",
 		.of_match_table = of_match_clk_mt8195_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index f489b57e325e..8cd88dfc3283 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -74,6 +74,8 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_plls:
@@ -83,6 +85,18 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_apusys_pll_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
 	{ .compatible = "mediatek,mt8195-apusys_pll", },
 	{}
@@ -90,6 +104,7 @@ static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
 
 static struct platform_driver clk_mt8195_apusys_pll_drv = {
 	.probe = clk_mt8195_apusys_pll_probe,
+	.remove = clk_mt8195_apusys_pll_remove,
 	.driver = {
 		.name = "clk-mt8195-apusys_pll",
 		.of_match_table = of_match_clk_mt8195_apusys_pll,
diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 3631f49a5e5a..b602fcd7f1d1 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1271,6 +1271,8 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, top_clk_data);
+
 	return r;
 
 unregister_gates:
@@ -1290,8 +1292,26 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_topck_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *top_clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
+	mtk_free_clk_data(top_clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt8195_topck_drv = {
 	.probe = clk_mt8195_topck_probe,
+	.remove = clk_mt8195_topck_remove,
 	.driver = {
 		.name = "clk-mt8195-topck",
 		.of_match_table = of_match_clk_mt8195_topck,
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
index af34eb564b1d..3bc7ed19d550 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -107,6 +107,8 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
@@ -116,8 +118,22 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_vdo0_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt8195_vdo0_drv = {
 	.probe = clk_mt8195_vdo0_probe,
+	.remove = clk_mt8195_vdo0_remove,
 	.driver = {
 		.name = "clk-mt8195-vdo0",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index 6b502bbc730c..90c738a85ff1 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -124,6 +124,8 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
@@ -133,8 +135,22 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_vdo1_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt8195_vdo1_drv = {
 	.probe = clk_mt8195_vdo1_probe,
+	.remove = clk_mt8195_vdo1_remove,
 	.driver = {
 		.name = "clk-mt8195-vdo1",
 	},
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
