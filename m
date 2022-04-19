Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hz+MfvieIxgbreyyTyPlxQCYtfJ4JrFj7pvv4lrMe0c=; b=FlQS+Yz94kY/74
	SafJPwS7DQwmfDP2g+QVrxcNNfCNf+X6FTAfkO4FhsthOnKX0B9JhP2uMNrIlzk5J8VZsOVvRUwdx
	hCTQ0tcQlEfQaMf29QdmEnLsmgprijdqRNUaEgo+08LgI8vp6bKhCqtIYpySnXtaesV+iKOOu1D34
	y55XgzaW3Y5LH6lbMkKjb7mCsTPY8lhaBBPP25YeTsckjyot15wUkeLP3sKdmaV8mGBqlhUK2vXj4
	V3Z4JNORvT00VF1mRG0mf6g46vNBOq7COwSg2Hkdxc3lQy6JKEg5XCIt8fM6bAAgqaZhamJz4XB43
	JJ+Tq7LH41OB0DLD4NiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngizc-002Duf-9N; Tue, 19 Apr 2022 08:13:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiz5-002Dgl-Q4
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 08:13:24 +0000
Received: by mail-pf1-x42c.google.com with SMTP id j17so7869711pfi.9
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aL1HiuRk5yYFz4xYpqYuYGNrqygVF3ZLXtA2aUqysL4=;
 b=LEXJrHEJYkHQYt3+NUC0A2RYl/pLHmHf8+SR4yudcy7lD64IgbmhmJrEGIl/XlRzy4
 rFiaOBuVKdRUMLaZQ8MqVHwLjmsChzcrM5Fxza/aAWSZTJBU0uwdjPJiieKpuVt3zPQA
 jnvnNF57z7vm+bjvNPtYai0snAFLFOleiWlmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aL1HiuRk5yYFz4xYpqYuYGNrqygVF3ZLXtA2aUqysL4=;
 b=ESimjanjGe3o3VJFpoZVrVl/SWuak1O/WG9Xq5+1pQX3dG1M9fwLXg5YRAmYP4VWzM
 UwlQOzaudWEF7wJ+xPngqVyNne3fOUhlj9nAxAhCCbuGfNbw1fyBpj9MZO34zmfJlwh/
 e7XKix8Bx3n2JJzgbA1OEEdd41ltrx0Gk773Altu21i1Wav7eHQzpUSHJaGVlzvUvvMY
 jPgJYhgB0gAIvMCKqQ6cPrUYNV1qZNSaVewj3mhHuc9FmDiyZe8R1BqaMp90O8+9aA/n
 ukWu2ArZ4QzdpCMB5QOLcziRREiuvijufGnuthZWLXt0LDwyAWvrtyPYLyWlVisguaFa
 N7ig==
X-Gm-Message-State: AOAM532SKsTEh7LPlG0CdHEsRnluTKdlHXG1DK+ZlyfOXoJobtG3M+rg
 ZwJMc/qsNvgenmTTDrWYuK06vQ==
X-Google-Smtp-Source: ABdhPJyIGDt6kZVVNhC1txAP0UdKWo807bFxbSvGZaHWUDQrzAwZFAQAwc4BPI5rullX3UT27dxnFA==
X-Received: by 2002:a63:3841:0:b0:399:26da:29af with SMTP id
 h1-20020a633841000000b0039926da29afmr13364353pgn.489.1650355986330; 
 Tue, 19 Apr 2022 01:13:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:33f6:f1e6:3e21:a253])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a654ccd000000b0039db6f73e9dsm15767448pgt.28.2022.04.19.01.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 01:13:06 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/7] clk: mediatek: Convert mtk_{alloc,
 free}_clk_data to struct clk_hw
Date: Tue, 19 Apr 2022 16:12:42 +0800
Message-Id: <20220419081246.2546159-4-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220419081246.2546159-1-wenst@chromium.org>
References: <20220419081246.2546159-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_011315_961043_CA2F0C67 
X-CRM114-Status: GOOD (  17.35  )
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

As part of the effort to improve the MediaTek clk drivers, the next step
is to switch from the old 'struct clk' clk prodivder APIs to the new
'struct clk_hw' ones.

Instead of adding new APIs to the MediaTek clk driver library mirroring
the existing ones, moving all drivers to the new APIs, and then removing
the old ones, just migrate everything at the same time. This involves
replacing 'struct clk' with 'struct clk_hw', and 'struct clk_onecell_data'
with 'struct clk_hw_onecell_data', and fixing up all usages.

For now, the clk_register() and co. usage is retained, with __clk_get_hw()
and (struct clk_hw *)->clk used to bridge the difference between the APIs.
These will be replaced in subsequent patches.

Fix up mtk_{alloc,free}_clk_data to use 'struct clk_hw' by hand. Fix up
all other affected call sites with coccinelle scripts in the next patch.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 23 ++++++-----------------
 drivers/clk/mediatek/clk-mtk.h |  4 ++--
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 52bacce5dadd..554c6a128460 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -18,40 +18,29 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
-struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
+struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
 {
 	int i;
 	struct clk_onecell_data *clk_data;
 
-	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
+	clk_data = kzalloc(struct_size(clk_data, hws, clk_num), GFP_KERNEL);
 	if (!clk_data)
 		return NULL;
 
-	clk_data->clks = kcalloc(clk_num, sizeof(*clk_data->clks), GFP_KERNEL);
-	if (!clk_data->clks)
-		goto err_out;
-
-	clk_data->clk_num = clk_num;
+	clk_data->num = clk_num;
 
 	for (i = 0; i < clk_num; i++)
-		clk_data->clks[i] = ERR_PTR(-ENOENT);
+		clk_data->hws[i] = ERR_PTR(-ENOENT);
 
 	return clk_data;
-err_out:
-	kfree(clk_data);
-
-	return NULL;
 }
 EXPORT_SYMBOL_GPL(mtk_alloc_clk_data);
 
-void mtk_free_clk_data(struct clk_onecell_data *clk_data)
+void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data)
 {
-	if (!clk_data)
-		return;
-
-	kfree(clk_data->clks);
 	kfree(clk_data);
 }
+EXPORT_SYMBOL_GPL(mtk_free_clk_data);
 
 int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 				struct clk_onecell_data *clk_data)
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 9577084790dc..787fdeb1bd93 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -181,8 +181,8 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_onecell_data *clk_data);
 
-struct clk_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
-void mtk_free_clk_data(struct clk_onecell_data *clk_data);
+struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
+void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data);
 
 struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
-- 
2.36.0.rc0.470.gd361397f0d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
