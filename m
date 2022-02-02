Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2E8C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbYMmzrUytwgs0VVsOOPxz/AB/1eZJ9FJS6kO1XWbJI=; b=11XFY/cAbazzpk
	dgrb3B7zJj3nRc1yAchTglf0E+ZCDtCLAQzBaGQRPSXvmV3dbw9zi6fY+ooCcB9ULHGIJblHeWELH
	z2VApSH3lvyQJilt2dna8pWzeDzYma8RKsVAfIUz1f0d4ctmZf9LRzDiFZx9ytPjQ88plWI7+DlhY
	crTA5HbXuFTbFXntKhwXVcuyaqQRLtaUVnyDz1IHWIz1VJUTQgPAI9jmZPmhZgtj4WHEzzBzH8C2h
	CWoTqBEceStYdCG+KVfvI+o5MncZIhTwhtZlAoWNbtX9C09syFJFsDBgQPr4bP9NWizrw6vqQ/aip
	32VZrIxFm6d+cYSu8E1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFG84-00FTBz-Nb; Wed, 02 Feb 2022 13:57:00 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1M-00FP8P-Tf
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:07 +0000
Received: by mail-pg1-x52f.google.com with SMTP id z131so18324203pgz.12
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pu1eEdNAtHQ3VmVoh3gnbPNdE4vdn2pwQinjoq/O1Tc=;
 b=XxrvETu43smOM+759hn3mDrz6X0CXmFDosOhmu1IBEX13G+3hWSBYQqrjAggRHGLtO
 pbKKjaE+Gi6g37qLGUg+xcVKcyPTSTT4E8RzY6y2ZOed+7ctgQKaiYHhyAy1QtCQa3VY
 o2IcpfMzV1RUduRMLrflAuqvyPz6MwmFD2MYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pu1eEdNAtHQ3VmVoh3gnbPNdE4vdn2pwQinjoq/O1Tc=;
 b=mF19J4sAzod4Lyg++qd+0tK/o+fxuQp3P0Y1gAVo6BRR1LfPvbf+Pee+Tbxd9v8zFG
 1hx9V6GnXO9EXIEfWOucf6pgOzyBe39k2cuX2wlyry0F0ev0ElIGtmbkwwexFIIqGv02
 MVDvBXjjy8cw121+PKEeYBUidMrxjxV3B9lX0dXM0vzuOMVGykM7JGRZh2zdgnqQHE3d
 /iaeedAoTpBJR+ctJLC1n+hNwVnkVcXROrTBl2SBGfvJhrPK7fKtB7ayvTSFNgPq2p66
 IiTSQ9NoeOsmMXnwERnqL0ETTbRQ/dXeBVf8sNNtmkyokgO8ev1/+lwGn8JY2ZLpH9Zi
 nZig==
X-Gm-Message-State: AOAM533uizCuWV2Wf7XNweeT9OiFl9gWVp6Iu2Ly365yL80LVmGlr2Ty
 RocjNTNzeHH14sAnbS1070msSA==
X-Google-Smtp-Source: ABdhPJw18NufROymgGz/nDz0CyPOetP8fX0Kdc2e1irdYQpm7ZsWLGU25ERBQFI7Y9hn/tbWac7ouQ==
X-Received: by 2002:a63:d711:: with SMTP id d17mr24557543pgg.429.1643809804449; 
 Wed, 02 Feb 2022 05:50:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/31] clk: mediatek: pll: Implement unregister API
Date: Wed,  2 Feb 2022 21:48:16 +0800
Message-Id: <20220202134834.690675-14-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055005_008205_25745C81 
X-CRM114-Status: GOOD (  17.33  )
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
 drivers/clk/mediatek/clk-pll.c | 55 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-pll.h |  2 ++
 2 files changed, 57 insertions(+)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 64f59554bc9b..b54e33b75d4e 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -360,6 +360,21 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 	return clk;
 }
 
+static void mtk_clk_unregister_pll(struct clk *clk)
+{
+	struct clk_hw *hw;
+	struct mtk_clk_pll *pll;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	pll = to_mtk_clk_pll(hw);
+
+	clk_unregister(clk);
+	kfree(pll);
+}
+
 void mtk_clk_register_plls(struct device_node *node,
 		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
 {
@@ -388,4 +403,44 @@ void mtk_clk_register_plls(struct device_node *node,
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
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
