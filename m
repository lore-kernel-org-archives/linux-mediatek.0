Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A9FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwWbQlCy3DmiHLK3QV/Asb23xA8kHCIlKb8ig3OuE94=; b=fPkeDV23kcjhUn
	P/nsp/4EcELNG5Gv0kMrnju3N31JDV/NnQmvIH56h7O9GwleSqKcnzajSGYof1psE2ufHrMILQMHF
	u7ZFj/qp/rXlWHxqzl2P2KeriwHgQgsLAFw8kokEoawnEdz4tpxWeBCuc67BJEpYnYfh5AiYr14Ps
	NxMvDf0XJKB/3ppyMvVTF5X7HD3dtP+8pEIOmSW9XfvfJ8VfTTmt3ja1+8g5wu4o7a+6iOA3XflYA
	3dAfv4sTyi02RkJudWB4q61S+cyKpgZJPIcBU8rtSrFej0cJLveabJHcIgRmsxiIsvkUr3jlMroFT
	DqK2oURR2uetj2Tld0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQBV-00Dy3K-Nm; Tue, 08 Feb 2022 13:05:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoi-00DnnB-F8
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id b3so153729pfg.7
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/UlhVOdAnU6SizqlzMjYxwU3c7ZqzxGr+vvCSOLKss=;
 b=Dt9AfISg1ZkV2/kJIuMU7nn3K/UEJs+AGGZj8+C5VXuJC8f63RU3oHLEdy9b8qg0Fg
 OIZGnUKyWeUx7BNKIzEk6KZpYCY/PaEfTafdqxdOo7NYXsCiZYdqCw2lTVTBCRUEluFk
 YpenvdzYfy2uJ64eQm34eHRCyq8MUrHb39Fz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/UlhVOdAnU6SizqlzMjYxwU3c7ZqzxGr+vvCSOLKss=;
 b=qeFMQyTMMzp8GhmVjDSVLh3ka8KvoZZVUfTxRMGdPNKxgD9BCJKIwKxjk6irmtKKnn
 vi/lqqzsHMmWx6/jIqJ5pZ/iDW23ianNh922CsT9QG2UDc7bhA/dktXMEDrF/ijFNTQA
 tizirkwd1wVakBad93JO3b96/upVIah9qt3bMfKQ5ewH6Eb57owKgKB0F2A1yiuqKH+g
 pbqIZXmd1NxzICx9VYimaHJTmeTHRnnTDCI0m+7HHV4/eaqPr0m5hzx7LQzSHxFQAVl7
 AKVB0JPCl+SZDS1lb38XUBoIK8yVHYK4DEF2dnhjD6QPeSwBfLSNl9aTCu1XqBveaOLb
 GLxQ==
X-Gm-Message-State: AOAM530z/NIoDCG3OFDhLl6UHMF/gwNtLiN3x/OYbLA8ejz+VJsPBZeS
 TI6oFqvsw9itC3i1l88TqgL/Jw==
X-Google-Smtp-Source: ABdhPJwhJLcvpb8S62B7N3C1BWrhd9hXr0mGHQTU2r1oJfFvkqMkkgu1//UJNeCPWx6z8TnlXiIHUA==
X-Received: by 2002:aa7:8bcf:: with SMTP id s15mr4185498pfd.16.1644324115911; 
 Tue, 08 Feb 2022 04:41:55 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:55 -0800 (PST)
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
Subject: [PATCH v3 31/31] clk: mediatek: Warn if clk IDs are duplicated
Date: Tue,  8 Feb 2022 20:40:34 +0800
Message-Id: <20220208124034.414635-32-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044156_603516_1C9E9EB5 
X-CRM114-Status: GOOD (  13.34  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
index 0e027be0d5fc..b4063261cf56 100644
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
@@ -305,8 +309,11 @@ int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_composite *mc = &mcs[i];
 
-		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[mc->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[mc->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n",
+				mc->id);
 			continue;
+		}
 
 		clk = mtk_clk_register_composite(mc, base, lock);
 
@@ -368,8 +375,11 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
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
index 817a80293bfc..ccaa2085ab4d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -394,6 +394,12 @@ int mtk_clk_register_plls(struct device_node *node,
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
