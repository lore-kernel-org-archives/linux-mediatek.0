Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D0FC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViBfo91M9l3O+QGgWW9BLCaboObFD8ZGHg9YQp945LY=; b=prUD7GSbRrYcnh
	J4LTnqY3GkzpUqfXA89iI2anxQT+Eh0kcI1MNurB4oc4PNABHN1TIcyL4G/IE2xMmaeAao5I5TDgN
	GbJdIEMOLGMkw1sYTOHxrsQJQUC+QyleWI2uc4d5Ic0upE9WUPJ2INakW1oeyuW8V/QBGF61etYLz
	Xt6JWuwmFysgBgSVv/FrBHBXo0pSLhuevaIfiaxKPXEB7uINN91HZPMCzCfzrzCJ60SA5Yd9BEXsy
	epHGxtZTf1azgqdEKLOyU09w4G7Rh4w1RLzMeN7VN6cvh9y1PPjAe/4ByekgjR8GgJBS9VVs4NnlJ
	CLXUt6Sy3es11XwonYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCaN-00GtEO-F4; Sat, 22 Jan 2022 09:21:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCX7-00GrUW-Ba
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id u10so6521742pfg.10
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3QDkw6hKuh9A5bW2X56div0eoUC0aWY4eb0X4EhRe1w=;
 b=UUTVvh9xTtBDXrtDwIiLvMdkg+B8Tbj/3HJzIjqASRfr6Rbi1x7UfyjSAiJJf/GKxJ
 nextzHuxXDZCB5RNB3kw6NBl27kC1oIqB6QwWHjnnw+PBXKcNaC8qWcx6FrpfUxDYR4U
 Zed+yxwix8JIPX7rU2yILjRCGyE8BJiokJXkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3QDkw6hKuh9A5bW2X56div0eoUC0aWY4eb0X4EhRe1w=;
 b=d0XIN1+W5Va++SaTyAq/BeV514qFZMe3THmXrIrPfO21iHBvsT/I02JJBxNvI0OVvM
 4hd8Qgkqi9YilWIAPwvFRoIGoAFggGnaICNDbFBKrcVHa2M9oImj+jDHDo1E3xwRzaPW
 mOrLntMcvFtqzPv1wHNKdNCgbQABzaT9jOtFcnbAs84Yk15oInw8ANuRnYLoLKDbOPrn
 +IhoBCe+/8VBV0G1gqxabxMZKJ7ZrOp+8XovXS55bIeS2pzVzI3LEfMEFbHeQsqNpesS
 +99D3fOwSokYJgqzeUUcSryc7ptvMdShYjsHOa/A++rrBVNhcnfAcMmVS44FGTPSEb4J
 5xlQ==
X-Gm-Message-State: AOAM5308zEgp+LE3uuJELuMMG/VhPrperXZ2vE3Z+lJ5ligtTQjLKMDL
 l8hsWk5WggePtrC25WFNFAQAw3Nu9pAjmw==
X-Google-Smtp-Source: ABdhPJxEsfTKz2/apvu31D0HBDJq0EjZ3iVczEuZeKOKltbSUG6IuziGeOgA3YqrYKwP877YBCdRoA==
X-Received: by 2002:a63:5607:: with SMTP id k7mr5583895pgb.190.1642843084589; 
 Sat, 22 Jan 2022 01:18:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 09/31] clk: mediatek: mux: Implement unregister API
Date: Sat, 22 Jan 2022 17:17:09 +0800
Message-Id: <20220122091731.283592-10-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011805_443213_96801A94 
X-CRM114-Status: GOOD (  12.73  )
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

The mux clk type within the MediaTek clk driver library only has a
register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the mux type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 35 ++++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 89f23e111d91..6f0c22a699c3 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -164,6 +164,21 @@ static struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
 	return clk;
 }
 
+static void mtk_clk_unregister_mux(struct clk *clk)
+{
+	struct mtk_clk_mux *mux;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	mux = to_mtk_clk_mux(hw);
+
+	clk_unregister(clk);
+	kfree(mux);
+}
+
 int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   int num, struct device_node *node,
 			   spinlock_t *lock,
@@ -198,4 +213,24 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
 
+void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
+			      struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_mux *mux = &muxes[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_muxes);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 27841d649118..cb2ac4f04c58 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -88,4 +88,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			   spinlock_t *lock,
 			   struct clk_onecell_data *clk_data);
 
+void mtk_clk_unregister_muxes(const struct mtk_mux *muxes, int num,
+			      struct clk_onecell_data *clk_data);
+
 #endif /* __DRV_CLK_MTK_MUX_H */
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
