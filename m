Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0737EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68Ozp6vhyxBb0avl0cPyqbNuXAQKxHWlRfC7NIDThlw=; b=pylzuGEkIbOOSX
	mTtdSEew32JFzCTsvFL1lRcXldhCJsib3oNPNE5lOwMwBDdxu+geQhfmgW92eNYOQhv+I3eo1vtY0
	unKPItQsN525KkUjpIhl7XFFnNZ7Pi93RgAQJUaTxIoQ9HM/F/nM1DmstMb29cCvgqjfST71r8JKP
	DFhxI4LhdT8pnlGQaafKpmXtAAhPG/Mc/6Zkkp/0f7g9yAy68UvunKdjVbH6g9gLEwHacJS89eybi
	QGmYB2EySjRK9IGc6CpPy8P0Th85ruAaGPnBxE0Vh6zVccN5bzsPdPvtIBx++LWJp73N0JmyuCft5
	m05n+irur2M5k0cB3YBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhZV-007dZM-Bn; Thu, 19 May 2022 14:56:13 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgXO-0078fb-0x; Thu, 19 May 2022 13:50:00 +0000
Received: by mail-qk1-x730.google.com with SMTP id t2so519847qkb.12;
 Thu, 19 May 2022 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8V7106cncXJIAE2fTOvUkVnCzPXvRlGPeVGDdYP0Urg=;
 b=lVLRYfEIntAhPN8pTkRP3yHVS1Wvy4CnFf5JBKdwx3l8qzeMcj+d5GMEZoq/mfPY2K
 iT6NYq7AqdLfqqyRvsv/RhbAy82WjPR4hEOq1KRfE/tLA4dt9BttZDxHNScHAlLK5w85
 NLKTVgcYe5y927C9PvzdIgHB8Wb/Z7iKBmOM9QJrL5tkxmmxu2Sb/5NZPeI3c8QwyI2Q
 JODxgHnr0MXK0CfPzsYpdimsRynXRA+Cb8W973e0NEiBKKKa1mxaXubbfhFLjEHNlIO1
 UEC8MSiAAW0HPY4mgQyh/DASn4onAb28nSx0/igmIwqoY883rP7+y0m5VeBuIKMc1S14
 JR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8V7106cncXJIAE2fTOvUkVnCzPXvRlGPeVGDdYP0Urg=;
 b=RJ1/zzzV2H2vKw/GhXFJmc6m9qWEvOTchBealqX1VGuwJIsTYvoE5XJELE7H+8YdwP
 hdNMTagWztLSwXbiWNfQt8bFzcRHXRV08aXQSsKTfQ/uhO3jS2z1766saFjfnc3tiGEG
 kmOks8iRD/+znQomVfKbrHViFw0ZPtr7dH30LNTO3epMypct3tfn4XT+H6WNT09JAb7n
 jk4NvhV1lUhQO5gvEDMcEuMtVFAYE7QJOTGPfm6p5hBe3rX0F9TJVSNPeskMgAUmBtVy
 bTg7L9OYuRlmwx8spYsIjmTv3NwfKe2cYbjaxPtCT8m7T6+a0TClBUH+L3zKLlj0yj3g
 wROw==
X-Gm-Message-State: AOAM530BLuIjj+N7zhWSlH9hy+vaAy5VjD40dRpd0do8vv4yBXEYJ99h
 HdPqHbmKbPlQBd5UPpfz0DA=
X-Google-Smtp-Source: ABdhPJyER/K8IeEG7nTHno0GPuvLt9c2Lxx+kEjuTcz5s714bprXvG/OVwM8fVTvtf4ybt2dnibycA==
X-Received: by 2002:a05:620a:258e:b0:680:f33c:dbcd with SMTP id
 x14-20020a05620a258e00b00680f33cdbcdmr3197345qko.542.1652968194312; 
 Thu, 19 May 2022 06:49:54 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a3754c3000000b0069fc13ce23dsm1315024qkb.110.2022.05.19.06.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:49:54 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 5/6] clk: mediatek: Unregister reset controller on simple
 remove
