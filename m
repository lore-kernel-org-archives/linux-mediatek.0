Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBC8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVYq+ZuhS3XaYWFMnaCtacTPHBUfZZHJqfhQh8cd/Yo=; b=PR+hmC2AsyjJiO
	4HNo2VSUOtYrlG9lf5LIJylt2gkjTHqlRVu9eUesuPbvBppZUC3P1HIkuAlZJ5q20tjz2a6f41uu3
	WhZZZRKjVGbjcmvH9I4UPsf2+qSpdrrBDkXtGfE65v1XB4yr5MxxlwC1IXRmE2mEY6yPdGooFPxVA
	llD6BXpolagH+clPBy+TYgnmJ4FSVpvJ8y+cemnCcDHX3FPeW+/ej+qdwZJ6OCpRYY8/5ndCwd168
	qVvY0V1x1RbNoNvRSr67Rqbyjfafc1Ox0AgfjrNFZ8nu6eF5Gn8ogGzGRo2tobajNhCOmoj4vlHd0
	0+fZsUu7Y914Iq3cM7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCY5-00Gs8L-IT; Sat, 22 Jan 2022 09:19:05 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCWx-00GrOf-1u
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:17:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id x37so7095252pfh.8
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtrISZzE0fyOiFLPSAi2/kMw442HF+9pfy36Pe4/Xf0=;
 b=bUHYjg5d8+RE7Oyrz0Th/IjTPVsgQp2fMYyOe5ITkpZpEeY4GipFThT3+0QJ7LNrcu
 34HmkNTRZoTJFGRqdT6ovcQM8cU6kCz2PYRdlNTTNlHzzLxIGWMCQji9Z+O34mxUVtff
 t1A4FVOMxPgLnnUFmmbL/JDBeS/rEneWjbL9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtrISZzE0fyOiFLPSAi2/kMw442HF+9pfy36Pe4/Xf0=;
 b=eAe3h/PFh30HtksLVdhnxz8QEH6gZcHoWPm+4fE/zKTA0g3i6lpuM7ZQDD/gvnU4oU
 hNGQ+QPjMEKMbL5Eclh1iUsrxRC/wATbpWNQ9eUyhydaRWubV64UUZzbDc1FH6gVv1Hl
 LOugTcpr12Y1ZmtWeqfPB4S8UlUvcuOQirRUJlPJmqcS6GdqAb9+MU6Gfj3SZF5WOPRP
 D46fKj3NLweEc4WxLPrHvM7JanLrngJkqxzJi2t9H4mBuOXH9ZiwtwKDtmDsVv38TmSy
 jUTyrn0Z7Gx8PTTIYoHlCNPqW0eGCxZ0Qp4rUSEv2EE00fAScqXhKlmgYcMO3sVApSrS
 gdRg==
X-Gm-Message-State: AOAM530d7VNYrlhNnT0Nwvbx1pA/fYBHMH6iG/BxgMM04zvG52Zmy1W7
 0dpdOP4N2CqEICqg1GTVhKceFA==
X-Google-Smtp-Source: ABdhPJwgCHh5xfiilxhfkgh1LfEmERpWQwhEXhLaMwqsDpTCywBsx/lh+zUVqR5UyUh1HPRGDEAjbw==
X-Received: by 2002:a63:3808:: with SMTP id f8mr5460004pga.186.1642843073546; 
 Sat, 22 Jan 2022 01:17:53 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:17:53 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 04/31] clk: mediatek: gate: Implement unregister API
Date: Sat, 22 Jan 2022 17:17:04 +0800
Message-Id: <20220122091731.283592-5-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011755_127456_45FF0125 
X-CRM114-Status: GOOD (  13.13  )
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

The gate clk type within the MediaTek clk driver library only has a
register function, and no corresponding unregister function. This
means there is no way for its users to properly implement cleanup
and removal.

Add a matching unregister function for the gate type clk.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-gate.c | 35 +++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-gate.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index e51cfd8c653c..ed1ad5535d41 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -193,6 +193,21 @@ static struct clk *mtk_clk_register_gate(const char *name,
 	return clk;
 }
 
+static void mtk_clk_unregister_gate(struct clk *clk)
+{
+	struct mtk_clk_gate *cg;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	cg = to_mtk_clk_gate(hw);
+
+	clk_unregister(clk);
+	kfree(cg);
+}
+
 int mtk_clk_register_gates_with_dev(struct device_node *node,
 				    const struct mtk_gate *clks, int num,
 				    struct clk_onecell_data *clk_data,
@@ -244,4 +259,24 @@ int mtk_clk_register_gates(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
 
+void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
+			      struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_gate *gate = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+			continue;
+
+		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
+		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_gates);
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 3d75521ba20c..344adffb6578 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -55,4 +55,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 				    struct clk_onecell_data *clk_data,
 				    struct device *dev);
 
+void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
+			      struct clk_onecell_data *clk_data);
+
 #endif /* __DRV_CLK_GATE_H */
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
