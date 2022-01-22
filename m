Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96894C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EALiq3T176XutW2ErOoTe5uTtChzEvRL+Fswj3/Xtm0=; b=xplAi6ZciABEhe
	jpSi1tMFzBIT2G/fDtiX4AfF0FlShcC/+L0LXO7V/TYosdjejE9dceTcZ1CqGfMsBxMJXOySvATl4
	C5PPnbjkzPuIs7XindSEp09rBVUjixXRSrSfNIbMrK/E5Yd9t7q1armPYxMb9mlRjpA89/9sfKgUU
	plWpqCpEvk9nUK1i7NKynUsXhocUyM8OiLMtG518a4fBpb3Qzq1vX8rl1vOQvJx1H/jKyX+6t6QyR
	qz59KJqLYxvaTESKwvZpyw36tESnVGKEim57Y8SF07sbDir22yyDRP8ComfTEWba4W7CPvP0KeGeR
	CTWZNZPGMWd+Kz2GeK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCdI-00Gudl-Jt; Sat, 22 Jan 2022 09:24:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXG-00GrZH-11
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id l17so4685287plg.1
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MgVxYLqn7e5CbtxyDunniYd0pM9V2lFEkskjcE0RgkM=;
 b=Uoy5LPBTFoU2mLPls+lvhUkx952hkxqIoO9usG6HBvsf5PK45trlJ0cDer4J2/ruQk
 YeehYSwjMVpGOqkFHMSSV0qnghdbQP4B5f4R6C/O/pqag9DE5V9+z6qm/82kghl7gcyC
 fNTL245NESs6ROe+n/GD7AHbl6KxLkUBSESIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MgVxYLqn7e5CbtxyDunniYd0pM9V2lFEkskjcE0RgkM=;
 b=NVQExmehkr8XH4CUeCqPZQJVgdR/3jnhFR/0FzCNZWuvuNuXQS3Gs5tmGYgMayn/uN
 MPG8NSRbJas51ewtm27FZH/y32wUoHjY03dGkHIuQ3ipgh0kceja0E+wyYlSzuLNMOVj
 2AF3Z1I1zH51dxb0tR7/xpI1RjSamzhhtXFMPIWmSBEo2Gvlf6cHEw6M1niaTv8aKG+I
 yxUz/ZgGchqdLanjyIepezRmrRmX1Klr+81NeS1MNKKu7VnU845Zx4nTmfWSw1nTBoSn
 /oeIN7JIuu9wrasPnVrSneZiGx5DsMMFXvEqtIOZMyrk2TLRXXCdaFZ6z+lUNuxf2aRl
 2B0A==
X-Gm-Message-State: AOAM532R7bNZQHbahwqr/nr6JOUWSOlIKi/h9FKhTfm3ROYlCXXOj4pd
 qwUeEw6vny694XikJRbrvVJ2sg==
X-Google-Smtp-Source: ABdhPJz5s0TxxuEXSon71jmhisUSFx3ph6WF8cavJgqsrEAxrQRzhkraOlOofKfWPWSYHQ/+KjByhQ==
X-Received: by 2002:a17:90a:b702:: with SMTP id
 l2mr4405014pjr.126.1642843093546; 
 Sat, 22 Jan 2022 01:18:13 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:13 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 13/31] clk: mediatek: pll: Implement unregister API
Date: Sat, 22 Jan 2022 17:17:13 +0800
Message-Id: <20220122091731.283592-14-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011814_099804_E4260703 
X-CRM114-Status: GOOD (  15.65  )
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

The PLL clk type within the MediaTek clk driver library only has a
register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the PLL type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 49 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-pll.h |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 64f59554bc9b..081e0df8203e 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -360,6 +360,15 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 	return clk;
 }
 
+static void mtk_clk_unregister_pll(struct clk *clk)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	clk_unregister(clk);
+	kfree(pll);
+}
+
 void mtk_clk_register_plls(struct device_node *node,
 		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
 {
@@ -388,4 +397,44 @@ void mtk_clk_register_plls(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
 
+static __iomem void *mtk_clk_pll_get_base(struct clk *clk,
+					  const struct mtk_pll_data *data)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+
+	return pll->base_addr - data->reg;
+}
+
+void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
+			     struct clk_onecell_data *clk_data)
+{
+	__iomem void *base = NULL;
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num_plls; i > 0; i--) {
+		const struct mtk_pll_data *pll = &plls[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[pll->id]))
+			continue;
+
+		/*
+		 * This is quite ugly but unfortunately the clks don't have
+		 * any device tied to them, so there's no place to store the
+		 * pointer to the I/O region base address. We have to fetch
+		 * it from one of the registered clks.
+		 */
+		base = mtk_clk_pll_get_base(clk_data->clks[pll->id], pll);
+
+		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
+		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
+	}
+
+	iounmap(base);
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_plls);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index d01b0c38311d..a889b1e472e7 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -51,5 +51,7 @@ struct mtk_pll_data {
 void mtk_clk_register_plls(struct device_node *node,
 			   const struct mtk_pll_data *plls, int num_plls,
 			   struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
+			     struct clk_onecell_data *clk_data);
 
 #endif /* __DRV_CLK_MTK_PLL_H */
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
