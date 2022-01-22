Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVH0gGJPdcqFW2NUOmojWGdREjnn6qO061xFLz/GVpg=; b=JkuX6F3q+xHHY7
	fUKcWWKzbN6BSBZ58erNcLm40ZGHlICTccAdhrhA4Fu2zMM6th46xQXdsXMrwrDSqW8sskMpHVrIm
	bR9LzAxdXNk/zsiwoeymVH/c1chZ8I+L8KYW50gk7zXW1/98bzpyJa06zCWRtJ+wgQarIaXum//sU
	RTIzO3mOabbsdhqDN5kymI7dlI+bnBHBVBRPZ7FwtF7T15OcIeDS65eyAbDD9ez0iA3TB0gTClOh1
	zPIteelga1JnvGUmeFs8e+Az7Xt9YLi8hhxsndQtU9vUvlV397ky1ixfhtWWy1R2DWagw3FI8XZQc
	RjvFuAyWTeXy0WNSbzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCn6-00GyXf-Cd; Sat, 22 Jan 2022 09:34:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXi-00GrtV-US
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:45 +0000
Received: by mail-pf1-x429.google.com with SMTP id u130so6785208pfc.2
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbPbA9/DLWUYTIxrdST0gBpfgjb/5RZYFjIh1hKBGaw=;
 b=fXfvPqZw/4dYCNRcYbxy3FQcxMrUAI7ndyklT4lYjdDuwYyCkAxRarz7aw+CAQh6/w
 AsexIaSXdv4RskQreEXbs88+kzid2zRVKf9Hn/PSZbjMAQIGnyic/sR/2Un/j3NIZzmI
 2F/MqS+afK/Z10bWZ0jJTAf5yQjVpk0Z+rE7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbPbA9/DLWUYTIxrdST0gBpfgjb/5RZYFjIh1hKBGaw=;
 b=jeCLzixYkLEnlwvIrVp7CwIcUEdAMz7p6HOFKdrTyJVPvuZZY062uVTmieK44jG8BU
 0Z4mnrRJDCbn2xTMWE/Paekf1NV5AdrfMy6c3ubRaV0q2TpOHKZOsY9hWNgGE0f2vuvA
 Bf9pr1wa6xezirqnOReYn6bscOnCbtTsmfDs04vIo/HW6QDfZe12vbDxu3KE2J33lOUo
 HjSvq0Pv3SSi27S+yAj0UZmvwopQIMcDOAGYBL2mb0AYj/jRaij1zzVGtvYsTMg+zjP5
 5d8pQOJyuJiCZJCtIACzFBeCI/KXzO85yYePQi1d+cG/fjhfc5fII6f7tLXlX0mYzQl7
 8Yaw==
X-Gm-Message-State: AOAM532MpBX4pJ7RT2DazqoI2ASf65rRyOg/cewE7keapeZZqMmctKlX
 j9axAp/jEHo10b7J4X4JIHA2xA==
X-Google-Smtp-Source: ABdhPJypl8e8g8WdxvcCTgGDoGSeur3n9oEkuxyTV4uLfQphxOLzks9aTqV8OjUgoQuQSOhx+TnoJg==
X-Received: by 2002:a63:2ac2:: with SMTP id q185mr5565195pgq.370.1642843122383; 
 Sat, 22 Jan 2022 01:18:42 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:41 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 26/31] clk: mediatek: mtk: Implement error handling in
 register APIs
Date: Sat, 22 Jan 2022 17:17:26 +0800
Message-Id: <20220122091731.283592-27-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011843_057125_D84C6E76 
X-CRM114-Status: GOOD (  17.48  )
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

The remaining clk registration functions do not stop or return errors
if any clk failed to be registered, nor do they implement error
handling paths. This may result in a partially working device if any
step fails.

Make the register functions return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

This also makes the |struct clk_data *| argument mandatory, as it is
used to track the list of clks registered.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 118 ++++++++++++++++++++++++++-------
 drivers/clk/mediatek/clk-mtk.h |  20 +++---
 2 files changed, 103 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index d2c50186cceb..e1977c8e130a 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -53,16 +53,19 @@ void mtk_free_clk_data(struct clk_onecell_data *clk_data)
 	kfree(clk_data);
 }
 
-void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
-		int num, struct clk_onecell_data *clk_data)
+int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				struct clk_onecell_data *clk_data)
 {
 	int i;
 	struct clk *clk;
 
+	if (!clk_data)
+		return -ENOMEM;
+
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_clk *rc = &clks[i];
 
-		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[rc->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id]))
 			continue;
 
 		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent, 0,
@@ -70,12 +73,26 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", rc->name, clk);
-			continue;
+			goto err;
 		}
 
