Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77045C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1Y8YenxZS0h7qM1vmiqsPFpINiAyJDnhS+PgKOspuE=; b=CMMQmb9vA+WGg8
	uBnLDSc8A/nNghGIFB4WXSaglYq7vTnD1zjojwuQtY8q+F6pgNai2Y/K0yzmvJS+s2E7mxedVGuva
	z8AC9Yy7d8B8vU35558HmOnwZV4q/AVd0dVL2qXS56rW+HE3mKupHYDt1uX4VXZPKUJSiKz7tsKql
	b+EMqwdySPXok5bbb8cuIaojpqmv/UVTlbLvaW/6AXdxLKHK1Oo95ahrlYN6joeZGJd3jpzkKMRY9
	3pHwaScNh2zuI+YjOEAe708zqzdFpl2F4vYONQ24d9U3t27jEaGQROyidzAebKtB6/cH0z48EY8J8
	vtw7iPYh4jJkVXmMuUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQ8F-00Dwci-3C; Tue, 08 Feb 2022 13:02:07 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoY-00DnhU-3U
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id i17so18619092pfq.13
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zOlNpEXDepZ4yjtrYbOEiToTrqDlKq5iRLx8moaIIHQ=;
 b=mpvH+3lilXr1A1JO1zFLSNPtwT6aQRcdbO1xuAOunzhTdBkypDvwK6diRK3aANzkFc
 AchHtI8htBGnpofq5uUFgsLi5WF8yY0WgvyT6jVevIRsEOhvMlw4L9guuf1KRxzRyxFb
 hsyLlMDVWBp1rQrE0O/0fvF8n3wjymQkcdRlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOlNpEXDepZ4yjtrYbOEiToTrqDlKq5iRLx8moaIIHQ=;
 b=F5r+CUd5b7g6HDIM3lXm9/goj9j17bR/qp/+/ZhNdThYgLKHl1tAkWjKGFznrRSPc4
 xaXBG1AjRwn4hEayNw1mGFgWwoqong/UwM/FGyc7V3sQEyh3MgMK2uMAumygKE4i/TXn
 XD2Emq7W58/IFOYDZGh91czp98kUrOkUVU4besev2FEvDX8yMwlDPEVLc4xwoMkDXxcs
 k3bWY5edThSnQDC2zaKYJxubOP7Sjp20hPQZDF1ztG6znHwgnFQX+n/ZRueMBBpzZvO6
 1M/kCA6LOgQ9XSp4Rjd6cL0xBEst6leNuTYyz2xAXKi7AjIicDlPwpIY/wFQ+OBZXg3o
 us7Q==
X-Gm-Message-State: AOAM530xB3S7TxK8qbi6liHs6DGMBEBz92/BT72QVDCmQ40iTPBZl8Ix
 FOje4sNJX0UHMQCIfm4+Gx0kVw==
X-Google-Smtp-Source: ABdhPJx3bYQ0yptzfAlsZj/t5fo77StxTCrCRo53y3yujaAJF8VjMwm3Z1dpBlyvAbBVyIdcieibPw==
X-Received: by 2002:a05:6a00:1892:: with SMTP id
 x18mr4206790pfh.20.1644324105289; 
 Tue, 08 Feb 2022 04:41:45 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:45 -0800 (PST)
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
Subject: [PATCH v3 26/31] clk: mediatek: mtk: Implement error handling in
 register APIs
Date: Tue,  8 Feb 2022 20:40:29 +0800
Message-Id: <20220208124034.414635-27-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044146_191565_F41863E6 
X-CRM114-Status: GOOD (  18.40  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 118 ++++++++++++++++++++++++++-------
 drivers/clk/mediatek/clk-mtk.h |  20 +++---
 2 files changed, 103 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 5618c84e4e08..8f15e9de742e 100644
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
 
@@ -258,13 +292,16 @@ static void mtk_clk_unregister_composite(struct clk *clk)
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
 
@@ -275,12 +312,26 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
 
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
 
@@ -304,17 +355,20 @@ void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
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
@@ -323,12 +377,26 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
