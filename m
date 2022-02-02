Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CF7C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si/WMObiquohc296HyejjH37hY2qAGjfoCWECGpi5kY=; b=F0DoOk7/GUr5W/
	AOZL/GAcNh35xB2cZAmC1xgJo1olv6ZD0SFiQ9B89gs2Ylze2LmBAnqEps327tN+dPfpsSuxcuQS+
	LM4J/8OT0xK2VAgRp2krINV7275bMz7WuOrxa2LAcDVpG4LAc6N5vwJq41qrFyHJeLqI0KILoYj1i
	/vhvZ5QWFVoAY14KC9myMHzn01HX8JDTSdDJB+tIa7u9qgD2aSiWHi++DhnCVzTrc4UgEPcYn1yVt
	5QaH9QdRbBiEdeIP2HJdnd6/Gh1YjhA6rIWjj0Ijcp4CXP+Qed6iTd1ECc5FmZ4ADmTc1g+MnXMLx
	DQGgCA4IBrF5+72nwnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGL5-00FZJ3-Dw; Wed, 02 Feb 2022 14:10:27 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1l-00FPRk-Gs
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so6079433pjb.1
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/X1xbqtIcStarTs4c2+W6s0YHf8t7yF3UKC31OhAY/I=;
 b=aF+d4V20wz3PCFjPHAZuLztiRKZsart1Aj14opdzWw7+9yapzvxbwicJNonkhZRjO3
 PKJ+VB7NjzujZClFOs2I16KAAF/iDFkmMkYoSgH5knW+pPKb/GTJIdTYbRJsQNRh9JTz
 CUlwLMNOUQ1rUEEcGWFjJLSUiz30l+rEAd/uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/X1xbqtIcStarTs4c2+W6s0YHf8t7yF3UKC31OhAY/I=;
 b=RdYUg2KMWwZKwzH+8icdK68aFOjBgJCFCGmM0sf95+XG5o8vByFYMUtu/Cw8JKLv8v
 OEgMIgQld5hxe1zDDC131C5VZv/z2M2OJyg1r3UgzwqTaGp8GSLXtqgwJ2lvyGZ6r0sN
 xsOyDe09xVn/qsVWXkFs41pTkMJAkeU9AvSFvgcc0KZ14F3pnb3yoU7O5KCwqgrCQ4sD
 jbI8H2022N3baPpBCG8t0H9jdHXKi1KRnhE4HG8U67ObLEfUQkrEpGJFqtAC2XF/J6pi
 Hj77dFQaKp3vtCkijPVRv8gyuLZxhbeo/2IRi6TpW/12nV52Z3i6HzbnNxfZwDov9vR5
 8lKw==
X-Gm-Message-State: AOAM5332nbMTaYfIdY0NOfiTXLrC/OKcp6X2xw3FzviUZF3oUyI7D9Ir
 ELKkqLNw9M8TW+H5XontGXqhRA==
X-Google-Smtp-Source: ABdhPJxlPoarr0PYhm4khqpH/LZy+sL3IANoFaQkok7/pMhWzxpEt8o+PM6/CSoMpKaNSmyBZ4leCw==
X-Received: by 2002:a17:903:124e:: with SMTP id
 u14mr30286128plh.146.1643809828752; 
 Wed, 02 Feb 2022 05:50:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:28 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/31] clk: mediatek: pll: Implement error handling in
 register API
Date: Wed,  2 Feb 2022 21:48:28 +0800
Message-Id: <20220202134834.690675-26-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055029_597237_66529F18 
X-CRM114-Status: GOOD (  15.81  )
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
