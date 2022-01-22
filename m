Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npowph/CJtX/XR64N30P3/D1OCyDdya02ZoL7EWbsQg=; b=DJPQeXDeP3/e+f
	AmhcjcHIjpWjtZMXU6+AxFWm1sObaKbD3ltjEr1jYFamEsVqI3uxhkyxRhLkdwUa0tlwJxpb5Au0n
	SAjU6NH2uFZnoQ4e4zoxh57X6vVoYU78ToDSUlTybvopuMrRjPYPWUXZ09q67OVx1gXCP9eh0HVVb
	iibx+N13ub7v8d7iFv8PWrziqvxpXYwQ1StFJxiZVK3UzYlJXCbrMSB18EWuSPlux3h63Cz83uu/6
	ToqVQ/GLzKAVBiOZODYpe6Iac1v+6g1rbLbXC7LVLOsSl+r65SGIed7ltbJWOP0hQYvXCe314P7k+
	psurmXyu/9wa9i4awEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCtt-00H1Vm-QU; Sat, 22 Jan 2022 09:41:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXu-00Gs1o-Qo
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:57 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so11298771pjp.0
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x4l7SdSy/ZXICUFfVEpfugcTxefmMymFj4v54f2ETqQ=;
 b=ZtWNhNbC7GUN2q0P8diAFmhrWmdYlpRqqosydKBUFWfUVfCAzBHykWE2mm3SNWMcbt
 hLqFzAAmx9ZIv0Cd/Qs/0SZ5jFQ+DVHCB/jXrjLgOzlb1ZPwJefdOp1lRBYZCTFC9wNx
 QhICe9kzg1brGAAj4mFqYZofkdvjCsNcdEdOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x4l7SdSy/ZXICUFfVEpfugcTxefmMymFj4v54f2ETqQ=;
 b=V7d3+LSLZDwyLjAD1wUpoOjZCSsJdbcgl8Ih6JjjG01YAF9JBZOH8aQyWNtx+nogMw
 IbSjZ2xYdILPZXDuYXqEXADaYNZJQOIXIXmwBCFj5kbZ8cl6HE/bwTt8qO7pNukzgJpb
 i7LZufQMSmPgAkw+IVsXVXt2oJbL/KkUPabvKloFTBeprQa10lPlECv2RMVoCmvs3f6Q
 0Gc2iLHe8mU7HcGOjOJ6ZQKc435YHLmELd2qva3NXinX7pRFqrJCi0cZPKYGAdLs93aH
 UNcDGMl95aprfLbPTNoJmqVrBczNEMvFyUKPgz21osFGizEZTGnP5jVkxjf10UZ3aRkB
 aMIQ==
X-Gm-Message-State: AOAM53039UI0dwJoGfSYbQ8DQLlRKsWLL8UDJpaw0zahFGVaoa2sMYM+
 0MSN1/G88aZQKJrR8V1sjZ2X7T6PwPmS5g==
X-Google-Smtp-Source: ABdhPJwFPbv1eHMv9uXQ0J/1PfctmAALEU6cuguU/AUEcVHQb3vKL3KFeX3jg4pkUAvKg6vM1e63lA==
X-Received: by 2002:a17:90b:4f46:: with SMTP id
 pj6mr4441477pjb.213.1642843133462; 
 Sat, 22 Jan 2022 01:18:53 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:53 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 31/31] clk: mediatek: Warn if clk IDs are duplicated
Date: Sat, 22 Jan 2022 17:17:31 +0800
Message-Id: <20220122091731.283592-32-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011855_008679_B35E5833 
X-CRM114-Status: GOOD (  12.43  )
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

The Mediatek clk driver library handles duplicate clock IDs in two
different ways: either ignoring the duplicate entry, or overwriting
the old clk. Either way may cause unexpected behavior, and the latter
also causes an orphan clk that cannot be cleaned up.

Align the behavior so that later duplicate entries are ignored, and
a warning printed. The warning will also aid in making the issue
noticeable.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-cpumux.c |  6 ++++++
 drivers/clk/mediatek/clk-gate.c   |  5 ++++-
 drivers/clk/mediatek/clk-mtk.c    | 18 ++++++++++++++----
 drivers/clk/mediatek/clk-mux.c    |  5 ++++-
 drivers/clk/mediatek/clk-pll.c    |  6 ++++++
 5 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 499c60432280..c11b3fae622e 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -120,6 +120,12 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 	for (i = 0; i < num; i++) {
 		const struct mtk_composite *mux = &clks[i];
 
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
+				node, mux->id);
+			continue;
+		}
+
 		clk = mtk_clk_register_cpumux(mux, regmap);
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 631ff170b7b9..da52023f8455 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -224,8 +224,11 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 	for (i = 0; i < num; i++) {
 		const struct mtk_gate *gate = &clks[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id])) {
+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
+				node, gate->id);
 			continue;
+		}
 
 		clk = mtk_clk_register_gate(gate->name, gate->parent_name,
 					    regmap,
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 6d0b8842971b..b2a3568922b2 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -65,8 +65,10 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_clk *rc = &clks[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n", rc->id);
 			continue;
+		}
 
 		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent, 0,
 					      rc->rate);
@@ -128,8 +130,10 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_factor *ff = &clks[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n", ff->id);
 			continue;
+		}
 
 		clk = clk_register_fixed_factor(NULL, ff->name, ff->parent_name,
 				CLK_SET_RATE_PARENT, ff->mult, ff->div);
@@ -300,8 +304,11 @@ int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_composite *mc = &mcs[i];
 
-		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[mc->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[mc->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n",
+				mc->id);
 			continue;
+		}
 
 		clk = mtk_clk_register_composite(mc, base, lock);
 
@@ -363,8 +370,11 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 	for (i = 0; i <  num; i++) {
 		const struct mtk_clk_divider *mcd = &mcds[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n",
+				mcd->id);
 			continue;
+		}
 
 		clk = clk_register_divider(NULL, mcd->name, mcd->parent_name,
 			mcd->flags, base +  mcd->div_reg, mcd->div_shift,
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index f51e67650f03..21ad5a4afd65 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -208,8 +208,11 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 	for (i = 0; i < num; i++) {
 		const struct mtk_mux *mux = &muxes[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
+				node, mux->id);
 			continue;
+		}
 
 		clk = mtk_clk_register_mux(mux, regmap, lock);
 
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 1dd15f560659..e5e9c188be99 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -386,6 +386,12 @@ int mtk_clk_register_plls(struct device_node *node,
 	for (i = 0; i < num_plls; i++) {
 		const struct mtk_pll_data *pll = &plls[i];
 
+		if (!IS_ERR_OR_NULL(clk_data->clks[pll->id])) {
+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
+				node, pll->id);
+			continue;
+		}
+
 		clk = mtk_clk_register_pll(pll, base);
 
 		if (IS_ERR(clk)) {
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
