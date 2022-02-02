Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC55AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mg66dotI0kBFiP5AW3gL3xOkaZk9GEx+C4DRW1Bm40Y=; b=EeTAAgCRPQoBZo
	Cp9otHXbfQdGsds2EskRXh7N7q6b8jQE74c0o72X7aRn+JY3Jso9w34hBgmaVFhegHLoDdZkShEHe
	y2x6ZQlq1GUfOUvn7jUAq07JIGxeMpIGAy1M8IDQT4VKrQt/T1BUC0AfTjQpLCBrw0cN7lz5QKNWa
	WhQ0/iA1xqGz11NBe3xg6c/LVz2pIc2HPX93EAVkT5v1fapwO+z9EO9LU762iRlRg0XIjRCoSFJjh
	FxGGqBJo+8KGS0snJPR8bHiNzTQjFPeWHZWD8WppiTIAXKwR8UqnbnWOmvP8lVzDsw1iyaVsjObim
	SgEFPdL6INcOo2jIp4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG1F-00FP2H-BK; Wed, 02 Feb 2022 13:49:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG10-00FOs3-1M
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:49:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id h14so18312461plf.1
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AhwOTUu+Yd20QptHanrLUKzOx+jJe492GmL7ESL7vr4=;
 b=LNILHH+++jRLvWWQTkAQWqu97BJ7NWdeEpf3QQ/Nb02vGJIVrh4kamufWLTcQPTKPZ
 tDl3V7uaE75cuttLOlBPJkFDDrsRxIpcQvVmwsAUh/f/1nQcJkX867/Q0fy8qX2K9GEi
 dZwIOjBOZKpxDGxaALbpSKXrQ8vpOij/GCYTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AhwOTUu+Yd20QptHanrLUKzOx+jJe492GmL7ESL7vr4=;
 b=VXSlEsyxhWCkGesnduUgtTJpwDt8QdOOlJYlyaXUsD8tLyE1SaaUsIWWC3wGqptsiu
 Tq5NbAdFn+dl7cnQnxbcDBDmG3B4DjAkLYrkszcVcCTShXzH6KzyfGFrxz+KxWqbLRr1
 7YfWR2B+Ns05qQGlJDcl6gNPAfl+wS6S4uSFI1ERV99bSSOmKsnvQ/IkpMu881zFmdTP
 vBbRUQImdaebg+NQHpcHURTVHBFhNSCOZ/7V0/Fv9Jgb0EJN0Qg1BDgSBE12+U7g57DS
 ccV9weELTxbkHhoxLtCR/1sU4R5VSL912KsHwvBbgHfmdWqXqntEXfG5XsE63rGvMhFO
 gzTw==
X-Gm-Message-State: AOAM530EdMj/OTqrQ6Cgk2x7nVL+H0uEB2+gbkkNfW4jE6Ld7mx4MJBd
 grTZ0fertsvhKoo3aPoHkxqXWg==
X-Google-Smtp-Source: ABdhPJzEyx+/Bw2d/SVDspKOv5Ko/HfJV+vTaXfMFR6X4ILc47iPMqAsQ7piF3VBEKt9W04apdGYOQ==
X-Received: by 2002:a17:903:2352:: with SMTP id
 c18mr30838789plh.104.1643809780396; 
 Wed, 02 Feb 2022 05:49:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:49:40 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/31] clk: mediatek: Use %pe to print errors
Date: Wed,  2 Feb 2022 21:48:04 +0800
Message-Id: <20220202134834.690675-2-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_054942_103566_87BCB7D1 
X-CRM114-Status: GOOD (  13.97  )
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