Date: Thu, 19 May 2022 17:47:27 +0400
Message-Id: <20220519134728.456643-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519134728.456643-1-y.oudjana@protonmail.com>
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_064958_126788_274D8A4A 
X-CRM114-Status: GOOD (  17.45  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Store clk_data and rst_data pointers in a new wrapper struct,
set it as platform driver data, then use it in mtk_clk_simple_remove
to unregister the reset controller.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Dependencies:
- clk: mediatek: Move to struct clk_hw provider APIs (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/ 
- Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
- Export required symbols to compile clk drivers as module (single patch)
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

 drivers/clk/mediatek/clk-mtk.c | 47 +++++++++++++++++++++-------------
 drivers/clk/mediatek/clk-mtk.h |  5 ++++
 2 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 1b5591733e2b..3382802663f4 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -422,35 +422,41 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
 	const struct mtk_clk_desc *mcd;
-	struct clk_hw_onecell_data *clk_data;
+	struct mtk_simple_clk_controller *clk_ctrl;
 	struct device_node *node = pdev->dev.of_node;
-	struct mtk_clk_rst_data *rst_data;
 	int r;
 
 	mcd = of_device_get_match_data(&pdev->dev);
 	if (!mcd)
 		return -EINVAL;
 
-	clk_data = mtk_alloc_clk_data(mcd->num_clks);
-	if (!clk_data)
+	clk_ctrl = kzalloc(sizeof(*clk_ctrl), GFP_KERNEL);
+	if (!clk_ctrl)
 		return -ENOMEM;
 
+	clk_ctrl->clk_data = mtk_alloc_clk_data(mcd->num_clks);
+	if (!clk_ctrl->clk_data) {
+		r = -ENOMEM;
+		goto free_clk_ctrl;
+	}
+
 	r = mtk_clk_register_gates_with_dev(node, mcd->clks, mcd->num_clks,
-					    clk_data, &pdev->dev);
+					    clk_ctrl->clk_data, &pdev->dev);
 	if (r)
-		goto free_data;
+		goto free_clk_data;
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_ctrl->clk_data);
 	if (r)
 		goto unregister_clks;
 
-	platform_set_drvdata(pdev, clk_data);
+	platform_set_drvdata(pdev, clk_ctrl);
 
 	if (mcd->rst_desc) {
-		rst_data = mtk_register_reset_controller_with_dev(&pdev->dev,
-							   	  mcd->rst_desc);
-		if (IS_ERR(rst_data)) {
-			r = PTR_ERR(rst_data);
+		clk_ctrl->rst_data =
+			mtk_register_reset_controller_with_dev(&pdev->dev,
+							       mcd->rst_desc);
+		if (IS_ERR(clk_ctrl->rst_data)) {
+			r = PTR_ERR(clk_ctrl->rst_data);
 			goto unregister_clks;
 		}
 	}
@@ -458,9 +464,11 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	return r;
 
 unregister_clks:
-	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
-free_data:
-	mtk_free_clk_data(clk_data);
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_ctrl->clk_data);
+free_clk_data:
+	mtk_free_clk_data(clk_ctrl->clk_data);
+free_clk_ctrl:
+	kfree(clk_ctrl);
 	return r;
 }
 EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
@@ -468,12 +476,15 @@ EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 int mtk_clk_simple_remove(struct platform_device *pdev)
 {
 	const struct mtk_clk_desc *mcd = of_device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct mtk_simple_clk_controller *clk_ctrl = platform_get_drvdata(pdev);
 	struct device_node *node = pdev->dev.of_node;
 
 	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
-	mtk_free_clk_data(clk_data);
+	if (clk_ctrl->rst_data)
+		mtk_unregister_reset_controller(clk_ctrl->rst_data);
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_ctrl->clk_data);
+	mtk_free_clk_data(clk_ctrl->clk_data);
+	kfree(clk_ctrl);
 
 	return 0;
 }
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 1b95c484d5aa..fa092bca97c8 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -189,6 +189,11 @@ void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data);
 struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
 
+struct mtk_simple_clk_controller {
+	struct clk_hw_onecell_data *clk_data;
+	struct mtk_clk_rst_data *rst_data;
+};
+
 struct mtk_clk_desc {
 	const struct mtk_gate *clks;
 	size_t num_clks;
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
