Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A0CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rMtjZDGQ9xpa8IWrO1lAps3MwTjdM+6MLm5D4zAeE0=; b=uwT2wYcYJEcyR1
	TvFivQQhWvQubeNxRnlo1g0k9nCUFzjT7pwbEIfy+4c0o/T+nUNqfPmuQZ+zdjKHRGG7zodlXfdkT
	f9xonML0FDC7+/dG9gbVjzNmy7Ex7nhhdAwUYoxx/NYJC8OzfQ7TZQtU4ZuXOgUery3Z+UN+dNh6Q
	1SZEfF3KAs6T+kKp+X/Mz5b264SnTWQun9hJF7DfTe5/cJXUOtQzZ5GwT2DYaOKMsEqh5BZimrXfn
	sjC1t6QAvmQxfyluy+jXI20UXdmU4ofG6slS7OsV4jtQkuhMOfBujEU5ySgDidTkeSFp+OUyQ6QVX
	4259S/a51UvodeoXDwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhaP-007dzu-Fw; Thu, 19 May 2022 14:57:09 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgXV-0078jn-AI; Thu, 19 May 2022 13:50:07 +0000
Received: by mail-qk1-x72f.google.com with SMTP id j6so4737417qkp.9;
 Thu, 19 May 2022 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qy/P0mZ00noEySeWC/Vtvod18+b1z4lRDAbgjrxSrfI=;
 b=a5OHjJtkOOGvIu6jZg5QA09ruZ+iHD24h5fVYngt/TjqtTTtS84PiyZlRz3xbOX+eD
 WYaR6T3dx8+SI+vY3m21XylsDLqE1I0gH8Pcmu8+tg/Y2HcWzlCGZIBFV+Pnv2R1G7Yg
 TzcmYw8ckLZEgzeEibAId7f8tdQP3TlAXUV1/8OU629u7HDhspdgFjBfpSxfgcXzgMl7
 WnJ+CrTotBnBDsyW/Ne5SAeFkzmMaSfZiFcE8tigc83LAWw25lST6C/ZblpyJ8en1x10
 Teb65uwJy1pCJlj+0W6WLZDLdTK6DKkwyg0eOWo6dxTwAIOf6NmdTaBw3QcZGJOsIcky
 O9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qy/P0mZ00noEySeWC/Vtvod18+b1z4lRDAbgjrxSrfI=;
 b=5nb1agT6YDT1xKe1jJ35nD1HgmDQBp4tfCrdZccXprtoPjPnAZbZB/5/leJXyMcztL
 vVVsrLhOeX64/adD3gCM1udMrSTw+IIdEFcsP2vOvJYH/woscjRrz0E4mdnR7qAU8flE
 sOW7wzrxCzYYzbvG0IXClQ4agCQVaPbFbeTivA6t5V6/TXMAYdRJPQHJdJEV6SMp/G4F
 JnsnyYDDUdV2Y9glp0LeubdZegukS+QHDg5wUmxCwSpqYmOXeFP/7FO7tPzGjXu80LtV
 yv4eUZJddWcjwZMYTeCKul2YCVCxu7CX81xs9zpepW42+C2+rJ2DXavNRJUkIZ/fkguB
 mm6Q==
X-Gm-Message-State: AOAM532utpksERsOKQmTXcYxOT9HUAI2eB7Kt/29DLjiJZNxOS0Sp9/q
 88bq7QKeeEoVnGopHx7P7xg=
X-Google-Smtp-Source: ABdhPJwtEj+JJRio5QYmwvU2cAJtTQu5mDAibXeOd2Nt2uRks/gnWgo29yFyhbRaE2j2y8DH8STX7w==
X-Received: by 2002:a05:620a:29ce:b0:6a0:2338:2fbe with SMTP id
 s14-20020a05620a29ce00b006a023382fbemr3115971qkp.315.1652968201971; 
 Thu, 19 May 2022 06:50:01 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a3754c3000000b0069fc13ce23dsm1315024qkb.110.2022.05.19.06.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:50:01 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 6/6] clk: mediatek: Add support for other clock types in
 simple probe/remove
