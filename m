Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E75C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGoUUskrlorpG13wDnJ3zvD/4hRa1Ak2ZgaR6hEF+6I=; b=Hedhq2Wq2Rz9sc
	0nvfz7fO9nQXqtHbFNfcWwP33uwbLLUhj+5tiXlsKKkFMkOO0OLzXDZvicgCZBz6D75fo/FeakaO+
	5SnQiBazw18e/9gvBrPMxHsGLrXZVtMKFRtVXpq6BJ1zgcc5cpsWhh0l8RICD+fj21louSLvENvAt
	P7oVU0LxeCRdwnsOBPgPMIfPN3s5+b38weEq4QQ6t2LYPWuOEd4GRv4awBDCkSFc3hsLjbMoO4439
	IoROVL5hr8GXexQDzaCBbEsWzFIDByllUqQt6c9aNkXc8JCJrTCdOI6a9PFMgxfcdWAefXRlURUI8
	W4n4XZSDokRw1f7EAa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPrk-00DpST-B9; Tue, 08 Feb 2022 12:45:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPnx-00DnOs-Iw
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:11 +0000
Received: by mail-pf1-x429.google.com with SMTP id r19so2894725pfh.6
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xS+neFrZyvEZNRNB9ZEba3UAvEdbGsDMRKP0HcrjcY=;
 b=S07qFfLfXlPlsPEig0kql0KSa3Jwo8SnBQAniFpfSEt9bWaC7EuaBBykud2oDeT8G6
 bWdAShALpo3BV05Wa4VxHyeKeKxQDfw48INJq9ihtQsnkh9uY8EGClLBviYeRIMV/hcK
 c/Wk9uji3P9bOqNUWYUwA/ukYeig7GR8nG0Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xS+neFrZyvEZNRNB9ZEba3UAvEdbGsDMRKP0HcrjcY=;
 b=iPIIxRaGTz8GBvGvQpArvGVqM6oIXv73U3oKjrvcqFNQ4JySbZF95lhLSMOoQ7ufV2
 JZfg7IK0ZupiRAXDPjzgP3N0M6qKWPLDykGyCKhv+hfWurfwOHw3v3W17P5JsbmfMa5e
 TDVJqFllquIN9d+WWaee6/Y/gpniU+if9Uqc8BGtBtzi1Jet+xUDIL/Gg3JaULi92USM
 A9K/BocYr9vNsErNmgHqTi7cMbl7MercxySUhwtFz16pQWD+9tJbFMuVTzWLKbUC6vi6
 m17E52c1UPOUkVtgG/ATAzsAIUhsr5ER1/AvHToAaEFjZ8SCgBG+TsxwXf21ZptfTcTR
 cY2Q==
X-Gm-Message-State: AOAM532FGzNxwPAuRoy5a3oh5T3cmWzKXkNUYW4vCCNlwwsGbuFkwk4r
 izkak1zwfu9ebBjGiWpktU/Hdw==
X-Google-Smtp-Source: ABdhPJyVSydPTJsnGkAvXxmo8hgAw+u0iFkTHDeyOosu8dCP1EYmO/Ag1a/kFhiD/Fw6iflEFWaCjg==
X-Received: by 2002:a63:5144:: with SMTP id r4mr3338517pgl.382.1644324068384; 
 Tue, 08 Feb 2022 04:41:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:08 -0800 (PST)
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
Subject: [PATCH v3 09/31] clk: mediatek: mux: Implement unregister API
Date: Tue,  8 Feb 2022 20:40:12 +0800
Message-Id: <20220208124034.414635-10-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044109_664912_398D95ED 
X-CRM114-Status: GOOD (  13.65  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
