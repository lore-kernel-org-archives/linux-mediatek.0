Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8059EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LA87flmi3CcuKJYZzEDa9IflHH2Ruwl48dW+Ox+CgyI=; b=2LsGmFJksZOFqH
	cqgw5To54U3UHFeApSZmVKLcsEpBL36yV+wNoHWbpA5X7Dz+ps7GgBP6noOw6PovfigaMH0tinBN1
	A1dmNcO3jG3LdpDYlZNkvYNKCbmbdXM2iLXagHFOuF4IzlpvqLfV8Ix++Gd//X+Xs2jSDwTcE7DxC
	OCdDKfN73uMWMJZz4jQg5cfuVgcKHO3Cba8IsU59OsipCAsTKACbNycnsKrDqIDkTDzTNowhxzmcG
	iIKCqS4lEJPl9dFSPHhBbKoV8GEFEjXcy2gY0K3Qpnh86YrtG5aSZFpfwzV0CNbiqEYKrDQcSsiLi
	acQ39qXyXCQI7XZM5ocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPoG-00DnY4-GT; Tue, 08 Feb 2022 12:41:28 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPng-00DnGJ-JT
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:40:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so2596259pjh.3
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AG7JP3PmNd1EdvNHfZQCnHdtS8h0RT7R6zED7dijliQ=;
 b=GkXiVgi6P5XFN318B4BLQ2z310OMACd/EFqC0tE2le1ZztIwJf+SnhUObQ+MJ6zT7V
 OLbpf4T0ja8OkynRbZKfQaCGIDjxoJBrMhsMzolUyb3NOaW04IwjA6WtrnoUWyM4wiKR
 v0xJbLOT7/3dz/zdmYDLa22LLdOh01xQgk+T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AG7JP3PmNd1EdvNHfZQCnHdtS8h0RT7R6zED7dijliQ=;
 b=f6H/IEBin2Rt4igWh5azwBkuRkVYJ7r/k81jC2Hp4p4jjLO5khYyngS05IILRL5tmA
 TTKHDqPXZBqeWdcIPpNJM+8bf28v2Zk4dsb+SgUzAQPnjbWc27FpyewfIeO6RR6Y+ooj
 1PXYHfhlkW5EXaIIYjwcyn0Do874qwBRxfTLRbgP9b/dG+H0es6olfvTB35lqgYWJf3X
 IdSmU8xFNJWYg6B0gca9fUMuwiZvaDL1+8p60Alafv05JM/SXtO2FUO86W5viPfPa5LG
 tbtq5u8SB0fEQ7uB41KuW7NnWdTZX4g3s5dbMKtYjrDszQnhaZ48brNYqM3Xl+iNItv1
 kHFQ==
X-Gm-Message-State: AOAM533AmcHAC6WSwjZuj/LHLsAzpAaBf8Wh6v8tuAUzIxnnGy8YpQXj
 cLOJUtGTp9G5xl0oLt0wowk5GMI8wyoX6w==
X-Google-Smtp-Source: ABdhPJwuFITGMv7hSWZiicKfreHbP0qxbpac0MmUj3+5Sa/OT+2vcrS0hRAdQj2Rs2AtUEpwXQ9cxw==
X-Received: by 2002:a17:902:ce8b:: with SMTP id
 f11mr4348415plg.40.1644324051390; 
 Tue, 08 Feb 2022 04:40:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:40:51 -0800 (PST)
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
Subject: [PATCH v3 01/31] clk: mediatek: Use %pe to print errors
Date: Tue,  8 Feb 2022 20:40:04 +0800
Message-Id: <20220208124034.414635-2-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044052_676554_5878798E 
X-CRM114-Status: GOOD (  13.56  )
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

If %pe is used to print errors, a string representation of the error
would be printed instead of a number as with %ld. Also, all the sites
printing errors are deriving the error code from a pointer. Using %pe
is more straightforward.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-apmixed.c |  2 +-
 drivers/clk/mediatek/clk-cpumux.c  |  6 ++----
 drivers/clk/mediatek/clk-mtk.c     | 18 ++++++------------
 drivers/clk/mediatek/clk-mux.c     |  6 ++----
 drivers/clk/mediatek/clk-pll.c     |  3 +--
 drivers/clk/mediatek/reset.c       |  3 +--
 6 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index caa9119413f1..a29339cc26c4 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -92,7 +92,7 @@ struct clk * __init mtk_clk_register_ref2usb_tx(const char *name,
 	clk = clk_register(NULL, &tx->hw);
 
 	if (IS_ERR(clk)) {
-		pr_err("Failed to register clk %s: %ld\n", name, PTR_ERR(clk));
+		pr_err("Failed to register clk %s: %pe\n", name, clk);
 		kfree(tx);
 	}
 
diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index e188018bc906..cab5095416b6 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -87,8 +87,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 
 	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %ld\n", node,
-		       PTR_ERR(regmap));
+		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
 		return PTR_ERR(regmap);
 	}
 
@@ -97,8 +96,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 
 		clk = mtk_clk_register_cpumux(mux, regmap);
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       mux->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
 			continue;
 		}
 
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8d5791b3f460..519a461cbb6f 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -70,8 +70,7 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 					      rc->rate);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					rc->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", rc->name, clk);
 			continue;
 		}
 
@@ -97,8 +96,7 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 				CLK_SET_RATE_PARENT, ff->mult, ff->div);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					ff->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", ff->name, clk);
 			continue;
 		}
 
@@ -122,8 +120,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %ld\n", node,
-				PTR_ERR(regmap));
+		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
 		return PTR_ERR(regmap);
 	}
 
@@ -141,8 +138,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 				gate->shift, gate->ops, gate->flags, dev);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					gate->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
 			continue;
 		}
 
@@ -264,8 +260,7 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
 		clk = mtk_clk_register_composite(mc, base, lock);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					mc->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", mc->name, clk);
 			continue;
 		}
 
@@ -293,8 +288,7 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 			mcd->div_width, mcd->clk_divider_flags, lock);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-				mcd->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", mcd->name, clk);
 			continue;
 		}
 
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 6d3a50eb7d6f..89f23e111d91 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -175,8 +175,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 
 	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %ld\n", node,
-		       PTR_ERR(regmap));
+		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
 		return PTR_ERR(regmap);
 	}
 
@@ -187,8 +186,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			clk = mtk_clk_register_mux(mux, regmap, lock);
 
 			if (IS_ERR(clk)) {
-				pr_err("Failed to register clk %s: %ld\n",
-				       mux->name, PTR_ERR(clk));
+				pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
 				continue;
 			}
 
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 60d7ffa0b924..f04f724e12e5 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -378,8 +378,7 @@ void mtk_clk_register_plls(struct device_node *node,
 		clk = mtk_clk_register_pll(pll, base);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					pll->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", pll->name, clk);
 			continue;
 		}
 
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index ffe464ce7ff8..bcec4b89f449 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -100,8 +100,7 @@ static void mtk_register_reset_controller_common(struct device_node *np,
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %ld\n", np,
-				PTR_ERR(regmap));
+		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
 		return;
 	}
 
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
