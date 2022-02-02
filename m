Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B5EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwiWLQfEXrd5Bu6Gu6fCeZdjdWrQUrBi3e8Jei10yLI=; b=BD+naIDn6Tmkjj
	UzIThXdeRp1kO3v2fJ0a7YqgHaQN18BGl/Eil6PwFknVgYGAQXIkdyB3RAIJbjPxZkbb6X8VMGyjS
	L6hsDaXUCJqwXIwFHS1cd/K/uRbE0kqhar8iBRYr5qI0OnIW9OsNMr7H379YRssHjsXeiKAtuc8Xn
	uhHZguD2IdRd1uKi+zS5M0040ENh/nAuTZCwZ3XYIBLv9InUK9E5fzt0WJsiLWqUQZrRDN6vflT5l
	dLJHZAyBRdQqdLa/Tn9gU/EZ0v0HZzzxpuHKp0gBKJbVx2oQ8UfYkIkQIoTHBVF6yiufDDs1EG1gQ
	H7tGbgR7fGsuRmFGyOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGOw-00Fb4E-7G; Wed, 02 Feb 2022 14:14:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1t-00FPXj-6t
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:39 +0000
Received: by mail-pf1-x435.google.com with SMTP id a19so12874924pfx.4
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TkaavcwwSXTQYMjq565kI3sdhI7vHLgYjSyu32Ij/SU=;
 b=K6e5WAOoxDzAZqzS5QW9srT4xlvXXSy1liamjvDMGpDzU5SsClz/NgwM/EbE5xEeWe
 cHo25PYHAH3uYLhHf+0Eqy0/RF2yYUdBl3xNrzGf4ENi0QYlf2NVHUq+lAuQy0lEe93p
 bJY3ZPK2e+7dvKjyq91nH52155kRLQI0DKANI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkaavcwwSXTQYMjq565kI3sdhI7vHLgYjSyu32Ij/SU=;
 b=xz98yWH6o5b1KQQMoF8eOWMeEb3nJnJfUujygf9BxwBS9dpz6blunIZc/Pcn4ecQpw
 PZ7ky1cn4diRc/Lf65AZXyxPkUzQQ3kTlgPYIhhwNOY5TRANhyelAEploAUgKF+2ROxj
 m74TzXJLlWaty9Lg09a+RfB7cCP2Z+UCyhGeyzWSayOkhkBIDVVJkK+oDpw5vA6mkqPJ
 Lr8ACNIdmXbYeE7+cCfOmflN/jQ+Gdc7+H0DOia4iyLga0BEImS/FN/pEq6pLcLeTqwz
 Mq+1AqSg1CFqdVPqZoTW8ZahCdb+wBnPVdhlehguSbFg3rHIw56vbntixaTXueAyiBMq
 jX/g==
X-Gm-Message-State: AOAM531CI78hT6b/AZUd5e2kpXmxTzOjTRJuG2alOP8QyLW2KRojc6VP
 mRZ50EJkU1idfqV0SMyBxUFquw==
X-Google-Smtp-Source: ABdhPJwGbOa1EL0uMe/CmGhPSvMaCjBAcmSaT/Chf4TJ5lvBozpl+Bpyy18AGf2k7ZUaZr60LVmGEg==
X-Received: by 2002:a05:6a00:158e:: with SMTP id
 u14mr21751032pfk.38.1643809836688; 
 Wed, 02 Feb 2022 05:50:36 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:36 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 29/31] clk: mediatek: mt8195: Implement error handling in
 probe functions
Date: Wed,  2 Feb 2022 21:48:32 +0800
Message-Id: <20220202134834.690675-30-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055037_311764_D1B1CB3C 
X-CRM114-Status: GOOD (  14.05  )
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
unregister clks, and so all drivers did not do proper cleanup in
their error paths.

Now that the library does have APIs to unregister clks, use them
in the error path of the probe functions for the mt8195 clk drivers
to do proper cleanup.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 13 ++++--
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 11 ++++-
 drivers/clk/mediatek/clk-mt8195-topckgen.c   | 49 +++++++++++++++-----
 drivers/clk/mediatek/clk-mt8195-vdo0.c       |  4 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c       |  4 +-
 5 files changed, 63 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index 5b1b7dc447eb..af8d80f25f30 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -120,17 +120,24 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
-	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 	if (r)
 		goto free_apmixed_data;
 
+	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	if (r)
+		goto unregister_plls;
+
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_apmixed_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+unregister_plls:
+	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 free_apmixed_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index db449ff877d7..1fff6f3d2dc7 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -66,13 +66,20 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
 	if (r)
 		goto free_apusys_pll_data;
 
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto unregister_plls;
+
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
+unregister_plls:
+	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
 free_apusys_pll_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 3e2aba9c40bb..3631f49a5e5a 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1239,25 +1239,52 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 		goto free_top_data;
 	}
 
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    top_clk_data);
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
-			       &mt8195_clk_lock, top_clk_data);
-	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
-				    &mt8195_clk_lock, top_clk_data);
-	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
-				    &mt8195_clk_lock, top_clk_data);
-	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
+					top_clk_data);
 	if (r)
 		goto free_top_data;
 
+	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	if (r)
+		goto unregister_fixed_clks;
+
+	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
+				   &mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_factors;
+
+	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
+					&mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_muxes;
+
+	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
+					&mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_composite_muxes;
+
+	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	if (r)
+		goto unregister_composite_divs;
+
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
 	if (r)
-		goto free_top_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+unregister_composite_divs:
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+unregister_composite_muxes:
+	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
+unregister_muxes:
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+unregister_factors:
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+unregister_fixed_clks:
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
 free_top_data:
 	mtk_free_clk_data(top_clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
index f7ff7618c714..af34eb564b1d 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -105,10 +105,12 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_vdo0_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
 free_vdo0_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index 03df8eae8838..6b502bbc730c 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -122,10 +122,12 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_vdo1_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
 free_vdo1_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