-		if (clk_data)
-			clk_data->clks[rc->id] = clk;
+		clk_data->clks[rc->id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_fixed_clk *rc = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
+			continue;
+
+		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
+		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
 
@@ -99,16 +116,19 @@ void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
 
-void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
-		int num, struct clk_onecell_data *clk_data)
+int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
+			     struct clk_onecell_data *clk_data)
 {
 	int i;
 	struct clk *clk;
 
+	if (!clk_data)
+		return -ENOMEM;
+
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_factor *ff = &clks[i];
 
-		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[ff->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id]))
 			continue;
 
 		clk = clk_register_fixed_factor(NULL, ff->name, ff->parent_name,
@@ -116,12 +136,26 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", ff->name, clk);
-			continue;
+			goto err;
 		}
 
-		if (clk_data)
-			clk_data->clks[ff->id] = clk;
+		clk_data->clks[ff->id] = clk;
+	}
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_fixed_factor *ff = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
+			continue;
+
+		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
+		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
 	}
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
 
@@ -253,13 +287,16 @@ static void mtk_clk_unregister_composite(struct clk *clk)
 	kfree(mux);
 }
 
-void mtk_clk_register_composites(const struct mtk_composite *mcs,
-		int num, void __iomem *base, spinlock_t *lock,
-		struct clk_onecell_data *clk_data)
+int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
+				void __iomem *base, spinlock_t *lock,
+				struct clk_onecell_data *clk_data)
 {
 	struct clk *clk;
 	int i;
 
+	if (!clk_data)
+		return -ENOMEM;
+
 	for (i = 0; i < num; i++) {
 		const struct mtk_composite *mc = &mcs[i];
 
@@ -270,12 +307,26 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mc->name, clk);
-			continue;
+			goto err;
 		}
 
-		if (clk_data)
-			clk_data->clks[mc->id] = clk;
+		clk_data->clks[mc->id] = clk;
+	}
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_composite *mc = &mcs[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mcs->id]))
+			continue;
+
+		mtk_clk_unregister_composite(clk_data->clks[mc->id]);
+		clk_data->clks[mc->id] = ERR_PTR(-ENOENT);
 	}
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_composites);
 
@@ -299,17 +350,20 @@ void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_composites);
 
-void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
-			int num, void __iomem *base, spinlock_t *lock,
-				struct clk_onecell_data *clk_data)
+int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
+			      void __iomem *base, spinlock_t *lock,
+			      struct clk_onecell_data *clk_data)
 {
 	struct clk *clk;
 	int i;
 
+	if (!clk_data)
+		return -ENOMEM;
+
 	for (i = 0; i <  num; i++) {
 		const struct mtk_clk_divider *mcd = &mcds[i];
 
-		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
 			continue;
 
 		clk = clk_register_divider(NULL, mcd->name, mcd->parent_name,
@@ -318,12 +372,26 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mcd->name, clk);
-			continue;
+			goto err;
 		}
 
-		if (clk_data)
-			clk_data->clks[mcd->id] = clk;
+		clk_data->clks[mcd->id] = clk;
+	}
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_clk_divider *mcd = &mcds[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
+			continue;
+
+		mtk_clk_unregister_composite(clk_data->clks[mcd->id]);
+		clk_data->clks[mcd->id] = ERR_PTR(-ENOENT);
 	}
+
+	return PTR_ERR(clk);
 }
 
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 7f902581a115..bf6565aa7319 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -34,8 +34,8 @@ struct mtk_fixed_clk {
 		.rate = _rate,				\
 	}
 
-void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
-				 struct clk_onecell_data *clk_data);
+int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				struct clk_onecell_data *clk_data);
 void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 				   struct clk_onecell_data *clk_data);
 
@@ -55,8 +55,8 @@ struct mtk_fixed_factor {
 		.div = _div,				\
 	}
 
-void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
-			      struct clk_onecell_data *clk_data);
+int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
+			     struct clk_onecell_data *clk_data);
 void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
 				struct clk_onecell_data *clk_data);
 
@@ -150,9 +150,9 @@ struct mtk_composite {
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock);
 
-void mtk_clk_register_composites(const struct mtk_composite *mcs,
-		int num, void __iomem *base, spinlock_t *lock,
-		struct clk_onecell_data *clk_data);
+int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
+				void __iomem *base, spinlock_t *lock,
+				struct clk_onecell_data *clk_data);
 void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
 				   struct clk_onecell_data *clk_data);
 
@@ -178,9 +178,9 @@ struct mtk_clk_divider {
 		.div_width = _width,				\
 }
 
-void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
-			       void __iomem *base, spinlock_t *lock,
-			       struct clk_onecell_data *clk_data);
+int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
+			      void __iomem *base, spinlock_t *lock,
+			      struct clk_onecell_data *clk_data);
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_onecell_data *clk_data);
 
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