Date: Thu, 19 May 2022 17:47:28 +0400
Message-Id: <20220519134728.456643-7-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519134728.456643-1-y.oudjana@protonmail.com>
References: <20220519134728.456643-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_065005_441253_A031300E 
X-CRM114-Status: GOOD (  17.26  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Simple probe/remove functions currently support gates only. Add
PLLs, fixed clocks, fixed factors and muxes to support most
clock controllers. struct mtk_clk_desc now takes descriptions
for all of these clocks, and only the ones set will be registered.
Most clock controllers will only use a subset of the types
supported.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Dependencies:
- clk: mediatek: Move to struct clk_hw provider APIs (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/ 
- Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
- Export required symbols to compile clk drivers as module (single patch)
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/

 drivers/clk/mediatek/clk-mtk.c | 88 +++++++++++++++++++++++++++++-----
 drivers/clk/mediatek/clk-mtk.h | 17 ++++++-
 2 files changed, 92 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3382802663f4..df1209d5b6fb 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -15,8 +15,10 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "clk-mtk.h"
 #include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-mux.h"
+#include "clk-pll.h"
 
 struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
 {
@@ -434,20 +436,55 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	if (!clk_ctrl)
 		return -ENOMEM;
 
-	clk_ctrl->clk_data = mtk_alloc_clk_data(mcd->num_clks);
+	clk_ctrl->clk_data = mtk_alloc_clk_data(mcd->num_plls
+					      + mcd->num_fixed_clks
+					      + mcd->num_factors
+					      + mcd->num_muxes
+					      + mcd->num_gates);
 	if (!clk_ctrl->clk_data) {
 		r = -ENOMEM;
 		goto free_clk_ctrl;
 	}
 
-	r = mtk_clk_register_gates_with_dev(node, mcd->clks, mcd->num_clks,
-					    clk_ctrl->clk_data, &pdev->dev);
-	if (r)
-		goto free_clk_data;
+	if (mcd->plls) {
+		r = mtk_clk_register_plls(node, mcd->plls, mcd->num_plls,
+					  clk_ctrl->clk_data);
+		if (r)
+			goto free_clk_data;
+	}
+
+	if (mcd->fixed_clks) {
+		r = mtk_clk_register_fixed_clks(mcd->fixed_clks, mcd->num_fixed_clks,
+						clk_ctrl->clk_data);
+		if (r)
+			goto unregister_plls;
+	}
+
+	if (mcd->factors) {
+		r = mtk_clk_register_factors(mcd->factors, mcd->num_factors,
+					     clk_ctrl->clk_data);
+		if (r)
+			goto unregister_fixed_clks;
+	}
+
+	if (mcd->muxes) {
+		spin_lock_init(&clk_ctrl->mux_lock);
+		r = mtk_clk_register_muxes(mcd->muxes, mcd->num_muxes, node,
+					   &clk_ctrl->mux_lock, clk_ctrl->clk_data);
+		if (r)
+			goto unregister_factors;
+	}
+
+	if (mcd->gates) {
+		r = mtk_clk_register_gates_with_dev(node, mcd->gates, mcd->num_gates,
+						    clk_ctrl->clk_data, &pdev->dev);
+		if (r)
+			goto unregister_muxes;
+	}
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_ctrl->clk_data);
 	if (r)
-		goto unregister_clks;
+		goto unregister_gates;
 
 	platform_set_drvdata(pdev, clk_ctrl);
 
@@ -457,14 +494,30 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 							       mcd->rst_desc);
 		if (IS_ERR(clk_ctrl->rst_data)) {
 			r = PTR_ERR(clk_ctrl->rst_data);
-			goto unregister_clks;
+			goto unregister_clk_provider;
 		}
 	}
 
 	return r;
 
-unregister_clks:
-	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_ctrl->clk_data);
+unregister_clk_provider:
+	of_clk_del_provider(node);
+unregister_gates:
+	if (mcd->gates)
+		mtk_clk_unregister_gates(mcd->gates, mcd->num_gates, clk_ctrl->clk_data);
+unregister_muxes:
+	if (mcd->muxes)
+		mtk_clk_unregister_muxes(mcd->muxes, mcd->num_muxes, clk_ctrl->clk_data);
+unregister_factors:
+	if (mcd->factors)
+		mtk_clk_unregister_factors(mcd->factors, mcd->num_factors, clk_ctrl->clk_data);
+unregister_fixed_clks:
+	if (mcd->fixed_clks)
+		mtk_clk_unregister_fixed_clks(mcd->fixed_clks, mcd->num_fixed_clks,
+					      clk_ctrl->clk_data);
+unregister_plls:
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_ctrl->clk_data);
 free_clk_data:
 	mtk_free_clk_data(clk_ctrl->clk_data);
 free_clk_ctrl:
@@ -480,9 +533,22 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	of_clk_del_provider(node);
+
 	if (clk_ctrl->rst_data)
 		mtk_unregister_reset_controller(clk_ctrl->rst_data);
-	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_ctrl->clk_data);
+
+	if (mcd->gates)
+		mtk_clk_unregister_gates(mcd->gates, mcd->num_gates, clk_ctrl->clk_data);
+	if (mcd->muxes)
+		mtk_clk_unregister_muxes(mcd->muxes, mcd->num_muxes, clk_ctrl->clk_data);
+	if (mcd->factors)
+		mtk_clk_unregister_factors(mcd->factors, mcd->num_factors, clk_ctrl->clk_data);
+	if (mcd->fixed_clks)
+		mtk_clk_unregister_fixed_clks(mcd->fixed_clks, mcd->num_fixed_clks,
+					      clk_ctrl->clk_data);
+	if (mcd->plls)
+		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_ctrl->clk_data);
+
 	mtk_free_clk_data(clk_ctrl->clk_data);
 	kfree(clk_ctrl);
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index fa092bca97c8..23bce98bca20 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -13,6 +13,9 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "clk-gate.h"
+#include "clk-mux.h"
+#include "clk-pll.h"
 #include "reset.h"
 
 #define MAX_MUX_GATE_BIT	31
@@ -191,12 +194,22 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
 
 struct mtk_simple_clk_controller {
 	struct clk_hw_onecell_data *clk_data;
+	spinlock_t mux_lock;
 	struct mtk_clk_rst_data *rst_data;
 };
 
 struct mtk_clk_desc {
-	const struct mtk_gate *clks;
-	size_t num_clks;
+	const struct mtk_pll_data *plls;
+	size_t num_plls;
+	const struct mtk_fixed_clk *fixed_clks;
+	size_t num_fixed_clks;
+	const struct mtk_fixed_factor *factors;
+	size_t num_factors;
+	const struct mtk_mux *muxes;
+	size_t num_muxes;
+	const struct mtk_gate *gates;
+	size_t num_gates;
+
 	const struct mtk_clk_rst_desc *rst_desc;
 };
 
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
