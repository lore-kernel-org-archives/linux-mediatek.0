Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94619C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 13:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZj8kQh9xVjPdSfFXFonJyWLDC3DN/8kQ6ZuX0jNUwI=; b=vy04hEhxNX0FQg
	HoZNCWry+9PsjSSifTj7LxE5ynr1v1jYBrXc0AcMWLJnKW+XIr+gYrpxaituZwjXtiLOUak9dwNi6
	FRCQgH/Nr80C9R7MktQ/dPtTKGCPvAimoBmrh85hp2tbCTQyed/TN2N+IlqSvwDlRWb3Lyw9u9YIF
	1lOoSyfhEVC3wKGpHYR778jy+vBpNoG9DPm/LupC5y8FF43F2zCNxh/1itZ/KhSGCDUMWXh0ZBTr8
	6c3TwX8kCTh/FbroHCHWt66My4x0Nxa+6NkZSTWOWiD8bGyGW3YqEszA32YcANMiKLzYaXMVedkLS
	ja07HYQGV/MMR3SNyPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQ7V-00DwIt-Tr; Tue, 08 Feb 2022 13:01:21 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoV-00DngQ-R9
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:46 +0000
Received: by mail-pf1-x42d.google.com with SMTP id i186so18703728pfe.0
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rT0ZvlEjSEX8tKc4measdB3BcCgivnDIA3yZFD+PibQ=;
 b=kox8FsUbNjIpYMZjXcKa8GmJjInsgqKSj6osghdWW2iJEPN5D0RfPCqjSjc0mBLHm3
 cWKgdgVcYOe/kIJnYOhYLE1pzYP7ghXt3SJm85YA6d4HNNzZPzVzFNs0MgtJbmp8p13+
 SbAKAiMbVvblV3oKQC17IG7WEoFyeSha3YpuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rT0ZvlEjSEX8tKc4measdB3BcCgivnDIA3yZFD+PibQ=;
 b=mChBMjlUEVCY3bl6GsfyxUJRD2x1P7qfY7a7WlZaKtRDj0ScMxCtE9whM4fGWl5hn/
 /i1UcTCQ/0LjksuC3fOU2ejEyLg39Yx7+ZZCTGvqwbRPnxQ8tQ/5+0iK1MOYf0ucko4A
 fJdArn+ellzjz2FL4s88wfpZToXNoWFU2PMfriAd9rdgK/0CECp/rIJDmlkYFGxa8r3/
 7djotj9z/eqy0PUrsw8T0nWLNDKhJlamZyDH3ErIzY7XJyBxudInrG9VoRJLi4T3B1//
 9jvbj4bsodgycYbYb5U0SURMc9nB0b4W2UNJxXjMtNQ11dck73Xm6Xyo54/43BI9JjM6
 WAjw==
X-Gm-Message-State: AOAM531alGEc8BeoYlUyjLa1SBjqeARK66k0LCjLVoBKos+ZEzOQ80aK
 R5/dSYXF0IY0pG0qqUvpgWVYxA==
X-Google-Smtp-Source: ABdhPJx1ycT0FAJzg22IJjUEMsQqtSxdDyCkyduFu9zf4zZCUNd6bsoPyFYslN+f4ib6yI/1sZfQNA==
X-Received: by 2002:a62:86c9:: with SMTP id x192mr4244674pfd.54.1644324103129; 
 Tue, 08 Feb 2022 04:41:43 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:42 -0800 (PST)
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
Subject: [PATCH v3 25/31] clk: mediatek: pll: Implement error handling in
 register API
Date: Tue,  8 Feb 2022 20:40:28 +0800
Message-Id: <20220208124034.414635-26-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044144_019237_67F17997 
X-CRM114-Status: GOOD (  15.48  )
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

The pll clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, and unmap the I/O space, is done in the new
error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 23 +++++++++++++++++++----
 drivers/clk/mediatek/clk-pll.h |  6 +++---
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 8439d37e354d..817a80293bfc 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -377,8 +377,9 @@ static void mtk_clk_unregister_pll(struct clk *clk)
 	kfree(pll);
 }
 
-void mtk_clk_register_plls(struct device_node *node,
-		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
+int mtk_clk_register_plls(struct device_node *node,
+			  const struct mtk_pll_data *plls, int num_plls,
+			  struct clk_onecell_data *clk_data)
 {
 	void __iomem *base;
 	int i;
@@ -387,7 +388,7 @@ void mtk_clk_register_plls(struct device_node *node,
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
-		return;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < num_plls; i++) {
@@ -397,11 +398,25 @@ void mtk_clk_register_plls(struct device_node *node,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", pll->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[pll->id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_pll_data *pll = &plls[i];
+
+		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
+		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
+	}
+
+	iounmap(base);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index a889b1e472e7..bf06e44caef9 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -48,9 +48,9 @@ struct mtk_pll_data {
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 };
 
-void mtk_clk_register_plls(struct device_node *node,
-			   const struct mtk_pll_data *plls, int num_plls,
-			   struct clk_onecell_data *clk_data);
+int mtk_clk_register_plls(struct device_node *node,
+			  const struct mtk_pll_data *plls, int num_plls,
+			  struct clk_onecell_data *clk_data);
 void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 			     struct clk_onecell_data *clk_data);
 
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
